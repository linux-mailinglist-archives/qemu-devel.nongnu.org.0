Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C669640B966
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 22:44:52 +0200 (CEST)
Received: from localhost ([::1]:59648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQFIR-0000zK-MN
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 16:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFBg-0005ap-Lq; Tue, 14 Sep 2021 16:37:52 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:54779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFBe-0004bj-4L; Tue, 14 Sep 2021 16:37:52 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 9788E3200A15;
 Tue, 14 Sep 2021 16:37:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 14 Sep 2021 16:37:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=jS0TztUqc8lxA
 UMNMR3ce9+w+AK5Si6XSJP5mgj6HXg=; b=AIa2/WGENm17d+p3mL2darB5IALGN
 KnbI1GAtP1LAoKxQCY6jF43hNtkAJXXoryLAhD9a8HxLmR2x+8XCDackfLS7DNmz
 T76jAMGG1xCYB3IQyuKtk9SCIyXAu+FLfBSJ+yiQ/LqLlDtz+uuLlTJ3w1UnZ9+2
 +xmOjL5rQDyXHZpKiwt41SUGY84mmByw0Vq0rWyKyDYh+3k2wV1whNUKm2iGqV+R
 Ujpcxhp4t7Eekt6uDh4KGOfSPVuhBlFMfHawprBX2gRn/qOriVpx2H/j5vJenGfe
 6C2FuZzCOwqWfrvmVv3LvJPp7hMajO5/d1fePuZPs2H2oL+AJz5bv7hLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=jS0TztUqc8lxAUMNMR3ce9+w+AK5Si6XSJP5mgj6HXg=; b=EsPLpzxH
 kFLDyNE/BVdnmF8Nn2Oy+4J3AfIrmuJbhBTakmMNH+kF7gG7WQXf8ljDkkHDmi1A
 UO96z890v5ZxmfqLQQMbZqQrTkBuBuu7QpeLK94i11b2WwG1W7l8V8eymxQj6PnB
 8cNuLZcDrvnSnxE6bO/lIxb6hqaiMDv/CtbKEZiRo1e+8/j3ToncZ1w1lc3e4+oS
 EnesQ56cJshI6JpdtYOMKDEtXOAdPn8plfWivqKGXUzsF1i4tT7fQfoJx4IG74Bw
 nrEazn6TPLZL6qoi3rhPrdo+3sMl62gbGbIC/49w9a28WxayxVVI8IOB9COQEIy/
 oJgmpb7BD/S02Q==
X-ME-Sender: <xms:GQhBYT-0Nq_Jt9tu44P6S7NtbpIvDWaZOcATE8ocZNpU3gR9WTpJMw>
 <xme:GQhBYft0RdS2mLl8DtDu1CoCAVMg3110aHmLVgkhpbehicND_k4ZIiz__NsBuLZ_g
 E3U-jD2RSemjxUsiLk>
X-ME-Received: <xmr:GQhBYRCpcEFz6gz2gztL3CVHehatmXy81TAUyi6qrlD_evfFmUvVa26a6SyZbo6F2XUKIYFGdWXNXlnTAgxHgLIdAGNkRz_NBbaTwGHFig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgudegkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:GQhBYffHfxRww3lTW6M-BVVF-QifIjdCb1-MsuvPO00LgD-nZgz1PA>
 <xmx:GQhBYYPSB06ubTEbxzxsehF8D6DOJb3aAMdu1t2bY3y1dCnhWLaR0A>
 <xmx:GQhBYRnwIGxOkdzSyqEhTiJzeBTylhBa5FnKfEv4-yGpI2UTwWGDmA>
 <xmx:GghBYZj121Gv8UApW6Gm1Jb851I45fJsvZTgb3sj6BYzuYJbXZ65Zg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 16:37:44 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 01/13] hw/nvme: move dif/pi prototypes into dif.h
Date: Tue, 14 Sep 2021 22:37:25 +0200
Message-Id: <20210914203737.182571-2-its@irrelevant.dk>
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

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c |  1 +
 hw/nvme/dif.c  |  1 +
 hw/nvme/dif.h  | 53 ++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/nvme/nvme.h | 50 -----------------------------------------------
 4 files changed, 55 insertions(+), 50 deletions(-)
 create mode 100644 hw/nvme/dif.h

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index dc0e7b00308e..65970b81d5fb 100644
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


