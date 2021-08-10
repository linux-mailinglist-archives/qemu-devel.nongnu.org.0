Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BDA3E5C01
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 15:42:57 +0200 (CEST)
Received: from localhost ([::1]:41372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDS1w-0001r7-Va
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 09:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mDS0C-0007GA-TC; Tue, 10 Aug 2021 09:41:08 -0400
Received: from forward3-smtp.messagingengine.com ([66.111.4.237]:46223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mDS08-0003hp-Rg; Tue, 10 Aug 2021 09:41:08 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailforward.nyi.internal (Postfix) with ESMTP id 3FD36194009B;
 Tue, 10 Aug 2021 09:41:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 10 Aug 2021 09:41:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=B7yw234pFsdlhlhxFOpTGWvxm5kTKGDXEngEIAXEhMk=; b=uP85APQq
 y2gyKcmmvscMiYWdtLq+tTS+znnD8y499eaRiFdJ+TOjqYlFl0IOhEj4//e4gs5b
 AqypzEL9qCdYOnYjzaFGBIm9AlQiJtiq1jW8w/s2x9B6YZoRSoxtSFddMWDwa8dc
 5ZkOJ9l2eVdCttRzUalrSD/ow8O6SpTjd0dgyvn7KCfKZtlb/1AXipldMNWuHVqb
 g38qaq0UEfA1VwTYp3VwDLQIGo3ake80FWACI5gbOUgX2dMbCuaszDvUpLLBo1LR
 /6k5EH2XDQlYxxJevLkSOP6aVkI+kc+iphmCLbUHgMVqdGrAKbTsMZetyts751+Z
 VuQYROM2XRJhmg==
X-ME-Sender: <xms:54ESYW3OLKBfthajFApo0l4OaaHj5htGNG3mv4nxMyWv-k7P_zMPsA>
 <xme:54ESYZHu-44K4_ewGiCXwk-BPrWbK86NCcQXyJYRknagIyYLyl0Alw9ltp_2shANm
 UQGGqCu0eiMdv9N-vo>
X-ME-Received: <xmr:54ESYe4xp9xo0to5_tq1dhhrV88_1gh2zVW6_Dp8nYFzzudgG4R5JoG7hotj7OFF_S2fugwY3bwexN5r9IDsl9poAn8wr3WI1v5WmTntfpI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjeelgdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgrvhhiugcu
 gfgumhhonhgushhonhcuoegurghvihgurdgvughmohhnughsohhnsehorhgrtghlvgdrtg
 homheqnecuggftrfgrthhtvghrnhepudefteejgfefhfdtjefhhedtffethfetkeehgfel
 heffhfeihfeglefgjedtheeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepuggrvhhiugdrvggumhhonhgushhonhesohhrrggtlhgvrdgtohhm
X-ME-Proxy: <xmx:54ESYX2CV9rcWwWbJacSOPnzMdixaUBAoHG-11_zNSvJjAFDW_tcTg>
 <xmx:54ESYZGh_oPf4u9gFVco9t9-q_qqeku1ZDz_OQJlRMHGtBPDzNp9xQ>
 <xmx:54ESYQ-tJSnL90F4WO-HrcGJq21W8VJC_sZLj9edZtNiqQXbedGfSg>
 <xmx:7YESYfXkKEW_sAjrVS2fF7mhNoPc7i7TRup81WHfOUwtMYdBY8jQPJB25Ak>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Aug 2021 09:40:53 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id a555f518;
 Tue, 10 Aug 2021 13:40:50 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/1] hw/pflash_cfi01: Allow backing devices to be smaller
 than memory region
Date: Tue, 10 Aug 2021 14:40:50 +0100
Message-Id: <20210810134050.396747-2-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210810134050.396747-1-david.edmondson@oracle.com>
References: <20210810134050.396747-1-david.edmondson@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=66.111.4.237;
 envelope-from=david.edmondson@oracle.com;
 helo=forward3-smtp.messagingengine.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Xu Yandong <xuyandong2@huawei.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Zheng Xiang <zhengxiang9@huawei.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?haibinzhang=28=E5=BC=A0=E6=B5=B7=E6=96=8C=29?=
 <haibinzhang@tencent.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow the backing device to be smaller than the extent of the flash
device by mapping it as a subregion of the flash device region.

Return zeroes for all reads of the flash device beyond the extent of
the backing device.

For writes beyond the extent of the underlying device, fail on
read-only devices and discard them for writable devices.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 hw/block/pflash_cfi01.c | 105 ++++++++++++++++++++++++++++++++--------
 hw/block/trace-events   |   3 ++
 2 files changed, 87 insertions(+), 21 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 81f9f971d8..f3289b6a2f 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -83,6 +83,8 @@ struct PFlashCFI01 {
     uint64_t counter;
     unsigned int writeblock_size;
     MemoryRegion mem;
+    MemoryRegion mem_outer;
+    char outer_name[64];
     char *name;
     void *storage;
     VMChangeStateEntry *vmstate;
@@ -434,7 +436,6 @@ static inline void pflash_data_write(PFlashCFI01 *pfl, hwaddr offset,
         }
         break;
     }
-
 }
 
 static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
