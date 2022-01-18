Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 104554925B2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 13:27:42 +0100 (CET)
Received: from localhost ([::1]:34912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9naP-0008Hd-5i
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 07:27:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nEB-0006BS-OH; Tue, 18 Jan 2022 07:04:46 -0500
Received: from [2a00:1450:4864:20::32e] (port=36551
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nCT-0005jk-Fw; Tue, 18 Jan 2022 07:04:21 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso3758151wma.1; 
 Tue, 18 Jan 2022 04:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LbeGhGwTNs7JJIpS9RWiGIcQvzwZfRfuhvu4vDkY+4U=;
 b=YphJqyeqmEhaWMbsGe+mBNiU5Fefn5JUwGBnPQpIbGtk7vrpQ6ram1W+Jy5y/pM0oP
 jnGOLquiLVaCexv4+F9CX3iag3GHH4BJhzFTMIjqAPv4moK4yx53mZH4YI7kB17N1mHW
 Ju17iBOFSb6wTTFSv57Pij8t2sujnJlixb39tYwzj0sjV3JrLwJNUTLMkPmjs2hkg3Dd
 L58NVlFfxGKGWkqERftCJFOIvvt/TjPH9gRhSiqZ7NIFy9IAcKUT2UUNoiZxa5CwMDUq
 /1DMEwGdRq95laxUQmWARrWnOG6F5BU5o4TKbgZQ56umtLUmQjXCLZAUglOrbIPF5EG+
 rPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LbeGhGwTNs7JJIpS9RWiGIcQvzwZfRfuhvu4vDkY+4U=;
 b=yjwM+3xE5ClhrR5eeWN23HnO7YHb47HdOt+Xayf/EorlkZdTO/5wC2cSsk3a7kXSr7
 IiaA+px7bh1XiipYUsvhujnpmQlhFuqwnGzwxZ5CsaBZShiUJYhknlhtcWahbELOJiNZ
 YPVvRtgzapOxBXvZ2w44QUM9nEpFj/07A62BN+AbvbCn5LotPa7wabFRKn3YbXDsPM77
 R3m8xqtwO6bfkOWYJO4c90AQkT1zNB4V3jM9H1ibYQbSzl3h9hp1G6UHJ6Ijo8FY9wfQ
 mV8gv+4UjrNeEpaWuK8e6+9xA+42lIZRmgulLLzI6+ooN7ljWHvv5NgsBe1CpTbKdNma
 eIAw==
X-Gm-Message-State: AOAM530N8XBXXgO3k99syCaKYO8+3wMWRGSd4Ch6KH46o0HQtOhemOH4
 aeuWJcI+7MwwhCuBDliewcH5pXVtxXU=
X-Google-Smtp-Source: ABdhPJzXkfN6ThRkV5pMod/EvCLyj4aAoEiUVLI5+yvmpWwzjp3QX3k9P2nu8FLmv0agd91vMlggNg==
X-Received: by 2002:adf:c74e:: with SMTP id b14mr23869054wrh.97.1642507365370; 
 Tue, 18 Jan 2022 04:02:45 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 e4sm7284312wrq.63.2022.01.18.04.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 04:02:45 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 03/19] memory: Have 'info mtree' remove duplicated Address
 Space information
Date: Tue, 18 Jan 2022 13:02:13 +0100
Message-Id: <20220118120229.196337-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118120229.196337-1-f4bug@amsat.org>
References: <20220118120229.196337-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

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
  106

  (qemu) info mtree
  address-space: I/O
    0000000000000000-000000000000ffff (prio 0, i/o): io

  address-space: cpu-memory-0
  address-space: cpu-memory-1
  address-space: cpu-memory-2
  address-space: cpu-memory-3
  address-space: cpu-secure-memory-0
  address-space: cpu-secure-memory-1
  address-space: cpu-secure-memory-2
  address-space: cpu-secure-memory-3
  address-space: memory
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

  address-space: bcm2835-dma-memory
  address-space: bcm2835-fb-memory
  address-space: bcm2835-property-memory
  address-space: dwc2
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
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210904231101.1071929-2-philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/memory.c | 63 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 60 insertions(+), 3 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 2cb823c642f..5e69624f7ff 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -3322,20 +3322,77 @@ static void mtree_info_flatview(bool dispatch_tree, bool owner)
     g_hash_table_unref(views);
 }
 
+struct AddressSpaceInfo {
+    MemoryRegionListHead *ml_head;
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
+
+static void mtree_print_as_name(gpointer data, gpointer user_data)
+{
+    AddressSpace *as = data;
+
+    qemu_printf("address-space: %s\n", as->name);
+}
+
+static void mtree_print_as(gpointer key, gpointer value, gpointer user_data)
+{
+    MemoryRegion *mr = key;
+    GSList *as_same_root_mr_list = value;
+    struct AddressSpaceInfo *asi = user_data;
+
+    g_slist_foreach(as_same_root_mr_list, mtree_print_as_name, NULL);
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
2.34.1


