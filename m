Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5D3628E51
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:28:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouiir-0002QT-I5; Mon, 14 Nov 2022 18:18:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1ouieS-0003Lu-R2; Mon, 14 Nov 2022 18:14:05 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oueop-0006UR-Rk; Mon, 14 Nov 2022 14:08:34 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 276605C00EF;
 Mon, 14 Nov 2022 14:08:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 14 Nov 2022 14:08:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1668452908; x=1668539308; bh=ZA
 F+khdGUFgCgGLigAQnJdrE+XOPl7sLY2zdFW2mxWU=; b=XdquSOyPvPfhuuF0Re
 2JHneb5Q4Dk8JMpbldpm7ViGhMDFSg5UbgEZpQi90abd0ZET4UEVrIn7fOGvaZJm
 4MvBywmd5yno0EI0XOSF+egI9SNBMeMryYLQLnMUSabr+CzowANQrFocSWShKp7M
 1+eCHM4yVPfkkDmUUl3OQkl3229y6sbZVk5shAw/Y8bjPpRlgXH1bu5m2Qkqnd4j
 jslDryYEsCqUBPnUcrX/dIVXjYj723zJzFsVP7Uip1i3Gsa2fEvE0axYUkHu4FUV
 l1OoW/fZIQRRJ6OyfgRkwKdJWLI5XTg9462C+VWP4iKWwpLuBeMDyUym1gKfTAvA
 Zk0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1668452908; x=1668539308; bh=ZAF+khdGUFgCg
 GLigAQnJdrE+XOPl7sLY2zdFW2mxWU=; b=RNWBGeTB6r/im/cOJE5h90K98vand
 ajuLHDMwFxkxT8KpT7DZTIIct6N9GdHTh2ZQ2dMXkKwSnsPB6gqfZd7FUiegb0xO
 xY7vjVFz5JOnBYPDVpVf3gRg63YshAwjriFeqc5qzqKiS7Le/6ONonTMD4boYpEd
 ektwCcLO2n77w1kPsPR0kFIbGNx5VpC/qCYozPlLM4bq/9M7Z1DNt53B5KyIzZFB
 0sDM/rzGB9OUdir9PO8z9VjZ2d6mQdisJf0S43TnNghTFzkb1Og60HiMMhSJTAqv
 gsFiYihyNEketXb8/Qo3Vv6pTpReHqW0MICcrJg5t/z3Mgtda+HxJUPrQ==
X-ME-Sender: <xms:K5JyY514kXAOudwBGFCu2uWUp8ay_I9CTT389PX7L40SW1veWrS9bg>
 <xme:K5JyYwGF_z7TUtvY8JQNqsStDWiA56ciKvEHJMcwD-7kQcgw0ND4rNyarGTmKuxF_
 8gTK4vu4oBSrcUS6eY>
X-ME-Received: <xmr:K5JyY57fltZ_8zUv6B2hMRM81SgsEl9x1hQGUuEiyHDKg6U2GJQUEl9-ud9f2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecumhhishhsihhnghcuvffquchfihgvlhguucdlfedtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpeetlefgueelfeffffefkeeigffhjeeugfdtgfetieegkedvfeffveeikedv
 leetveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:LJJyY22WsFmDks6p9K7UU7naGFR04fOX8liN-ZU0XgU_r5hr7Z2TUA>
 <xmx:LJJyY8G-FUZIjJqrj66NFnx6PIl7zkSSw3jpWrPCtXH5PB9-uEH3GA>
 <xmx:LJJyY386dhlPLyNkszPMO7z1t0Vxn-fFeux4RE6Tq-azCYV-CRT4TQ>
 <xmx:LJJyYx4_cuqkQCgkZlSrlA3-u1PANPTFO4VSOnJ157vo0sQyk4XdSQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 14:08:27 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter@pjd.dev,
 patrick@stwcx.xyz
Subject: [PATCH 1/1] hw/arm/aspeed: Automatically zero-extend flash images
Date: Mon, 14 Nov 2022 11:08:23 -0800
Message-Id: <20221114190823.1888691-2-peter@pjd.dev>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221114190823.1888691-1-peter@pjd.dev>
References: <20221114190823.1888691-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=peter@pjd.dev;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

One thing that's really annoying about the Aspeed machines is that you
have to provide a flash image that is the same size as the SPI-NOR flash
device the board uses, or something larger. If you don't, you'll get
this obscure error message:

    qemu-system-aarch64: failed to read the initial flash content

Which is just because the file isn't the right size. Zero-extending the
file to 128MB (the largest SPI-NOR flash size) fixes this.

This commit just performs the zero-extend automatically, so people don't
have to maintain bash scripts for it. And if your bash script does this
already, it will be a no-op. And, if your firmware image is larger than
the SPI-NOR device, then it will not truncate it.

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/aspeed.c | 40 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 55f114ef72..26450d90db 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -260,6 +260,30 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
     rom_add_blob_fixed("aspeed.boot_rom", storage, rom_size, addr);
 }
 
+static int zero_extend_block_device(BlockBackend *blk, uint64_t size,
+                                    Error **errp)
+{
+    uint64_t perm, shared_perm;
+
+    blk_get_perm(blk, &perm, &shared_perm);
+
+    if (blk_set_perm(blk, BLK_PERM_ALL, BLK_PERM_ALL, errp)) {
+        error_append_hint(errp, "Unable to change permissions on block device");
+        return -1;
+    }
+    if (blk_truncate(blk, size, true, PREALLOC_MODE_OFF, BDRV_REQ_ZERO_WRITE,
+                     errp)) {
+        error_append_hint(errp, "Unable to zero-extend block device");
+        return -1;
+    }
+    if (blk_set_perm(blk, perm, shared_perm, errp)) {
+        error_append_hint(errp,
+                          "Unable to restore permissions on block device");
+        /* Ignore error since we successfully extended the device already */
+    }
+    return 0;
+}
+
 void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
                                       unsigned int count, int unit0)
 {
@@ -273,10 +297,24 @@ void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
         DriveInfo *dinfo = drive_get(IF_MTD, 0, unit0 + i);
         qemu_irq cs_line;
         DeviceState *dev;
+        AspeedSMCFlash *flash = &s->flashes[i];
+        uint64_t flash_size = memory_region_size(&flash->mmio);
 
         dev = qdev_new(flashtype);
         if (dinfo) {
-            qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
+            BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
+            int64_t blk_size = blk_getlength(blk);
+
+            if (blk_size > 0 && blk_size < (int64_t)flash_size) {
+                Error *err = NULL;
+
+                zero_extend_block_device(blk, flash_size, &err);
+                if (err) {
+                    warn_reportf_err(err, "Error zero-extending MTD drive[%d] "
+                                     "to flash size", i);
+                }
+            }
+            qdev_prop_set_drive(dev, "drive", blk);
         }
         qdev_realize_and_unref(dev, BUS(s->spi), &error_fatal);
 
-- 
2.38.1


