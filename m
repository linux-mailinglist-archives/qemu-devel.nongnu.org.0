Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 291766BEAF8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 15:19:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdAuW-0006YF-5A; Fri, 17 Mar 2023 10:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pdAuR-0006Ww-I1; Fri, 17 Mar 2023 10:18:19 -0400
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pdAuP-0004tG-Th; Fri, 17 Mar 2023 10:18:19 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N8GEY-1qYO7m2iga-0149VO; Fri, 17
 Mar 2023 15:18:10 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 1/3] exec/memory: Fix kernel-doc warning
Date: Fri, 17 Mar 2023 15:18:06 +0100
Message-Id: <20230317141808.826875-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230317141808.826875-1-laurent@vivier.eu>
References: <20230317141808.826875-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dBnAfVPArdEqHVx+fuXn+g/trh5q9fGrrN1d64P8FsHjqhxkOie
 IMf98NdGZeidrnW6JqeRYF+mla+0SHTUVonzQppjizz3kjIw9/pbrvtN8Ea/2XJwiwUoWdV
 6SMBD3FqYY2vkSTw9hZXW1QzwD+kQgxlxjPzQSfVJYp53KQTXbDrS4vOnWd93GOlYDGGcOx
 kv8NpVaUZivdOAz9/jbtw==
UI-OutboundReport: notjunk:1;M01:P0:wCCPaR57oIc=;jNdSCAwwUVMwR1q10XST+wMWSeu
 AAw38cKaJldlJ15nUWxthnFNZPT3m5lkuUjJah/oCDRCZJiwNH1AtTjBEdrChbUXScCceeJb8
 fOHrjZQYUXkPzIpgyNKVHrTnNhH/07ie0wbFtFbiXJCk55vo4O1lgiP5voqViKwKs8cqnivxJ
 D6h5dQ2fmVxJXdQ3P4oMBHH+9eCaspzmSo1vesh/ep7bKMphC0aiX+bte4IN319bRUuIyYfJx
 yWUQu1RvWDBdzwhIMN9ufiFgwqlYf28KTe1Rnm+qsXsrkbLrT+5dVquOaxQJWc1XKHgHO4JU7
 XeH9MPc1xHEBDJ4kIXHgyVQF8tupnXe2Qfex4HmndJwkOiCdfpLJXiBjp6gT5WaG2xC3i8HWr
 d63MlreeF2IjAM4LxhCKjkg6ZmRftg4JyQNjhcQwCW9UXJOWew5L2OuPjxS2t9QZxEqjWlV1+
 N9yjJTjDVGQeUO+urTN+VDYGPgIfj3MpBGZLAOo7n4VWJ+3lXjVsYU2+3AWuinWM/ykrnnXpw
 aMTjD7Tf+uayvhYy1PStcC3etAW7Lnwa9yYPVsMI8cyqsSOtOvNh3yf2fwcG4zazlxyBDIZJs
 ze/d9eLmztgs/FG130Xi540nTEA5BhdswbeXdYKq7AV/xPVul6g3lwPri5Sck3/ftKQ0Yr0pq
 6kb8WL35x92+3Oe3csV67hSL0OoW/ITkdLLnAVR+4w==
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

During build the kernel-doc script complains about the following issue:

  src/docs/../include/exec/memory.h:1741: warning: Function parameter or member 'n' not described in 'memory_region_unmap_iommu_notifier_range'
  src/docs/../include/exec/memory.h:1741: warning: Excess function parameter 'notifier' description in 'memory_region_unmap_iommu_notifier_range'

Settle on "notifier" for consistency with other memory functions.

Fixes: 7caebbf9ea53
       ("memory: introduce memory_region_unmap_iommu_notifier_range()")
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230315072552.47117-1-shentey@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/exec/memory.h | 2 +-
 softmmu/memory.c      | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 6fa0b071f04d..15ade918baa4 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1738,7 +1738,7 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
  *
  * @notifier: the notifier to be notified
  */
-void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *n);
+void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *notifier);
 
 
 /**
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 4699ba55ec80..5305aca7ca3d 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1996,17 +1996,17 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
     }
 }
 
-void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *n)
+void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *notifier)
 {
     IOMMUTLBEvent event;
 
     event.type = IOMMU_NOTIFIER_UNMAP;
     event.entry.target_as = &address_space_memory;
-    event.entry.iova = n->start;
+    event.entry.iova = notifier->start;
     event.entry.perm = IOMMU_NONE;
-    event.entry.addr_mask = n->end - n->start;
+    event.entry.addr_mask = notifier->end - notifier->start;
 
-    memory_region_notify_iommu_one(n, &event);
+    memory_region_notify_iommu_one(notifier, &event);
 }
 
 void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
-- 
2.39.2


