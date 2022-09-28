Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 780F25EDBBA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 13:26:44 +0200 (CEST)
Received: from localhost ([::1]:46456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odVD9-0005lq-Hl
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 07:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEP-0008Fd-Fo
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:53 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:48621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEL-0008IW-Cf
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:48 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mo7if-1p2fpW3vKN-00pbgn; Wed, 28
 Sep 2022 10:15:34 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 29/38] linux-user: Set ELF_BASE_PLATFORM for MIPS
Date: Wed, 28 Sep 2022 10:15:08 +0200
Message-Id: <20220928081517.734954-30-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lgaKoIHZWxB3rJzYbmezEhyHyNWXd6l8BaSBVeYOgmv5e6/q8Ar
 0LQK1smlGwOwhcTYFq3sP9wX8wUw9//5SXcBxXAYyRKXEf7FB2Rui8szaHAv99OqlDADohd
 oiCLuxtVIAx/sGpSTWkMivt5hKQyOSH8iRA6mRA3T8VTY007qY1sPfejRW6ddhVUOm9XDfK
 moEXUCb7x/l6bHZvJjzEg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GXWJgHAUvxQ=:IFIYVTMyry6I0lQjud6HQl
 cWvWMZuZkJttnBEd148gc43wwGo3PWbSnl5a3usSlGRpOqu8upPzHLjmM1o0Vfu2Jlo8hh/4I
 uq9XUzHihsc0Lhsnqslvr6pBsiWUHJad9suc8Sx66n1m9Qaa2SIHOtsORuBGSW76VIOGtZD9i
 XKgEZ6MiCfX+LvMFMWgchXsxXGJUuF1VvJod3ieBsYMRLnVQD5eZ9W/ZkyhOpx2JIMe7RY6p7
 JCfKZoo7nwKWc9CxJzxot11KBwm7sIqphqTKbG0zVrLRVI9jQrpo7XcOOmhFkdB0F0PoTR4xF
 ebCDYJbrt76uYZ+sHBk+P3v+Uhn2r+ABjNS8jr+2uZurv+6cJ66wljYE9sjGS30orQ7LnH/M9
 le6AI9/E/lKj1WNaYs+S4rWsf58YDIeQgPhvW3FclhYgbsw5GSTjqbBGhmGT/PD5vFqDPc3Sc
 od1+gcUdGPBb1Q+VhY74ZoG95P732qEE0uiHmcfGVXUxv6RnHxwM53twCi9Xg/0Vza/YIOw6Y
 W0JTI4QwxWJ/4hvd8fYHwhYW9q4EgOdJmRJRYswqxmn7VHWyGgKTXn+QJ8wZZp8+f8l1C0l1l
 7JS6HLuP5c1v9SR9mq3Fs4fsZg6p3z4JgODbi5B1+DrUjMH5UdvJfqpTPeekM3z5GWoo7DSfi
 FpM48m5pgkTXGfbm/MFehLhsYeYgEIL8skTOIIztt4c6Bd3Ifhebb/Q31FYgJMFpoyoe+63VJ
 ZpKHsA120SZvQWgPp6a28VD++Oa1Urpe3KcRJWIezG5Ib8n9Pj493zNf0ZNYUwigWr9EZZtl2
 +vDaP3g
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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


