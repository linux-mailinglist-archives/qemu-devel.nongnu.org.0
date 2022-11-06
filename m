Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463D761E300
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 16:33:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orhdO-0005w0-NQ; Sun, 06 Nov 2022 10:32:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1orhdL-0005up-2L
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 10:32:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1orhdH-0000x2-Rz
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 10:32:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667748743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z2HNe7tob13Oi20jhUrK/TxOsUMNDUIP/y6/791f2fY=;
 b=NF37IF/iSz1kSWdro8EySQwhBobHRj1LsFG0OdzcwWYlJoTcXKCdJ8pb8tKLKtnEJvgN8/
 7QKd2KEhWKHpwEcl3yVPcPIJ/naHg6kegCMIJ2shNL+N5y3RJPSQmmixIssYIA55TWlmU+
 0yeMLE5qoY5UKoEXL+HjMZA0EeCnzGs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-WEtfF_akPryHCJE2mSjWKA-1; Sun, 06 Nov 2022 10:32:21 -0500
X-MC-Unique: WEtfF_akPryHCJE2mSjWKA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8780629A9CCB;
 Sun,  6 Nov 2022 15:32:21 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58AFC40C6EC4;
 Sun,  6 Nov 2022 15:32:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Pierre Morel <pmorel@linux.ibm.com>
Subject: [PULL 11/12] s390x: Register TYPE_S390_CCW_MACHINE properties as
 class properties
Date: Sun,  6 Nov 2022 16:31:55 +0100
Message-Id: <20221106153156.620150-12-thuth@redhat.com>
In-Reply-To: <20221106153156.620150-1-thuth@redhat.com>
References: <20221106153156.620150-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Pierre Morel <pmorel@linux.ibm.com>

Currently, when running 'qemu-system-s390x -M s390-ccw-virtio,help'
the s390x-specific properties are not listed anymore. This happens
because since commit d8fb7d0969 ("vl: switch -M parsing to keyval")
the properties have to be defined at the class level and not at the
instance level anymore. Fix it on s390x now, too, by moving the
registration of the properties to the class level"

Fixes: d8fb7d0969 ("vl: switch -M parsing to keyval")
Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
Message-Id: <20221103170150.20789-2-pmorel@linux.ibm.com>
[thuth: Add patch description]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/s390-virtio-ccw.c | 127 +++++++++++++++++++++----------------
 1 file changed, 72 insertions(+), 55 deletions(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 806de32034..196773c833 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -43,6 +43,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/s390x/pv.h"
 #include "migration/blocker.h"
+#include "qapi/visitor.h"
 
 static Error *pv_mig_blocker;
 
@@ -589,38 +590,6 @@ static ram_addr_t s390_fixup_ram_size(ram_addr_t sz)
     return newsz;
 }
 
-static void ccw_machine_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-    NMIClass *nc = NMI_CLASS(oc);
-    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
-    S390CcwMachineClass *s390mc = S390_CCW_MACHINE_CLASS(mc);
-
-    s390mc->ri_allowed = true;
-    s390mc->cpu_model_allowed = true;
-    s390mc->css_migration_enabled = true;
-    s390mc->hpage_1m_allowed = true;
-    mc->init = ccw_init;
-    mc->reset = s390_machine_reset;
-    mc->block_default_type = IF_VIRTIO;
-    mc->no_cdrom = 1;
-    mc->no_floppy = 1;
-    mc->no_parallel = 1;
-    mc->no_sdcard = 1;
-    mc->max_cpus = S390_MAX_CPUS;
-    mc->has_hotpluggable_cpus = true;
-    assert(!mc->get_hotplug_handler);
-    mc->get_hotplug_handler = s390_get_hotplug_handler;
-    mc->cpu_index_to_instance_props = s390_cpu_index_to_props;
-    mc->possible_cpu_arch_ids = s390_possible_cpu_arch_ids;
-    /* it is overridden with 'host' cpu *in kvm_arch_init* */
-    mc->default_cpu_type = S390_CPU_TYPE_NAME("qemu");
-    hc->plug = s390_machine_device_plug;
-    hc->unplug_request = s390_machine_device_unplug_request;
-    nc->nmi_monitor_handler = s390_nmi;
-    mc->default_ram_id = "s390.ram";
-}
-
 static inline bool machine_get_aes_key_wrap(Object *obj, Error **errp)
 {
     S390CcwMachineState *ms = S390_CCW_MACHINE(obj);
@@ -710,19 +679,29 @@ bool hpage_1m_allowed(void)
     return get_machine_class()->hpage_1m_allowed;
 }
 
-static char *machine_get_loadparm(Object *obj, Error **errp)
+static void machine_get_loadparm(Object *obj, Visitor *v,
+                                 const char *name, void *opaque,
+                                 Error **errp)
 {
     S390CcwMachineState *ms = S390_CCW_MACHINE(obj);
+    char *str = g_strndup((char *) ms->loadparm, sizeof(ms->loadparm));
 
-    /* make a NUL-terminated string */
-    return g_strndup((char *) ms->loadparm, sizeof(ms->loadparm));
+    visit_type_str(v, name, &str, errp);
+    g_free(str);
 }
 