@@ -656,8 +657,44 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
 }
 
 
-static MemTxResult pflash_mem_read_with_attrs(void *opaque, hwaddr addr, uint64_t *value,
-                                              unsigned len, MemTxAttrs attrs)
+static MemTxResult pflash_outer_read_with_attrs(void *opaque, hwaddr addr,
+                                                uint64_t *value, unsigned len,
+                                                MemTxAttrs attrs)
+{
+    PFlashCFI01 *pfl = opaque;
+
+    trace_pflash_outer_read(pfl->name, addr, len);
+    *value = 0;
+    return MEMTX_OK;
+}
+
+static MemTxResult pflash_outer_write_with_attrs(void *opaque, hwaddr addr,
+                                                 uint64_t value, unsigned len,
+                                                 MemTxAttrs attrs)
+{
+    PFlashCFI01 *pfl = opaque;
+
+    trace_pflash_outer_write(pfl->name, addr, len);
+    if (pfl->ro) {
+        return MEMTX_ERROR;
+    } else {
+        warn_report_once("%s: "
+                         "attempt to write outside of the backing block device "
+                         "(offset " TARGET_FMT_plx ") ignored",
+                         pfl->name, addr);
+        return MEMTX_OK;
+    }
+}
+
+static const MemoryRegionOps pflash_cfi01_outer_ops = {
+    .read_with_attrs = pflash_outer_read_with_attrs,
+    .write_with_attrs = pflash_outer_write_with_attrs,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static MemTxResult pflash_mem_read_with_attrs(void *opaque, hwaddr addr,
+                                              uint64_t *value, unsigned len,
+                                              MemTxAttrs attrs)
 {
     PFlashCFI01 *pfl = opaque;
     bool be = !!(pfl->features & (1 << PFLASH_BE));
@@ -670,8 +707,9 @@ static MemTxResult pflash_mem_read_with_attrs(void *opaque, hwaddr addr, uint64_
     return MEMTX_OK;
 }
 
-static MemTxResult pflash_mem_write_with_attrs(void *opaque, hwaddr addr, uint64_t value,
-                                               unsigned len, MemTxAttrs attrs)
+static MemTxResult pflash_mem_write_with_attrs(void *opaque, hwaddr addr,
+                                               uint64_t value, unsigned len,
+                                               MemTxAttrs attrs)
 {
     PFlashCFI01 *pfl = opaque;
     bool be = !!(pfl->features & (1 << PFLASH_BE));
@@ -800,7 +838,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
 {
     ERRP_GUARD();
     PFlashCFI01 *pfl = PFLASH_CFI01(dev);
-    uint64_t total_len;
+    uint64_t outer_len, inner_len;
     int ret;
 
     if (pfl->sector_len == 0) {
@@ -816,35 +854,60 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    total_len = pfl->sector_len * pfl->nb_blocs;
-
-    memory_region_init_rom_device(
-        &pfl->mem, OBJECT(dev),
-        &pflash_cfi01_ops,
-        pfl,
-        pfl->name, total_len, errp);
-    if (*errp) {
-        return;
-    }
-
-    pfl->storage = memory_region_get_ram_ptr(&pfl->mem);
-    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
+    outer_len = pfl->sector_len * pfl->nb_blocs;
 
     if (pfl->blk) {
         uint64_t perm;
+
         pfl->ro = !blk_supports_write_perm(pfl->blk);
         perm = BLK_PERM_CONSISTENT_READ | (pfl->ro ? 0 : BLK_PERM_WRITE);
         ret = blk_set_perm(pfl->blk, perm, BLK_PERM_ALL, errp);
         if (ret < 0) {
             return;
         }
+
+        inner_len = blk_getlength(pfl->blk);
+
+        if (inner_len > outer_len) {
+            error_setg(errp, "%s: "
+                       "block backend provides %" PRIu64 " bytes, "
+                       "device limited to %" PRIu64 " bytes",
+                       pfl->name, inner_len, outer_len);
+            return;
+        }
     } else {
         pfl->ro = false;
+        inner_len = outer_len;
     }
 
+    trace_pflash_realize(pfl->name, pfl->ro, inner_len, outer_len);
+
+    snprintf(pfl->outer_name, sizeof(pfl->outer_name),
+             "%s container", pfl->name);
+    memory_region_init_io(&pfl->mem_outer, OBJECT(dev),
+                          &pflash_cfi01_outer_ops,
+                          pfl, pfl->outer_name, outer_len);
+
+    memory_region_init_rom_device(&pfl->mem, OBJECT(dev),
+                                  &pflash_cfi01_ops,
+                                  pfl, pfl->name, inner_len, errp);
+    if (*errp) {
+        return;
+    }
+
+    memory_region_add_subregion(&pfl->mem_outer, 0, &pfl->mem);
+
+    pfl->storage = memory_region_get_ram_ptr(&pfl->mem);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem_outer);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
+
     if (pfl->blk) {
-        if (!blk_check_size_and_read_all(pfl->blk, pfl->storage, total_len,
-                                         errp)) {
+        int ret = blk_pread(pfl->blk, 0, pfl->storage, inner_len);
+
+        if (ret < 0) {
+            error_setg_errno(errp, -ret,
+                             "cannot read %" PRIu64 " "
+                             "bytes from block backend", inner_len);
             vmstate_unregister_ram(&pfl->mem, DEVICE(pfl));
             return;
         }
diff --git a/hw/block/trace-events b/hw/block/trace-events
index d86b53520c..3d1e07261e 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -21,10 +21,13 @@ pflash_io_read(const char *name, uint64_t offset, unsigned int size, uint32_t va
 pflash_io_write(const char *name, uint64_t offset, unsigned int size, uint32_t value, uint8_t wcycle) "%s: offset:0x%04"PRIx64" size:%u value:0x%04x wcycle:%u"
 pflash_manufacturer_id(const char *name, uint16_t id) "%s: read manufacturer ID: 0x%04x"
 pflash_mode_read_array(const char *name) "%s: read array mode"
+pflash_outer_read(const char *name, uint64_t addr, unsigned int len) "%s: addr:0x%" PRIx64 " len:%d"
+pflash_outer_write(const char *name, uint64_t addr, unsigned int len) "%s: addr:0x%" PRIx64 " len:%d"
 pflash_postload_cb(const char *name)  "%s: updating bdrv"
 pflash_read_done(const char *name, uint64_t offset, uint64_t ret) "%s: ID:0x%" PRIx64 " ret:0x%" PRIx64
 pflash_read_status(const char *name, uint32_t ret) "%s: status:0x%x"
 pflash_read_unknown_state(const char *name, uint8_t cmd) "%s: unknown command state:0x%x"
+pflash_realize(const char *name, bool ro, uint64_t blk_len, uint64_t total_len) "%s: ro:%d blk_len:0x%" PRIx64 " total_len:0x%" PRIx64
 pflash_reset(const char *name) "%s: reset"
 pflash_sector_erase_start(const char *name, int width1, uint64_t start, int width2, uint64_t end) "%s: start sector erase at: 0x%0*" PRIx64 "-0x%0*" PRIx64
 pflash_timer_expired(const char *name, uint8_t cmd) "%s: command 0x%02x done"
-- 
2.30.2


