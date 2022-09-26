Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F0E5EAC36
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 18:15:02 +0200 (CEST)
Received: from localhost ([::1]:39560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocql3-0007vf-V7
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 12:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ocq5f-0007eW-9B
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:32:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ocq5b-000656-Il
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:32:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664206330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mhS7W3FV1a+DTf4wDHj/bKnvPsjSmpUGk1yVvpgdWVc=;
 b=ew8XN6OmKn1OKlv6XpucH8WEO1HckunL5olkUGbZFAV7CLtKLjmRVbvILd0wvgACxMxgFs
 8xrCUPnWoMJDBxhC8RmFr0Zb2THfP8pksT/N1UvEchyStJjzuARL6r+ChRzFFPWbFSSCRW
 iohm0FTEUs1WcUzzifN3xgqQsqcJzzQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-529-a3e0ufdPOGe7BCZppIis3w-1; Mon, 26 Sep 2022 11:32:09 -0400
X-MC-Unique: a3e0ufdPOGe7BCZppIis3w-1
Received: by mail-qk1-f197.google.com with SMTP id
 k2-20020a05620a414200b006ceec443c8bso5229579qko.14
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 08:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=mhS7W3FV1a+DTf4wDHj/bKnvPsjSmpUGk1yVvpgdWVc=;
 b=s5xiBlSocXp9fMs15dLnXxdjbkrLhSU9mzOEo9VuWieorzEs+pOw7vW4aqlzjsd88c
 gHz0W1r2iJaZ6G0C1M/qQiZ+9oNQQUARq4jy1Nei7BOX+qMY3AzPz0y7uEiQwtNcquO7
 lTIGvKGebhdlFWF/kP9RRghponHZyqfuPZ+9Ne6PngMPgFfBMmDSLG6sCi8ynuFJ1oDR
 Yve6KkRrcUtYSc/yx/I435bKfuH2bPaumoIgl+K6kBCgZ5M+dJ18m8JjpcSuAT3v5Dag
 J9v4egF6t/uAGWJzMftPOMpkuXBoXyBni7kN0l12xKrjORomZGfvkynnL7XWP3EYIypU
 MYRQ==
X-Gm-Message-State: ACrzQf3feXjjx2cClJyloVy1Igk1i/44NElGGjtKzVMPxzKF2P4C+ddB
 gi3RRwnZ4tOBA/bauyQ0a1KdTEGQJbT+m+oqZrcwqtRsjRNYB6Hl6YxTzh7Dqb505pl7rdrZc3s
 +wXh2MMtdzne4UMOcfqJMMml8GAc3rzgdv+jX8N6oxhy51EIdNFvDHCaILxZXKlVx
X-Received: by 2002:a05:620a:25c8:b0:6ae:ba71:ea7d with SMTP id
 y8-20020a05620a25c800b006aeba71ea7dmr14752747qko.547.1664206328369; 
 Mon, 26 Sep 2022 08:32:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6CDCvS/m2u/1Ipc3ccgxSlwBekcLMWqg+OMw07bVRfd1zZd3TxutalIb5ljwPdqdhDCjfMgg==
X-Received: by 2002:a05:620a:25c8:b0:6ae:ba71:ea7d with SMTP id
 y8-20020a05620a25c800b006aeba71ea7dmr14752712qko.547.1664206328050; 
 Mon, 26 Sep 2022 08:32:08 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a05620a450e00b006cbcdc6efedsm12216341qkp.41.2022.09.26.08.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 08:32:07 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, peterx@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Claudio Fontana <cfontana@suse.de>
Subject: [PATCH v2] Revert "intel_iommu: Fix irqchip / X2APIC configuration
 checks"
Date: Mon, 26 Sep 2022 11:32:06 -0400
Message-Id: <20220926153206.10881-1-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's true that when vcpus<=255 we don't require the length of 32bit APIC
IDs.  However here since we already have EIM=ON it means the hypervisor
will declare the VM as x2apic supported (e.g. VT-d ECAP register will have
EIM bit 4 set), so the guest should assume the APIC IDs are 32bits width
even if vcpus<=255.  In short, commit 77250171bdc breaks any simple cmdline
that wants to boot a VM with >=9 but <=255 vcpus with:

  -device intel-iommu,intremap=on

For anyone who does not want to enable x2apic, we can use eim=off in the
intel-iommu parameters to skip enabling KVM x2apic.

This partly reverts commit 77250171bdc02aee106083fd2a068147befa1a38, while
keeping the valid bit on checking split irqchip, but revert the other change.

One thing to mention is that this patch may break migration compatibility
of such VM, however that's probably the best thing we can do, because the
old behavior was simply wrong and not working for >8 vcpus.  For <=8 vcpus,
there could be a light guest ABI change (by enabling KVM x2apic after this
patch), but logically it shouldn't affect the migration from working.

Also, this is not the 1st commit to change x2apic behavior.  Igor provided
a full history of how this evolved for the past few years:

https://lore.kernel.org/qemu-devel/20220922154617.57d1a1fb@redhat.com/

Relevant commits for reference:

  fb506e701e ("intel_iommu: reject broken EIM", 2016-10-17)
  c1bb5418e3 ("target/i386: Support up to 32768 CPUs without IRQ remapping", 2020-12-10)
  77250171bd ("intel_iommu: Fix irqchip / X2APIC configuration checks", 2022-05-16)
  dc89f32d92 ("target/i386: Fix sanity check on max APIC ID / X2APIC enablement", 2022-05-16)

We may want to have this for stable too (mostly for 7.1.0 only).  Adding a
fixes tag.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Claudio Fontana <cfontana@suse.de>
Cc: Igor Mammedov <imammedo@redhat.com>
Fixes: 77250171bd ("intel_iommu: Fix irqchip / X2APIC configuration checks")
Signed-off-by: Peter Xu <peterx@redhat.com>
---
v2:
- Added some more information into commit message [Igor]
---
 hw/i386/intel_iommu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 05d53a1aa9..6524c2ee32 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3818,6 +3818,11 @@ static bool vtd_decide_config(IntelIOMMUState *s, Error **errp)
             error_setg(errp, "eim=on requires accel=kvm,kernel-irqchip=split");
             return false;
         }
+        if (!kvm_enable_x2apic()) {
+            error_setg(errp, "eim=on requires support on the KVM side"
+                             "(X2APIC_API, first shipped in v4.7)");
+            return false;
+        }
     }
 
     /* Currently only address widths supported are 39 and 48 bits */
-- 
2.37.3


