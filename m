Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B320A3E2719
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 11:19:39 +0200 (CEST)
Received: from localhost ([::1]:57566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBw0w-0006OO-Qq
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 05:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mBvyj-0002ve-UX
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 05:17:21 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:55091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mBvyh-0005AV-Ti
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 05:17:21 -0400
Received: from quad ([82.142.6.46]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mq2za-1mygri2Ol0-00nCuB; Fri, 06
 Aug 2021 11:17:12 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] linux-user/elfload: byteswap i386 registers when dumping
 core
Date: Fri,  6 Aug 2021 11:17:09 +0200
Message-Id: <20210806091709.2465239-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210806091709.2465239-1-laurent@vivier.eu>
References: <20210806091709.2465239-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZW4AKMPGmn7bEQSOojYrJu32YF8rJ8PrQvKU6uCVik5227dQ3PT
 +IbTTOj4XuuPg8wYD0dOGdobyhpSSEHKX+G/FaVZQ4PY8edL075+PDCuYUu9twIJK3Nf3GX
 1j/jvW/++YDe/wrHuUiOIS+8Ot9KXkxqZezaR2M649eqTePdhN/MAu5aJFciKHO15sKAZcp
 haAADWhJFra90+yYXpv0g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dw1q8ZuVlXo=:138F6xG+SaWIwbAsHH0zSk
 0xoJivTJnJvmtPsbO/QyvDQNtlx8fgiK6YVjFvLL5np1Ig+cx7xNGoyTb93zA1jg3ltCMXVFC
 jWp5duE0xl29tSkg1oe3mMLOq6xzShl0C1vgJsb9q48a2Z7lFUBYpCpKtqSG33YEWZcm2iwQ4
 Co19zHJIEbZ2yNVCmFIy9cnOPvvXlfpT5SEnnySWE3Ca28Pod3IHOHJXpnFKu5j75sDaTSAFX
 3no+BNjO/TCxfM+WQqphGSKKoYwCGmQw30txvnqhPOOay7VAvO/rqq5rw9czPFrQmRE+8Mp3e
 /Lz2VcWotPbPIeGfSnGpMdsHu6xQDXlH96tZDFVZyxFK0+9M0mN5pthC+uAYhU4uLh6Yt5rAA
 kgi0G80tPVVP4pGrw4rnhxOSy+DJ7fljI6sZXQe+SpfMZ5y2S3KwlOFxxBOpLN3ICSR9m0oQ4
 sl5lD3GPRp8kJqt84H02yjmOvePQE4v0WwBObWq5twbl7R1iA9cTryp5iMWOS5GTZZMuWsvwC
 2LIUuGnNIOb1Lt1yAupHEu5diyH0IExQ5fCrtmv5v9l8aBTZbbH+RmSfVD9V9cLK6gPGrj4gF
 vaC4W+Uf3gvk2XLGWfvqOVOHmgUAeHgX0LM3/ecRuHpHzt7rrBzFSyQ256c3qyoW0dQ04Ysfy
 JY/9I7L9YHLfavUc2IizaApZ+t/wSM/phbJnTuRWAyHP5RjQqMIW9tlf6CEFgF59tIQJbnLvw
 /GN6USwhmpn/zq6FNKHtoWcKhj2XzE7QpbId+B1LtAL/8oH56YwI/q9p71hTh+JhlrHkibB27
 aS9tLybO/07X0UssiYMEWWJqQxKUT/21OiWU5LlHCcPPtJDI+3p7spk1WjNwxxbHa5VdAxv
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

Core dumps from emulating x86_64 on big-endian hosts contain incorrect
register values.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210803172013.148446-1-iii@linux.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 88 ++++++++++++++++++++++----------------------
 1 file changed, 44 insertions(+), 44 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 42ef2a114855..01e9a833fbb6 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -172,33 +172,33 @@ typedef target_elf_greg_t  target_elf_gregset_t[ELF_NREG];
  */
 static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUX86State *env)
 {
-    (*regs)[0] = env->regs[15];
-    (*regs)[1] = env->regs[14];
-    (*regs)[2] = env->regs[13];
-    (*regs)[3] = env->regs[12];
-    (*regs)[4] = env->regs[R_EBP];
-    (*regs)[5] = env->regs[R_EBX];
-    (*regs)[6] = env->regs[11];
-    (*regs)[7] = env->regs[10];
-    (*regs)[8] = env->regs[9];
-    (*regs)[9] = env->regs[8];
-    (*regs)[10] = env->regs[R_EAX];
-    (*regs)[11] = env->regs[R_ECX];
-    (*regs)[12] = env->regs[R_EDX];
-    (*regs)[13] = env->regs[R_ESI];
-    (*regs)[14] = env->regs[R_EDI];
-    (*regs)[15] = env->regs[R_EAX]; /* XXX */
-    (*regs)[16] = env->eip;
-    (*regs)[17] = env->segs[R_CS].selector & 0xffff;
-    (*regs)[18] = env->eflags;
-    (*regs)[19] = env->regs[R_ESP];
-    (*regs)[20] = env->segs[R_SS].selector & 0xffff;
-    (*regs)[21] = env->segs[R_FS].selector & 0xffff;
-    (*regs)[22] = env->segs[R_GS].selector & 0xffff;
-    (*regs)[23] = env->segs[R_DS].selector & 0xffff;
-    (*regs)[24] = env->segs[R_ES].selector & 0xffff;
-    (*regs)[25] = env->segs[R_FS].selector & 0xffff;
-    (*regs)[26] = env->segs[R_GS].selector & 0xffff;
+    (*regs)[0] = tswapreg(env->regs[15]);
+    (*regs)[1] = tswapreg(env->regs[14]);
+    (*regs)[2] = tswapreg(env->regs[13]);
+    (*regs)[3] = tswapreg(env->regs[12]);
+    (*regs)[4] = tswapreg(env->regs[R_EBP]);
+    (*regs)[5] = tswapreg(env->regs[R_EBX]);
+    (*regs)[6] = tswapreg(env->regs[11]);
+    (*regs)[7] = tswapreg(env->regs[10]);
+    (*regs)[8] = tswapreg(env->regs[9]);
+    (*regs)[9] = tswapreg(env->regs[8]);
+    (*regs)[10] = tswapreg(env->regs[R_EAX]);
+    (*regs)[11] = tswapreg(env->regs[R_ECX]);
+    (*regs)[12] = tswapreg(env->regs[R_EDX]);
+    (*regs)[13] = tswapreg(env->regs[R_ESI]);
+    (*regs)[14] = tswapreg(env->regs[R_EDI]);
+    (*regs)[15] = tswapreg(env->regs[R_EAX]); /* XXX */
+    (*regs)[16] = tswapreg(env->eip);
+    (*regs)[17] = tswapreg(env->segs[R_CS].selector & 0xffff);
+    (*regs)[18] = tswapreg(env->eflags);
+    (*regs)[19] = tswapreg(env->regs[R_ESP]);
+    (*regs)[20] = tswapreg(env->segs[R_SS].selector & 0xffff);
+    (*regs)[21] = tswapreg(env->segs[R_FS].selector & 0xffff);
+    (*regs)[22] = tswapreg(env->segs[R_GS].selector & 0xffff);
+    (*regs)[23] = tswapreg(env->segs[R_DS].selector & 0xffff);
+    (*regs)[24] = tswapreg(env->segs[R_ES].selector & 0xffff);
+    (*regs)[25] = tswapreg(env->segs[R_FS].selector & 0xffff);
+    (*regs)[26] = tswapreg(env->segs[R_GS].selector & 0xffff);
 }
 
 #else
