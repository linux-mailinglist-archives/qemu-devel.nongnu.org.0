Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2A3525458
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 20:01:45 +0200 (CEST)
Received: from localhost ([::1]:49714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npD8C-0001ss-LA
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 14:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZK-0004xO-D1
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZI-00058H-6q
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bhVupg2/GBltc5PpogW7MdR4m1Tm99HRGn4qgisRZyk=;
 b=HnRedY2ook2jV7qC2K+vIXatsVB3GN3ZaiDwCcfbAcGbgpH/Mknta3mfE9FHOMxpGL9vwS
 7xb7yg2jcOSQzimLHfg38bKqrYH+M2yEbKUmh0lZkT/vgVJqWSeK4BtQud/d4S+9rulSy7
 jiDLoWqBitbUKBSwQe6M7d1q2oGvbwY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-ClmA2ilpN5K3WFk9_wv3MQ-1; Thu, 12 May 2022 13:25:38 -0400
X-MC-Unique: ClmA2ilpN5K3WFk9_wv3MQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 i14-20020a17090639ce00b006dabe6a112fso3141646eje.13
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bhVupg2/GBltc5PpogW7MdR4m1Tm99HRGn4qgisRZyk=;
 b=7NsZc1vtJc7MqaAINC3KL4OaKbL9Dijqq+Jv14k3eFYo8c7TGtGEcvXLHW8WvwJ4bx
 y+JxHDHOW8kVKDjcM8gtJ73zQ4lgT1Y5Iz+KTsw5M/njo1lV/V7ibtik10gNH5uXTaP0
 wTPYlNE3/FTKrAQbybORpGpmOfFfhnHYqP4GcwgsiLiP04fijqDOC+/h8Lr6IZOR3ieY
 ZHBUgBSgCB92fHuhiygzvqwlU204V9oozKIaik5IY6mKSY0zGgutqpWAnHMwmxe4c3hY
 07Hy7ImZnXxWCQzkdmLO/nltUZkRfkZOjNxOWlCdrW/lin75MW2g8DCv+xtDJXMovf5I
 zPgQ==
X-Gm-Message-State: AOAM533ur9Aoi0My5G+6ApV+j1wSRRplatPiZcsOwSadzsj1oxWYd7Vl
 Xpy3LTyqzdIGBw8vSxP2/sAkjb+VYkX4Tnx9cgcXm01I/DP6SgPimhZHtoOu0uX21KwesBbPXDJ
 aURfpT0try56q+2UxcbDSm+5cRcSPd5BdOH8ny15PO6IrttmSAoYC/vs8cNSK6nchDFs=
X-Received: by 2002:a17:907:d01:b0:6f4:d873:d7a0 with SMTP id
 gn1-20020a1709070d0100b006f4d873d7a0mr827426ejc.717.1652376336647; 
 Thu, 12 May 2022 10:25:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxr1lk3GOs7GUtMJZr+TUAVepshMs1PLO+AYYLlcZvPDUWiyP4Bx29+Ty6K8Xe8BTbWtgS5TA==
X-Received: by 2002:a17:907:d01:b0:6f4:d873:d7a0 with SMTP id
 gn1-20020a1709070d0100b006f4d873d7a0mr827396ejc.717.1652376336107; 
 Thu, 12 May 2022 10:25:36 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a1709063e1200b006f3ef214e20sm2300312eji.134.2022.05.12.10.25.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:25:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/27] machine: add mem compound property
Date: Thu, 12 May 2022 19:24:51 +0200
Message-Id: <20220512172505.1065394-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512172505.1065394-1-pbonzini@redhat.com>
References: <20220512172505.1065394-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Make -m syntactic sugar for a compound property "-machine
mem.{size,max-size,slots}".  The new property does not have
the magic conversion to megabytes of unsuffixed arguments,
and also does not understand that "0" means the default size
(you have to leave it out to get the default).  This means
that we need to convert the QemuOpts by hand to a QDict.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220414165300.555321-4-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c |  80 ++++++++++++++++++++++++++++++
 qapi/machine.json |  18 +++++++
 softmmu/vl.c      | 123 +++++++++++++++-------------------------------
 3 files changed, 138 insertions(+), 83 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 8cea94537d..46b8d0effa 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -523,6 +523,78 @@ static void machine_set_hmat(Object *obj, bool value, Error **errp)
     ms->numa_state->hmat_enabled = value;
 }
 
