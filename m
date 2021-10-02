Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1455441FDC6
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 20:49:31 +0200 (CEST)
Received: from localhost ([::1]:34826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWk4f-0001Px-8w
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 14:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mWk1L-0007Hm-3r
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 14:46:03 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:36885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mWk1I-0006hQ-OZ
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 14:46:02 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 075285C0094;
 Sat,  2 Oct 2021 14:45:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sat, 02 Oct 2021 14:45:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm3; bh=I8cMGbCuTrnJovdrmH3Dk1lVnt
 s7lMd7J1Ltg2Elcmc=; b=G2urXrO/MiVtFFcLVwq5tmIdRJXKcxRzjhWuP1IHnn
 tBgRzzIHlSj8MazF4WtUdrDzMMP2pS4WnlCEAtBjHQkC9cUYoLYMHrN43tTyDN7F
 PwHUs3jSGdEhfJ6ubHAbBqKrx5U4HenxP4/xRQ7CXwdZF+qjjev0ET9mi3FCxDdv
 qT6vS5KWHuFAJlbRm2XicysZiQWAxG6oXWa6vBxY9cWNeAQzRL19BZPHA3n9Irlt
 mkkkwRMGKVadblQLnZWA9yp6cKVCY7hhGyY4Ux4lw1CkbAklGdsrz4u+7gNC+D4S
 AsE23zTTrQcERxrvap0D7PdZEQOws+T7+FtfpvLfwKFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=I8cMGb
 CuTrnJovdrmH3Dk1lVnts7lMd7J1Ltg2Elcmc=; b=KVPaEr1PDnu3iezjCooomg
 HSGmwqtbUCGH195wF4B3p0WcFy2kNKeuOFP3SI4FPeMHmI2OawhD6Qeus0q18ACn
 Id8feKddhXDOvZH1RoRg79Q8yp4E1JOR3sYS4nu4qK4gWKKPxbuStEVLmqCJP4gY
 8p0/zYo2CMvH791uXqw6wgJqwCZgEBjGvDz2IvnMQfLkcnJj3rvKOW/hj9QZEjEC
 IjHFnAQOPlpNpMuwCeie/jMO9qDYUZk48vrEkrtEa1FbcDNRATsWHblI3gnEWiLq
 pphYSMFwWaL+Q2P1Ntv6Nb0KZuqEytrdlzNxzmlEH7a85cCqIpiMRcungOVZJqFQ
 ==
X-ME-Sender: <xms:46hYYUCWDJteED7NG3T4F700bzigA6f5fzwmQ0iwSDN9nQ5mrXeRFw>
 <xme:46hYYWiVT57LdF0BiW6ZHG7OGcFUunkGOj2uXVNdWKj9PuRfQVcLhn_fwUB6mZqU4
 VK4DMqKS2K3jEd6XVY>
X-ME-Received: <xmr:46hYYXllXstYknUGHbOY0xymz-UHKaUxgmxc2SjWUvQj7oTrQHq9tFyV3KOtDk3ojrU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekkedguddvjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffogggtgfesthekre
 dtredtjeenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
 sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeevgeeufeegledttedutd
 etteefkedugeetvdffgefhledugeefgedthedvgeevleenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihgh
 horghtrdgtohhm
X-ME-Proxy: <xmx:46hYYaxWyyTwYSmFoFyH6vk4_D91ub7ctC_XSElO6y45F6FPU4SHZg>
 <xmx:46hYYZQzRqXYfx-2t0VjSl3Wj70TBtJFG_M0_ljyYkNSrz_Qx2ry7Q>
 <xmx:46hYYVaKkdYHvzLNBQpqvpY5aO_c2RwiV5wV3fbMCdHav1sDee8Hlg>
 <xmx:5KhYYXMr_iGUldqrrnF2RBdCqlJARSCUXR1UZKFuW8JfI7GH17opLw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 Oct 2021 14:45:54 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] hw/mips/boston: ELF kernel support
Date: Sat,  2 Oct 2021 19:45:36 +0100
Message-Id: <20211002184539.169-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=jiaxun.yang@flygoat.com;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: aleksandar.rikalo@syrmia.com, f4bug@amsat.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jiaxun Yang (3):
  hw/mips/boston: Massage memory map information
  hw/mips/boston: Allow loading elf kernel and dtb
  hw/mips/boston: Add FDT generator

 hw/mips/boston.c | 348 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 320 insertions(+), 28 deletions(-)

-- 
2.30.2


