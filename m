Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEC92E2406
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 04:21:05 +0100 (CET)
Received: from localhost ([::1]:44684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksHBY-0002wz-5r
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 22:21:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ksH8y-0001Ff-8W
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 22:18:24 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:37673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ksH8w-0003aX-Ay
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 22:18:23 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id A100C580376;
 Wed, 23 Dec 2020 22:18:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 23 Dec 2020 22:18:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 MffFNI7TRJHwRaMmr5C4c4PVgLMilFhSzqJIYp8Weww=; b=gkwKDdKRvpIU9Sxo
 fTXO/l/0SzkuErvDDZylpkN/ot8YrapMBHSC9LB7RIfQ+rT7+i66ZuB6binG0ksp
 Flnmb899+7tW8InOvJB0hsx4665ezxpj4OaX6dkLQFzmyVZcmxuF/8d5MPlruTTk
 K9RfN7e1HCBz+kCNkvr4dBCYYmejangiobC5Uj7GLQuI4M4aW9I/2BLHUl66h4fG
 NSAzR2skv1HCAE9wcgwPKLZUZb8g1Jyk+OCif5gDP0t+FEFEMzC0EOmgL4K31mPS
 7PO0pgjKAR2fqOFBxCMWmI9t54Y3EAT7AiesE9arkh60gaBE/utAKgAdAcgqTMXE
 G5ypvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=MffFNI7TRJHwRaMmr5C4c4PVgLMilFhSzqJIYp8We
 ww=; b=rYiTnJ9Oge6TYLNuSUBbPJOs+aTLDxZYDUPcZpCYWgn+hPF2pGcF29h5B
 OizdqO8x25PTQ6SvdlkFFfeUB/YgzlJ/IkB+wUoPAcpE68F9ZU9LFEEiKnF6AQ1L
 LVnNQXTU7JiIRJlVsIvR/8bt66qELkI+H6okAoyyMfWtRUGO5Xh0F1QfO1GwcPcM
 53RfxMPa6Ut2uYLcfIyzCakFXeG4qPnbvqcg8CHBM4ztSO8h2m6gGtLy2DuiA0rY
 U8ALUPy2+hyHKD9H2+HgiqKNOZrq8i0IvObGfooI5glBUXxiv+t00hv3tK3wh7Lc
 Sql2wLhZ83B5dJjYrMp7fUgEOzwNg==
X-ME-Sender: <xms:fAjkX-YTlvyDm3ui8-NzQ1xhEK_C84WK6URfDYEXBCVP71w9BQgPIQ>
 <xme:fAjkXxY5xXW4guAQ3CTNUmwNvvdFIJDpzDGvrXALXBPJtZDwRG18qmaH1V53cz4CW
 BvEHokNpigbrquc01w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtkedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeelteegfedvgeegtdffudejleeikefhgfelkedugfejledvveet
 tedugeelveffheenucffohhmrghinheplhhinhhugidqmhhiphhsrdhorhhgpdhlohhonh
 hgshhonhguvghvvghlohhpvghrrdgtohhmpdhgihhthhhusgdrtghomhdplhhoohhnghhs
 ohhnrdgtnhdplhgvmhhothgvrdgtohhmnecukfhppedvvdefrddutdegrddvuddvrdehle
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgr
 gihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:fAjkX49q6wH-7RQkicp327bB371-wbMq1sdWGE97PsOgIE9IXRA3CQ>
 <xmx:fAjkXwpFsNXRgZCj0dYCyl67B3wLF9cGd1eIHfRnJds1TbyD5SFK2w>
 <xmx:fAjkX5olkOfQoB6gOHEjuMonpUwuzA8oBgMIOS4lWG53HnDEj9F27w>
 <xmx:fAjkX6kE7hPQu3_ouHQLuPITAQ7Th300vcni75Aa2XVUXyEPUkqL1kdt6LE>
Received: from localhost.localdomain (unknown [223.104.212.59])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1A59C108005F;
 Wed, 23 Dec 2020 22:18:15 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/8] hw/mips/fuloong2e: Relpace fault links
Date: Thu, 24 Dec 2020 11:17:44 +0800
Message-Id: <20201224031750.52146-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201224031750.52146-1-jiaxun.yang@flygoat.com>
References: <20201224031750.52146-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=66.111.4.229;
 envelope-from=jiaxun.yang@flygoat.com; helo=new3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Websites are downing, but GitHub may last forever.
Loongson even doesn't recogonize 2E as their products nowadays..

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/fuloong2e.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 055b99e378..d846ef7b00 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -14,8 +14,8 @@
  * Fuloong 2e mini pc is based on ICT/ST Loongson 2e CPU (MIPS III like, 800MHz)
  * https://www.linux-mips.org/wiki/Fuloong_2E
  *
- * Loongson 2e user manual:
- * http://www.loongsondeveloper.com/doc/Loongson2EUserGuide.pdf
+ * Loongson 2e manuals:
+ * https://github.com/loongson-community/docs/tree/master/2E
  */
 
 #include "qemu/osdep.h"
@@ -61,14 +61,7 @@
  * PMON is not part of qemu and released with BSD license, anyone
  * who want to build a pmon binary please first git-clone the source
  * from the git repository at:
- * http://www.loongson.cn/support/git/pmon
- * Then follow the "Compile Guide" available at:
- * http://dev.lemote.com/code/pmon
- *
- * Notes:
- * 1, don't use the source at http://dev.lemote.com/http_git/pmon.git
- * 2, use "Bonito2edev" to replace "dir_corresponding_to_your_target_hardware"
- * in the "Compile Guide".
+ * https://github.com/loongson-community/pmon
  */
 #define FULOONG_BIOSNAME "pmon_2e.bin"
 
-- 
2.29.2


