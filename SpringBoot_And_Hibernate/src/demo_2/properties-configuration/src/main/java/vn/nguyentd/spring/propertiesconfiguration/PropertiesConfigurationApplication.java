package vn.nguyentd.spring.propertiesconfiguration;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class PropertiesConfigurationApplication {
    @Value("${khoahoc.ten}")
    private String ten;
    @Value("${khoahoc.hocsinh}")
    private String hocsinh;
    @Value("${khoahoc.website}")
    private String website;

    public static void main(String[] args) {
        SpringApplication.run(PropertiesConfigurationApplication.class, args);
    }

    @GetMapping("/")
    public String index() {
        return "Nguyên, Xin Chào!";
    }

    @GetMapping("/info")
    public String info() {
        return "Tên: " + ten + "<br/>" +
                "Học Sinh: " + hocsinh + "<br/>" +
                "Website: " + website;
    }
}
