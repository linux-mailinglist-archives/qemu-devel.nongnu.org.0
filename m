Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0E040DC9F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 16:21:56 +0200 (CEST)
Received: from localhost ([::1]:47502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQsGy-0007D7-0A
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 10:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQs6J-0000dp-4b; Thu, 16 Sep 2021 10:10:56 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:32837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQs6D-0005zb-HX; Thu, 16 Sep 2021 10:10:52 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MysFQ-1mmNFk1wzi-00vwV9; Thu, 16
 Sep 2021 16:10:38 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 10/10] target/sparc: Make sparc_cpu_dump_state() static
Date: Thu, 16 Sep 2021 16:10:26 +0200
Message-Id: <20210916141026.1174822-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916141026.1174822-1-laurent@vivier.eu>
References: <20210916141026.1174822-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:diivNTPMv+cTN/boy9Azc/F6yegMMnjFXsXplk8BROYlbdbFjjA
 ACv7HHVcpod8PLJqT3eQ9XUc0MCbvjLpvZHF7JzIU92JfY9eO3qVFItj7EsN3RWdjSTZII6
 f7N+k4auXGn670tGK7YGnG4472RzgLHc0WLWTqaKbSTdrwoJdUoX07yLzipb1NuKHzKLVwe
 p+HVGLEP2I/P9XWjgWS6g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oXNzOEwwRMI=:y08SQ7tVQ+dqdP0fob/Mlf
 G+iUBCa/RF6OAF+LOJkQbegunE05qzGNQgVRrtbZEz2nv5OtIsHNC/1XkDTaMkAMvVCLnNyk3
 rurOoOQKfYR7EdUA+aQYflECkRQbWT+p6qwLg74F5DIAtg9mGAPXz60hYYRyzfPLhR0CK/j5y
 qW+n8LMJYVIuAxCRhDGRkwD+TOj0KYJeGgZQ6x9BwPpEiFmY5mccAvpiAyzU4NFf+puKL45bv
 Ez4aX93fEPCA5EImqw75v/lKg0uwLZgo5/GbEHL1sFMjhKXjg04LhDfVsWOUDTA3gdBD8Ok5f
 3KUMRU7O5w8fWRk0u9n4H4neTfzp+efg3Qaw0cKPrCniT+S81aXaTu6Hz6VZMLjwDoUTW/1Om
 vkdVkUTcA/wBg3d/6tUSTbhWLXWj3BT69iewUWn1uZqRDpHy3wkVjYzy941xfoTpD2hhx+CxY
 bG+2tuVhKCffVAjeRMH3jBS8VnOKS9w6t36ECx+zvhlzmN4UN5Z0D3E/lRFnq80hkHmm1xIE8
 zwTnpR5B+wOa1sypQnSwayctxfecBWGj8y9LNl67bSbGsJOtSoSScjoGVnHjcQjpbMzFNmMVO
 CDyBrHlfSvv/v4L9to6VK2cECGlPzJR0dqQVgqnceFyRMwpugxb2CtWpFGaYJIQ67WkgMxRaF
 AOwKF48yjA8rpRYpTyQxVvjT7VK5yeoX6hEmGtn9pzFBM3swl/dvYNjBO7O8pKIGjZOkYLbbg
 CXgOSBn5iIgOz7d8MTfbNcicFuEk7ZvAup+iqg==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The sparc_cpu_dump_state() function is only called within
the same file. Make it static.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20210916084002.1918445-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/sparc/cpu.c | 2 +-
 target/sparc/cpu.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index da6b30ec747a..2bf67fb99d60 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -610,7 +610,7 @@ static void cpu_print_cc(FILE *f, uint32_t cc)
 #define REGS_PER_LINE 8
 #endif
 
-void sparc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+static void sparc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     SPARCCPU *cpu = SPARC_CPU(cs);
     CPUSPARCState *env = &cpu->env;
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index ff8ae73002a3..1f40d768d8b5 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -571,7 +571,6 @@ extern const VMStateDescription vmstate_sparc_cpu;
 #endif
 
 void sparc_cpu_do_interrupt(CPUState *cpu);
-void sparc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr sparc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int sparc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int sparc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-- 
2.31.1


