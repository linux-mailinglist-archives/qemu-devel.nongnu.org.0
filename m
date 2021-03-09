Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE152332591
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:38:04 +0100 (CET)
Received: from localhost ([::1]:43060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbch-0006fx-FL
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:38:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJaok-0000Yq-Jx; Tue, 09 Mar 2021 06:46:28 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:34107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJaog-0000ct-35; Tue, 09 Mar 2021 06:46:26 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 20812279C;
 Tue,  9 Mar 2021 06:45:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:45:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Re6pRRP8bBYoL
 q0ogKlehpxUJu2Kf6ynBPbje7OPWhc=; b=Y4C+r+6NBI7pObG/0eQsP8Z/LV9tE
 HfHVTdGAGbtkFyDjxu07U2/+LuC//ZMTuDoVWYpsd9EpeMF4yNMOso4zHvG0XVJp
 WBH3s4yXeBkk+MiYJmj88t89B2FHJDf3cvkN3gAFQIjfWWoq8iVFe0kuKl4i8dwm
 +bYhBGim3JgfsqAcp0bCyLiBEYT02Ihzv96N8bVXTZAd4ZN+y6aXylRR6qRUiU8q
 cdd52G+iazSYE6+aFRQPJBtNXSLNn4Wb2LYIeGr5CGYPR7p9Yr+Zltr2ulwV2pkq
 cRZsXwctl+0nS7nV7dTzAIj5AsTcQGrxT0ZrLXSo27Bsb1pC2wXBnLVXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Re6pRRP8bBYoLq0ogKlehpxUJu2Kf6ynBPbje7OPWhc=; b=Fq7mxb8K
 NJ2vdoXJPq14JPGUoTWDkrXl8T+NriI0KaCN+hz69B5qdHhrwf0Ou8RrvLtDLPGv
 nUQ2U0Ug72wcUqcjbFsuHytGsJA0VvFH2J/i1Pb7D6GS1yzBML8QuEx9BuzeMaP5
 en6MXMerfz0lztixoqmJqxwDtYCUwjmvt0jPaZ3To1UhQ2E8kE5oMuPtjTGWAEDm
 +QqXhIT9X7FmfkjuprCaiW4WJtJa7hufgBpAC+EZPn247ypeKTkEZmUIT/hGUstl
 H7pxdHFMgwkKM1EBkUbruX4Fe/AatsNHVOp2xHBkEREqFqY5kza9iPF1RRivWGqt
 ZcAhDM0/nRqvYQ==
X-ME-Sender: <xms:9F9HYCd9Ri5TvPCGVAI5c_qVtGoP9KtVrzX7eFyUeOw48zbLO7_2_Q>
 <xme:9F9HYDpLOuz5pWNFTaOGVdPNKmI33OvU6hTss3jEIvGnJSAaNRtEkU6J0dl7pYvRW
 lRI3O8tgvMwqVVy4gY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeduhe
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:9F9HYA4sXs6AWAecP6UznzOmsXQ_fukx1xKlF2hPFrTgfmc1Btv3ew>
 <xmx:9F9HYJrZXyMp_bfLvBmJhAZ0oxXuznzYAoX0vEy_PMmooOWNcTHO8g>
 <xmx:9F9HYCh-qb2yN_VY38_ev--oZVsXaDE0KFPlCP9XBQdHGsqZf8l5PQ>
 <xmx:9F9HYJQ1G5wdzSShmyK3PjxhJBKSkC-eN2PH_INP811ps2rMOGIQDH-odrA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5AED624005A;
 Tue,  9 Mar 2021 06:45:55 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 26/38] hw/block/nvme: remove block accounting for write
 zeroes
Date: Tue,  9 Mar 2021 12:45:00 +0100
Message-Id: <20210309114512.536489-27-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309114512.536489-1-its@irrelevant.dk>
References: <20210309114512.536489-1-its@irrelevant.dk>
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

A Write Zeroes commands should not be counted in either the 'Data Units
Written' or in 'Host Write Commands' SMART/Health Information Log page.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index fcdd6b7cb9f0..88e800898526 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2181,7 +2181,6 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
                                          nvme_rw_cb, req);
         }
     } else {
-        block_acct_start(blk_get_stats(blk), &req->acct, 0, BLOCK_ACCT_WRITE);
         req->aiocb = blk_aio_pwrite_zeroes(blk, data_offset, data_size,
                                            BDRV_REQ_MAY_UNMAP, nvme_rw_cb,
                                            req);
-- 
2.30.1


