Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D93F3D2345
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 14:20:30 +0200 (CEST)
Received: from localhost ([::1]:42738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Xgj-0001kK-8I
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 08:20:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1m6Xc1-0003IC-J0
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:15:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1m6Xc0-0001h1-09
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:15:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626956135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z1tIU2YHphnYuT9wydQ/esWuZWRJ4ptwamQw8mUHyLs=;
 b=Q7R31zK1OorWA9aqNCg7QP4IDxtHWiopNvnzsm/VguNZqys8gcel1PBAorRRDuh7GL1sbo
 HM5nx6hWxaV2tk2sLOArBzvZFusAOh8BJlmbNypE3GRg137aHE1Mqgachy6yu6p+IWEW7s
 TI4pAEUNu9B/2mcseCxbmL4ACeYNfF0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-vAW126CXNCGR8Fb1RHtu5A-1; Thu, 22 Jul 2021 08:15:34 -0400
X-MC-Unique: vAW126CXNCGR8Fb1RHtu5A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85F8F92500
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 12:15:33 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D93595FC03;
 Thu, 22 Jul 2021 12:15:31 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 1/3] docs: Briefly describe KVM PV features
Date: Thu, 22 Jul 2021 14:15:26 +0200
Message-Id: <20210722121528.258426-2-vkuznets@redhat.com>
In-Reply-To: <20210722121528.258426-1-vkuznets@redhat.com>
References: <20210722121528.258426-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
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


