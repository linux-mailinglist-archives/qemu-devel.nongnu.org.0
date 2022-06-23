Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32299558ADD
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:39:31 +0200 (CEST)
Received: from localhost ([::1]:58966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4UXy-00072K-1K
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UTU-00044J-Gr; Thu, 23 Jun 2022 17:34:52 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:53045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UTS-0006PG-Ko; Thu, 23 Jun 2022 17:34:52 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 91D8F3200945;
 Thu, 23 Jun 2022 17:34:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 23 Jun 2022 17:34:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656020086; x=1656106486; bh=0E
 6GB/Ipof9QPscm4E4+pKIai0V5UtDiZFX+wHZ3RQg=; b=mDLQsw1PsDfp+quX4n
 zjCc6pVD5Jx0Qcoq+hIv3OdsHIP3HzMYIdzNTeUFTJ/U95HAcddJApRJAfr3Ij4Q
 D6Giw1e2LDDgcLce/1TKjNJtSXa8vlu9T4PnginbeXM8UmSmlz7iujGl9cj/v5tE
 296si7/CtGL1hvgGceJX3gjXks7p8qxPA5Ht+BbLaB4BFqKpyQq+BGmsBpWV7kRz
 OLp9DTD2eB/Uo+Lh5JFCkU0szIUpnd7ely1OzYBmN6/6WGHt6CobNT1PopV7d1so
 k8JRDOTXDiaH1QPv6p1N+0nYaAeZ19uvHZkVlO2aZRemdz/NUTfeUj7qscqzE93p
 u8Sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656020086; x=1656106486; bh=0E6GB/Ipof9QP
 scm4E4+pKIai0V5UtDiZFX+wHZ3RQg=; b=Dh9JS+DoO+OGuErconpP7YOyfttFw
 mkVVEsmQY+/gDiTf0gXbUtZVGd2N+0mc9OEdvDn3qNeFIO18RRmyiWhKpxJFRweA
 BU/GvA1RmyVJqMjpXYppWR/MUTojfjdl82ZodqfdwlnbqlA7TIXlWkgSJnvsG15H
 gC5JPzNVuPpJ0NI+IWuETHwJWXxRai/JtXq10qCfhQPAPZLGO4pMLyaVgQmX1ZxD
 cLsyVmELj3TmooedjToBqsrDi4kdgrZE+I40wPeSwUdmn7UlaHnlY3dQ9XKPOuwE
 FjmzVxFvFMKSkv4GkzR/8xZ7MGCRXC0+BSktG6xOhlQu7ZRFLTWbC5cdw==
X-ME-Sender: <xms:ddy0YoH_dO62nlyLz0Ykp5lzrJB9JA5FL2Wg1nK7zXklMVXjXD4ZUg>
 <xme:ddy0YhXMQFbDRCBV9Lua5CM5XCJDxOuzEFeye2Wymr7AY4oaNo7X1dxHnrdPVQnhw
 qWhj8PStNrLtAOazbI>
X-ME-Received: <xmr:ddy0YiIbrkGlGuh8CBE0OsDqQWv8BDvlInpBGCl_qwmPXSXDrQgH_b4OWTh9LSxYWDfBTUdYS42A2xiIw5J->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudeifecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffogggtgfesthhqredtredtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepveduudegveegveduudejhfetfefhtdeivdefhefgfeevkeevjeffkeegudeh
 uedtnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpihhnfhhrrgguvggrugdrohhrgh
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhs
 sehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ddy0YqGFvSfcCfSSA6peGF8OwfnOwZtNcSeHo_Nz3E1U5WP79ZzRxQ>
 <xmx:ddy0YuVPcDz-4-6CfYkkI2j456X5zFMIg5JookEmnOo44hK-bAhfrQ>
 <xmx:ddy0YtNenGHkmgvyDOE4usGRw4JeJ_vyiymiTAr9ooGRPootHba2jQ>
 <xmx:dty0YnXsWmHMD2o_7Pjz7SxmaIZXaltQ90LYmM1bigYNfCSEPa-2pw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 17:34:43 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 00/15] hw/nvme updates
Date: Thu, 23 Jun 2022 23:34:27 +0200
Message-Id: <20220623213442.67789-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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

From: Klaus Jensen <k.jensen@samsung.com>=0D

Hi,=0D
=0D
The following changes since commit 7db86fe2ed220c196061824e652b94e7a2acbabf=
:=0D
=0D
  Merge tag 'pull-migration-20220623b' of https://gitlab.com/dagrh/qemu int=
o staging (2022-06-23 10:14:20 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request=0D
=0D
for you to fetch changes up to 98836e8e012a959ec515c041e4fdd7f2ae87ae16:=0D
=0D
  hw/nvme: clear aen mask on reset (2022-06-23 23:24:29 +0200)=0D
=0D
----------------------------------------------------------------=0D
hw/nvme updates=0D
=0D
- sriov functionality=0D
- odd fixes=0D
=0D
----------------------------------------------------------------=0D
=0D
Klaus Jensen (3):=0D
  hw/nvme: clean up CC register write logic=0D
  Revert "hw/block/nvme: add support for sgl bit bucket descriptor"=0D
  hw/nvme: clear aen mask on reset=0D
=0D
Lukasz Maniak (4):=0D
  hw/nvme: Add support for SR-IOV=0D
  hw/nvme: Add support for Primary Controller Capabilities=0D
  hw/nvme: Add support for Secondary Controller List=0D
  docs: Add documentation for SR-IOV and Virtualization Enhancements=0D
=0D
=C5=81ukasz Gieryk (8):=0D
  hw/nvme: Implement the Function Level Reset=0D
  hw/nvme: Make max_ioqpairs and msix_qsize configurable in runtime=0D
  hw/nvme: Remove reg_size variable and update BAR0 size calculation=0D
  hw/nvme: Calculate BAR attributes in a function=0D
  hw/nvme: Initialize capability structures for primary/secondary=0D
    controllers=0D
  hw/nvme: Add support for the Virtualization Management command=0D
  hw/nvme: Update the initalization place for the AER queue=0D
  hw/acpi: Make the PCI hot-plug aware of SR-IOV=0D
=0D
 docs/system/devices/nvme.rst |  82 ++++=0D
 hw/acpi/pcihp.c              |   6 +-=0D
 hw/nvme/ctrl.c               | 743 ++++++++++++++++++++++++++++++-----=0D
 hw/nvme/ns.c                 |   2 +-=0D
 hw/nvme/nvme.h               |  55 ++-=0D
 hw/nvme/subsys.c             |  75 +++-=0D
 hw/nvme/trace-events         |   6 +=0D
 include/block/nvme.h         |  65 +++=0D
 include/hw/pci/pci_ids.h     |   1 +=0D
 9 files changed, 933 insertions(+), 102 deletions(-)=0D
=0D
-- =0D
2.36.1=0D
=0D

