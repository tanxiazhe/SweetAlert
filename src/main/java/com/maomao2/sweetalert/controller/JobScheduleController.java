package com.maomao2.sweetalert.controller;

import com.maomao2.sweetalert.dto.ScheduleJobResponse;
import com.maomao2.sweetalert.service.ScheduleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/ScheduleJobs")
public class JobScheduleController {

  private final Logger logger = LoggerFactory.getLogger(this.getClass());

  @Autowired
  private ScheduleService scheduleService;

  @PostMapping("/schedule")
  public ResponseEntity<ScheduleJobResponse> schedule(@RequestParam String jobName,
      @RequestParam String jobGroup, @RequestParam String cronExp) {
    logger.info("Prepare to schedule job");
    ScheduleJobResponse response = scheduleService.scheduleJob(jobName, jobGroup, cronExp);
    return ResponseEntity.ok(response);
  }

  @PostMapping("/ubSchedule")
  public ResponseEntity<ScheduleJobResponse> ubSchedule(@RequestParam String jobName,
      @RequestParam String jobGroup) {
    logger.info("Prepare to ubSchedule job");
    ScheduleJobResponse response = scheduleService.unScheduleJob(jobName, jobGroup);
    return getScheduleJobResponseResponseEntity(response);
  }

  @PostMapping("/interrupt")
  public ResponseEntity<ScheduleJobResponse> interrupt(@RequestParam String jobName,
      @RequestParam String jobGroup) {
    logger.info("Prepare to interrupt job");
    ScheduleJobResponse response = scheduleService.interruptJob(jobName, jobGroup);
    return getScheduleJobResponseResponseEntity(response);
  }

  @PostMapping("/resume")
  public ResponseEntity<ScheduleJobResponse> resume(@RequestParam String jobName,
      @RequestParam String jobGroup) {
    logger.info("Prepare to resume job");
    ScheduleJobResponse response = scheduleService.resumeJob(jobName, jobGroup);
    return getScheduleJobResponseResponseEntity(response);
  }

  @PostMapping("/pause")
  public ResponseEntity<ScheduleJobResponse> pause(@RequestParam String jobName,
      @RequestParam String jobGroup) {
    logger.info("Prepare to pause job");
    ScheduleJobResponse response = scheduleService.pauseJob(jobName, jobGroup);
    return getScheduleJobResponseResponseEntity(response);
  }

  @DeleteMapping("/delete")
  public ResponseEntity<ScheduleJobResponse> delete(@RequestParam String jobName,
      @RequestParam String jobGroup) {
    logger.info("Prepare to delete job");
    ScheduleJobResponse response = scheduleService.deleteJob(jobName, jobGroup);
    return getScheduleJobResponseResponseEntity(response);
  }

  @GetMapping("/list")
  public ResponseEntity<List<ScheduleJobResponse>> getJobList() {
    logger.info("Prepare to get job");
    List<ScheduleJobResponse> responses = scheduleService.getJobList();
    return ResponseEntity.ok(responses);
  }

  private ResponseEntity<ScheduleJobResponse> getScheduleJobResponseResponseEntity(
      ScheduleJobResponse response) {
    if (response.isStatus()) {
      return ResponseEntity.ok(response);
    } else {
      return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
    }
  }
}
