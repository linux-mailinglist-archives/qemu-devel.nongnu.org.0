Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D78314A9D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:47:00 +0100 (CET)
Received: from localhost ([::1]:40804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Ofj-0007L2-Rk
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:46:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NWB-0005bk-CZ; Tue, 09 Feb 2021 02:33:04 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:44115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVw-0005qn-7E; Tue, 09 Feb 2021 02:33:03 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 3456CB01;
 Tue,  9 Feb 2021 02:32:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
 3YA473Cd7a7oPTzuX6qfF+JO9bpSIESOYeTOsed6pZc=; b=m6xlCHZwcg59uF4y
 stjLyK46i72tBf4dcP2tERL+R+uV4EEgGtTYxk+YVspmthAda4ySd3UOJ55FEO/v
 w/koasBcGRzRybaeyu89hFpZYlJ9Wlylky6OXTJtyYwgKVQEY6FXQKUUS5k6rbjy
 3XC2vB/RwYsO8T9YmSm4rw0CIXvd8lA0ht0/rwMDBS+YDML6GmLKOpQVX5LEEOdV
 aarAuAAr168GN9WHVevuF1p2Nf7/rq37j3b2e79vdp3vRbD1OLnrx/Oejs4nvs79
 iMFJ7eKW6zMUojuYfWbevp8jJ7OpJPScx4tXu3WUzxjAg2tIaIXGGepmbaYgWacO
 vAk8Hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=3YA473Cd7a7oPTzuX6qfF+JO9bpSIESOYeTOsed6p
 Zc=; b=c2f2Yy7NEUD/9vgdU+c2VcGOPlqLexvFz5Axq2DaSnMg218+iH+GG9uEp
 swNOlnNSkGDq2hCqVma8IzMDhHWoTh8JjVC9ZXJMG7udMT7KqyrblAWaX7R4EaBt
 Xs7nGxmqy2fykgTfeVJFnlAfhC9GiwTCR4C2G7mpGRlBIN6jVTAFasvl6uJnS3wM
 6ccFIApdhEk26ZUki+Vb926vinQ/qmCnB+KR7aeiU7D70o2qrKb8U4I6Ic1vwK8B
 NxMWIMIy3KDKCbylQBSWPzOop2Rg3U7zHubwMLa0VYfBWRV3WS61tQHKEJTF60q2
 mlUyVrTe8QfvyJRYzBFPCMQHcV7sg==
X-ME-Sender: <xms:gjoiYLGEqDnWOrvrPuSWoPmxjoArrCVYeev6cVnpjSPwgQ1TobvwWw>
 <xme:gjoiYIWhGQ3W6kdsuGT5zqT0ACsmGSIc1yDBDZuO2QehvJFirNl5J6OIDIi_It25-
 LJQkPYBok1ZMDBPVBI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepteevuedugeevieehgeeileeufeetvddtkeetfeelgeehudfhjeeuledvhfff
 tdegnecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:gjoiYNKbA8_dTBV77ZRbYlr_zCRM9KSk5aqXYfb52t8fSwe_9klzVQ>
 <xmx:gjoiYJFwA2nXJcBqDbwQes4HOOrOJcUtSyUsnwkcnMEP8lfTDmTYkA>
 <xmx:gjoiYBX4iI0hFu4sibNlvRG2JnzWvl5E9oee1xRhnVVrEuSmajSPeg>
 <xmx:gjoiYJTXiS_5xxjz-FWCD-aSHR_CPt77eNQogPHZCUwSvIzIKYYTyRoHZlw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 44DE4108005B;
 Tue,  9 Feb 2021 02:32:17 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 36/56] hw/block/nvme: add smart_critical_warning property
Date: Tue,  9 Feb 2021 08:30:41 +0100
Message-Id: <20210209073101.548811-37-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 zhenwei pi <pizhenwei@bytedance.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhenwei pi <pizhenwei@bytedance.com>

There is a very low probability that hitting physical NVMe disk
hardware critical warning case, it's hard to write & test a monitor
agent service.

For debugging purposes, add a new 'smart_critical_warning' property
to emulate this situation.

The orignal version of this change is implemented by adding a fixed
property which could be initialized by QEMU command line. Suggested
by Philippe & Klaus, rework like current version.

