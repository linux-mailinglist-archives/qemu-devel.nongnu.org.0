Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F655526FF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 00:36:14 +0200 (CEST)
Received: from localhost ([::1]:49632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Q0D-0000zw-8s
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 18:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3DPawYgsKCtc6BHGG39E3S79HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--dionnaglaze.bounces.google.com>)
 id 1o3Pyz-0000Gf-AK
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 18:34:57 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:57172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3DPawYgsKCtc6BHGG39E3S79HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--dionnaglaze.bounces.google.com>)
 id 1o3Pyx-0000bC-Cf
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 18:34:56 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 f9-20020a636a09000000b00401b6bc63beso6677065pgc.23
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 15:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=qQRzji+xvf4KIRu9GCgaqWx/TAp4pRlZQs5WLnqES10=;
 b=S0UT9YXindc+vVdTHA7J3RgKJHWAUO7xVMCjPFtjGjQJANKXPu6RRoCp0nR1Tl7QIh
 886nAL7ENCo1UjTmtkMq/Es673W5qKo7MQlriVH0TujEFmwt+rb1AY7902QvvpAUppX/
 dVVMp0taQUHEDbyeOUTc1zU4+leZb5VqWX3skw2HtWBmqIXZQqhvXIZGbx23HY6PSTfo
 9BDW1tPtCjYK9zoOPDD6sTCn9aNd9OO8cSoZG6R2k94nVMqCwA4NF36iWz6r2QGLyj0Z
 aNKUzRO0WgcYOzFbH33g0H+Kq0CPo/gheT7Fqz9QnO/xh8bpY9LP+LA6O023n5KSG7Jp
 ceiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=qQRzji+xvf4KIRu9GCgaqWx/TAp4pRlZQs5WLnqES10=;
 b=tUP2xXiH+nC1eqLiHHRMMLMIgp1YCFAyb2dnrI369D6zTG7V7Uiz+MnNIYiFUP/7Bw
 peT5A3+aKSETpxuaNcWGccDuWjl1ekcl3nzjlLiduZuNEdVMiorh6s6AK4SUcM1sPsda
 ZCzeWYnqTvXFehTkyDFliia/mvBzkDej2kXpRgXoyJ0AKSXZmFifHb3CoJmyf0yU8pDD
 f2jzrRMCh3UFT+JxZj6lbQmOEZmqTAGG3w57eyF1IH2m1ytoigwXO0Rt7C5JuJfXJkmE
 7uQ+OK984Z1UKF6uBf4TyPtKqKV6SQiPKH6fXqlVKsQr9ZOt3d0L563DP0cHwArRBeVQ
 gKjw==
X-Gm-Message-State: AJIora973vbLRTLQDBtvXjcfgSpLiOwRW5ttNUhj1gtcPfBp66G7DD9v
 oazcSnTtK6ULQObuJX3pIqMqPsZTcdOLfM8be/CNcdCZC0dHrPq+GJ70vxYjo0FwBYsEmFvgPCK
 bttVuYH0qr58ah9HiI3KKidaglPgFJJJpE6r7Lv3wL0U7PJbA/x7LS8x7YUFGvdoB81Pq4XxOyQ
 ==
X-Google-Smtp-Source: AGRyM1vhrA4eKfpMLrDlUbX3aGYFCS7p3QGvDr/+fZpNgWoimg3/Z+NitpH2MMtZOKy23+CBSsGoaRlK5cFJfzlwPA==
X-Received: from dionnaglaze.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:2ee6])
 (user=dionnaglaze job=sendgmr) by 2002:a17:902:6946:b0:167:8ff3:1608 with
 SMTP id k6-20020a170902694600b001678ff31608mr25799683plt.116.1655764492634;
 Mon, 20 Jun 2022 15:34:52 -0700 (PDT)
Date: Mon, 20 Jun 2022 22:33:00 +0000
Message-Id: <20220620223300.1555849-1-dionnaglaze@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
Subject: [PATCH] hw/i386: Add unaccepted memory configuration
From: Dionna Glaze <dionnaglaze@google.com>
To: qemu-devel@nongnu.org
Cc: Dionna Glaze <dionnaglaze@google.com>, Xu@google.com,
 Min M <min.m.xu@intel.com>, 
 Xiaoyao Li <xiaoyao.li@intel.com>, Thomas Lendacky <Thomas.Lendacky@amd.com>, 
 Gerd Hoffman <kraxel@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3DPawYgsKCtc6BHGG39E3S79HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--dionnaglaze.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

