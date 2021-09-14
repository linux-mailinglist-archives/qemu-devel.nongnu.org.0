Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540DD40B996
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 23:04:32 +0200 (CEST)
Received: from localhost ([::1]:52604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQFbR-00079k-LT
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 17:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFCa-0006R8-Q4; Tue, 14 Sep 2021 16:38:48 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:51275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFCX-00051F-GR; Tue, 14 Sep 2021 16:38:48 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 74DF93200A26;
 Tue, 14 Sep 2021 16:38:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 14 Sep 2021 16:38:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=wQx0cVw41BjM8
 47u0aYsVl/GmOzPi4CDP2MWeYGWXSs=; b=G1wbXb6AwnFrpuXerXA4SeXzNEIOJ
 /rdhrKGwAWqHbKJFpij68G9fdl45EcvZE8nPDCiCC+B0uw2g8QxkvCcZMDCpQxDv
 8acDa5LqBHfp1URQsPX560Zs7DwV+Ln2sw8hOlU8Km+goM6FGBSETG2jxwKYSbL5
 g3UClMmQNrVim0keeOI+dum705IuPkTjWdlZULFrVn1NMVzM5Lx5x11emJbCWkWz
 wQU/WXEBIQB/SbUnyt2QZopMtng20Qr8Mmwv5W81ep2Zt58fb1Ha3YpG6cAL9xwt
 hp5Mw3/QC+GRTbW0vA5txk0rBHM/8Szf0FO16Ld+bcRkFTxX2qXJFOHoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=wQx0cVw41BjM847u0aYsVl/GmOzPi4CDP2MWeYGWXSs=; b=GvdA/AtW
 dA6UjMLT/9i92u0+tJUzkcAgUi4Tdm8iLFFSMLjjlyt4lM3RUhKQYu+nPBzvmot1
 5ETBLU0U+fyaJJXDbakH6w0L2PJnafKT/gW6THETcl9BfCy+Jw6SxT5uWnDFHQYY
 5H+7+hASmKA5ebwCSNfukRvbRHRC6fLRXMs4wqi0tou1by2gyg4ICLUtLzLSupYk
 qa0IrXGW0Q78xTDrlWagpurUr8IPlQCwjKTV+ylRvCI1hPP4a1ZD0O0/+NjfWbTv
 pQAdInBYA8RQyhQ3OIUy6etJ/sFhcNePSPswvAHuUPkMlzdn2IbbsXvgDJdZ4+r+
 SfxzxEELvNil8w==
X-ME-Sender: <xms:PwhBYUoAO07GHT6KZM_4amk3K0k2vsbU14YUUDy6h_PVfpXA0UhYGQ>
 <xme:PwhBYaq3jwnwh-ojMQarFtTajnymN27UJgniICaW6H34B6CqhF5nESnA4wI-bqlnM
 KKUxuJ4KgFs75SYCPs>
X-ME-Received: <xmr:PwhBYZNHTOX0QeCARRCEfV3jv5Spe7f5aktnK5u9BT33g1t9BiPsjSql8FqeMET4ntZemRkgOVpCUppEfsT8NqvQo-iXO3MZlop9k2QFNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgudegjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:PwhBYb73L-SMH0LOzHjgrJlcnHdkKIEM0CYIYpFKI4GbKTes4VqjJg>
 <xmx:PwhBYT70bKS69uNHWGNG-0_fi4DjojuUwk8R0R7FnW2TZBceA-TKPQ>
 <xmx:PwhBYbhO4lOFzzF_B-Uw2VIMaSP4brYbhsvmd708bHDd-u0r4EFRiA>
 <xmx:PwhBYds6OJdgkfa1WCNNNFpInYi9x-wVGodieGhxDeEEDeqZMKiAUw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 16:38:21 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 13/13] hw/nvme: add attached-namespaces prop
Date: Tue, 14 Sep 2021 22:37:37 +0200
Message-Id: <20210914203737.182571-14-its@irrelevant.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914203737.182571-1-its@irrelevant.dk>
References: <20210914203737.182571-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Markus Armbruster <armbru@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add a runtime property to get a list of attached namespaces per
controller.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 04e564ad6be6..ed867384e40a 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6746,6 +6746,27 @@ static void nvme_set_smart_warning(Object *obj, Visitor *v, const char *name,
     }
 }
 
+static void get_attached_namespaces(Object *obj, Visitor *v, const char *name,
+                                    void *opaque, Error **errp)
+{
+    NvmeState *n = NVME_STATE(obj);
+    strList *paths = NULL;
+    strList **tail = &paths;
+    int nsid;
+
+    for (nsid = 1; nsid <= NVME_MAX_NAMESPACES; nsid++) {
+        NvmeNamespace *ns = nvme_ns(n, nsid);
+        if (!ns) {
+            continue;
+        }
+
+        QAPI_LIST_APPEND(tail, object_get_canonical_path(OBJECT(ns)));
+    }
+
+    visit_type_strList(v, name, &paths, errp);
+    qapi_free_strList(paths);
+}
+
 static const VMStateDescription nvme_vmstate = {
     .name = "nvme",
     .unmigratable = 1,
@@ -6771,6 +6792,9 @@ static void nvme_state_instance_init(Object *obj)
     object_property_add(obj, "smart_critical_warning", "uint8",
                         nvme_get_smart_warning,
                         nvme_set_smart_warning, NULL, NULL);
+
+    object_property_add(obj, "attached-namespaces", "str",
+                        get_attached_namespaces, NULL, NULL, NULL);
 }
 
 static const TypeInfo nvme_state_info = {
-- 
2.33.0


