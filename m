Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6935EDA44
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 12:41:33 +0200 (CEST)
Received: from localhost ([::1]:49208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odUVQ-00034O-F5
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 06:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEB-0008Dy-Sq
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:36 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:42077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE8-0008Bd-Sp
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:35 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MStOy-1oo19j3Sjm-00UNPI; Wed, 28
 Sep 2022 10:15:30 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 21/38] linux-user/hppa: Drop stack guard page on hppa target
Date: Wed, 28 Sep 2022 10:15:00 +0200
Message-Id: <20220928081517.734954-22-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:euHLl19iOYvKmUCvMz0eajucwc3v6x+I35FArQEj2SjwRAWfp66
 OEOD0To1/24U2UvrNQIVtQ9VVs7EwCik/n15/Sy4VJzZagK2CVdLjHJBi8qjfg4Cs5SO5jG
 4u0LQGpctzeNYlczUMPX3lAK3BpLMSghYsrdBltBaqwu+1CV/RSou/HuH78hzzJnQl/5vnn
 xhE9cjXQdkra9oKgRoZ3g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G+B8hQ9LEK4=:YbHwHhWE52jQW2ksw/gY4Z
 vK1kykm2nweZXJk7xa2SEHj/u2BW6xO68mhuTkbCw/wxMEvWd87oEEo1qAibii76h1KS7hpS3
 EeYF4TmmowLCIReF2CGAnfc8Kx1OCwvFESyofFG+XWZKCYkLzc5n68wfYTCPhUmxDhTRacoxB
 FC23Q83oW/ZqWX/HCYtOaLURVHNe9UR1bIxOfffJsxwRBd4udcvVOz4VSNv2DFolT0fWHeJPW
 RP/IcH0nnFoFwbJzM3Ex9lHaj+BMJ0Zc3w8EV20xBhvp36ha+kuePzLF7rpuHsJw5CRAloyr1
 gn0IIe72LWVWUCdqF2no6KZ85QDJ1l8f4LXc/9NCI+y9laM33vpVo2NUUj2nOgL3buJRwS/5O
 plthQPHv6rFyX8kaFfuLZsPk2gPXBkCg3O9YiLmnNZM4I7SHWE6ffR7EvE1SkArEzp7CTLL5M
 eRCGucINSlJd2Jwn5uVzjn0Usm2NeDFMlAp2u37sqv9R7Zatg76yzU817rzdCrPVYinMRTLLJ
 qgNfxYHl/W/iq54aHiK0AoToqH8UBmt/caB/g7vNpnamkoJoxQbJj0K1XTnjwItx6EKT166Bl
 uV88srrR/MWc1gvFVS27u9cMbbLpmvZLoLa97SKJ1UZPG5FV2MOzl0E/V19G5SxS31wjQkXq4
 anv8LDzx8FbLDfu75OnzSytnKW8edICh28MFvLPMhCocxdotkNw7Wn77fY76/mvDs6M7e6cuY
 xc8q8wg3AqQuel+s8bBvEAJFt4oYwHi/i2ib+lzOSkcc0Qe5LDWN/cEuinGZYn2DYmcC7ntzd
 c63IPVj
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Helge Deller <deller@gmx.de>

The stack-overflow check when building the "grep" debian package fails
on the debian hppa target. Reason is, that the guard page at the top
of the stack (which is added by qemu) prevents the fault handler in the
grep program to properly detect the stack overflow.

The Linux kernel on a physical machine doesn't install a guard page
either, so drop it and as such fix the build of "grep".

Signed-off-by: Helge Deller <deller@gmx.de>
Message-Id: <20220924114501.21767-5-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index ba5c4c02e591..c7e3f1d47c16 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2096,9 +2096,15 @@ static abi_ulong setup_arg_pages(struct linux_binprm *bprm,
     if (size < STACK_LOWER_LIMIT) {
         size = STACK_LOWER_LIMIT;
     }
-    guard = TARGET_PAGE_SIZE;
-    if (guard < qemu_real_host_page_size()) {
-        guard = qemu_real_host_page_size();
+
+    if (STACK_GROWS_DOWN) {
+        guard = TARGET_PAGE_SIZE;
+        if (guard < qemu_real_host_page_size()) {
+            guard = qemu_real_host_page_size();
+        }
+    } else {
+        /* no guard page for hppa target where stack grows upwards. */
+        guard = 0;
     }
 
     prot = PROT_READ | PROT_WRITE;
@@ -2118,7 +2124,6 @@ static abi_ulong setup_arg_pages(struct linux_binprm *bprm,
         info->stack_limit = error + guard;
         return info->stack_limit + size - sizeof(void *);
     } else {
-        target_mprotect(error + size, guard, PROT_NONE);
         info->stack_limit = error + size;
         return error;
     }
-- 
2.37.3


