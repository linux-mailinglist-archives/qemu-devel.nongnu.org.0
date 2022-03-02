Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 386E54CA4AD
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:19:27 +0100 (CET)
Received: from localhost ([::1]:47070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNwz-0000tS-6g
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:19:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrL-0001Yd-Qf; Wed, 02 Mar 2022 06:09:33 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5356
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrI-0001wM-CZ; Wed, 02 Mar 2022 06:09:31 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222AmxVZ030856; 
 Wed, 2 Mar 2022 11:09:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej75erd53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:09:00 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 222AnfFv000597;
 Wed, 2 Mar 2022 11:08:59 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej75erd3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:59 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B327e030113;
 Wed, 2 Mar 2022 11:08:57 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3efbu9524r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:57 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 222B8t3347645072
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:55 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64C4C11C05C;
 Wed,  2 Mar 2022 11:08:55 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B49411C050;
 Wed,  2 Mar 2022 11:08:55 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:55 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 7C2E0220294;
 Wed,  2 Mar 2022 12:08:54 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 71/87] xive2: Add a get_config() handler for the router
 configuration
Date: Wed,  2 Mar 2022 12:07:47 +0100
Message-Id: <20220302110803.849505-72-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3Hwoz7EIBhWn1BLUJBvsoJBLuuJ_jWtG
X-Proofpoint-GUID: qZQTY31d9QAZ98ldWEPUuC7zeQxxi0Np
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=950
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add GEN1 config even if we don't use it yet in the core framework.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive2.h |  8 ++++++++
 hw/intc/pnv_xive2.c    | 13 +++++++++++++
 hw/intc/xive2.c        |  7 +++++++
 3 files changed, 28 insertions(+)

diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
index c8c4505b51e0..a598393b65dc 100644
--- a/include/hw/ppc/xive2.h
+++ b/include/hw/ppc/xive2.h
@@ -25,6 +25,12 @@ typedef struct Xive2Router {
 #define TYPE_XIVE2_ROUTER "xive2-router"
 OBJECT_DECLARE_TYPE(Xive2Router, Xive2RouterClass, XIVE2_ROUTER);
=20
+/*
+ * Configuration flags
+ */
+
+#define XIVE2_GEN1_TIMA_OS      0x00000001
+
 typedef struct Xive2RouterClass {
     SysBusDeviceClass parent;
=20
@@ -44,6 +50,7 @@ typedef struct Xive2RouterClass {
     int (*write_nvp)(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nvp_id=
x,
                      Xive2Nvp *nvp, uint8_t word_number);
     uint8_t (*get_block_id)(Xive2Router *xrtr);
+    uint32_t (*get_config)(Xive2Router *xrtr);
 } Xive2RouterClass;
=20
 int xive2_router_get_eas(Xive2Router *xrtr, uint8_t eas_blk, uint32_t ea=
s_idx,
@@ -56,6 +63,7 @@ int xive2_router_get_nvp(Xive2Router *xrtr, uint8_t nvp=
_blk, uint32_t nvp_idx,
                         Xive2Nvp *nvp);
 int xive2_router_write_nvp(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t =
nvp_idx,
                           Xive2Nvp *nvp, uint8_t word_number);
+uint32_t xive2_router_get_config(Xive2Router *xrtr);
=20
 void xive2_router_notify(XiveNotifier *xn, uint32_t lisn, bool pq_checke=
d);
=20
diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
index 5df378dde4b6..963f6ad2da8e 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -426,6 +426,18 @@ static int pnv_xive2_get_eas(Xive2Router *xrtr, uint=
8_t blk, uint32_t idx,
     return pnv_xive2_vst_read(xive, VST_EAS, blk, idx, eas);
 }
=20
+static uint32_t pnv_xive2_get_config(Xive2Router *xrtr)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(xrtr);
+    uint32_t cfg =3D 0;
+
+    if (xive->cq_regs[CQ_XIVE_CFG >> 3] & CQ_XIVE_CFG_GEN1_TIMA_OS) {
+        cfg |=3D XIVE2_GEN1_TIMA_OS;
+    }
+
+    return cfg;
+}
+
 static bool pnv_xive2_is_cpu_enabled(PnvXive2 *xive, PowerPCCPU *cpu)
 {
     int pir =3D ppc_cpu_pir(cpu);
@@ -1950,6 +1962,7 @@ static void pnv_xive2_class_init(ObjectClass *klass=
, void *data)
     xrc->write_end =3D pnv_xive2_write_end;
     xrc->get_nvp   =3D pnv_xive2_get_nvp;
     xrc->write_nvp =3D pnv_xive2_write_nvp;
+    xrc->get_config  =3D pnv_xive2_get_config;
     xrc->get_block_id =3D pnv_xive2_get_block_id;
=20
     xnc->notify    =3D pnv_xive2_notify;
diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
index 048b98dbbe90..c45422542459 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -20,6 +20,13 @@
 #include "hw/ppc/xive2.h"
 #include "hw/ppc/xive2_regs.h"
=20
+uint32_t xive2_router_get_config(Xive2Router *xrtr)
+{
+    Xive2RouterClass *xrc =3D XIVE2_ROUTER_GET_CLASS(xrtr);
+
+    return xrc->get_config(xrtr);
+}
+
 void xive2_eas_pic_print_info(Xive2Eas *eas, uint32_t lisn, Monitor *mon=
)
 {
     if (!xive2_eas_is_valid(eas)) {
--=20
2.34.1


