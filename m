Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1C039F632
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 14:16:02 +0200 (CEST)
Received: from localhost ([::1]:47532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqaeG-00019V-JH
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 08:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lqaX7-0008Q1-HH
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:08:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lqaX5-0001ji-Hf
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623154115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nK0TBLZYw83TpdpHflUc6W7hI7dJYkCYMwOwf86fGNE=;
 b=EZ03EwXOxFgOkRjZBro0YAVrqoBloZrjIWYKLSG4jYGPFvrC18MMspgxPSkK+T487H8AhE
 WGRwNIlccAt28GKNmrSQGiPPyNc7lb2nAtCwyQTJxvOQLlxneENMLdRZ/0TvWNoF2px7p/
 wF4VjivI7B+gHU3pU6JohMi9G5HgxPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-C9biR-eSPhadufMUmlblOw-1; Tue, 08 Jun 2021 08:08:31 -0400
X-MC-Unique: C9biR-eSPhadufMUmlblOw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7D091020C3C;
 Tue,  8 Jun 2021 12:08:30 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F005620DE;
 Tue,  8 Jun 2021 12:08:28 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v8 3/9] i386: hardcode supported eVMCS version to '1'
Date: Tue,  8 Jun 2021 14:08:11 +0200
Message-Id: <20210608120817.1325125-4-vkuznets@redhat.com>
In-Reply-To: <20210608120817.1325125-1-vkuznets@redhat.com>
References: <20210608120817.1325125-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, the only eVMCS version, supported by KVM (and described in TLFS)
is '1'. When Enlightened VMCS feature is enabled, QEMU takes the supported
eVMCS version range (from KVM_CAP_HYPERV_ENLIGHTENED_VMCS enablement) and
puts it to guest visible CPUIDs. When (and if) eVMCS ver.2 appears a
problem on migration is expected: it doesn't seem to be possible to migrate
from a host supporting eVMCS ver.2 to a host, which only support eVMCS
ver.1.

Hardcode eVMCS ver.1 as the result of 'hv-evmcs' enablement for now. Newer
eVMCS versions will have to have their own enablement options (e.g.
'hv-evmcs=2').

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 docs/hyperv.txt       |  2 +-
 target/i386/kvm/kvm.c | 39 +++++++++++++++++++++++++++++++++++----
 2 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index a51953daa833..000638a2fd38 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -170,7 +170,7 @@ Recommended: hv-frequencies
 3.16. hv-evmcs
 ===============
 The enlightenment is nested specific, it targets Hyper-V on KVM guests. When
-enabled, it provides Enlightened VMCS feature to the guest. The feature
+enabled, it provides Enlightened VMCS version 1 feature to the guest. The feature
 implements paravirtualized protocol between L0 (KVM) and L1 (Hyper-V)
 hypervisors making L2 exits to the hypervisor faster. The feature is Intel-only.
 Note: some virtualization features (e.g. Posted Interrupts) are disabled when
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index c676ee8b38a7..13d63f576b88 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1406,6 +1406,21 @@ static int hyperv_fill_cpuids(CPUState *cs,
 static Error *hv_passthrough_mig_blocker;
 static Error *hv_no_nonarch_cs_mig_blocker;
 
+/* Checks that the exposed eVMCS version range is supported by KVM */
+static bool evmcs_version_supported(uint16_t evmcs_version,
+                                    uint16_t supported_evmcs_version)
+{
+    uint8_t min_version = evmcs_version & 0xff;
+    uint8_t max_version = evmcs_version >> 8;
+    uint8_t min_supported_version = supported_evmcs_version & 0xff;
+    uint8_t max_supported_version = supported_evmcs_version >> 8;
+
+    return (min_version >= min_supported_version) &&
+        (max_version <= max_supported_version);
+}
+
+#define DEFAULT_EVMCS_VERSION ((1 << 8) | 1)
+
 static int hyperv_init_vcpu(X86CPU *cpu)
 {
     CPUState *cs = CPU(cpu);
@@ -1485,17 +1500,33 @@ static int hyperv_init_vcpu(X86CPU *cpu)
     }
 
     if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
-        uint16_t evmcs_version;
+        uint16_t evmcs_version = DEFAULT_EVMCS_VERSION;
+        uint16_t supported_evmcs_version;
 
         ret = kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENLIGHTENED_VMCS, 0,
-                                  (uintptr_t)&evmcs_version);
+                                  (uintptr_t)&supported_evmcs_version);
 
+        /*
+         * KVM is required to support EVMCS ver.1. as that's what 'hv-evmcs'
+         * option sets. Note: we hardcode the maximum supported eVMCS version
+         * to '1' as well so 'hv-evmcs' feature is migratable even when (and if)
+         * ver.2 is implemented. A new option (e.g. 'hv-evmcs=2') will then have
+         * to be added.
+         */
         if (ret < 0) {
-            fprintf(stderr, "Hyper-V %s is not supported by kernel\n",
-                    kvm_hyperv_properties[HYPERV_FEAT_EVMCS].desc);
+            error_report("Hyper-V %s is not supported by kernel",
+                         kvm_hyperv_properties[HYPERV_FEAT_EVMCS].desc);
             return ret;
         }
 
+        if (!evmcs_version_supported(evmcs_version, supported_evmcs_version)) {
+            error_report("eVMCS version range [%d..%d] is not supported by "
+                         "kernel (supported: [%d..%d])", evmcs_version & 0xff,
+                         evmcs_version >> 8, supported_evmcs_version & 0xff,
+                         supported_evmcs_version >> 8);
+            return -ENOTSUP;
+        }
+
         cpu->hyperv_nested[0] = evmcs_version;
     }
 
-- 
2.31.1


