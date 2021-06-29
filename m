Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B18F3B7822
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 20:59:50 +0200 (CEST)
Received: from localhost ([::1]:52942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyIxZ-0003UL-0m
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 14:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyImV-0001Mp-Ir; Tue, 29 Jun 2021 14:48:24 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:58457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyImD-0005J1-JY; Tue, 29 Jun 2021 14:48:21 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 603332B00A75;
 Tue, 29 Jun 2021 14:48:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 29 Jun 2021 14:48:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=DuFopZ4A9RjcC
 wbNQhkrU6J7tH/lODsXVd/hDzm3xrE=; b=U3oQzvfd1pGu7X1PI6xFM+CQVVMa4
 D2afzRUevD4h0iveL+hDcEj/cFlcuwN2JwEx0JLOcjmevZCoiWBJmD2TM5jEEYjC
 gi+eW1pHsnZd6L/ez04znQlOsH0sg7w1uqrU4LHDBgAcLZJMTo66i/Wkm5/Gd/XX
 2JcP7D8jli0MW7CIgg38z4xMTQhtQoBqJKqOfL4ZCgluN/cfLUXd+h2u+OgkdEJf
 lFF8TUSht2GpgQf7vn/Rpo5zasDJ2AHK5QluxQKJdmj1d+cjUoIkJOm0GaEK2MaI
 Vjm9SU088GGJQI0f+qEemI1on68BKQnW/6TuYHb+uMgMMYy+klTUlp9jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=DuFopZ4A9RjcCwbNQhkrU6J7tH/lODsXVd/hDzm3xrE=; b=S2VfpagT
 xBSWtNwrAkM0W7obQXtccg7Kwx8Xd3+M6UXo+N0a8LNvKI3+tgLvslmlKpCI7Lbm
 30h1xd32dlzvMeTega3mWxbZOU+0LXrOEuod8d8OzRI4d8Havd3MrNwO681OZwVY
 gSJhD5m9xu2wKHk3nm2wzfYcTiOYPCadFsTAoS+jlBZlgjt1n5w8IWwcBW1kqFY0
 flSPah+GkMSdg+UAKNfuOt8BTZFl/fratLTUtJCbJCcSWzkNDQLjHasyhCfeXNhS
 eXuRNjRtRlM2gV5ZixnhanDpq7VV77iBlTo1/auSPH3SZnFOmu521juiFrZE4lYc
 jRd1hwZN98aUBQ==
X-ME-Sender: <xms:4WrbYHHf3Of_a94EkrEF7c6cil98Sdhto9tv1O5UODUoesKtkYNS4g>
 <xme:4WrbYEXF7GtnGH23DSEPCBdmnIpgiCgN7QXr_VeW9aiQw27bxFieU-TxPxWycsGhi
 rzDi5nBnf-DHyLQO34>
X-ME-Received: <xmr:4WrbYJJUCFbNgMcgJWA3WLonUlU8cEwoA6WqYXKw3JsY9B6YVnn1mJqpraE-vp0M4YRa251A0P_kFHHmLJ5Uj0crxPXM9yzgJcOATPML6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:4WrbYFGaAvXmMC3FAHpvcd-4_HwtUuEbqY0yT4dQsJYt2PzfFSSNqw>
 <xmx:4WrbYNU-sGVNeWOf89gUKRxup5J4GSujCYpLZ-CMFKbWYGUt96CIuw>
 <xmx:4WrbYAO7wMd7woRemmBYSt9BImnjfo3nbMi3C4L7g8MwgSxmkSd-0g>
 <xmx:4mrbYIOUV1X1dSqhqVtjSzo0yaT5uboVoprLgUDyg7T4o1YcLTBPdSKQjUY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 14:48:00 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 04/23] hw/nvme: add param to control auto zone transitioning to
 zone state closed
Date: Tue, 29 Jun 2021 20:47:24 +0200
Message-Id: <20210629184743.230173-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629184743.230173-1-its@irrelevant.dk>
References: <20210629184743.230173-1-its@irrelevant.dk>
MIME-Version: 1.0
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Niklas Cassel <niklas.cassel@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Niklas Cassel <niklas.cassel@wdc.com>

In the Zoned Namespace Command Set Specification, chapter
2.5.1 Managing resources

"The controller may transition zones in the ZSIO:Implicitly Opened state
to the ZSC:Closed state for resource management purposes."

The word may in this sentence means that automatically transitioning
an implicitly opened zone to closed is completely optional.

Add a new parameter so that the user can control if this automatic
transitioning should be performed or not.

Being able to control this can help with verifying that e.g. a user-space
program behaves properly even without this optional ZNS feature.

