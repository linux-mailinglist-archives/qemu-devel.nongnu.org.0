Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A66AF634
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 08:56:13 +0200 (CEST)
Received: from localhost ([::1]:47054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7wXz-0003vd-T6
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 02:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40764)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i7wRb-0005wi-5a
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 02:49:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i7wRa-0004Kg-1Y
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 02:49:34 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:41833)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1i7wRZ-0004Jr-Py
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 02:49:33 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MQNAv-1hmGox1OCH-00MH9W; Wed, 11 Sep 2019 08:49:26 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Wed, 11 Sep 2019 08:49:07 +0200
Message-Id: <20190911064920.1718-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190911064920.1718-1-laurent@vivier.eu>
References: <20190911064920.1718-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UhOsa0Li3ZyDuFmsDVyrTCLiv2TPTPABsCgKe8F3x9i9OA/gwZ9
 vo06RmXRwf7uVchkxm5aXG9q0BsRImvXqf3YYoTBLvXQUQHjTrPM9ne0xswrJMcodq/Uhtf
 Tv2kfIy2PTN9AYoS663uR0+5Odd4+xw49C26ertwvCc4qbEEYH4h/Vl71cUSZmCBcabhdKO
 dmaSeX/cjQFTKTNS4PPbA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9pFxjYD9aoQ=:aH3Zo5CmoFyoORO/tWz+bD
 WWPkPj2z9y/K8DzYONkHBhWnT7jYmAjMRIKg3+FX0+J0qTS37GQgGF6Di2l8FO/j2aboRXXNR
 md9m3NBzUsTA2PhAfEt4DZcDdf4qHE8MeswkA7bp99MRqvQbWzdg1SsAkedU6/JkEWpUxZSfi
 YVpNW+2c3cSMfitCTiAKhXc4rZURRlm1XWFNo2sEz2lWkOgjtmCLUuNY3BuiYntaLuDFcgQvk
 1sk7XC3timCt0On/Rt+D3YeTn/Vzspg1yScFEgDgLzyaYmjQQCaHlfdhFPixPiQ2fx4YimBD8
 70Lh97J+r58w9alfpOBj3F6uoz8p12f2+ADRsTByoKl/Si/1g+KhBIoxk8j17Qf/On33jpLIA
 SG3wX69wB8b2e5wn0rU9/YNxZsPWYb4dJyVnT2O8OjA0sU3ZqvWGr8PFq79MymZZKVrSM4BSe
 c2/9ovOZr/xP+or5skr5LJkf/blfaPAldbNIvrkMUMf8ER0q+UUaDkxGF0MrHJfbZQN75gV66
 UAVbBYhyyJBfK86x+IXX2HH7LiBNlzBisT/RW/b3BGHDbv1VhdbzKRba0B3uHrppy/1DuBmEt
 jIDZVTUcpej5KATOB6oTlgSPQtqao1MfTdW2ok5u24hf6oTlwFCQjtQTkwjcay2wDSFIhIQnK
 M5ruflqlEqOms+X7/o6YzvvPy2RBb7VRgIa8xToc+plBWfONYhDid+5NMuZ4dioDtjUP86mp5
 OFFyNt2cg1YHmvbfPAtqCNcAEp6VKTazDzmP+iKfQTX1FyfkIW2hjtSw5EknXoGwbhybUxnoB
 HVHzqkFd8xFjttmQmx2X4Fj4QsY7EISXMD/blbtAIjUVzkMnJM=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: [Qemu-devel] [PULL v2 02/15] linux-user: Add AT_HWCAP2 for
 aarch64-linux-user
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
Cc: Max Filippov <jcmvbkbc@gmail.com>, Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Add the HWCAP2_* bits from kernel version v5.3-rc3.
Enable the bits corresponding to ARMv8.5-CondM and ARMv8.5-FRINT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20190809171156.3476-1-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 3365e192eb3f..43c16a846d33 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -607,9 +607,23 @@ enum {
     ARM_HWCAP_A64_SB            = 1 << 29,
     ARM_HWCAP_A64_PACA          = 1 << 30,
     ARM_HWCAP_A64_PACG          = 1UL << 31,
+
+    ARM_HWCAP2_A64_DCPODP       = 1 << 0,
+    ARM_HWCAP2_A64_SVE2         = 1 << 1,
+    ARM_HWCAP2_A64_SVEAES       = 1 << 2,
+    ARM_HWCAP2_A64_SVEPMULL     = 1 << 3,
+    ARM_HWCAP2_A64_SVEBITPERM   = 1 << 4,
+    ARM_HWCAP2_A64_SVESHA3      = 1 << 5,
+    ARM_HWCAP2_A64_SVESM4       = 1 << 6,
+    ARM_HWCAP2_A64_FLAGM2       = 1 << 7,
+    ARM_HWCAP2_A64_FRINT        = 1 << 8,
 };
 
-#define ELF_HWCAP get_elf_hwcap()
+#define ELF_HWCAP   get_elf_hwcap()
+#define ELF_HWCAP2  get_elf_hwcap2()
+
+#define GET_FEATURE_ID(feat, hwcap) \
+    do { if (cpu_isar_feature(feat, cpu)) { hwcaps |= hwcap; } } while (0)
 
 static uint32_t get_elf_hwcap(void)
 {
@@ -621,8 +635,6 @@ static uint32_t get_elf_hwcap(void)
     hwcaps |= ARM_HWCAP_A64_CPUID;
 
     /* probe for the extra features */
-#define GET_FEATURE_ID(feat, hwcap) \
-    do { if (cpu_isar_feature(feat, cpu)) { hwcaps |= hwcap; } } while (0)
 
     GET_FEATURE_ID(aa64_aes, ARM_HWCAP_A64_AES);
     GET_FEATURE_ID(aa64_pmull, ARM_HWCAP_A64_PMULL);
@@ -645,11 +657,22 @@ static uint32_t get_elf_hwcap(void)
     GET_FEATURE_ID(aa64_sb, ARM_HWCAP_A64_SB);
     GET_FEATURE_ID(aa64_condm_4, ARM_HWCAP_A64_FLAGM);
 
-#undef GET_FEATURE_ID
+    return hwcaps;
+}
+
+static uint32_t get_elf_hwcap2(void)
+{
+    ARMCPU *cpu = ARM_CPU(thread_cpu);
+    uint32_t hwcaps = 0;
+
+    GET_FEATURE_ID(aa64_condm_5, ARM_HWCAP2_A64_FLAGM2);
+    GET_FEATURE_ID(aa64_frint, ARM_HWCAP2_A64_FRINT);
 
     return hwcaps;
 }
 
+#undef GET_FEATURE_ID
+
 #endif /* not TARGET_AARCH64 */
 #endif /* TARGET_ARM */
 
-- 
2.21.0


