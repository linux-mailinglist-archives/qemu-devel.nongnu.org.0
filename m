Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF63F5EE6CD
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:47:01 +0200 (CEST)
Received: from localhost ([::1]:49542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oddxM-0007iF-QF
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddew-0000AU-W8
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:59 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:59317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddev-0006U8-B3
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:58 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MfYgC-1pAVZT0uqW-00g3EY; Wed, 28
 Sep 2022 22:27:55 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 23/37] linux-user/hppa: Allow PROT_GROWSUP and PROT_GROWSDOWN
 in mprotect()
Date: Wed, 28 Sep 2022 22:27:23 +0200
Message-Id: <20220928202737.793171-24-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JQwokNvUD7b2VSpAOHd0/9+115ORCZpjE036Pe6Iou/ZNhMUO9W
 0N/Ty4udZHiNXuFYST9dggoSysDOaH+c6R2gV0Hu4XUs161Hwzd8U0onYpD6RL5e98BzYZL
 4h4Sm/HjGeTyJCW3m82Ycri+shf5zM22ygsqFr/wpRTrP/SLfaDkwmGApJcwaGSOSrrIOjF
 mG36L7yJEULb6HAlXsTwQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:heRzsq3L3Sc=:pI3YmrcTpA35u6HpjK8kew
 1AvlSMz5Bl+CfyUa9vkjKbgZDvctYdX0i0hJF6FErPqhjEzj7cjQbywDwC/35gMhTXU1++08f
 Mw329BZ6B931d0oujPHy0rR8FZaVp6et7VwxJOmbw1PVR8J7nuEgjnbQIdE7TcV+kv5xZYyqN
 bf+cXr1AXIjQsRl19+S5/9scn8k/ajHBdAPc7nijqGhUhd3MJhgqV4jsAeA832IqlIL0OLkOT
 6M2K60mlh0XB/YR2UyYTNWlZ6A4rA4ANXgiPy8UcyDQ+HX+VhYk7HOkC0XnrzZ1iDEa+2k+jQ
 M6w3cClPJdD6jhVzCEGjzDmJtGvsQMaeQ/ngUraz2PsvUCoSjhCHnPMEs5qjQrW3QC4rojcYS
 AQjRu+B3X+VC90kpXevJaKyOmMKWUiGf9iZ7AQFq1MlrAwZiV07EerLkAH4LusZEM/7f70L8v
 QisdPpjzXiI//5OK1MBYuF3Y4bQ2keBOG8ljDh0IGIuFrfsqFwFbGO9Kd4Bvp4yC4jAdInGIY
 iKnf1bk3vhk+MBnf3XL3bEzbpUjp8CHahYyaIJ7Ln8gID5Td6457tl3ZVmzI2gOBwI0gXDV3a
 jhJgzAQyHepDQjSG8tRNmOzbXv0wEeOWveeRyz0lClxPZZh1bsvkV94IHNfmWMs9vsrCzzmig
 aJYW0StjTLqAulZm/0ElTh4u3pm++LPZ3tD0AAXiPtiTXFi4jxZEbbajZ8yNZaq/6WHngu7I7
 T/3434hK+jsGmqagGFEX+jMqgWdF3lIR/kOo174vbVL88N57JgmzY/LFcUwnVoWwG+USTLTZt
 NqKE1i8
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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

From: Helge Deller <deller@gmx.de>

The hppa platform uses an upwards-growing stack and required in Linux
kernels < 5.18 an executable stack for signal processing.  For that some
executables and libraries are marked to have an executable stack, for
which glibc uses the mprotect() syscall to mark the stack like this:
 mprotect(xfa000000,4096,PROT_EXEC|PROT_READ|PROT_WRITE|PROT_GROWSUP).

Currently qemu will return -TARGET_EINVAL for this syscall because of the
checks in validate_prot_to_pageflags(), which doesn't allow the
PROT_GROWSUP or PROT_GROWSDOWN flags and thus triggers this error in the
guest:
 error while loading shared libraries: libc.so.6: cannot enable executable stack as shared object requires: Invalid argument

Allow mprotect() to handle both flags and thus fix the guest.
The glibc tst-execstack testcase can be used to reproduce the issue.

Signed-off-by: Helge Deller <deller@gmx.de>
Message-Id: <20220924114501.21767-7-deller@gmx.de>
[lvivier: s/elif TARGET_HPPA/elif defined(TARGET_HPPA)/]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mmap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index e557f3626e5d..28f3bc85ed45 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -106,6 +106,8 @@ static int validate_prot_to_pageflags(int *host_prot, int prot)
             page_flags |= PAGE_MTE;
         }
     }
+#elif defined(TARGET_HPPA)
+    valid |= PROT_GROWSDOWN | PROT_GROWSUP;
 #endif
 
     return prot & ~valid ? 0 : page_flags;
-- 
2.37.3


