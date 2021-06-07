Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E64539E72C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 21:04:28 +0200 (CEST)
Received: from localhost ([::1]:58518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqKXz-0001H9-9D
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 15:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqKRb-0003vT-Bs; Mon, 07 Jun 2021 14:57:52 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:37875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqKRX-0005r5-MB; Mon, 07 Jun 2021 14:57:51 -0400
Received: from quad ([82.142.12.38]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MPGFZ-1m0RKU3B1B-00PbZh; Mon, 07
 Jun 2021 20:57:36 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 04/11] linux-user/syscall: Constify bitmask_transtbl fcntl/mmap
 flags_tlb[]
Date: Mon,  7 Jun 2021 20:57:23 +0200
Message-Id: <20210607185730.346641-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607185730.346641-1-laurent@vivier.eu>
References: <20210607185730.346641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yZTy0uTycdsMYsP4FhFiZpMOCMxuJYoBaI1yti5is/bVfIf+56A
 YG/oW6AJvkx+VW+kCg/NxE/IfSPzSZLLbwRSMw3F4R9mbQUvHlZxwGUuDFSc3f+z8gJ0hHb
 3n/n339B8R5Gyghf3UR5NTR1ab/jgCsx1IDWUBsYMUKpZVb/W6KjAW6fDoIeYUFFh88+78E
 E/HEP7nb0qXg+K2owZPhw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:d/nVhIzL8+g=:/q5g+SacHT/HPSE9Vs7xZ3
 b+GrZ17Wez35h0b8ziyhcEZYzt+smdxtlLBAGjQUofdAy3cVvsWpEl1AqphDqW0yDE3+Ah8X7
 YReJv/JfdFQuji7p580pmVy7pG4/ld26178cZ7WTfCieDA5nR1TC6MYJQ+w+muddsEco80uJc
 l3ou7BR7rs/S0GEfjyA0WVTNOdPEjLttLSf3NII0/xaozZbbURZzlRX9hhzA7AEOzR04fZJv2
 mQVBcIFb/p+wVkXpg3uYBMMq7puqZsd4NLpg0pN47TbDwDSg/ZLwTRzQp6PErbUh7//CzYezo
 VDl1+RzHhupRvqXhPeDvKti+YfPW5THxzz1K8N7GQ4v40mkoN8XZsqnsUTJvfuB5lXCvvDPKI
 e2wC+4kKObfmzOXuzLt/LHWIFBZMz7B1Vk3RJMRiVlYE+9EmF6cbAoQvEuRivBUi05I2zZbyn
 xP3WtA76ASM9OZNJPTtCQz0qFzU3TKutU3XdLfmxeJxyzyK+8SmgnQuZwJeDVc2600yDtwawQ
 1AWPfkXi96JKvFH7uOIqig=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Keep bitmask_transtbl in .rodata by marking the arrays const.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210517055243.830491-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index c9f812091c3f..974dd46c9a17 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -365,7 +365,7 @@ _syscall5(int, sys_statx, int, dirfd, const char *, pathname, int, flags,
 _syscall2(int, membarrier, int, cmd, int, flags)
 #endif
 
-static bitmask_transtbl fcntl_flags_tbl[] = {
+static const bitmask_transtbl fcntl_flags_tbl[] = {
   { TARGET_O_ACCMODE,   TARGET_O_WRONLY,    O_ACCMODE,   O_WRONLY,    },
   { TARGET_O_ACCMODE,   TARGET_O_RDWR,      O_ACCMODE,   O_RDWR,      },
   { TARGET_O_CREAT,     TARGET_O_CREAT,     O_CREAT,     O_CREAT,     },
@@ -6062,7 +6062,7 @@ static const StructEntry struct_termios_def = {
     .print = print_termios,
 };
 
-static bitmask_transtbl mmap_flags_tbl[] = {
+static const bitmask_transtbl mmap_flags_tbl[] = {
     { TARGET_MAP_SHARED, TARGET_MAP_SHARED, MAP_SHARED, MAP_SHARED },
     { TARGET_MAP_PRIVATE, TARGET_MAP_PRIVATE, MAP_PRIVATE, MAP_PRIVATE },
     { TARGET_MAP_FIXED, TARGET_MAP_FIXED, MAP_FIXED, MAP_FIXED },
-- 
2.31.1


