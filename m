Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F01150C058
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 21:26:23 +0200 (CEST)
Received: from localhost ([::1]:37914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhyv7-0002jL-Oj
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 15:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nhyTm-0008P5-6X; Fri, 22 Apr 2022 14:58:06 -0400
Received: from [187.72.171.209] (port=45652 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nhyTk-0000lo-Oo; Fri, 22 Apr 2022 14:58:05 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 22 Apr 2022 15:54:56 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id C73EB80031F;
 Fri, 22 Apr 2022 15:54:55 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 20/20] target/ppc: Add unused M_MSR_* macros
Date: Fri, 22 Apr 2022 15:54:50 -0300
Message-Id: <20220422185450.107256-21-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
References: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Apr 2022 18:54:56.0077 (UTC)
 FILETIME=[75433FD0:01D8567A]
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 victor.colombo@eldorado.org.br, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add M_MSR_* macros for msr bits that had an unused msr_* before.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/cpu.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 3cbecc96d8..dda289a121 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -353,6 +353,9 @@ typedef enum {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+#define M_MSR_SF (1ull << MSR_SF)
+#define M_MSR_TAG (1ull << MSR_TAG)
+#define M_MSR_ISF (1ull << MSR_ISF)
 #if defined(TARGET_PPC64)
 #define M_MSR_HV (1ull << MSR_HV)
 #else
@@ -360,10 +363,20 @@ typedef enum {
 #endif
 #define M_MSR_TS0 (1ull << MSR_TS0)
 #define M_MSR_TS1 (1ull << MSR_TS1)
+#define M_MSR_TM (1ull << MSR_TM)
 #define M_MSR_TS (M_MSR_TS0 | M_MSR_TS1)
 #define M_MSR_CM (1ull << MSR_CM)
+#define M_MSR_ICM (1ull << MSR_ICM)
 #define M_MSR_GS (1ull << MSR_GS)
+#define M_MSR_UCLE (1ull << MSR_UCLE)
+#define M_MSR_VR (1ull << MSR_VR)
+#define M_MSR_SPE (1ull << MSR_SPE)
+#define M_MSR_VSX (1ull << MSR_VSX)
+#define M_MSR_S (1ull << MSR_S)
+#define M_MSR_KEY (1ull << MSR_KEY)
 #define M_MSR_POW (1ull << MSR_POW)
+#define M_MSR_WE (1ull << MSR_WE)
+#define M_MSR_TGPR (1ull << MSR_TGPR)
 #define M_MSR_CE (1ull << MSR_CE)
 #define M_MSR_ILE (1ull << MSR_ILE)
 #define M_MSR_EE (1ull << MSR_EE)
@@ -373,10 +386,21 @@ typedef enum {
 #define M_MSR_FE0 (1ull << MSR_FE0)
 #define M_MSR_FE1 (1ull << MSR_FE1)
 #define M_MSR_FE (M_MSR_FE0 | M_MSR_FE1)
+#define M_MSR_SE (1ull << MSR_SE)
+#define M_MSR_DWE (1ull << MSR_DWE)
+#define M_MSR_UBLE (1ull << MSR_UBLE)
+#define M_MSR_BE (1ull << MSR_BE)
+#define M_MSR_DE (1ull << MSR_DE)
+#define M_MSR_AL (1ull << MSR_AL)
 #define M_MSR_EP (1ull << MSR_EP)
 #define M_MSR_IR (1ull << MSR_IR)
 #define M_MSR_DR (1ull << MSR_DR)
+#define M_MSR_IS (1ull << MSR_IS)
 #define M_MSR_DS (1ull << MSR_DS)
+#define M_MSR_PE (1ull << MSR_PE)
+#define M_MSR_PX (1ull << MSR_PX)
+#define M_MSR_PMM (1ull << MSR_PMM)
+#define M_MSR_RI (1ull << MSR_RI)
 #define M_MSR_LE (1ull << MSR_LE)
 
 /* PMU bits */
-- 
2.25.1