The default value is set to true, in order to not change the existing
behavior.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
[k.jensen: moved parameter to controller]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/nvme.h |  1 +
 hw/nvme/ctrl.c | 32 ++++++++++++++++++++++----------
 2 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 81a35cda142b..93a7e0e5380e 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -382,6 +382,7 @@ typedef struct NvmeParams {
     uint8_t  vsl;
     bool     use_intel_id;
     uint8_t  zasl;
+    bool     auto_transition_zones;
     bool     legacy_cmb;
 } NvmeParams;
 
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 40a7efcea914..8dd9cb2ccbf3 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -34,6 +34,7 @@
  *              aerl=<N[optional]>,aer_max_queued=<N[optional]>, \
  *              mdts=<N[optional]>,vsl=<N[optional]>, \
  *              zoned.zasl=<N[optional]>, \
+ *              zoned.auto_transition=<on|off[optional]>, \
  *              subsys=<subsys_id>
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
  *              zoned=<true|false[optional]>, \
@@ -100,6 +101,11 @@
  *   the minimum memory page size (CAP.MPSMIN). The default value is 0 (i.e.
  *   defaulting to the value of `mdts`).
  *
+ * - `zoned.auto_transition`
+ *   Indicates if zones in zone state implicitly opened can be automatically
+ *   transitioned to zone state closed for resource management purposes.
+ *   Defaults to 'on'.
+ *
  * nvme namespace device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  * - `shared`
@@ -1686,8 +1692,8 @@ enum {
     NVME_ZRM_AUTO = 1 << 0,
 };
 
-static uint16_t nvme_zrm_open_flags(NvmeNamespace *ns, NvmeZone *zone,
-                                    int flags)
+static uint16_t nvme_zrm_open_flags(NvmeCtrl *n, NvmeNamespace *ns,
+                                    NvmeZone *zone, int flags)
 {
     int act = 0;
     uint16_t status;
@@ -1699,7 +1705,9 @@ static uint16_t nvme_zrm_open_flags(NvmeNamespace *ns, NvmeZone *zone,
         /* fallthrough */
 
     case NVME_ZONE_STATE_CLOSED:
-        nvme_zrm_auto_transition_zone(ns);
+        if (n->params.auto_transition_zones) {
+            nvme_zrm_auto_transition_zone(ns);
+        }
         status = nvme_aor_check(ns, act, 1);
         if (status) {
             return status;
@@ -1735,14 +1743,16 @@ static uint16_t nvme_zrm_open_flags(NvmeNamespace *ns, NvmeZone *zone,
     }
 }
 
-static inline uint16_t nvme_zrm_auto(NvmeNamespace *ns, NvmeZone *zone)
+static inline uint16_t nvme_zrm_auto(NvmeCtrl *n, NvmeNamespace *ns,
+                                     NvmeZone *zone)
 {
-    return nvme_zrm_open_flags(ns, zone, NVME_ZRM_AUTO);
+    return nvme_zrm_open_flags(n, ns, zone, NVME_ZRM_AUTO);
 }
 
-static inline uint16_t nvme_zrm_open(NvmeNamespace *ns, NvmeZone *zone)
+static inline uint16_t nvme_zrm_open(NvmeCtrl *n, NvmeNamespace *ns,
+                                     NvmeZone *zone)
 {
-    return nvme_zrm_open_flags(ns, zone, 0);
+    return nvme_zrm_open_flags(n, ns, zone, 0);
 }
 
 static void nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
@@ -2283,7 +2293,7 @@ static void nvme_copy_in_complete(NvmeRequest *req)
             goto invalid;
         }
 
-        status = nvme_zrm_auto(ns, zone);
+        status = nvme_zrm_auto(nvme_ctrl(req), ns, zone);
         if (status) {
             goto invalid;
         }
@@ -3080,7 +3090,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
             goto invalid;
         }
 
-        status = nvme_zrm_auto(ns, zone);
+        status = nvme_zrm_auto(n, ns, zone);
         if (status) {
             goto invalid;
         }
@@ -3169,7 +3179,7 @@ enum NvmeZoneProcessingMask {
 static uint16_t nvme_open_zone(NvmeNamespace *ns, NvmeZone *zone,
                                NvmeZoneState state, NvmeRequest *req)
 {
-    return nvme_zrm_open(ns, zone);
+    return nvme_zrm_open(nvme_ctrl(req), ns, zone);
 }
 
 static uint16_t nvme_close_zone(NvmeNamespace *ns, NvmeZone *zone,
@@ -6259,6 +6269,8 @@ static Property nvme_props[] = {
     DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, false),
     DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, false),
     DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
+    DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
+                     params.auto_transition_zones, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.32.0


