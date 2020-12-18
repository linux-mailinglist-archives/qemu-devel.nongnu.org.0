Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E1E2DE0F3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:26:31 +0100 (CET)
Received: from localhost ([::1]:47418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqCxy-0004hx-PD
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:26:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvr-0002tC-6O
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:19 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:52191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvo-00073c-EB
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:18 -0500
Received: from localhost.localdomain ([82.252.144.198]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N4z2Y-1k754R38WS-010uZs; Fri, 18 Dec 2020 11:24:11 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 03/14] linux-user/elfload: Rename MIPS GET_FEATURE() as
 GET_FEATURE_INSN()
Date: Fri, 18 Dec 2020 11:23:56 +0100
Message-Id: <20201218102407.597566-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218102407.597566-1-laurent@vivier.eu>
References: <20201218102407.597566-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ozIWymysu2b10QE1Xj6hzHT+bLvPImC378C+coVVOdm0hoKj87A
 ABqdI3jxwPCpr551EaoIVEayq9MwqPF4iXrDkReWFxb+/gO9IJ1H5iZ4lkM0Wh4JUQX3bl6
 ch7fCbiwbatiW8PPo6XKGz4UaKOvYtpuqGKDTc2RJ0iwfOTnsvKojk1KS9TGIvkRvKEZ4GD
 oNPSRKWPN6VN6ZPZ+b9rA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VMRNR7rPNmc=:XAQMRi69kHD331oazPw8MC
 gDIudi2V1AcM+RQhH6fJNPTS/asALrz7Bz0zYQmEP2OOlpPcXJvsVvlGiwX+9O4LZCmtKpw/0
 JGRVebeRExqgwCGXMId5gfDEOIZyw9Hf01C0XkyM8K4wplqR4i8L1HkXkynpNAuK4fK03yq6g
 rJfmOMYoqJm5QvTs0LKpWHpRPo5KcRMRsaqdQFl6tKtWFvEYnn3qBscv6y7Fd1Exhwqv6OtkE
 U8IEUe58JywXYOYZRb/KR/XZpRJPzSG4dEQINoxuckwa/rh4PvUQXeIQOdlnLjO7Lc+mK7rlw
 e4pwNcSk4s68fMZjFFqCJX6uRsQrrVFQ2oNkFRN6TC1ik+i5jq3jX+7fVD7QP1jN9Q1NHwefW
 sj0p+hTWCIwsMhk3HHnTm92mcf1D0PS3PgHZqLtX4lNSn8rP6zeWUwmIcT7mwA0DGIpr/+aRI
 ibXwfVzrFA==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We want to add macros similar to GET_FEATURE().
As this one use the 'insn_flags' field, rename it
GET_FEATURE_INSN().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201214003215.344522-3-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index aae28fd929dc..0e1d7e7677c8 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -989,7 +989,7 @@ enum {
 
 #define ELF_HWCAP get_elf_hwcap()
 
-#define GET_FEATURE(_flag, _hwcap) \
+#define GET_FEATURE_INSN(_flag, _hwcap) \
     do { if (cpu->env.insn_flags & (_flag)) { hwcaps |= _hwcap; } } while (0)
 
 static uint32_t get_elf_hwcap(void)
@@ -997,13 +997,13 @@ static uint32_t get_elf_hwcap(void)
     MIPSCPU *cpu = MIPS_CPU(thread_cpu);
     uint32_t hwcaps = 0;
 
-    GET_FEATURE(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
-    GET_FEATURE(ASE_MSA, HWCAP_MIPS_MSA);
+    GET_FEATURE_INSN(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
+    GET_FEATURE_INSN(ASE_MSA, HWCAP_MIPS_MSA);
 
     return hwcaps;
 }
 
-#undef GET_FEATURE
+#undef GET_FEATURE_INSN
 
 #endif /* TARGET_MIPS */
 
-- 
2.29.2


