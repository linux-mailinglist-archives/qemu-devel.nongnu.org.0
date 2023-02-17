Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18E869AB0A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 13:09:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSzWr-0005Bv-Ba; Fri, 17 Feb 2023 07:07:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pSzWo-0005B3-Gt; Fri, 17 Feb 2023 07:07:50 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pSzWm-0003Ph-DG; Fri, 17 Feb 2023 07:07:50 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id D26035C00C3;
 Fri, 17 Feb 2023 07:07:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 17 Feb 2023 07:07:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defmacro.it; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1676635666; x=1676722066; bh=2ZTG+W9VeQ
 5VLa5/MXWjXuP/9fmriiJMiXu6chYH4gQ=; b=NEjCHaXlfr0EkhF7oPSYTOQjdu
 hcfQE/zrM0tVPwjlgMteVaEbR8URbHERMM7Wsi7DlySXPMTHLutMmw1lCaZAS2G4
 68IaCbgyXKk2NUFtpMiPJkE480kIUfytQX+7oHvSbdcIr7RKalZAmZTlxciul9iC
 5LItD0ijDIH0n4HEKskFwb9NbyyKKBYeetpFOARV0hnTcOzZviQEFtF2Wh/aI/mn
 FR7zfvqGolJMlWhCuCoEUIdEPrgB0cvqIc9Lxh0d6NfBc9KqF90Pc0DUEGJaoOya
 sydmH1ReiYicx+RkhExUeccA37v7Hdq27cAjsxjRLZHM+ElvbsQWFXcufeLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1676635666; x=1676722066; bh=2ZTG+W9VeQ5VL
 a5/MXWjXuP/9fmriiJMiXu6chYH4gQ=; b=KzNoWCgkVJy4Nj7j5AVdWEfTZsEC5
 7QpxinZ7s2Yq49mi5VmUNbcf6pZOUc1z1Z0HL9RMfuhgFGW0np8CkjoYQnyzDDa+
 UrnxyqqVQy9q+wsRiHMW//7rcFNSvCori+3mp0Il6F65ksSbJMBQTsfkhTH7+DXe
 rxG3Lj/SCPEfwvMEceGV6Sbm7mfNDgblGnXTtNUv8Yfglu4FaxB8vZfu3RiLBlyO
 eZF7t+WBPwq2j3kuj+xebw50WqAt8eHsPEzPdawjKdqnSBLEnkeLDAq+PEAOKkuK
 nhJaq7Anaqr3t/pgk7VuTtvbjRRnO+eGaPcz56XWWdTjy4mnq7aCBqBBQ==
X-ME-Sender: <xms:EW7vY5MM-enxx7RW4emw4HA0opeIe1GNw0-12rHfHgzW3orOqQRauQ>
 <xme:EW7vY7-I0LkCZlRX5BAkOtav8h8fw44UwDDwDPASL611JDOohfrd-WmI1YOjuTsTZ
 auKhyGucqgZgWL4Jiw>
X-ME-Received: <xmr:EW7vY4QrGiKXDe4WbgTSJugDgP_r-5Nsq7CWtIpInqKCoYj7IKewxCv1lQNVYFKG1B8q97T54471kcjj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeiledgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgtggfgsehtkeertdertdejnecuhfhrohhmpeflvghsphgv
 rhcuffgvvhgrnhhtihgvrhcuoehjfiguseguvghfmhgrtghrohdrihhtqeenucggtffrrg
 htthgvrhhnpeffgffftdefffelgeeggfehgeekkeffveeghfetgfdtteeuuedtkeeugedv
 vdegheenucffohhmrghinhepnhhvmhgvgihprhgvshhsrdhorhhgnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhifugesuggvfhhmrggtrhho
 rdhith
X-ME-Proxy: <xmx:EW7vY1uL0OKKNkdVjCCQrcOwHvJSbfS5HAlEmopHdmhfMXPpjdXhEw>
 <xmx:EW7vYxfcJo6gYMQ4DIkAJ9wvZ5NqStqYtMUZQcZPcx8I8YoapKBFmA>
 <xmx:EW7vYx38Ysg-_4qzM3tZkKwXkYOgeWVYTiuVSPEE-df-6YmPVC99kg>
 <xmx:Em7vY944W5obARzr0qQ_HswvHXc5sqh6PqFrAy44MZ_ppXDWUbylrQ>
Feedback-ID: i0f41475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Feb 2023 07:07:44 -0500 (EST)
From: Jesper Devantier <jwd@defmacro.it>
To: qemu-devel@nongnu.org,
	jwd@defmacro.it
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Fam Zheng <fam@euphon.net>,
 Jesper Wendel Devantier <j.devantier@samsung.com>
Subject: [PATCH v2 0/5] Support Flexible Data Placement (FDP)
Date: Fri, 17 Feb 2023 13:07:38 +0100
Message-Id: <20230217120743.308632-1-jwd@defmacro.it>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=jwd@defmacro.it;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jesper Wendel Devantier <j.devantier@samsung.com>

Flexible Data Placement (FDP) is a newly introduced enhancement
of the NVM command set introduced by the NVM Express, Inc.
organization as TP 4146. FDP aims to extend the NVM command set
to enable host-guided data placement. FDP-enabled namespaces
can be used as before, but writes may now reference a specific
placement id which in turn points to a reclaim unit (RU). RUs
are defined as some amount of physical, non-volatile storage which
can be erased/reused/repurposed without disturbing any other
reclaim units.

For further details on FDP, consult the specification, which is
available as "TP4146 Flexible Data Placement 2022.11.30 Ratified.pdf"
in the following link:
https://nvmexpress.org/wp-content/uploads/NVM-Express-2.0-Ratified-TPs_20230111.zip

The FDP work builds on 4 preparatory patches, chiefly to add support for
endurance groups and directives.
The final patch adds FDP support itself.

Changelog:
==========

* v1 -> v2:
  - "hw/nvme: add fleible...": check that max 128 placement handles
    are being created (Keith)
  - removed unused NVMe directives struct (Keith)

Gollu Appalanaidu (1):
  hw/nvme: basic directives support

Jesper Devantier (1):
  hw/nvme: flexible data placement emulation

Joel Granados (1):
  hw/nvme: move adjustment of data_units{read,written}

Klaus Jensen (1):
  hw/nvme: add basic endurance group support

Niklas Cassel (1):
  hw/nvme: store a pointer to the NvmeSubsystem in the NvmeNamespace

 hw/nvme/ctrl.c       | 803 ++++++++++++++++++++++++++++++++++++++++++-
 hw/nvme/ns.c         | 146 ++++++++
 hw/nvme/nvme.h       |  92 ++++-
 hw/nvme/subsys.c     |  94 ++++-
 hw/nvme/trace-events |   5 +
 include/block/nvme.h | 236 ++++++++++++-
 6 files changed, 1349 insertions(+), 27 deletions(-)

-- 
2.39.1


