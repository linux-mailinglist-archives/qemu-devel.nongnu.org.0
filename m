Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B203FE93C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 08:29:47 +0200 (CEST)
Received: from localhost ([::1]:41766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLgEM-0006RG-8H
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 02:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgB5-0003Ks-Kt
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 02:26:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgB0-0003bH-Vr
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 02:26:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630563978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kdU5Aqza9ZWbPymBqSm4kyPMeV694lTfymI4s4A9Y3Y=;
 b=CNMWqdWB8ZJ5lVC1Ixl4XNOtCVXGLbJx6fIj2d2ZqndulRag6qntOoR+e9DPOlt4hQnlUQ
 y+TCvpvg1ekw7JDFVf9CR8e93NjTcPAK5FpU3g9g7IcVukXrBRwNV7KoxagSVdU3A9F9YY
 T2QPStFXNGZpFOszmyi2BuBdFxESMnQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-GetqHs7xOQi4Lh8DQNjI0g-1; Thu, 02 Sep 2021 02:26:16 -0400
X-MC-Unique: GetqHs7xOQi4Lh8DQNjI0g-1
Received: by mail-wm1-f69.google.com with SMTP id
 r126-20020a1c4484000000b002e8858850abso314684wma.0
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 23:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kdU5Aqza9ZWbPymBqSm4kyPMeV694lTfymI4s4A9Y3Y=;
 b=G3ia6bMgKMmfnhWX4pp2TUHtwOEL6kK5IbFf4FpHqpoojk8KCgEUZ5WBK6AwnS+B6Z
 9TgzCONBFoFEdscNluU7Bd8n+yNoW017Q8tVZEJgJTeLM9atDhX5lpXGeVAfe4h5KfbM
 ZBPp4xM0SH337qAkvlVQX5U85EY7jNhjzkDq6fptO8l/QzlW1XOJRuhe86+OxWFEXuj7
 yH7FfGT696Y2kvn622ejBE42BLKirjtyDA1Siv6ZgzwUcfUOVtvVrulH41wRUeq2kVKV
 Rh+/WfQLb9GeaiQ0sETx8jrS/380uQb9hcgnF4P1rUzy3EUQyQniQS+fJ21ym4Zln/w3
 ek/g==
X-Gm-Message-State: AOAM5330mdY1yNh0HssjFiLk6Zun6l/623dYbvQZahpK5yFDNKlyM/FI
 GVlOWih+JPZFsRLGd2M9qCRNS35eovKrM+wP/8wXC2EOGAdoL+WnuyQqhdDXz4vGN0M2lOznRrO
 EnahMw0mFIBktoFNTxFaHvEzMM9VVDCHNoTgMi2RAUZg4JlDvfY5jdxXLFOIuUHQU
X-Received: by 2002:a05:6000:1091:: with SMTP id
 y17mr1638133wrw.202.1630563974970; 
 Wed, 01 Sep 2021 23:26:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTxb930UvmxIGhw6D82IqIqOPDyv+b+ErXok0n7MBRKTzhoUuSzqutnAF6XW4hbS7GYbXN3w==
X-Received: by 2002:a05:6000:1091:: with SMTP id
 y17mr1638105wrw.202.1630563974584; 
 Wed, 01 Sep 2021 23:26:14 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id l1sm856476wrb.15.2021.09.01.23.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 23:26:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/2] memory: Have 'info mtree' remove duplicated Address
 Space information
Date: Thu,  2 Sep 2021 08:26:04 +0200
Message-Id: <20210902062604.182620-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902062604.182620-1-philmd@redhat.com>
References: <20210902062604.182620-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per Peter Maydell [*]:

  'info mtree' monitor command was designed on the assumption that
  there's really only one or two interesting address spaces, and
  with more recent developments that's just not the case any more.

Similarly about how the FlatView are sorted using a GHashTable,
sort the AddressSpace objects to remove the duplications (AS
using the same root MemoryRegion).

