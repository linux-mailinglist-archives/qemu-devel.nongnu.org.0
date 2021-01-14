Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442542F55D4
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 02:35:29 +0100 (CET)
Received: from localhost ([::1]:47804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzrXs-0002XW-9X
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 20:35:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kzrVM-0001Ik-He
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 20:32:52 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:48107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kzrVK-0005MD-Vn
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 20:32:52 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0AF6B5805BF;
 Wed, 13 Jan 2021 20:32:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 13 Jan 2021 20:32:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=qeyTrngtAc2x43R4/IoRDB3MK/
 kEFV16htOKUhNAA/s=; b=qleJSlXf5hEivOhHUbwIszLzju88Bs5btK/VnqIVDq
 /o/seFn1+0AwxsgkLcC9ho9VskpsrEpQkN4d6et1BG14MytvjjH0G6zg9pzoec8l
 nnEMWNyiK8spodu8bxrbuSpaiBJVy8lhHLNoN5muzqp53Iw3iq9h6EIbsp2k/Jwr
 FjIGOsqRnhJeDCpCkHwNIgZ7KC/z7yn/v1S8UuHf6ODzIj/eeKFdlGKc+3am/oGo
 w14wpmoLbl9jts2O3Bajrio5OloGrt8lqf7Qlx+EW4ePRaMvTkDTNb6EY1sB59Nc
 UibyypRYDvxs/bHEc6FB7ePnSEHhK/wISl0MhHKBvaEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=qeyTrngtAc2x43R4/
 IoRDB3MK/kEFV16htOKUhNAA/s=; b=kQcoWX60TBqdnVM3F5IbO17RxQMTeC2d5
 Naeo9xTZQAlEUgFR6EavBgtvRt/OEi6NPbEfwE6jUY3V4GFzf6alafl+aHYF1oSn
 g1MDqm7Ae4DL5ybwwbJMgk0q15a1Sx1kxyDIcgYRdrqA2h+aC53fb/e9oNEQPlHO
 VP/begMhgQTCfRowkyBqKx1NudECeeI7zi57FYnK1bfQO17abiPUtbaAEkrsTEIz
 CjLmoEHi/tKugtv6JD4pnNIu/ZD1FPwSFVyjJ3xNyhgw/rR+TVwYQ8/X6jz4QfNl
 J43UmEo5ICVnD0Kj+HEiaR+GiWWBtHwW1G49H9PWghhJuMVQhieDw==
X-ME-Sender: <xms:QZ__X-CPNqdcbeIXj9d_KdqEA7-SemjASanLS97-Q_SbrgHVbHb0eg>
 <xme:QZ__X4ie9GHjlnvkLuXdwHKPPzJ0b4bCtJU_vGp1D5xniSSYXG2H647REjMVNikUI
 6jq7fBt3HETv28JdcY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtdeggdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheplfhirgiguhhnucgj
 rghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenucggtffrrg
 htthgvrhhnpefhjedtkedtueehtdeifeetkeevffetjeetfeegkeevgefftedvudfgleei
 hfdtudenucfkphepuddujedrudefiedrkedrudeggeenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghho
 rghtrdgtohhm
X-ME-Proxy: <xmx:QZ__XxkIVoiQPw1rY7JG0Izql_NzcG4JTbxVyqOSW4wqM4zT7k97bw>
 <xmx:QZ__X8xU18Hg05bWS3hV-Uw8jKo2XirFtrbN0EHX-neKcHbSuuU1eA>
 <xmx:QZ__XzQnMk9q9EPRlPeXKn8rtrEtJrIhDn_k5c_dZblSX1Wbzjv2ZQ>
 <xmx:QZ__X9djxeTzD9HMV8iCdN5uMOx0KnZbtb4KJzHAGI2BTg_yzIDVMw>
Received: from localhost.localdomain (unknown [117.136.8.144])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3AF50108005F;
 Wed, 13 Jan 2021 20:32:45 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] loongson3_virt TCG SMP support
Date: Thu, 14 Jan 2021 09:31:45 +0800
Message-Id: <20210114013147.92962-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.230;
 envelope-from=jiaxun.yang@flygoat.com; helo=new4-smtp.messagingengine.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
 - Use enum instead of define (f4bug)
 - Comment about num mbox (f4bug)
 - Use trace instead of log (f4bug)
 - Correct register size (f4bug)


Jiaxun Yang (2):
  hw/intc: Add Loongson Inter Processor Interrupt controller
  hw/mips/loongson3_virt: Add TCG SMP support

 hw/mips/loongson3_bootp.h      |   1 +
 include/hw/intc/loongson_ipi.h |  20 ++++
 hw/intc/loongson_ipi.c         | 174 +++++++++++++++++++++++++++++++++
 hw/mips/loongson3_virt.c       |  20 +++-
 hw/intc/Kconfig                |   3 +
 hw/intc/meson.build            |   1 +
 hw/intc/trace-events           |   4 +
 hw/mips/Kconfig                |   1 +
 8 files changed, 223 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/intc/loongson_ipi.h
 create mode 100644 hw/intc/loongson_ipi.c

-- 
2.30.0


