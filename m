Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E05A51D18B
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 08:42:26 +0200 (CEST)
Received: from localhost ([::1]:53598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmrfV-0004Hq-4z
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 02:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nmraF-0001IR-Dw; Fri, 06 May 2022 02:36:59 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:46559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nmraD-0001iQ-A1; Fri, 06 May 2022 02:36:59 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 187B83200AC3;
 Fri,  6 May 2022 02:36:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 06 May 2022 02:36:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1651819012; x=1651905412; bh=R1qB75FaGT
 +MkpPH7xiqW88NcnO32vodpve9fNaDHcU=; b=pbbMeNsQopTXt7q8du+Ubgt7cX
 qFD+bdVWay7NhZaR8hgrt2rsqCKa54ETZYHXSPtR+i7GRxJqdsaB5YBEudadp9Vk
 +aDRqWtKszATqBQTp821UuGWVw21xxWLmpYqcvqpntYPFVf454Cw/fWmtLH9athE
 +t/Q2m+cZDIsfYQsRKqJkeTU35rrXE5SKA5/XiV5anEAdMYef9tWthbq3EMKRsuc
 6pO/cpMNfSSDVkVnN9S0E35j3HhikmI/1GqBDi33MqLa4FHTwNy24+u+nFxkRKaU
 ODiEFc1rdtqPsBn9K5UwN2w7a2DId/7Tw9FpJNpYI66mk+wNk6vODDVpmGlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1651819012; x=1651905412; bh=R
 1qB75FaGT+MkpPH7xiqW88NcnO32vodpve9fNaDHcU=; b=c5nBPO1qgl0Yi+NME
 gLqsQU36ZfwaAMPveoJ8wcF4QQxGCfS8TtoRWyEo8Wf9QJc1jcAQRzHMYC4F0BVj
 xTtYEJK36tcPZ7kF1RErY0f62Tuc7UV9LJ50wKCB1lcUW9a529R+U6bl80u6vYsZ
 neZ5DawSdnAxO8EhiVLN9EFW5SWOoQfcZcCWOu5vGe0+jU/LiVU7h3ouVMiG1dCM
 ARBkNswf4mRhInlNTKLTvVfHtOAXa2KpyaVKKazAAzQqSvW8JpaNu0M386A5o//8
 Z7yLAmGI46fwRJQbPXXPRMAreCVsRDyCz2hoCsB7A+u7MJQv57Wx76s5uNzSVbDt
 PDJCw==
X-ME-Sender: <xms:A8J0Yu_FIHqh7CiqwHvSnd4BCfpUsD7geRpDbA9DwF8KaqPULKBaUA>
 <xme:A8J0YuscE3TOk-e77adAXT5BIBwm5z4_f1iv-obrPLiU6wiWAzyG4C5xdPVDKiCDd
 kdP3Gg-O55kRrxEEYM>
X-ME-Received: <xmr:A8J0YkDKIgKNcf-a_H6PcRjy0NIEy_fNmgW_rHdzZ8SqAt8QG3NxH-Odo6W_OJasgIblzL3QSABqqlSpHnj-CQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvgddutdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnheptdeludfhgeelheelledtjefffeejtdeluedvgfetveffgeetvdevkeehieeikeet
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:A8J0YmcJaWIlVVCozQoLZIQAQtZjgvq8MXPPdXuWYCeapnxkd-snhg>
 <xmx:A8J0YjNPY34KzUqpRcz4-CFa0xGH0BzOW0LXFduXgeSAz-m8y99-aQ>
 <xmx:A8J0YgknW8cL9K677OWP9UpJ2D0UVLJK3bTWzl2XxDGXwV2QIf8DxA>
 <xmx:BMJ0Yool_8IzLl22WPWNM3_n4MoXzQG_nZVcCN-ZG9mrDjX7Rl7u6g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 May 2022 02:36:50 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Zhenwei Pi <pizhenwei@bytedance.com>, qemu-block@nongnu.org,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH] hw/nvme: fix smart aen
Date: Fri,  6 May 2022 08:36:49 +0200
Message-Id: <20220506063649.13361-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Pass the right constant to nvme_smart_event(). The NVME_AER* values hold
the bit position in the SMART byte, not the shifted value that we expect
it to be in nvme_smart_event().

Fixes: c62720f137df ("hw/block/nvme: trigger async event during injecting smart warning")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 08574c4dcbc8..a2f6069f7fe1 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5325,7 +5325,7 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
 
         if ((n->temperature >= n->features.temp_thresh_hi) ||
             (n->temperature <= n->features.temp_thresh_low)) {
-            nvme_smart_event(n, NVME_AER_INFO_SMART_TEMP_THRESH);
+            nvme_smart_event(n, NVME_SMART_TEMPERATURE);
         }
 
         break;
-- 
2.36.0


