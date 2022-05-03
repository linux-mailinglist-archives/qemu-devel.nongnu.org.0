Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4F0519109
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 00:10:32 +0200 (CEST)
Received: from localhost ([::1]:41048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm0j1-0003UR-J5
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 18:10:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nlz5d-0004Vu-OM; Tue, 03 May 2022 16:25:46 -0400
Received: from [187.72.171.209] (port=28036 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nlz5c-0005g5-9R; Tue, 03 May 2022 16:25:45 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 3 May 2022 17:25:35 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 1CB2B801109;
 Tue,  3 May 2022 17:25:35 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, balaton@eik.bme.hu,
 victor.colombo@eldorado.org.br
Subject: [PATCH v3 02/21] target/ppc: Remove unused msr_* macros
Date: Tue,  3 May 2022 17:24:22 -0300
Message-Id: <20220503202441.129549-3-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220503202441.129549-1-victor.colombo@eldorado.org.br>
References: <20220503202441.129549-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 May 2022 20:25:35.0507 (UTC)
 FILETIME=[F1F5A630:01D85F2B]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some msr_* macros are not used anywhere. Remove them as part of
the work to remove all hidden usage of *env.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/cpu.h | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index ad31e51d69..106b555b86 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -463,23 +463,14 @@ typedef enum {
 #define HFSCR_MSGP     PPC_BIT(53) /* Privileged Message Send Facilities */
 #define HFSCR_IC_MSGP  0xA
 
-#define msr_sf   ((env->msr >> MSR_SF)   & 1)
-#define msr_isf  ((env->msr >> MSR_ISF)  & 1)
 #if defined(TARGET_PPC64)
 #define msr_hv   ((env->msr >> MSR_HV)   & 1)
 #else
 #define msr_hv   (0)
 #endif
 #define msr_cm   ((env->msr >> MSR_CM)   & 1)
-#define msr_icm  ((env->msr >> MSR_ICM)  & 1)
 #define msr_gs   ((env->msr >> MSR_GS)   & 1)
-#define msr_ucle ((env->msr >> MSR_UCLE) & 1)
-#define msr_vr   ((env->msr >> MSR_VR)   & 1)
-#define msr_spe  ((env->msr >> MSR_SPE)  & 1)
-#define msr_vsx  ((env->msr >> MSR_VSX)  & 1)
-#define msr_key  ((env->msr >> MSR_KEY)  & 1)
 #define msr_pow  ((env->msr >> MSR_POW)  & 1)
-#define msr_tgpr ((env->msr >> MSR_TGPR) & 1)
 #define msr_ce   ((env->msr >> MSR_CE)   & 1)
 #define msr_ile  ((env->msr >> MSR_ILE)  & 1)
 #define msr_ee   ((env->msr >> MSR_EE)   & 1)
@@ -487,25 +478,13 @@ typedef enum {
 #define msr_fp   ((env->msr >> MSR_FP)   & 1)
 #define msr_me   ((env->msr >> MSR_ME)   & 1)
 #define msr_fe0  ((env->msr >> MSR_FE0)  & 1)
-#define msr_se   ((env->msr >> MSR_SE)   & 1)
-#define msr_dwe  ((env->msr >> MSR_DWE)  & 1)
-#define msr_uble ((env->msr >> MSR_UBLE) & 1)
-#define msr_be   ((env->msr >> MSR_BE)   & 1)
-#define msr_de   ((env->msr >> MSR_DE)   & 1)
 #define msr_fe1  ((env->msr >> MSR_FE1)  & 1)
-#define msr_al   ((env->msr >> MSR_AL)   & 1)
 #define msr_ep   ((env->msr >> MSR_EP)   & 1)
 #define msr_ir   ((env->msr >> MSR_IR)   & 1)
 #define msr_dr   ((env->msr >> MSR_DR)   & 1)
-#define msr_is   ((env->msr >> MSR_IS)   & 1)
 #define msr_ds   ((env->msr >> MSR_DS)   & 1)
-#define msr_pe   ((env->msr >> MSR_PE)   & 1)
-#define msr_px   ((env->msr >> MSR_PX)   & 1)
-#define msr_pmm  ((env->msr >> MSR_PMM)  & 1)
-#define msr_ri   ((env->msr >> MSR_RI)   & 1)
 #define msr_le   ((env->msr >> MSR_LE)   & 1)
 #define msr_ts   ((env->msr >> MSR_TS1)  & 3)
-#define msr_tm   ((env->msr >> MSR_TM)   & 1)
 
 #define DBCR0_ICMP (1 << 27)
 #define DBCR0_BRT (1 << 26)
-- 
2.25.1