This drastically reduces the output of 'info mtree' on some boards.

Before:

  $ (echo info mtree; echo q) \
    | qemu-system-aarch64 -S -monitor stdio -M raspi3b \
    | wc -l
  423

After:

  $ (echo info mtree; echo q) \
    | qemu-system-aarch64 -S -monitor stdio -M raspi3b \
    | wc -l
  108

  (qemu) info mtree
  address-space: I/O
    0000000000000000-000000000000ffff (prio 0, i/o): io

  address-space shared 9 times:
    - cpu-memory-0
    - cpu-memory-1
    - cpu-memory-2
    - cpu-memory-3
    - cpu-secure-memory-0
    - cpu-secure-memory-1
    - cpu-secure-memory-2
    - cpu-secure-memory-3
    - memory
    0000000000000000-ffffffffffffffff (prio 0, i/o): system
      0000000000000000-000000003fffffff (prio 0, ram): ram
      000000003f000000-000000003fffffff (prio 1, i/o): bcm2835-peripherals
        000000003f003000-000000003f00301f (prio 0, i/o): bcm2835-sys-timer
        000000003f004000-000000003f004fff (prio -1000, i/o): bcm2835-txp
        000000003f006000-000000003f006fff (prio 0, i/o): mphi
        000000003f007000-000000003f007fff (prio 0, i/o): bcm2835-dma
        000000003f00b200-000000003f00b3ff (prio 0, i/o): bcm2835-ic
        000000003f00b400-000000003f00b43f (prio -1000, i/o): bcm2835-sp804
        000000003f00b800-000000003f00bbff (prio 0, i/o): bcm2835-mbox
        000000003f100000-000000003f1001ff (prio 0, i/o): bcm2835-powermgt
        000000003f101000-000000003f102fff (prio 0, i/o): bcm2835-cprman
        000000003f104000-000000003f10400f (prio 0, i/o): bcm2835-rng
        000000003f200000-000000003f200fff (prio 0, i/o): bcm2835_gpio
        000000003f201000-000000003f201fff (prio 0, i/o): pl011
        000000003f202000-000000003f202fff (prio 0, i/o): bcm2835-sdhost
        000000003f203000-000000003f2030ff (prio -1000, i/o): bcm2835-i2s
        000000003f204000-000000003f20401f (prio -1000, i/o): bcm2835-spi0
        000000003f205000-000000003f20501f (prio -1000, i/o): bcm2835-i2c0
        000000003f20f000-000000003f20f07f (prio -1000, i/o): bcm2835-otp
        000000003f212000-000000003f212007 (prio 0, i/o): bcm2835-thermal
        000000003f214000-000000003f2140ff (prio -1000, i/o): bcm2835-spis
        000000003f215000-000000003f2150ff (prio 0, i/o): bcm2835-aux
        000000003f300000-000000003f3000ff (prio 0, i/o): sdhci
        000000003f600000-000000003f6000ff (prio -1000, i/o): bcm2835-smi
        000000003f804000-000000003f80401f (prio -1000, i/o): bcm2835-i2c1
        000000003f805000-000000003f80501f (prio -1000, i/o): bcm2835-i2c2
        000000003f900000-000000003f907fff (prio -1000, i/o): bcm2835-dbus
        000000003f910000-000000003f917fff (prio -1000, i/o): bcm2835-ave0
        000000003f980000-000000003f990fff (prio 0, i/o): dwc2
          000000003f980000-000000003f980fff (prio 0, i/o): dwc2-io
          000000003f981000-000000003f990fff (prio 0, i/o): dwc2-fifo
        000000003fc00000-000000003fc00fff (prio -1000, i/o): bcm2835-v3d
        000000003fe00000-000000003fe000ff (prio -1000, i/o): bcm2835-sdramc
        000000003fe05000-000000003fe050ff (prio 0, i/o): bcm2835-dma-chan15
      0000000040000000-00000000400000ff (prio 0, i/o): bcm2836-control

  address-space shared 4 times:
    - bcm2835-dma-memory
    - bcm2835-fb-memory
    - bcm2835-property-memory
    - dwc2
    0000000000000000-00000000ffffffff (prio 0, i/o): bcm2835-gpu
      0000000000000000-000000003fffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
      0000000040000000-000000007fffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
      000000007e000000-000000007effffff (prio 1, i/o): alias bcm2835-peripherals @bcm2835-peripherals 0000000000000000-0000000000ffffff
      0000000080000000-00000000bfffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
      00000000c0000000-00000000ffffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff

  address-space: bcm2835-mbox-memory
    0000000000000000-000000000000008f (prio 0, i/o): bcm2835-mbox
      0000000000000010-000000000000001f (prio 0, i/o): bcm2835-fb
      0000000000000080-000000000000008f (prio 0, i/o): bcm2835-property

  memory-region: ram
    0000000000000000-000000003fffffff (prio 0, ram): ram

  memory-region: bcm2835-peripherals
    000000003f000000-000000003fffffff (prio 1, i/o): bcm2835-peripherals
      000000003f003000-000000003f00301f (prio 0, i/o): bcm2835-sys-timer
      000000003f004000-000000003f004fff (prio -1000, i/o): bcm2835-txp
      000000003f006000-000000003f006fff (prio 0, i/o): mphi
      000000003f007000-000000003f007fff (prio 0, i/o): bcm2835-dma
      000000003f00b200-000000003f00b3ff (prio 0, i/o): bcm2835-ic
      000000003f00b400-000000003f00b43f (prio -1000, i/o): bcm2835-sp804
      000000003f00b800-000000003f00bbff (prio 0, i/o): bcm2835-mbox
      000000003f100000-000000003f1001ff (prio 0, i/o): bcm2835-powermgt
      000000003f101000-000000003f102fff (prio 0, i/o): bcm2835-cprman
      000000003f104000-000000003f10400f (prio 0, i/o): bcm2835-rng
      000000003f200000-000000003f200fff (prio 0, i/o): bcm2835_gpio
      000000003f201000-000000003f201fff (prio 0, i/o): pl011
      000000003f202000-000000003f202fff (prio 0, i/o): bcm2835-sdhost
      000000003f203000-000000003f2030ff (prio -1000, i/o): bcm2835-i2s
      000000003f204000-000000003f20401f (prio -1000, i/o): bcm2835-spi0
      000000003f205000-000000003f20501f (prio -1000, i/o): bcm2835-i2c0
      000000003f20f000-000000003f20f07f (prio -1000, i/o): bcm2835-otp
      000000003f212000-000000003f212007 (prio 0, i/o): bcm2835-thermal
      000000003f214000-000000003f2140ff (prio -1000, i/o): bcm2835-spis
      000000003f215000-000000003f2150ff (prio 0, i/o): bcm2835-aux
      000000003f300000-000000003f3000ff (prio 0, i/o): sdhci
      000000003f600000-000000003f6000ff (prio -1000, i/o): bcm2835-smi
      000000003f804000-000000003f80401f (prio -1000, i/o): bcm2835-i2c1
      000000003f805000-000000003f80501f (prio -1000, i/o): bcm2835-i2c2
      000000003f900000-000000003f907fff (prio -1000, i/o): bcm2835-dbus
      000000003f910000-000000003f917fff (prio -1000, i/o): bcm2835-ave0
      000000003f980000-000000003f990fff (prio 0, i/o): dwc2
        000000003f980000-000000003f980fff (prio 0, i/o): dwc2-io
        000000003f981000-000000003f990fff (prio 0, i/o): dwc2-fifo
      000000003fc00000-000000003fc00fff (prio -1000, i/o): bcm2835-v3d
      000000003fe00000-000000003fe000ff (prio -1000, i/o): bcm2835-sdramc
      000000003fe05000-000000003fe050ff (prio 0, i/o): bcm2835-dma-chan15

  (qemu) q

