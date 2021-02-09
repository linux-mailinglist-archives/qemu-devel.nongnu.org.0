Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5383149C4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 08:54:18 +0100 (CET)
Received: from localhost ([::1]:48628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Nqj-00082j-Gp
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 02:54:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVN-0005EU-6j; Tue, 09 Feb 2021 02:32:14 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:41281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVH-0005dF-2W; Tue, 09 Feb 2021 02:32:12 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 054D55DB;
 Tue,  9 Feb 2021 02:31:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:31:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=7DnPEJtL6OUj7
 Xbyh6CCJ8zEZrQL5G8NarlrVR0lSE4=; b=VakYpwEyV+PNUiAgQJ+lWRIEj/xIk
 mnuZsBH8D2MAyn21NHEipBWU/W48fqaXOp14UAFNI29GR60EXNKSs1qKSHw6aqTw
 KJxYvvxUW/nuzLs4c4O2ZwMqpOS/tXGT7P25xi6PWmkb7235T6EtRmW6h6hNSx+h
 MWGCFmM4WE07Ztp/s9vUb6Mi7v402HTiw5TIx8ejdWODZX8q3Ygi86yKimY69dVD
 0/rkaeQ4ayjtPZPJ+oCpTk2Lc1yjaOIVIhP5e9viKwpYXOsP+6Kjzr1jAl2zA5WW
 p4gTt0xg++KLK44kYdnDgxOLjXa4enyRlexbWYbN/NnPooRvbmY8OusbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=7DnPEJtL6OUj7Xbyh6CCJ8zEZrQL5G8NarlrVR0lSE4=; b=O16elvN1
 ImUsVKULJ612y0rRR8PgWq1GUwxdzI12fS558c6bCNclXLhwikRZ9S6qa1dklmfA
 g+HRBEVuWPnLDWaO8KFzh0DL/S053cD9wkYejhXuDjBe7490kZUthKSekdrYAnj6
 xxk8KZsGhkCrCFjD1CN2uv1XwWo4JQwKMX8i8MC/eHkdJq/J+mqb5wDtVkfLx2nm
 ygJXDDGqW3PGGlScfPLNbkmmTIuEb8DyMYH6hrkCcqSRv82qZAFEfap/l8l8z75H
 VLXdNNYcTUJ+IIVOHLThzhFFnSw7c3ULwIVZ7elzWuoaBKPIHUSBaFgm+NFmRt1A
 yT+VPUIxJx56JQ==
X-ME-Sender: <xms:YDoiYDucE-sstosXM9F_SUyVPYe3TtyK2HanKHqeFQ7z983ptlwNzA>
 <xme:YDoiYEejEC57-0BYIn4xXrjyO-eSz-uKJppsOBpdGHy9rUbHnWOALk4LaUi7mqixu
 HwGDZaqdO2fPRGRBu4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeduud
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:YDoiYGynm55aD52k-qm91SJCXIkP5khU-bvrbXJ7S6hkfV7mT6z2fg>
 <xmx:YDoiYCO9JKWWfoMnCmQXvhgzTIX18-8j5OAnbbG0vNEkO9Cl0rc2-A>
 <xmx:YDoiYD--GUVKFBFWQn4zQlcTwDRqUmmF08g3otJejKKu8GycyHr_8Q>
 <xmx:YDoiYPRCcxGZ0HakmY7wEtnDxt8yWQ6z4A44P_2XwN56y7QrKKdBsaRdFWs>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 29F55108005B;
 Tue,  9 Feb 2021 02:31:43 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 15/56] nvme: Make ZNS-related definitions
Date: Tue,  9 Feb 2021 08:30:20 +0100
Message-Id: <20210209073101.548811-16-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
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
 qemu-block@nongnu.org, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dmitry Fomichev <dmitry.fomichev@wdc.com>

