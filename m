Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FDA2D5B37
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:06:58 +0100 (CET)
Received: from localhost ([::1]:55910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knLer-0005tP-UY
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:06:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1knLQ6-0001eX-8Y; Thu, 10 Dec 2020 07:51:42 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:3856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1knLQ2-0001TD-Kr; Thu, 10 Dec 2020 07:51:41 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BACWfDX154770; Thu, 10 Dec 2020 07:51:25 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35bkqx0hew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 07:51:24 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BACaeA7173241;
 Thu, 10 Dec 2020 07:51:24 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35bkqx0he4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 07:51:24 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BACYvls029141;
 Thu, 10 Dec 2020 12:51:21 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3581fhk0fr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 12:51:21 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BACpJlv33423816
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 12:51:19 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 281B0A404D;
 Thu, 10 Dec 2020 12:51:19 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD528A405B;
 Thu, 10 Dec 2020 12:51:18 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 10 Dec 2020 12:51:18 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-158-23.de.ibm.com [9.145.158.23])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id CFA03220188;
 Thu, 10 Dec 2020 13:51:17 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/5] hw/misc: add an EMC141{3,4} device model
Date: Thu, 10 Dec 2020 13:51:11 +0100
Message-Id: <20201210125115.1812083-2-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201210125115.1812083-1-clg@kaod.org>
References: <20201210125115.1812083-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-10_05:2020-12-09,
 2020-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 adultscore=0 clxscore=1034 impostorscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012100080
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 John Wang <wangzhiqiang.bj@bytedance.com>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Wang <wangzhiqiang.bj@bytedance.com>

Largely inspired by the TMP421 temperature sensor, here is a model for
the EMC1413/EMC1414 temperature sensors.

Specs can be found here :
  http://ww1.microchip.com/downloads/en/DeviceDoc/20005274A.pdf

Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20201122105134.671-1-wangzhiqiang.bj@bytedance.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/misc/emc141x_regs.h |  37 ++++
 hw/misc/emc141x.c              | 326 +++++++++++++++++++++++++++++++++
 tests/qtest/emc141x-test.c     |  81 ++++++++
 hw/arm/Kconfig                 |   1 +
 hw/misc/Kconfig                |   4 +
 hw/misc/meson.build            |   1 +
 tests/qtest/meson.build        |   1 +
 7 files changed, 451 insertions(+)
 create mode 100644 include/hw/misc/emc141x_regs.h
 create mode 100644 hw/misc/emc141x.c
 create mode 100644 tests/qtest/emc141x-test.c

