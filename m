Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C005B6AC362
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:35:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBvP-0006Sg-1K; Mon, 06 Mar 2023 09:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pZBvN-0006RR-8G; Mon, 06 Mar 2023 09:34:49 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pZBvL-0005VP-Db; Mon, 06 Mar 2023 09:34:48 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 8A9325C031C;
 Mon,  6 Mar 2023 09:34:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 06 Mar 2023 09:34:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1678113286; x=
 1678199686; bh=B+A03ZqNppaW1MuvSwh2CJX9zjSUwnQqIgGBhkqeZaI=; b=c
 52H4GXMKrfKRSUCNxE6YZbizoOPQWzF8O3CNyYa6CVY1nR1F6hW0/mGA/wtTxcgP
 5pJ7x3AzdGKiDAHPFuxG9jG5KNelcGvii+8UTwsYZ6ptEcPtNP/OHmTEvhEdQOlQ
 Abe/iY4naWTv2P9zijDZAHSixJLzFA8Hl62SHuPJ2xWkgJ2Ex2yHJbtiY5xS7HcS
 eXPDJDAlJ5A72X/61puUEKRLboGUeMLtJZNnZgbUuoTN9sJIPSW8gnWUDRnSPjo9
 0CpV+md3/Sn5sE+La8O9MOLa/8RUEvZ/MThF8lz7N791Iw5JFaSZaZZUNKxMrsMG
 ONNEXUqzBRHUG2QvGG6Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1678113286; x=
 1678199686; bh=B+A03ZqNppaW1MuvSwh2CJX9zjSUwnQqIgGBhkqeZaI=; b=G
 IX1zNKIrkuO0riPuzrYlR9FJsckAkBHUTCWyAv75HHV3fvz4CVCGcQnWp2DW930G
 E+LztsAMtxwzie5GNmYZsu/iMC04YaAo4h+5hYl3nVzum1CdF+VUGYlxpj15Tm71
 r5VVfYzWTJyN5cnY58ALFXGiFQ3gQMeYUsm0xySMvql2zZenM8WEH/MPZyWpj24r
 KSXEFMGx3h6K7a11d1Ah9gjwE2wWTWMfmXOToxBOrQOaekBfWh68VBaRg2cVa3jg
 aAmCci+ZHdoeJOks2eLTZnq7JEs+sSRXcBw2LOyWxPy7c8mnyKw1HcLwE4Aclxfd
 lw0Rwr4H/sxv/XVi6f5Bw==
X-ME-Sender: <xms:BfoFZCDMx6taKfmOKMVYgZV0HIADSkZkeQpsDMkEPCN63x1dvLqa_g>
 <xme:BfoFZMjF7NqfIXYWqJUos3U5OIQVgFLyEafRakbG7m4GJo2kLfrtGaWMzA1GaFTDl
 SX94wLHkkNIZzB9zfY>
X-ME-Received: <xmr:BfoFZFk-QqxviarLjqwJaGun52VdgvMwmm1V4MPHDKw-IGfxbu9wJALuyzoI9Oncd6EoqepOjpY3iXC1wGo5SLkoykmYrAFxPT6B3v8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtkedgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:BfoFZAzuJ8n5C_a3KE0fdXt9Sdsb38fTZtZDdxFkwc7-CTeUn2I6YA>
 <xmx:BfoFZHTnMp3zd1noB-Wv8GjYexTzHbQaTfR9xRRyFFqPQ0kC4Qm0rA>
 <xmx:BfoFZLZgdSJ8ZLekb60gpk3MXgmb_ne74pqH8skDvdGhXapY-KHQAg>
 <xmx:BvoFZM-phN2OWDqlubltWdYjdxzNW5PvYm0IGmBtm6izmJfNBPazeQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Mar 2023 09:34:43 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 3/5] hw/nvme: add basic endurance group support
Date: Mon,  6 Mar 2023 15:34:31 +0100
Message-Id: <20230306143433.10351-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306143433.10351-1-its@irrelevant.dk>
References: <20230306143433.10351-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7997; i=k.jensen@samsung.com;
 h=from:subject; bh=e5e+eaUXroM6ym0b4foXhE+veGr5aLaDtyUj1jkYuS8=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGQF+fmH/OPLdtbFh5C3hpktNveauqtoIr7bU
 RUyJ0VcbLkd2YkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJkBfn5AAoJEE3hrzFt
 Tw3pxXsH/0c+WZ6mVYdFq/WQNym/b03MzzSgg8GUuIBSucIh7/NwHjWpml1fRZSSbF/FSl9xFrI
 8Q+bBARho4moRILvxI7G+bRAZEU5DmTfrbyoq78Dx0zhyTvMDUyaIPaPhQIGWM4c1rYAqKsMLvB
 v6znbIa42HZH7+gBF+VQYIetwpDU7/BIfNH8JxYLIkYFWt98XpFhx0jITPgMD49rIaF5uZOw4BF
 p8wOZJBLez6XMyQVxKuzwwcZ1j2noyzuQRJDOLhVY3KnxxUX1YBo1t4GJ6QUTkvZnEcrtg+Fded
 rRaakW5VNgecQNOuA/XJbQ5TfnCUUrk33w/jipINLaCbdEhyS4MLD6MQ
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Klaus Jensen <k.jensen@samsung.com>

