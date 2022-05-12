Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B30852543E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 19:57:17 +0200 (CEST)
Received: from localhost ([::1]:42930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npD3s-0005Og-2s
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 13:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZH-0004xH-Fn
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZE-00057r-W5
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lhJ5vE+dOrxLOB17bzwnIyTRcOO1BY3c7rjADD9EXkA=;
 b=hy0DB0y+sIoJXbSybriBOgZOYKfnLlESAOH35AgAePDGayp6FiEO7je6v7rW1Kgiz/h91y
 0iHIev53OztrNLxX5GZTc4uynOVUIIw/MrDWG7R5BiuYvsJlpwXqpzIzJkCkj6PiMyFDs4
 E/gZ1o/V3PTuF25vgRTqzwcVZgK+WTE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-bLvQQ36IMhOZMRiuFgb62Q-1; Thu, 12 May 2022 13:25:34 -0400
X-MC-Unique: bLvQQ36IMhOZMRiuFgb62Q-1
Received: by mail-ej1-f71.google.com with SMTP id
 v13-20020a170906b00d00b006f51e289f7cso3131296ejy.19
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lhJ5vE+dOrxLOB17bzwnIyTRcOO1BY3c7rjADD9EXkA=;
 b=owfHX0pKHrcpqk1R5bg7ROVBkaXj7/asO9K1ySHgvr4vFEJyyI+Y3SD6IgV37GkYhQ
 tttecE0/g/TRTXnvlbJv+0AA5h/507Kqy7IBiDiOPz8cNFWu54F3RqPAiVbPsHkNFXnZ
 IZIoT0ZpEK93sMWMblg7l2yv4d+lootH5seS7t0hU96bLBj4Qa0dmaSpGHLOZoJ/RyyY
 /eFcIIx6WtOHNzrTficWCT6BEiX9ZzVfZ8yvoOs399NTOPPfcJ8aeEz0VSeHz2/t/z9t
 6itwlVhlrlUcq1EfAJrryvyCrpd0nDd6M1kX99cWoI1+SM7ePfewdiecMofSA9oEpCZL
 xA5w==
X-Gm-Message-State: AOAM532Tem3jXLAd4Z9JMJqCIHjywsFBTT0H1iySFE6+6wMVpMQHnf9q
 hFMaOyIlCygV9i6RQn79vyNHAsGGDXEXV41Bdt47nZq3IST3+pETRKCsvbnO0GfflTeYtXiKdAF
 7tFknQ/R/3Qwll/36TWxIVD1Vrc57bN/iu9G868r8dYbAf9Jr2pGPUCWUJ7W7MnR1Xbs=
X-Received: by 2002:a17:906:cb90:b0:6f4:d91b:1025 with SMTP id
 mf16-20020a170906cb9000b006f4d91b1025mr858906ejb.177.1652376332953; 
 Thu, 12 May 2022 10:25:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBqdAMJUaeSVyRuetX0p0suKywr/eihm3B3DVxNsiDiU3wA4xh8CpK182Rj0Dot2HTLVjexg==
X-Received: by 2002:a17:906:cb90:b0:6f4:d91b:1025 with SMTP id
 mf16-20020a170906cb9000b006f4d91b1025mr858864ejb.177.1652376332328; 
 Thu, 12 May 2022 10:25:32 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a056402134d00b0042617ba63d6sm2743159edw.96.2022.05.12.10.25.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:25:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/27] machine: use QAPI struct for boot configuration
Date: Thu, 12 May 2022 19:24:49 +0200
Message-Id: <20220512172505.1065394-12-pbonzini@redhat.com>
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

