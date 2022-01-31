Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAD64A43F8
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 12:25:58 +0100 (CET)
Received: from localhost ([::1]:36696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEUok-0002Di-UE
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 06:25:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUYi-00062m-O8; Mon, 31 Jan 2022 06:09:21 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUYd-00054r-RG; Mon, 31 Jan 2022 06:09:20 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20VAbxgx017183; 
 Mon, 31 Jan 2022 11:08:32 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dx33wtjh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:31 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VB2IBR004475;
 Mon, 31 Jan 2022 11:08:29 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3dvw79afup-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:29 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20VAwexI49414480
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 10:58:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8064D4C044;
 Mon, 31 Jan 2022 11:08:26 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20F6B4C05A;
 Mon, 31 Jan 2022 11:08:26 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 31 Jan 2022 11:08:26 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.57.185])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 2BEDE220149;
 Mon, 31 Jan 2022 12:08:25 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 14/41] target/ppc: 405: Rename MSR_POW to MSR_WE
Date: Mon, 31 Jan 2022 12:07:44 +0100
Message-Id: <20220131110811.619053-15-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131110811.619053-1-clg@kaod.org>
References: <20220131110811.619053-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tSSKnlV4wYNO23UWNL3FQBw3rEffSFL6
X-Proofpoint-ORIG-GUID: tSSKnlV4wYNO23UWNL3FQBw3rEffSFL6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 bulkscore=0
 adultscore=0 impostorscore=0 mlxlogscore=470 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310074
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

Bit 13 is the Wait State Enable bit. Give it its proper name.

As far as I can see we don't do anything with MSR_POW for the 405, so
this change has no effect.

Suggested-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220118184448.852996-2-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu.h      | 1 +
 target/ppc/cpu_init.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 2560b70c5f10..66e13075c3df 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -327,6 +327,7 @@ typedef enum {
 #define MSR_S    22 /* Secure state                                     =
     */
 #define MSR_KEY  19 /* key bit on 603e                                  =
     */
 #define MSR_POW  18 /* Power management                                 =
     */
+#define MSR_WE   18 /* Wait State Enable on 405                         =
     */
 #define MSR_TGPR 17 /* TGPR usage on 602/603                        x   =
     */
 #define MSR_CE   17 /* Critical interrupt enable on embedded PowerPC x  =
     */
 #define MSR_ILE  16 /* Interrupt little-endian mode                     =
     */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index e30e86fe9d04..e63705b1c6b2 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -2535,7 +2535,7 @@ POWERPC_FAMILY(405)(ObjectClass *oc, void *data)
                        PPC_MEM_SYNC | PPC_MEM_EIEIO |
                        PPC_40x_TLB | PPC_MEM_TLBIA | PPC_MEM_TLBSYNC |
                        PPC_4xx_COMMON | PPC_405_MAC | PPC_40x_EXCP;
-    pcc->msr_mask =3D (1ull << MSR_POW) |
+    pcc->msr_mask =3D (1ull << MSR_WE) |
                     (1ull << MSR_CE) |
                     (1ull << MSR_EE) |
                     (1ull << MSR_PR) |
--=20
2.34.1


