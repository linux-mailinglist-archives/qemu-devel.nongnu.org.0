Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEC0525436
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 19:54:49 +0200 (CEST)
Received: from localhost ([::1]:41226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npD1U-000448-Al
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 13:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZI-0004xK-CH
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZG-00057w-2d
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U30CP4izzkXihBDhA33nyZ9kS2F7QI8bLHL0rdZEMBU=;
 b=IEBW3y/mp4/12oSL4cZJVNCv6QfjjFHUfB1K2BpgEDFBCmSQqkMENPFOyzEUJ4MHwfvy20
 kFBP+buDIiNIYt7yzr1fBS7ooDK0Tzq6/kafC3oVP95cTuqc/7Wq/DJ9/dsAWp+izu9p/o
 lMstRQEMwsmkBY/ZKIQC4aMpcMzZMiw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-fDtW78VOMfiiNs6A-_1LjQ-1; Thu, 12 May 2022 13:25:36 -0400
X-MC-Unique: fDtW78VOMfiiNs6A-_1LjQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 dn26-20020a05640222fa00b00425e4b8efa9so3502934edb.1
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U30CP4izzkXihBDhA33nyZ9kS2F7QI8bLHL0rdZEMBU=;
 b=Psh/lF1c/AG/ztoZYCE3Cao/8D04rkPlTEBEvSXdevyhdeS8+YpMV8nqybuwqhxlwT
 d6z+uIBsTDkpMyZEzplO5dW7okHo9lNs6FyNkEORiD3e10fsuYkfEJJ/0shDZ0BhWZGo
 zhxz/6jUCTqML4GqQnogJ+ZNhp4hmlRx7dQBKVMgBuSaT8CQtETLxC4y0aDET1R+vgyX
 8C8uP+5xTNUvsk4OVqb3AgeUY7fReqeSfmwuuUzysaPshBdOEdIM/3AeA8JSM7NcX7cn
 PagMj4jCWhwKcUZoXhirjtEF/LNPcQiFQvXc+a9mSn+Sm4gNj7fI+zaq1ghVLT1rSOwG
 awGA==
X-Gm-Message-State: AOAM530IoxDE4Ak/PS/iONM81q2ZfYVMyMK4KNpbRGV7TPm8YGsVII6q
 4/9afAH5RoOulXwQLMnm/bF6XlhXvBCmoCbFOY7+FCOmwAmBF3Of0bqTc9bEMM30dXCbGLidNcI
 WbMl9ZMb9qk6n2e4gB0oNetWo83t5sjUJHa6yiZgWXFXr4dmr9Hq3+XH0Z39NUq8xzrg=
X-Received: by 2002:a17:907:8a0f:b0:6f4:3eeb:90db with SMTP id
 sc15-20020a1709078a0f00b006f43eeb90dbmr830593ejc.27.1652376334619; 
 Thu, 12 May 2022 10:25:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3lgSbvWxHDQOLHqjfGgFuWG/02q6NUf9yWCRx1GZtsI8/nAluBfgOe9kVVKLly1jdI8NJiQ==
X-Received: by 2002:a17:907:8a0f:b0:6f4:3eeb:90db with SMTP id
 sc15-20020a1709078a0f00b006f43eeb90dbmr830566ejc.27.1652376334226; 
 Thu, 12 May 2022 10:25:34 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a056402060100b00428aafb23d0sm2689219edv.57.2022.05.12.10.25.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:25:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/27] machine: add boot compound property
Date: Thu, 12 May 2022 19:24:50 +0200
Message-Id: <20220512172505.1065394-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512172505.1065394-1-pbonzini@redhat.com>
References: <20220512172505.1065394-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make -boot syntactic sugar for a compound property "-machine boot.{order,menu,...}".
machine_boot_parse is replaced by the setter for the property.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220414165300.555321-3-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c   | 100 +++++++++++++++++++++++---------------------
 include/hw/boards.h |   1 -
 softmmu/vl.c        |  16 +++----
 3 files changed, 58 insertions(+), 59 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index b3deb8146f..8cea94537d 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -784,66 +784,63 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
     machine_parse_smp_config(ms, config, errp);
 }
 
