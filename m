Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C8A5FA335
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:14:53 +0200 (CEST)
Received: from localhost ([::1]:60200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxIi-0002xH-Ja
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwcD-00030V-6K
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwcA-00076t-FC
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nVrfuhIwqzfInAD0rVBmDi4J8sT2us7b0lHytetQ4rc=;
 b=GCD+tnsduQd13ciM6UDDuLvXvpkSy1lCBcYlROMWCUtz9csVIAwwYHkLDIgWDlpMKnHryB
 wlxhiIWtFEdlZDS4l89bs6RRIF6n5uFl5J0wvKHiUQu5Vc8O/Ls0p7xpQJGEPo6NWaT5ux
 o6EEsZgocO+tUp1xEKPQD7nHMaWsx5c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-549-vWbj0mvPM_aZa20nGm7cuQ-1; Mon, 10 Oct 2022 13:30:52 -0400
X-MC-Unique: vWbj0mvPM_aZa20nGm7cuQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 h4-20020adfa4c4000000b0022ec3966c3aso1991743wrb.6
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nVrfuhIwqzfInAD0rVBmDi4J8sT2us7b0lHytetQ4rc=;
 b=ttuDMJy238jBgekOW3QdJBifHM0CkVYzhfLIqrBWTHRUmxx9Mh0MuJzkjsIqDi6oCL
 PaIP413tnslhcoLViQqSgt1sGLihVi1Oo8wD2mNjFKddnvKNzl5EjulyOp3ctGovem3I
 4k24jQYhpp+rPV4Hc4nm2jU0G50P2Wv7z+W/3AYiZGpdvsiYWSGnCMzQIiM/0OJUSN3g
 Aa2yd0qCMRdEA6kwCtLxhxQqhGQ3cd//8UDHlGZh4G0jGFR9bGirddi7MVcNrfT0cYEj
 TVvdIzpSUnPZQsDxdF+VEMzumPHgNuM/CQBTXMFgd0JzahkFwgLK5wOgE6nrJVsEk67L
 Bgcw==
X-Gm-Message-State: ACrzQf30FJlvcNvtkl8WsIOfSvI8pZjn1tQkpfuBd9d0RH7sS6n5MYXh
 tjsh9vJNCvH+MaSa69FRjNd3h66jYJy+LRsqRQ6hZ2BWtZtzRxsTFfo1iNffWd9VxrfHURU27E4
 iXyi5EuvaVHvSa/L8wR1yhcGJVuTwlzehgFWeVOLe2Qw+YVW0nfC8bF0n0QBM
X-Received: by 2002:a5d:51d1:0:b0:22e:4701:fc5d with SMTP id
 n17-20020a5d51d1000000b0022e4701fc5dmr12735660wrv.515.1665423051315; 
 Mon, 10 Oct 2022 10:30:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM43HoqHI7zjtEKz7g+0aKhCWluLbs5BMmKNwC0KB/7De8H949WGJehpXM45xwr+WkenLknAQw==
X-Received: by 2002:a5d:51d1:0:b0:22e:4701:fc5d with SMTP id
 n17-20020a5d51d1000000b0022e4701fc5dmr12735631wrv.515.1665423050990; 
 Mon, 10 Oct 2022 10:30:50 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c0a0a00b003a2f2bb72d5sm24621241wmp.45.2022.10.10.10.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:30:50 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:30:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Xu <peterx@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Claudio Fontana <cfontana@suse.de>,
 Igor Mammedov <imammedo@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 29/55] Revert "intel_iommu: Fix irqchip / X2APIC configuration
 checks"
Message-ID: <20221010172813.204597-30-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

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
Message-Id: <20220926153206.10881-1-peterx@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
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
MST


