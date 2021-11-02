package ua.lviv.iot.controller.impl;

import ua.lviv.iot.model.RescueVehicle;
import ua.lviv.iot.service.impl.RescueVehicleServiceImpl;

public class StudentGroupControllerImpl extends AbstractControllerImpl<RescueVehicle, String> {
    public StudentGroupControllerImpl() {
        super(new RescueVehicleServiceImpl());
    }
}
