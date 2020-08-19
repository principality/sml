package me.smartbde.sml.springtest.controller

import me.smartbde.sml.springtest.domain.model.Message
import org.springframework.web.bind.annotation.{RequestMapping, RequestMethod, ResponseBody, RestController}

@RestController
@RequestMapping(Array("/api"))
class Hello2Controller {
  @RequestMapping(value = Array("/hello2"), method = Array(RequestMethod.GET))
  @ResponseBody
  def hello(): Message = {
    val message = new Message()
    message.setValue("Hello, Scala for Spring!")
    message
  }
}