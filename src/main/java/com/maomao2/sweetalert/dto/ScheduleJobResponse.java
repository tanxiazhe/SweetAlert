package com.maomao2.sweetalert.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.Date;

public class ScheduleJobResponse {

  @JsonInclude(JsonInclude.Include.NON_NULL)
  private boolean status;
  private String jobName;
  private String jobGroup;
  private String triggerDescription;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
  private Date prevFireTime;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
  private Date nextFireTime;
  private String message;

  public ScheduleJobResponse(boolean status, String jobId, String jobGroup, String message) {
    this.status = status;
    this.jobName = jobId;
    this.jobGroup = jobGroup;
    this.message = message;
  }

  public ScheduleJobResponse(String jobName, String jobGroup, String triggerDescription,
      Date prevFireTime, Date nextFireTime) {
    this.jobName = jobName;
    this.jobGroup = jobGroup;
    this.triggerDescription = triggerDescription;
    this.prevFireTime = prevFireTime;
    this.nextFireTime = nextFireTime;
  }

  public boolean isStatus() {
    return status;
  }

  public void setStatus(boolean status) {
    this.status = status;
  }

  public String getJobName() {
    return jobName;
  }

  public void setJobName(String jobName) {
    this.jobName = jobName;
  }

  public String getJobGroup() {
    return jobGroup;
  }

  public void setJobGroup(String jobGroup) {
    this.jobGroup = jobGroup;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }
}
