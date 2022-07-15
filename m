Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60310575DE6
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 10:53:40 +0200 (CEST)
Received: from localhost ([::1]:55668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCH4t-0003Vl-Fr
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 04:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oCGvR-0000af-Nn; Fri, 15 Jul 2022 04:43:53 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:51185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oCGvQ-0004K0-49; Fri, 15 Jul 2022 04:43:53 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 53BE85C013B;
 Fri, 15 Jul 2022 04:43:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 15 Jul 2022 04:43:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1657874631; x=
 1657961031; bh=t+E0rsnhcDd6bELl2gILP+ccA4Wii3o1IieS76A/ELI=; b=p
 q2zKp7/Ied4rC9bQB/IPxFb2+HapH4UiYgZ7vx/Um8By87xTYgf8ygRfOu2za63o
 UlpTXy4iG2ydwnGlzc625qiqCbJTH94cwXktAY2PWil2irW6QSemaUp+BIJNxp5y
 15UI8aV7VBo2CbCcoWaASdkIbmMzd9vS92IHlWK22ZuPN43akSNF96wEMzKY/t+B
 dxWfz1bsHB2P4RwTdXR6t/FerFauodmnaiy+6qY9Xm/L1D2NDZT36nN0/CZ57bUs
 dxFaHODzBmcfDukeecJ8GLpZBHWiAXXwXP4mfSRqb7ylFN9XxEDy9+ZOpAkiPOhz
 Sdif8vcrG6VDEvG/5B1sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657874631; x=1657961031; bh=t+E0rsnhcDd6b
 ELl2gILP+ccA4Wii3o1IieS76A/ELI=; b=JnSjLkj20w/GjPEMo/OvBoQmvzfvM
 3fh4qcV7cOF4zrdlTB55qO8v5iKfI0hYm3QTWjQSr2dlIsuxTTTIRDWy8EHDRD4R
 jcno/nzbvRclz+htnV95TzKwVilwJ/Jqoilk4PaJokArVN/ue81Sr7vH1kPOMxX8
 HawH8j+CYt3Uj1biLOrkgBEnYEmm8x3MWlA3ThnOvi3B3kFF6H1iTfkcZEqKHwqs
 BnY5pOuAL0rOva2rqzAG/GjnSuQSGPBBHbJ07DWlhLN1G5iwTKv6r0fNrsE7QA4Z
 pF9TonoR2xVkDwkIFxOe8W/poSES3efxjwMM4aZKfRlbzb2dkBlE9lKWw==
X-ME-Sender: <xms:xyjRYg0TBFwn8-A28H7bmfLq2B9EX1vJWB7gf0fJT64yfNfg9PO0FQ>
 <xme:xyjRYrHmy_R95555xT0KRF6uCHKzeYd7MIGFNLZ8hjw8yOI4sEUUZ-GPGmFhjmcGl
 RvuyDJi8dRCCcJU470>
X-ME-Received: <xmr:xyjRYo6XoIyKezfMzYrNNDrnW6GT5MxLMaCkKQWWO9MBauQcwDIJjAXKMoX_2UZOMU8athJJ5G4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:xyjRYp2HVUjNDe8UlNE7U5DzEYw6CR0sZh-pelphZ_UW2LG7HNirCQ>
 <xmx:xyjRYjGQQQvzVPpNpU2UYoBzD7OyHMNHx7qypdaJsve5dzGntE2vWQ>
 <xmx:xyjRYi8HiZ7pkVvdpoxK9a7ZbGY5iD4FyGaUNYntHFY2mfpjNE0K8g>
 <xmx:xyjRYr-QYKXtNi-Hj07oOHg5hcOcP1P1-8hIlFfHcAiuEHEg_5nWMQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 04:43:49 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 Klaus Jensen <its@irrelevant.dk>, Kevin Wolf <kwolf@redhat.com>,
 Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Niklas Cassel <niklas.cassel@wdc.com>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 3/6] hw/nvme: fix example serial in documentation
Date: Fri, 15 Jul 2022 10:43:37 +0200
Message-Id: <20220715084340.1128455-4-its@irrelevant.dk>
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

The serial prop on the controller is actually describing the nvme
subsystem serial, which has to be identical for all controllers within
the same nvme subsystem.

This is enforced since commit a859eb9f8f64 ("hw/nvme: enforce common
serial per subsystem").

Fix the documentation, so that people copying the qemu command line
example won't get an error on qemu start.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 docs/system/devices/nvme.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/system/devices/nvme.rst b/docs/system/devices/nvme.rst
index aba253304e46..30f841ef6222 100644
--- a/docs/system/devices/nvme.rst
+++ b/docs/system/devices/nvme.rst
@@ -104,8 +104,8 @@ multipath I/O.
 .. code-block:: console
 
    -device nvme-subsys,id=nvme-subsys-0,nqn=subsys0
-   -device nvme,serial=a,subsys=nvme-subsys-0
-   -device nvme,serial=b,subsys=nvme-subsys-0
+   -device nvme,serial=deadbeef,subsys=nvme-subsys-0
+   -device nvme,serial=deadbeef,subsys=nvme-subsys-0
 
 This will create an NVM subsystem with two controllers. Having controllers
 linked to an ``nvme-subsys`` device allows additional ``nvme-ns`` parameters:
-- 
2.36.1


