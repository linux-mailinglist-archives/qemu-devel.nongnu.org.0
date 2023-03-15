Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8E76BA90B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 08:27:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcLWZ-0000J6-67; Wed, 15 Mar 2023 03:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pcLWQ-0000Ii-9d
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 03:26:06 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pcLWO-00013W-JR
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 03:26:06 -0400
Received: by mail-ed1-x536.google.com with SMTP id cy23so71606403edb.12
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 00:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678865162;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I/xcp3c0rBUe8EoJVcf/sCv93NcgDWq2bhNv8uEsdUo=;
 b=WQrI8kuQrhEx1sfj8Ig5aX0LA3J5geuYLvLzG+45uRBac7nChOJgYiIQ0S4lyVJspO
 zqRJ6mTV6eJSyXtlugYCchF9scspMkf7TZNlkqZ/gSJjo7mQARA/XD7miWWIqptjgVa8
 n9kuzGfCBJYA1OzufEpfTgAZ1WcfDN8nsrGkTd5/+T5TVMoWW3Ozb4weY5Z27WFCqAtU
 PdOlbr//p/U6E/6pOaxkH/y4v6qVN1V96RvpTQp8xU/2v34UHqxvWiIbAvEvPLTRRQ5W
 olVN9TZEdhTxremNgcNvbd2haYg8iRicrON25gjRO8digN+AnOJDfWbRF1JmbCGqMP7P
 dCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678865162;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I/xcp3c0rBUe8EoJVcf/sCv93NcgDWq2bhNv8uEsdUo=;
 b=it4hZX9BA+Ie5i76E2w0bsN7z+S2mjdiXeDNqaOmx+moNuTr1hTLgv0q60eKr23KhF
 YbzD+FrqLRXakm97R1LqxQ4unuFJj44wlV72c6ivXsZf6F1oEom2wlI0JVnAR0B6h8rf
 UmJhOlJaXd+3FAiyLBg/qdov7U8ND08NvifcbB4McEGakJzzGiJ+kTRdXrENalpHO90c
 HzcoKNfCIoT6xPbViJdLJSOCVG3SaQEUaclFswWaPvEFeAdLD3ihG2uGevlkGNAv3BGF
 9ilcI1f7GXWTrD4KY4HM0L72nRw2QueUzRhDFMqLNJxqVB5b2QJC3M0NIzbMw2Suc3Ib
 Gxjg==
X-Gm-Message-State: AO0yUKUqoIYWNNYNV4qb7FU94F8nriLcl98oRTRgBwA2R0j9OYwaD8lH
 z0ARz7JYRVKN8DnuOspEmdOyqsNRKoY=
X-Google-Smtp-Source: AK7set9M1ey+ctctlliR6VEUWV9luwBVH7ERrQ4NBNw4EzA58ZoQOuXv1VQUgkobPaFIcoz6lf6qKQ==
X-Received: by 2002:aa7:cb18:0:b0:4fc:494a:98f5 with SMTP id
 s24-20020aa7cb18000000b004fc494a98f5mr1732384edt.29.1678865162208; 
 Wed, 15 Mar 2023 00:26:02 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-013-132-226.77.13.pool.telefonica.de. [77.13.132.226])
 by smtp.gmail.com with ESMTPSA id
 r23-20020a50aad7000000b004f9e6495f94sm1955884edc.50.2023.03.15.00.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 00:26:01 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH for 8.0] exec/memory: Fix kernel-doc warning
Date: Wed, 15 Mar 2023 08:25:52 +0100
Message-Id: <20230315072552.47117-1-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

During build the kernel-doc script complains about the following issue:

  src/docs/../include/exec/memory.h:1741: warning: Function parameter or member 'n' not described in 'memory_region_unmap_iommu_notifier_range'
  src/docs/../include/exec/memory.h:1741: warning: Excess function parameter 'notifier' description in 'memory_region_unmap_iommu_notifier_range'

Settle on "notifier" for consistency with other memory functions.

Fixes: 7caebbf9ea53
       ("memory: introduce memory_region_unmap_iommu_notifier_range()")
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/exec/memory.h | 2 +-
 softmmu/memory.c      | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 6fa0b071f0..15ade918ba 100644
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
index 4699ba55ec..5305aca7ca 100644
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
2.40.0


