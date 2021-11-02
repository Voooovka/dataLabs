package ua.lviv.iot.controller.impl;

import ua.lviv.iot.model.Hospital;
import ua.lviv.iot.service.impl.HospitalServiceImpl;

public class ResponseControllerImpl extends AbstractControllerImpl<Hospital, Integer> {
    public ResponseControllerImpl() {
        super(new HospitalServiceImpl());
    }
}
