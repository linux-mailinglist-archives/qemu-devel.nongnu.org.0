Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC19458A8A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 09:27:07 +0100 (CET)
Received: from localhost ([::1]:49122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp4fK-00046I-BB
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 03:27:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mp4bf-0001Wz-4v
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:23:22 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:38105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mp4bd-000354-8d
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:23:18 -0500
Received: from quad ([82.142.2.234]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MPGBR-1n0p5z1UC5-00Pap6; Mon, 22
 Nov 2021 09:23:14 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] linux-user: fix Coverity CID 1464101
Date: Mon, 22 Nov 2021 09:23:10 +0100
Message-Id: <20211122082310.377809-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211122082310.377809-1-laurent@vivier.eu>
References: <20211122082310.377809-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:M0NwFABYOZ+kuhQksvzyQpV6OwfWHum8pzbXebQJ+Jg3u5ihl7M
 hvrWBl/8aE59V7KWigBSBrrMb0z/PTqZyeRjjDInyASdV9qpnPjBl0jQg5MxnGxjZV1CFn8
 QXXblR2MDQM+X9dSq9dbuegNTaYahwZmFwVp0GVuj6F4Eg65ktgWreume7IklVsIAezUpBo
 qTtGRyMmc/dwnWI89GI5Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:67n4UorLf9M=:LlcD0wQT0ko/Ru6VO3EQRq
 afC8ibZpK7oeDhB12CDRiF856LdEzg3lqziASs5BKRSFkof2fHOCbAOn9aRog60bQcoPbXkDy
 06SD2J0rAgjc2zoG2fxmAAn3p7/+g1QV0FQAso8t/eRy1tMGxcLNTMeYk7cCukXT7F3vDHTOz
 c5DFuGk9dcJjFW4JJYP4ttSNBvMIwBUNYsY1k/8HQj2klKn5y32D+g/wUsOphLVcyz3DxFSsU
 m72e/yv4mGUOggjyEKf3gLdybgzrlFJ4gSMzIwxGIj+DbqvdmeF8jxtNT0VR3DHIES08ITLea
 FUxxhABfYnxUf5Xq3KpJvh/Z341E2b1K0AmBMCyOTlzJZG4qWmv4s7JTx+2QfelqHz5rGGWRk
 bS4NLC+8icuggijY04Vnvy4AO1pVU1vfSZfjLmHgrkZRZz/1kwrsrMVUj7QXtOXoAFcVQZHcs
 LKM3WerMzJskUbECMw6t5iviTnQn8qLeogFs4n4/TXRE43eiV7LeFw87wk9mqFgLaIGs5INkO
 iqS5DEWyoWvWznK4auyc+ZngasDhQgg1QEOzXJt+Nwn+1R95YH4psaIHtZG6SAWXa65oabse1
 BnC/Ws7GzWoJtW7tm1pQVBUnoFDHxbYF7C4ilK8ASC0+xufQ2Pz0Po02Mw0UbN50Gqk1ztfHT
 hpa0t9FnbqPeliZnXBW5ch+lOJhNn3XVnJIASqzVEf/sDC3if3OSGOyUwjH4hiYvpmSw=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, richard.henderson@linaro.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

target_mmap() can fail and return -1, but we don't check for that and
instead assume it's always valid.

Fixes: db2af69d6ba8 ("linux-user: Add infrastructure for a signal trampoline page")
Cc: richard.henderson@linaro.org
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211121151711.331653-1-laurent@vivier.eu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 5da8c02d0822..767f54c76dc5 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -3254,9 +3254,13 @@ int load_elf_binary(struct linux_binprm *bprm, struct image_info *info)
      * Otherwise, allocate a private page to hold them.
      */
     if (TARGET_ARCH_HAS_SIGTRAMP_PAGE) {
-        abi_ulong tramp_page = target_mmap(0, TARGET_PAGE_SIZE,
-                                           PROT_READ | PROT_WRITE,
-                                           MAP_PRIVATE | MAP_ANON, -1, 0);
+        abi_long tramp_page = target_mmap(0, TARGET_PAGE_SIZE,
+                                          PROT_READ | PROT_WRITE,
+                                          MAP_PRIVATE | MAP_ANON, -1, 0);
+        if (tramp_page == -1) {
+            return -errno;
+        }
+
         setup_sigtramp(tramp_page);
         target_mprotect(tramp_page, TARGET_PAGE_SIZE, PROT_READ | PROT_EXEC);
     }
-- 
2.31.1


