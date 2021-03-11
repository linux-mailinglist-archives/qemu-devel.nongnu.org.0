Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C313336C73
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 07:49:36 +0100 (CET)
Received: from localhost ([::1]:46604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKF8Y-0007Nn-FT
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 01:49:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lKEyL-0005hH-9o; Thu, 11 Mar 2021 01:39:01 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:39383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lKEyJ-0008BV-CD; Thu, 11 Mar 2021 01:39:00 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 94F755C00A6;
 Thu, 11 Mar 2021 01:38:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 11 Mar 2021 01:38:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=YlczvsSsOYVm31UFolOnwS0b8h
 0kQEXMoj59VOJ6Euk=; b=MZx/Yyoyry1/tiYZXC5T4GfYln17ub9OMeuhYfm49f
 sx+IxLktP05CEa78iNtDxPZH6xZYhgXRYdSx0c2sAXezJAvjyaj2Ar1myjRZ2zRL
 ykym4e9mwVh/+OIPUz4OYW4lioCao8uAhYJisHCjECwfr+4SvX4ZhlHdTsCw9FlS
 aRD8aXEVqyaR7TLKIZgt7wePFk4K023XchTSWiRcR/LwKCL89xFgIPJQekdzqoTf
 ndYPEUmHRoXn94BmKh+m9ZqzXLAw7UR+tknlP/xugpBo9JBqzT6luJTz+77ETdYO
 c6nEGnvuVWSDoCGMmHczbQ1/W72OBg7o/JNbtEh0xAGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Ylczvs
 SsOYVm31UFolOnwS0b8h0kQEXMoj59VOJ6Euk=; b=CGTVnnfKqbZCnP9NU8mhwA
 s4LpegzthaV7k5Aepq+piLAX96bpLc/CzDuWB3iu0XkpxwYLjYG83A7vPGPk8Uup
 diE1uwMbR8KQUeKn2yKt0mWoC72oxxhr+qvTerW+84iUaaUfhZDgyGdXdTR7Rjsr
 E33XE0jWGMk/JXc3Ik6tOZ+QqcvRcrzQ1BSPlH4FxiX2kCNi7tCynNX4LchdbO+z
 X9mDYwT4YaA31ZuiQ9JIWsmu9scTsZmgwjZF7/C5+vmlzRlj3vzk7MyJfdl4N5a3
 hZyq/fyCDxNIoe69Q0P29ko2pmet9nbHZ7gUvvDyvoxxVfEsqUvb3J/1FlYZCz0A
 ==
X-ME-Sender: <xms:_bpJYE84VvPSpaXI6_AahApjxABI5mos37oUNjYrHM6lGCGQMa2VUg>
 <xme:_bpJYMsPF8WUnOgRPO04UMXv9LK17ayq33YWALMgeNG_1LO0_dX1EOBk4lw1fdd-V
 grHK79QmkhQp627FPM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduledgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhephfegveekiefgkeevvdetjeejkeekudfgvdehieejfffgkeffvdevlefftedvgefh
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:_bpJYKBzhjNB4-FNutT3eHluhLxmyxTLaHQxrg5dTn24-UyWMhjXnw>
 <xmx:_bpJYEdnhFgshPJQcMO1ipA-oU2SnIv8Abglren7Z88mZTEqFfPEDQ>
 <xmx:_bpJYJOH4ahsFV-OA71qaKCbjZwLh1QfpJ6cr_bQDtnw3-x4xNR4Ag>
 <xmx:_7pJYFBPjkT2gmspaotTixbQWg0NxShEba8-eFGH2MWBHwfk0Zwjaw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8683A1080054;
 Thu, 11 Mar 2021 01:38:52 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/block/nvme: add administrative controller support
Date: Thu, 11 Mar 2021 07:38:48 +0100
Message-Id: <20210311063851.757481-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

This series allows the controller to behave as an Administrative=0D
Controller. This is useful when emulating a subsystem.=0D
=0D
Since some commands are prohibited for an Administrative Controller,=0D
this series includes patches that make the CSE log page dynamic and=0D
allows supported features and commands to be fine-tuned with the new=0D
'oncs' and 'oacs' parameters. By default, the device supports as much as=0D
possible.=0D
=0D
Gollu Appalanaidu (2):=0D
  hw/block/nvme: add oncs device parameter=0D
  hw/block/nvme: add oacs device parameter=0D
=0D
Padmakar Kalghatgi (1):=0D
  hw/block/nvme: add administrative controller type=0D
=0D
 hw/block/nvme.h        |  11 +++=0D
 include/block/nvme.h   |   8 ++=0D
 hw/block/nvme-subsys.c |   6 +-=0D
 hw/block/nvme.c        | 193 +++++++++++++++++++++++++++++------------=0D
 4 files changed, 162 insertions(+), 56 deletions(-)=0D
=0D
-- =0D
2.30.1=0D
=0D