Add the mandatory Endurance Group identify data structures and log
pages.

For now, all namespaces in a subsystem belongs to a single Endurance
Group.

Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 52 +++++++++++++++++++++++++++++++++++++++++++-
 hw/nvme/ns.c         |  3 +++
 hw/nvme/nvme.h       |  4 ++++
 include/block/nvme.h | 42 +++++++++++++++++++++++++++++------
 4 files changed, 93 insertions(+), 8 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 99b92ff20b9a..4bfc7835b539 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4454,6 +4454,48 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     return nvme_c2h(n, (uint8_t *) &smart + off, trans_len, req);
 }
 
+static uint16_t nvme_endgrp_info(NvmeCtrl *n,  uint8_t rae, uint32_t buf_len,
+                                 uint64_t off, NvmeRequest *req)
+{
+    uint32_t dw11 = le32_to_cpu(req->cmd.cdw11);
+    uint16_t endgrpid = (dw11 >> 16) & 0xffff;
+    struct nvme_stats stats = {};
+    NvmeEndGrpLog info = {};
+    int i;
+
+    if (!n->subsys || endgrpid != 0x1) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    if (off >= sizeof(info)) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
+        NvmeNamespace *ns = nvme_subsys_ns(n->subsys, i);
+        if (!ns) {
+            continue;
+        }
+
+        nvme_set_blk_stats(ns, &stats);
+    }
+
+    info.data_units_read[0] =
+        cpu_to_le64(DIV_ROUND_UP(stats.units_read / 1000000000, 1000000000));
+    info.data_units_written[0] =
+        cpu_to_le64(DIV_ROUND_UP(stats.units_written / 1000000000, 1000000000));
+    info.media_units_written[0] =
+        cpu_to_le64(DIV_ROUND_UP(stats.units_written / 1000000000, 1000000000));
+
+    info.host_read_commands[0] = cpu_to_le64(stats.read_commands);
+    info.host_write_commands[0] = cpu_to_le64(stats.write_commands);
+
+    buf_len = MIN(sizeof(info) - off, buf_len);
+
+    return nvme_c2h(n, (uint8_t *)&info + off, buf_len, req);
+}
+
+
 static uint16_t nvme_fw_log_info(NvmeCtrl *n, uint32_t buf_len, uint64_t off,
                                  NvmeRequest *req)
 {
@@ -4626,6 +4668,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
         return nvme_changed_nslist(n, rae, len, off, req);
     case NVME_LOG_CMD_EFFECTS:
         return nvme_cmd_effects(n, csi, len, off, req);
+    case NVME_LOG_ENDGRP:
+        return nvme_endgrp_info(n, rae, len, off, req);
     default:
         trace_pci_nvme_err_invalid_log_page(nvme_cid(req), lid);
         return NVME_INVALID_FIELD | NVME_DNR;
@@ -7382,6 +7426,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     uint8_t *pci_conf = pci_dev->config;
     uint64_t cap = ldq_le_p(&n->bar.cap);
     NvmeSecCtrlEntry *sctrl = nvme_sctrl(n);
+    uint32_t ctratt;
 
     id->vid = cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
     id->ssvid = cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VENDOR_ID));
@@ -7392,7 +7437,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->cntlid = cpu_to_le16(n->cntlid);
 
     id->oaes = cpu_to_le32(NVME_OAES_NS_ATTR);
-    id->ctratt |= cpu_to_le32(NVME_CTRATT_ELBAS);
+    ctratt = NVME_CTRATT_ELBAS;
 
     id->rab = 6;
 
@@ -7459,8 +7504,13 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     if (n->subsys) {
         id->cmic |= NVME_CMIC_MULTI_CTRL;
+        ctratt |= NVME_CTRATT_ENDGRPS;
+
+        id->endgidmax = cpu_to_le16(0x1);
     }
 
+    id->ctratt = cpu_to_le32(ctratt);
+
     NVME_CAP_SET_MQES(cap, 0x7ff);
     NVME_CAP_SET_CQR(cap, 1);
     NVME_CAP_SET_TO(cap, 0xf);
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 8ebab4fbceaf..23872a174c9a 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -592,6 +592,8 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
     if (subsys) {
         subsys->namespaces[nsid] = ns;
 
+        ns->id_ns.endgid = cpu_to_le16(0x1);
+
         if (ns->params.detached) {
             return;
         }
@@ -607,6 +609,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
 
             return;
         }
