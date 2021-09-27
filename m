Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8454418EAF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 07:33:31 +0200 (CEST)
Received: from localhost ([::1]:53274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUjGc-0006JP-GH
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 01:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mUj1y-0002f6-6I; Mon, 27 Sep 2021 01:18:22 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:50049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mUj1w-0008PF-3q; Mon, 27 Sep 2021 01:18:21 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 12FB52B011FF;
 Mon, 27 Sep 2021 01:18:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 27 Sep 2021 01:18:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=OFPUwsR06zKzt
 OhTZ9TubnAicq1s3vhgXzfQw83jQi4=; b=HLgmrO/NFRgVU501ILMlBxMGtIutj
 8urWCjDcoPI6OhaEEqqYbIHabimXO4uVtuA9AwvOoCjDj5jd7e3S3B2Vysc0IPBN
 6KknQU52Wi/LQ0yOlwR9UMK1ap9JMN1tiYXUr5ieEt495GFBIWcTGSjY/M3cwQM5
 h0TvV+PULBgHuO18jMs3qpF0S0hjpjRZWKBYbw/YA8al7up3K7IfwGkaHmKKUaQm
 usjPSN97yNnEIV3Kne6xYWYwupHgFGqH42pzzpWh+AMNHc5XLE9QPr/jM6I55WTe
 4d44T/PQYG4S+cy/feQCsh4N1SoKdqqMJUB2xQU2+cl8itkTA2cKgCpxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=OFPUwsR06zKztOhTZ9TubnAicq1s3vhgXzfQw83jQi4=; b=CFReqVl0
 UtFgi9RuWyDpe3HVRjjGXiMNy75O7/2+uVMkzgIVWv4jsinK2/S6R8Vm1xItQe43
 i/ZfCNAJ/sEEq/G1FX7sjxPlDyd7G3YiKZcArtpD+olUYvhaN6XeN9dRkcMz02F9
 mdGEM0iz067KPvGhkF3d0QcW6JKaXgBsGR+uE/Vp4UFUj2E86OXj+0lLiuYmJn6u
 8zq1LM0dsDIvvPrrdT2kX8f4xVW/BcHgSEfpp4bwB+8jO4dSBdDpF2NmafSFABbx
 cECMmsvj7XkcsfypEAraXrujRG3WiW3IR+KAnyeG+SUJyH/sOws/cnMVOONBVaN/
 K/MJVjDIQ3DRxg==
X-ME-Sender: <xms:GFRRYdoUUGrw6t8zcO1bc0-e5x-caZqIH0EMgYMqPHdlMpdDKqrSig>
 <xme:GFRRYfrYwsOE2j9P3d_g6wLPSflZ4PNbA0fCY5B8zGs4ObYH7mEcDBXJcU8qvoYbi
 tRSlxTk5FJKyr8Cru4>
X-ME-Received: <xmr:GFRRYaNWvzK-Y2P0vwLTL6og6E5BceVptiitOWubJx2_427XVqYyTdifNz98-hvmuI4fan5ZMuV8PHDwlpBq6txK-rmXvqcD67OwoK-3MQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejjedgledvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:GFRRYY7BdQCNDM88dbUqheuNlcmJzXgZhUDhQNcs72oEQiL_Q9TD6g>
 <xmx:GFRRYc7BNM0AtDBMnNVHlfMEpK1jPL1WVZ3gRcaCAcoONqWs4h6-Qg>
 <xmx:GFRRYQg1ZJRC6lUHAbjITPNnWyBL0FIjbIswUbyCFUQXlwEtxUJlFw>
 <xmx:GFRRYXpil69mk6FGw-dBorOaRZaYg2nXltV5HgvwkNrqMAHyMLZ7nQ-Ok5k>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Sep 2021 01:18:14 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 03/16] hw/nvme: move dif/pi prototypes into dif.h
Date: Mon, 27 Sep 2021 07:17:46 +0200
Message-Id: <20210927051759.447305-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210927051759.447305-1-its@irrelevant.dk>
References: <20210927051759.447305-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.17; envelope-from=its@irrelevant.dk;
 helo=wnew3-smtp.messagingengine.com
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Hanna Reitz <hreitz@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c |  1 +
 hw/nvme/dif.c  |  1 +
 hw/nvme/dif.h  | 53 ++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/nvme/nvme.h | 50 -----------------------------------------------
 4 files changed, 55 insertions(+), 50 deletions(-)
 create mode 100644 hw/nvme/dif.h

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 2f247a9275ca..b148e1dbb148 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -163,6 +163,7 @@
 #include "migration/vmstate.h"
 
 #include "nvme.h"
