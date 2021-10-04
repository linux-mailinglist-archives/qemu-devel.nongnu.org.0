Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8D54210EF
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 16:07:40 +0200 (CEST)
Received: from localhost ([::1]:46704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXOd0-00058m-GF
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 10:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1mXOaL-00034c-Ms
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 10:04:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1mXOaJ-0004Xn-LG
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 10:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633356290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0oddRFTjgC8wMF4YjBkr/MMEDiG1UVXt9ILG/PBATM0=;
 b=KmjcspXQPlQBeZr+Zslp1tXFESlvDVGPJmrgPrxsM1vth/gzkV6rjf4pqjXUuiG63pMX+t
 JFngejZ35c2XypZ/b3bsB4LP4SRCpSpMScIvkIHL/HUsc3/a3Y44u/qU1IuVrN1dy16ZJX
 4DhW6m/LYlY4YEvJvcjHJfoA7tSCrLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-vYNiK0O2MjCFDPEGTellOg-1; Mon, 04 Oct 2021 10:04:49 -0400
X-MC-Unique: vYNiK0O2MjCFDPEGTellOg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BF12802C8A
 for <qemu-devel@nongnu.org>; Mon,  4 Oct 2021 14:04:48 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA03B5D740;
 Mon,  4 Oct 2021 14:04:46 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3] i386: docs: Briefly describe KVM PV features
Date: Mon,  4 Oct 2021 16:04:45 +0200
Message-Id: <20211004140445.624875-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: Igor Mammedov <imammedo@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM PV features don't seem to be documented anywhere, in particular, the
fact that some of the features are enabled by default and some are not can
only be figured out from the code.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
Changes since "[PATCH v2 0/8] i386: Assorted KVM PV and Hyper-V feature
 improvements" [Paolo Bonzini]:
- Convert to 'rst' and move to docs/system/i386/kvm-pv.rst.
- Add information about the version of Linux that introduced the particular
  PV feature.
---
 docs/system/i386/kvm-pv.rst | 100 ++++++++++++++++++++++++++++++++++++
 docs/system/target-i386.rst |   1 +
 2 files changed, 101 insertions(+)
 create mode 100644 docs/system/i386/kvm-pv.rst

diff --git a/docs/system/i386/kvm-pv.rst b/docs/system/i386/kvm-pv.rst
new file mode 100644
index 000000000000..1e5a9923ef45
--- /dev/null
+++ b/docs/system/i386/kvm-pv.rst
@@ -0,0 +1,100 @@
+Paravirtualized KVM features
+============================
+
+Description
+-----------
+
+In some cases when implementing hardware interfaces in software is slow, ``KVM``
+implements its own paravirtualized interfaces.
+
+Setup
+-----
+
+Paravirtualized ``KVM`` features are represented as CPU flags. The following
+features are enabled by default for any CPU model when ``KVM`` acceleration is
+enabled:
+
+- ``kvmclock``
+- ``kvm-nopiodelay``
+- ``kvm-asyncpf``
+- ``kvm-steal-time``
+- ``kvm-pv-eoi``
+- ``kvmclock-stable-bit``
+
+``kvm-msi-ext-dest-id`` feature is enabled by default in x2apic mode with split
+irqchip (e.g. "-machine ...,kernel-irqchip=split -cpu ...,x2apic").
+
+Note: when CPU model ``host`` is used, QEMU passes through all supported
+paravirtualized ``KVM`` features to the guest.
+
+Existing features
+-----------------
+
+``kvmclock``
+  Expose a ``KVM`` specific paravirtualized clocksource to the guest. Supported
+  since Linux v2.6.26.
+
+``kvm-nopiodelay``
+  The guest doesn't need to perform delays on PIO operations. Supported since
+  Linux v2.6.26.
+
+``kvm-mmu``
+  This feature is deprecated.
+
+``kvm-asyncpf``
+  Enable asynchronous page fault mechanism. Supported since Linux v2.6.38.
+  Note: since Linux v5.10 the feature is deprecated and not enabled by ``KVM``.
+  Use ``kvm-asyncpf-int`` instead.
+
+``kvm-steal-time``
+  Enable stolen (when guest vCPU is not running) time accounting. Supported
+  since Linux v3.1.
+
+``kvm-pv-eoi``
+  Enable paravirtualized end-of-interrupt signaling. Supported since Linux
+  v3.10.
+
+``kvm-pv-unhalt``
+  Enable paravirtualized spinlocks support. Supported since Linux v3.12.
+
+``kvm-pv-tlb-flush``
+  Enable paravirtualized TLB flush mechanism. Supported since Linux v4.16.
+
+``kvm-pv-ipi``
+  Enable paravirtualized IPI mechanism. Supported since Linux v4.19.
+
+``kvm-poll-control``
+  Enable host-side polling on HLT control from the guest. Supported since Linux
+  v5.10.
+
+``kvm-pv-sched-yield``
+  Enable paravirtualized sched yield feature. Supported since Linux v5.10.
+
+``kvm-asyncpf-int``
+  Enable interrupt based asynchronous page fault mechanism. Supported since Linux
+  v5.10.
+
+``kvm-msi-ext-dest-id``
+  Support 'Extended Destination ID' for external interrupts. The feature allows
+  to use up to 32768 CPUs without IRQ remapping (but other limits may apply making
+  the number of supported vCPUs for a given configuration lower). Supported since
+  Linux v5.10.
+
+``kvmclock-stable-bit``
+  Tell the guest that guest visible TSC value can be fully trusted for kvmclock
+  computations and no warps are expected. Supported since Linux v2.6.35.
+
+Supplementary features
+----------------------
+
+``kvm-pv-enforce-cpuid``
+  Limit the supported paravirtualized feature set to the exposed features only.
+  Note, by default, ``KVM`` allows the guest to use all currently supported
+  paravirtualized features even when they were not announced in guest visible
+  CPUIDs. Supported since Linux v5.10.
+
+
+Useful links
+------------
+
+Please refer to Documentation/virt/kvm in Linux for additional details.
diff --git a/docs/system/target-i386.rst b/docs/system/target-i386.rst
index 6a86d638633a..4daa53c35d8f 100644
--- a/docs/system/target-i386.rst
+++ b/docs/system/target-i386.rst
@@ -26,6 +26,7 @@ Architectural features
    :maxdepth: 1
 
    i386/cpu
+   i386/kvm-pv
    i386/sgx
 
 .. _pcsys_005freq:
-- 
2.31.1


