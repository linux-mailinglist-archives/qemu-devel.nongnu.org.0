Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BC24CA611
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:33:21 +0100 (CET)
Received: from localhost ([::1]:41658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPP6W-00082E-80
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:33:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPO4J-0001oA-Dw
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:26:59 -0500
Received: from [2607:f8b0:4864:20::42c] (port=45752
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPO4H-0000j7-TO
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:26:59 -0500
Received: by mail-pf1-x42c.google.com with SMTP id u16so1797594pfg.12
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 04:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gV9Cvlo7ft4KghRJ8ZPgxvTZ4fIVH8yA6Q+ea3wVuzI=;
 b=kHB22itj1Ar9QQ3A57iYQhI2aEh7uKLTXG/2zT/UW5YTtyfyYnzEHcw1N5nvy5/EFj
 BeKAe91XsoEjC2MS0DCsU6xwKFwN4oE5wTvWj2qldW5YRJ8goWI4eh3/4IiaxlRoFurD
 h4jOiYLmXjhmjC6f/BCdS76Xm52BaLz4Y1TsImkOzMWnMfn+jurusFIfFN3IPl+tVkiF
 bOwt2qi2zgzwLNBbeBWg37g4XE7npgp61UGDw+NXfEistT91aoEKFhgGZ+LjZ0KNLhKo
 +7EYJb1fNNrO3PaDsANk0QXY3EEo8lBIKJp3j4gdjPVmz4p6OdEzm5jZdBVnhxBUc1tR
 +MRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gV9Cvlo7ft4KghRJ8ZPgxvTZ4fIVH8yA6Q+ea3wVuzI=;
 b=q5TLYYsTjYyrj6MjdLkkBZEo5+RxC/2CuLJAS6V73AD1EoWREwcnCSLCPXnKwVjkA+
 2Z/+Lx0Gbw8LlRZpBLxlDm2S62DDAIBgbEpZr4r8YDfu3s186hvhlagu8dZDd58QtglC
 Ew/7uz/vCzlRL0F2ruXEcX8hHfmx6FVXqYywc6N5u1S9nvwk7HsCFJlH3L13IqweIhaf
 3ICtsrm2nUPbNIRE0unSYRwpQ0LDdgM8ROO1hXHQAPE2APyj/msXnGSxnTXDHFepwT+H
 tUvRztghSxm25yg90siFc3YotxTROFd9UEPX/5CsTk4/KVFIgPiis2Imnyy6IufD1lrP
 2sbA==
X-Gm-Message-State: AOAM530xl2WkDFv1u9k8oL5IPAtmhLjI3mx0q3/ZeSVf9tCq4BP6NaK1
 AybZ73YaDGwT8HEXuAbvLQaBXZekNYRf6g==
X-Google-Smtp-Source: ABdhPJwtXyrlazsyaG4dk6fnAPxhGzixzlKd7tRjt2l0zdWs0apdrsegjKTse7RW4834k5RqOIMzdA==
X-Received: by 2002:a65:6794:0:b0:36c:460e:858d with SMTP id
 e20-20020a656794000000b0036c460e858dmr25897380pgr.418.1646224016183; 
 Wed, 02 Mar 2022 04:26:56 -0800 (PST)
Received: from localhost.localdomain
 (2001-b011-e000-59d7-a02b-4f1b-c415-11a0.dynamic-ip6.hinet.net.
 [2001:b011:e000:59d7:a02b:4f1b:c415:11a0])
 by smtp.gmail.com with ESMTPSA id
 mu1-20020a17090b388100b001bedddf2000sm4912971pjb.14.2022.03.02.04.26.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Mar 2022 04:26:55 -0800 (PST)
From: Yan-Jie Wang <ubzeme@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/9] hvf: use GTree to store memory slots instead of
 fixed-size array
Date: Wed,  2 Mar 2022 20:26:09 +0800
Message-Id: <20220302122611.15237-8-ubzeme@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220302122611.15237-1-ubzeme@gmail.com>
References: <20220302122611.15237-1-ubzeme@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=ubzeme@gmail.com; helo=mail-pf1-x42c.google.com
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

Currently, there are only 32 memory slots in the fixed size array.
It is not scalable. Instead of using fixed size array, use GTree
(from glib library) and dynamically-allocated structures to store
memory slots.

Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
---
 accel/hvf/hvf-mem.c | 63 +++++++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/accel/hvf/hvf-mem.c b/accel/hvf/hvf-mem.c
index 081029ba98..2f70ceb307 100644
--- a/accel/hvf/hvf-mem.c
+++ b/accel/hvf/hvf-mem.c
@@ -28,8 +28,6 @@
 
 /* Memory slots */
 
-#define HVF_NUM_SLOTS 32
-
 /* HVFSlot flags */
 #define HVF_SLOT_LOG (1 << 0)
 #define HVF_SLOT_READONLY (1 << 1)
@@ -42,35 +40,24 @@ typedef struct HVFSlot {
     MemoryRegion *region;
 } HVFSlot;
 
-static HVFSlot memslots[HVF_NUM_SLOTS];
+static GTree *memslots;
 static QemuMutex memlock;
 
 static HVFSlot *hvf_find_overlap_slot(hwaddr start, hwaddr size)
 {
-    HVFSlot *slot;
-    int x;
-    for (x = 0; x < HVF_NUM_SLOTS; ++x) {
-        slot = &memslots[x];
-        if (slot->size && start < (slot->start + slot->size) &&
-            (start + size) > slot->start) {
-            return slot;
-        }
-    }
-    return NULL;
+    HVFSlot key = {.start = start, .size = 1};
+    return g_tree_lookup(memslots, &key);
 }
 
-static HVFSlot *hvf_find_free_slot(void)
+static void hvf_insert_slot(HVFSlot *slot)
 {
-    HVFSlot *slot;
-    int x;
-    for (x = 0; x < HVF_NUM_SLOTS; x++) {
-        slot = &memslots[x];
-        if (!slot->size) {
-            return slot;
-        }
-    }
+    g_tree_insert(memslots, slot, slot);
+}
 
-    return NULL;
+static bool hvf_remove_slot(hwaddr start)
+{
+    HVFSlot key = {.start = start, .size = 1};
+    return g_tree_remove(memslots, &key);
 }
 
 /*
@@ -141,9 +128,7 @@ static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
         readonly = memory_region_is_rom(area) || memory_region_is_romd(area);
 
         /* setup a slot */
-        qemu_mutex_lock(&memlock);
-
-        slot = hvf_find_free_slot();
+        slot = g_new0(HVFSlot, 1);
         if (!slot) {
             error_report("No free slots");
             abort();
@@ -170,6 +155,10 @@ static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
             flags = HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC;
         }
 
+        qemu_mutex_lock(&memlock);
+
+        hvf_insert_slot(slot);
+
         ret = hv_vm_map(host_addr, start, size, flags);
         assert_hvf_ok(ret);
 
@@ -178,13 +167,9 @@ static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
         /* remove memory region */
         qemu_mutex_lock(&memlock);
 
-        slot = hvf_find_overlap_slot(start, size);
-
-        if (slot) {
+        if (hvf_remove_slot(start)) {
             ret = hv_vm_unmap(start, size);
             assert_hvf_ok(ret);
-
-            slot->size = 0;
         }
 
         qemu_mutex_unlock(&memlock);
@@ -310,8 +295,24 @@ bool hvf_access_memory(hwaddr address, bool write)
     return true;
 }
 
+/* compare function for GTree */
+static gint _hvf_slot_compare(gconstpointer a, gconstpointer b, gpointer data)
+{
+    const HVFSlot *m1 = (const HVFSlot *)a;
+    const HVFSlot *m2 = (const HVFSlot *)b;
+
+    if (m2->start >= m1->start + m1->size) {
+        return -1;
+    } else if (m1->start >= m2->start + m2->size) {
+        return 1;
+    }
+
+    return 0;
+}
+
 void hvf_init_memslots(void)
 {
     qemu_mutex_init(&memlock);
+    memslots = g_tree_new_full(_hvf_slot_compare, NULL, g_free, NULL);
     memory_listener_register(&hvf_memory_listener, &address_space_memory);
 }
-- 
2.32.0 (Apple Git-132)


