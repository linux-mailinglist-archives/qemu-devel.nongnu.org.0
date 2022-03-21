Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06574E2E7D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 17:49:43 +0100 (CET)
Received: from localhost ([::1]:35598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWLDy-0001Ff-Se
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 12:49:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWL9Z-0002Qz-AT
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:45:09 -0400
Received: from [2a00:1450:4864:20::52e] (port=46052
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWL9X-00081Y-Mo
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:45:09 -0400
Received: by mail-ed1-x52e.google.com with SMTP id u26so3005742eda.12
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 09:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JKI4o3Uyi6+0rR6FdNfTHfNiYxgnnwwsGGd+FolDfEs=;
 b=c+BxN7Z9SkLEQOIEvNwmn86jXEEGo7ZnCWUKsrKg0GnfVgEoGfVQZ9mQdsUUY0mxdm
 QU0dT74IaDencuh1PhRXsVY2qtpKZyO9rj+m+iglozUDidmYcQwGWzT1YMY7U6FWC9p6
 RLqcLyghsAQEC9iEQSpmhMW71CZe25DHd3HYkhzhsZCMXiHjbdkxAyu0VvAKdljm5JNK
 QS7OQrvx66yPCoXNF89QlVtyzWN2ButPspnDot4VVfvFQSSuSWm/Ntq5ad7jx71nCBAc
 BKsqbdlxu8rwqVyiSMztHy98O5o53Zn4mKL7iEz463qPQFuZUhHuFqJhFGn2lxuQc34W
 HGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JKI4o3Uyi6+0rR6FdNfTHfNiYxgnnwwsGGd+FolDfEs=;
 b=hjIlDYcAd/T0ttAdxFYMJrpC/DgfWddT8rYFlKbLAIv51QNXX8oBww6+IOmgLTFw2U
 kB/I9YjL+eZwoggZ1DdBAky29O0Xkq+3CgoCcG6TxKAgEc7WwwguJEP8OBxJv1evJ3PT
 9I2nzLNm2FOV/M/AV8PKUJn3qmv+hSaIZ/J1T3aQCwDa4uvQdH/AjX8Vzak9NGbyNsyP
 oiOLG+pVtmbD4X8p5U8L8rEktkjHDF2s0m5EA+0USJIBuiTK4REDBlgzNBFPhRRnvPf6
 zyv7MYn92BSP48Hyozn8IaJ/agWgQiRpoYYjQGVjJ7uAg4HTz3Qdi0QXFLih7naLlmG7
 lRTQ==
X-Gm-Message-State: AOAM532pJ456UYo39wUGazt3ex8YXfiJIzBi7BUEHRJbgAzGeCPPJLUY
 yF3kqiCN2UEJr86uob3thYlmAWzbDgQ=
X-Google-Smtp-Source: ABdhPJwC45zS6FUrBu6VNOfnyF46NIaEt04iEwVQxxtK5c3rf44CZ2EcPC9QyoGqVcDDyJBmAX4X3g==
X-Received: by 2002:a50:9505:0:b0:416:4496:5ec4 with SMTP id
 u5-20020a509505000000b0041644965ec4mr24304698eda.309.1647881106152; 
 Mon, 21 Mar 2022 09:45:06 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 a102-20020a509eef000000b0041614c8f79asm7949352edf.88.2022.03.21.09.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 09:45:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] hw/i386/amd_iommu: Fix maybe-uninitialized error with GCC
 12
Date: Mon, 21 Mar 2022 17:45:02 +0100
Message-Id: <20220321164502.201160-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321164502.201160-1-pbonzini@redhat.com>
References: <20220321164502.201160-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Be more explicit that the loop must roll at least once.  Avoids the
following warning:

  FAILED: libqemu-x86_64-softmmu.fa.p/hw_i386_amd_iommu.c.o
  In function 'pte_get_page_mask',
      inlined from 'amdvi_page_walk' at hw/i386/amd_iommu.c:945:25,
      inlined from 'amdvi_do_translate' at hw/i386/amd_iommu.c:989:5,
      inlined from 'amdvi_translate' at hw/i386/amd_iommu.c:1038:5:
  hw/i386/amd_iommu.c:877:38: error: 'oldlevel' may be used uninitialized [-Werror=maybe-uninitialized]
    877 |     return ~((1UL << ((oldlevel * 9) + 3)) - 1);
        |                      ~~~~~~~~~~~~~~~~^~~~
  hw/i386/amd_iommu.c: In function 'amdvi_translate':
  hw/i386/amd_iommu.c:906:41: note: 'oldlevel' was declared here
    906 |     unsigned level, present, pte_perms, oldlevel;
        |                                         ^~~~~~~~
  cc1: all warnings being treated as errors

Having:

  $ gcc --version
  gcc (Debian 12-20220313-1) 12.0.1 20220314 (experimental)

Reported-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/amd_iommu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 4d13d8e697..6986ad3b87 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -913,7 +913,7 @@ static void amdvi_page_walk(AMDVIAddressSpace *as, uint64_t *dte,
         }
 
         /* we are at the leaf page table or page table encodes a huge page */
-        while (level > 0) {
+        do {
             pte_perms = amdvi_get_perms(pte);
             present = pte & 1;
             if (!present || perms != (perms & pte_perms)) {
@@ -932,10 +932,7 @@ static void amdvi_page_walk(AMDVIAddressSpace *as, uint64_t *dte,
             }
             oldlevel = level;
             level = get_pte_translation_mode(pte);
-            if (level == 0x7) {
-                break;
-            }
-        }
+        } while (level > 0 && level < 7);
 
         if (level == 0x7) {
             page_mask = pte_override_page_mask(pte);
-- 
2.35.1