Test with this patch:
1, change smart_critical_warning property for a running VM:
 #virsh qemu-monitor-command nvme-upstream '{ "execute": "qom-set",
  "arguments": { "path": "/machine/peripheral-anon/device[0]",
  "property": "smart_critical_warning", "value":16 } }'
2, run smartctl in guest
 #smartctl -H -l error /dev/nvme0n1

  === START OF SMART DATA SECTION ===
  SMART overall-health self-assessment test result: FAILED!
  - volatile memory backup device has failed

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h      |  1 +
 include/block/nvme.h |  1 +
 hw/block/nvme.c      | 45 +++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 347c149e7905..b0d5b6409d8e 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -148,6 +148,7 @@ typedef struct NvmeCtrl {
     uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
     uint64_t    starttime_ms;
     uint16_t    temperature;
+    uint8_t     smart_critical_warning;
 
     HostMemoryBackend *pmrdev;
 
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 41614c5e12af..88af3b42348c 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -60,6 +60,7 @@ enum NvmeCapMask {
 #define NVME_CAP_CSS(cap)   (((cap) >> CAP_CSS_SHIFT)    & CAP_CSS_MASK)
 #define NVME_CAP_MPSMIN(cap)(((cap) >> CAP_MPSMIN_SHIFT) & CAP_MPSMIN_MASK)
 #define NVME_CAP_MPSMAX(cap)(((cap) >> CAP_MPSMAX_SHIFT) & CAP_MPSMAX_MASK)
+#define NVME_CAP_PMR(cap)   (((cap) >> CAP_PMR_SHIFT)    & CAP_PMR_MASK)
 
 #define NVME_CAP_SET_MQES(cap, val)   (cap |= (uint64_t)(val & CAP_MQES_MASK)  \
                                                            << CAP_MQES_SHIFT)
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 4d73398798f1..f0cb7acd7454 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2490,6 +2490,7 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     }
 
     trans_len = MIN(sizeof(smart) - off, buf_len);
+    smart.critical_warning = n->smart_critical_warning;
 
     smart.data_units_read[0] = cpu_to_le64(DIV_ROUND_UP(stats.units_read,
                                                         1000));
@@ -4432,6 +4433,40 @@ static Property nvme_props[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static void nvme_get_smart_warning(Object *obj, Visitor *v, const char *name,
+                                   void *opaque, Error **errp)
+{
+    NvmeCtrl *n = NVME(obj);
+    uint8_t value = n->smart_critical_warning;
+
+    visit_type_uint8(v, name, &value, errp);
+}
+
+static void nvme_set_smart_warning(Object *obj, Visitor *v, const char *name,
+                                   void *opaque, Error **errp)
+{
+    NvmeCtrl *n = NVME(obj);
+    uint8_t value, cap = 0;
+
+    if (!visit_type_uint8(v, name, &value, errp)) {
+        return;
+    }
+
+    cap = NVME_SMART_SPARE | NVME_SMART_TEMPERATURE | NVME_SMART_RELIABILITY
+          | NVME_SMART_MEDIA_READ_ONLY | NVME_SMART_FAILED_VOLATILE_MEDIA;
+    if (NVME_CAP_PMR(n->bar.cap)) {
+        cap |= NVME_SMART_PMR_UNRELIABLE;
+    }
+
+    if ((value & cap) != value) {
+        error_setg(errp, "unsupported smart critical warning bits: 0x%x",
+                   value & ~cap);
+        return;
+    }
+
+    n->smart_critical_warning = value;
+}
+
 static const VMStateDescription nvme_vmstate = {
     .name = "nvme",
     .unmigratable = 1,
@@ -4455,13 +4490,17 @@ static void nvme_class_init(ObjectClass *oc, void *data)
 
 static void nvme_instance_init(Object *obj)
 {
-    NvmeCtrl *s = NVME(obj);
+    NvmeCtrl *n = NVME(obj);
 
-    if (s->namespace.blkconf.blk) {
-        device_add_bootindex_property(obj, &s->namespace.blkconf.bootindex,
+    if (n->namespace.blkconf.blk) {
+        device_add_bootindex_property(obj, &n->namespace.blkconf.bootindex,
                                       "bootindex", "/namespace@1,0",
                                       DEVICE(obj));
     }
+
+    object_property_add(obj, "smart_critical_warning", "uint8",
+                        nvme_get_smart_warning,
+                        nvme_set_smart_warning, NULL, NULL);
 }
 
 static const TypeInfo nvme_info = {
-- 
2.30.0


