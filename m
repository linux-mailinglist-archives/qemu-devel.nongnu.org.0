Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0221638178B
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 12:17:38 +0200 (CEST)
Received: from localhost ([::1]:59876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhrMX-0007tb-0s
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 06:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9U-000698-P3; Sat, 15 May 2021 06:04:08 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:33203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9O-0006YV-Gp; Sat, 15 May 2021 06:04:08 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M1pk6-1lfeE337fM-002ENN; Sat, 15
 May 2021 12:03:51 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 16/16] target/avr: Ignore unimplemented WDR opcode
Date: Sat, 15 May 2021 12:03:35 +0200
Message-Id: <20210515100335.1245468-17-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515100335.1245468-1-laurent@vivier.eu>
References: <20210515100335.1245468-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:i06N6m7JyLmbOggG2+TVbhyyVRkybY8PRAvNcbygmUX8PJbPD6T
 2s3YioRSVz2LOstK0q6BeHrNdqJ6s2cEj+T4dTFwRsNq4NSpSPJrCVyLXwy4TK9se/Z/Hsi
 MAsr3PFMTJPdortH2g0O4v70Odk7jCHi+HpTxxnkK8U7y9Rhcp2vFccdRjhJeq5Lo9yHI7g
 RZwQbRMWMT0V1gWiOPclA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hihcMfQ5ZBc=:Y0pgcOLDbqedxBBwgvSzhQ
 zYNKbID/VYVcr1X42UF43F9LX64VjX/IHobtEQhNnCQtY7WHBvjShf4HAEZG2eXYJOiCWLKdL
 VBVPGH5ypqEg8Q032+AyzxbLz+YoGPQU8/r4x3pysRktnnIp40KRWzPCBcz/Wcy6GQvQDiA9B
 FbNcPSjshlGysUhHVElY5x8syXfWd1pLba+CTloG37Ufx1zP4mYvM7i7mA94v97rYr4DJ/9J9
 5vB4f8brgwqrwVSuO3KfKBV1dJMPwI4vFYJfPugJHGU/9mmCQoDY4kpM/35jhcIhKMWSK4/Op
 RR6if0+Es7VwzxuKDmvkqvdsTY7NJ7sVxIuu1W5HM2XfmrTu+NSnHViAxgC6tHjOp0LT2nCOW
 tOcS/xG0kfeIJhZ+hUm7oxX9NxC4Q/Xo6kfmP+MpWVLUGMqG7ssZ8Rona0ut1luYEbkZ4iMGB
 MKa1hxOBr3eF1hWDIPEzP7JORHzoqURlePrqpj1C86ZWFpb83KiC3vXc7BzDDwKURT/y1Q21M
 IAVdZ/a9ZMPsSybMJI5ZxQ=
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Fred Konrad <konrad@adacore.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Running the WDR opcode triggers a segfault:

  $ cat > foo.S << EOF
  > __start:
  >     wdr
  > EOF
  $ avr-gcc -nostdlib -nostartfiles -mmcu=avr6 foo.S -o foo.elf
  $ qemu-system-avr -serial mon:stdio -nographic -no-reboot \
    -M mega -bios foo.elf -d in_asm --singlestep
  IN:
  0x00000000:  WDR
  Segmentation fault (core dumped)

  (gdb) bt
     #0  0x00005555add0b23a in gdb_get_cpu_pid (cpu=0x5555af5a4af0) at ../gdbstub.c:718
     #1  0x00005555add0b2dd in gdb_get_cpu_process (cpu=0x5555af5a4af0) at ../gdbstub.c:743
     #2  0x00005555add0e477 in gdb_set_stop_cpu (cpu=0x5555af5a4af0) at ../gdbstub.c:2742
     #3  0x00005555adc99b96 in cpu_handle_guest_debug (cpu=0x5555af5a4af0) at ../softmmu/cpus.c:306
     #4  0x00005555adcc66ab in rr_cpu_thread_fn (arg=0x5555af5a4af0) at ../accel/tcg/tcg-accel-ops-rr.c:224
     #5  0x00005555adefaf12 in qemu_thread_start (args=0x5555af5d9870) at ../util/qemu-thread-posix.c:521
     #6  0x00007f692d940ea5 in start_thread () from /lib64/libpthread.so.0
     #7  0x00007f692d6699fd in clone () from /lib64/libc.so.6

Since the watchdog peripheral is not implemented, simply
log the opcode as unimplemented and keep going.

Reported-by: Fred Konrad <konrad@adacore.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>
Message-Id: <20210502190900.604292-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/avr/helper.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/avr/helper.c b/target/avr/helper.c
index 35e101959404..981c29da4535 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -188,11 +188,7 @@ void helper_break(CPUAVRState *env)
 
 void helper_wdr(CPUAVRState *env)
 {
-    CPUState *cs = env_cpu(env);
-
-    /* WD is not implemented yet, placeholder */
-    cs->exception_index = EXCP_DEBUG;
-    cpu_loop_exit(cs);
+    qemu_log_mask(LOG_UNIMP, "WDG reset (not implemented)\n");
 }
 
 /*
-- 
2.31.1


