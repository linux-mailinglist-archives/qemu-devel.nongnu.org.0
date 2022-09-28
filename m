Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D014E5EE6D7
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:52:40 +0200 (CEST)
Received: from localhost ([::1]:59642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ode2p-0004Th-S3
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf7-0000nQ-Oc
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:09 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:49503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf5-0006Yz-J7
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:09 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MGzDv-1oRFKd3BTP-00E6DR; Wed, 28
 Sep 2022 22:28:00 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 29/37] linux-user: Set ELF_BASE_PLATFORM for MIPS
Date: Wed, 28 Sep 2022 22:27:29 +0200
Message-Id: <20220928202737.793171-30-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BaP8I+9To0VdoUT6VN1UoFC/nE8UF9sN4LEoPrLUsaDNazfjA/Z
 PvvcfD64krJFGYfcO8LsUqoG4uSskmDko0HbktlY9RhFFE0ThCF0moq9PfAO/lCoj491iZb
 6+ddaMQZKWOV2Q7IwoiHdLVtolcxqd2KVm41NUjxs6OrXzjXRCu+VYa9z2mmFjp8GYKe2D1
 kNPOUBhM/ltUHQpJmnpjw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:T53Ly6S6kx0=:CGvUBBRa5SBztbivxnfyJX
 SMlrg2yVReyzlg+uXtX9IbNmwk+upa8LI6fvarxQ87flpuWf181gmY+EPG0AxgSrtuDUgDs6d
 aWBqYfEpNb2SKYyLUXhTrnTNLLfyhp+hSl4twu5seRCo8J+lp7fi5sZsDl8HssMhqA+H9X8g9
 vsqjPXVEMmin6LaKRdB/0XPlAZQJzOJKXdKeRhqbkSBzzeq8fdZdAGNMoVPwKoJBKY5x9NlWS
 NiaiSddVDhXTQZDWJmd3DGNrDDCZV34NyHdEug5P521ddCdisx+388KcsJ8HFBbsMql3xvvE8
 93tm2UNsg4FIDua+IBIAFwnKuhSpge5vafKQ9dztk/HBDhFgO0crX1y1j0gTT0e61g2N0gQxl
 g3aZ0/ZajLDDnzMeNscNh/Cyri7pCVCPTdh2xsxUbzfdmjuT1Tl7YX5FRLeKPl2g0SDtV1+4G
 zoube5Zm1Ozqt76gzvfDaxA4ZaQ2Fx+82jORYwh6tUZ2Jk00GHepHFlZHEEfn8nX81gvsHA7A
 WLoaLHNW6R9TMH3CAG/GE6vJBlj4PNQTd/jdMARp9e9gK+ni9xanXtO6IRBR8zfVDUuWA7BB5
 tsngYeqtpMix0n1kQ72ddgMFyOvDRDJ9os9UUe5TwsY6QTUpaK1IuDgnXY0u5SFphZ/vfhiRE
 iFWVjy6PksK1yPUBsJVSrH1w7KMGVA55CgWhm7WuN+cru6KRT2iOj/emkHhTyUctQ7o2QYEOY
 uHp76xls4m6/kDUCrKIc5kTIPE50PpSGVBa+NXvk436/67U+7PTJr08ad1YWNK3i2ZRbUL8YO
 tO0Ta3w
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

Match most appropriate base platform string based on insn_flags.
Logic is aligned with aligned with set_isa() from
arch/mips/kernel/cpu-probe.c in Linux kernel.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220803103009.95972-3-jiaxun.yang@flygoat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 581fbc858b48..20894b633f58 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1080,6 +1080,37 @@ static uint32_t get_elf_hwcap(void)
 #define elf_check_abi(x) (!((x) & EF_MIPS_ABI2))
 #endif
 
+#define ELF_BASE_PLATFORM get_elf_base_platform()
+
+#define MATCH_PLATFORM_INSN(_flags, _base_platform)      \
+    do { if ((cpu->env.insn_flags & (_flags)) == _flags) \
+    { return _base_platform; } } while (0)
+
+static const char *get_elf_base_platform(void)
+{
+    MIPSCPU *cpu = MIPS_CPU(thread_cpu);
+
+    /* 64 bit ISAs goes first */
+    MATCH_PLATFORM_INSN(CPU_MIPS64R6, "mips64r6");
+    MATCH_PLATFORM_INSN(CPU_MIPS64R5, "mips64r5");
+    MATCH_PLATFORM_INSN(CPU_MIPS64R2, "mips64r2");
+    MATCH_PLATFORM_INSN(CPU_MIPS64R1, "mips64");
+    MATCH_PLATFORM_INSN(CPU_MIPS5, "mips5");
+    MATCH_PLATFORM_INSN(CPU_MIPS4, "mips4");
+    MATCH_PLATFORM_INSN(CPU_MIPS3, "mips3");
+
+    /* 32 bit ISAs */
+    MATCH_PLATFORM_INSN(CPU_MIPS32R6, "mips32r6");
+    MATCH_PLATFORM_INSN(CPU_MIPS32R5, "mips32r5");
+    MATCH_PLATFORM_INSN(CPU_MIPS32R2, "mips32r2");
+    MATCH_PLATFORM_INSN(CPU_MIPS32R1, "mips32");
+    MATCH_PLATFORM_INSN(CPU_MIPS2, "mips2");
+
+    /* Fallback */
+    return "mips";
+}
+#undef MATCH_PLATFORM_INSN
+
 static inline void init_thread(struct target_pt_regs *regs,
                                struct image_info *infop)
 {
-- 
2.37.3