diff --git a/include/hw/misc/emc141x_regs.h b/include/hw/misc/emc141x_reg=
s.h
new file mode 100644
index 000000000000..0560fb7c5c1e
--- /dev/null
+++ b/include/hw/misc/emc141x_regs.h
@@ -0,0 +1,37 @@
+/*
+ * SMSC EMC141X temperature sensor.
+ *
+ * Browse the data sheet:
+ *
+ *    http://ww1.microchip.com/downloads/en/DeviceDoc/20005274A.pdf
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later. See the COPYING file in the top-level directory.
+ */
+
+#ifndef TMP105_REGS_H
+#define TMP105_REGS_H
+
+#define EMC1413_DEVICE_ID                0x21
+#define EMC1414_DEVICE_ID                0x25
+#define MANUFACTURER_ID                  0x5d
+#define REVISION                         0x04
+
+/* the EMC141X registers */
+#define EMC141X_TEMP_HIGH0               0x00
+#define EMC141X_TEMP_HIGH1               0x01
+#define EMC141X_TEMP_HIGH2               0x23
+#define EMC141X_TEMP_HIGH3               0x2a
+#define EMC141X_TEMP_MAX_HIGH0           0x05
+#define EMC141X_TEMP_MIN_HIGH0           0x06
+#define EMC141X_TEMP_MAX_HIGH1           0x07
+#define EMC141X_TEMP_MIN_HIGH1           0x08
+#define EMC141X_TEMP_MAX_HIGH2           0x15
+#define EMC141X_TEMP_MIN_HIGH2           0x16
+#define EMC141X_TEMP_MAX_HIGH3           0x2c
+#define EMC141X_TEMP_MIN_HIGH3           0x2d
+#define EMC141X_DEVICE_ID                0xfd
+#define EMC141X_MANUFACTURER_ID          0xfe
+#define EMC141X_REVISION                 0xff
+
+#endif
diff --git a/hw/misc/emc141x.c b/hw/misc/emc141x.c
new file mode 100644
index 000000000000..f7c53d48a421
--- /dev/null
+++ b/hw/misc/emc141x.c
@@ -0,0 +1,326 @@
+/*
+ * SMSC EMC141X temperature sensor.
+ *
+ * Copyright (c) 2020 Bytedance Corporation
+ * Written by John Wang <wangzhiqiang.bj@bytedance.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 or
+ * (at your option) version 3 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License alo=
ng
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/i2c/i2c.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qemu/module.h"
+#include "qom/object.h"
+#include "hw/misc/emc141x_regs.h"
+
+#define SENSORS_COUNT_MAX    4
+
+struct EMC141XState {
+    I2CSlave parent_obj;
+    struct {
+        uint8_t raw_temp_min;
+        uint8_t raw_temp_current;
+        uint8_t raw_temp_max;
+    } sensor[SENSORS_COUNT_MAX];
+    uint8_t len;
+    uint8_t data;
+    uint8_t pointer;
+};
+
+struct EMC141XClass {
+    I2CSlaveClass parent_class;
+    uint8_t model;
+    unsigned sensors_count;
+};
+
+#define TYPE_EMC141X "emc141x"
+OBJECT_DECLARE_TYPE(EMC141XState, EMC141XClass, EMC141X)
+
+static void emc141x_get_temperature(Object *obj, Visitor *v, const char =
*name,
+                                    void *opaque, Error **errp)
+{
+    EMC141XState *s =3D EMC141X(obj);
+    EMC141XClass *sc =3D EMC141X_GET_CLASS(s);
+    int64_t value;
+    unsigned tempid;
+
+    if (sscanf(name, "temperature%u", &tempid) !=3D 1) {
+        error_setg(errp, "error reading %s: %s", name, g_strerror(errno)=
);
+        return;
+    }
+
+    if (tempid >=3D sc->sensors_count) {
+        error_setg(errp, "error reading %s", name);
+        return;
+    }
+
+    value =3D s->sensor[tempid].raw_temp_current * 1000;
+
+    visit_type_int(v, name, &value, errp);
+}
+
+static void emc141x_set_temperature(Object *obj, Visitor *v, const char =
*name,
+                                    void *opaque, Error **errp)
+{
+    EMC141XState *s =3D EMC141X(obj);
+    EMC141XClass *sc =3D EMC141X_GET_CLASS(s);
+    int64_t temp;
+    unsigned tempid;
+
+    if (!visit_type_int(v, name, &temp, errp)) {
+        return;
+    }
+
+    if (sscanf(name, "temperature%u", &tempid) !=3D 1) {
+        error_setg(errp, "error reading %s: %s", name, g_strerror(errno)=
);
+        return;
+    }
+
+    if (tempid >=3D sc->sensors_count) {
+        error_setg(errp, "error reading %s", name);
+        return;
+    }
+
+    s->sensor[tempid].raw_temp_current =3D temp / 1000;
+}
+
+static void emc141x_read(EMC141XState *s)
+{
+    EMC141XClass *sc =3D EMC141X_GET_CLASS(s);
+    switch (s->pointer) {
+    case EMC141X_DEVICE_ID:
+        s->data =3D sc->model;
+        break;
+    case EMC141X_MANUFACTURER_ID:
+        s->data =3D MANUFACTURER_ID;
+        break;
+    case EMC141X_REVISION:
+        s->data =3D REVISION;
+        break;
+    case EMC141X_TEMP_HIGH0:
+        s->data =3D s->sensor[0].raw_temp_current;
+        break;
+    case EMC141X_TEMP_HIGH1:
+        s->data =3D s->sensor[1].raw_temp_current;
+        break;
+    case EMC141X_TEMP_HIGH2:
+        s->data =3D s->sensor[2].raw_temp_current;
+        break;
+    case EMC141X_TEMP_HIGH3:
+        s->data =3D s->sensor[3].raw_temp_current;
+        break;
+    case EMC141X_TEMP_MAX_HIGH0:
+        s->data =3D s->sensor[0].raw_temp_max;
+        break;
+    case EMC141X_TEMP_MAX_HIGH1:
+        s->data =3D s->sensor[1].raw_temp_max;
+        break;
+    case EMC141X_TEMP_MAX_HIGH2:
+        s->data =3D s->sensor[2].raw_temp_max;
+        break;
+    case EMC141X_TEMP_MAX_HIGH3:
+        s->data =3D s->sensor[3].raw_temp_max;
+        break;
+    case EMC141X_TEMP_MIN_HIGH0:
+        s->data =3D s->sensor[0].raw_temp_min;
+        break;
+    case EMC141X_TEMP_MIN_HIGH1:
+        s->data =3D s->sensor[1].raw_temp_min;
+        break;
+    case EMC141X_TEMP_MIN_HIGH2:
+        s->data =3D s->sensor[2].raw_temp_min;
+        break;
+    case EMC141X_TEMP_MIN_HIGH3:
+        s->data =3D s->sensor[3].raw_temp_min;
+        break;
+    default:
+        s->data =3D 0;
+    }
+}
+
+static void emc141x_write(EMC141XState *s)
+{
+    switch (s->pointer) {
+    case EMC141X_TEMP_MAX_HIGH0:
+        s->sensor[0].raw_temp_max =3D s->data;
+        break;
+    case EMC141X_TEMP_MAX_HIGH1:
+        s->sensor[1].raw_temp_max =3D s->data;
+        break;
+    case EMC141X_TEMP_MAX_HIGH2:
+        s->sensor[2].raw_temp_max =3D s->data;
+        break;
+    case EMC141X_TEMP_MAX_HIGH3:
+        s->sensor[3].raw_temp_max =3D s->data;
+        break;
+    case EMC141X_TEMP_MIN_HIGH0:
+        s->sensor[0].raw_temp_min =3D s->data;
+        break;
+    case EMC141X_TEMP_MIN_HIGH1:
+        s->sensor[1].raw_temp_min =3D s->data;
+        break;
+    case EMC141X_TEMP_MIN_HIGH2:
+        s->sensor[2].raw_temp_min =3D s->data;
+        break;
+    case EMC141X_TEMP_MIN_HIGH3:
+        s->sensor[3].raw_temp_min =3D s->data;
+        break;
+    default:
+        s->data =3D 0;
+    }
+}
+
+static uint8_t emc141x_rx(I2CSlave *i2c)
+{
+    EMC141XState *s =3D EMC141X(i2c);
+
+    if (s->len =3D=3D 0) {
+        s->len++;
+        return s->data;
+    } else {
+        return 0xff;
+    }
+}
+
+static int emc141x_tx(I2CSlave *i2c, uint8_t data)
+{
+    EMC141XState *s =3D EMC141X(i2c);
+
+    if (s->len =3D=3D 0) {
+        /* first byte is the reg pointer */
+        s->pointer =3D data;
+        s->len++;
+    } else if (s->len =3D=3D 1) {
+        s->data =3D data;
+        emc141x_write(s);
+    }
+
+    return 0;
+}
+
+static int emc141x_event(I2CSlave *i2c, enum i2c_event event)
+{
+    EMC141XState *s =3D EMC141X(i2c);
+
+    if (event =3D=3D I2C_START_RECV) {
+        emc141x_read(s);
+    }
+
+    s->len =3D 0;
+    return 0;
+}
+
+static const VMStateDescription vmstate_emc141x =3D {
+    .name =3D "EMC141X",
+    .version_id =3D 0,
+    .minimum_version_id =3D 0,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT8(len, EMC141XState),
+        VMSTATE_UINT8(data, EMC141XState),
+        VMSTATE_UINT8(pointer, EMC141XState),
+        VMSTATE_I2C_SLAVE(parent_obj, EMC141XState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void emc141x_reset(DeviceState *dev)
+{
+    EMC141XState *s =3D EMC141X(dev);
+    int i;
+
+    for (i =3D 0; i < SENSORS_COUNT_MAX; i++) {
+        s->sensor[i].raw_temp_max =3D 0x55;
+    }
+    s->pointer =3D 0;
+    s->len =3D 0;
+}
+
+static void emc141x_initfn(Object *obj)
+{
+    object_property_add(obj, "temperature0", "int",
+                        emc141x_get_temperature,
+                        emc141x_set_temperature, NULL, NULL);
+    object_property_add(obj, "temperature1", "int",
+                        emc141x_get_temperature,
+                        emc141x_set_temperature, NULL, NULL);
+    object_property_add(obj, "temperature2", "int",
+                        emc141x_get_temperature,
+                        emc141x_set_temperature, NULL, NULL);
+    object_property_add(obj, "temperature3", "int",
+                        emc141x_get_temperature,
+                        emc141x_set_temperature, NULL, NULL);
+}
+
+static void emc141x_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);
+
+    dc->reset =3D emc141x_reset;
+    k->event =3D emc141x_event;
+    k->recv =3D emc141x_rx;
+    k->send =3D emc141x_tx;
+    dc->vmsd =3D &vmstate_emc141x;
+}
+
+static void emc1413_class_init(ObjectClass *klass, void *data)
+{
+    EMC141XClass *ec =3D EMC141X_CLASS(klass);
+
+    emc141x_class_init(klass, data);
+    ec->model =3D EMC1413_DEVICE_ID;
+    ec->sensors_count =3D 3;
+}
+
+static void emc1414_class_init(ObjectClass *klass, void *data)
+{
+    EMC141XClass *ec =3D EMC141X_CLASS(klass);
+
+    emc141x_class_init(klass, data);
+    ec->model =3D EMC1414_DEVICE_ID;
+    ec->sensors_count =3D 4;
+}
+
+static const TypeInfo emc141x_info =3D {
+    .name          =3D TYPE_EMC141X,
+    .parent        =3D TYPE_I2C_SLAVE,
+    .instance_size =3D sizeof(EMC141XState),
+    .class_size    =3D sizeof(EMC141XClass),
+    .instance_init =3D emc141x_initfn,
+    .abstract      =3D true,
+};
+
+static const TypeInfo emc1413_info =3D {
+    .name          =3D "emc1413",
+    .parent        =3D TYPE_EMC141X,
+    .class_init    =3D emc1413_class_init,
+};
+
+static const TypeInfo emc1414_info =3D {
+    .name          =3D "emc1414",
+    .parent        =3D TYPE_EMC141X,
+    .class_init    =3D emc1414_class_init,
+};
+
+static void emc141x_register_types(void)
+{
+    type_register_static(&emc141x_info);
+    type_register_static(&emc1413_info);
+    type_register_static(&emc1414_info);
+}
+
+type_init(emc141x_register_types)
diff --git a/tests/qtest/emc141x-test.c b/tests/qtest/emc141x-test.c
new file mode 100644
index 000000000000..714058806a71
--- /dev/null
+++ b/tests/qtest/emc141x-test.c
@@ -0,0 +1,81 @@
+/*
+ * QTest testcase for the EMC141X temperature sensor
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "libqtest-single.h"
+#include "libqos/qgraph.h"
+#include "libqos/i2c.h"
+#include "qapi/qmp/qdict.h"
+#include "hw/misc/emc141x_regs.h"
+
+#define EMC1414_TEST_ID   "emc1414-test"
+
+static int qmp_emc1414_get_temperature(const char *id)
+{
+    QDict *response;
+    int ret;
+
+    response =3D qmp("{ 'execute': 'qom-get', 'arguments': { 'path': %s,=
 "
+                   "'property': 'temperature0' } }", id);
+    g_assert(qdict_haskey(response, "return"));
+    ret =3D qdict_get_int(response, "return");
+    qobject_unref(response);
+    return ret;
+}
+
+static void qmp_emc1414_set_temperature(const char *id, int value)
+{
+    QDict *response;
+
+    response =3D qmp("{ 'execute': 'qom-set', 'arguments': { 'path': %s,=
 "
+                   "'property': 'temperature0', 'value': %d } }", id, va=
lue);
+    g_assert(qdict_haskey(response, "return"));
+    qobject_unref(response);
+}
+
+static void send_and_receive(void *obj, void *data, QGuestAllocator *all=
oc)
+{
+    uint16_t value;
+    QI2CDevice *i2cdev =3D (QI2CDevice *)obj;
+
+    value =3D qmp_emc1414_get_temperature(EMC1414_TEST_ID);
+    g_assert_cmpuint(value, =3D=3D, 0);
+
+    value =3D i2c_get8(i2cdev, EMC141X_TEMP_HIGH0);
+    g_assert_cmphex(value, =3D=3D, 0);
+
+    /* The default max value is 85C, 0x55=3D85 */
+    value =3D i2c_get8(i2cdev, EMC141X_TEMP_MAX_HIGH0);
+    g_assert_cmphex(value, =3D=3D, 0x55);
+
+    value =3D i2c_get8(i2cdev, EMC141X_TEMP_MIN_HIGH0);
+    g_assert_cmphex(value, =3D=3D, 0);
+
+    /* 3000mc =3D 30C */
+    qmp_emc1414_set_temperature(EMC1414_TEST_ID, 30000);
+    value =3D qmp_emc1414_get_temperature(EMC1414_TEST_ID);
+    g_assert_cmpuint(value, =3D=3D, 30000);
+
+    value =3D i2c_get8(i2cdev, EMC141X_TEMP_HIGH0);
+    g_assert_cmphex(value, =3D=3D, 30);
+
+}
+
+static void emc1414_register_nodes(void)
+{
+    QOSGraphEdgeOptions opts =3D {
+        .extra_device_opts =3D "id=3D" EMC1414_TEST_ID ",address=3D0x70"
+    };
+    add_qi2c_address(&opts, &(QI2CAddress) { 0x70 });
+
+    qos_node_create_driver("emc1414", i2c_device_create);
+    qos_node_consumes("emc1414", "i2c-bus", &opts);
+
+    qos_add_test("tx-rx", "emc1414", send_and_receive, NULL);
+}
+libqos_init(emc1414_register_nodes);
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index e69a9009cf0a..eb8a8844cf86 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -407,6 +407,7 @@ config ASPEED_SOC
     select SSI_M25P80
     select TMP105
     select TMP421
