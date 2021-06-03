Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D991E39A048
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 13:53:32 +0200 (CEST)
Received: from localhost ([::1]:34556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lolul-0007jD-St
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 07:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lolqD-0004s1-Ky
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:48:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lolqB-00022o-Qx
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:48:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622720927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xL+X0F0Ai06zrlvOnlOoPjnfjRWpxoxzgv6QaQOdKBQ=;
 b=ZZIOUTj4+M67KAdJXQTtw5pzR9LrLmhTLgu1QI7RaY/THQfScqt6RTV8+h/z7cC0+Ri37k
 /29A7qkTvlRZrROulXrnhJu7U4l+RIr5IaCfCw3l9W2IMPe78q1/jojt4roCYLW7GQvXFl
 2nwdC04t2a66gyJGvvY02ng/9EFGWrw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-H5CnCdZuO1uEuLd3EkXWeQ-1; Thu, 03 Jun 2021 07:48:45 -0400
X-MC-Unique: H5CnCdZuO1uEuLd3EkXWeQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 136DC8015F5
 for <qemu-devel@nongnu.org>; Thu,  3 Jun 2021 11:48:45 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D6EF17A75;
 Thu,  3 Jun 2021 11:48:43 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v7 3/9] i386: hardcode supported eVMCS version to '1'
Date: Thu,  3 Jun 2021 13:48:29 +0200
Message-Id: <20210603114835.847451-4-vkuznets@redhat.com>
In-Reply-To: <20210603114835.847451-1-vkuznets@redhat.com>
References: <20210603114835.847451-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
 target/i386/kvm/kvm.c | 16 +++++++++++-----
 2 files changed, 12 insertions(+), 6 deletions(-)

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
index c676ee8b38a7..d57eede5dc81 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1490,13 +1490,19 @@ static int hyperv_init_vcpu(X86CPU *cpu)
         ret = kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENLIGHTENED_VMCS, 0,
                                   (uintptr_t)&evmcs_version);
 
-        if (ret < 0) {
-            fprintf(stderr, "Hyper-V %s is not supported by kernel\n",
-                    kvm_hyperv_properties[HYPERV_FEAT_EVMCS].desc);
+        /*
+         * KVM is required to support EVMCS ver.1. as that's what 'hv-evmcs'
+         * option sets. Note: we hardcode the maximum supported eVMCS version
+         * to '1' as well so 'hv-evmcs' feature is migratable even when (and if)
+         * ver.2 is implemented. A new option (e.g. 'hv-evmcs=2') will then have
+         * to be added.
+         */
+        if (ret < 0 || (uint8_t)evmcs_version > 1) {
+            error_report("Hyper-V %s verson 1 is not supported by kernel",
+                         kvm_hyperv_properties[HYPERV_FEAT_EVMCS].desc);
             return ret;
         }
-
-        cpu->hyperv_nested[0] = evmcs_version;
+        cpu->hyperv_nested[0] = (1 << 8) | 1;
     }
 
     return 0;
-- 
2.31.1