As part of converting -boot to a property with a QAPI type, define
the struct and use it throughout QEMU to access boot configuration.
machine_boot_parse takes care of doing the QemuOpts->QAPI conversion by
hand, for now.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220414165300.555321-2-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/arm/nseries.c        |  2 +-
 hw/core/machine.c       | 68 +++++++++++++++++++++++++++++++++++++++--
 hw/hppa/machine.c       |  6 ++--
 hw/i386/pc.c            |  2 +-
 hw/nvram/fw_cfg.c       | 27 +++++-----------
 hw/ppc/mac_newworld.c   |  2 +-
 hw/ppc/mac_oldworld.c   |  2 +-
 hw/ppc/prep.c           |  2 +-
 hw/ppc/spapr.c          |  4 +--
 hw/s390x/ipl.c          | 20 ++++--------
 hw/sparc/sun4m.c        |  4 +--
 hw/sparc64/sun4u.c      |  4 +--
 include/hw/boards.h     |  4 +--
 include/sysemu/sysemu.h |  2 --
 qapi/machine.json       | 30 ++++++++++++++++++
 softmmu/bootdevice.c    |  3 +-
 softmmu/globals.c       |  2 --
 softmmu/vl.c            | 25 +--------------
 18 files changed, 127 insertions(+), 82 deletions(-)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 9c1cafae86..692c94ceb4 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -1365,7 +1365,7 @@ static void n8x0_init(MachineState *machine,
     }
 
     if (option_rom[0].name &&
-        (machine->boot_order[0] == 'n' || !machine->kernel_filename)) {
+        (machine->boot_config.order[0] == 'n' || !machine->kernel_filename)) {
         uint8_t *nolo_tags = g_new(uint8_t, 0x10000);
         /* No, wait, better start at the ROM.  */
         s->mpu->cpu->env.regs[15] = OMAP2_Q2_BASE + 0x400000;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 700c1e76b8..b3deb8146f 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -784,6 +784,68 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
     machine_parse_smp_config(ms, config, errp);
 }
 