@@ -244,23 +244,23 @@ typedef target_elf_greg_t  target_elf_gregset_t[ELF_NREG];
  */
 static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUX86State *env)
 {
-    (*regs)[0] = env->regs[R_EBX];
-    (*regs)[1] = env->regs[R_ECX];
-    (*regs)[2] = env->regs[R_EDX];
-    (*regs)[3] = env->regs[R_ESI];
-    (*regs)[4] = env->regs[R_EDI];
-    (*regs)[5] = env->regs[R_EBP];
-    (*regs)[6] = env->regs[R_EAX];
-    (*regs)[7] = env->segs[R_DS].selector & 0xffff;
-    (*regs)[8] = env->segs[R_ES].selector & 0xffff;
-    (*regs)[9] = env->segs[R_FS].selector & 0xffff;
-    (*regs)[10] = env->segs[R_GS].selector & 0xffff;
-    (*regs)[11] = env->regs[R_EAX]; /* XXX */
-    (*regs)[12] = env->eip;
-    (*regs)[13] = env->segs[R_CS].selector & 0xffff;
-    (*regs)[14] = env->eflags;
-    (*regs)[15] = env->regs[R_ESP];
-    (*regs)[16] = env->segs[R_SS].selector & 0xffff;
+    (*regs)[0] = tswapreg(env->regs[R_EBX]);
+    (*regs)[1] = tswapreg(env->regs[R_ECX]);
+    (*regs)[2] = tswapreg(env->regs[R_EDX]);
+    (*regs)[3] = tswapreg(env->regs[R_ESI]);
+    (*regs)[4] = tswapreg(env->regs[R_EDI]);
+    (*regs)[5] = tswapreg(env->regs[R_EBP]);
+    (*regs)[6] = tswapreg(env->regs[R_EAX]);
+    (*regs)[7] = tswapreg(env->segs[R_DS].selector & 0xffff);
+    (*regs)[8] = tswapreg(env->segs[R_ES].selector & 0xffff);
+    (*regs)[9] = tswapreg(env->segs[R_FS].selector & 0xffff);
+    (*regs)[10] = tswapreg(env->segs[R_GS].selector & 0xffff);
+    (*regs)[11] = tswapreg(env->regs[R_EAX]); /* XXX */
+    (*regs)[12] = tswapreg(env->eip);
+    (*regs)[13] = tswapreg(env->segs[R_CS].selector & 0xffff);
+    (*regs)[14] = tswapreg(env->eflags);
+    (*regs)[15] = tswapreg(env->regs[R_ESP]);
+    (*regs)[16] = tswapreg(env->segs[R_SS].selector & 0xffff);
 }
 #endif
 
-- 
2.31.1


