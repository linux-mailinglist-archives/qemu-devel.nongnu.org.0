Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C970641FC3A
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:21:36 +0200 (CEST)
Received: from localhost ([::1]:57004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWexL-00079Z-Sv
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeXW-0002hI-Ap
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeXU-00012D-Cq
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633179291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wGfA2j80SC2+4aGulWQ/r67RC6gVnbvOoez6cQaSfN0=;
 b=YEUy/6OPAksONY4PQ1DSGwJiZ4MiNHxrSmsTpP85GrC3lVugohYOR9vrp5dB8Xvb7YuCOn
 YboVzre+Y2Mb/0QbjZqYyK5cULIea54hQJc0NLJAxp3Sq2+WIVq47oATUMszNh8nZnKjZf
 NT9AhR4ZRuNUIuqC0nHZg2tlqz3k+NA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-Q8Z66hWMNVihhSCidPm92w-1; Sat, 02 Oct 2021 08:54:51 -0400
X-MC-Unique: Q8Z66hWMNVihhSCidPm92w-1
Received: by mail-wm1-f71.google.com with SMTP id
 j21-20020a05600c1c1500b0030ccce95837so3789610wms.3
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 05:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wGfA2j80SC2+4aGulWQ/r67RC6gVnbvOoez6cQaSfN0=;
 b=C2izfzkYsAL0dXk2lmlf23fMj8w4I5pwHJ4bJ0RHtxdOnZYKm9bZIQHaOwiSQ6szBk
 FRa9oaPFCU1VeT9ICGCrPmKCIuQ3fh1z0wFXFVF13eJG+Y/sCyHXTYfFxHvYudS3llQc
 nedOnvaS10WYDX6+KAzXF3JKbOex4nAk3hgPCmylW/IxusdU7/4w9v0EJ2cwsZrI5tMt
 Q+O4BFhNUBdh8H2m5F8vbPw6jVeTwQrNJ+lszvDlRdYVXX/DoBsB/dVnZgvkOP7giQY6
 6FMtirs9xjuvbNwmVcivnYihpwNG6CuvJDPaLsyyXNDRJAgRuqEPyCYCiPoygxbQbV4/
 +RZw==
X-Gm-Message-State: AOAM53376i6WrlTrCpzJccz8MYCsA/ASeZWw6Dg0wqRz6/2agFh5PaqD
 Y0ijaneAYcXoL60x9uqXXNoRoGuyYf/gTVgXX5XUupsNzX+f7/Bxns48mhQbAo3+xTjOC4OB4Ex
 PCOOfMZXw2SjddUEYIr5DYlugv/GYAtR+6t1C8+5kIfWXbdrd4XhtKlVrzqcuWCD1
X-Received: by 2002:adf:cf10:: with SMTP id o16mr3263921wrj.12.1633179289692; 
 Sat, 02 Oct 2021 05:54:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIlAGUzy37xRAc3wO3Jx5AvnPpGg0GVEAXuua31avnpgtYrsVxayrEFINAr8sZqcOzoicXYw==
X-Received: by 2002:adf:cf10:: with SMTP id o16mr3263894wrj.12.1633179289485; 
 Sat, 02 Oct 2021 05:54:49 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 z5sm13146962wmp.26.2021.10.02.05.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 05:54:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/22] sev/i386: Introduce sev_add_kernel_loader_hashes for
 measured linux boot
Date: Sat,  2 Oct 2021 14:53:15 +0200
Message-Id: <20211002125317.3418648-21-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002125317.3418648-1-philmd@redhat.com>
References: <20211002125317.3418648-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dov Murik <dovmurik@linux.ibm.com>

Add the sev_add_kernel_loader_hashes function to calculate the hashes of
the kernel/initrd/cmdline and fill a designated OVMF encrypted hash
table area.  For this to work, OVMF must support an encrypted area to
place the data which is advertised via a special GUID in the OVMF reset
table.

The hashes of each of the files is calculated (or the string in the case
of the cmdline with trailing '\0' included).  Each entry in the hashes
table is GUID identified and since they're passed through the
sev_encrypt_flash interface, the hashes will be accumulated by the AMD
PSP measurement (SEV_LAUNCH_MEASURE).