+void machine_boot_parse(MachineState *ms, QemuOpts *opts, Error **errp)
+{
+    MachineClass *machine_class = MACHINE_GET_CLASS(ms);
+    const char *s;
+    ERRP_GUARD();
+
+    ms->boot_config = (BootConfiguration) {
+        .has_order = true,
+        .order = (char *)machine_class->default_boot_order,
+        .has_strict = true,
+        .strict = false,
+    };
+    if (!opts) {
+        return;
+    }
+
+    s = qemu_opt_get(opts, "order");
+    if (s) {
+        validate_bootdevices(s, errp);
+        if (*errp) {
+            return;
+        }
+        ms->boot_config.order = (char *)s;
+    }
+
+    s = qemu_opt_get(opts, "once");
+    if (s) {
+        validate_bootdevices(s, errp);
+        if (*errp) {
+            return;
+        }
+        ms->boot_config.has_once = true;
+        ms->boot_config.once = (char *)s;
+    }
+
+    s = qemu_opt_get(opts, "splash");
+    if (s) {
+        ms->boot_config.has_splash = true;
+        ms->boot_config.splash = (char *)s;
+    }
+
+    s = qemu_opt_get(opts, "splash-time");
+    if (s) {
+        ms->boot_config.has_splash_time = true;
+        ms->boot_config.splash_time = qemu_opt_get_number(opts, "splash-time", -1);
+    }
+
+    s = qemu_opt_get(opts, "reboot-timeout");
+    if (s) {
+        ms->boot_config.has_reboot_timeout = true;
+        ms->boot_config.reboot_timeout = qemu_opt_get_number(opts, "reboot-timeout", -1);
+    }
+
+    s = qemu_opt_get(opts, "menu");
+    if (s) {
+        ms->boot_config.has_menu = true;
+        ms->boot_config.menu = qemu_opt_get_bool(opts, "menu", false);
+    }
+
+    ms->boot_config.strict = qemu_opt_get_bool(opts, "strict", false);
+}
+
 static void machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1229,9 +1291,9 @@ void qdev_machine_creation_done(void)
 {
     cpu_synchronize_all_post_init();
 
-    if (current_machine->boot_once) {
-        qemu_boot_set(current_machine->boot_once, &error_fatal);
-        qemu_register_reset(restore_boot_order, g_strdup(current_machine->boot_order));
+    if (current_machine->boot_config.has_once) {
+        qemu_boot_set(current_machine->boot_config.once, &error_fatal);
+        qemu_register_reset(restore_boot_order, g_strdup(current_machine->boot_config.order));
     }
 
     /*
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 4d054ca869..d1e174b1f4 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -147,7 +147,7 @@ static FWCfgState *create_fw_cfg(MachineState *ms)
     fw_cfg_add_file(fw_cfg, "/etc/power-button-addr",
                     g_memdup(&val, sizeof(val)), sizeof(val));
 
-    fw_cfg_add_i16(fw_cfg, FW_CFG_BOOT_DEVICE, ms->boot_order[0]);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_BOOT_DEVICE, ms->boot_config.order[0]);
     qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
 
     return fw_cfg;
@@ -391,8 +391,8 @@ static void machine_hppa_init(MachineState *machine)
          * mode (kernel_entry=1), and to boot from CD (gr[24]='d')
          * or hard disc * (gr[24]='c').
          */
-        kernel_entry = boot_menu ? 1 : 0;
-        cpu[0]->env.gr[24] = machine->boot_order[0];
+        kernel_entry = machine->boot_config.has_menu ? machine->boot_config.menu : 0;
+        cpu[0]->env.gr[24] = machine->boot_config.order[0];
     }
 
     /* We jump to the firmware entry routine and pass the
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 23bba9d82c..305d2c0820 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -675,7 +675,7 @@ void pc_cmos_init(PCMachineState *pcms,
     object_property_set_link(OBJECT(pcms), "rtc_state", OBJECT(s),
                              &error_abort);
 
-    set_boot_dev(s, MACHINE(pcms)->boot_order, &error_fatal);
+    set_boot_dev(s, MACHINE(pcms)->boot_config.order, &error_fatal);
 
     val = 0;
     val |= 0x02; /* FPU is there */
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 4125cbebcd..d605f3f45a 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -178,21 +178,13 @@ error:
 
 static void fw_cfg_bootsplash(FWCfgState *s)
 {
-    const char *boot_splash_filename = NULL;
-    const char *boot_splash_time = NULL;
     char *filename, *file_data;
     gsize file_size;
     int file_type;
 
-    /* get user configuration */
-    QemuOptsList *plist = qemu_find_opts("boot-opts");
-    QemuOpts *opts = QTAILQ_FIRST(&plist->head);
-    boot_splash_filename = qemu_opt_get(opts, "splash");
-    boot_splash_time = qemu_opt_get(opts, "splash-time");
-
     /* insert splash time if user configurated */
-    if (boot_splash_time) {
-        int64_t bst_val = qemu_opt_get_number(opts, "splash-time", -1);
+    if (current_machine->boot_config.has_splash_time) {
+        int64_t bst_val = current_machine->boot_config.splash_time;
         uint16_t bst_le16;
 
         /* validate the input */
@@ -208,7 +200,8 @@ static void fw_cfg_bootsplash(FWCfgState *s)
     }
 
     /* insert splash file if user configurated */
-    if (boot_splash_filename) {
+    if (current_machine->boot_config.has_splash) {
+        const char *boot_splash_filename = current_machine->boot_config.splash;
         filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, boot_splash_filename);
         if (filename == NULL) {
             error_report("failed to find file '%s'", boot_splash_filename);
@@ -238,17 +231,11 @@ static void fw_cfg_bootsplash(FWCfgState *s)
 
 static void fw_cfg_reboot(FWCfgState *s)
 {
-    const char *reboot_timeout = NULL;
     uint64_t rt_val = -1;
     uint32_t rt_le32;
 
-    /* get user configuration */
-    QemuOptsList *plist = qemu_find_opts("boot-opts");
-    QemuOpts *opts = QTAILQ_FIRST(&plist->head);
-    reboot_timeout = qemu_opt_get(opts, "reboot-timeout");
-
-    if (reboot_timeout) {
-        rt_val = qemu_opt_get_number(opts, "reboot-timeout", -1);
+    if (current_machine->boot_config.has_reboot_timeout) {
+        rt_val = current_machine->boot_config.reboot_timeout;
 
         /* validate the input */
         if (rt_val > 0xffff && rt_val != (uint64_t)-1) {
@@ -1133,7 +1120,7 @@ static void fw_cfg_common_realize(DeviceState *dev, Error **errp)
     fw_cfg_add_bytes(s, FW_CFG_SIGNATURE, (char *)"QEMU", 4);
     fw_cfg_add_bytes(s, FW_CFG_UUID, &qemu_uuid, 16);
     fw_cfg_add_i16(s, FW_CFG_NOGRAPHIC, (uint16_t)!machine->enable_graphics);
-    fw_cfg_add_i16(s, FW_CFG_BOOT_MENU, (uint16_t)boot_menu);
+    fw_cfg_add_i16(s, FW_CFG_BOOT_MENU, (uint16_t)(machine->boot_config.has_menu && machine->boot_config.menu));
     fw_cfg_bootsplash(s);
     fw_cfg_reboot(s);
 
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index e8ef1a9e5d..c865921bdc 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -111,7 +111,7 @@ static void ppc_core99_init(MachineState *machine)
     const char *kernel_filename = machine->kernel_filename;
     const char *kernel_cmdline = machine->kernel_cmdline;
     const char *initrd_filename = machine->initrd_filename;
-    const char *boot_device = machine->boot_order;
+    const char *boot_device = machine->boot_config.order;
     Core99MachineState *core99_machine = CORE99_MACHINE(machine);
     PowerPCCPU *cpu = NULL;
     CPUPPCState *env = NULL;
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index fe2adb057b..d62fdf0db3 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -82,7 +82,7 @@ static void ppc_heathrow_init(MachineState *machine)
 {
     ram_addr_t ram_size = machine->ram_size;
     const char *bios_name = machine->firmware ?: PROM_FILENAME;
-    const char *boot_device = machine->boot_order;
+    const char *boot_device = machine->boot_config.order;
     PowerPCCPU *cpu = NULL;
     CPUPPCState *env = NULL;
     char *filename;
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index bf622aa38f..a1cd4505cc 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -381,7 +381,7 @@ static void ibm_40p_init(MachineState *machine)
         }
         boot_device = 'm';
     } else {
-        boot_device = machine->boot_order[0];
+        boot_device = machine->boot_config.order[0];
     }
 
     fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)machine->smp.max_cpus);
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 8bbae68e1b..6de800524a 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1044,8 +1044,8 @@ static void spapr_dt_chosen(SpaprMachineState *spapr, void *fdt, bool reset)
                 _FDT(fdt_setprop(fdt, chosen, "qemu,boot-kernel-le", NULL, 0));
             }
         }
-        if (boot_menu) {
-            _FDT((fdt_setprop_cell(fdt, chosen, "qemu,boot-menu", boot_menu)));
+        if (machine->boot_config.has_menu && machine->boot_config.menu) {
+            _FDT((fdt_setprop_cell(fdt, chosen, "qemu,boot-menu", true)));
         }
         _FDT(fdt_setprop_cell(fdt, chosen, "qemu,graphic-width", graphic_width));
         _FDT(fdt_setprop_cell(fdt, chosen, "qemu,graphic-height", graphic_height));
diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index 4b5eb77afd..8612684d48 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -290,13 +290,10 @@ static Property s390_ipl_properties[] = {
 
 static void s390_ipl_set_boot_menu(S390IPLState *ipl)
 {
-    QemuOptsList *plist = qemu_find_opts("boot-opts");
-    QemuOpts *opts = QTAILQ_FIRST(&plist->head);
-    const char *tmp;
     unsigned long splash_time = 0;
 
     if (!get_boot_device(0)) {
-        if (boot_menu) {
+        if (current_machine->boot_config.has_menu && current_machine->boot_config.menu) {
             error_report("boot menu requires a bootindex to be specified for "
                          "the IPL device");
         }
@@ -306,7 +303,7 @@ static void s390_ipl_set_boot_menu(S390IPLState *ipl)
     switch (ipl->iplb.pbt) {
     case S390_IPL_TYPE_CCW:
         /* In the absence of -boot menu, use zipl parameters */
-        if (!qemu_opt_get(opts, "menu")) {
+        if (!current_machine->boot_config.has_menu) {
             ipl->qipl.qipl_flags |= QIPL_FLAG_BM_OPTS_ZIPL;
             return;
         }
@@ -314,26 +311,21 @@ static void s390_ipl_set_boot_menu(S390IPLState *ipl)
     case S390_IPL_TYPE_QEMU_SCSI:
         break;
     default:
-        if (boot_menu) {
+        if (current_machine->boot_config.has_menu && current_machine->boot_config.menu) {
             error_report("boot menu is not supported for this device type");
         }
         return;
     }
 
-    if (!boot_menu) {
+    if (!current_machine->boot_config.has_menu || !current_machine->boot_config.menu) {
         return;
     }
 
     ipl->qipl.qipl_flags |= QIPL_FLAG_BM_OPTS_CMD;
 
-    tmp = qemu_opt_get(opts, "splash-time");
-
-    if (tmp && qemu_strtoul(tmp, NULL, 10, &splash_time)) {
-        error_report("splash-time is invalid, forcing it to 0");
-        ipl->qipl.boot_menu_timeout = 0;
-        return;
+    if (current_machine->boot_config.has_splash_time) {
+        splash_time = current_machine->boot_config.splash_time;
     }
-
     if (splash_time > 0xffffffff) {
         error_report("splash-time is too large, forcing it to max value");
         ipl->qipl.boot_menu_timeout = 0xffffffff;
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index b693eea0e0..9d57491f68 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -1050,7 +1050,7 @@ static void sun4m_hw_init(MachineState *machine)
                                     machine->ram_size, &initrd_size);
 
     nvram_init(nvram, (uint8_t *)&nd->macaddr, machine->kernel_cmdline,
-               machine->boot_order, machine->ram_size, kernel_size,
+               machine->boot_config.order, machine->ram_size, kernel_size,
                graphic_width, graphic_height, graphic_depth,
                hwdef->nvram_machine_id, "Sun4m");
 
@@ -1091,7 +1091,7 @@ static void sun4m_hw_init(MachineState *machine)
     }
     fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_ADDR, INITRD_LOAD_ADDR);
     fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_SIZE, initrd_size);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_BOOT_DEVICE, machine->boot_order[0]);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_BOOT_DEVICE, machine->boot_config.order[0]);
     qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
 }
 
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 7c461d194a..d1bc77d27e 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -695,7 +695,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
                                     &kernel_addr, &kernel_entry);
 
     sun4u_NVRAM_set_params(nvram, NVRAM_SIZE, "Sun4u", machine->ram_size,
-                           machine->boot_order,
+                           machine->boot_config.order,
                            kernel_addr, kernel_size,
                            machine->kernel_cmdline,
                            initrd_addr, initrd_size,
@@ -727,7 +727,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
     }
     fw_cfg_add_i64(fw_cfg, FW_CFG_INITRD_ADDR, initrd_addr);
     fw_cfg_add_i64(fw_cfg, FW_CFG_INITRD_SIZE, initrd_size);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_BOOT_DEVICE, machine->boot_order[0]);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_BOOT_DEVICE, machine->boot_config.order[0]);
 
     fw_cfg_add_i16(fw_cfg, FW_CFG_SPARC64_WIDTH, graphic_width);
     fw_cfg_add_i16(fw_cfg, FW_CFG_SPARC64_HEIGHT, graphic_height);
diff --git a/include/hw/boards.h b/include/hw/boards.h
index d64b5481e8..6cda7e4308 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -26,6 +26,7 @@ OBJECT_DECLARE_TYPE(MachineState, MachineClass, MACHINE)
 extern MachineState *current_machine;
 
 void machine_run_board_init(MachineState *machine);
+void machine_boot_parse(MachineState *ms, QemuOpts *opts, Error **errp);
 bool machine_usb(MachineState *machine);
 int machine_phandle_start(MachineState *machine);
 bool machine_dump_guest_core(MachineState *machine);
@@ -350,8 +351,7 @@ struct MachineState {
     ram_addr_t ram_size;
     ram_addr_t maxram_size;
     uint64_t   ram_slots;
-    const char *boot_order;
-    const char *boot_once;
+    BootConfiguration boot_config;
     char *kernel_filename;
     char *kernel_cmdline;
     char *initrd_filename;
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 360a408edf..b4030acd74 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -46,8 +46,6 @@ extern int alt_grab;
 extern int ctrl_grab;
 extern int graphic_rotate;
 extern int old_param;
-extern int boot_menu;
-extern bool boot_strict;
 extern uint8_t *boot_splash_filedata;
 extern bool enable_mlock;
 extern bool enable_cpu_pm;
diff --git a/qapi/machine.json b/qapi/machine.json
index 4c417e32a5..e3dcf5a119 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1395,6 +1395,36 @@
   'data': { 'device': 'str', 'msg': 'str' },
   'features': ['deprecated'] }
 
+##
+# @BootConfiguration:
+#
+# Schema for virtual machine boot configuration.
+#
+# @order: Boot order (a=floppy, c=hard disk, d=CD-ROM, n=network)
+#
+# @once: Boot order to apply on first boot
+#
+# @menu: Whether to show a boot menu
+#
+# @splash: The name of the file to be passed to the firmware as logo picture, if @menu is true.
+#
+# @splash-time: How long to show the logo picture, in milliseconds
+#
+# @reboot-timeout: Timeout before guest reboots after boot fails
+#
+# @strict: Whether to attempt booting from devices not included in the boot order
+#
+# Since: 7.1
+##
+{ 'struct': 'BootConfiguration', 'data': {
+     '*order': 'str',
+     '*once': 'str',
+     '*menu': 'bool',
+     '*splash': 'str',
+     '*splash-time': 'int',
+     '*reboot-timeout': 'int',
+     '*strict': 'bool' } }
+
 ##
 # @SMPConfiguration:
 #
diff --git a/softmmu/bootdevice.c b/softmmu/bootdevice.c
index c0713bfa9f..2106f1026f 100644
--- a/softmmu/bootdevice.c
+++ b/softmmu/bootdevice.c
@@ -268,7 +268,8 @@ char *get_boot_devices_list(size_t *size)
 
     *size = total;
 
-    if (boot_strict && *size > 0) {
+    if (current_machine->boot_config.has_strict &&
+        current_machine->boot_config.strict && *size > 0) {
         list[total-1] = '\n';
         list = g_realloc(list, total + 5);
         memcpy(&list[total], "HALT", 5);
diff --git a/softmmu/globals.c b/softmmu/globals.c
index 98b64e0492..916bc12e2b 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -54,8 +54,6 @@ int alt_grab;
 int ctrl_grab;
 unsigned int nb_prom_envs;
 const char *prom_envs[MAX_PROM_ENVS];
-int boot_menu;
-bool boot_strict;
 uint8_t *boot_splash_filedata;
 int only_migratable; /* turn it off unless user states otherwise */
 int icount_align_option;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 488cc4d09e..dd90df3ed1 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1884,9 +1884,6 @@ static bool object_create_early(const char *type)
 
 static void qemu_apply_machine_options(QDict *qdict)
 {
-    MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
-    const char *boot_order = NULL;
-    const char *boot_once = NULL;
     QemuOpts *opts;
 
     object_set_properties_from_keyval(OBJECT(current_machine), qdict, false, &error_fatal);
@@ -1895,27 +1892,7 @@ static void qemu_apply_machine_options(QDict *qdict)
     current_machine->ram_slots = ram_slots;
 
     opts = qemu_opts_find(qemu_find_opts("boot-opts"), NULL);
-    if (opts) {
-        boot_order = qemu_opt_get(opts, "order");
-        if (boot_order) {
-            validate_bootdevices(boot_order, &error_fatal);
-        }
-
-        boot_once = qemu_opt_get(opts, "once");
-        if (boot_once) {
-            validate_bootdevices(boot_once, &error_fatal);
-        }
-
-        boot_menu = qemu_opt_get_bool(opts, "menu", boot_menu);
-        boot_strict = qemu_opt_get_bool(opts, "strict", false);
-    }
-
-    if (!boot_order) {
-        boot_order = machine_class->default_boot_order;
-    }
-
-    current_machine->boot_order = boot_order;
-    current_machine->boot_once = boot_once;
+    machine_boot_parse(current_machine, opts, &error_fatal);
 
     if (semihosting_enabled() && !semihosting_get_argc()) {
         /* fall back to the -kernel/-append */
-- 
2.36.0


