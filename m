Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF6F2E2404
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 04:20:53 +0100 (CET)
Received: from localhost ([::1]:43948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksHBK-0002dK-FS
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 22:20:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ksH8s-00019D-6I
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 22:18:18 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:47053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ksH8q-0003YQ-HE
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 22:18:17 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C2B96580372;
 Wed, 23 Dec 2020 22:18:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 23 Dec 2020 22:18:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 DHvt6MI2JLWRt1yuHru/PbKgRfOr7OvUo2XE4nbTxoI=; b=yeqKWEcDjKtzLoHM
 SO+X2mOFFPMOzGRb/KPzdVjx9JZA6I5D0+rtaGMTJS2C2OaEZlFKLCT1HD1Eq7AF
 aKhw40RsrRdD9SanQbX8Xgrr1YeILEVyhJ4Q9pxBbb7xX8lCHVMCUCAaef0O4/WH
 apT3FhuhRoE/sJVBM1B0jrBlfkpa7KZLZKh/53t4bVm6+OXBbWmL26+Pq1VEiSzd
 gMJjOYGFqLBUEWArJnS4NWjuvX1XbwwE1do6V8FIvKxP8exzH1S3TcIprR7E4SsI
 pYlcVba7KZnUiHkm4IdddkZ3NBZKSt0oX/4vFYuqwxlYQWXT3Ir6kDUex+AXMwck
 BLQVNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=DHvt6MI2JLWRt1yuHru/PbKgRfOr7OvUo2XE4nbTx
 oI=; b=HpDNXtymGAUVOk6FkzFwK8j+SGtmkVngoS4fMadKL71x6biVWRIE0wBpl
 IV0UK2OkdJGcOrV9xjUVLZAq5agGpaTDI+DLYacYUPF2S9UvyQR2hrOVE03F6K3z
 iV27gDcOcbBcQE/uG125+6IJBaDjPKnS1WeSmxeE0eary3x8TkufwbrI57hJMYy0
 qMciMLM7tY8DALmh5iDELGNm3CRBKNQYZ11zYTdLHcWAXxT57IqCckByeifJmQe/
 XU7qsXMg68cZBqcrgpF7fnojPMVlNyKkBWBfOiSWWE4AfGg3iMpc/jb6PN3ORCf2
 0ozzdZ5qsidOHe3GQQZTaVZTShKeA==
X-ME-Sender: <xms:dwjkX9Xo-2xE1tiCVAuLPcKsKLO1hL6entT5DWIGiRdGpveuxbaOrQ>
 <xme:dwjkX9mcw1xXU21PkEh2mNC2nUoPOvI5hTzd7rjjl_1MRY3XxBNtoiB9WfJLyeFB_
 oqsNZgDrHOwxXZjYRk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtkedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeehuddvtedtleehhefggeevteekkefhjedvjedtgfeugfekjedt
 vdevueejveekleenucfkphepvddvfedruddtgedrvdduvddrheelnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghes
 fhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:dwjkX5YWofuncEC6MWw1SBzbm9xbXvvxVDWRxSwCGUAnQ50yiNDsmg>
 <xmx:dwjkXwXODAktj28ticXY9_q91noNTskvpvAr4_euRC-LC7p-Vs-KfQ>
 <xmx:dwjkX3n6a9qSbfD2zIeQt3RRdCNuRFrt8qG5vtpeQy32FEdmUvp3uQ>
 <xmx:dwjkXwCiAaXFBH1X9lR3VKE3bzLIrng7-iWmTEaRIJGYN7ohWXEdGtUpWRw>
Received: from localhost.localdomain (unknown [223.104.212.59])
 by mail.messagingengine.com (Postfix) with ESMTPA id 366D31080063;
 Wed, 23 Dec 2020 22:18:10 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/8] hw/mips/fuloong2e: Remove define DEBUG_FULOONG2E_INIT
Date: Thu, 24 Dec 2020 11:17:43 +0800
Message-Id: <20201224031750.52146-2-jiaxun.yang@flygoat.com>
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

Seems useless....

Fixes: 051c190bce5 ("MIPS: Initial support of fulong mini pc (machine construction)")
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
---
 hw/mips/fuloong2e.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 9b0eb8a314..055b99e378 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -48,8 +48,6 @@
 #include "sysemu/reset.h"
 #include "qemu/error-report.h"
 
-#define DEBUG_FULOONG2E_INIT
-
 #define ENVP_PADDR              0x2000
 #define ENVP_VADDR              cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
 #define ENVP_NB_ENTRIES         16
-- 
2.29.2


