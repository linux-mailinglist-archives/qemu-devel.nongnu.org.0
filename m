Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9BB2F9742
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 02:19:02 +0100 (CET)
Received: from localhost ([::1]:60082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1JC8-0008Dc-Ns
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 20:19:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1JAZ-0007R1-DY
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 20:17:23 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:34805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1JAY-0007GE-0B
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 20:17:23 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 246A611CB;
 Sun, 17 Jan 2021 20:17:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sun, 17 Jan 2021 20:17:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=QGHT/C1c70n57YdXb7hfLDPYOL
 s335eRF/eZzqHkBOE=; b=Llwv0O3AwD9/i7mPa5ny1mmHhWuNLimGT1/1vo7VXq
 4vJjLUjLKQQWB/ZGIdRd7hQ3LQNGdjZwLtz1n7AbT/xs8SC4++mC+V91ntA8TVao
 2f5sFOO5hvOJBPvZpWjKfVKHBsZqC3YoMRUFPcG8avRXQTbm/teIFLJVU4wsqXjp
 QYI7SDzyRzYMIeE3Ze0gjDRwmPNsV0SYyNJbPiS/Bp7K5AE++xs8XhYB5Y3Kw6oT
 aRziDjaYxO/JfWf26QL4KsO4j1cxjkMm5VISVpHupAYkOZe91ulcr7pe9wCjyVsp
 CLvbvpsQgaL3OrsfeVabi+8mwvP5NDZOytROp0+8pLSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=QGHT/C1c70n57YdXb
 7hfLDPYOLs335eRF/eZzqHkBOE=; b=OxwX1j6ZuTHmpqwdisu6SwuTvIDPM7N8E
 9q+o/dibpySH/DFCEYaGNnVGhnsl2vtZ3AFNJYheM2/SeXksmXjPAls0dlqBmTNi
 DAJk6NiyivS0rFY1N3Jz7VfT8aITLcD3UzKYcTvx7oi/OKnYQZ1EMsgaJKYeWWKX
 2OlCnoyjIsvvifXv/HC0gL1ag/6q9gjc9pRzAWN0NDQBMaDfw0d+rV2jq/9FA84y
 if5WE/1DalSSy8JGCFmwYi3EseVNy67uRHM98u3JpubRVOMfBf9eJon38b8yN6JQ
 s4AppXEYJZZLMei8u7lJMER4tZvNN2DSvwwuF1TxXZTR0BiGYyg9Q==
X-ME-Sender: <xms:nuEEYLGhFmvA2boZN7q6yy9ZMv_OKunx73E9x6Anwq3db_DDon7_AQ>
 <xme:nuEEYIX6CcPoPG6yvTJBTXCcudOAzEr5HCsc7gD7IkJyuCazdORXanbpyI1Kqtdbc
 G9JE1p8N9xA_yVke0E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheplfhirgiguhhnucgj
 rghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenucggtffrrg
 htthgvrhhnpefhjedtkedtueehtdeifeetkeevffetjeetfeegkeevgefftedvudfgleei
 hfdtudenucfkphepudduiedrvddvkedrkeegrddvnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgr
 thdrtghomh
X-ME-Proxy: <xmx:nuEEYNKAT0IWVOdgd8QgLNr3UALEhbXqgR0sAadlVhukHz9x-OmN7w>
 <xmx:nuEEYJHxEcz6RF7LeRoSG3zZ_awq-ly_cuR-bS4IE01vd9FE813DyQ>
 <xmx:nuEEYBXlm66tSy5J9aQPqvswUPFlrW88Y5aZxciA5Oi3lszGL9yzyg>
 <xmx:n-EEYAc-pYcDLYfSxka0TiA4LMRJtiKRvYhKCHnxCoO2g-qfC1pdS_lFimE>
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5FA3024005D;
 Sun, 17 Jan 2021 20:17:16 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] loongson3_virt TCG SMP support
Date: Mon, 18 Jan 2021 09:17:04 +0800
Message-Id: <20210118011706.22639-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26;
 envelope-from=jiaxun.yang@flygoat.com; helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
 - Use enum instead of define (f4bug)
 - Comment about num mbox (f4bug)
 - Use trace instead of log (f4bug)
 - Correct register size (f4bug)

v3:
 - Add more definitions (f4bug)

Jiaxun Yang (2):
  hw/intc: Add Loongson Inter Processor Interrupt controller
  hw/mips/loongson3_virt: Add TCG SMP support

 hw/mips/loongson3_bootp.h      |   1 +
 include/hw/intc/loongson_ipi.h |  20 ++++
 hw/intc/loongson_ipi.c         | 174 +++++++++++++++++++++++++++++++++
 hw/mips/loongson3_virt.c       |  41 ++++++--
 hw/intc/Kconfig                |   3 +
 hw/intc/meson.build            |   1 +
 hw/intc/trace-events           |   4 +
 hw/mips/Kconfig                |   1 +
 8 files changed, 238 insertions(+), 7 deletions(-)
 create mode 100644 include/hw/intc/loongson_ipi.h
 create mode 100644 hw/intc/loongson_ipi.c

-- 
2.30.0


