Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D20E44CA5FB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:28:18 +0100 (CET)
Received: from localhost ([::1]:34160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPP1d-0002gh-Ua
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:28:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPO4H-0001ig-Fb
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:26:57 -0500
Received: from [2607:f8b0:4864:20::529] (port=42620
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPO4F-0000iF-Pm
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:26:57 -0500
Received: by mail-pg1-x529.google.com with SMTP id o8so1482418pgf.9
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 04:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NNU3kDNYeQnPNa4auhryDFqI7kD27cCHuRDqOJvwXMA=;
 b=lwYRe5Umr+PF+OQP5b51SlW9snZPczF0z9NJ7yez/0/lxOEpq0xENdIuZK6xBPKsg3
 5M5JpuNS0OXoQFmgmpG4pf6cMVIztusTl1p35xVOO6wWWLD1OKVnMzOYy6Q+86MbR7ZS
 twD/kXnBTzjF8Ias7iTtpzyqQKiSJaBGVQAGWfShMdPuRaAjLFKZPo/BmuHVtNdSV8bM
 2uhNDfKlf7iT3SvZWhrupyzPgasLB/fVJWvsgEFYm6krw8kER482iL+KcGI1BJPbI6mr
 WCVQxmjtzCJwkHaEsKbSZV6cRsWsVyq/3xDyUcuWtzF2us+EnRL02+jCmb7/yIgwXtTW
 ZN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NNU3kDNYeQnPNa4auhryDFqI7kD27cCHuRDqOJvwXMA=;
 b=7UCPm1aP4J94IqsQB5e6wuioiPCrMRvECRFND8XdSZmeLg8ARflheEhs0oQlpPQBql
 HqK7BWANdLIvTmppMJHXvf0lYpGlRpP/7rYtILMQ19LUwtFAIf/GyUpuBSr2bsyuin8e
 2ERCAmLN0HiTjKZJAzNaDD772wN9zsl/IAtXn+T5+4/rZd69XvdQU1M+fh6tMfN675Wc
 TVtgYGhtrB2qitOqvISFJOPCb4vSTMrNnWQvWgsPHNZk1d2ikZw22YePEYZqDBLjP7d6
 +r9bHh9y/mt7sWJfL4LiXao3nxZOsxdubQZPt2T7c8nzncY0Kdx39+BGRhvH6sgqK06W
 7HIw==
X-Gm-Message-State: AOAM531pEhvtm/7J8NMQKZrMy54w2AbNImyc79+AMBCq0A/l5eLFMYOW
 HIdGEjTWDAI3yQH8fjPsTNplwfe4oYypIg==
X-Google-Smtp-Source: ABdhPJyNSw/iHUFmo0Hbc2oflbOgUj9CSodqMC5kB8eFFNpciKbLdSFsvGBmeL9eVW+TKgQs1CqPZQ==
X-Received: by 2002:a62:8085:0:b0:4df:443c:7227 with SMTP id
 j127-20020a628085000000b004df443c7227mr15032163pfd.34.1646224014036; 
 Wed, 02 Mar 2022 04:26:54 -0800 (PST)
Received: from localhost.localdomain
 (2001-b011-e000-59d7-a02b-4f1b-c415-11a0.dynamic-ip6.hinet.net.
 [2001:b011:e000:59d7:a02b:4f1b:c415:11a0])
 by smtp.gmail.com with ESMTPSA id
 mu1-20020a17090b388100b001bedddf2000sm4912971pjb.14.2022.03.02.04.26.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Mar 2022 04:26:53 -0800 (PST)
From: Yan-Jie Wang <ubzeme@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/9] hvf: add a lock for memory related functions
Date: Wed,  2 Mar 2022 20:26:08 +0800
Message-Id: <20220302122611.15237-7-ubzeme@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220302122611.15237-1-ubzeme@gmail.com>
References: <20220302122611.15237-1-ubzeme@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=ubzeme@gmail.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Cameron Esfahani <dirty@apple.com>, Yan-Jie Wang <ubzeme@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We follow how KVM accel does in its memory listener (kvm-all.c) and add
a lock for the memory related functions.

Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
---
 accel/hvf/hvf-mem.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/accel/hvf/hvf-mem.c b/accel/hvf/hvf-mem.c
index 896e718374..081029ba98 100644
--- a/accel/hvf/hvf-mem.c
+++ b/accel/hvf/hvf-mem.c
@@ -43,6 +43,7 @@ typedef struct HVFSlot {
 } HVFSlot;
 
 static HVFSlot memslots[HVF_NUM_SLOTS];
+static QemuMutex memlock;
 
 static HVFSlot *hvf_find_overlap_slot(hwaddr start, hwaddr size)
 {
@@ -140,6 +141,8 @@ static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
         readonly = memory_region_is_rom(area) || memory_region_is_romd(area);
 
         /* setup a slot */
+        qemu_mutex_lock(&memlock);
+
         slot = hvf_find_free_slot();
         if (!slot) {
             error_report("No free slots");
@@ -169,8 +172,12 @@ static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
 
         ret = hv_vm_map(host_addr, start, size, flags);
         assert_hvf_ok(ret);
+
+        qemu_mutex_unlock(&memlock);
     } else {
         /* remove memory region */
+        qemu_mutex_lock(&memlock);
+
         slot = hvf_find_overlap_slot(start, size);
 
         if (slot) {
@@ -179,6 +186,8 @@ static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
 
             slot->size = 0;
         }
+
+        qemu_mutex_unlock(&memlock);
     }
 }
 
@@ -186,6 +195,8 @@ static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
 {
     HVFSlot *slot;
 
+    qemu_mutex_lock(&memlock);
+
     slot = hvf_find_overlap_slot(
             section->offset_within_address_space,
             int128_get64(section->size));
@@ -201,6 +212,8 @@ static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
         hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
                       HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC);
     }
+
+    qemu_mutex_unlock(&memlock);
 }
 
 static void hvf_log_start(MemoryListener *listener,
@@ -271,10 +284,13 @@ bool hvf_access_memory(hwaddr address, bool write)
     hv_return_t ret;
     hwaddr start, size;
 
+    qemu_mutex_lock(&memlock);
+
     slot = hvf_find_overlap_slot(address, 1);
 
     if (!slot || (write && slot->flags & HVF_SLOT_READONLY)) {
         /* MMIO or unmapped area, return false */
+        qemu_mutex_unlock(&memlock);
         return false;
     }
 
@@ -290,10 +306,12 @@ bool hvf_access_memory(hwaddr address, bool write)
         assert_hvf_ok(ret);
     }
 
+    qemu_mutex_unlock(&memlock);
     return true;
 }
 
 void hvf_init_memslots(void)
 {
+    qemu_mutex_init(&memlock);
     memory_listener_register(&hvf_memory_listener, &address_space_memory);
 }
-- 
2.32.0 (Apple Git-132)


