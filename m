Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0953FEB5A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 11:37:41 +0200 (CEST)
Received: from localhost ([::1]:39074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjAC-0002Sx-64
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 05:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1mLj8J-0001h6-Tn
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:35:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1mLj8I-0004PJ-9J
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:35:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630575340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z1tIU2YHphnYuT9wydQ/esWuZWRJ4ptwamQw8mUHyLs=;
 b=MNsFbzXY3WppM62tFIwnNcBAmDxYf62tgHY/aL4Kwb95V3vwuUlHLOIFk3/YfwxQTI2SZM
 LGaAk8Tz4yrUDScf7vDeUd6i3MAIkjXK3lANE6Cl9+jCtwRoVinPXaIGZ7oMbPgI9ZOiF1
 EGRP9SLeBRhcNEkyjBJrND1vW9JTczo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-BQUyOU5RMfu_vF_eSp2N5w-1; Thu, 02 Sep 2021 05:35:39 -0400
X-MC-Unique: BQUyOU5RMfu_vF_eSp2N5w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1984E801AE3
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 09:35:38 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2174377F33;
 Thu,  2 Sep 2021 09:35:35 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/8] i386: docs: Briefly describe KVM PV features
Date: Thu,  2 Sep 2021 11:35:24 +0200
Message-Id: <20210902093530.345756-3-vkuznets@redhat.com>
In-Reply-To: <20210902093530.345756-1-vkuznets@redhat.com>
References: <20210902093530.345756-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Vadim Rozenfeld <vrozenfe@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM PV features don't seem to be documented anywhere, in particular, the
fact that some of the features are enabled by default and some are not can
only be figured out from the code.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 docs/kvm-pv.txt | 92 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 docs/kvm-pv.txt

diff --git a/docs/kvm-pv.txt b/docs/kvm-pv.txt
new file mode 100644
index 000000000000..84ad7fa60f8d
--- /dev/null
+++ b/docs/kvm-pv.txt
@@ -0,0 +1,92 @@
+KVM paravirtualized features
+============================
+
+
+1. Description
+===============
+In some cases when implementing a hardware interface in software is slow, KVM
+implements its own paravirtualized interfaces.
+
+2. Setup
+=========
+KVM PV features are represented as CPU flags. The following features are enabled
+by default for any CPU model when KVM is enabled:
+  kvmclock
+  kvm-nopiodelay
+  kvm-asyncpf
+  kvm-steal-time
+  kvm-pv-eoi
+  kvmclock-stable-bit
+
+'kvm-msi-ext-dest-id' feature is enabled by default in x2apic mode with split
+irqchip (e.g. "-machine ...,kernel-irqchip=split -cpu ...,x2apic").
+
+Note: when cpu model 'host' is used, QEMU passes through all KVM PV features
+exposed by KVM to the guest.
+
+3. Existing features
+====================
+
+3.1. kvmclock
+================
+This feature exposes KVM specific PV clocksource to the guest.
+
+3.2. kvm-nopiodelay
+===================
+The guest doesn't need to perform delays on PIO operations.
+
+3.3. kvm-mmu
+============
+This feature is deprecated.
+
+3.4. kvm-asyncpf
+================
+Enables asynchronous page fault mechanism. Note: since Linux-5.10 the feature is
+deprecated and not enabled by KVM. Use "kvm-asyncpf-int" instead.
+
+3.5. kvm-steal-time
+===================
+Enables stolen (when guest vCPU is not running) time accounting.
+
+3.6. kvm-pv-eoi
+===============
+Enables paravirtualized end-of-interrupt signaling.
+
+3.7. kvm-pv-unhalt
+==================
+Enables paravirtualized spinlocks support.
+
+3.8. kvm-pv-tlb-flush
+=====================
+Enables paravirtualized TLB flush mechanism.
+
+3.9. kvm-pv-ipi
+===============
+Enables paravirtualized IPI mechanism.
+
+3.10. kvm-poll-control
+======================
+Enables host-side polling on HLT control from the guest.
+
+3.11. kvm-pv-sched-yield
+========================
+Enables paravirtualized sched yield feature.
+
+3.12. kvm-asyncpf-int
+=====================
+Enables interrupt based asynchronous page fault mechanism.
+
+3.13. kvm-msi-ext-dest-id
+=========================
+Support 'Extended Destination ID' for external interrupts. The feature allows
+to use up to 32768 CPUs without IRQ remapping (but other limits may apply making
+the number of supported vCPUs for a given configuration lower).
+
+3.14. kvmclock-stable-bit
+=========================
+Tells the guest that guest visible TSC value can be fully trusted for kvmclock
+computations and no warps are expected.
+
+4. Useful links
+================
+Please refer to Documentation/virt/kvm in Linux for additional detail.
-- 
2.31.1


