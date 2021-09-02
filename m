Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D993FEB78
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 11:42:07 +0200 (CEST)
Received: from localhost ([::1]:50696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjEU-00021p-6t
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 05:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1mLj9L-0002e2-ID
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:36:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1mLj9K-0005Hr-2k
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:36:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630575405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MGXT4bpBRhawVmYk2DOx8tX2KL+m1MBi/gOw21IPETY=;
 b=a0Zuk/Jf/83rQ7Gt1CO7579AQJNzXZTrsG6snIms2xfT2VDOF2QkTPq3NzAjP7R1uBo9qj
 aAjpwnMAibEf944V/ivNpoAbEsjxZO11mB2dvu2aNsnVrKopezOjN8EOkAneQLJUKYuOtI
 nTXYxestd8FrIrfGfItfxrKoggyuy88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-9OQot2h6PwWStiTYQJu-uA-1; Thu, 02 Sep 2021 05:36:44 -0400
X-MC-Unique: 9OQot2h6PwWStiTYQJu-uA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A49A2102321E
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 09:36:25 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0D58972FB;
 Thu,  2 Sep 2021 09:36:23 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] i386: Change the default Hyper-V version to match
 WS2016
Date: Thu,  2 Sep 2021 11:35:30 +0200
Message-Id: <20210902093530.345756-9-vkuznets@redhat.com>
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

KVM implements some Hyper-V 2016 functions so providing WS2008R2 version
is somewhat incorrect. While generally guests shouldn't care about it
and always check feature bits, it is known that some tools in Windows
actually check version info.

For compatibility reasons make the change for 7.2 machine types only.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 docs/hyperv.txt   | 2 +-
 hw/i386/pc.c      | 6 +++++-
 target/i386/cpu.c | 6 +++---
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index 7803495468b7..5d99fd9a72b8 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -214,7 +214,7 @@ exposing correct vCPU topology and vCPU pinning.
 3.20. hv-version-id-{build,major,minor,spack,sbranch,snumber}
 =============================================================
 This changes Hyper-V version identification in CPUID 0x40000002.EAX-EDX from the
-default (WS2008R2).
+default (WS2016).
 - hv-version-id-build sets 'Build Number' (32 bits)
 - hv-version-id-major sets 'Major Version' (16 bits)
 - hv-version-id-minor sets 'Minor Version' (16 bits)
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 1276bfeee456..b2e4eef9d211 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -93,7 +93,11 @@
 #include "trace.h"
 #include CONFIG_DEVICES
 
-GlobalProperty pc_compat_6_1[] = {};
+GlobalProperty pc_compat_6_1[] = {
+    { TYPE_X86_CPU, "hv-version-id-build", "0x1bbc" },
+    { TYPE_X86_CPU, "hv-version-id-major", "0x0006" },
+    { TYPE_X86_CPU, "hv-version-id-minor", "0x0001" },
+};
 const size_t pc_compat_6_1_len = G_N_ELEMENTS(pc_compat_6_1);
 
 GlobalProperty pc_compat_6_0[] = {
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 5766e720093d..569840deaf93 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6669,11 +6669,11 @@ static Property x86_cpu_properties[] = {
 
     /* WS2008R2 identify by default */
     DEFINE_PROP_UINT32("hv-version-id-build", X86CPU, hyperv_ver_id_build,
-                       0x1bbc),
+                       0x3839),
     DEFINE_PROP_UINT16("hv-version-id-major", X86CPU, hyperv_ver_id_major,
-                       0x0006),
+                       0x000A),
     DEFINE_PROP_UINT16("hv-version-id-minor", X86CPU, hyperv_ver_id_minor,
-                       0x0001),
+                       0x0000),
     DEFINE_PROP_UINT32("hv-version-id-spack", X86CPU, hyperv_ver_id_sp, 0),
     DEFINE_PROP_UINT8("hv-version-id-sbranch", X86CPU, hyperv_ver_id_sb, 0),
     DEFINE_PROP_UINT32("hv-version-id-snumber", X86CPU, hyperv_ver_id_sn, 0),
-- 
2.31.1