+static void machine_get_mem(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+    MemorySizeConfiguration mem = {
+        .has_size = true,
+        .size = ms->ram_size,
+        .has_max_size = !!ms->ram_slots,
+        .max_size = ms->maxram_size,
+        .has_slots = !!ms->ram_slots,
+        .slots = ms->ram_slots,
+    };
+    MemorySizeConfiguration *p_mem = &mem;
+
+    visit_type_MemorySizeConfiguration(v, name, &p_mem, &error_abort);
+}
+
+static void machine_set_mem(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+    MachineClass *mc = MACHINE_GET_CLASS(obj);
+    MemorySizeConfiguration *mem;
+
+    ERRP_GUARD();
+
+    if (!visit_type_MemorySizeConfiguration(v, name, &mem, errp)) {
+        return;
+    }
+
+    if (!mem->has_size) {
+        mem->has_size = true;
+        mem->size = mc->default_ram_size;
+    }
+    mem->size = QEMU_ALIGN_UP(mem->size, 8192);
+    if (mc->fixup_ram_size) {
+        mem->size = mc->fixup_ram_size(mem->size);
+    }
+    if ((ram_addr_t)mem->size != mem->size) {
+        error_setg(errp, "ram size too large");
+        goto out_free;
+    }
+
+    if (mem->has_max_size) {
+        if (mem->max_size < mem->size) {
+            error_setg(errp, "invalid value of maxmem: "
+                       "maximum memory size (0x%" PRIx64 ") must be at least "
+                       "the initial memory size (0x%" PRIx64 ")",
+                       mem->max_size, mem->size);
+            goto out_free;
+        }
+        if (mem->has_slots && mem->slots && mem->max_size == mem->size) {
+            error_setg(errp, "invalid value of maxmem: "
+                       "memory slots were specified but maximum memory size "
+                       "(0x%" PRIx64 ") is equal to the initial memory size "
+                       "(0x%" PRIx64 ")", mem->max_size, mem->size);
+            goto out_free;
+        }
+        ms->maxram_size = mem->max_size;
+    } else {
+        if (mem->has_slots) {
+            error_setg(errp, "slots specified but no max-size");
+            goto out_free;
+        }
+        ms->maxram_size = mem->size;
+    }
+    ms->ram_size = mem->size;
+    ms->ram_slots = mem->has_slots ? mem->slots : 0;
+out_free:
+    qapi_free_MemorySizeConfiguration(mem);
+}
+
 static char *machine_get_nvdimm_persistence(Object *obj, Error **errp)
 {
     MachineState *ms = MACHINE(obj);
@@ -953,6 +1025,12 @@ static void machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "memory-backend",
                                           "Set RAM backend"
                                           "Valid value is ID of hostmem based backend");
+
+    object_class_property_add(oc, "memory", "MemorySizeConfiguration",
+        machine_get_mem, machine_set_mem,
+        NULL, NULL);
+    object_class_property_set_description(oc, "memory",
+        "Memory size configuration");
 }
 
 static void machine_class_base_init(ObjectClass *oc, void *data)
@@ -983,6 +1061,8 @@ static void machine_initfn(Object *obj)
     ms->mem_merge = true;
     ms->enable_graphics = true;
     ms->kernel_cmdline = g_strdup("");
+    ms->ram_size = mc->default_ram_size;
+    ms->maxram_size = mc->default_ram_size;
 
     if (mc->nvdimm_supported) {
         Object *obj = OBJECT(ms);
diff --git a/qapi/machine.json b/qapi/machine.json
index e3dcf5a119..92480d4044 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1614,3 +1614,21 @@
 ##
 { 'enum': 'SmbiosEntryPointType',
   'data': [ '32', '64' ] }
+
+##
+# @MemorySizeConfiguration:
+#
+# Schema for memory size configuration.
+#
+# @size: memory size in bytes
+#
+# @max-size: maximum hotpluggable memory size in bytes
+#
+# @slots: number of available memory slots for hotplug
+#
+# Since: 7.1
+##
+{ 'struct': 'MemorySizeConfiguration', 'data': {
+     '*size': 'size',
+     '*max-size': 'size',
+     '*slots': 'uint64' } }
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 13ae31e92f..65a665e0bc 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -159,11 +159,10 @@ static const char *mem_path;
 static const char *incoming;
 static const char *loadvm;
 static const char *accelerators;
+static bool have_custom_ram_size;
 static QDict *machine_opts_dict;
 static QTAILQ_HEAD(, ObjectOption) object_opts = QTAILQ_HEAD_INITIALIZER(object_opts);
 static QTAILQ_HEAD(, DeviceOption) device_opts = QTAILQ_HEAD_INITIALIZER(device_opts);
-static ram_addr_t maxram_size;
-static uint64_t ram_slots;
 static int display_remote;
 static int snapshot;
 static bool preconfig_requested;
@@ -171,7 +170,6 @@ static QemuPluginList plugin_list = QTAILQ_HEAD_INITIALIZER(plugin_list);
 static BlockdevOptionsQueue bdo_queue = QSIMPLEQ_HEAD_INITIALIZER(bdo_queue);
 static bool nographic = false;
 static int mem_prealloc; /* force preallocation of physical target memory */
-static ram_addr_t ram_size;
 static const char *vga_model = NULL;
 static DisplayOptions dpy;
 static int num_serial_hds;
@@ -1736,6 +1734,7 @@ static void keyval_dashify(QDict *qdict, Error **errp)
 static void qemu_apply_legacy_machine_options(QDict *qdict)
 {
     const char *value;
+    QObject *prop;
 
     keyval_dashify(qdict, &error_fatal);
 
@@ -1768,6 +1767,13 @@ static void qemu_apply_legacy_machine_options(QDict *qdict)
                                    false);
         qdict_del(qdict, "kernel-irqchip");
     }
