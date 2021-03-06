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

package org.energyos.espi.thirdparty.common;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.energyos.espi.thirdparty.common._DataCustodian;
import org.energyos.espi.thirdparty.common._DataCustodianDataOnDemand;
import org.springframework.stereotype.Component;

privileged aspect _DataCustodianDataOnDemand_Roo_DataOnDemand {
    
    declare @type: _DataCustodianDataOnDemand: @Component;
    
    private Random _DataCustodianDataOnDemand.rnd = new SecureRandom();
    
    private List<_DataCustodian> _DataCustodianDataOnDemand.data;
    
    public _DataCustodian _DataCustodianDataOnDemand.getNewTransient_DataCustodian(int index) {
        _DataCustodian obj = new _DataCustodian();
        setDataCustodianID(obj, index);
        return obj;
    }
    
    public void _DataCustodianDataOnDemand.setDataCustodianID(_DataCustodian obj, int index) {
        String dataCustodianID = "dataCustodianID_" + index;
        obj.setDataCustodianID(dataCustodianID);
    }
    
    public _DataCustodian _DataCustodianDataOnDemand.getSpecific_DataCustodian(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        _DataCustodian obj = data.get(index);
        Long id = obj.getId();
        return _DataCustodian.find_DataCustodian(id);
    }
    
    public _DataCustodian _DataCustodianDataOnDemand.getRandom_DataCustodian() {
        init();
        _DataCustodian obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return _DataCustodian.find_DataCustodian(id);
    }
    
    public boolean _DataCustodianDataOnDemand.modify_DataCustodian(_DataCustodian obj) {
        return false;
    }
    
    public void _DataCustodianDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = _DataCustodian.find_DataCustodianEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for '_DataCustodian' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<_DataCustodian>();
        for (int i = 0; i < 10; i++) {
            _DataCustodian obj = getNewTransient_DataCustodian(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
