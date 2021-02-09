Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AACFB314AD9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:55:59 +0100 (CET)
Received: from localhost ([::1]:59884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9OoQ-0006jv-Nq
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:55:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NWN-0005pT-OF; Tue, 09 Feb 2021 02:33:15 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:37355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NWJ-00060p-9P; Tue, 09 Feb 2021 02:33:15 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 5DBF7CDC;
 Tue,  9 Feb 2021 02:32:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ckfr3OuwiggXh
 dx+yEtpCspa7vk8ZRKFH0JCBhTOqRE=; b=jW67KuQA/AjDUO0yWDzuPUJy61Zlz
 t5TsNkTT8C1hu8CZGASNNkrfjp0kAAONrBFXUuU2miBWTw6yQXAsmG3MFENq+/0O
 KcUra7zT9e8/f8Lbdy8MXGsmPjabmIX/ksliDw/i0u/l8Ws+hHLGBQH7OBd4oXGP
 Ifp182UWvziS2ATU3hdHWKC7hE733OOIybdGHpZhHesdTihYILXzDdRauVvRRdun
 qKEKb/PDvtUxTuyOmqlZpkkZf9Jl83Q34xMjg6HHVoKS07L0sXLuFtIvZdcqN13t
 puZ7k2ueRhfJgDKymhbzAbK/4DPBrMu+VlkpOkyXWHBJM5YTMHsIULrZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ckfr3OuwiggXhdx+yEtpCspa7vk8ZRKFH0JCBhTOqRE=; b=FY15x56e
 vDviieWun9FfhanYe9kI2C/v4eyOuX2kdJ8V6w/zmNvgOWp59AaAxt4K2jDI/rHR
 4JGhAnr8IVwiQbMkNIOZOtZ5N8iz5Pj2GcIztI/EjlH7AQJ8tO01cjoYkJCFRpuA
 bN61D+2p2mKIzWBT8QX3dJG6b7w9iNwnG/dNJQ4U/4R8iwRNlkslmct17tibvN88
 xsi7d8fJ7PW+5ugm9IhayXI0Oh4NumXquc06N+tT4SIcK0Xb1BOI400xOc8F0aYl
 rkZLP6fmXxl4RJU4SpL83rADN6gnKqWfEt1Q8DBkh97YZjSkHN6Hu/ZfkLBaVvl5
 RhW/5jubbPKPBQ==
X-ME-Sender: <xms:mzoiYHkqxbmR5CH0oSOT2Wny16rDr9b_czpYEoX7UNkC0pnYRB7VHg>
 <xme:mzoiYK3nnZrFNXsu3pxsJCKUhxB379KLKHGiYjfb8HIhnEAXwqbIv2AtnyIZNOZxG
 JppWYfNkH8VZ0reOd0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvvd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:mzoiYNpqPUT-WKNlmFGH2GNXse6AV4KYpJFz1pyfElbTfJ0ZbNA5QA>
 <xmx:mzoiYPnGAQ6pLTuu58_7HN4RlgwkxM1LL00bytjNJUukVHJQoxL7Vw>
 <xmx:mzoiYF0yVSd6hRM-m8az3y1DDzVmuSMuKY9M9JGb59JY6GK9-peWMw>
 <xmx:nDoiYOK95DDAFrNZgTTiy-_NRF_xlf-2ogWLQcP--G9xY5HQb5WSVUww1aM>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 89FB41080057;
 Tue,  9 Feb 2021 02:32:42 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 52/56] hw/block/nvme: fix set feature save field check
Date: Tue,  9 Feb 2021 08:30:57 +0100
Message-Id: <20210209073101.548811-53-its@irrelevant.dk>
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Currently, no features are saveable, so the current check is not wrong,
but add a check against the feature capabilities to make sure this will
not regress if saveable features are added later.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index b3d072c8b2bb..c99a3fbf3461 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3324,7 +3324,7 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
 
     trace_pci_nvme_setfeat(nvme_cid(req), nsid, fid, save, dw11);
 
-    if (save) {
+    if (save && !(nvme_feature_cap[fid] & NVME_FEAT_CAP_SAVE)) {
         return NVME_FID_NOT_SAVEABLE | NVME_DNR;
     }
 
-- 
2.30.0


