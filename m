Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114E6486367
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 12:04:12 +0100 (CET)
Received: from localhost ([::1]:48306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QZ1-0004mT-5f
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 06:04:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDZ-0007ne-Gi
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:01 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:50397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDR-0004jr-El
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:00 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MbC5g-1mYINz1zlw-00bYSd; Thu, 06
 Jan 2022 11:41:51 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 19/27] linux-user/elfload: Rename ARM_COMMPAGE to HI_COMMPAGE
Date: Thu,  6 Jan 2022 11:41:29 +0100
Message-Id: <20220106104137.732883-20-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
References: <20220106104137.732883-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1lauh6L71dtd4UvQ6MPHlgdYKC13fq8DbNE3emgtpe6t1q7k8I3
 AS1g0EV4RqyYkFGHHNucHEfZ8WyqF+02c8/rrQ9axMdER9LHDHpIaAoC8hM0qzvBvmwoUJb
 OnD9ESsPsqV1lc1s8zjWe7biBPBSePirW0Ff9pO9TpjigCG/9ohzaf6OdB2urY2N+3p8qLI
 1UDqt25vnwPBP5AmsL6mQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JoTCOb9r2TM=:QwMel8YmCwgzyyeLCpGTGY
 p56kRD+OLSIrpNrumIeF8h9buLfjBmrqTkUUUud7WLFHgbzkfFgjofuoSgbER9JUnnLVc50fs
 xjBwQTUnADaQsaO3DIV+wZ9IIwsVFI3KpUBZVNO8SdqZWaEcS8urGMsfqXotKFYSzE19C6pwk
 1Nf/hLJ4buv15BA+SOcTP9eGLTtqhDRQEky4BwskFsHujg25B9VnoJZceRS/6j6iq5ZW7tLMb
 4wlXFIh/KXzyhsYWQ/Hg+d+uffvaTCgxOjSlg39LjZ5wlY7ACKwAK5OXX8mu5su4wdR/RDRU4
 MSHW7QzilAYsTIciTKkxBB2RhH9BQZfYTJR1P3luS7tr4ErVHjAhubmFmBe6cMfEZIuMl+tTv
 znCOVK+MrACSywnKD8bbCPMRyOXbloH7SV+cLv+SBFG15ROMEY6O/Nhc04p5Y9haT1vnPSAVv
 Iz9wxQqnSAUZzeAKQHT15//XSc1TwU2FgyI4IJFbOvnDbU2EdVhexTmAQs4eOiE+9P0/vnGuj
 sDkJbU6xRvjtXCAYhUjfkj9FYhmSsZ0/mpcLPJleZDrH3y1fRkVfVvgY8q5Y4k8MPBWdYRWUR
 FwgSLxjvfvP8QpF6A3t+QHnrh2S7dNHGkzhnjvox2UHLlVSvewuni719CAgHUhiM4GTgQknWk
 7lHft5H15epwQTlIw7h2nu0xZkmCeLBbhpZWSqBHAe2ny/RWmZC5SZrZRmW7/I4n+rsw=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Arm will no longer be the only target requiring a commpage,
but it will continue to be the only target placing the page
at the high end of the address space.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211221025012.1057923-4-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 767f54c76dc5..d34cd4fe43fb 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -390,11 +390,11 @@ enum {
 
 /* The commpage only exists for 32 bit kernels */
 
-#define ARM_COMMPAGE (intptr_t)0xffff0f00u
+#define HI_COMMPAGE (intptr_t)0xffff0f00u
 
 static bool init_guest_commpage(void)
 {
-    void *want = g2h_untagged(ARM_COMMPAGE & -qemu_host_page_size);
+    void *want = g2h_untagged(HI_COMMPAGE & -qemu_host_page_size);
     void *addr = mmap(want, qemu_host_page_size, PROT_READ | PROT_WRITE,
                       MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
 
@@ -2160,8 +2160,8 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
     return sp;
 }
 
-#ifndef ARM_COMMPAGE
-#define ARM_COMMPAGE 0
+#ifndef HI_COMMPAGE
+#define HI_COMMPAGE 0
 #define init_guest_commpage() true
 #endif
 
@@ -2361,7 +2361,7 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
     }
 
     loaddr &= -align;
-    if (ARM_COMMPAGE) {
+    if (HI_COMMPAGE) {
         /*
          * Extend the allocation to include the commpage.
          * For a 64-bit host, this is just 4GiB; for a 32-bit host we
@@ -2372,14 +2372,14 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
         if (sizeof(uintptr_t) == 8 || loaddr >= 0x80000000u) {
             hiaddr = (uintptr_t) 4 << 30;
         } else {
-            offset = -(ARM_COMMPAGE & -align);
+            offset = -(HI_COMMPAGE & -align);
         }
     }
 
     addr = pgb_find_hole(loaddr, hiaddr - loaddr, align, offset);
     if (addr == -1) {
         /*
-         * If ARM_COMMPAGE, there *might* be a non-consecutive allocation
+         * If HI_COMMPAGE, there *might* be a non-consecutive allocation
          * that can satisfy both.  But as the normal arm32 link base address
          * is ~32k, and we extend down to include the commpage, making the
          * overhead only ~96k, this is unlikely.
@@ -2400,7 +2400,7 @@ static void pgb_dynamic(const char *image_name, long align)
      * All we need is a commpage that satisfies align.
      * If we do not need a commpage, leave guest_base == 0.
      */
-    if (ARM_COMMPAGE) {
+    if (HI_COMMPAGE) {
         uintptr_t addr, commpage;
 
         /* 64-bit hosts should have used reserved_va. */
@@ -2410,7 +2410,7 @@ static void pgb_dynamic(const char *image_name, long align)
          * By putting the commpage at the first hole, that puts guest_base
          * just above that, and maximises the positive guest addresses.
          */
-        commpage = ARM_COMMPAGE & -align;
+        commpage = HI_COMMPAGE & -align;
         addr = pgb_find_hole(commpage, -commpage, align, 0);
         assert(addr != -1);
         guest_base = addr;
-- 
2.33.1