Define values and structures that are needed to support Zoned
Namespace Command Set (NVMe TP 4053).

Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 114 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 113 insertions(+), 1 deletion(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index adb5806365a3..9494246f1f59 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -489,6 +489,9 @@ enum NvmeIoCommands {
     NVME_CMD_COMPARE            = 0x05,
     NVME_CMD_WRITE_ZEROES       = 0x08,
     NVME_CMD_DSM                = 0x09,
+    NVME_CMD_ZONE_MGMT_SEND     = 0x79,
+    NVME_CMD_ZONE_MGMT_RECV     = 0x7a,
+    NVME_CMD_ZONE_APPEND        = 0x7d,
 };
 
 typedef struct QEMU_PACKED NvmeDeleteQ {
@@ -654,9 +657,13 @@ typedef struct QEMU_PACKED NvmeAerResult {
     uint8_t resv;
 } NvmeAerResult;
 
+typedef struct QEMU_PACKED NvmeZonedResult {
+    uint64_t slba;
+} NvmeZonedResult;
+
 typedef struct QEMU_PACKED NvmeCqe {
     uint32_t    result;
-    uint32_t    rsvd;
+    uint32_t    dw1;
     uint16_t    sq_head;
     uint16_t    sq_id;
     uint16_t    cid;
@@ -685,6 +692,7 @@ enum NvmeStatusCodes {
     NVME_INVALID_USE_OF_CMB     = 0x0012,
     NVME_INVALID_PRP_OFFSET     = 0x0013,
     NVME_CMD_SET_CMB_REJECTED   = 0x002b,
+    NVME_INVALID_CMD_SET        = 0x002c,
     NVME_LBA_RANGE              = 0x0080,
     NVME_CAP_EXCEEDED           = 0x0081,
     NVME_NS_NOT_READY           = 0x0082,
@@ -709,6 +717,14 @@ enum NvmeStatusCodes {
     NVME_CONFLICTING_ATTRS      = 0x0180,
     NVME_INVALID_PROT_INFO      = 0x0181,
     NVME_WRITE_TO_RO            = 0x0182,
+    NVME_ZONE_BOUNDARY_ERROR    = 0x01b8,
+    NVME_ZONE_FULL              = 0x01b9,
+    NVME_ZONE_READ_ONLY         = 0x01ba,
+    NVME_ZONE_OFFLINE           = 0x01bb,
+    NVME_ZONE_INVALID_WRITE     = 0x01bc,
+    NVME_ZONE_TOO_MANY_ACTIVE   = 0x01bd,
+    NVME_ZONE_TOO_MANY_OPEN     = 0x01be,
+    NVME_ZONE_INVAL_TRANSITION  = 0x01bf,
     NVME_WRITE_FAULT            = 0x0280,
     NVME_UNRECOVERED_READ       = 0x0281,
     NVME_E2E_GUARD_ERROR        = 0x0282,
@@ -894,6 +910,11 @@ typedef struct QEMU_PACKED NvmeIdCtrl {
     uint8_t     vs[1024];
 } NvmeIdCtrl;
 
+typedef struct NvmeIdCtrlZoned {
+    uint8_t     zasl;
+    uint8_t     rsvd1[4095];
+} NvmeIdCtrlZoned;
+
 enum NvmeIdCtrlOacs {
     NVME_OACS_SECURITY  = 1 << 0,
     NVME_OACS_FORMAT    = 1 << 1,
@@ -1022,6 +1043,12 @@ typedef struct QEMU_PACKED NvmeLBAF {
     uint8_t     rp;
 } NvmeLBAF;
 
+typedef struct QEMU_PACKED NvmeLBAFE {
+    uint64_t    zsze;
+    uint8_t     zdes;
+    uint8_t     rsvd9[7];
+} NvmeLBAFE;
+
 #define NVME_NSID_BROADCAST 0xffffffff
 
 typedef struct QEMU_PACKED NvmeIdNs {
@@ -1081,10 +1108,24 @@ enum NvmeNsIdentifierType {
 
 enum NvmeCsi {
     NVME_CSI_NVM                = 0x00,
+    NVME_CSI_ZONED              = 0x02,
 };
 
 #define NVME_SET_CSI(vec, csi) (vec |= (uint8_t)(1 << (csi)))
 
+typedef struct QEMU_PACKED NvmeIdNsZoned {
+    uint16_t    zoc;
+    uint16_t    ozcs;
+    uint32_t    mar;
+    uint32_t    mor;
+    uint32_t    rrl;
+    uint32_t    frl;
+    uint8_t     rsvd20[2796];
+    NvmeLBAFE   lbafe[16];
+    uint8_t     rsvd3072[768];
+    uint8_t     vs[256];
+} NvmeIdNsZoned;
+
 /*Deallocate Logical Block Features*/
 #define NVME_ID_NS_DLFEAT_GUARD_CRC(dlfeat)       ((dlfeat) & 0x10)
 #define NVME_ID_NS_DLFEAT_WRITE_ZEROES(dlfeat)    ((dlfeat) & 0x08)
@@ -1117,10 +1158,76 @@ enum NvmeIdNsDps {
     DPS_FIRST_EIGHT = 8,
 };
 
+enum NvmeZoneAttr {
+    NVME_ZA_FINISHED_BY_CTLR         = 1 << 0,
+    NVME_ZA_FINISH_RECOMMENDED       = 1 << 1,
+    NVME_ZA_RESET_RECOMMENDED        = 1 << 2,
+    NVME_ZA_ZD_EXT_VALID             = 1 << 7,
+};
+
+typedef struct QEMU_PACKED NvmeZoneReportHeader {
+    uint64_t    nr_zones;
+    uint8_t     rsvd[56];
+} NvmeZoneReportHeader;
+
+enum NvmeZoneReceiveAction {
+    NVME_ZONE_REPORT                 = 0,
+    NVME_ZONE_REPORT_EXTENDED        = 1,
+};
+
+enum NvmeZoneReportType {
+    NVME_ZONE_REPORT_ALL             = 0,
+    NVME_ZONE_REPORT_EMPTY           = 1,
+    NVME_ZONE_REPORT_IMPLICITLY_OPEN = 2,
+    NVME_ZONE_REPORT_EXPLICITLY_OPEN = 3,
+    NVME_ZONE_REPORT_CLOSED          = 4,
+    NVME_ZONE_REPORT_FULL            = 5,
+    NVME_ZONE_REPORT_READ_ONLY       = 6,
+    NVME_ZONE_REPORT_OFFLINE         = 7,
+};
+
+enum NvmeZoneType {
+    NVME_ZONE_TYPE_RESERVED          = 0x00,
+    NVME_ZONE_TYPE_SEQ_WRITE         = 0x02,
+};
+
+enum NvmeZoneSendAction {
+    NVME_ZONE_ACTION_RSD             = 0x00,
+    NVME_ZONE_ACTION_CLOSE           = 0x01,
+    NVME_ZONE_ACTION_FINISH          = 0x02,
+    NVME_ZONE_ACTION_OPEN            = 0x03,
+    NVME_ZONE_ACTION_RESET           = 0x04,
+    NVME_ZONE_ACTION_OFFLINE         = 0x05,
+    NVME_ZONE_ACTION_SET_ZD_EXT      = 0x10,
+};
+
+typedef struct QEMU_PACKED NvmeZoneDescr {
+    uint8_t     zt;
+    uint8_t     zs;
+    uint8_t     za;
+    uint8_t     rsvd3[5];
+    uint64_t    zcap;
+    uint64_t    zslba;
+    uint64_t    wp;
+    uint8_t     rsvd32[32];
+} NvmeZoneDescr;
+
+enum NvmeZoneState {
+    NVME_ZONE_STATE_RESERVED         = 0x00,
+    NVME_ZONE_STATE_EMPTY            = 0x01,
+    NVME_ZONE_STATE_IMPLICITLY_OPEN  = 0x02,
+    NVME_ZONE_STATE_EXPLICITLY_OPEN  = 0x03,
+    NVME_ZONE_STATE_CLOSED           = 0x04,
+    NVME_ZONE_STATE_READ_ONLY        = 0x0D,
+    NVME_ZONE_STATE_FULL             = 0x0E,
+    NVME_ZONE_STATE_OFFLINE          = 0x0F,
+};
+
 static inline void _nvme_check_size(void)
 {
     QEMU_BUILD_BUG_ON(sizeof(NvmeBar) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeAerResult) != 4);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeZonedResult) != 8);
     QEMU_BUILD_BUG_ON(sizeof(NvmeCqe) != 16);
     QEMU_BUILD_BUG_ON(sizeof(NvmeDsmRange) != 16);
     QEMU_BUILD_BUG_ON(sizeof(NvmeCmd) != 64);
@@ -1136,8 +1243,13 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeSmartLog) != 512);
     QEMU_BUILD_BUG_ON(sizeof(NvmeEffectsLog) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdCtrl) != 4096);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeIdCtrlZoned) != 4096);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeLBAF) != 4);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeLBAFE) != 16);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNs) != 4096);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsZoned) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeSglDescriptor) != 16);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsDescr) != 4);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeZoneDescr) != 64);
 }
 #endif
-- 
2.30.0


