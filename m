Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34658314AF3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:59:24 +0100 (CET)
Received: from localhost ([::1]:40002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Orj-0001jA-4g
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:59:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NWM-0005nG-1c; Tue, 09 Feb 2021 02:33:14 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:34623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NWK-00061n-E8; Tue, 09 Feb 2021 02:33:13 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 96AA3D19;
 Tue,  9 Feb 2021 02:32:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ncHfXVMWhdSC2
 EEp34EajxJLCXOOn4hYeS63Y9ypO14=; b=gRQPtmcWusuzzrs0LNIY7Hibb6jao
 2sIgxVvEMTjqakbvCRItiw/WqrcDHaIn089bEHFzs2B75Y1MXPdDVvE4bxcA+lwU
 88EBuZ6Yiv2tuseITce7MMxQe/9bUDo54zYgyfSiK9qU14IMqwBauETg0KNuaP4V
 8DBDp+fh0bWB74EbHQbQG1W79YwxCWxBVnUGdVlD4QkrGtKJU/M+KX4n2gfq3dOB
 EHJVSDH3DSlXXcux/SnU8sBD0KvZNVPt5HhMnsSGp6Wv9Ux1ThTpfXklejl0cK+R
 tieCQ/MBZQUX2CqZ1eRlDkCvD5ML1ERVtEUdtCxCoZZdbFtR4Cyj5sagQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ncHfXVMWhdSC2EEp34EajxJLCXOOn4hYeS63Y9ypO14=; b=hKeeNcvV
 d+DwOUXYxxMmLRywhd6pb1RTlS1c0cCCTUTPLwBiV3+7y+n1s8mXRyA5kBdVB7Tf
 GsOKxH98YPgPDcFeSFXCWr+/deG04f6o/kSKgck51IBaZ/DJp7oDY/mEkA+VBX0x
 3vw2GOBhBjWwX5M3AX4ZKyIuSQZmvFQfcnImNvqBuW3EBcECVz3WJEDtgTwRHUXm
 F6fJGPK+AUHDjsdNRgtjQaL/o0u19ZPSSni7STuDSxJ257m33RpfICU8kKArMhDE
 mFhCe4GbKIMmQHEXtW2shLq9a+QPO2VDXPfYv6V9ZSVeZ2Se0/X+EpCmHY48ezvm
 NrDEyCXIE5gF8A==
X-ME-Sender: <xms:nzoiYM8SrUNDhhmBkBo4IyMaSLbhSYjujJpMRILIY4uGuaN1mry8Eg>
 <xme:nzoiYEsYYXBPhGB0BgYkojpRKu8vcx4sBYUB7xAuCAYW0TQkhz6LHB72CpVWCZnOx
 HdMMCvFqagFqV_zaDo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvie
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:nzoiYCASr3udc9Jgelwxlvxk57gcCn8fzHM_UZ9ZoZAU6KGLyvAj1w>
 <xmx:nzoiYMfjNq5VCvCdxG3vT16rj9KvgRPtaNZyKD_KoViOSwxPW_gMlg>
 <xmx:nzoiYBOKu0eFMu79Ncaktv04Hz0JBVQ5dPcDH410satSgw32mcblQw>
 <xmx:nzoiYKjCxjPm91OhJkJb9LIXGqYXsGaptJ3YIjZu6DsHzlrl1meOMph5Xgk>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B9DAE1080057;
 Tue,  9 Feb 2021 02:32:45 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 54/56] hw/block/nvme: fix wrong parameter name 'cross_read'
Date: Tue,  9 Feb 2021 08:30:59 +0100
Message-Id: <20210209073101.548811-55-its@irrelevant.dk>
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
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Minwoo Im <minwoo.im.dev@gmail.com>

The actual parameter name is 'cross_read' rather than 'cross_zone_read'.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 2335739bdb17..e562d7467b3b 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -81,7 +81,7 @@
  *         The default value means there is no limit to the number of
  *         concurrently open zones.
  *
- *     zoned.cross_zone_read=<enable RAZB, default: false>
+ *     zoned.cross_read=<enable RAZB, default: false>
  *         Setting this property to true enables Read Across Zone Boundaries.
  */
 
-- 
2.30.0


