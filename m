Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B375314A0D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:13:08 +0100 (CET)
Received: from localhost ([::1]:43276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9O8w-00014d-Rw
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:13:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVr-0005R3-RY; Tue, 09 Feb 2021 02:32:49 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:42419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVi-0005mP-BQ; Tue, 09 Feb 2021 02:32:43 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 902BEC44;
 Tue,  9 Feb 2021 02:32:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=T6zZGzpk8/9R3
 A4FKDcENctUZjgPVemx2SGj+KWaA/E=; b=k3JNnjHCBS0XDkGuBNZQ3IhVqguDx
 y4ll5yACbnxjpqmCOL9W7nU6xqcuYpheuygUGxcZS0oMFgqgY5KNLu1804tKnBXK
 gwCTgHkGLZ3ltksbKMFCdtZ05trRvfmdgOKmeBNhq6/2S3lEqN3llRlcpQEAEOmf
 yKuXjEBkV8e/ylJV+avoyW7b48fsj5iFakfIWiMsjDV04X4dmYhoqJxoaeyr0o8Q
 eNbGoea8RRviB79VRhGIiYW0xXiJQaVxuvJahzKSVD9MiGdV2hg/81jAQUz+ZJPt
 bxnA0PS6zpRgyzkS4Qqy4fSl4U1FpT4VM7LAB9txct3oeckDyY6an77XQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=T6zZGzpk8/9R3A4FKDcENctUZjgPVemx2SGj+KWaA/E=; b=MDOvQob3
 RYPUe4rtGYEixB7o/sVVjzY/Gc+HxgFaj5xkIWoIUCWhWVauhORImaFLXM543k8s
 2f40BzA8tu0f0NIjrzbdFZPxbitBwUzqjGnHhQzjnm2VmsfQhqA+9+6ZgY0MMJHW
 v1mpjFbmenAf3aluVdNzxi6ilB5TQBFgFsCA/cgSEFNrHExHKvI9/9auVGcTns0d
 PwrwNDiV5RV3JST+/z5TuPCgqANj+f6ydS7nDYLDZtBTF/FNAXQLQIiFSCimM+Wl
 vCloUCHQA9Jab0riR//vuLG+KlFoel2Ow/0eRRckvlCROJ+itrvjRsO9dBAVaK3K
 aG79VCyd7pzWPA==
X-ME-Sender: <xms:czoiYH586T0uBu8PSvWvJso5TIK1qcatLFzT60k_hrFPnFAz1OnScw>
 <xme:czoiYM5RYXLRezHR38Nse4hHjtdww2XHG0cYfoGwj5I3xsPw80sqrECAm8mnIs3In
 VEEI8IS-nr7DCVDRF0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:czoiYOdANyhprMkbtd75XYJiOISzMMQLW8Ui_38i29qKHjnBZf1CmQ>
 <xmx:czoiYIKYrS-GzAh5lVQvcB0-RKfuPhOEYlAwN1R9elX1LIcZpNMncA>
 <xmx:czoiYLJ_CtSEb1YtgdR3gbhpDrM4CQeYeEYgexqR9w9MKcyyNo85Sw>
 <xmx:czoiYC8x5OR2wKVTLnM_YhpGVpjXZsjJR1z7pEKm2MBLnz3BNx2FRYNrlqs>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B561F108005F;
 Tue,  9 Feb 2021 02:32:01 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 26/56] hw/block/nvme: add missing string representations for
 commands
Date: Tue,  9 Feb 2021 08:30:31 +0100
Message-Id: <20210209073101.548811-27-its@irrelevant.dk>
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

From: Klaus Jensen <k.jensen@samsung.com>

Add missing string representations for a couple of new commands.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Tested-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 hw/block/nvme.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index b7fbcca39d9f..65540b650e1d 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -64,8 +64,12 @@ static inline const char *nvme_io_opc_str(uint8_t opc)
     case NVME_CMD_FLUSH:            return "NVME_NVM_CMD_FLUSH";
     case NVME_CMD_WRITE:            return "NVME_NVM_CMD_WRITE";
     case NVME_CMD_READ:             return "NVME_NVM_CMD_READ";
+    case NVME_CMD_COMPARE:          return "NVME_NVM_CMD_COMPARE";
     case NVME_CMD_WRITE_ZEROES:     return "NVME_NVM_CMD_WRITE_ZEROES";
     case NVME_CMD_DSM:              return "NVME_NVM_CMD_DSM";
+    case NVME_CMD_ZONE_MGMT_SEND:   return "NVME_ZONED_CMD_MGMT_SEND";
+    case NVME_CMD_ZONE_MGMT_RECV:   return "NVME_ZONED_CMD_MGMT_RECV";
+    case NVME_CMD_ZONE_APPEND:      return "NVME_ZONED_CMD_ZONE_APPEND";
     default:                        return "NVME_NVM_CMD_UNKNOWN";
     }
 }
-- 
2.30.0


