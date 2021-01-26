Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49380303CC6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 13:19:48 +0100 (CET)
Received: from localhost ([::1]:50480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4NJy-0001wI-Uh
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 07:19:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l4NG2-00016t-8z; Tue, 26 Jan 2021 07:15:42 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:59243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l4NFx-00036z-9L; Tue, 26 Jan 2021 07:15:41 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 33571976;
 Tue, 26 Jan 2021 07:15:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 26 Jan 2021 07:15:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=55MLpOfBYieI0YzTc8Cm1m5fN9
 71YUxui3jeEK/nDQY=; b=boU6mWfgzkTIPhFgJ7lSh5fk20fZ9w0vUItYsVg8na
 9bxS0oQXIVoE4vd++5Mtfdew9CcGaiRf6QAJ650eXGjFxSt3k9mGWKHaZ8EIJ5AW
 hfJULVrqQf07jU9aDX1RbERTmPEMWn3++TNRj6fjwMvnO61aOE6uewZ6Ym8vgQbb
 sNZgzimmafXGiZjPTaIG7CKhitm3sTYEC/mHO8HPLbVuJLT0VidYS7BFt+8awn+m
 4FLqR/qNm3XVTw2/EGhlgIsQPqpgL1TQDgr4TFk7JhmgrpUYGMuznUDrtkx6uiF8
 E4cHIgwKnG491mDDBP9UdiqyytoLq+4yu18jiJJNvZBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=55MLpOfBYieI0YzTc
 8Cm1m5fN971YUxui3jeEK/nDQY=; b=JNuDruSOCVddE+4CVfRYVZ+9fgP3t+v9O
 cPHSpWM4hqXYJz/B85x2nMRpj2/tXben0ZfPH6RG48fcdhr5sCECkjESxWtktO0T
 /XIJ6XseslnHkPN9P0Dgs3j7mwPYwVj5JYJfEdrafls8IYMS75af/eQg2p9EZqJP
 6UFNSHTjDMZMMKA53JUw/Jo+2xD2e4ZnbZZZofmItG1hrIoQT9q8B5fNRhnxX3ql
 +LdG9KoG5eQHB9KQCIvXxfUEmQaaIuHfyMeDkqK3ahK0YjnD1NwkLBS1Uov5rXvR
 C38mj97wolzFdcfGmV5Tl+TSevKO4U+XeD9FVP3g49SPnhjTrzxjg==
X-ME-Sender: <xms:5AcQYLbJoSUzC4lnRMHIqESur0EUDuGI7FgKhJqzih5bpfBO_kgvnA>
 <xme:5AcQYKaC2nBec60IbtdHp0Zm8hrXDKH54WAYoLVimBNGTzbvczNZjKA5CJkpjk3cJ
 jV9s4HDjKWKR7A3CPs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehgdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepmfhlrghushculfgv
 nhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvghrnh
 epfeevledvieekudeuffetgeegfeehvdffffejueeuleduhedvgeejveejhfdtteehnecu
 kfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:5AcQYN8c07qi3RHgclpvVRmw3NvTN7Ez0P9rD_sNjfIQZA0BOOy8iw>
 <xmx:5AcQYBoRS3zby0SeZ8DwLph_JG0aHSzpsD6sPuw8M6vyWoE4HUOJXg>
 <xmx:5AcQYGpoj-nEB5G1Pm1vlF8QzNRlEQymEM29wZR-TbTuqb25Ikkzjg>
 <xmx:5QcQYHcIjSMhpU90ofLz4fk6D6ItpsVflDppjyOlA_7gorKWbO9kQA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id AA00324005A;
 Tue, 26 Jan 2021 07:15:31 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/block/nvme: add missing mor/mar constraint checks
Date: Tue, 26 Jan 2021 13:15:29 +0100
Message-Id: <20210126121529.317189-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Firstly, if zoned.max_active is non-zero, zoned.max_open must be less
than or equal to zoned.max_active.

Secondly, if only zones.max_active is set, we have to explicitly set
zones.max_open or we end up with an invalid MAR/MOR configuration. This
is an artifact of the parameters not being zeroes-based like in the
spec.

Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reported-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---

v2:

  * Jumped the gun on removing the check on zoned.max_open. It should
    still be done since the device might only have a constraint on open
    zones, not active.
  * Instead, added an explicit set of zoned.max_open if only
    zoned.max_active is specifed.

 hw/block/nvme-ns.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 62b25cf69bfa..df514287b58f 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -153,6 +153,18 @@ static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
+    if (ns->params.max_active_zones) {
+        if (ns->params.max_open_zones > ns->params.max_active_zones) {
+            error_setg(errp, "max_open_zones (%u) exceeds max_active_zones (%u)",
+                       ns->params.max_open_zones, ns->params.max_active_zones);
+            return -1;
+        }
+
+        if (!ns->params.max_open_zones) {
+            ns->params.max_open_zones = ns->params.max_active_zones;
+        }
+    }
+
     if (ns->params.zd_extension_size) {
         if (ns->params.zd_extension_size & 0x3f) {
             error_setg(errp,
-- 
2.30.0


