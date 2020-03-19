Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28AB18B044
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Mar 2020 10:31:13 +0100 (CET)
Received: from localhost ([::1]:35298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jErWC-0005LK-QY
	for lists+qemu-devel@lfdr.de; Thu, 19 Mar 2020 05:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40873)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jErRv-0005MP-MG
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 05:26:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jErRu-0004Cx-GW
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 05:26:47 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:35299)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1jErRu-0004Cd-7J
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 05:26:46 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MF2YC-1j3nlt19fk-00FR61; Thu, 19 Mar 2020 10:26:37 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL v3 09/16] linux-user: Update TASK_UNMAPPED_BASE for aarch64
Date: Thu, 19 Mar 2020 10:26:20 +0100
Message-Id: <20200319092627.51487-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200319092627.51487-1-laurent@vivier.eu>
References: <20200319092627.51487-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IGmL+8UbZ90+Uaal3vT715lrRDQg8cicjsPVKzzM+5RAfBrIlwk
 ZFA6FnWqFJr3XFs87rlYYnQkFx6lWyIKJU4sN7AO0ON/k3qYdi1tn0qnBhAbg6xHkqZwvsx
 U5nxJVB7nioyX164RSdLY49JLCR7vqwYlhQugYo7yr0xInmk/i1MS+TT8q2QIf3NL7dVCi/
 56CzJJoysDgp4lTxisamQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IyHZQ8bPvPg=:peOn06G944QaknQMFfiKd1
 tiF3R9njNTSBXuz8TW1JHRIKR/4y0WLQLoXsnSf9Uu5lNhJICXIqslbQbID9X7ozlfRu7Ayjh
 cmj6ihS7gkv8slj7xhkGs1BuskMA6YJo2x/rx9nWleXBpzq3DcrwKfZHGLj7dCbReSZTBKoha
 zaQ/9YVhppNodjTiPXBvTShS1YrZEpUIAGnSU0DSccG0jOgz1O9xigByMiF1cFefAp1nRCTre
 lZ0iTJK+Px7J7UAyF7XfawcFEOrvkLk4awkBS/x82HQcVZyLL6PkFHe85OLOBB+ud1SxsflCp
 6EXMzImdtAu++kUau2Y57SO6QD63Qtox6KovvtyffYk8aPXABRT4zVckzW4S0EQd8St18hwg7
 hkzY3OTyfeIwTvB2bkGVSQhYxirDZVmkHcbraI/KOswY4QRzUDSMWvkeSMad2DDehxKr+tiBi
 IFpcmFn+Gr4dJL+LpbxyxHQdTQlRfOQuCxOzjPywLG5iRlOD//yNmU79yrpAc6KjCet/EWBan
 47eh2B4mNkI223OksViW1T4HX1lPnELsf3c5KkTAfnCVvCsygePc3B5dTUmI/9yL1JAhMQpet
 nodNWLwzVYzUqNdG2NlbojF/uDTyJDtBc22mVZSEoDhHQTG1cXv7gXFAz1NOFv7V9kY/Bryt0
 umlToiwzt2XajxvLkEjzvq1P3DNRYSzNMC7XRQdyB1OhCnbiv0DuulLNZidsVQNdIFMvGtEP8
 2Sg7Thw7vykA61UVQ2DAbWBb42smcztja1jTAjgqAC22hCIRnOgruTyf0pdmo00CtkZ2vQ8Vl
 uCLXBWEAITKYDHJaQVSxdVY+AvZHGm1Cae2ZKE1jvV1wkFBboB3OM/ghOOmtCvM0JfKWkMW
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 Lirong Yuan <yuanzi@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lirong Yuan <yuanzi@google.com>

This change updates TASK_UNMAPPED_BASE (the base address for guest programs) for aarch64. It is needed to allow qemu to work with Thread Sanitizer (TSan), which has specific boundary definitions for memory mappings on different platforms:
https://github.com/llvm/llvm-project/blob/master/compiler-rt/lib/tsan/rtl/tsan_platform.h

Signed-off-by: Lirong Yuan <yuanzi@google.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20200313002813.3857-1-yuanzi@google.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mmap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 8685f02e7e90..e37803379747 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -184,7 +184,11 @@ static int mmap_frag(abi_ulong real_start,
 }
 
 #if HOST_LONG_BITS == 64 && TARGET_ABI_BITS == 64
+#ifdef TARGET_AARCH64
+# define TASK_UNMAPPED_BASE  0x5500000000
+#else
 # define TASK_UNMAPPED_BASE  (1ul << 38)
+#endif
 #else
 # define TASK_UNMAPPED_BASE  0x40000000
 #endif
-- 
2.25.1