+
     }
 
     nvme_attach_ns(n, ns);
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 5d221073ac68..a88e0dea5c83 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -45,6 +45,10 @@ typedef struct NvmeBus {
     OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
 #define SUBSYS_SLOT_RSVD (void *)0xFFFF
 
+typedef struct NvmeEnduranceGroup {
+    uint8_t event_conf;
+} NvmeEnduranceGroup;
+
 typedef struct NvmeSubsystem {
     DeviceState parent_obj;
     NvmeBus     bus;
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 8027b7126bda..4abc1bbfa5b6 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -58,6 +58,24 @@ enum NvmeBarRegs {
     NVME_REG_PMRMSCU = offsetof(NvmeBar, pmrmscu),
 };
 
+typedef struct QEMU_PACKED NvmeEndGrpLog {
+    uint8_t  critical_warning;
+    uint8_t  rsvd[2];
+    uint8_t  avail_spare;
+    uint8_t  avail_spare_thres;
+    uint8_t  percet_used;
+    uint8_t  rsvd1[26];
+    uint64_t end_estimate[2];
+    uint64_t data_units_read[2];
+    uint64_t data_units_written[2];
+    uint64_t media_units_written[2];
+    uint64_t host_read_commands[2];
+    uint64_t host_write_commands[2];
+    uint64_t media_integrity_errors[2];
+    uint64_t no_err_info_log_entries[2];
+    uint8_t rsvd2[352];
+} NvmeEndGrpLog;
+
 enum NvmeCapShift {
     CAP_MQES_SHIFT     = 0,
     CAP_CQR_SHIFT      = 16,
@@ -1005,11 +1023,12 @@ enum {
 };
 
 enum NvmeLogIdentifier {
-    NVME_LOG_ERROR_INFO     = 0x01,
-    NVME_LOG_SMART_INFO     = 0x02,
-    NVME_LOG_FW_SLOT_INFO   = 0x03,
-    NVME_LOG_CHANGED_NSLIST = 0x04,
-    NVME_LOG_CMD_EFFECTS    = 0x05,
+    NVME_LOG_ERROR_INFO                 = 0x01,
+    NVME_LOG_SMART_INFO                 = 0x02,
+    NVME_LOG_FW_SLOT_INFO               = 0x03,
+    NVME_LOG_CHANGED_NSLIST             = 0x04,
+    NVME_LOG_CMD_EFFECTS                = 0x05,
+    NVME_LOG_ENDGRP                     = 0x09,
 };
 
 typedef struct QEMU_PACKED NvmePSD {
@@ -1091,7 +1110,10 @@ typedef struct QEMU_PACKED NvmeIdCtrl {
     uint16_t    mntmt;
     uint16_t    mxtmt;
     uint32_t    sanicap;
-    uint8_t     rsvd332[180];
+    uint8_t     rsvd332[6];
+    uint16_t    nsetidmax;
+    uint16_t    endgidmax;
+    uint8_t     rsvd342[170];
     uint8_t     sqes;
     uint8_t     cqes;
     uint16_t    maxcmd;
@@ -1134,6 +1156,7 @@ enum NvmeIdCtrlOaes {
 };
 
 enum NvmeIdCtrlCtratt {
+    NVME_CTRATT_ENDGRPS = 1 <<  4,
     NVME_CTRATT_ELBAS   = 1 << 15,
 };
 
@@ -1227,6 +1250,7 @@ enum NvmeNsAttachmentOperation {
 #define NVME_AEC_SMART(aec)         (aec & 0xff)
 #define NVME_AEC_NS_ATTR(aec)       ((aec >> 8) & 0x1)
 #define NVME_AEC_FW_ACTIVATION(aec) ((aec >> 9) & 0x1)
+#define NVME_AEC_ENDGRP_NOTICE(aec) ((aec >> 14) & 0x1)
 
 #define NVME_ERR_REC_TLER(err_rec)  (err_rec & 0xffff)
 #define NVME_ERR_REC_DULBE(err_rec) (err_rec & 0x10000)
@@ -1338,7 +1362,10 @@ typedef struct QEMU_PACKED NvmeIdNs {
     uint16_t    mssrl;
     uint32_t    mcl;
     uint8_t     msrc;
-    uint8_t     rsvd81[23];
+    uint8_t     rsvd81[18];
+    uint8_t     nsattr;
+    uint16_t    nvmsetid;
+    uint16_t    endgid;
     uint8_t     nguid[16];
     uint64_t    eui64;
     NvmeLBAF    lbaf[NVME_MAX_NLBAF];
@@ -1655,5 +1682,6 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmePriCtrlCap) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeSecCtrlEntry) != 32);
     QEMU_BUILD_BUG_ON(sizeof(NvmeSecCtrlList) != 4096);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeEndGrpLog) != 512);
 }
 #endif
-- 
2.39.2


