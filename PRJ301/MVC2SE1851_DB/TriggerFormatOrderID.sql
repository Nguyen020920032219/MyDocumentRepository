USE [master]
GO

/****** Object:  Trigger [dbo].[FormatIDTrigger]    Script Date: 3/12/2024 9:11:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create trigger [dbo].[FormatIDTrigger]
on [dbo].[Order]
instead of insert
as
begin
declare @NewID varchar(5)
set @NewID='HD' + FORMAT(next value for ID_sequence, '000')

INSERT INTO [dbo].[Order] (id, [date], address, total)
Select @NewID, [date], [address], total from inserted
end
GO

ALTER TABLE [dbo].[Order] ENABLE TRIGGER [FormatIDTrigger]
GO


