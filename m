Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 053645EE6CA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:45:59 +0200 (CEST)
Received: from localhost ([::1]:47844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oddwL-00068n-Pb
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddel-0007zI-C8
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:47 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:52737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddej-0006NW-Bt
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:47 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MdNPq-1pChQN2Y08-00ZNto; Wed, 28
 Sep 2022 22:27:43 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 10/37] linux-user/hppa: Set TASK_UNMAPPED_BASE to 0xfa000000
 for hppa arch
Date: Wed, 28 Sep 2022 22:27:10 +0200
Message-Id: <20220928202737.793171-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cKcCZW6qZdTYScJOBP+nv5g7E36cM2agAakTwnH3f+wCiXJ8UJ7
 664AKzDC14KYsT2MM/PuM+NotjGeHebIMIoQqxfYqnLDBAim558btGEGdUPByUrXPGtG1EA
 qBMqY3Is6LUPHbdrFkQQ0z15wkGSg9a1WAazg+Nlq7YaLqgv8PMKro90SscqeWpuEB4RuFJ
 KTmCFmW3OzHBByyBDSLyQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:N8ms75257Oo=:cSuDqrlyqkgThQl1j8wW/t
 bHeTDlXgymRU3+cBM7Gw2AzGeOWPq7OfLXazPcwBBy2TR2wH/khmMC1KQZUQI+4QDXExFDdv6
 rZcUVqccO+EbXvsg99gRCV0+Kyo4hcG21eDqyhKKg2XsRg/I/86l73K+ErwZrKGpGRpNUtR/s
 FBnJM80vsX9ZLNBqxUx/2okdi72uAN+UATpf87KsUHGsaMkuDg+oFdnLTfLOt+EBKUTlYEkhu
 qunkIQI0WuvX0UvNAMCQa5yWxUWLJtxwFPuzQaDB4RBT3j1TdwklewNCqt8OM2ZLe20z2bPtk
 T1TkH6OAFertVTZCCy1iZXv+w6jJNNDDrDngHa1YXE9H7pb0a8i3vLcp2tJu+UtffFC5QQf9L
 MnO+6aH4Y7DZbLOQiJ8pE15WMlEl1cobFQL3O/dl5nB2TX7CRKQixFa/Qw0pcfPE1ieRYldFj
 SbHRo1ET2cqh67ubzFa5iZMcOHmFht9cP2kOu3lP5kYcvfONPiGQtfEPZetbnqcYrg7DsE+cR
 DG4nyoOBVNHFbP/6p87YAEp8C3knQ/8YUF4uALOVi1KcSyZ+FAS7iyQV3N/DPavi/Vq/w8Cbb
 wI38Puv7duUgpxkLVjZyL+bOseqoQnqpO9J4kXmusUSjBFHqZooEf+1T2Jafl7sjIWAI4Pva6
 XM/TPCtrZNGf6CxSC7k96xXPA3OvbrGwWVVHI48JXM9taPSR3xZHUAStnSPa5bx4g5FIZ5SZx
 +eN9ruIRP43dVOfX8LiBMpeWtgVqJwGWJdyA1THmecvQAhneJuLIWL+/Q3EVnprDz2SzPCN3s
 hhw4HVm
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


