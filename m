Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7552851B0F4
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 23:35:24 +0200 (CEST)
Received: from localhost ([::1]:43732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmMeX-0006wo-P8
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 17:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nmMHJ-0005bF-9R; Wed, 04 May 2022 17:11:21 -0400
Received: from [187.72.171.209] (port=23462 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nmMHH-0000P9-Ew; Wed, 04 May 2022 17:11:20 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 4 May 2022 18:07:53 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id BDBF0800066;
 Wed,  4 May 2022 18:07:52 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, balaton@eik.bme.hu,
 victor.colombo@eldorado.org.br
Subject: [PATCH v4 21/22] target/ppc: Add unused msr bits FIELDs
Date: Wed,  4 May 2022 18:05:40 -0300
Message-Id: <20220504210541.115256-22-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504210541.115256-1-victor.colombo@eldorado.org.br>
References: <20220504210541.115256-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 May 2022 21:07:53.0183 (UTC)
 FILETIME=[04F206F0:01D85FFB]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

Add FIELDs macros for msr bits that had an unused msr_* before.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Acked-by: Richard Henderson <richard.henderson@linaro.org>

---

v4: Don't add a FIELD for MSR_DE anymore as it was already added
    in patch 20
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/cpu.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index af249239d5..4577cfcc23 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -354,16 +354,31 @@ typedef enum {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+FIELD(MSR, SF, MSR_SF, 1)
+FIELD(MSR, TAG, MSR_TAG, 1)
+FIELD(MSR, ISF, MSR_ISF, 1)
 #if defined(TARGET_PPC64)
 FIELD(MSR, HV, MSR_HV, 1)
 #define FIELD_EX64_HV(storage) FIELD_EX64(storage, MSR, HV)
 #else
 #define FIELD_EX64_HV(storage) 0
 #endif
+FIELD(MSR, TS0, MSR_TS0, 1)
+FIELD(MSR, TS1, MSR_TS1, 1)
 FIELD(MSR, TS, MSR_TS0, 2)
+FIELD(MSR, TM, MSR_TM, 1)
 FIELD(MSR, CM, MSR_CM, 1)
+FIELD(MSR, ICM, MSR_ICM, 1)
 FIELD(MSR, GS, MSR_GS, 1)
+FIELD(MSR, UCLE, MSR_UCLE, 1)
+FIELD(MSR, VR, MSR_VR, 1)
+FIELD(MSR, SPE, MSR_SPE, 1)
+FIELD(MSR, VSX, MSR_VSX, 1)
+FIELD(MSR, S, MSR_S, 1)
+FIELD(MSR, KEY, MSR_KEY, 1)
 FIELD(MSR, POW, MSR_POW, 1)
+FIELD(MSR, WE, MSR_WE, 1)
+FIELD(MSR, TGPR, MSR_TGPR, 1)
 FIELD(MSR, CE, MSR_CE, 1)
 FIELD(MSR, ILE, MSR_ILE, 1)
 FIELD(MSR, EE, MSR_EE, 1)
@@ -371,12 +386,22 @@ FIELD(MSR, PR, MSR_PR, 1)
 FIELD(MSR, FP, MSR_FP, 1)
 FIELD(MSR, ME, MSR_ME, 1)
 FIELD(MSR, FE0, MSR_FE0, 1)
+FIELD(MSR, SE, MSR_SE, 1)
+FIELD(MSR, DWE, MSR_DWE, 1)
+FIELD(MSR, UBLE, MSR_UBLE, 1)
+FIELD(MSR, BE, MSR_BE, 1)
 FIELD(MSR, DE, MSR_DE, 1)
 FIELD(MSR, FE1, MSR_FE1, 1)
+FIELD(MSR, AL, MSR_AL, 1)
 FIELD(MSR, EP, MSR_EP, 1)
 FIELD(MSR, IR, MSR_IR, 1)
 FIELD(MSR, DR, MSR_DR, 1)
+FIELD(MSR, IS, MSR_IS, 1)
 FIELD(MSR, DS, MSR_DS, 1)
+FIELD(MSR, PE, MSR_PE, 1)
+FIELD(MSR, PX, MSR_PX, 1)
+FIELD(MSR, PMM, MSR_PMM, 1)
+FIELD(MSR, RI, MSR_RI, 1)
 FIELD(MSR, LE, MSR_LE, 1)
 
 /*
-- 
2.25.1


