Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4115ED9A4
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 12:00:03 +0200 (CEST)
Received: from localhost ([::1]:42242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odTrG-0006Mg-2D
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 06:00:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE4-00085x-H5
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:28 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:57237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE1-00089R-Ir
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:27 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MaIzb-1oh9fq2tVd-00WGlO; Wed, 28
 Sep 2022 10:15:23 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 10/38] linux-user/hppa: Set TASK_UNMAPPED_BASE to 0xfa000000
 for hppa arch
Date: Wed, 28 Sep 2022 10:14:49 +0200
Message-Id: <20220928081517.734954-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:T1eV7LRVxdD7n/uwqAe50bzBcFYHuls4iERktTuxqu1NmF2wpg4
 7+tAGOzN8Kd7Oz4M3ZngMoiVPpIlLV4JYIYWil5Y+EiLp3JYgyrC/SIebbdIZ0ggzuoiJ8g
 wDvupiXCt+T3gjVBhQNO1f1WIdZtIPTNBQidUSWARzrpzH6mN1Ax0YdvndHx4ItbL8/2XyM
 /S8u7tsBUP2dAj6teTfbw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aV2DD5YMc4w=:UfW1hEYo/E4v++AqwMlYD+
 L0uiUtMuOg5UtPl6KOHTaczxcPlpDzXJLOhS/VX/yy+K/v55lHMr4AEX1OLth+sIAjiPkO/Tx
 A9MwlAlLYFHuQVt9q+GvCVIITnlUZr5GY52PT6Owx6bBK4/HRtKgkBdF52Ord5FQwRL9F1gC1
 0OxQfFDCSil19SsSX35k/r5jY+hGejOw4YvLT3sGY0LZy3vadLixGsPj0WCqV141DEHWfy4l+
 /8tiYj+Jv34SBJWLlWAK9DBSPeD5rsxu2t1xUD9hgdWY2H9QlQnfxOwM6X4hcBuwGrOGppj55
 xl/DDhFU7E4XoHBiLR15qoz9nyoy8viPnHVV0xxwhNDq2e3BosdqdqJ991uVI77zUqJRLlO13
 KT/9aD4W842A6qfAjwOz0jhz7eOV/nsJz19Qr7wRKjHZ2LMashz2kULKFczOsPnqk72DKD8aB
 CsMo5Bw+vV9AGBcf0zGbNyn/Et5YRxbxWs+ccBnz5YY+V9jLY0UQt39pvP072b1WwUxepnOYr
 BFahHoXSoxA12sOEH+WKvAz9/z06nXk4AylJ7++wUJrJZu+ZgMnS7ebfhNvv4atrX5txkrJLD
 YhmJV7KbOfm8LV7s6oO4sLXFK1/Ap1UgalYI1XQnFbAru4k/yeJjtKBHeL/oXkH+1D0Vmfs5/
 NK5CopbCEjdOFBbhfAf+oGL4MmGqanf5Dny511PlAYhxsV+wgSgKsUjT7fQGPVJexRQCUQFPx
 6tQbmzrebyvel//fphzTPFK4cqMT43J0cnyFjJLBLnBGRQm/ZR2qqLSh+BSklZnwn+5DKWbc7
 yMuHERH
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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

On the parisc architecture the stack grows upwards.
Move the TASK_UNMAPPED_BASE to high memory area as it's done by the
kernel on physical machines.

Signed-off-by: Helge Deller <deller@gmx.de>
Message-Id: <20220918194555.83535-9-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mmap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 6a828e8418a7..83fdae7034ea 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -253,8 +253,12 @@ static int mmap_frag(abi_ulong real_start,
 # define TASK_UNMAPPED_BASE  (1ul << 38)
 #endif
 #else
+#ifdef TARGET_HPPA
+# define TASK_UNMAPPED_BASE  0xfa000000
+#else
 # define TASK_UNMAPPED_BASE  0x40000000
 #endif
+#endif
 abi_ulong mmap_next_start = TASK_UNMAPPED_BASE;
 
 unsigned long last_brk;
-- 
2.37.3