+#include "dif.h"
 #include "trace.h"
 
 #define NVME_MAX_IOQPAIRS 0xffff
diff --git a/hw/nvme/dif.c b/hw/nvme/dif.c
index 5dbd18b2a4a5..cd0cea2b5ebd 100644
--- a/hw/nvme/dif.c
+++ b/hw/nvme/dif.c
@@ -13,6 +13,7 @@
 #include "sysemu/block-backend.h"
 
 #include "nvme.h"
+#include "dif.h"
 #include "trace.h"
 
 uint16_t nvme_check_prinfo(NvmeNamespace *ns, uint8_t prinfo, uint64_t slba,
diff --git a/hw/nvme/dif.h b/hw/nvme/dif.h
new file mode 100644
index 000000000000..e36fea30e71e
--- /dev/null
+++ b/hw/nvme/dif.h
@@ -0,0 +1,53 @@
+#ifndef HW_NVME_DIF_H
+#define HW_NVME_DIF_H
+
+/* from Linux kernel (crypto/crct10dif_common.c) */
+static const uint16_t t10_dif_crc_table[256] = {
+    0x0000, 0x8BB7, 0x9CD9, 0x176E, 0xB205, 0x39B2, 0x2EDC, 0xA56B,
+    0xEFBD, 0x640A, 0x7364, 0xF8D3, 0x5DB8, 0xD60F, 0xC161, 0x4AD6,
+    0x54CD, 0xDF7A, 0xC814, 0x43A3, 0xE6C8, 0x6D7F, 0x7A11, 0xF1A6,
+    0xBB70, 0x30C7, 0x27A9, 0xAC1E, 0x0975, 0x82C2, 0x95AC, 0x1E1B,
+    0xA99A, 0x222D, 0x3543, 0xBEF4, 0x1B9F, 0x9028, 0x8746, 0x0CF1,
+    0x4627, 0xCD90, 0xDAFE, 0x5149, 0xF422, 0x7F95, 0x68FB, 0xE34C,
+    0xFD57, 0x76E0, 0x618E, 0xEA39, 0x4F52, 0xC4E5, 0xD38B, 0x583C,
+    0x12EA, 0x995D, 0x8E33, 0x0584, 0xA0EF, 0x2B58, 0x3C36, 0xB781,
+    0xD883, 0x5334, 0x445A, 0xCFED, 0x6A86, 0xE131, 0xF65F, 0x7DE8,
+    0x373E, 0xBC89, 0xABE7, 0x2050, 0x853B, 0x0E8C, 0x19E2, 0x9255,
+    0x8C4E, 0x07F9, 0x1097, 0x9B20, 0x3E4B, 0xB5FC, 0xA292, 0x2925,
+    0x63F3, 0xE844, 0xFF2A, 0x749D, 0xD1F6, 0x5A41, 0x4D2F, 0xC698,
+    0x7119, 0xFAAE, 0xEDC0, 0x6677, 0xC31C, 0x48AB, 0x5FC5, 0xD472,
+    0x9EA4, 0x1513, 0x027D, 0x89CA, 0x2CA1, 0xA716, 0xB078, 0x3BCF,
+    0x25D4, 0xAE63, 0xB90D, 0x32BA, 0x97D1, 0x1C66, 0x0B08, 0x80BF,
+    0xCA69, 0x41DE, 0x56B0, 0xDD07, 0x786C, 0xF3DB, 0xE4B5, 0x6F02,
+    0x3AB1, 0xB106, 0xA668, 0x2DDF, 0x88B4, 0x0303, 0x146D, 0x9FDA,
+    0xD50C, 0x5EBB, 0x49D5, 0xC262, 0x6709, 0xECBE, 0xFBD0, 0x7067,
+    0x6E7C, 0xE5CB, 0xF2A5, 0x7912, 0xDC79, 0x57CE, 0x40A0, 0xCB17,
+    0x81C1, 0x0A76, 0x1D18, 0x96AF, 0x33C4, 0xB873, 0xAF1D, 0x24AA,
+    0x932B, 0x189C, 0x0FF2, 0x8445, 0x212E, 0xAA99, 0xBDF7, 0x3640,
+    0x7C96, 0xF721, 0xE04F, 0x6BF8, 0xCE93, 0x4524, 0x524A, 0xD9FD,
+    0xC7E6, 0x4C51, 0x5B3F, 0xD088, 0x75E3, 0xFE54, 0xE93A, 0x628D,
+    0x285B, 0xA3EC, 0xB482, 0x3F35, 0x9A5E, 0x11E9, 0x0687, 0x8D30,
+    0xE232, 0x6985, 0x7EEB, 0xF55C, 0x5037, 0xDB80, 0xCCEE, 0x4759,
+    0x0D8F, 0x8638, 0x9156, 0x1AE1, 0xBF8A, 0x343D, 0x2353, 0xA8E4,
+    0xB6FF, 0x3D48, 0x2A26, 0xA191, 0x04FA, 0x8F4D, 0x9823, 0x1394,
+    0x5942, 0xD2F5, 0xC59B, 0x4E2C, 0xEB47, 0x60F0, 0x779E, 0xFC29,
+    0x4BA8, 0xC01F, 0xD771, 0x5CC6, 0xF9AD, 0x721A, 0x6574, 0xEEC3,
+    0xA415, 0x2FA2, 0x38CC, 0xB37B, 0x1610, 0x9DA7, 0x8AC9, 0x017E,
+    0x1F65, 0x94D2, 0x83BC, 0x080B, 0xAD60, 0x26D7, 0x31B9, 0xBA0E,
+    0xF0D8, 0x7B6F, 0x6C01, 0xE7B6, 0x42DD, 0xC96A, 0xDE04, 0x55B3
+};
+
+uint16_t nvme_check_prinfo(NvmeNamespace *ns, uint8_t prinfo, uint64_t slba,
+                           uint32_t reftag);
+uint16_t nvme_dif_mangle_mdata(NvmeNamespace *ns, uint8_t *mbuf, size_t mlen,
+                               uint64_t slba);
+void nvme_dif_pract_generate_dif(NvmeNamespace *ns, uint8_t *buf, size_t len,
+                                 uint8_t *mbuf, size_t mlen, uint16_t apptag,
+                                 uint32_t *reftag);
+uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
+                        uint8_t *mbuf, size_t mlen, uint8_t prinfo,
+                        uint64_t slba, uint16_t apptag,
+                        uint16_t appmask, uint32_t *reftag);
+uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req);
+
+#endif /* HW_NVME_DIF_H */
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 83ffabade4cf..45bf96d65321 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -503,54 +503,4 @@ void nvme_rw_complete_cb(void *opaque, int ret);
 uint16_t nvme_map_dptr(NvmeCtrl *n, NvmeSg *sg, size_t len,
                        NvmeCmd *cmd);
 
