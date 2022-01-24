Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FFD498A6F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 20:03:54 +0100 (CET)
Received: from localhost ([::1]:49762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC4d7-0000ii-Aa
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 14:03:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nC4MP-0003cC-C0; Mon, 24 Jan 2022 13:46:38 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nC4MN-0005Ka-FK; Mon, 24 Jan 2022 13:46:37 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OGkfOk031250; 
 Mon, 24 Jan 2022 18:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=DesE41KItusfkC447q2fNLpXTdn9wNZ4wSmAwHqOkWY=;
 b=eGtuseMrhV1vj6TZwZFgEm8Rg5WwnkulUk4Zbgh9cDk1Pt416ZgqOmXvueC1/TuU2RA3
 J8eRfI9Lj2d7dtWtkP9+EBUX47TR9gBlYHKzxdabcdIRv3XLlhqYQ6YZakbKrKNmlq9+
 uW857rGHI1bFy/232IiNgStDNzIejDR11fEg9wpZnvJubt3KvBMWcZ+/jGC2ot/Rvxpf
 8aDwnQzUvt8HUt8Wqz0QGfK2m7Wp1lyeP951NTyRf/x6kjnCZ3axvwvYXiBFVoo8uXtI
 XSBn/3sMigOd9qGTwdJ77o5HHBOJ05oCvAWE8UQTAfj7OiXQBdxNZRxIzVCHvGBZFEoq Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dsyx8tvfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 18:46:23 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20OH3r1j004826;
 Mon, 24 Jan 2022 18:46:22 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dsyx8tvfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 18:46:22 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20OIbUtG031807;
 Mon, 24 Jan 2022 18:46:22 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 3dr9ja5j2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 18:46:22 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20OIkKB628049910
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 18:46:20 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2650AE066;
 Mon, 24 Jan 2022 18:46:20 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A873AAE05C;
 Mon, 24 Jan 2022 18:46:18 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.163.24.67])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 24 Jan 2022 18:46:18 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] target/ppc: books: Machine Check exception cleanup
Date: Mon, 24 Jan 2022 15:46:03 -0300
Message-Id: <20220124184605.999353-4-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124184605.999353-1-farosas@linux.ibm.com>
References: <20220124184605.999353-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: S5ronr7uTfrH3MVh9nK9LOxAqYHRRh9g
X-Proofpoint-ORIG-GUID: BYEyADGtgYGey-B04CDJNQyxEgV-dod-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_09,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201240121
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

powerpc_excp_books is BookS only, so remove 40x and BookE code.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 0d27dfb2c5..e5f09e1984 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -632,23 +632,6 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
         /* machine check exceptions don't have ME set */
         new_msr &= ~((target_ulong)1 << MSR_ME);
 
-        /* XXX: should also have something loaded in DAR / DSISR */
-        switch (excp_model) {
-        case POWERPC_EXCP_40x:
-            srr0 = SPR_40x_SRR2;
-            srr1 = SPR_40x_SRR3;
-            break;
-        case POWERPC_EXCP_BOOKE:
-            /* FIXME: choose one or the other based on CPU type */
-            srr0 = SPR_BOOKE_MCSRR0;
-            srr1 = SPR_BOOKE_MCSRR1;
-
-            env->spr[SPR_BOOKE_CSRR0] = env->nip;
-            env->spr[SPR_BOOKE_CSRR1] = msr;
-            break;
-        default:
-            break;
-        }
         break;
     case POWERPC_EXCP_DSI:       /* Data storage exception                   */
         trace_ppc_excp_dsi(env->spr[SPR_DSISR], env->spr[SPR_DAR]);
-- 
2.34.1