-void machine_boot_parse(MachineState *ms, QemuOpts *opts, Error **errp)
+static void machine_get_boot(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+    BootConfiguration *config = &ms->boot_config;
+    visit_type_BootConfiguration(v, name, &config, &error_abort);
+}
+
+static void machine_free_boot_config(MachineState *ms)
+{
+    g_free(ms->boot_config.order);
+    g_free(ms->boot_config.once);
+    g_free(ms->boot_config.splash);
+}
+
+static void machine_copy_boot_config(MachineState *ms, BootConfiguration *config)
 {
     MachineClass *machine_class = MACHINE_GET_CLASS(ms);
-    const char *s;
-    ERRP_GUARD();
 
-    ms->boot_config = (BootConfiguration) {
-        .has_order = true,
-        .order = (char *)machine_class->default_boot_order,
-        .has_strict = true,
-        .strict = false,
-    };
-    if (!opts) {
+    machine_free_boot_config(ms);
+    ms->boot_config = *config;
+    if (!config->has_order) {
+        ms->boot_config.has_order = true;
+        ms->boot_config.order = g_strdup(machine_class->default_boot_order);
+    }
+}
+
+static void machine_set_boot(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    ERRP_GUARD();
+    MachineState *ms = MACHINE(obj);
+    BootConfiguration *config = NULL;
+
+    if (!visit_type_BootConfiguration(v, name, &config, errp)) {
         return;
     }
-
-    s = qemu_opt_get(opts, "order");
-    if (s) {
-        validate_bootdevices(s, errp);
+    if (config->has_order) {
+        validate_bootdevices(config->order, errp);
         if (*errp) {
-            return;
+            goto out_free;
         }
-        ms->boot_config.order = (char *)s;
     }
-
-    s = qemu_opt_get(opts, "once");
-    if (s) {
-        validate_bootdevices(s, errp);
+    if (config->has_once) {
+        validate_bootdevices(config->once, errp);
         if (*errp) {
-            return;
+            goto out_free;
         }
-        ms->boot_config.has_once = true;
-        ms->boot_config.once = (char *)s;
     }
 
-    s = qemu_opt_get(opts, "splash");
-    if (s) {
-        ms->boot_config.has_splash = true;
-        ms->boot_config.splash = (char *)s;
-    }
+    machine_copy_boot_config(ms, config);
+    /* Strings live in ms->boot_config.  */
+    free(config);
+    return;
 
-    s = qemu_opt_get(opts, "splash-time");
-    if (s) {
-        ms->boot_config.has_splash_time = true;
-        ms->boot_config.splash_time = qemu_opt_get_number(opts, "splash-time", -1);
-    }
-
-    s = qemu_opt_get(opts, "reboot-timeout");
-    if (s) {
-        ms->boot_config.has_reboot_timeout = true;
-        ms->boot_config.reboot_timeout = qemu_opt_get_number(opts, "reboot-timeout", -1);
-    }
-
-    s = qemu_opt_get(opts, "menu");
-    if (s) {
-        ms->boot_config.has_menu = true;
-        ms->boot_config.menu = qemu_opt_get_bool(opts, "menu", false);
-    }
-
-    ms->boot_config.strict = qemu_opt_get_bool(opts, "strict", false);
+out_free:
+    qapi_free_BootConfiguration(config);
 }
 
 static void machine_class_init(ObjectClass *oc, void *data)
@@ -884,6 +881,12 @@ static void machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "dumpdtb",
         "Dump current dtb to a file and quit");
 
+    object_class_property_add(oc, "boot", "BootConfiguration",
+        machine_get_boot, machine_set_boot,
+        NULL, NULL);
+    object_class_property_set_description(oc, "boot",
+        "Boot configuration");
+
     object_class_property_add(oc, "smp", "SMPConfiguration",
         machine_get_smp, machine_set_smp,
         NULL, NULL);
@@ -1017,12 +1020,15 @@ static void machine_initfn(Object *obj)
     ms->smp.clusters = 1;
     ms->smp.cores = 1;
     ms->smp.threads = 1;
+
+    machine_copy_boot_config(ms, &(BootConfiguration){ 0 });
 }
 
 static void machine_finalize(Object *obj)
 {
     MachineState *ms = MACHINE(obj);
 
+    machine_free_boot_config(ms);
     g_free(ms->kernel_filename);
     g_free(ms->initrd_filename);
     g_free(ms->kernel_cmdline);
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 6cda7e4308..910c3ffde2 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -26,7 +26,6 @@ OBJECT_DECLARE_TYPE(MachineState, MachineClass, MACHINE)
 extern MachineState *current_machine;
 
 void machine_run_board_init(MachineState *machine);
-void machine_boot_parse(MachineState *ms, QemuOpts *opts, Error **errp);
 bool machine_usb(MachineState *machine);
 int machine_phandle_start(MachineState *machine);
 bool machine_dump_guest_core(MachineState *machine);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index dd90df3ed1..13ae31e92f 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1884,16 +1884,11 @@ static bool object_create_early(const char *type)
 
 static void qemu_apply_machine_options(QDict *qdict)
 {
-    QemuOpts *opts;
-
     object_set_properties_from_keyval(OBJECT(current_machine), qdict, false, &error_fatal);
     current_machine->ram_size = ram_size;
     current_machine->maxram_size = maxram_size;
     current_machine->ram_slots = ram_slots;
 
-    opts = qemu_opts_find(qemu_find_opts("boot-opts"), NULL);
-    machine_boot_parse(current_machine, opts, &error_fatal);
-
     if (semihosting_enabled() && !semihosting_get_argc()) {
         /* fall back to the -kernel/-append */
         semihosting_arg_fallback(current_machine->kernel_filename, current_machine->kernel_cmdline);
@@ -2189,7 +2184,8 @@ static bool is_qemuopts_group(const char *group)
 {
     if (g_str_equal(group, "object") ||
         g_str_equal(group, "machine") ||
-        g_str_equal(group, "smp-opts")) {
+        g_str_equal(group, "smp-opts") ||
+        g_str_equal(group, "boot-opts")) {
         return false;
     }
     return true;
@@ -2211,6 +2207,8 @@ static void qemu_record_config_group(const char *group, QDict *dict,
         keyval_merge(machine_opts_dict, dict, errp);
     } else if (g_str_equal(group, "smp-opts")) {
         machine_merge_property("smp", dict, &error_fatal);
+    } else if (g_str_equal(group, "boot-opts")) {
+        machine_merge_property("boot", dict, &error_fatal);
     } else {
         abort();
     }
@@ -2956,11 +2954,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 drive_add(IF_DEFAULT, 2, optarg, CDROM_OPTS);
                 break;
             case QEMU_OPTION_boot:
-                opts = qemu_opts_parse_noisily(qemu_find_opts("boot-opts"),
-                                               optarg, true);
-                if (!opts) {
-                    exit(1);
-                }
+                machine_parse_property_opt(qemu_find_opts("boot-opts"), "boot", optarg);
                 break;
             case QEMU_OPTION_fda:
             case QEMU_OPTION_fdb:
-- 
2.36.0


