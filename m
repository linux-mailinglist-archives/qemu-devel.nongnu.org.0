Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDF3456B94
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 09:24:17 +0100 (CET)
Received: from localhost ([::1]:38596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnzBw-000185-4Q
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 03:24:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mnyyL-0006yQ-1H; Fri, 19 Nov 2021 03:10:13 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:36917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mnyyB-00058T-DI; Fri, 19 Nov 2021 03:10:12 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id D6DFA5C0131;
 Fri, 19 Nov 2021 03:09:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 19 Nov 2021 03:09:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm1; bh=tsyGr6u10BDqLvmDfT4Weim1Bv
 Sh6xLdgh9rCm75wdg=; b=lFbNBAwnUWferadmT9TUKAf8Bx0ORpa3EzyFMvy92X
 gNwOKjB9JmnQ3SSrkwAUudvHNokrJsTymadR09RHO6aa63coehckOWSkICahdrzE
 sZFAUZ06zEc2FoTvojD7oOsf13sUtr64P7aU72FKJ5d5DtC8tE3jazdWGyFz0pef
 3t7yUmNeVXOFd7mIVifNnjC+hxDSfkblaUi3nJHbApDyOe5sZiHxQLRIHs4flSND
 FI7FukJKNQNDo1nEG0oEIHX0+QUnwQZoP9qqN3pKW5vCdRXZmckv4ELSllIBr8t0
 wwq+cceQC0z9FxuBmXz06vcCm2mOBu0LLo/QbRFEKdaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=tsyGr6
 u10BDqLvmDfT4Weim1BvSh6xLdgh9rCm75wdg=; b=e/2F9/nqKCpRoNihsrHFki
 DabZ+VMhitdmoDdp+0aR5qyqOhBVB9kzEJZeuYEC648u2iioMuvr0RMLgCna3ej4
 MXIlmWUHcdt2foRLEz9R2wzP7YbsOK71ClXSFE2TUZXmc5cMo/knF7zNV+TofuXa
 clUpebMFP3PMamEQkb2vvqWOqkYwPpU8Cjm3TVGT33rD/2N3A+85HH0WuonC7dSc
 w5QYnyy5+dAzpglc+2QlODI1Ciyaq3GT9DsuCiK0JRj7Kji4EHwd1/wZepamzWKo
 cHicGGX/fMJY4Gq2lcX3C83i7tKDRVrmspR2KZWVNTrd1ZBB+H4P9q7NzmnyQWvw
 ==
X-ME-Sender: <xms:1VuXYWP5smW5fyNyKTMTcJQI3ZKwcUdpfy9vnnJSNXHsPcvmZSlKSw>
 <xme:1VuXYU89fSLXSb49d4a42x_5OxuRPW1d1FWAocrdulE4U_yqxv6IhIQWlrw8xWRsr
 ngxk981vlPZhoG30s0>
X-ME-Received: <xmr:1VuXYdRsnDIPG2fNtAjrZTwfLf0IWR1CUcacjnHUEgxg4XjJ-sfpfomjTx1OcdVfrLy58sQXPRIPD927JMlU9Vzts4TmDYVPbD_9ML1Xjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeejgdduudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtgfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepvdejvdfhveekuedvvdehueegvdehjedttdejkeelfeeiudetteetfeehvddtveei
 necuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpihhnfhhrrgguvggrugdrohhrghenuc
 evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehi
 rhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:1VuXYWs6tIYHzc_WE5YwPB20VjOWE6OuWXal7XP4X8F6BTy737WlPQ>
 <xmx:1VuXYefFICgtRmpyq_7qPAXsjtkLtGtq3ZbAZCe2_HA_WWQOOJQsFA>
 <xmx:1VuXYa1pnMtIECyinVFqHA1idJ3-ulhlI0WiqJ5RGtHTbCm2PwmsyQ>
 <xmx:1luXYUu5fBaDrDJv1m-rkp0g3WUOj4luhPKrgjt0ovBTFDPcKAsGfg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Nov 2021 03:09:56 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.2 0/3] hw/nvme fixes
Date: Fri, 19 Nov 2021 09:09:51 +0100
Message-Id: <20211119080954.211927-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Hi,=0D
=0D
The following changes since commit 44a3aa0608f01274418487b655d42467c1d8334e=
:=0D
=0D
  Merge tag 'sev-hashes-pull-request' of https://gitlab.com/berrange/qemu i=
nto staging (2021-11-18 15:06:05 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-fixes-for-6.2-pull-reques=
t=0D
=0D
for you to fetch changes up to e2c57529c9306e4c9aac75d9879f6e7699584a22:=0D
=0D
  hw/nvme: fix buffer overrun in nvme_changed_nslist (CVE-2021-3947) (2021-=
11-19 07:32:19 +0100)=0D
=0D
----------------------------------------------------------------=0D
hw/nvme fixes=0D
=0D
* Fix CVE-2021-3947=0D
* Controller hotplugging fixes=0D
=0D
----------------------------------------------------------------=0D
=0D
Hannes Reinecke (1):=0D
  hw/nvme: reattach subsystem namespaces on hotplug=0D
=0D
Klaus Jensen (2):=0D
  hw/nvme: change nvme-ns 'shared' default=0D
  hw/nvme: fix buffer overrun in nvme_changed_nslist (CVE-2021-3947)=0D
=0D
 docs/system/devices/nvme.rst | 24 ++++++++++++++----------=0D
 hw/core/machine.c            |  1 +=0D
 hw/nvme/ctrl.c               |  5 +++++=0D
 hw/nvme/ns.c                 |  8 +-------=0D
 hw/nvme/subsys.c             | 10 +++++++++-=0D
 5 files changed, 30 insertions(+), 18 deletions(-)=0D
=0D
-- =0D
2.34.0=0D
=0D

