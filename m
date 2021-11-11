Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCF444D46E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 10:53:27 +0100 (CET)
Received: from localhost ([::1]:36260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml6lp-0005aV-Uj
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 04:53:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ml6kh-0004oc-C4
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:52:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ml6kd-00088m-L9
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:52:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636624329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xvLV0iuKk/F9MfBBShgeeMN9FNlFGmbgFPOz0dOejRY=;
 b=PK0qNcK62WwtkiH5OHipO3FyLYSQDgkYMnKZP1kuohWOKfW0uE60dxdKs6/tCGu+EnnfCk
 8xeFCljuMh9/SHNafE4iEHH2iCAphwPr6jhLITpAEdv5PQetZisopIaXJZEpbrIPfXzgWy
 ToB+xwnlxIu7scqoJ/nPq2F/hiXdmQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-yY4yn3EgOFC-PrqZk7ZL9A-1; Thu, 11 Nov 2021 04:52:07 -0500
X-MC-Unique: yY4yn3EgOFC-PrqZk7ZL9A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C74051006AA2;
 Thu, 11 Nov 2021 09:52:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D131100239F;
 Thu, 11 Nov 2021 09:52:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A39651800925; Thu, 11 Nov 2021 10:52:03 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] q35: flip acpi-pci-hotplug-with-bridge-support default back
 to off
Date: Thu, 11 Nov 2021 10:52:03 +0100
Message-Id: <20211111095203.961122-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch qemu 6.2 back to 6.0 behavior (aka native pcie hotplug) because
acpi hotplug for pcie ports caused all kinds of regressions and a fix
for those is not in sight.

Add compat property for 6.1 to keep it enabled there.  Use a separate
compat property list so we can apply it to 6.1 only.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/641
Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2006409
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/acpi/ich9.c   |  2 +-
 hw/i386/pc.c     |  1 -
 hw/i386/pc_q35.c | 14 +++++++++++++-
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 1ee2ba2c508c..6e7d4c9eb54a 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -427,7 +427,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
     pm->disable_s3 = 0;
     pm->disable_s4 = 0;
     pm->s4_val = 2;
-    pm->use_acpi_hotplug_bridge = true;
+    pm->use_acpi_hotplug_bridge = false;
 
     object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
                                    &pm->pm_io_base, OBJ_PROP_FLAG_READ);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2592a821486f..4fed82dafcf0 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -106,7 +106,6 @@ GlobalProperty pc_compat_6_0[] = {
     { "qemu64" "-" TYPE_X86_CPU, "model", "6" },
     { "qemu64" "-" TYPE_X86_CPU, "stepping", "3" },
     { TYPE_X86_CPU, "x-vendor-cpuid-only", "off" },
-    { "ICH9-LPC", ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, "off" },
 };
 const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 797e09500b15..735dd3cff4ed 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -375,8 +375,20 @@ static void pc_q35_6_1_machine_options(MachineClass *m)
     m->smp_props.prefer_sockets = true;
 }
 
+/* 6.1 only compat property (not applied to 6.0 + older) */
+static GlobalProperty pc_compat_6_1_only[] = {
+    { "ICH9-LPC", ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, "on" },
+};
+static const size_t pc_compat_6_1_only_len = G_N_ELEMENTS(pc_compat_6_1_only);
+
+static void pc_q35_6_1_only_machine_options(MachineClass *m)
+{
+    pc_q35_6_1_machine_options(m);
+    compat_props_add(m->compat_props, pc_compat_6_1_only, pc_compat_6_1_only_len);
+}
+
 DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
-                   pc_q35_6_1_machine_options);
+                   pc_q35_6_1_only_machine_options);
 
 static void pc_q35_6_0_machine_options(MachineClass *m)
 {
-- 
2.33.1


