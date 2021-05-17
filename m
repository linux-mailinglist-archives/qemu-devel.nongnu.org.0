Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F4B3828A7
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 11:45:03 +0200 (CEST)
Received: from localhost ([::1]:44976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liZo6-00006W-ES
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 05:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZNw-0003Ew-H3; Mon, 17 May 2021 05:18:00 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:33593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZNu-0005ix-QQ; Mon, 17 May 2021 05:18:00 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id A3BA8245;
 Mon, 17 May 2021 05:17:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 17 May 2021 05:17:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=hDXqlQHmgsN6q
 gKdwDKuyfBLoa6je3z5MRgRyiaejdY=; b=bahLCD/RdME949PJpbHUAuvy6TV2E
 eG15WyGudzILK4tR2tKJLToWbY+D/7bvwW7ryeQ51mBaH+RW8XgSXhiI/7GTKQ+v
 TTJXan/iD8iZu59Ke904H2ZptmcA44PyVNNWWqJAeFoT3Iwvw+1nIckTumIiO2kG
 hZ8EJ18UDJ/52dWTbmbB5S6xqjrOhraFISqqk/s2XwfXLvAoYzlZu1IW/B9O3yLr
 unESQEbzUE0nBALhHznr4quSbJ3R4m8RmMFFAJ3JAnj1+v6dnzhtmyg5PVvQlN+R
 vGuIdor2kz3I33pAniRgTBQ4XkDXsKcNRtw+MH41gO0/xb+5VRCYI/svw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=hDXqlQHmgsN6qgKdwDKuyfBLoa6je3z5MRgRyiaejdY=; b=CrEoY0vy
 yC+aQB/ALRpWiC4BS7GX7w1HOoV1rOr022dCMkcnFL+WNhnpsauwYLrQzZaYiaW8
 /xo0PSdIcdL+ccKgpDALKeHr7RwoSCCV9GH7Jg2e/HXc3B+kS76nzsL0TkjCq71M
 jbdbc22NvU5aXGQI2eLDwhEAt8xZM3O4zlvPPXKc17jc7SOT+osj0rnhhgWzorZx
 MZTKyGMZiG/KY8+6ThvGb4YEf/wayRXwvzQXbMYQKZyrKUvwy6u+OLhrgLb01ntE
 tduFla63m+sHsjbSQv4n2jgvTDrhJrIQSC/GmnM6JqbTxwvDajcQknVMe52L4/nw
 mV/zScCZdt7FCQ==
X-ME-Sender: <xms:wzSiYAt2sUj0t4mnsQkSFWaDIE4m2JaMNirNWGPZ3JTcf2ITo0c94A>
 <xme:wzSiYNdAtweIFxtdCk-DQ-wNZWcIGchKn22Jx-28M6mB5UE8l2jokAaJ6rMkma9dA
 a_e_sylQThi4-YNH8c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeihedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:wzSiYLwd3BwOg4Jw9uz-1KdOuHkrFlkbNasuD01-arHbd2mEZE181g>
 <xmx:wzSiYDP9osJAdwjmGTxIHl17Q9JY_v5LUdQSuuQb-QzBuF3uNdotwA>
 <xmx:wzSiYA9lKTAc5wVM5gqigdCtOSUPHPBCF0MIte4Pzz0hiODRvv4WVA>
 <xmx:xDSiYETt_TwHt5RFhYmMckbPN4Omvvxmj57eGlaFLzb_Xy_ur6Tp43bsdes>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 05:17:53 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 04/20] hw/block/nvme: fix io-command set profile feature
Date: Mon, 17 May 2021 11:17:21 +0200
Message-Id: <20210517091737.841787-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517091737.841787-1-its@irrelevant.dk>
References: <20210517091737.841787-1-its@irrelevant.dk>
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Currently IO Command Set Profile feature is supported, but the feature
support flag not set. Further, this feature is changable. Fix that.

Additionally, remove filling default value of the CQE result with zero,
since it will fall back to the default case anyway.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
[k.jensen: fix up commit message]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 67abc9eb2c24..14c24f9b0866 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -185,6 +185,7 @@ static const bool nvme_feature_support[NVME_FID_MAX] = {
     [NVME_WRITE_ATOMICITY]          = true,
     [NVME_ASYNCHRONOUS_EVENT_CONF]  = true,
     [NVME_TIMESTAMP]                = true,
+    [NVME_COMMAND_SET_PROFILE]      = true,
 };
 
 static const uint32_t nvme_feature_cap[NVME_FID_MAX] = {
@@ -194,6 +195,7 @@ static const uint32_t nvme_feature_cap[NVME_FID_MAX] = {
     [NVME_NUMBER_OF_QUEUES]         = NVME_FEAT_CAP_CHANGE,
     [NVME_ASYNCHRONOUS_EVENT_CONF]  = NVME_FEAT_CAP_CHANGE,
     [NVME_TIMESTAMP]                = NVME_FEAT_CAP_CHANGE,
+    [NVME_COMMAND_SET_PROFILE]      = NVME_FEAT_CAP_CHANGE,
 };
 
 static const uint32_t nvme_cse_acs[256] = {
@@ -4711,9 +4713,6 @@ defaults:
             result |= NVME_INTVC_NOCOALESCING;
         }
         break;
-    case NVME_COMMAND_SET_PROFILE:
-        result = 0;
-        break;
     default:
         result = nvme_feature_default[fid];
         break;
-- 
2.31.1


