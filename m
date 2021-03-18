Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 032C5340A11
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:22:57 +0100 (CET)
Received: from localhost ([::1]:53506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvQG-0002Lk-0F
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lMv7D-00011p-Hd
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:03:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lMv72-0001sm-1g
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:03:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616083382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0JiKYNpJA7zDgNOU0igF/e2JJOKWaJRyGhzUEroZdgg=;
 b=VgRfWqMe+XScclLAlR/CneL61qBXXZcfL7rw37DQTznr3sJTNG1EvpZ5kHrQgI3bsR6ITW
 Dy9TpRN5IVIsxTXcxcp1O2b6/WpzTHkM1MJArQZKYhd/G1Z2A3+5tUBiQ/84v5GGzOts5D
 CAYqeXOmqWkQy8yddMfLPIR0zhUMyC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-Ciy-Pr5vN-W0kPKgl7HP8Q-1; Thu, 18 Mar 2021 12:03:00 -0400
X-MC-Unique: Ciy-Pr5vN-W0kPKgl7HP8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF6CD88CE34;
 Thu, 18 Mar 2021 16:02:59 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4E2A10023B0;
 Thu, 18 Mar 2021 16:02:57 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] i386: Fix 'hypercall_hypercall' typo
Date: Thu, 18 Mar 2021 17:02:48 +0100
Message-Id: <20210318160249.1084178-3-vkuznets@redhat.com>
In-Reply-To: <20210318160249.1084178-1-vkuznets@redhat.com>
References: <20210318160249.1084178-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Even the name of this section is 'cpu/msr_hyperv_hypercall',
'hypercall_hypercall' is clearly a typo.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/machine.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/machine.c b/target/i386/machine.c
index a4777a73b0a9..715620c58809 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -706,7 +706,7 @@ static bool hyperv_hypercall_enable_needed(void *opaque)
     return env->msr_hv_hypercall != 0 || env->msr_hv_guest_os_id != 0;
 }
 
-static const VMStateDescription vmstate_msr_hypercall_hypercall = {
+static const VMStateDescription vmstate_msr_hyperv_hypercall = {
     .name = "cpu/msr_hyperv_hypercall",
     .version_id = 1,
     .minimum_version_id = 1,
@@ -1487,7 +1487,7 @@ VMStateDescription vmstate_x86_cpu = {
         &vmstate_msr_architectural_pmu,
         &vmstate_mpx,
 #ifdef CONFIG_KVM
-        &vmstate_msr_hypercall_hypercall,
+        &vmstate_msr_hyperv_hypercall,
         &vmstate_msr_hyperv_vapic,
         &vmstate_msr_hyperv_time,
         &vmstate_msr_hyperv_crash,
-- 
2.30.2


