Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03979FDCED
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 13:03:57 +0100 (CET)
Received: from localhost ([::1]:38050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVaKR-00021O-Gc
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 07:03:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40003)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iVaAx-0001pD-V7
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 06:54:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iVaAw-0006ZC-MD
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 06:54:07 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43874
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iVaAw-0006Wc-CM
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 06:54:06 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAFBqRAO113839
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 06:54:04 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w9jwrbhnh-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 06:54:04 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <groug@kaod.org>;
 Fri, 15 Nov 2019 11:54:02 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 15 Nov 2019 11:54:00 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAFBrxeX42926308
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Nov 2019 11:53:59 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08F4911C050;
 Fri, 15 Nov 2019 11:53:59 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB6CB11C04C;
 Fri, 15 Nov 2019 11:53:58 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.70.126])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 15 Nov 2019 11:53:58 +0000 (GMT)
Subject: [PATCH for-5.0 6/8] ppc/pnv: Link "chip" property to PnvHomer::chip
 pointer
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>,
 =?utf-8?q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Date: Fri, 15 Nov 2019 12:53:58 +0100
In-Reply-To: <157381880498.136087.3775284829737989585.stgit@bahia.lan>
References: <157381880498.136087.3775284829737989585.stgit@bahia.lan>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19111511-0008-0000-0000-0000032F42EB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111511-0009-0000-0000-00004A4E554E
Message-Id: <157381883845.136087.16856557105801964895.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-15_03:2019-11-15,2019-11-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1034 mlxlogscore=803
 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911150112
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

The homer object has both a pointer and a "chip" property pointing to the
chip object. Confusing bugs could arise if these ever go out of sync.

Change the property definition so that it explicitely sets the pointer.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/pnv.c       |    8 ++++----
 hw/ppc/pnv_homer.c |   24 +++++++++++++-----------
 2 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 96c5a23cd1eb..232c817452c0 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -904,8 +904,6 @@ static void pnv_chip_power8_instance_init(Object *obj)
 
     object_initialize_child(obj, "homer",  &chip8->homer, sizeof(chip8->homer),
                             TYPE_PNV8_HOMER, &error_abort, NULL);
-    object_property_add_const_link(OBJECT(&chip8->homer), "chip", obj,
-                                   &error_abort);
 }
 
 static void pnv_chip_icp_realize(Pnv8Chip *chip8, Error **errp)
@@ -1009,6 +1007,8 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
                                 &chip8->occ.sram_regs);
 
     /* HOMER */
+    object_property_set_link(OBJECT(&chip8->homer), OBJECT(chip), "chip",
+                             &error_abort);
     object_property_set_bool(OBJECT(&chip8->homer), true, "realized",
                              &local_err);
     if (local_err) {
@@ -1104,8 +1104,6 @@ static void pnv_chip_power9_instance_init(Object *obj)
 
     object_initialize_child(obj, "homer",  &chip9->homer, sizeof(chip9->homer),
                             TYPE_PNV9_HOMER, &error_abort, NULL);
-    object_property_add_const_link(OBJECT(&chip9->homer), "chip", obj,
-                                   &error_abort);
 }
 
 static void pnv_chip_quad_realize(Pnv9Chip *chip9, Error **errp)
@@ -1222,6 +1220,8 @@ static void pnv_chip_power9_realize(DeviceState *dev, Error **errp)
                                 &chip9->occ.sram_regs);
 
     /* HOMER */
+    object_property_set_link(OBJECT(&chip9->homer), OBJECT(chip), "chip",
+                             &error_abort);
     object_property_set_bool(OBJECT(&chip9->homer), true, "realized",
                              &local_err);
     if (local_err) {
diff --git a/hw/ppc/pnv_homer.c b/hw/ppc/pnv_homer.c
index cc881a3b3289..cc08c1e34e2e 100644
--- a/hw/ppc/pnv_homer.c
+++ b/hw/ppc/pnv_homer.c
@@ -22,10 +22,10 @@
 #include "exec/memory.h"
 #include "sysemu/cpus.h"
 #include "hw/qdev-core.h"
+#include "hw/qdev-properties.h"
 #include "hw/ppc/pnv.h"
 #include "hw/ppc/pnv_homer.h"
 
-
 static bool core_max_array(PnvHomer *homer, hwaddr addr)
 {
     int i;
@@ -229,22 +229,23 @@ static void pnv_homer_realize(DeviceState *dev, Error **errp)
 {
     PnvHomer *homer = PNV_HOMER(dev);
     PnvHomerClass *hmrc = PNV_HOMER_GET_CLASS(homer);
-    Object *obj;
-    Error *local_err = NULL;
-
-    obj = object_property_get_link(OBJECT(dev), "chip", &local_err);
-    if (!obj) {
-        error_propagate(errp, local_err);
-        error_prepend(errp, "required link 'chip' not found: ");
-        return;
-    }
-    homer->chip = PNV_CHIP(obj);
+
+    assert(homer->chip);
+
     /* homer region */
     memory_region_init_io(&homer->regs, OBJECT(dev),
                           hmrc->homer_ops, homer, "homer-main-memory",
                           hmrc->homer_size);
 }
 
+static void pnv_homer_instance_init(Object *obj)
+{
+    object_property_add_link(obj, "chip", TYPE_PNV_CHIP,
+                             (Object **) &PNV_HOMER(obj)->chip,
+                             qdev_prop_allow_set_link_before_realize,
+                             OBJ_PROP_LINK_STRONG, &error_abort);
+}
+
 static void pnv_homer_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -258,6 +259,7 @@ static const TypeInfo pnv_homer_type_info = {
     .parent        = TYPE_DEVICE,
     .instance_size = sizeof(PnvHomer),
     .class_init    = pnv_homer_class_init,
+    .instance_init = pnv_homer_instance_init,
     .class_size    = sizeof(PnvHomerClass),
     .abstract      = true,
 };


