Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DCA3CB717
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 14:02:19 +0200 (CEST)
Received: from localhost ([::1]:59358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4MXq-0006Wh-5J
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 08:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1m4MUg-0003Uh-8u
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 07:59:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1m4MUe-0004nC-K4
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 07:59:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626436739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X/2O2nM8sYnISYgcoRzcUuA9ligJytk/finaDU7HL0I=;
 b=AokPVWGc+Ye0mRsxfkW84Pl94BPSljv6BJrS8HCHBhIfpQ7WntlxCpVXWfRDkDYXQp+9mE
 P3urq287O15ykPxEoHGG0N01gUD6HNj/zPCdRH9HLKbVHpbwYAT3B6SgmASqRhiuaovWjE
 NFf4tP5qTWzbeWusSdc9AjNyzSFXXxY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-V5cZCUmQN2myD1sAaA-ToA-1; Fri, 16 Jul 2021 07:58:58 -0400
X-MC-Unique: V5cZCUmQN2myD1sAaA-ToA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1EF61018722;
 Fri, 16 Jul 2021 11:58:57 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C47BD69CB4;
 Fri, 16 Jul 2021 11:58:55 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 2/2] i386: Fix coding style in kvm_hyperv_expand_features()
Date: Fri, 16 Jul 2021 13:58:52 +0200
Message-Id: <20210716115852.418293-2-vkuznets@redhat.com>
In-Reply-To: <20210716115852.418293-1-vkuznets@redhat.com>
References: <20210716115852.418293-1-vkuznets@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU coding style requires braces around bodies of ifs.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm/kvm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index e69abe48e3f8..28ca682b1089 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1219,8 +1219,9 @@ bool kvm_hyperv_expand_features(X86CPU *cpu, Error **errp)
     Error *local_err = NULL;
     int feat;
 
-    if (!hyperv_enabled(cpu))
+    if (!hyperv_enabled(cpu)) {
         return true;
+    }
 
     /*
      * When kvm_hyperv_expand_features is called at CPU feature expansion
@@ -1228,8 +1229,9 @@ bool kvm_hyperv_expand_features(X86CPU *cpu, Error **errp)
      * when KVM_CAP_SYS_HYPERV_CPUID is supported.
      */
     if (!cs->kvm_state &&
-        !kvm_check_extension(kvm_state, KVM_CAP_SYS_HYPERV_CPUID))
+        !kvm_check_extension(kvm_state, KVM_CAP_SYS_HYPERV_CPUID)) {
         return true;
+    }
 
     if (cpu->hyperv_passthrough) {
         cpu->hyperv_vendor_id[0] =
-- 
2.31.1