Co-developed-by: James Bottomley <jejb@linux.ibm.com>
Signed-off-by: James Bottomley <jejb@linux.ibm.com>
Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210930054915.13252-2-dovmurik@linux.ibm.com>
[PMD: Rebased on top of 0021c4765a6]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev_i386.h |  12 ++++
 target/i386/sev.c      | 138 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 150 insertions(+)

diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index 15a959d6174..17031cddd37 100644
--- a/target/i386/sev_i386.h
+++ b/target/i386/sev_i386.h
@@ -23,9 +23,21 @@
 #define SEV_POLICY_DOMAIN       0x10
 #define SEV_POLICY_SEV          0x20
 
+typedef struct SevKernelLoaderContext {
+    char *setup_data;
+    size_t setup_size;
+    char *kernel_data;
+    size_t kernel_size;
+    char *initrd_data;
+    size_t initrd_size;
+    char *cmdline_data;
+    size_t cmdline_size;
+} SevKernelLoaderContext;
+
 int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
 int sev_inject_launch_secret(const char *hdr, const char *secret,
                              uint64_t gpa, Error **errp);
+bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp);
 
 int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size);
 void sev_es_set_reset_vector(CPUState *cpu);
diff --git a/target/i386/sev.c b/target/i386/sev.c
index c6d8fc52eb2..91fdf0d4503 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -23,6 +23,7 @@
 #include "qemu/base64.h"
 #include "qemu/module.h"
 #include "qemu/uuid.h"
+#include "crypto/hash.h"
 #include "sysemu/kvm.h"
 #include "sev_i386.h"
 #include "sysemu/sysemu.h"
@@ -86,6 +87,32 @@ typedef struct __attribute__((__packed__)) SevInfoBlock {
     uint32_t reset_addr;
 } SevInfoBlock;
 
+#define SEV_HASH_TABLE_RV_GUID  "7255371f-3a3b-4b04-927b-1da6efa8d454"
+typedef struct QEMU_PACKED SevHashTableDescriptor {
+    /* SEV hash table area guest address */
+    uint32_t base;
+    /* SEV hash table area size (in bytes) */
+    uint32_t size;
+} SevHashTableDescriptor;
+
+/* hard code sha256 digest size */
+#define HASH_SIZE 32
+
+typedef struct QEMU_PACKED SevHashTableEntry {
+    QemuUUID guid;
+    uint16_t len;
+    uint8_t hash[HASH_SIZE];
+} SevHashTableEntry;
+
+typedef struct QEMU_PACKED SevHashTable {
+    QemuUUID guid;
+    uint16_t len;
+    SevHashTableEntry cmdline;
+    SevHashTableEntry initrd;
+    SevHashTableEntry kernel;
+    uint8_t padding[];
+} SevHashTable;
+
 static SevGuestState *sev_guest;
 static Error *sev_mig_blocker;
 
@@ -1151,6 +1178,117 @@ int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
     return 0;
 }
 