+    select EMC141X
     select UNIMP
     select LED
=20
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index dc44dc14f625..cf18ac08e666 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -13,6 +13,10 @@ config TMP421
     bool
     depends on I2C
=20
+config EMC141X
+    bool
+    depends on I2C
+
 config ISA_DEBUG
     bool
     depends on ISA_BUS
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 1cd48e8a0fb5..ce15ffceb958 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -9,6 +9,7 @@ softmmu_ss.add(when: 'CONFIG_PCI_TESTDEV', if_true: files=
('pci-testdev.c'))
 softmmu_ss.add(when: 'CONFIG_SGA', if_true: files('sga.c'))
 softmmu_ss.add(when: 'CONFIG_TMP105', if_true: files('tmp105.c'))
 softmmu_ss.add(when: 'CONFIG_TMP421', if_true: files('tmp421.c'))
+softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
 softmmu_ss.add(when: 'CONFIG_UNIMP', if_true: files('unimp.c'))
 softmmu_ss.add(when: 'CONFIG_EMPTY_SLOT', if_true: files('empty_slot.c')=
)
 softmmu_ss.add(when: 'CONFIG_LED', if_true: files('led.c'))
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c19f1c85034f..d776befd6ee2 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -188,6 +188,7 @@ qos_test_ss.add(
   'sdhci-test.c',
   'spapr-phb-test.c',
   'tmp105-test.c',
+  'emc141x-test.c',
   'usb-hcd-ohci-test.c',
   'virtio-test.c',
   'virtio-blk-test.c',
--=20
2.26.2


