Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93079314AB0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:49:09 +0100 (CET)
Received: from localhost ([::1]:46550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Oho-0001Jp-HL
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:49:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NW4-0005Ys-Hn; Tue, 09 Feb 2021 02:32:56 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:47739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVw-0005qm-8r; Tue, 09 Feb 2021 02:32:56 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id EF18AC27;
 Tue,  9 Feb 2021 02:32:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=+YH3xOuMppOQV
 V3nPcJscHcr/hjMBMwQIaMayak3gnQ=; b=UGpJf2Q23qGddwmqxbERNbieGxA4D
 PWH4BBy42cNHkC7ilv5gXgvIzZczu3emp4ke7XeKSIvfTP5a03368YW0m6CWNZdt
 XHW4UJMFfAIKHzi3IUaO6+q3BKwJT6b95nMS1hXmFi8T0t/Wt6KoqUiVwEjwd/cr
 LUSx5b1A0QjsvC290rS16Exz2KCUIi0vzd4Lq9oBx1MnLExmHIwpzNwx5am3VcaJ
 Q8QNYayBbM04hAvv5p27lDl17vts7Buaie9dxe45N2Myda+YIlyFCIhZB1GDz5g8
 m3VF0COEw5zzQno8jRS4us292Hlz3JxVq1otYNOVrO6niFhDksgc95KfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=+YH3xOuMppOQVV3nPcJscHcr/hjMBMwQIaMayak3gnQ=; b=FZbXYBqx
 Iyq98qyUgPHU5D5NI+jFyUsZYey9tf6X19VYy/a34d5ooeNM4Yo9+IYIgo6dw/Wy
 NWGBSDcn1vKAO4EyYFyxmGZDKLkw4KID7ygdOKNJipX3AG7Y2/jGRYvmNqwmfjgh
 q+iiDlJPvQVo5Ed8Eje8Ug+VMEbdeOFcigxKfmoxR7AjWggtrntRMZkLN7jXa2VM
 SevZ3OdgIXrsAMiDZqi+4YH9hY6E0NKSGsXzGBst8QilueoLybFkUWRD+o22CxlH
 3Ku1DsFx1Hq9at3NUBU6Kmy0enbayJplwXqVJFUtCsTOhTqdJbEVmpM5+PlgzS6K
 9dP5pgspwKM4Kw==
X-ME-Sender: <xms:gToiYILTrwHXvEBogyWc26B7vE5GBdHRrmGRdBLYA0faxq2wET9gRg>
 <xme:gToiYIL2sa_MFtssjUw2-tqkbj4RXoWN9Se76vn7U-Inl9elgvdJrKurUb3CN7D9E
 _u7YztPMvtVajWxnCM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedutd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:gToiYIsZd6UXvXiomRlOLTV23d2rVv0HLduQl8s32PLspR0ju1aGUg>
 <xmx:gToiYFYusM-5jjV-x-YuDdSyxTTWrrDUzyRLYz5aurZwJS45pC754g>
 <xmx:gToiYPbCMD-Hy6fumO5qrVidvggQCan7-7PoKzdM9ycXmKO65RILLQ>
 <xmx:gToiYNN6G9xUhhXoDscfXpFQ9qhFN3I5H8S1wS-T5Y8ToTwKaHLUiO1nQHo>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id AF0C81080057;
 Tue,  9 Feb 2021 02:32:15 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 35/56] nvme: introduce bit 5 for critical warning
Date: Tue,  9 Feb 2021 08:30:40 +0100
Message-Id: <20210209073101.548811-36-its@irrelevant.dk>
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 zhenwei pi <pizhenwei@bytedance.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhenwei pi <pizhenwei@bytedance.com>

According to NVM Express v1.4, Section 5.14.1.2 ("SMART / Health
Information"), introduce bit 5 for "Persistent Memory Region has become
read-only or unreliable".

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
[k.jensen: minor brush ups in commit message]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 45b2678db1f0..41614c5e12af 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -789,6 +789,7 @@ enum NvmeSmartWarn {
     NVME_SMART_RELIABILITY            = 1 << 2,
     NVME_SMART_MEDIA_READ_ONLY        = 1 << 3,
     NVME_SMART_FAILED_VOLATILE_MEDIA  = 1 << 4,
+    NVME_SMART_PMR_UNRELIABLE         = 1 << 5,
 };
 
 typedef struct NvmeEffectsLog {
-- 
2.30.0