-static void machine_set_loadparm(Object *obj, const char *val, Error **errp)
+static void machine_set_loadparm(Object *obj, Visitor *v,
+                                 const char *name, void *opaque,
+                                 Error **errp)
 {
     S390CcwMachineState *ms = S390_CCW_MACHINE(obj);
+    char *val;
     int i;
 
+    if (!visit_type_str(v, name, &val, errp)) {
+        return;
+    }
+
     for (i = 0; i < sizeof(ms->loadparm) && val[i]; i++) {
         uint8_t c = qemu_toupper(val[i]); /* mimic HMC */
 
@@ -740,34 +719,72 @@ static void machine_set_loadparm(Object *obj, const char *val, Error **errp)
         ms->loadparm[i] = ' '; /* pad right with spaces */
     }
 }
-static inline void s390_machine_initfn(Object *obj)
+
+static void ccw_machine_class_init(ObjectClass *oc, void *data)
 {
-    object_property_add_bool(obj, "aes-key-wrap",
-                             machine_get_aes_key_wrap,
-                             machine_set_aes_key_wrap);
-    object_property_set_description(obj, "aes-key-wrap",
+    MachineClass *mc = MACHINE_CLASS(oc);
+    NMIClass *nc = NMI_CLASS(oc);
+    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
+    S390CcwMachineClass *s390mc = S390_CCW_MACHINE_CLASS(mc);
+
+    s390mc->ri_allowed = true;
+    s390mc->cpu_model_allowed = true;
+    s390mc->css_migration_enabled = true;
+    s390mc->hpage_1m_allowed = true;
+    mc->init = ccw_init;
+    mc->reset = s390_machine_reset;
+    mc->block_default_type = IF_VIRTIO;
+    mc->no_cdrom = 1;
+    mc->no_floppy = 1;
+    mc->no_parallel = 1;
+    mc->no_sdcard = 1;
+    mc->max_cpus = S390_MAX_CPUS;
+    mc->has_hotpluggable_cpus = true;
+    assert(!mc->get_hotplug_handler);
+    mc->get_hotplug_handler = s390_get_hotplug_handler;
+    mc->cpu_index_to_instance_props = s390_cpu_index_to_props;
+    mc->possible_cpu_arch_ids = s390_possible_cpu_arch_ids;
+    /* it is overridden with 'host' cpu *in kvm_arch_init* */
+    mc->default_cpu_type = S390_CPU_TYPE_NAME("qemu");
+    hc->plug = s390_machine_device_plug;
+    hc->unplug_request = s390_machine_device_unplug_request;
+    nc->nmi_monitor_handler = s390_nmi;
+    mc->default_ram_id = "s390.ram";
+
+    object_class_property_add_bool(oc, "aes-key-wrap",
+                                   machine_get_aes_key_wrap,
+                                   machine_set_aes_key_wrap);
+    object_class_property_set_description(oc, "aes-key-wrap",
             "enable/disable AES key wrapping using the CPACF wrapping key");
-    object_property_set_bool(obj, "aes-key-wrap", true, NULL);
 
-    object_property_add_bool(obj, "dea-key-wrap",
-                             machine_get_dea_key_wrap,
-                             machine_set_dea_key_wrap);
-    object_property_set_description(obj, "dea-key-wrap",
+    object_class_property_add_bool(oc, "dea-key-wrap",
+                                   machine_get_dea_key_wrap,
+                                   machine_set_dea_key_wrap);
+    object_class_property_set_description(oc, "dea-key-wrap",
             "enable/disable DEA key wrapping using the CPACF wrapping key");
-    object_property_set_bool(obj, "dea-key-wrap", true, NULL);
-    object_property_add_str(obj, "loadparm",
-            machine_get_loadparm, machine_set_loadparm);
-    object_property_set_description(obj, "loadparm",
+
+    object_class_property_add(oc, "loadparm", "loadparm",
+                              machine_get_loadparm, machine_set_loadparm,
+                              NULL, NULL);
+    object_class_property_set_description(oc, "loadparm",
             "Up to 8 chars in set of [A-Za-z0-9. ] (lower case chars converted"
             " to upper case) to pass to machine loader, boot manager,"
             " and guest kernel");
 
-    object_property_add_bool(obj, "zpcii-disable",
-                             machine_get_zpcii_disable,
-                             machine_set_zpcii_disable);
-    object_property_set_description(obj, "zpcii-disable",
+    object_class_property_add_bool(oc, "zpcii-disable",
+                                   machine_get_zpcii_disable,
+                                   machine_set_zpcii_disable);
+    object_class_property_set_description(oc, "zpcii-disable",
             "disable zPCI interpretation facilties");
-    object_property_set_bool(obj, "zpcii-disable", false, NULL);
+}
+
+static inline void s390_machine_initfn(Object *obj)
+{
+    S390CcwMachineState *ms = S390_CCW_MACHINE(obj);
+
+    ms->aes_key_wrap = true;
+    ms->dea_key_wrap = true;
+    ms->zpcii_disable = false;
 }
 
 static const TypeInfo ccw_machine_info = {
-- 
2.31.1


