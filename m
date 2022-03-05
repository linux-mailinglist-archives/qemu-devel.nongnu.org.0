Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D031F4CE15C
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 01:08:40 +0100 (CET)
Received: from localhost ([::1]:43674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQHyR-0005O1-V6
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 19:08:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1nQHwu-0003VZ-St; Fri, 04 Mar 2022 19:07:06 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:35319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1nQHws-0004iR-KZ; Fri, 04 Mar 2022 19:07:04 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A13B85C0206;
 Fri,  4 Mar 2022 19:07:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 04 Mar 2022 19:07:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; bh=sbTVhcnKluAr0UEDLlRBsMeSFfp4KXU+k3a1OsX5VHM=; b=jPg+N
 QDRWI/UyxbQ3vNP7vVj7CluhF/KoP+77tWxQvv1cyih38d/9l5GG3lypmflZHXYd
 ajW9FQMZK0yt89UIxLohzUJd9z12wiKBA0Hevq2ul3sPKinBlK5GgV4JRc9JAVg5
 Zb03I+ks3kIodIf2ycrGJygrWwD71VzTUQakdAT4HnJesdDDyZr1ZyO+II3znGer
 yYw9FJoWrDP0Qzmuim0gWexJO0d47E8BqdiliQWAXtgWvR9zv7ZyogX3T0XtJZbB
 eVGOzlwMBSYoyA0aFLoC0e7/DK9xbGHSYyxYyAY/zH9fJJWY3kwoMIhr+EKKISYV
 6bmLvaCK0TJKfXkBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=sbTVhcnKluAr0UEDLlRBsMeSFfp4K
 XU+k3a1OsX5VHM=; b=HoFbm82a8p5MNFaseAKZBPXAk1V2Fbq2+/ubGCnrkaBSe
 FoT2kwn7CBfsQ9gOLvxhcHGSt3iTpnkPkvLsPZ5qojtr1uhK7HDMVsecmRiU5TK2
 EsQLw5QLxkqSLYNafG8kWtNL3mL4ACFfhgxoZhwh2Nnd0TJo0Pq9dCfkALuklmL+
 ohqO2iG4O2HcIDt2md99MN3/l1a8Jok7Rl8NAdVvaRw82zd4K4DItT9dmuy/WEZ1
 3WBSA3hZNpx/8lhx5xoEW/vIog6wxiyJWszrM1a1n+QAAckTFNKUBxMqiftNAaDv
 IjIG6ppn8Cj3EAcYIp39X+NpfjBEkFicSfeA5LI1Q==
X-ME-Sender: <xms:pKkiYiwv9pzr0zKpJVs8BW8lZc_EThtFcqEeA6l9a_T9flNd6xAJlg>
 <xme:pKkiYuS5ue-ge8TnU31zz2CAFo_3daUHk3QyAQc_rjtA0FDjs-wkxMb64pUxlLIdV
 n8YyhjopluZ-gb80KI>
X-ME-Received: <xmr:pKkiYkVWp_zSlPqrTUlGNY9OA36Qc_kErYcUYI86NCccXKPhecZUkU48lL2IDDR6THYYsfdFNzyo9AZyKrAKyK5AEAXxvF_rXJV2-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtledgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 hmihhsshhinhhgucfvqfcufhhivghlugculdeftddmnegfrhhlucfvnfffucdljedtmden
 ogetfedtuddqtdduucdludehmdenucfjughrpefhvffufffkofgggfestdekredtredttd
 enucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshht
 figtgidrgiihiieqnecuggftrfgrthhtvghrnheptdeludegheejteelheduudegkeehle
 etfeekiedtfefgleeifeelhefgveejhfffnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:pKkiYoglQY3QJpvA6rm4Aa1oq8-3sYw5Am5NSBZ71fFeoJPSWR9ozw>
 <xmx:pKkiYkDvGHJzEVvtS04hMPMwft2zt2u3J55MJ3Wvoj3AeXVUJ-xk3g>
 <xmx:pKkiYpL6d4veB4O1qZgECrPrxdMr7KE5PVStOOrWIGzkpfAmsiZHGw>
 <xmx:pKkiYj4gTucjjbDrJH8hDRQrrnpMsS0VjyiHFZZ8vJAHxltZtgzFAA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Mar 2022 19:06:59 -0500 (EST)
From: Patrick Williams <patrick@stwcx.xyz>
To: 
Subject: [PATCH 1/2] hw/arm/aspeed: allow missing spi_model
Date: Fri,  4 Mar 2022 18:06:55 -0600
Message-Id: <20220305000656.1944589-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=patrick@stwcx.xyz;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: 17
X-Spam_score: 1.7
X-Spam_bar: +
X-Spam_report: (1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FROM_SUSPICIOUS_NTLD=0.499,
 FROM_SUSPICIOUS_NTLD_FP=1.997, PDS_OTHER_BAD_TLD=1.997, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Patrick Williams <patrick@stwcx.xyz>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Generally all BMCs will use the fmc_model to hold their own flash
and most will have a spi_model to hold the managed system's flash,
but not all systems do.  Add a simple NULL check to allow a system
to set the spi_model as NULL to indicate it should not be instantiated.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 hw/arm/aspeed.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 11558b327b..617a1ecbdc 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -276,7 +276,11 @@ static void aspeed_board_init_flashes(AspeedSMCState *s,
                                       const char *flashtype,
                                       int unit0)
 {
-    int i ;
+    int i;
+
+    if (!flashtype) {
+        return;
+    }
 
     for (i = 0; i < s->num_cs; ++i) {
         DriveInfo *dinfo = drive_get(IF_MTD, 0, unit0 + i);
-- 
2.34.1


