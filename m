Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB312F1296
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 13:52:54 +0100 (CET)
Received: from localhost ([::1]:36958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kywgm-0004Mt-1s
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 07:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kywNA-0002SI-Fq; Mon, 11 Jan 2021 07:32:36 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:36153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kywN8-0006tO-RU; Mon, 11 Jan 2021 07:32:36 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E1A8D28EF;
 Mon, 11 Jan 2021 07:32:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 11 Jan 2021 07:32:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ndtceV/Hor0Gs
 qXeBPqIl4CkzXMOk2D3Hvp1dStxsPQ=; b=oAySnfKGEbWGEm1COV/bZQGxX2U2N
 s5FY1lV7OjN7YGQtyw6x83DcsoWnDlKvUYGz9RxUeCSBOkh45BZOpnd4Ee6JgoM6
 frCVJ6ozdC1AkmoEh2jX1IW5iYy9Ss8OAPKycjUov/GYfG9v2C/p4dBzLL5e3AvW
 iP14oJKKu7/bjllbiK+Gp142WzBUz/DD29T8HhFWfvhtuee6udN9/4EXxPGzUH5b
 1kYvEbdXbGd0DRcdj/KlfppcuuRXGUenFB7zjTITSaZhklkVmH8mJoxysbKGYsky
 Z1k813X3JUNYBQ+R0X3D4mJIL+17p2BMDRSV4sXGyVTR1Hp1fIMB3QEHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=ndtceV/Hor0GsqXeBPqIl4CkzXMOk2D3Hvp1dStxsPQ=; b=H94DVCjm
 rbMJYexfsOUXxIpZc9MmP3MtnX2/nBq1ryfSBfWtBvKTASfig81LiYVW5T6JK+qU
 slYZsl/bznRMQ6pwwj2SNfsFTog+QJXJqGfhsjbeY5DLUAnKV+gUETa/z99Ecl8r
 0hIFNztfXcIvyXrlykpSA7ItgsaGop0bUmFZGf3Lz0zlUOr3+VCsz9jASxtlyI/3
 vLdGDtG8YaAfafVaipAhSq3Dg6qS2KxgNctA0+q1fKN6DjM7lg7lKmh9mMa6QY03
 7j0nh8jyuIK2o1HdDbviRzD1jPBgQ81S1rFDZEwK7C3FcFlBw060gU789zAGYNSo
 9xBoAcF6kOgj3w==
X-ME-Sender: <xms:YEX8X5EJgqC-RKlJBxDfKgG_Jrpalmqk_pRyhgp8VeG8uWbKaM_-dw>
 <xme:YEX8X-V0mAMaREFdZszLR6hqmVvnbAAfsOAYUjxvnDeAvAwj6WuxKzqXLYe_6R7O3
 b_u1a_oi6c7pSEN5pk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:YEX8X7Lba9GMt_E7Y8jexQ1EsPQRqksSVHasxTEAy6YJmdOrQiVcZA>
 <xmx:YEX8X_HiSTsxaiasi7KTrg09dhnidTC7hI05GxZAxF8FSeB3vtQWmA>
 <xmx:YEX8X_XqyRB4Lx3xex-7k7UfSGI5s8rB37ULCi4dRN2crLnMJasrHQ>
 <xmx:YEX8X1ex17cC3s4G0OkoM2dubwHcRKegAKVLI_XDoJN_hRMajgonkQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 608281080057;
 Mon, 11 Jan 2021 07:32:31 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] hw/block/nvme: add missing string representations for
 commands
Date: Mon, 11 Jan 2021 13:32:22 +0100
Message-Id: <20210111123223.76248-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210111123223.76248-1-its@irrelevant.dk>
References: <20210111123223.76248-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add missing string representations for a couple of new commands.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
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


