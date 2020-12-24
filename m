Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C872E240B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 04:23:50 +0100 (CET)
Received: from localhost ([::1]:52296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksHED-0006CJ-Cu
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 22:23:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ksH9B-0001h3-PJ
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 22:18:37 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:45063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ksH99-0003ez-P4
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 22:18:37 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3A37958037C;
 Wed, 23 Dec 2020 22:18:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 23 Dec 2020 22:18:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=FU4aJSFS5rFt3
 bqnOeKFgnYE4Dzduj1nMiub1KL2uww=; b=X1yafc7oTjHA2jsY7Oz4xni54/NhD
 tBLrlnFkFILmNOjLUtREcZ/OLPLaTgxNeqw44LEC+ScO99Xqo0TRnGiWZxPtcshX
 YLTLA8XDQpYeQuEYy/+n+R8zQbmsujCtApugErXeHucfecj2DTWawGrg+Ser1zA5
 +u5c/rPgySKWO83k/BfmnDbDDSsSGXqXpjQHk4wWrWEbL1ke5JYbQPuQuo6Z1RyP
 DoGTmLsifUjNfdKAmjCh4ipnoWU/njt0p8tfmuFVwd8dHOVByEjD5G2wfAaiGWwj
 gE3FOiYsV439P0CgnCSg49p38xX60f03xwvMqP29d10Z7kxIx95jsPnyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=FU4aJSFS5rFt3bqnOeKFgnYE4Dzduj1nMiub1KL2uww=; b=NbYuGM5z
 T2pXNqmn6l/VDECQeHHrRT/TZR25A0mwe/RhOHzLyCRp3QWrOadF2ISfvp0qB5uM
 3p7W7ZJmLnOsqxDH21foLr/hBfpR+VW3jpu/vApVthGlKXM6FmsafgcKHrlPfyGS
 ojTpG1VxKcAXtqCn/HcfJmHLBAKdAGmT41h0EwN6fudFtZdvP3FzrkO6uGHda4jY
 Nj1gyTctzejxEE2MG9c14WtB8TV8pN1TosSz2mazsNilNouNbxGXM5EwgUwJCsC6
 WhvzNPhC9oV8VBywxknh7mtpgN0sa2ligaDkpslYle3JNRO1zDNq/0Y5lQ2c79/i
 8fNlF9LF1ZxgrQ==
X-ME-Sender: <xms:igjkX8eJjh95CYEDjdoCsVANLT1W8A0xJA-c3JwjIGIOLZ35viPm9A>
 <xme:igjkX-OP41yM4J1YOnXOWf8Nujvj0IWImYqzl-jhI9zr1ciafa0__q0_RDeeoSide
 qu7D_I0EHgaztLbzyM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtkedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepjeeihffgteelkeelffdukedtheevudejvdegkeekjeefhffhhfet
 udetgfdtffeunecukfhppedvvdefrddutdegrddvuddvrdehleenucevlhhushhtvghruf
 hiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehf
 lhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:igjkX9iNznak5_-Fy_XiFCuUUjFlOeijac7W4G9LkMU5KNFBDhIwnQ>
 <xmx:igjkXx_hZYHYD0sFZ-0T6RTm9Rdsu7QZVVCOuGVFxSTkn4MnMm-ghw>
 <xmx:igjkX4t4ekce4Z4xG8vDiWNKY0lNxiabmMfsJcDrQJOtcjfoD2THew>
 <xmx:iwjkX6IVC7BPnBu1gYZ6cO_jbd067p91bj9s5LcGhUIVwtAj_zv2TUBijxE>
Received: from localhost.localdomain (unknown [223.104.212.59])
 by mail.messagingengine.com (Postfix) with ESMTPA id F00C0108005F;
 Wed, 23 Dec 2020 22:18:30 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/8] hw/mips/fuloong2e: Remove unused env entry
Date: Thu, 24 Dec 2020 11:17:47 +0800
Message-Id: <20201224031750.52146-6-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201224031750.52146-1-jiaxun.yang@flygoat.com>
References: <20201224031750.52146-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
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

modetty is not handled by kernel and the parameter
here seems unreasonable.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v3: Bring busclock back
---
 hw/mips/fuloong2e.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index d846ef7b00..c4843dd15e 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -159,10 +159,8 @@ static uint64_t load_kernel(CPUMIPSState *env)
     }
 
     /* Setup minimum environment variables */
-    prom_set(prom_buf, index++, "busclock=33000000");
     prom_set(prom_buf, index++, "cpuclock=100000000");
     prom_set(prom_buf, index++, "memsize=%"PRIi64, loaderparams.ram_size / MiB);
-    prom_set(prom_buf, index++, "modetty0=38400n8r");
     prom_set(prom_buf, index++, NULL);
 
     rom_add_blob_fixed("prom", prom_buf, prom_size, ENVP_PADDR);
-- 
2.29.2


