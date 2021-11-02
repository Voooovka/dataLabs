package ua.lviv.iot.controller.impl;

import ua.lviv.iot.model.Reporter;
import ua.lviv.iot.service.impl.ReporterServiceImpl;

public class StudentControllerImpl extends AbstractControllerImpl<Reporter, String> {
    public StudentControllerImpl() {
        super(new ReporterServiceImpl());
    }
}
