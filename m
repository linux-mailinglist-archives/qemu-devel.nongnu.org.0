Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1E33FEB5E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 11:40:05 +0200 (CEST)
Received: from localhost ([::1]:47944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjCW-00008n-M8
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 05:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1mLj9I-0002cN-O2
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:36:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1mLj9H-0005FD-0p
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:36:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630575402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mQvQsY+7GTKZG9iGQ2AT0h6SFz4fTB8TgjuB331b6LE=;
 b=I1W5CyCUH/wF8mHjVIw3LTtjqMUOkM67ctirTjlssoBqyBIwULWmb0kfvPpw0eVFmDz5JP
 yMv6GmDkaToJqP6VfRTKPBHsFfxPcZnbXoKvOpjKDcR5w5acNlnI9MTQdwnpCgfwlhxqJw
 OgodgIw0JqLf/++OPbk7K1kaSJyzaP4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-t1Z6qGpYOkOAj6KZL8lYzQ-1; Thu, 02 Sep 2021 05:35:36 -0400
X-MC-Unique: t1Z6qGpYOkOAj6KZL8lYzQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5DF0101371C
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 09:35:35 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFF266A05B;
 Thu,  2 Sep 2021 09:35:33 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/8] i386: Add 6.2 machine types
Date: Thu,  2 Sep 2021 11:35:23 +0200
Message-Id: <20210902093530.345756-2-vkuznets@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
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

Introduce 6.2 machine types and the required infrastructure for adding
compat properties to pre-6.2 machine types.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 hw/core/machine.c    |  3 +++
 hw/i386/pc.c         |  3 +++
 hw/i386/pc_piix.c    | 14 +++++++++++++-
 hw/i386/pc_q35.c     | 13 ++++++++++++-
 include/hw/boards.h  |  3 +++
 include/hw/i386/pc.h |  3 +++
 6 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 54e040587dd3..9d0d1194e1ef 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -46,6 +46,9 @@ GlobalProperty hw_compat_6_0[] = {
 };
 const size_t hw_compat_6_0_len = G_N_ELEMENTS(hw_compat_6_0);
 
+GlobalProperty hw_compat_6_1[] = {};
+const size_t hw_compat_6_1_len = G_N_ELEMENTS(hw_compat_6_1);
+
 GlobalProperty hw_compat_5_2[] = {
     { "ICH9-LPC", "smm-compat", "on"},
     { "PIIX4_PM", "smm-compat", "on"},
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 102b22394689..1276bfeee456 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -93,6 +93,9 @@
 #include "trace.h"
 #include CONFIG_DEVICES
 
+GlobalProperty pc_compat_6_1[] = {};
+const size_t pc_compat_6_1_len = G_N_ELEMENTS(pc_compat_6_1);
+
 GlobalProperty pc_compat_6_0[] = {
     { "qemu64" "-" TYPE_X86_CPU, "family", "6" },
     { "qemu64" "-" TYPE_X86_CPU, "model", "6" },
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 1bc30167acc0..c5da7739cef7 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -412,7 +412,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
 }
 
-static void pc_i440fx_6_1_machine_options(MachineClass *m)
+static void pc_i440fx_6_2_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_machine_options(m);
@@ -421,6 +421,18 @@ static void pc_i440fx_6_1_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_I440FX_MACHINE(v6_2, "pc-i440fx-6.2", NULL,
+                      pc_i440fx_6_2_machine_options);
+
+static void pc_i440fx_6_1_machine_options(MachineClass *m)
+{
+    pc_i440fx_6_2_machine_options(m);
+    m->alias = NULL;
+    m->is_default = false;
+    compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
+    compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
+}
+
 DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
                       pc_i440fx_6_1_machine_options);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index eeb0b185b118..565fadce540c 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -354,7 +354,7 @@ static void pc_q35_machine_options(MachineClass *m)
     m->max_cpus = 288;
 }
 
-static void pc_q35_6_1_machine_options(MachineClass *m)
+static void pc_q35_6_2_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_machine_options(m);
@@ -362,6 +362,17 @@ static void pc_q35_6_1_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_Q35_MACHINE(v6_2, "pc-q35-6.2", NULL,
+                   pc_q35_6_2_machine_options);
+
+static void pc_q35_6_1_machine_options(MachineClass *m)
+{
+    pc_q35_6_2_machine_options(m);
+    m->alias = NULL;
+    compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
+    compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
+}
+
 DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
                    pc_q35_6_1_machine_options);
 
diff --git a/include/hw/boards.h b/include/hw/boards.h
index accd6eff35ab..463a5514f97d 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -353,6 +353,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+extern GlobalProperty hw_compat_6_1[];
+extern const size_t hw_compat_6_1_len;
+
 extern GlobalProperty hw_compat_6_0[];
 extern const size_t hw_compat_6_0_len;
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 88dffe751724..97b4ab79b534 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -196,6 +196,9 @@ void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size);
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
                        const CPUArchIdList *apic_ids, GArray *entry);
 
+extern GlobalProperty pc_compat_6_1[];
+extern const size_t pc_compat_6_1_len;
+
 extern GlobalProperty pc_compat_6_0[];
 extern const size_t pc_compat_6_0_len;
 
-- 
2.31.1


