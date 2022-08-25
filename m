Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B51665A087D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 07:40:06 +0200 (CEST)
Received: from localhost ([::1]:56500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR5b3-0003Ns-9l
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 01:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oR5Tn-0000bC-Qt; Thu, 25 Aug 2022 01:32:36 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:51093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oR5Tl-0007Mw-At; Thu, 25 Aug 2022 01:32:35 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D49845C00F3;
 Thu, 25 Aug 2022 01:32:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 25 Aug 2022 01:32:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1661405544; x=1661491944; bh=Cf0CSt8Mle
 YP03waozQPYEC2eeSG+G8eJB+dXU/T6rE=; b=mmwQVzXs8pIFQigdmqC1yqY19p
 dcOAatSThDeSaAhP66i1nvmUbrYPWXTaPl0JJE/bFoOSAs/dmC+EYij3zQvC1VeE
 mC2VR9zwg6hCdUPFKa0Gf/edpdwK4ht+tjiipaQ3bTWWNeNi2t541dcmaO3hAT+Q
 3k3QAN8tZDn+Xuu8/r7LAMdfUqCKDe2RLK7Do3X8WDyXDj0+eubmPOtry++u6h3z
 wbSs7ehVClrBDT+miLHpbSZqU1Oql+uHltdEex3UTTyrmZwws9lhQiF/dm0xHgV1
 g5WSDp7VdkMUqD36z/kuSvMg/gRMJZ6AG+yrm2IcaNeDDYjdsYXsruXiK/LQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1661405544; x=1661491944; bh=Cf0CSt8MleYP03waozQPYEC2eeSG+G8eJB+
 dXU/T6rE=; b=Qb9ea0na8W2+Yc/qppdusmoGVpkGs2YX4hQYlkDrF+VqNUnWd4z
 ibp1HqhjhzcBWPnZQmxzdeBEsx4N1qfkogG1rpnkY0+qVtMooWbw829/sOi8W6Sr
 ac5H77eBk2iSUyHWhB7hnv2EZb+ti90WlUxJJfmgsiF2VVFOOMU5SPLzMh8PE1sD
 esKa92MEx2yUYin9OO3fWYUbO8bFIFeA6QTp3ZD56OBtoyqTu4RCRViM64Ev5PlZ
 lERkRfUyw4zeTRMMiVMnOr9F5MO1s4EecJcqkbr1yAsc43D5bodzmVQCTP4yJ9MO
 aty4kc2j1C8wXmSM+Ex0aHxRiMTgXhEoosA==
X-ME-Sender: <xms:ZwkHY2St0U3Lr0tpna51NuEL6RskOg_4gbsqb36X0H96KK7ZzRFZaw>
 <xme:ZwkHY7zHNFxthaPqedZ5zhqCPKd3ksBB3zVo6WsoiPvaw2MpynCUoAdo7GEq0DfPo
 0DLjfD42Dqt0tsFQ04>
X-ME-Received: <xmr:ZwkHYz1LnM4BYhlydzY7eUtikyCnXW9jIGDZvldSVHeTk6eFkeAxb4MSG5fWcJcAmywB5IJRcE7UMqSGx8VZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejvddgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnheptdeludfhgeelheelledtjefffeejtdeluedvgfetveffgeetvdevkeehieeikeet
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ZwkHYyBDROtr-5FqsnewLOUEUaxjmO9Ak8Z8oBAEpz48L_zefIU4dA>
 <xmx:ZwkHY_gYI17v9ZdbRNEJ7FtfKIS6H93pFugMWbaRebAaT4hHN2qKPg>
 <xmx:ZwkHY-oN5zKydJVsCloLN0yTx_4Bb7QA7cb1qiZT_qch2FePRzAilw>
 <xmx:aAkHY_dlZi5Y0CFBAoytE9aZ1oU_gDgEKUO0yYxinE71v-L9ISF5vw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 01:32:22 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Jim Harris <james.r.harris@intel.com>
Subject: [PATCH] hw/nvme: set DNR on compare failure
Date: Thu, 25 Aug 2022 07:32:21 +0200
Message-Id: <20220825053221.130428-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Even if the host is somehow using compare to do compare-and-write, the
host should be notified immediately about the compare failure and not
have to wait for the driver to potentially retry the command.

Reported-by: Jim Harris <james.r.harris@intel.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 87aeba056499..299cbb1f2205 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -2242,7 +2242,7 @@ static void nvme_compare_mdata_cb(void *opaque, int ret)
 
         for (bufp = buf; mbufp < end; bufp += ns->lbaf.ms, mbufp += ns->lbaf.ms) {
             if (memcmp(bufp + pil, mbufp + pil, ns->lbaf.ms - pil)) {
-                req->status = NVME_CMP_FAILURE;
+                req->status = NVME_CMP_FAILURE | NVME_DNR;
                 goto out;
             }
         }
@@ -2251,7 +2251,7 @@ static void nvme_compare_mdata_cb(void *opaque, int ret)
     }
 
     if (memcmp(buf, ctx->mdata.bounce, ctx->mdata.iov.size)) {
-        req->status = NVME_CMP_FAILURE;
+        req->status = NVME_CMP_FAILURE | NVME_DNR;
         goto out;
     }
 
@@ -2300,7 +2300,7 @@ static void nvme_compare_data_cb(void *opaque, int ret)
     }
 
     if (memcmp(buf, ctx->data.bounce, ctx->data.iov.size)) {
-        req->status = NVME_CMP_FAILURE;
+        req->status = NVME_CMP_FAILURE | NVME_DNR;
         goto out;
     }
 
-- 
2.37.2


