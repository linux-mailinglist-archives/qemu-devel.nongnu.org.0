Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 052D3330ED4
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:05:30 +0100 (CET)
Received: from localhost ([::1]:37524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFZe-0001k6-Pi
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:05:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEw3-0003n7-Cl; Mon, 08 Mar 2021 07:24:32 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:51223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvr-00075V-Om; Mon, 08 Mar 2021 07:24:30 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 8BA2A36DA;
 Mon,  8 Mar 2021 07:23:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:23:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=/ZZQCC1UfXLRG
 eY4A1sN9etTsAeV2OOWDHOgpzMv958=; b=xKKyVdBOk7oL1g/hgkQRHYemSt8N+
 f4KfAYcMNWro33xxygkuMGpxmfaNzY2IafQDh7RviVvS25UN3iSurmxD1Ke8Kjez
 mf+lInOd4zNMoU3FYfYkjH0ogE8nJnYVrSaWzUc5hKexiXFkeDil6VYWln9jbwcA
 ILVnrv5HpavCOjfigF1bWcADa34HeOL8T9m/TGuU640vmZV9NXDM2aq84fxx6xAV
 jyh1t/h4HU2l5+loMz0GGfB4+kjubo4l9Oq3BObToUK5SMrRrVe8KtpK4sLl+jbk
 LB+SqqQZTJkyu0+semJAdBCCpCyvOn6F0P2iS5OYidLjfzQP6Lgkc/c4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=/ZZQCC1UfXLRGeY4A1sN9etTsAeV2OOWDHOgpzMv958=; b=eSXDWeSt
 NIdVNJBC3XYWR86tmxk+YLtntJntFQUT+uDdLCTZ6AmNZ2KdzfxI4cpZGSijLApU
 nylcjyNVdQ0buiKb0lHlQYFInH/XYXoy3ivR46tm15Abe76/pbJxomNzLaq8JdrX
 0mlCFHKG64M1Aex/O5Xnew0cfA5G64AF+COd2MatDNqWWwxR+gNAqwmyDl2oXNjc
 dyyhdZRC+NQJwhTT2vKg1lQ9XbGjWxcbSjzb3nt35R+qKhAX+Qb7TINwI0wBgAAx
 WFB3op3VaeJO39Arggms8OHMFE5q5s8S99g1dqaKAMSrL5La86zEOp/DLs1IVdvJ
 bQIbZtv9F35v6w==
X-ME-Sender: <xms:XRdGYPifZwiwsBDsUS2TFUanAzGfJnFxuGfv0NEtMOuuLmSq5UU1Lw>
 <xme:XRdGYMAIbn7cSKH1l_QUg9AmAXpcNQ1Ia6DJDI0rAOXyyMFWALcyW_e3GI9uXn_PU
 bb202mn1NcMVBwslAM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedule
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:XRdGYPGRFjnFzqtOtDgjSCW5YBhHCBpqhzCOeeFOhPuJtnmV1vItSw>
 <xmx:XRdGYMQVymJWr1DAsd6rTihQvxdlzgf3naIk1ePHPmQrG8_z4Rh4gw>
 <xmx:XRdGYMwgjeSALLf3iGBFX9kuNBtQdmoEGdv6gN_uJehaYJlTC8yV8w>
 <xmx:XRdGYLnYwWTvliQjZ-BfAUfJxrkq1O5ZfTjM736WmV_tthfZwFr-d0lUe8s>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B27CF1080059;
 Mon,  8 Mar 2021 07:23:55 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 26/38] hw/block/nvme: remove block accounting for write zeroes
Date: Mon,  8 Mar 2021 13:23:01 +0100
Message-Id: <20210308122313.286938-27-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122313.286938-1-its@irrelevant.dk>
References: <20210308122313.286938-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
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
index 8b84342d72a8..148ad3dd01e1 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2172,7 +2172,6 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
                                          nvme_rw_cb, req);
         }
     } else {
-        block_acct_start(blk_get_stats(blk), &req->acct, 0, BLOCK_ACCT_WRITE);
         req->aiocb = blk_aio_pwrite_zeroes(blk, data_offset, data_size,
                                            BDRV_REQ_MAY_UNMAP, nvme_rw_cb,
                                            req);
-- 
2.30.1


