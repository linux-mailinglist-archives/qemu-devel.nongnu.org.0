Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973AF4BB7BD
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 12:09:39 +0100 (CET)
Received: from localhost ([::1]:57648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL18s-0005MA-IV
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 06:09:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fr-0001Dz-82; Fri, 18 Feb 2022 05:39:39 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:16904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fg-0005gO-SJ; Fri, 18 Feb 2022 05:39:38 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I9jLmL006279; 
 Fri, 18 Feb 2022 10:38:45 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ea93ph485-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:44 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21IAc5jY006283;
 Fri, 18 Feb 2022 10:38:42 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3e64has9my-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:41 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21IAcd1S42140074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 10:38:39 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FF2042076;
 Fri, 18 Feb 2022 10:38:39 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0739742089;
 Fri, 18 Feb 2022 10:38:39 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Feb 2022 10:38:38 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 397DB220294;
 Fri, 18 Feb 2022 11:38:38 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 13/39] target/ppc: cpu_init: Remove not implemented comments
Date: Fri, 18 Feb 2022 11:38:01 +0100
Message-Id: <20220218103827.682032-14-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218103827.682032-1-clg@kaod.org>
References: <20220218103827.682032-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0jKGdH8uSBbys12NaB-j8EWLM-B8wvhK
X-Proofpoint-ORIG-GUID: 0jKGdH8uSBbys12NaB-j8EWLM-B8wvhK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 clxscore=1034 impostorscore=0 spamscore=0 bulkscore=0
 mlxlogscore=988 mlxscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202180067
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

The /* XXX : not implemented */ comments all over cpu_init are
confusing and ambiguous.