-/* from Linux kernel (crypto/crct10dif_common.c) */
-static const uint16_t t10_dif_crc_table[256] = {
-    0x0000, 0x8BB7, 0x9CD9, 0x176E, 0xB205, 0x39B2, 0x2EDC, 0xA56B,
-    0xEFBD, 0x640A, 0x7364, 0xF8D3, 0x5DB8, 0xD60F, 0xC161, 0x4AD6,
-    0x54CD, 0xDF7A, 0xC814, 0x43A3, 0xE6C8, 0x6D7F, 0x7A11, 0xF1A6,
-    0xBB70, 0x30C7, 0x27A9, 0xAC1E, 0x0975, 0x82C2, 0x95AC, 0x1E1B,
-    0xA99A, 0x222D, 0x3543, 0xBEF4, 0x1B9F, 0x9028, 0x8746, 0x0CF1,
-    0x4627, 0xCD90, 0xDAFE, 0x5149, 0xF422, 0x7F95, 0x68FB, 0xE34C,
-    0xFD57, 0x76E0, 0x618E, 0xEA39, 0x4F52, 0xC4E5, 0xD38B, 0x583C,
-    0x12EA, 0x995D, 0x8E33, 0x0584, 0xA0EF, 0x2B58, 0x3C36, 0xB781,
-    0xD883, 0x5334, 0x445A, 0xCFED, 0x6A86, 0xE131, 0xF65F, 0x7DE8,
-    0x373E, 0xBC89, 0xABE7, 0x2050, 0x853B, 0x0E8C, 0x19E2, 0x9255,
-    0x8C4E, 0x07F9, 0x1097, 0x9B20, 0x3E4B, 0xB5FC, 0xA292, 0x2925,
-    0x63F3, 0xE844, 0xFF2A, 0x749D, 0xD1F6, 0x5A41, 0x4D2F, 0xC698,
-    0x7119, 0xFAAE, 0xEDC0, 0x6677, 0xC31C, 0x48AB, 0x5FC5, 0xD472,
-    0x9EA4, 0x1513, 0x027D, 0x89CA, 0x2CA1, 0xA716, 0xB078, 0x3BCF,
-    0x25D4, 0xAE63, 0xB90D, 0x32BA, 0x97D1, 0x1C66, 0x0B08, 0x80BF,
-    0xCA69, 0x41DE, 0x56B0, 0xDD07, 0x786C, 0xF3DB, 0xE4B5, 0x6F02,
-    0x3AB1, 0xB106, 0xA668, 0x2DDF, 0x88B4, 0x0303, 0x146D, 0x9FDA,
-    0xD50C, 0x5EBB, 0x49D5, 0xC262, 0x6709, 0xECBE, 0xFBD0, 0x7067,
-    0x6E7C, 0xE5CB, 0xF2A5, 0x7912, 0xDC79, 0x57CE, 0x40A0, 0xCB17,
-    0x81C1, 0x0A76, 0x1D18, 0x96AF, 0x33C4, 0xB873, 0xAF1D, 0x24AA,
-    0x932B, 0x189C, 0x0FF2, 0x8445, 0x212E, 0xAA99, 0xBDF7, 0x3640,
-    0x7C96, 0xF721, 0xE04F, 0x6BF8, 0xCE93, 0x4524, 0x524A, 0xD9FD,
-    0xC7E6, 0x4C51, 0x5B3F, 0xD088, 0x75E3, 0xFE54, 0xE93A, 0x628D,
-    0x285B, 0xA3EC, 0xB482, 0x3F35, 0x9A5E, 0x11E9, 0x0687, 0x8D30,
-    0xE232, 0x6985, 0x7EEB, 0xF55C, 0x5037, 0xDB80, 0xCCEE, 0x4759,
-    0x0D8F, 0x8638, 0x9156, 0x1AE1, 0xBF8A, 0x343D, 0x2353, 0xA8E4,
-    0xB6FF, 0x3D48, 0x2A26, 0xA191, 0x04FA, 0x8F4D, 0x9823, 0x1394,
-    0x5942, 0xD2F5, 0xC59B, 0x4E2C, 0xEB47, 0x60F0, 0x779E, 0xFC29,
-    0x4BA8, 0xC01F, 0xD771, 0x5CC6, 0xF9AD, 0x721A, 0x6574, 0xEEC3,
-    0xA415, 0x2FA2, 0x38CC, 0xB37B, 0x1610, 0x9DA7, 0x8AC9, 0x017E,
-    0x1F65, 0x94D2, 0x83BC, 0x080B, 0xAD60, 0x26D7, 0x31B9, 0xBA0E,
-    0xF0D8, 0x7B6F, 0x6C01, 0xE7B6, 0x42DD, 0xC96A, 0xDE04, 0x55B3
-};
-
-uint16_t nvme_check_prinfo(NvmeNamespace *ns, uint8_t prinfo, uint64_t slba,
-                           uint32_t reftag);
-uint16_t nvme_dif_mangle_mdata(NvmeNamespace *ns, uint8_t *mbuf, size_t mlen,
-                               uint64_t slba);
-void nvme_dif_pract_generate_dif(NvmeNamespace *ns, uint8_t *buf, size_t len,
-                                 uint8_t *mbuf, size_t mlen, uint16_t apptag,
-                                 uint32_t *reftag);
-uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
-                        uint8_t *mbuf, size_t mlen, uint8_t prinfo,
-                        uint64_t slba, uint16_t apptag,
-                        uint16_t appmask, uint32_t *reftag);
-uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req);
-
-
 #endif /* HW_NVME_INTERNAL_H */
-- 
2.33.0


