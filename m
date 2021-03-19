Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A79342011
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 15:47:32 +0100 (CET)
Received: from localhost ([::1]:56634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNGPT-0005dx-5L
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 10:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNGHn-0005Nu-Fi
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:39:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNGHk-0004q8-6V
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:39:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616164771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DEudN1aMR1Vi29euOu/QdKIGp/3szmzik1xsDE298Aw=;
 b=dZgHps7+uwFJf8dZTv0etWJZfEbAzBe3AL9fgBcX5FDFh7/uqDoe++kUVFsWUekiK3jbiZ
 edrXZsEK7o/whl4Ur3gUh7wX++gWwmL88tsQaqoJGwzX8/5+KoKQ8nIQ+dWBE4+h/8732Q
 eQz46mpqRQSulfz1PWBEoHMyTrYfJ6I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-Mw4Hwz8XPzCpplrL-vbNhA-1; Fri, 19 Mar 2021 10:39:27 -0400
X-MC-Unique: Mw4Hwz8XPzCpplrL-vbNhA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DA0388EF11
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 14:39:26 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CC8B60C04;
 Fri, 19 Mar 2021 14:39:26 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/8] i386: Fix 'hypercall_hypercall' typo
Date: Fri, 19 Mar 2021 10:39:21 -0400
Message-Id: <20210319143924.2173798-6-pbonzini@redhat.com>
In-Reply-To: <20210319143924.2173798-1-pbonzini@redhat.com>
References: <20210319143924.2173798-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

Even the name of this section is 'cpu/msr_hyperv_hypercall',
'hypercall_hypercall' is clearly a typo.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20210318160249.1084178-3-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/machine.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/machine.c b/target/i386/machine.c
index 3967dfc257..7259fe6868 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -705,7 +705,7 @@ static bool hyperv_hypercall_enable_needed(void *opaque)
     return env->msr_hv_hypercall != 0 || env->msr_hv_guest_os_id != 0;
 }
 
-static const VMStateDescription vmstate_msr_hypercall_hypercall = {
+static const VMStateDescription vmstate_msr_hyperv_hypercall = {
     .name = "cpu/msr_hyperv_hypercall",
     .version_id = 1,
     .minimum_version_id = 1,
@@ -1484,7 +1484,7 @@ VMStateDescription vmstate_x86_cpu = {
         &vmstate_msr_ia32_feature_control,
         &vmstate_msr_architectural_pmu,
         &vmstate_mpx,
-        &vmstate_msr_hypercall_hypercall,
+        &vmstate_msr_hyperv_hypercall,
         &vmstate_msr_hyperv_vapic,
         &vmstate_msr_hyperv_time,
         &vmstate_msr_hyperv_crash,
-- 
2.26.2



