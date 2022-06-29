Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE910560A75
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 21:40:46 +0200 (CEST)
Received: from localhost ([::1]:58892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6dYL-00072i-1k
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 15:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <37Km8YgsKCk8uz544rx2rGvx55x2v.t537v3B-uvCv2454x4B.58x@flex--dionnaglaze.bounces.google.com>)
 id 1o6dV2-0006Dr-Oc
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 15:37:20 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:43960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <37Km8YgsKCk8uz544rx2rGvx55x2v.t537v3B-uvCv2454x4B.58x@flex--dionnaglaze.bounces.google.com>)
 id 1o6dV0-0007DR-WB
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 15:37:20 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 j11-20020a05690212cb00b006454988d225so14703272ybu.10
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 12:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=I0xEivcNNV6wN4aKHV9d+soVSC9JSrTLnPM41gG5EM4=;
 b=b1GbfsNG5KpbJntaEuqhMk8thOjwGv/Mj5Pg77pYf8GnZOPwomKEQxdz5jMo7tjrQX
 RXxeXDvegJRonHwPHvnCfqryLw7KPmqA9M+MRvLbDqj7KxhrrCsecDFyR/bdt9u8vJPz
 wDbmSry+g77qpw0PzShdz2ZwSYj3v+sPaxfYcRF5JAqzFBfFS97lgfsNrb/A+qL7c6yO
 d8UlDFt+yovqJvnQoi57Pe6MYiiYxcO+uqxCgScOj9PIUAJk2XcN9vLHBCNFT0nTlO6m
 vDon8saVEkAairh432UTNWaQ2ObIHO5KthZPVHUvZNKMAj0L4HwGQ6ZcVlJ3lFBNu1yu
 Q5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=I0xEivcNNV6wN4aKHV9d+soVSC9JSrTLnPM41gG5EM4=;
 b=PTcbWSe6EbpD5Mn03HmyAxsZ6sUrN2tpJzGK+nDArNAPl+ZI041kxj0Mik3w2ZggU4
 HsJIDvfLAWRyvpmqZ6YsMtfVkDuhZKyPQ8Fgv4LmdQgrGDuLVrYXz2xjW5G37xQpDR3R
 ddP7hIAqHGK6Hy4auvydjyoyZReLSKibvLPovJ5d6yTeTi1Qud1TbrsyDToiKZTLURkN
 Wy6UWON5urP8OEE8iYAT7hO0rK3tZnAp/goZ5VC8qHsMcQ3dNfr5G2jmoZ6SJ6A08Bzo
 R/kyPrBHP2+KJlVwHvMFdn6RLyXsAOPNsBgnLqhoTdfq+9gcJEpuKNGydCITcgihyAOL
 XY2g==
X-Gm-Message-State: AJIora+ExCQck3Ld83SpjQLjLn+cKDbRropJAbOZzHHXDus2Qaey3CKj
 Jcg82BXs1XG5biAfvq/CfNMfIz9HS1AbxTJLFFCsL09/bRxeCJk0opsLz/kVXASJafAL21pKllO
 ZjbZdm3Ijik7EtKYYv+t8P4L9YSnGcsMoZemKsbo/nMUP0HDZmEuCDxSysH+W1/+08+KaS9WXlQ
 ==
X-Google-Smtp-Source: AGRyM1tl5g1CZi4dGgfJz1eqb+0hfMtv6QbYubdZlYN3QL0PrsGt5X6LVJ5LALWLkyZ66pSS1tps9kzQ86OX7k3XnA==
X-Received: from dionnaglaze.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:2ee6])
 (user=dionnaglaze job=sendgmr) by 2002:a25:58d4:0:b0:66c:1d4f:9477 with SMTP
 id m203-20020a2558d4000000b0066c1d4f9477mr5030590ybb.437.1656531436234; Wed,
 29 Jun 2022 12:37:16 -0700 (PDT)
Date: Wed, 29 Jun 2022 19:37:01 +0000
Message-Id: <20220629193701.734154-1-dionnaglaze@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v2] target/i386: Add unaccepted memory configuration
From: Dionna Glaze <dionnaglaze@google.com>
To: qemu-devel@nongnu.org
Cc: Dionna Glaze <dionnaglaze@google.com>, Xu@google.com,
 Min M <min.m.xu@intel.com>, 
 Xiaoyao Li <xiaoyao.li@intel.com>, Thomas Lendacky <Thomas.Lendacky@amd.com>, 
 Gerd Hoffman <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Marcelo Tosatti <mtosatti@redhat.com>,
 "open list:X86 KVM CPUs" <kvm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=37Km8YgsKCk8uz544rx2rGvx55x2v.t537v3B-uvCv2454x4B.58x@flex--dionnaglaze.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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
 hw/i386/fw_cfg.c  |  6 ++++++
 target/i386/sev.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++
 target/i386/sev.h |  2 ++
 3 files changed, 57 insertions(+)

diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index a283785a8d..9c069ddebe 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -23,6 +23,7 @@
 #include "e820_memory_layout.h"
 #include "kvm/kvm_i386.h"
 #include "qapi/error.h"
+#include "target/i386/sev.h"
 #include CONFIG_DEVICES
 
 struct hpet_fw_config hpet_cfg = {.count = UINT8_MAX};
@@ -131,6 +132,11 @@ FWCfgState *fw_cfg_arch_create(MachineState *ms,
                      &e820_reserve, sizeof(e820_reserve));
     fw_cfg_add_file(fw_cfg, "etc/e820", e820_table,
                     sizeof(struct e820_entry) * e820_get_num_entries());
+    if (sev_has_accept_all_memory(ms->cgs)) {
+        bool accept_all = sev_accept_all_memory(ms->cgs);
+        fw_cfg_add_file(fw_cfg, "opt/ovmf/AcceptAllMemory",
+                        &accept_all, sizeof(accept_all));
+    }
 
     fw_cfg_add_bytes(fw_cfg, FW_CFG_HPET, &hpet_cfg, sizeof(hpet_cfg));
     /* allocate memory for the NUMA channel: one (64bit) word for the number
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 32f7dbac4e..01399a304c 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -64,6 +64,7 @@ struct SevGuestState {
     uint32_t cbitpos;
     uint32_t reduced_phys_bits;
     bool kernel_hashes;
+    int accept_all_memory;
 
     /* runtime state */
     uint32_t handle;
@@ -155,6 +156,15 @@ static const char *const sev_fw_errlist[] = {
     [SEV_RET_SECURE_DATA_INVALID]    = "Part-specific integrity check failure",
 };
 
+static QEnumLookup memory_acceptance_lookup = {
+    .array = (const char *const[]) {
+        "default",
+        "true",
+        "false",
+    },
+    .size = 3,
+};
+
 #define SEV_FW_MAX_ERROR      ARRAY_SIZE(sev_fw_errlist)
 
 static int
@@ -353,6 +363,21 @@ static void sev_guest_set_kernel_hashes(Object *obj, bool value, Error **errp)
     sev->kernel_hashes = value;
 }
 
+static int sev_guest_get_accept_all_memory(Object *obj, Error **errp)
+{
+    SevGuestState *sev = SEV_GUEST(obj);
+
+    return sev->accept_all_memory;
+}
+
+static void
+sev_guest_set_accept_all_memory(Object *obj, int value, Error **errp)
+{
+    SevGuestState *sev = SEV_GUEST(obj);
+
+    sev->accept_all_memory = value;
+}
+
 static void
 sev_guest_class_init(ObjectClass *oc, void *data)
 {
@@ -376,6 +401,14 @@ sev_guest_class_init(ObjectClass *oc, void *data)
                                    sev_guest_set_kernel_hashes);
     object_class_property_set_description(oc, "kernel-hashes",
             "add kernel hashes to guest firmware for measured Linux boot");
+    object_class_property_add_enum(oc, "accept-all-memory",
+                                   "MemoryAcceptance",
+                                   &memory_acceptance_lookup,
+        sev_guest_get_accept_all_memory, sev_guest_set_accept_all_memory);
+    object_class_property_set_description(
+        oc, "accept-all-memory",
+        "false: Accept all memory, true: Accept up to 4G and leave the rest unaccepted (UEFI"
+        " v2.9 memory type), default: default firmware behavior.");
 }
 
 static void
@@ -906,6 +939,22 @@ sev_vm_state_change(void *opaque, bool running, RunState state)
     }
 }
 
+int sev_has_accept_all_memory(ConfidentialGuestSupport *cgs)
+{
+    SevGuestState *sev
+        = (SevGuestState *)object_dynamic_cast(OBJECT(cgs), TYPE_SEV_GUEST);
+
+    return sev && sev->accept_all_memory != 0;
+}
+
+int sev_accept_all_memory(ConfidentialGuestSupport *cgs)
+{
+    SevGuestState *sev
+        = (SevGuestState *)object_dynamic_cast(OBJECT(cgs), TYPE_SEV_GUEST);
+
+    return sev && sev->accept_all_memory == 1;
+}
+
 int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
 {
     SevGuestState *sev
diff --git a/target/i386/sev.h b/target/i386/sev.h
index 7b1528248a..d61b6e9443 100644
--- a/target/i386/sev.h
+++ b/target/i386/sev.h
@@ -58,5 +58,7 @@ int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size);
 void sev_es_set_reset_vector(CPUState *cpu);
 
 int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
+int sev_has_accept_all_memory(ConfidentialGuestSupport *cgs);
+int sev_accept_all_memory(ConfidentialGuestSupport *cgs);
 
 #endif
-- 
2.37.0.rc0.161.g10f37bed90-goog


