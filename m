Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5C3FE236
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 17:04:31 +0100 (CET)
Received: from localhost ([::1]:41204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVe5F-0005oT-PC
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 11:04:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47206)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iVdwz-0005KM-EL
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 10:55:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iVdwx-0003dt-CF
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 10:55:57 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60484)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iVdwx-0003dc-6u
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 10:55:55 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAFFgYUV128211
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 10:55:54 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w9ntpay49-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 10:55:54 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <groug@kaod.org>;
 Fri, 15 Nov 2019 15:55:52 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 15 Nov 2019 15:55:50 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAFFtnVX23068904
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Nov 2019 15:55:49 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 741174C044;
 Fri, 15 Nov 2019 15:55:49 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4CECD4C046;
 Fri, 15 Nov 2019 15:55:49 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.70.126])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 15 Nov 2019 15:55:49 +0000 (GMT)
Subject: [PATCH v2 for-5.0 5/8] ppc/pnv: Link "psi" property to PnvOCC::psi
 pointer
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>,
 =?utf-8?q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Date: Fri, 15 Nov 2019 16:55:49 +0100
In-Reply-To: <157383332103.165747.15204186097237659466.stgit@bahia.lan>
References: <157383332103.165747.15204186097237659466.stgit@bahia.lan>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19111515-0028-0000-0000-000003B7402F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111515-0029-0000-0000-0000247A5268
Message-Id: <157383334894.165747.7617090757862105199.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-15_04:2019-11-15,2019-11-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 adultscore=0 clxscore=1034 mlxlogscore=766 spamscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911150142
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The OCC object has both a pointer and a "psi" property pointing to the
PSI object. Confusing bugs could arise if these ever go out of sync.

Change the property definition so that it explicitely sets the pointer.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/pnv.c     |    8 ++++----
 hw/ppc/pnv_occ.c |   20 +++++++++-----------
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 286901746f50..96c5a23cd1eb 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -901,8 +901,6 @@ static void pnv_chip_power8_instance_init(Object *obj)
 
     object_initialize_child(obj, "occ",  &chip8->occ, sizeof(chip8->occ),
                             TYPE_PNV8_OCC, &error_abort, NULL);
-    object_property_add_const_link(OBJECT(&chip8->occ), "psi",
-                                   OBJECT(&chip8->psi), &error_abort);
 
     object_initialize_child(obj, "homer",  &chip8->homer, sizeof(chip8->homer),
                             TYPE_PNV8_HOMER, &error_abort, NULL);
@@ -997,6 +995,8 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
     }
 
     /* Create the simplified OCC model */
+    object_property_set_link(OBJECT(&chip8->occ), OBJECT(&chip8->psi), "psi",
+                             &error_abort);
     object_property_set_bool(OBJECT(&chip8->occ), true, "realized", &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
@@ -1101,8 +1101,6 @@ static void pnv_chip_power9_instance_init(Object *obj)
 
     object_initialize_child(obj, "occ",  &chip9->occ, sizeof(chip9->occ),
                             TYPE_PNV9_OCC, &error_abort, NULL);
-    object_property_add_const_link(OBJECT(&chip9->occ), "psi",
-                                   OBJECT(&chip9->psi), &error_abort);
 
     object_initialize_child(obj, "homer",  &chip9->homer, sizeof(chip9->homer),
                             TYPE_PNV9_HOMER, &error_abort, NULL);
@@ -1210,6 +1208,8 @@ static void pnv_chip_power9_realize(DeviceState *dev, Error **errp)
                                             (uint64_t) PNV9_LPCM_BASE(chip));
 
     /* Create the simplified OCC model */
+    object_property_set_link(OBJECT(&chip9->occ), OBJECT(&chip9->psi), "psi",
+                             &error_abort);
     object_property_set_bool(OBJECT(&chip9->occ), true, "realized", &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
diff --git a/hw/ppc/pnv_occ.c b/hw/ppc/pnv_occ.c
index 785653bb6710..765c0a6ce595 100644
--- a/hw/ppc/pnv_occ.c
+++ b/hw/ppc/pnv_occ.c
@@ -21,7 +21,7 @@
 #include "qapi/error.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
-
+#include "hw/qdev-properties.h"
 #include "hw/ppc/pnv.h"
 #include "hw/ppc/pnv_xscom.h"
 #include "hw/ppc/pnv_occ.h"
@@ -257,18 +257,10 @@ static void pnv_occ_realize(DeviceState *dev, Error **errp)
 {
     PnvOCC *occ = PNV_OCC(dev);
     PnvOCCClass *poc = PNV_OCC_GET_CLASS(occ);
-    Object *obj;
-    Error *local_err = NULL;
 
-    occ->occmisc = 0;
+    assert(occ->psi);
 
-    obj = object_property_get_link(OBJECT(dev), "psi", &local_err);
-    if (!obj) {
-        error_propagate(errp, local_err);
-        error_prepend(errp, "required link 'psi' not found: ");
-        return;
-    }
-    occ->psi = PNV_PSI(obj);
+    occ->occmisc = 0;
 
     /* XScom region for OCC registers */
     pnv_xscom_region_init(&occ->xscom_regs, OBJECT(dev), poc->xscom_ops,
@@ -279,12 +271,18 @@ static void pnv_occ_realize(DeviceState *dev, Error **errp)
                           occ, "occ-common-area", poc->sram_size);
 }
 
+static Property pnv_occ_properties[] = {
+    DEFINE_PROP_LINK("psi", PnvOCC, psi, TYPE_PNV_PSI, PnvPsi *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void pnv_occ_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = pnv_occ_realize;
     dc->desc = "PowerNV OCC Controller";
+    dc->props = pnv_occ_properties;
 }
 
 static const TypeInfo pnv_occ_type_info = {


