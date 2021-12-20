Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A636C47B3E4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 20:43:52 +0100 (CET)
Received: from localhost ([::1]:35058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzOZb-0002LE-Q7
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 14:43:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNFw-0002Kq-Dv; Mon, 20 Dec 2021 13:19:28 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNFt-0006hL-LX; Mon, 20 Dec 2021 13:19:28 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BKGSsOv016600; 
 Mon, 20 Dec 2021 18:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=KtbHT4QTwfKxNs817/JaNt30QmSy7sTqRZQ8+ABAh6I=;
 b=dpV8WBTH+45okmROBHZA46Xb3tftVV7wov/V/OSDK2y4aROS+ZHcWfKkkI1rI+fAOtBQ
 ji6O7QCdXwX5FopZayiyqeYdMjZehYgO9YWsknCEkzodnVm8/ra2yP63lgM3MQ5sRrIv
 QU55DhmsUiTeNwl6mn3iyQevQ4l41azecQYJBuMjuZ2yHROMhU5HbU/gWFrT0tLpm0k6
 2cAwva+WkCijKRb5enOGZQULAD8S+8bGnfVZQ86r4yZTqQytJLKWhGTqoZ+Cen6B39Ua
 Abe0y4LTBTgoDG06XCyVktT0WLogMy3vlgOvrFhF/p7Hvwazcis4nhpPwLyFiyJO3vc1 YQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1sqn9bp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:16 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BKHnOSJ014757;
 Mon, 20 Dec 2021 18:19:16 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1sqn9bnn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:16 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BKIDRXb016516;
 Mon, 20 Dec 2021 18:19:15 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 3d179aa9jy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:15 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BKIJEMe23134684
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 18:19:14 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 207B8C605D;
 Mon, 20 Dec 2021 18:19:14 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 913D5C605F;
 Mon, 20 Dec 2021 18:19:12 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.60.53])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Dec 2021 18:19:12 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 01/12] target/ppc: powerpc_excp: Set alternate SRRs directly
Date: Mon, 20 Dec 2021 15:18:52 -0300
Message-Id: <20211220181903.3456898-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211220181903.3456898-1-farosas@linux.ibm.com>
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2q2Lhn_nd9QDTMM5tv4tvudmOrx5Yv60
X-Proofpoint-GUID: mS2ttPVYUzDdbeHyYTTjKOJPbCWFRGPY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_08,2021-12-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 mlxlogscore=625 spamscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112200101
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are currently only two interrupts that use alternate SRRs, so
let them write to them directly during the setup code.

No functional change intented.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index f90e616aac..8b9c6bc5a8 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -298,7 +298,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
     target_ulong msr, new_msr, vector;
-    int srr0, srr1, asrr0, asrr1, lev = -1;
+    int srr0, srr1, lev = -1;
 
     qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
                   " => %08x (%02x)\n", env->nip, excp, env->error_code);
@@ -319,8 +319,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
     /* target registers */
     srr0 = SPR_SRR0;
     srr1 = SPR_SRR1;
-    asrr0 = -1;
-    asrr1 = -1;
 
     /*
      * check for special resume at 0x100 from doze/nap/sleep/winkle on
@@ -410,8 +408,9 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
             /* FIXME: choose one or the other based on CPU type */
             srr0 = SPR_BOOKE_MCSRR0;
             srr1 = SPR_BOOKE_MCSRR1;
-            asrr0 = SPR_BOOKE_CSRR0;
-            asrr1 = SPR_BOOKE_CSRR1;
+
+            env->spr[SPR_BOOKE_CSRR0] = env->nip;
+            env->spr[SPR_BOOKE_CSRR1] = msr;
             break;
         default:
             break;
@@ -570,8 +569,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
             /* FIXME: choose one or the other based on CPU type */
             srr0 = SPR_BOOKE_DSRR0;
             srr1 = SPR_BOOKE_DSRR1;
-            asrr0 = SPR_BOOKE_CSRR0;
-            asrr1 = SPR_BOOKE_CSRR1;
+
+            env->spr[SPR_BOOKE_CSRR0] = env->nip;
+            env->spr[SPR_BOOKE_CSRR1] = msr;
+
             /* DBSR already modified by caller */
         } else {
             cpu_abort(cs, "Debug exception triggered on unsupported model\n");
@@ -838,14 +839,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
 
     vector |= env->excp_prefix;
 
-    /* If any alternate SRR register are defined, duplicate saved values */
-    if (asrr0 != -1) {
-        env->spr[asrr0] = env->nip;
-    }
-    if (asrr1 != -1) {
-        env->spr[asrr1] = msr;
-    }
-
 #if defined(TARGET_PPC64)
     if (excp_model == POWERPC_EXCP_BOOKE) {
         if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
-- 
2.33.1


