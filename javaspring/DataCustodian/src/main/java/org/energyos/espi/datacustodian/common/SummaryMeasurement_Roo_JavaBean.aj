/*******************************************************************************
 * Copyright (c) 2011, 2012 EnergyOS.Org
 *
 * Licensed by EnergyOS.Org under one or more contributor license agreements.
 * See the NOTICE file distributed with this work for additional information
 * regarding copyright ownership.  The EnergyOS.org licenses this file
 * to you under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License.  You may obtain a copy
 * of the License at:
 *  
 *   http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing,
 *  software distributed under the License is distributed on an
 *  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *  KIND, either express or implied.  See the License for the
 *  specific language governing permissions and limitations
 *  under the License.
 *  
 ******************************************************************************
*/

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.energyos.espi.datacustodian.common;

import org.energyos.espi.datacustodian.common.SummaryMeasurement;
import org.energyos.espi.datacustodian.common.UnitMultiplier;
import org.energyos.espi.datacustodian.common.UnitSymbol;

privileged aspect SummaryMeasurement_Roo_JavaBean {
    
    public UnitMultiplier SummaryMeasurement.getPowerOfTenMultiplier() {
        return this.powerOfTenMultiplier;
    }
    
    public void SummaryMeasurement.setPowerOfTenMultiplier(UnitMultiplier powerOfTenMultiplier) {
        this.powerOfTenMultiplier = powerOfTenMultiplier;
    }
    
    public Long SummaryMeasurement.getTimeStamp() {
        return this.timeStamp;
    }
    
    public void SummaryMeasurement.setTimeStamp(Long timeStamp) {
        this.timeStamp = timeStamp;
    }
    
    public UnitSymbol SummaryMeasurement.getUom() {
        return this.uom;
    }
    
    public void SummaryMeasurement.setUom(UnitSymbol uom) {
        this.uom = uom;
    }
    
    public Long SummaryMeasurement.getSummaryMeasurementValue() {
        return this.summaryMeasurementValue;
    }
    
    public void SummaryMeasurement.setSummaryMeasurementValue(Long summaryMeasurementValue) {
        this.summaryMeasurementValue = summaryMeasurementValue;
    }
    
}
