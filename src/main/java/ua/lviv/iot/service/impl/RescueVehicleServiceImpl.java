package ua.lviv.iot.service.impl;

import ua.lviv.iot.dao.impl.StudentGroupDaoImpl;
import ua.lviv.iot.model.RescueVehicle;

public class RescueVehicleServiceImpl extends AbstractServiceImpl<RescueVehicle, String> {
    public RescueVehicleServiceImpl() {
        super(new StudentGroupDaoImpl());
    }
}