For SEV-SNP, an OS is "SEV-SNP capable" without supporting this UEFI
v2.9 memory type. In order for OVMF to be able to avoid pre-validating
potentially hundreds of gibibytes of data before booting, it needs to
know if the guest OS can support its use of the new type of memory in
the memory map.

Cc: Xu, Min M <min.m.xu@intel.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Thomas Lendacky <Thomas.Lendacky@amd.com>
Cc: Gerd Hoffman <kraxel@redhat.com>
Signed-off-by: Dionna Glaze <dionnaglaze@google.com>
---
 hw/core/machine.c   | 33 +++++++++++++++++++++++++++++++++
 hw/i386/fw_cfg.c    |  5 +++++
 include/hw/boards.h |  1 +
 3 files changed, 39 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index c53548d0b1..d2b9513951 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -263,6 +263,15 @@ GlobalProperty hw_compat_2_1[] = {
 };
 const size_t hw_compat_2_1_len = G_N_ELEMENTS(hw_compat_2_1);
 
+static QEnumLookup memory_acceptance_lookup = {
+    .array = (const char *const[]) {
+        "default",
+        "true",
+        "false",
+    },
+    .size = 3,
+};
+
 MachineState *current_machine;
 
 static char *machine_get_kernel(Object *obj, Error **errp)
@@ -502,6 +511,20 @@ static void machine_check_confidential_guest_support(const Object *obj,
      */
 }
 
+static int machine_get_accept_all_memory(Object *obj, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    return ms->accept_all_memory;
+}
+
+static void machine_set_accept_all_memory(Object *obj, int value, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    ms->accept_all_memory = value;
+}
+
 static bool machine_get_nvdimm(Object *obj, Error **errp)
 {
     MachineState *ms = MACHINE(obj);
@@ -1022,6 +1045,15 @@ static void machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "confidential-guest-support",
                                           "Set confidential guest scheme to support");
 
+    object_class_property_add_enum(oc, "accept-all-memory",
+                                   "MemoryAcceptance",
+                                   &memory_acceptance_lookup,
+        machine_get_accept_all_memory, machine_set_accept_all_memory);
+    object_class_property_set_description(
+        oc, "accept-all-memory",
+        "false: Accept all memory, true: Accept up to 4G and leave the rest unaccepted (UEFI"
+        " v2.9 memory type), default: default firmware behavior.");
+
     /* For compatibility */
     object_class_property_add_str(oc, "memory-encryption",
         machine_get_memory_encryption, machine_set_memory_encryption);
@@ -1072,6 +1104,7 @@ static void machine_initfn(Object *obj)
     ms->kernel_cmdline = g_strdup("");
     ms->ram_size = mc->default_ram_size;
     ms->maxram_size = mc->default_ram_size;
+    ms->accept_all_memory = 0;
 
     if (mc->nvdimm_supported) {
         Object *obj = OBJECT(ms);
diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index a283785a8d..96164994f8 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -131,6 +131,11 @@ FWCfgState *fw_cfg_arch_create(MachineState *ms,
                      &e820_reserve, sizeof(e820_reserve));
     fw_cfg_add_file(fw_cfg, "etc/e820", e820_table,
                     sizeof(struct e820_entry) * e820_get_num_entries());
+    if (ms->accept_all_memory) {
+        bool accept_all = ms->accept_all_memory == 1;
+        fw_cfg_add_file(fw_cfg, "opt/ovmf/AcceptAllMemory",
+                        &accept_all, sizeof(accept_all));
+    }
 
     fw_cfg_add_bytes(fw_cfg, FW_CFG_HPET, &hpet_cfg, sizeof(hpet_cfg));
     /* allocate memory for the NUMA channel: one (64bit) word for the number
diff --git a/include/hw/boards.h b/include/hw/boards.h
index fa57bac4fb..eaf73498c4 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -362,6 +362,7 @@ struct MachineState {
     struct NVDIMMState *nvdimms_state;
     struct CXLState *cxl_devices_state;
     struct NumaState *numa_state;
+    int accept_all_memory;
 };
 
 #define DEFINE_MACHINE(namestr, machine_initfn) \
-- 
2.37.0.rc0.104.g0611611a94-goog