+static const QemuUUID sev_hash_table_header_guid = {
+    .data = UUID_LE(0x9438d606, 0x4f22, 0x4cc9, 0xb4, 0x79, 0xa7, 0x93,
+                    0xd4, 0x11, 0xfd, 0x21)
+};
+
+static const QemuUUID sev_kernel_entry_guid = {
+    .data = UUID_LE(0x4de79437, 0xabd2, 0x427f, 0xb8, 0x35, 0xd5, 0xb1,
+                    0x72, 0xd2, 0x04, 0x5b)
+};
+static const QemuUUID sev_initrd_entry_guid = {
+    .data = UUID_LE(0x44baf731, 0x3a2f, 0x4bd7, 0x9a, 0xf1, 0x41, 0xe2,
+                    0x91, 0x69, 0x78, 0x1d)
+};
+static const QemuUUID sev_cmdline_entry_guid = {
+    .data = UUID_LE(0x97d02dd8, 0xbd20, 0x4c94, 0xaa, 0x78, 0xe7, 0x71,
+                    0x4d, 0x36, 0xab, 0x2a)
+};
+
+/*
+ * Add the hashes of the linux kernel/initrd/cmdline to an encrypted guest page
+ * which is included in SEV's initial memory measurement.
+ */
+bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
+{
+    uint8_t *data;
+    SevHashTableDescriptor *area;
+    SevHashTable *ht;
+    uint8_t cmdline_hash[HASH_SIZE];
+    uint8_t initrd_hash[HASH_SIZE];
+    uint8_t kernel_hash[HASH_SIZE];
+    uint8_t *hashp;
+    size_t hash_len = HASH_SIZE;
+    int aligned_len;
+
+    if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
+        error_setg(errp,
+                   "SEV: kernel specified but OVMF has no hash table guid");
+        return false;
+    }
+    area = (SevHashTableDescriptor *)data;
+
+    /*
+     * Calculate hash of kernel command-line with the terminating null byte. If
+     * the user doesn't supply a command-line via -append, the 1-byte "\0" will
+     * be used.
+     */
+    hashp = cmdline_hash;
+    if (qcrypto_hash_bytes(QCRYPTO_HASH_ALG_SHA256, ctx->cmdline_data,
+                           ctx->cmdline_size, &hashp, &hash_len, errp) < 0) {
+        return false;
+    }
+    assert(hash_len == HASH_SIZE);
+
+    /*
+     * Calculate hash of initrd. If the user doesn't supply an initrd via
+     * -initrd, an empty buffer will be used (ctx->initrd_size == 0).
+     */
+    hashp = initrd_hash;
+    if (qcrypto_hash_bytes(QCRYPTO_HASH_ALG_SHA256, ctx->initrd_data,
+                           ctx->initrd_size, &hashp, &hash_len, errp) < 0) {
+        return false;
+    }
+    assert(hash_len == HASH_SIZE);
+
+    /* Calculate hash of the kernel */
+    hashp = kernel_hash;
+    struct iovec iov[2] = {
+        { .iov_base = ctx->setup_data, .iov_len = ctx->setup_size },
+        { .iov_base = ctx->kernel_data, .iov_len = ctx->kernel_size }
+    };
+    if (qcrypto_hash_bytesv(QCRYPTO_HASH_ALG_SHA256, iov, ARRAY_SIZE(iov),
+                            &hashp, &hash_len, errp) < 0) {
+        return false;
+    }
+    assert(hash_len == HASH_SIZE);
+
+    /*
+     * Populate the hashes table in the guest's memory at the OVMF-designated
+     * area for the SEV hashes table
+     */
+    ht = qemu_map_ram_ptr(NULL, area->base);
+
+    ht->guid = sev_hash_table_header_guid;
+    ht->len = sizeof(*ht);
+
+    ht->cmdline.guid = sev_cmdline_entry_guid;
+    ht->cmdline.len = sizeof(ht->cmdline);
+    memcpy(ht->cmdline.hash, cmdline_hash, sizeof(ht->cmdline.hash));
+
+    ht->initrd.guid = sev_initrd_entry_guid;
+    ht->initrd.len = sizeof(ht->initrd);
+    memcpy(ht->initrd.hash, initrd_hash, sizeof(ht->initrd.hash));
+
+    ht->kernel.guid = sev_kernel_entry_guid;
+    ht->kernel.len = sizeof(ht->kernel);
+    memcpy(ht->kernel.hash, kernel_hash, sizeof(ht->kernel.hash));
+
+    /* When calling sev_encrypt_flash, the length has to be 16 byte aligned */
+    aligned_len = ROUND_UP(ht->len, 16);
+    if (aligned_len != ht->len) {
+        /* zero the excess data so the measurement can be reliably calculated */
+        memset(ht->padding, 0, aligned_len - ht->len);
+    }
+
+    if (sev_encrypt_flash((uint8_t *)ht, aligned_len, errp) < 0) {
+        return false;
+    }
+
+    return true;
+}
+
 static void
 sev_register_types(void)
 {
-- 
2.31.1


