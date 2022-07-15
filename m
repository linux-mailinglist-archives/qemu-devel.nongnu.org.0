Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E09575DC8
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 10:48:52 +0200 (CEST)
Received: from localhost ([::1]:48666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCH0F-0006JP-42
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 04:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oCGvT-0000g3-M9; Fri, 15 Jul 2022 04:43:55 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:40559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oCGvS-0004Kf-0p; Fri, 15 Jul 2022 04:43:55 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 3BE325C01BF;
 Fri, 15 Jul 2022 04:43:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 15 Jul 2022 04:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1657874633; x=
 1657961033; bh=kUIEkaBBrqE/qW5qX9ZQKrTwadB8yAa9wWEe/C/OJFk=; b=u
 4+a0R2PALT+x42kmsePuNb5LAtT8umqOe/HQsbcniNX6JGPUvLR7mM7WDb52faYC
 wHUAYldxxsCdG3GUp29Ogg6mgUeCxZjpGzZI3DKz63pgLDwCMr2p9ZIbWaC9ZTgG
 lgNct7CWb0cnhO7KoKPlhyZKIQ9n8bJx4tEhsCf6msvsrpK3pdhR/qUyxKWucaE5
 m8tkhuenZw+poQVcTBUjmn6myc8xjM5jV0lPeUreOSxsQw8lglfA7cp18GfiIumM
 MRjd+rM94WaZkPmgg0dHaQHSlmPCoqF1UTfS3XVv5R5hSpE+i+vcFl+Duxcwn/S9
 dPU8+/Fd9RVRwhZJHOe3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657874633; x=1657961033; bh=kUIEkaBBrqE/q
 W5qX9ZQKrTwadB8yAa9wWEe/C/OJFk=; b=Gu9jiu/lK0DqpIn7FJPaOBm8Bw+vX
 AMluOErGeOrJIYtlFT/XleqSnVPfTNhJXtQzyHG9q1omQH1qjaNm7FPkPndqLCjD
 3WJRDgebkafvAuJGBK6/o7H0hIncCLDYm+S0Y+uk6prjkU/eU+2iC3uupEOAciQE
 9AC9CO8u3WJNjHHS+pJiz/+SIH2l62CCuyEPufuse6a0jIYFNJK4g/gkJ9k2/Y28
 Vtrmnm22VNvyDM6ExU+xQk71rBSUFDGvDG+CveXppLEqX/H01aFFnlu/uisMdsFd
 7vs+l+WH0/eBojyjqplms3tI9mJwyH34lJ5gTwFDN6QPkbWJUuA9/iZEw==
X-ME-Sender: <xms:yCjRYlmcnshfWWeeuC72zwpR2EB3mIgxmGnkUB2yEmTDb_IY0hUcRw>
 <xme:yCjRYg2kAoSu330UssCyvvR1afoU4pb3LHEvYBjiNXwlChKBAyrTL2YNF7v0pfAGa
 0t3HSqPIYV3gZrvXN0>
X-ME-Received: <xmr:yCjRYrrf3w2b7V1Il7k3C6rOTaFyzW96VF7FQvXfwiDnnP3CKmBdlotjri8UdsUE-Hc6WaLRtVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:yCjRYlnKrttnFmdiDTkZ4nrkDFSc62HEwjlk_heL5_B7clOPvP-BGw>
 <xmx:yCjRYj3ih4efCic5-6NyYHq8JUd-sqd-FOd73SF0S6IvXdHCzJ0Q3w>
 <xmx:yCjRYku-QMHehGzEGIHdJRny2EVinffs3wD2OJIhy9t2zV15RsJOHA>
 <xmx:ySjRYst9T20rnAW-foFWzLDwkht4mRvus4p_6aEyVbsJ-LPtKYXCaw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 04:43:51 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 Klaus Jensen <its@irrelevant.dk>, Kevin Wolf <kwolf@redhat.com>,
 Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Niklas Cassel <niklas.cassel@wdc.com>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 4/6] hw/nvme: force nvme-ns param 'shared' to false if no
 nvme-subsys node
Date: Fri, 15 Jul 2022 10:43:38 +0200
Message-Id: <20220715084340.1128455-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715084340.1128455-1-its@irrelevant.dk>
References: <20220715084340.1128455-1-its@irrelevant.dk>
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

From: Niklas Cassel <niklas.cassel@wdc.com>

Since commit 916b0f0b5264 ("hw/nvme: change nvme-ns 'shared' default")
the default value of nvme-ns param 'shared' is set to true, regardless
if there is a nvme-subsys node or not.

On a system without a nvme-subsys node, a namespace will never be able
to be attached to more than one controller, so for this configuration,
it is counterintuitive for this parameter to be set by default.

Force the nvme-ns param 'shared' to false for configurations where
there is no nvme-subsys node, as the namespace will never be able to
attach to more than one controller anyway.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ns.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 870c3ca1a2f0..62a1f97be010 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -546,6 +546,8 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
     int i;
 
     if (!n->subsys) {
+        /* If no subsys, the ns cannot be attached to more than one ctrl. */
+        ns->params.shared = false;
         if (ns->params.detached) {
             error_setg(errp, "detached requires that the nvme device is "
                        "linked to an nvme-subsys device");
-- 
2.36.1


