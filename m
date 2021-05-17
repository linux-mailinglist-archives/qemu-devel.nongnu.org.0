Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 031D438283B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 11:24:12 +0200 (CEST)
Received: from localhost ([::1]:47346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liZTu-0007CF-Ub
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 05:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZO8-0003Ri-7N; Mon, 17 May 2021 05:18:12 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:55917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZO4-0005nM-BR; Mon, 17 May 2021 05:18:11 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 2EFD9245;
 Mon, 17 May 2021 05:18:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 17 May 2021 05:18:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 wjqHkisfdLV2qseUYAToUR0QF1mrh6XDvcgN0NNRcz0=; b=F5lsjXmPVO5Tc9t1
 DgivdNgjG7/nWlx2F3+J9c3+Wy8sMr6zVJOrzr4vL4ne6t1vSb5W+CbrWTVm71Yz
 QlbVNlg6EDA75ysrNpDa16AmeQatyhI7WM85Fl9GXiiCOSEZVHmu53E9oIQdnQyM
 +hKPG57KG0oLSN7rfGobaWofa0dKvWlHUnqGOzi7uZwVCJ/G6qQBx7xexGAC+HOW
 cfrQ9Xiu4IuiBl99GtoYOLp/Z/S7QHtZ+FH5rvMgnEGs5HXyvJUzSFhrbUxhhZH9
 ghUtErpD61L4TmmBYU68CuwIUvvDUwpHKn1WNuGxSVZFUPakOkyAaE2XwPzXunKa
 5uuaDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=wjqHkisfdLV2qseUYAToUR0QF1mrh6XDvcgN0NNRc
 z0=; b=tHvC7h+SCw9xOwSi9QjoAfxq9vLKvmdvnlm1jwmDBEK+8CJjdpJ4eiyua
 Id/MttBwL3riDdSFgcifRG93SGVXna9xuoJnQyJSJbQVkcf/8bS1K4/DMruGEJxH
 nrLqKEUNq7yOwrRCjzkAPzT6q/DuXzo/AhWS9GiTrL1w/Takmkxiywfv9QiyEdYN
 CHUEEW1a0IYI2L8TPDtO5oP6Vb/TfygPV+5OAE3rHjhOJmr0Cv7Qf+eeNu3Wo3yc
 BHU+l2fQ+tdpWoOV5O/SSF19Uh5A6NPle4RCGCCarBVDaga+s/gAd1d4uvquwHXr
 AhWrQomEpolVuUqxUHvf2BCJOMjEQ==
X-ME-Sender: <xms:zTSiYIXKBra4OubWjXkraTibn_PifVA8AZQci0CLLRX-UtsAOK0t0Q>
 <xme:zTSiYMnUaeuzeF1Mf_u9fLfRJFCa84pN1DsIj9xmDY-gvwy8Llm9CF9Nsyc0fHLuy
 A-g0vd5gwrBhPOrQdE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeihedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepteevuedugeevieehgeeileeufeetvddtkeetfeelgeehudfhjeeuledvhfff
 tdegnecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:zTSiYMaH6L96bGqjn8jvCgcOK9m-ivSgb_RRIdr9KwOkPpvi7-u-IQ>
 <xmx:zTSiYHUfacMu7658wWKM1hwEADxIvovm_QcEFsNnT6Gmec_HQfLZpQ>
 <xmx:zTSiYClHJVjNBeGAZNWejtiXJJBSgQaSygUIl1xm6jzI15G5kxyMTw>
 <xmx:zTSiYHgHCa5U_VoGGKCxks-G_eiMeKMjceZU9AcrK7emEbcFOZyCpDGx8GY>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 05:18:04 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 07/20] hw/block/nvme: rename __nvme_zrm_open
Date: Mon, 17 May 2021 11:17:24 +0200
Message-Id: <20210517091737.841787-8-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517091737.841787-1-its@irrelevant.dk>
References: <20210517091737.841787-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
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
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Get rid of the (reserved) double underscore use. Rename the "generic"
zone open function to nvme_zrm_open_flags() and add a generic `int
flags` argument instead which allows more flags to be easily added in
the future. There is at least one TP under standardization that would
add an additional flag.

Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index baba949660f2..9e5ab4cacb06 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1694,8 +1694,12 @@ static void nvme_zrm_auto_transition_zone(NvmeNamespace *ns)
     }
 }
 
-static uint16_t __nvme_zrm_open(NvmeNamespace *ns, NvmeZone *zone,
-                                bool implicit)
+enum {
+    NVME_ZRM_AUTO = 1 << 0,
+};
+
+static uint16_t nvme_zrm_open_flags(NvmeNamespace *ns, NvmeZone *zone,
+                                    int flags)
 {
     int act = 0;
     uint16_t status;
@@ -1719,7 +1723,7 @@ static uint16_t __nvme_zrm_open(NvmeNamespace *ns, NvmeZone *zone,
 
         nvme_aor_inc_open(ns);
 
-        if (implicit) {
+        if (flags & NVME_ZRM_AUTO) {
             nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_IMPLICITLY_OPEN);
             return NVME_SUCCESS;
         }
@@ -1727,7 +1731,7 @@ static uint16_t __nvme_zrm_open(NvmeNamespace *ns, NvmeZone *zone,
         /* fallthrough */
 
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
-        if (implicit) {
+        if (flags & NVME_ZRM_AUTO) {
             return NVME_SUCCESS;
         }
 
@@ -1745,12 +1749,12 @@ static uint16_t __nvme_zrm_open(NvmeNamespace *ns, NvmeZone *zone,
 
 static inline uint16_t nvme_zrm_auto(NvmeNamespace *ns, NvmeZone *zone)
 {
-    return __nvme_zrm_open(ns, zone, true);
+    return nvme_zrm_open_flags(ns, zone, NVME_ZRM_AUTO);
 }
 
 static inline uint16_t nvme_zrm_open(NvmeNamespace *ns, NvmeZone *zone)
 {
-    return __nvme_zrm_open(ns, zone, false);
+    return nvme_zrm_open_flags(ns, zone, 0);
 }
 
 static void __nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
-- 
2.31.1


