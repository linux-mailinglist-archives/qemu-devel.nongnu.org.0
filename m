Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E3C6AAD00
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 23:39:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYaW5-0001cM-5A; Sat, 04 Mar 2023 17:38:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pYaW2-0001bY-SC
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 17:38:10 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pYaW0-0005qW-Rd
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 17:38:10 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C47A05C00D6;
 Sat,  4 Mar 2023 17:38:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 04 Mar 2023 17:38:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1677969487; x=1678055887; bh=NtBil4FJ4Y
 q2Yz6MSMZPiuhhP9ngUJxuQrltUpNWXys=; b=mNNHAwDSWMhxTTsbHPtedkeyZY
 RaR0SaH14AuJAAkC+6Yt+LxRjoEm6p5cUVZz+QrwFg6pIlShlOKM0HDlubAbsblm
 1eodPN1HagLDCz9So0POI+QvdIhHllCqjddOgFIL3K6MmG5rGwaOmJY6ZPn0DP0+
 bvnHrO1npADXVU4q9ZNwT5hphlqFF/oZPj4hwGS3VoeSBBIaSgCKR4uXSZjvl3bA
 LWlHP8vcisF8qEcnVtGKfG4rqH8aZQ3YoARzJctQIq49l01IRLCbF4ufyT571eEU
 Rdekws/hONnDZagQkpuAZTupnnVRYAKiC95GQWpxJNiNY/+NOXEmqGMBzOvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1677969487; x=1678055887; bh=NtBil4FJ4Yq2Y
 z6MSMZPiuhhP9ngUJxuQrltUpNWXys=; b=N2ajT7ORIjTAZfFri+fLBuWy+BdgP
 RQWGA0abWaDOD7E32lyCJ2NklFTGDJZcccKkDHN9MIOaTDZTBN9hlgEv6YhNHWTj
 wW6RepNo/61/6ScV2/g1TLnNW73yrTdZ0XIV1t8TMpYdjZLkQwaIytxETqmiW9Xc
 5W0t2Bvw2oriskHKN6gCSB0DP2gAkuqgG8W9gbcVj9dP+YbBncVOJzoqmTn0VwDC
 GT1DOvDf1hGMdRuxxFAPULGTtlCVwIKA17yrWedATBTentuoc77C3TOuT9LObsqn
 Dz3KN55N8e6mKRTVMXytJUgNPPjnsmbw1NrtWmhnpgjF3953guDi1JMTQ==
X-ME-Sender: <xms:T8gDZCmt24nyt_HuRaae7qxCKweqsnNza_188dqhjYGl43oWsqvLbg>
 <xme:T8gDZJ2s3Yfda2uZvaAyPRZU3HJq4AWUyS4XjdYSDn0-qxYrpYef1Ei9h_FuYodcs
 VEkSB6qpIKMG6VgtaQ>
X-ME-Received: <xmr:T8gDZArlk0BBwQS2HvZFuPvEqkbaKeZqYc3FgUWqobQ49zM5SQzz-Q-WpVsi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtuddgudeitdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
 dtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
 sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpedvueetkeeluedugfeute
 ehtddutdfhtdelffeghfeiheefieegvddtueevteeiudenucffohhmrghinhepkhgvrhhn
 vghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:T8gDZGnt2nSNh8uqaKx72cBz_QHx6veegeFDb7Grar5uXxQfIr-KIA>
 <xmx:T8gDZA0wk5naltgvVTDCJZXWROGNToB8Ef1nT3LE9dZsYlqADQMheQ>
 <xmx:T8gDZNu_ubO_MPW177fSq4Q_EzeBAC5bkXOkTOyYYRzbjEPFzE0zsA>
 <xmx:T8gDZF_ZEKcV7ZtIb-abUBpwge7e5B5ICunGq2drfD1h341VEO4pjA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Mar 2023 17:38:07 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 0/2] MIPS Virt machine
Date: Sat,  4 Mar 2023 22:38:01 +0000
Message-Id: <20230304223803.55764-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=jiaxun.yang@flygoat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi there,

This patchset is to add a new machine type for MIPS architecture, which
is purely a VirtIO machine.

It is design to utilize existing VirtIO infrastures but also comptitable
with MIPS's existing internal simulation tools.

It should be able to cooperate with any MIPS core and boot Generic MIPS
kernel.

Kernel patch available at: https://lore.kernel.org/linux-mips/20230304221524.47160-1-jiaxun.yang@flygoat.com/

Thanks

Jiaxun Yang (2):
  hw/misc: Add MIPS Trickbox device
  hw/mips: Add MIPS virt board

 MAINTAINERS                             |   7 +
 configs/devices/mips-softmmu/common.mak |   1 +
 docs/system/target-mips.rst             |  22 +
 hw/mips/Kconfig                         |  17 +
 hw/mips/meson.build                     |   1 +
 hw/mips/virt.c                          | 916 ++++++++++++++++++++++++
 hw/misc/Kconfig                         |   3 +
 hw/misc/meson.build                     |   1 +
 hw/misc/mips_trickbox.c                 |  97 +++
 hw/misc/trace-events                    |   4 +
 include/hw/misc/mips_trickbox.h         |  41 ++
 11 files changed, 1110 insertions(+)
 create mode 100644 hw/mips/virt.c
 create mode 100644 hw/misc/mips_trickbox.c
 create mode 100644 include/hw/misc/mips_trickbox.h

-- 
2.37.1 (Apple Git-137.1)


