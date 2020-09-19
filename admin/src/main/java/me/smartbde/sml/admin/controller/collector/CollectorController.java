package me.smartbde.sml.admin.controller.collector;

import me.smartbde.sml.admin.domain.model.Component;
import me.smartbde.sml.admin.domain.model.Endpoint;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/collector")
public class CollectorController {
    @RequestMapping("/index")
    public String getIndex(Model model) {
        List endpoints = new ArrayList<Endpoint>();
        Endpoint endpoint = new Endpoint();
        endpoint.setProtocol("jetty:http");
        endpoint.setHost("127.0.0.1");
        endpoint.setPort("18000");
        endpoints.add(endpoint);
        model.addAttribute("endpoints", endpoints);
        return "collector/index";
    }
}
