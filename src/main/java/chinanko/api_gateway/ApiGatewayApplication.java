package chinanko.api_gateway; // Ojo con tu paquete

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient; // Importar

@SpringBootApplication
@EnableDiscoveryClient // <--- Pon esto para que Eureka lo vea
public class ApiGatewayApplication {

	public static void main(String[] args) {
		SpringApplication.run(ApiGatewayApplication.class, args);
	}

}