+
+    prop = qdict_get(qdict, "memory");
+    if (prop) {
+        have_custom_ram_size =
+            qobject_type(prop) == QTYPE_QDICT &&
+            qdict_haskey(qobject_to(QDict, prop), "size");
+    }
 }
 
 static void object_option_foreach_add(bool (*type_opt_predicate)(const char *))
@@ -1885,9 +1891,6 @@ static bool object_create_early(const char *type)
 static void qemu_apply_machine_options(QDict *qdict)
 {
     object_set_properties_from_keyval(OBJECT(current_machine), qdict, false, &error_fatal);
-    current_machine->ram_size = ram_size;
-    current_machine->maxram_size = maxram_size;
-    current_machine->ram_slots = ram_slots;
 
     if (semihosting_enabled() && !semihosting_get_argc()) {
         /* fall back to the -kernel/-append */
@@ -1998,12 +2001,6 @@ static void qemu_create_late_backends(void)
     qemu_semihosting_console_init();
 }
 
-static bool have_custom_ram_size(void)
-{
-    QemuOpts *opts = qemu_find_opts_singleton("memory");
-    return !!qemu_opt_get_size(opts, "size", 0);
-}
-
 static void qemu_resolve_machine_memdev(void)
 {
     if (current_machine->ram_memdev_id) {
@@ -2018,7 +2015,7 @@ static void qemu_resolve_machine_memdev(void)
             exit(EXIT_FAILURE);
         }
         backend_size = object_property_get_uint(backend, "size",  &error_abort);
-        if (have_custom_ram_size() && backend_size != ram_size) {
+        if (have_custom_ram_size && backend_size != current_machine->ram_size) {
                 error_report("Size specified by -m option must match size of "
                              "explicitly specified 'memory-backend' property");
                 exit(EXIT_FAILURE);
@@ -2028,95 +2025,58 @@ static void qemu_resolve_machine_memdev(void)
                          "'-machine memory-backend'");
             exit(EXIT_FAILURE);
         }
-        ram_size = backend_size;
+        current_machine->ram_size = backend_size;
     }
 
     if (!xen_enabled()) {
         /* On 32-bit hosts, QEMU is limited by virtual address space */
-        if (ram_size > (2047 << 20) && HOST_LONG_BITS == 32) {
+        if (current_machine->ram_size > (2047 << 20) && HOST_LONG_BITS == 32) {
             error_report("at most 2047 MB RAM can be simulated");
             exit(1);
         }
     }
 }
 
-static void set_memory_options(MachineClass *mc)
+static void parse_memory_options(const char *arg)
 {
-    uint64_t sz;
+    QemuOpts *opts;
+    QDict *dict, *prop;
     const char *mem_str;
-    const ram_addr_t default_ram_size = mc->default_ram_size;
-    QemuOpts *opts = qemu_find_opts_singleton("memory");
-    Location loc;
 
-    loc_push_none(&loc);
-    qemu_opts_loc_restore(opts);
+    opts = qemu_opts_parse_noisily(qemu_find_opts("memory"), arg, true);
+    if (!opts) {
+        exit(EXIT_FAILURE);
+    }
 
-    sz = 0;
-    mem_str = qemu_opt_get(opts, "size");
-    if (mem_str) {
+    prop = qdict_new();
+
+    if (qemu_opt_get_size(opts, "size", 0) != 0) {
+        mem_str = qemu_opt_get(opts, "size");
         if (!*mem_str) {
             error_report("missing 'size' option value");
             exit(EXIT_FAILURE);
         }
 
-        sz = qemu_opt_get_size(opts, "size", ram_size);
-
         /* Fix up legacy suffix-less format */
         if (g_ascii_isdigit(mem_str[strlen(mem_str) - 1])) {
-            uint64_t overflow_check = sz;
-
-            sz *= MiB;
-            if (sz / MiB != overflow_check) {
-                error_report("too large 'size' option value");
-                exit(EXIT_FAILURE);
-            }
+            g_autofree char *mib_str = g_strdup_printf("%sM", mem_str);
+            qdict_put_str(prop, "size", mib_str);
+        } else {
+            qdict_put_str(prop, "size", mem_str);
         }
     }
 
-    /* backward compatibility behaviour for case "-m 0" */
-    if (sz == 0) {
-        sz = default_ram_size;
-    }
-
-    sz = QEMU_ALIGN_UP(sz, 8192);
-    if (mc->fixup_ram_size) {
-        sz = mc->fixup_ram_size(sz);
-    }
-    ram_size = sz;
-    if (ram_size != sz) {
-        error_report("ram size too large");
-        exit(EXIT_FAILURE);
-    }
-
-    maxram_size = ram_size;
-
     if (qemu_opt_get(opts, "maxmem")) {
-        uint64_t slots;
-
-        sz = qemu_opt_get_size(opts, "maxmem", 0);
-        slots = qemu_opt_get_number(opts, "slots", 0);
-        if (sz < ram_size) {
-            error_report("invalid value of -m option maxmem: "
-                         "maximum memory size (0x%" PRIx64 ") must be at least "
-                         "the initial memory size (0x" RAM_ADDR_FMT ")",
-                         sz, ram_size);
-            exit(EXIT_FAILURE);
-        } else if (slots && sz == ram_size) {
-            error_report("invalid value of -m option maxmem: "
-                         "memory slots were specified but maximum memory size "
-                         "(0x%" PRIx64 ") is equal to the initial memory size "
-                         "(0x" RAM_ADDR_FMT ")", sz, ram_size);
-            exit(EXIT_FAILURE);
-        }
-
-        maxram_size = sz;
-        ram_slots = slots;
-    } else if (qemu_opt_get(opts, "slots")) {
-        error_report("invalid -m option value: missing 'maxmem' option");
-        exit(EXIT_FAILURE);
+        qdict_put_str(prop, "max-size", qemu_opt_get(opts, "maxmem"));
+    }
+    if (qemu_opt_get(opts, "slots")) {
+        qdict_put_str(prop, "slots", qemu_opt_get(opts, "slots"));
     }
 
-    loc_pop(&loc);
+    dict = qdict_new();
+    qdict_put(dict, "memory", prop);
+    keyval_merge(machine_opts_dict, dict, &error_fatal);
+    qobject_unref(dict);
 }
 
 static void qemu_create_machine(QDict *qdict)
@@ -2124,8 +2084,6 @@ static void qemu_create_machine(QDict *qdict)
     MachineClass *machine_class = select_machine(qdict, &error_fatal);
     object_set_machine_compat_props(machine_class->compat_props);
 
-    set_memory_options(machine_class);
-
     current_machine = MACHINE(object_new_with_class(OBJECT_CLASS(machine_class)));
     object_property_add_child(object_get_root(), "machine",
                               OBJECT(current_machine));
@@ -2185,7 +2143,8 @@ static bool is_qemuopts_group(const char *group)
     if (g_str_equal(group, "object") ||
         g_str_equal(group, "machine") ||
         g_str_equal(group, "smp-opts") ||
-        g_str_equal(group, "boot-opts")) {
+        g_str_equal(group, "boot-opts") ||
+        g_str_equal(group, "memory")) {
         return false;
     }
     return true;
@@ -2209,6 +2168,8 @@ static void qemu_record_config_group(const char *group, QDict *dict,
         machine_merge_property("smp", dict, &error_fatal);
     } else if (g_str_equal(group, "boot-opts")) {
         machine_merge_property("boot", dict, &error_fatal);
+    } else if (g_str_equal(group, "memory")) {
+        machine_merge_property("memory", dict, &error_fatal);
     } else {
         abort();
     }
@@ -3009,11 +2970,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 exit(0);
                 break;
             case QEMU_OPTION_m:
-                opts = qemu_opts_parse_noisily(qemu_find_opts("memory"),
-                                               optarg, true);
-                if (!opts) {
-                    exit(EXIT_FAILURE);
-                }
+                parse_memory_options(optarg);
                 break;
 #ifdef CONFIG_TPM
             case QEMU_OPTION_tpmdev:
-- 
2.36.0


