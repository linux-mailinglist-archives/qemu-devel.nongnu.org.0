Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D21A4CA49D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:16:41 +0100 (CET)
Received: from localhost ([::1]:42520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNuJ-00064J-Mw
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:16:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrJ-0001Pq-73; Wed, 02 Mar 2022 06:09:29 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33002
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrF-0001tV-65; Wed, 02 Mar 2022 06:09:28 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222AmT5N030387; 
 Wed, 2 Mar 2022 11:09:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej75erd6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:09:01 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 222AnAUP032579;
 Wed, 2 Mar 2022 11:09:01 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej75erd51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:09:01 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2acj027228;
 Wed, 2 Mar 2022 11:08:59 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 3efbu9d1tb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:59 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8u2G48890152
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:56 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B71EA407C;
 Wed,  2 Mar 2022 11:08:56 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51479A4070;
 Wed,  2 Mar 2022 11:08:56 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:56 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A6C4C220294;
 Wed,  2 Mar 2022 12:08:55 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 73/87] pnv/xive2: Add support for 8bits thread id
Date: Wed,  2 Mar 2022 12:07:49 +0100
Message-Id: <20220302110803.849505-74-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sFpQZSMrUwx4S-pmewrHkDVEhrwT3zM9
X-Proofpoint-GUID: CwiUMQwA2ol3PtxlUaFpuhEqj3F6kaEB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
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

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive2.h | 1 +
 hw/intc/pnv_xive2.c    | 5 +++++
 hw/intc/xive2.c        | 3 ++-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
index 296a2d949498..e9e3ea135ea6 100644
--- a/include/hw/ppc/xive2.h
+++ b/include/hw/ppc/xive2.h
@@ -31,6 +31,7 @@ OBJECT_DECLARE_TYPE(Xive2Router, Xive2RouterClass, XIVE=
2_ROUTER);
=20
 #define XIVE2_GEN1_TIMA_OS      0x00000001
 #define XIVE2_VP_SAVE_RESTORE   0x00000002
+#define XIVE2_THREADID_8BITS    0x00000004
=20
 typedef struct Xive2RouterClass {
     SysBusDeviceClass parent;
diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
index b51571c6034f..87303b40641b 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -439,6 +439,11 @@ static uint32_t pnv_xive2_get_config(Xive2Router *xr=
tr)
         cfg |=3D XIVE2_VP_SAVE_RESTORE;
     }
=20
+    if (GETFIELD(CQ_XIVE_CFG_HYP_HARD_RANGE,
+              xive->cq_regs[CQ_XIVE_CFG >> 3]) =3D=3D CQ_XIVE_CFG_THREAD=
ID_8BITS) {
+        cfg |=3D XIVE2_THREADID_8BITS;
+    }
+
     return cfg;
 }
=20
diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
index fd9cfebd782d..b6452f14784b 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -459,7 +459,8 @@ static uint32_t xive2_tctx_hw_cam_line(XivePresenter =
*xptr, XiveTCTX *tctx)
     CPUPPCState *env =3D &POWERPC_CPU(tctx->cs)->env;
     uint32_t pir =3D env->spr_cb[SPR_PIR].default_value;
     uint8_t blk =3D xive2_router_get_block_id(xrtr);
-    uint8_t tid_shift =3D 7;
+    uint8_t tid_shift =3D
+        xive2_router_get_config(xrtr) & XIVE2_THREADID_8BITS ? 8 : 7;
     uint8_t tid_mask =3D (1 << tid_shift) - 1;
=20
     return xive2_nvp_cam_line(blk, 1 << tid_shift | (pir & tid_mask));
--=20
2.34.1