Do they mean not implemented by QEMU, not implemented in a specific
access mode? Not implemented by the CPU? Do they apply to just the
register right after or to a whole block? Do they mean we have an
action to take in the future to implement these?  Are they only
informative?

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20220216162426.1885923-2-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu_init.c | 582 ++++++++++++++++++------------------------
 1 file changed, 253 insertions(+), 329 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index d97f7183549f..767994fb8f99 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -466,95 +466,91 @@ static void register_G2_755_sprs(CPUPPCState *env)
 static void register_7xx_sprs(CPUPPCState *env)
 {
     /* Breakpoints */
-    /* XXX : not implemented */
     spr_register_kvm(env, SPR_DABR, "DABR",
                      SPR_NOACCESS, SPR_NOACCESS,
                      &spr_read_generic, &spr_write_generic,
                      KVM_REG_PPC_DABR, 0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_IABR, "IABR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Cache management */
-    /* XXX : not implemented */
     spr_register(env, SPR_ICTC, "ICTC",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Performance monitors */
-    /* XXX : not implemented */
     spr_register(env, SPR_7XX_MMCR0, "MMCR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_MMCR1, "MMCR1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC1, "PMC1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC2, "PMC2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC3, "PMC3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC4, "PMC4",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_SIAR, "SIAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UMMCR0, "UMMCR0",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UMMCR1, "UMMCR1",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC1, "UPMC1",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC2, "UPMC2",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC3, "UPMC3",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC4, "UPMC4",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_USIAR, "USIAR",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
     /* External access control */
-    /* XXX : not implemented */
     spr_register(env, SPR_EAR, "EAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -609,17 +605,16 @@ static void register_iamr_sprs(CPUPPCState *env)
 static void register_thrm_sprs(CPUPPCState *env)
 {
     /* Thermal management */
-    /* XXX : not implemented */
     spr_register(env, SPR_THRM1, "THRM1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_thrm, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_THRM2, "THRM2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_thrm, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_THRM3, "THRM3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_thrm, &spr_write_generic,
@@ -635,44 +630,41 @@ static void register_604_sprs(CPUPPCState *env)
                  &spr_read_generic, &spr_write_pir,
                  0x00000000);
     /* Breakpoints */
-    /* XXX : not implemented */
     spr_register(env, SPR_IABR, "IABR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register_kvm(env, SPR_DABR, "DABR",
                      SPR_NOACCESS, SPR_NOACCESS,
                      &spr_read_generic, &spr_write_generic,
                      KVM_REG_PPC_DABR, 0x00000000);
     /* Performance counters */
-    /* XXX : not implemented */
     spr_register(env, SPR_7XX_MMCR0, "MMCR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC1, "PMC1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC2, "PMC2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_SIAR, "SIAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_SDA, "SDA",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, SPR_NOACCESS,
                  0x00000000);
     /* External access control */
-    /* XXX : not implemented */
     spr_register(env, SPR_EAR, "EAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -683,13 +675,11 @@ static void register_604_sprs(CPUPPCState *env)
 static void register_603_sprs(CPUPPCState *env)
 {
     /* External access control */
-    /* XXX : not implemented */
     spr_register(env, SPR_EAR, "EAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Breakpoints */
-    /* XXX : not implemented */
     spr_register(env, SPR_IABR, "IABR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -702,7 +692,6 @@ static void register_G2_sprs(CPUPPCState *env)
 {
     /* Memory base address */
     /* MBAR */
-    /* XXX : not implemented */
     spr_register(env, SPR_MBAR, "MBAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -717,32 +706,31 @@ static void register_G2_sprs(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Breakpoints */
-    /* XXX : not implemented */
     spr_register(env, SPR_DABR, "DABR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_DABR2, "DABR2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_IABR, "IABR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_IABR2, "IABR2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_IBCR, "IBCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_DBCR, "DBCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -756,33 +744,32 @@ static void register_74xx_sprs(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_pir,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_74XX_MMCR2, "MMCR2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_74XX_UMMCR2, "UMMCR2",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX: not implemented */
+
     spr_register(env, SPR_BAMR, "BAMR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MSSCR0, "MSSCR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -792,7 +779,7 @@ static void register_74xx_sprs(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_L2CR, "L2CR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
@@ -802,19 +789,16 @@ static void register_74xx_sprs(CPUPPCState *env)
 static void register_l3_ctrl(CPUPPCState *env)
 {
     /* L3CR */
-    /* XXX : not implemented */
     spr_register(env, SPR_L3CR, "L3CR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* L3ITCR0 */
-    /* XXX : not implemented */
     spr_register(env, SPR_L3ITCR0, "L3ITCR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* L3PM */
-    /* XXX : not implemented */
     spr_register(env, SPR_L3PM, "L3PM",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -901,37 +885,36 @@ static void register_BookE_sprs(CPUPPCState *env, u=
int64_t ivor_mask)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Debug */
-    /* XXX : not implemented */
     spr_register(env, SPR_BOOKE_IAC1, "IAC1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_IAC2, "IAC2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DAC1, "DAC1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DAC2, "DAC2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DBCR0, "DBCR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_40x_dbcr0,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DBCR1, "DBCR1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DBCR2, "DBCR2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -944,7 +927,7 @@ static void register_BookE_sprs(CPUPPCState *env, uin=
t64_t ivor_mask)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DBSR, "DBSR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_clear,
@@ -1053,7 +1036,6 @@ static void register_BookE206_sprs(CPUPPCState *env=
, uint32_t mas_mask,
     int i;
=20
     /* TLB assist registers */
-    /* XXX : not implemented */
     for (i =3D 0; i < 8; i++) {
         if (mas_mask & (1 << i)) {
             spr_register(env, mas_sprn[i], mas_names[i],
@@ -1065,14 +1047,12 @@ static void register_BookE206_sprs(CPUPPCState *e=
nv, uint32_t mas_mask,
         }
     }
     if (env->nb_pids > 1) {
-        /* XXX : not implemented */
         spr_register(env, SPR_BOOKE_PID1, "PID1",
                      SPR_NOACCESS, SPR_NOACCESS,
                      &spr_read_generic, &spr_write_booke_pid,
                      0x00000000);
     }
     if (env->nb_pids > 2) {
-        /* XXX : not implemented */
         spr_register(env, SPR_BOOKE_PID2, "PID2",
                      SPR_NOACCESS, SPR_NOACCESS,
                      &spr_read_generic, &spr_write_booke_pid,
@@ -1088,7 +1068,6 @@ static void register_BookE206_sprs(CPUPPCState *env=
, uint32_t mas_mask,
                  &spr_read_generic, &spr_write_epsc,
                  0x00000000);
=20
-    /* XXX : not implemented */
     spr_register(env, SPR_MMUCFG, "MMUCFG",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, SPR_NOACCESS,
@@ -1131,123 +1110,121 @@ static void register_BookE206_sprs(CPUPPCState =
*env, uint32_t mas_mask,
 static void register_440_sprs(CPUPPCState *env)
 {
     /* Cache control */
-    /* XXX : not implemented */
     spr_register(env, SPR_440_DNV0, "DNV0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_DNV1, "DNV1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_DNV2, "DNV2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_DNV3, "DNV3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_DTV0, "DTV0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_DTV1, "DTV1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_DTV2, "DTV2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_DTV3, "DTV3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_DVLIM, "DVLIM",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_INV0, "INV0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_INV1, "INV1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_INV2, "INV2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_INV3, "INV3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_ITV0, "ITV0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_ITV1, "ITV1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_ITV2, "ITV2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_ITV3, "ITV3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_IVLIM, "IVLIM",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Cache debug */
-    /* XXX : not implemented */
     spr_register(env, SPR_BOOKE_DCDBTRH, "DCDBTRH",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DCDBTRL, "DCDBTRL",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_ICDBDR, "ICDBDR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_ICDBTRH, "ICDBTRH",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_ICDBTRL, "ICDBTRL",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_DBDR, "DBDR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -1336,23 +1313,22 @@ static void register_405_sprs(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00700000);
     /* Debug interface */
-    /* XXX : not implemented */
     spr_register(env, SPR_40x_DBCR0, "DBCR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_40x_dbcr0,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_405_DBCR1, "DBCR1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_40x_DBSR, "DBSR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_clear,
                  /* Last reset was system reset */
                  0x00000300);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_40x_DAC1, "DAC1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -1361,17 +1337,17 @@ static void register_405_sprs(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_405_DVC1, "DVC1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_405_DVC2, "DVC2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_40x_IAC1, "IAC1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -1380,18 +1356,17 @@ static void register_405_sprs(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_405_IAC3, "IAC3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_405_IAC4, "IAC4",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Storage control */
-    /* XXX: TODO: not implemented */
     spr_register(env, SPR_405_SLER, "SLER",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_40x_sler,
@@ -1400,7 +1375,7 @@ static void register_405_sprs(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_405_SU0R, "SU0R",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -1446,102 +1421,102 @@ static void register_5xx_8xx_sprs(CPUPPCState *=
env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_decr, &spr_write_decr,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_EIE, "EIE",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_EID, "EID",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_NRI, "NRI",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_CMPA, "CMPA",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_CMPB, "CMPB",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_CMPC, "CMPC",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_CMPD, "CMPD",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_ECR, "ECR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_DER, "DER",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_COUNTA, "COUNTA",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_COUNTB, "COUNTB",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_CMPE, "CMPE",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_CMPF, "CMPF",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_CMPG, "CMPG",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_CMPH, "CMPH",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_LCTRL1, "LCTRL1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_LCTRL2, "LCTRL2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_BAR, "BAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_DPDR, "DPDR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_IMMR, "IMMR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -1550,107 +1525,106 @@ static void register_5xx_8xx_sprs(CPUPPCState *=
env)
=20
 static void register_5xx_sprs(CPUPPCState *env)
 {
-    /* XXX : not implemented */
     spr_register(env, SPR_RCPU_MI_GRA, "MI_GRA",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_L2U_GRA, "L2U_GRA",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RPCU_BBCMCR, "L2U_BBCMCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_L2U_MCR, "L2U_MCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_MI_RBA0, "MI_RBA0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_MI_RBA1, "MI_RBA1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_MI_RBA2, "MI_RBA2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_MI_RBA3, "MI_RBA3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_L2U_RBA0, "L2U_RBA0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_L2U_RBA1, "L2U_RBA1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_L2U_RBA2, "L2U_RBA2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_L2U_RBA3, "L2U_RBA3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_MI_RA0, "MI_RA0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_MI_RA1, "MI_RA1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_MI_RA2, "MI_RA2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_MI_RA3, "MI_RA3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_L2U_RA0, "L2U_RA0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_L2U_RA1, "L2U_RA1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_L2U_RA2, "L2U_RA2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_L2U_RA3, "L2U_RA3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_FPECR, "FPECR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -1659,127 +1633,127 @@ static void register_5xx_sprs(CPUPPCState *env)
=20
 static void register_8xx_sprs(CPUPPCState *env)
 {
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_IC_CST, "IC_CST",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_IC_ADR, "IC_ADR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_IC_DAT, "IC_DAT",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_DC_CST, "DC_CST",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_DC_ADR, "DC_ADR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_DC_DAT, "DC_DAT",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MI_CTR, "MI_CTR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MI_AP, "MI_AP",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MI_EPN, "MI_EPN",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MI_TWC, "MI_TWC",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MI_RPN, "MI_RPN",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MI_DBCAM, "MI_DBCAM",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MI_DBRAM0, "MI_DBRAM0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MI_DBRAM1, "MI_DBRAM1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MD_CTR, "MD_CTR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MD_CASID, "MD_CASID",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MD_AP, "MD_AP",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MD_EPN, "MD_EPN",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MD_TWB, "MD_TWB",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MD_TWC, "MD_TWC",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MD_RPN, "MD_RPN",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MD_TW, "MD_TW",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MD_DBCAM, "MD_DBCAM",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MD_DBRAM0, "MD_DBRAM0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MD_DBRAM1, "MD_DBRAM1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -2393,27 +2367,27 @@ static void init_proc_440EP(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_pir,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_IAC3, "IAC3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_IAC4, "IAC4",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DVC1, "DVC1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DVC2, "DVC2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_MCSR, "MCSR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -2426,7 +2400,7 @@ static void init_proc_440EP(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_CCR1, "CCR1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -2535,22 +2509,22 @@ static void init_proc_440GP(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_pir,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_IAC3, "IAC3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_IAC4, "IAC4",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DVC1, "DVC1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DVC2, "DVC2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -2618,27 +2592,27 @@ static void init_proc_440x5(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_pir,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_IAC3, "IAC3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_IAC4, "IAC4",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DVC1, "DVC1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DVC2, "DVC2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_MCSR, "MCSR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -2651,7 +2625,7 @@ static void init_proc_440x5(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_CCR1, "CCR1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -2843,23 +2817,21 @@ static void init_proc_G2(CPUPPCState *env)
     /* Time base */
     register_tbl(env);
     /* External access control */
-    /* XXX : not implemented */
     spr_register(env, SPR_EAR, "EAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Hardware implementation register */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID2, "HID2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -2922,23 +2894,21 @@ static void init_proc_G2LE(CPUPPCState *env)
     /* Time base */
     register_tbl(env);
     /* External access control */
-    /* XXX : not implemented */
     spr_register(env, SPR_EAR, "EAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Hardware implementation register */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID2, "HID2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -3000,84 +2970,84 @@ static void init_proc_e200(CPUPPCState *env)
     /* Time base */
     register_tbl(env);
     register_BookE_sprs(env, 0x000000070000FFFFULL);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_SPEFSCR, "SPEFSCR",
                  &spr_read_spefscr, &spr_write_spefscr,
                  &spr_read_spefscr, &spr_write_spefscr,
                  0x00000000);
     /* Memory management */
     register_BookE206_sprs(env, 0x0000005D, NULL, 0);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_ALTCTXCR, "ALTCTXCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_BUCSR, "BUCSR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_CTXCR, "CTXCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_DBCNT, "DBCNT",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_DBCR3, "DBCR3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_L1CFG0, "L1CFG0",
                  &spr_read_generic, SPR_NOACCESS,
                  &spr_read_generic, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_L1CSR0, "L1CSR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_L1FINV0, "L1FINV0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_TLB0CFG, "TLB0CFG",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_TLB1CFG, "TLB1CFG",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_IAC3, "IAC3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_IAC4, "IAC4",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MMUCSR0, "MMUCSR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -3158,43 +3128,41 @@ static void init_proc_e300(CPUPPCState *env)
     /* Time base */
     register_tbl(env);
     /* hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID2, "HID2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Breakpoints */
-    /* XXX : not implemented */
     spr_register(env, SPR_DABR, "DABR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_DABR2, "DABR2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_IABR2, "IABR2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_IBCR, "IBCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_DBCR, "DBCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -3300,7 +3268,7 @@ static void init_proc_e500(CPUPPCState *env, int ve=
rsion)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_pir,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_SPEFSCR, "SPEFSCR",
                  &spr_read_spefscr, &spr_write_spefscr,
                  &spr_read_spefscr, &spr_write_spefscr,
@@ -3360,47 +3328,47 @@ static void init_proc_e500(CPUPPCState *env, int =
version)
                   env->spr[SPR_PVR]);
     }
     register_BookE206_sprs(env, 0x000000DF, tlbncfg, mmucfg);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_BBEAR, "BBEAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_BBTAR, "BBTAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_MCAR, "MCAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_MCSR, "MCSR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_NPIDR, "NPIDR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_BUCSR, "BUCSR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_L1CFG0, "L1CFG0",
                  &spr_read_generic, SPR_NOACCESS,
                  &spr_read_generic, SPR_NOACCESS,
@@ -3720,12 +3688,11 @@ static void init_proc_603(CPUPPCState *env)
     /* Time base */
     register_tbl(env);
     /* hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -3826,7 +3793,6 @@ static void init_proc_604(CPUPPCState *env)
     /* Time base */
     register_tbl(env);
     /* Hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -3884,17 +3850,17 @@ static void init_proc_604E(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_604_sprs(env);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_MMCR1, "MMCR1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC3, "PMC3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC4, "PMC4",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -3902,12 +3868,11 @@ static void init_proc_604E(CPUPPCState *env)
     /* Time base */
     register_tbl(env);
     /* Hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -3970,12 +3935,11 @@ static void init_proc_740(CPUPPCState *env)
     /* Thermal management */
     register_thrm_sprs(env);
     /* Hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4033,7 +3997,7 @@ static void init_proc_750(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_L2CR, "L2CR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
@@ -4043,12 +4007,11 @@ static void init_proc_750(CPUPPCState *env)
     /* Thermal management */
     register_thrm_sprs(env);
     /* Hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4110,7 +4073,7 @@ static void init_proc_750cl(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_L2CR, "L2CR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
@@ -4131,7 +4094,7 @@ static void init_proc_750cl(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX: not implemented */
+
     spr_register(env, SPR_750_TDCL, "TDCL",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4141,7 +4104,6 @@ static void init_proc_750cl(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* DMA */
-    /* XXX : not implemented */
     spr_register(env, SPR_750_WPAR, "WPAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4155,63 +4117,61 @@ static void init_proc_750cl(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_750CL_HID2, "HID2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_750CL_HID4, "HID4",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Quantization registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_750_GQR0, "GQR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_750_GQR1, "GQR1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_750_GQR2, "GQR2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_750_GQR3, "GQR3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_750_GQR4, "GQR4",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_750_GQR5, "GQR5",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_750_GQR6, "GQR6",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_750_GQR7, "GQR7",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4310,7 +4270,7 @@ static void init_proc_750cx(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_L2CR, "L2CR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
@@ -4319,18 +4279,17 @@ static void init_proc_750cx(CPUPPCState *env)
     register_tbl(env);
     /* Thermal management */
     register_thrm_sprs(env);
-    /* This register is not implemented but is present for compatibility=
 */
+
     spr_register(env, SPR_SDA, "SDA",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4390,7 +4349,7 @@ static void init_proc_750fx(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_L2CR, "L2CR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
@@ -4399,23 +4358,22 @@ static void init_proc_750fx(CPUPPCState *env)
     register_tbl(env);
     /* Thermal management */
     register_thrm_sprs(env);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_750_THRM4, "THRM4",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_750FX_HID2, "HID2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4475,7 +4433,7 @@ static void init_proc_750gx(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* XXX : not implemented (XXX: different from 750fx) */
+
     spr_register(env, SPR_L2CR, "L2CR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
@@ -4484,23 +4442,22 @@ static void init_proc_750gx(CPUPPCState *env)
     register_tbl(env);
     /* Thermal management */
     register_thrm_sprs(env);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_750_THRM4, "THRM4",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Hardware implementation registers */
-    /* XXX : not implemented (XXX: different from 750fx) */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented (XXX: different from 750fx) */
+
     spr_register(env, SPR_750FX_HID2, "HID2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4566,17 +4523,16 @@ static void init_proc_745(CPUPPCState *env)
     /* Thermal management */
     register_thrm_sprs(env);
     /* Hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID2, "HID2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4640,12 +4596,11 @@ static void init_proc_755(CPUPPCState *env)
     /* Time base */
     register_tbl(env);
     /* L2 cache control */
-    /* XXX : not implemented */
     spr_register(env, SPR_L2CR, "L2CR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_L2PMCR, "L2PMCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4653,17 +4608,16 @@ static void init_proc_755(CPUPPCState *env)
     /* Thermal management */
     register_thrm_sprs(env);
     /* Hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID2, "HID2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4728,13 +4682,12 @@ static void init_proc_7400(CPUPPCState *env)
     /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_UBAMR, "UBAMR",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX: this seems not implemented on all revisions. */
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MSSCR1, "MSSCR1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4805,7 +4758,7 @@ static void init_proc_7410(CPUPPCState *env)
     /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_UBAMR, "UBAMR",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
@@ -4813,13 +4766,13 @@ static void init_proc_7410(CPUPPCState *env)
     /* Thermal management */
     register_thrm_sprs(env);
     /* L2PMCR */
-    /* XXX : not implemented */
+
     spr_register(env, SPR_L2PMCR, "L2PMCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* LDSTDB */
-    /* XXX : not implemented */
+
     spr_register(env, SPR_LDSTDB, "LDSTDB",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4888,46 +4841,42 @@ static void init_proc_7440(CPUPPCState *env)
     /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_UBAMR, "UBAMR",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
     /* LDSTCR */
-    /* XXX : not implemented */
     spr_register(env, SPR_LDSTCR, "LDSTCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* ICTRL */
-    /* XXX : not implemented */
     spr_register(env, SPR_ICTRL, "ICTRL",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* MSSSR0 */
-    /* XXX : not implemented */
     spr_register(env, SPR_MSSSR0, "MSSSR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* PMC */
-    /* XXX : not implemented */
     spr_register(env, SPR_7XX_PMC5, "PMC5",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC5, "UPMC5",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC6, "PMC6",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC6, "UPMC6",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
@@ -4999,69 +4948,61 @@ static void init_proc_7450(CPUPPCState *env)
     /* Level 3 cache control */
     register_l3_ctrl(env);
     /* L3ITCR1 */
-    /* XXX : not implemented */
     spr_register(env, SPR_L3ITCR1, "L3ITCR1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* L3ITCR2 */
-    /* XXX : not implemented */
     spr_register(env, SPR_L3ITCR2, "L3ITCR2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* L3ITCR3 */
-    /* XXX : not implemented */
     spr_register(env, SPR_L3ITCR3, "L3ITCR3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* L3OHCR */
-    /* XXX : not implemented */
     spr_register(env, SPR_L3OHCR, "L3OHCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_UBAMR, "UBAMR",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
     /* LDSTCR */
-    /* XXX : not implemented */
     spr_register(env, SPR_LDSTCR, "LDSTCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* ICTRL */
-    /* XXX : not implemented */
     spr_register(env, SPR_ICTRL, "ICTRL",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* MSSSR0 */
-    /* XXX : not implemented */
     spr_register(env, SPR_MSSSR0, "MSSSR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* PMC */
-    /* XXX : not implemented */
     spr_register(env, SPR_7XX_PMC5, "PMC5",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC5, "UPMC5",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC6, "PMC6",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC6, "UPMC6",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
@@ -5131,40 +5072,36 @@ static void init_proc_7445(CPUPPCState *env)
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
     /* LDSTCR */
-    /* XXX : not implemented */
     spr_register(env, SPR_LDSTCR, "LDSTCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* ICTRL */
-    /* XXX : not implemented */
     spr_register(env, SPR_ICTRL, "ICTRL",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* MSSSR0 */
-    /* XXX : not implemented */
     spr_register(env, SPR_MSSSR0, "MSSSR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* PMC */
-    /* XXX : not implemented */
     spr_register(env, SPR_7XX_PMC5, "PMC5",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC5, "UPMC5",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC6, "PMC6",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC6, "UPMC6",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
@@ -5270,40 +5207,36 @@ static void init_proc_7455(CPUPPCState *env)
     /* Level 3 cache control */
     register_l3_ctrl(env);
     /* LDSTCR */
-    /* XXX : not implemented */
     spr_register(env, SPR_LDSTCR, "LDSTCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* ICTRL */
-    /* XXX : not implemented */
     spr_register(env, SPR_ICTRL, "ICTRL",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* MSSSR0 */
-    /* XXX : not implemented */
     spr_register(env, SPR_MSSSR0, "MSSSR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* PMC */
-    /* XXX : not implemented */
     spr_register(env, SPR_7XX_PMC5, "PMC5",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC5, "UPMC5",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC6, "PMC6",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC6, "UPMC6",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
@@ -5409,64 +5342,56 @@ static void init_proc_7457(CPUPPCState *env)
     /* Level 3 cache control */
     register_l3_ctrl(env);
     /* L3ITCR1 */
-    /* XXX : not implemented */
     spr_register(env, SPR_L3ITCR1, "L3ITCR1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* L3ITCR2 */
-    /* XXX : not implemented */
     spr_register(env, SPR_L3ITCR2, "L3ITCR2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* L3ITCR3 */
-    /* XXX : not implemented */
     spr_register(env, SPR_L3ITCR3, "L3ITCR3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* L3OHCR */
-    /* XXX : not implemented */
     spr_register(env, SPR_L3OHCR, "L3OHCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* LDSTCR */
-    /* XXX : not implemented */
     spr_register(env, SPR_LDSTCR, "LDSTCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* ICTRL */
-    /* XXX : not implemented */
     spr_register(env, SPR_ICTRL, "ICTRL",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* MSSSR0 */
-    /* XXX : not implemented */
     spr_register(env, SPR_MSSSR0, "MSSSR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* PMC */
-    /* XXX : not implemented */
     spr_register(env, SPR_7XX_PMC5, "PMC5",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC5, "UPMC5",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC6, "PMC6",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC6, "UPMC6",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
@@ -5569,42 +5494,42 @@ static void init_proc_e600(CPUPPCState *env)
     /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_UBAMR, "UBAMR",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_LDSTCR, "LDSTCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_ICTRL, "ICTRL",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MSSSR0, "MSSSR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC5, "PMC5",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC5, "UPMC5",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC6, "PMC6",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC6, "UPMC6",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
@@ -5717,7 +5642,6 @@ static int check_pow_970(CPUPPCState *env)
 static void register_970_hid_sprs(CPUPPCState *env)
 {
     /* Hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_clear,
--=20
2.34.1


