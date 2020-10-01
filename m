Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CA52809C8
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Oct 2020 23:57:15 +0200 (CEST)
Received: from localhost ([::1]:44894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kO6Zd-0002Kj-Pd
	for lists+qemu-devel@lfdr.de; Thu, 01 Oct 2020 17:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kO6Tm-0000Yo-4N; Thu, 01 Oct 2020 17:51:10 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:43859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kO6Tj-00032F-Au; Thu, 01 Oct 2020 17:51:09 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id ECC0158037C;
 Thu,  1 Oct 2020 17:51:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 01 Oct 2020 17:51:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=69KbuJ5TP5kHHpffzp5vYjWymk
 RtPuJpGFhuSRVXHfQ=; b=JHWdse2HiJG3rtPOC2EA8BVhNi00rS+2eAWgLkBddV
 xD4DfyrbR4plHCe4FhEd2UF3mlKzGk31kOpeRa6hQj/e/Ifnt+ou9QhHqBljFr7m
 mztNQCQOTruuYnKWBJKsztN+rM+F7i/OfLIFRFHQhr3/dRgwIPh2H2m8E3iCRGtY
 JScYBEJzG9UkUJUVRBNcS9qRgONxnC8I1kmsy8jJUpV7B+QypB4NG7DrT+orA0YI
 li1YFpwl7ZGcc9dIIWYPxUThv7A0Y7jm/vj5x1xeEXQZoOBXeY+sc6By7lZ/drBl
 0OFo9LVYACb0Ok4OQQUiK+fSk/41SKyH8vISO0n9CtFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=69KbuJ5TP5kHHpffz
 p5vYjWymkRtPuJpGFhuSRVXHfQ=; b=FywRjGHI8Hp0vak0rBCfaOMxDQcvlXB7+
 nD7jOLng01DxnsA16P+4Qi1fT+PA4hWAsXfE841dMm/X57QIHMMk3HumxvjtvVga
 lAggsJkMZnla3z1Eg0yZaGfCKFNjx7WbEE4+IBHUfPUGjm/Bs3gIagr07v/1ACUi
 VP3RVi/ynTliXdIiC4kIqhFc339jjuvX9n202J3WQuYW2SqfPrrCY7fi9KIiBRka
 CEgj2zV8KMpRaP9WSm2ZgbbSfRs8wEu92Hz4tOZAoHvGceuXlUYTAy9IqiKtx9i2
 WmcYANyVd2KPjVm+fiLbxt05EZc+Rao5UrFZ2IMkAJ8KHEuu2LNAg==
X-ME-Sender: <xms:SE92X1mzK-au76JB0yoKKLFw_tNL6P46KCPHHV-JGnkC3y_miP8RhQ>
 <xme:SE92Xw1vvw8JZCcaZc8dl5PRfMnhfyDxlTWTci_CODW_n50qa8Oacwcz00fFVpNIY
 w-VPBNv0zUXcsqSBg4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeeggdduieekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpeefveelvdeikeduueffteeggeefhedvffffjeeuueeludehvdegjeevjefhtdetheen
 ucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:SE92X7pOpE-YYhkzqUJ9Use6ervVHaeDqV9h73jResyKXjipUhIpNA>
 <xmx:SE92X1kNDKx02z6RD6i5jUsrKtq7og6tk0mv9VyVaRiWzXmfJalw-A>
 <xmx:SE92Xz1pb831mCS1qeixvm0keM8QZAcJ9LvbZDm4i4eiIWFKbnVwWg>
 <xmx:SU92X-SgHH8GgmQyqmgl6hFU2srzbbvOrK8Dga2OAa6-4NPtCyx5pQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id E719D328005A;
 Thu,  1 Oct 2020 17:51:01 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/block/nvme: update nsid when registered
Date: Thu,  1 Oct 2020 23:50:59 +0200
Message-Id: <20201001215059.866660-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 17:51:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

If the user does not specify an nsid parameter on the nvme-ns device,
nvme_register_namespace will find the first free namespace id and assign
that.

This fix makes sure the assigned id is saved.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index da8344f196a8..bb1ee009cd31 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2583,7 +2583,7 @@ int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
         for (int i = 1; i <= n->num_namespaces; i++) {
             NvmeNamespace *ns = nvme_ns(n, i);
             if (!ns) {
-                nsid = i;
+                nsid = ns->params.nsid = i;
                 break;
             }
         }
-- 
2.28.0


