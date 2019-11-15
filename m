Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B35CFDCD8
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 13:00:31 +0100 (CET)
Received: from localhost ([::1]:38008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVaH7-0006v8-PQ
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 07:00:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39837)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iVaAc-0001U1-UD
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 06:53:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iVaAb-00069m-MY
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 06:53:46 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:12126)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iVaAb-00065X-EE
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 06:53:45 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAFBqGVQ061019
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 06:53:37 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w9nup45ss-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 06:53:37 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <groug@kaod.org>;
 Fri, 15 Nov 2019 11:53:35 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 15 Nov 2019 11:53:32 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAFBrVWS48234516
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Nov 2019 11:53:31 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FB4CA4062;
 Fri, 15 Nov 2019 11:53:31 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F16A2A4054;
 Fri, 15 Nov 2019 11:53:30 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.70.126])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 15 Nov 2019 11:53:30 +0000 (GMT)
Subject: [PATCH for-5.0 1/8] xive: Link "cpu" property to XiveTCTX::cs pointer
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>,
 =?utf-8?q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Date: Fri, 15 Nov 2019 12:53:30 +0100
In-Reply-To: <157381880498.136087.3775284829737989585.stgit@bahia.lan>
References: <157381880498.136087.3775284829737989585.stgit@bahia.lan>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19111511-0020-0000-0000-000003866CF6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111511-0021-0000-0000-000021DC892C
Message-Id: <157381881062.136087.15165493342975065530.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-15_03:2019-11-15,2019-11-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 spamscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=869 suspectscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911150112
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
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

The TCTX object has both a pointer and a "cpu" property pointing to the
vCPU object. Confusing bugs could arise if these ever go out of sync.

Change the property definition so that it explicitely sets the pointer.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/intc/xive.c |   25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 75dce82fb205..5363fcaa416c 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -580,19 +580,11 @@ static void xive_tctx_realize(DeviceState *dev, Error **errp)
     XiveTCTX *tctx = XIVE_TCTX(dev);
     PowerPCCPU *cpu;
     CPUPPCState *env;
-    Object *obj;
     Error *local_err = NULL;
 
-    obj = object_property_get_link(OBJECT(dev), "cpu", &local_err);
-    if (!obj) {
-        error_propagate(errp, local_err);
-        error_prepend(errp, "required link 'cpu' not found: ");
-        return;
-    }
-
-    cpu = POWERPC_CPU(obj);
-    tctx->cs = CPU(obj);
+    assert(tctx->cs);
 
+    cpu = POWERPC_CPU(tctx->cs);
     env = &cpu->env;
     switch (PPC_INPUT(env)) {
     case PPC_FLAGS_INPUT_POWER9:
@@ -676,10 +668,19 @@ static void xive_tctx_class_init(ObjectClass *klass, void *data)
     dc->user_creatable = false;
 }
 
+static void xive_tctx_instance_init(Object *obj)
+{
+    object_property_add_link(obj, "cpu", TYPE_CPU,
+                             (Object **) &XIVE_TCTX(obj)->cs,
+                             qdev_prop_allow_set_link_before_realize,
+                             OBJ_PROP_LINK_STRONG, &error_abort);
+}
+
 static const TypeInfo xive_tctx_info = {
     .name          = TYPE_XIVE_TCTX,
     .parent        = TYPE_DEVICE,
     .instance_size = sizeof(XiveTCTX),
+    .instance_init = xive_tctx_instance_init,
     .class_init    = xive_tctx_class_init,
 };
 
@@ -691,8 +692,7 @@ Object *xive_tctx_create(Object *cpu, XiveRouter *xrtr, Error **errp)
     obj = object_new(TYPE_XIVE_TCTX);
     object_property_add_child(cpu, TYPE_XIVE_TCTX, obj, &error_abort);
     object_unref(obj);
-    object_ref(cpu);
-    object_property_add_const_link(obj, "cpu", cpu, &error_abort);
+    object_property_set_link(obj, cpu, "cpu", &error_abort);
     object_property_set_bool(obj, true, "realized", &local_err);
     if (local_err) {
         goto error;
@@ -710,7 +710,6 @@ void xive_tctx_destroy(XiveTCTX *tctx)
 {
     Object *obj = OBJECT(tctx);
 
-    object_unref(object_property_get_link(obj, "cpu", &error_abort));
     object_unparent(obj);
 }
 