[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg829821.html

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
checkpatch warning (81 chars):

  WARNING: line over 80 characters
  #86: FILE: softmmu/memory.c:3359:
  +                                  address_space_compare_name);
---
 softmmu/memory.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 68 insertions(+), 3 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 5be7d5e7412..da58edfba04 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -3284,20 +3284,85 @@ static void mtree_info_flatview(bool dispatch_tree, bool owner)
     g_hash_table_unref(views);
 }
 
+struct AddressSpaceInfo {
+    MemoryRegionListHead *ml_head;
+    int counter;
+    bool owner;
+    bool disabled;
+};
+
+/* Returns negative value if a < b; zero if a = b; positive value if a > b. */
+static gint address_space_compare_name(gconstpointer a, gconstpointer b)
+{
+    const AddressSpace *as_a = a;
+    const AddressSpace *as_b = b;
+
+    return g_strcmp0(as_a->name, as_b->name);
+}
+static void mtree_print_as_name(gpointer data, gpointer user_data)
+{
+    AddressSpace *as = data;
+
+    qemu_printf("  - %s\n", as->name);
+}
+
+static void mtree_print_as(gpointer key, gpointer value, gpointer user_data)
+{
+    MemoryRegion *mr = key;
+    GSList *as_same_root_mr_list = value;
+    struct AddressSpaceInfo *asi = user_data;
+    guint same_root_len = g_slist_length(as_same_root_mr_list);
+
+    if (same_root_len == 1) {
+        AddressSpace *as = g_slist_nth_data(as_same_root_mr_list, 0);
+
+        qemu_printf("address-space: %s\n", as->name);
+    } else {
+        qemu_printf("address-space shared %u times:\n", same_root_len);
+        g_slist_foreach(as_same_root_mr_list, mtree_print_as_name, NULL);
+    }
+    mtree_print_mr(mr, 1, 0, asi->ml_head, asi->owner, asi->disabled);
+    qemu_printf("\n");
+}
+
+static gboolean mtree_info_as_free(gpointer key, gpointer value,
+                                   gpointer user_data)
+{
+    GSList *as_same_root_mr_list = value;
+
+    g_slist_free(as_same_root_mr_list);
+
+    return true;
+}
+
 static void mtree_info_as(bool dispatch_tree, bool owner, bool disabled)
 {
     MemoryRegionListHead ml_head;
     MemoryRegionList *ml, *ml2;
     AddressSpace *as;
+    GHashTable *views = g_hash_table_new(g_direct_hash, g_direct_equal);
+    GSList *as_same_root_mr_list;
+    struct AddressSpaceInfo asi = {
+        .ml_head = &ml_head,
+        .owner = owner,
+        .disabled = disabled,
+    };
 
     QTAILQ_INIT(&ml_head);
 
     QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
-        qemu_printf("address-space: %s\n", as->name);
-        mtree_print_mr(as->root, 1, 0, &ml_head, owner, disabled);
-        qemu_printf("\n");
+        /* Create hashtable, key=AS root MR, value = list of AS */
+        as_same_root_mr_list = g_hash_table_lookup(views, as->root);
+        as_same_root_mr_list = g_slist_insert_sorted(as_same_root_mr_list, as,
+                                                     address_space_compare_name);
+        g_hash_table_insert(views, as->root, as_same_root_mr_list);
     }
 
+    /* print address spaces */
+    g_hash_table_foreach(views, mtree_print_as, &asi);
+    g_hash_table_foreach_remove(views, mtree_info_as_free, 0);
+    g_hash_table_unref(views);
+
     /* print aliased regions */
     QTAILQ_FOREACH(ml, &ml_head, mrqueue) {
         qemu_printf("memory-region: %s\n", memory_region_name(ml->mr));
-- 
2.31.1


