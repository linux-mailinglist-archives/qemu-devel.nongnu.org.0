Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A234CDCF4
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 19:50:26 +0100 (CET)
Received: from localhost ([::1]:38410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQD0T-00052D-Og
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 13:50:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1nQCMs-00080F-L4; Fri, 04 Mar 2022 13:09:33 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:55845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1nQCMq-0005Y7-F4; Fri, 04 Mar 2022 13:09:30 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 937493201F85;
 Fri,  4 Mar 2022 13:09:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 04 Mar 2022 13:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; bh=UEv9VohQHb/HAaPVWKMAa8RP2VezHw5hQdpye0JuAl0=; b=dbXDD
 L02dscX9791BRpkA7dlXX9d18shDkVgNgKaGERg5I3TVzAvVn+lzfTPA+DhgEhe/
 H2sArlTS+dsreM+PkDKi3OVjfkM3rkw87cOIBzJh5YOQi9ASGBhTw4yejWBujzv2
 W83nJNUuummtxRAKYy8X2txc8sSol196reT07BvUwT1f0HjNP/Miw+k+GTTWPuYC
 pZPQkTImb2XAyPSGee5aPpR2odlE/5pmKeqTEAoRIs2W0H6RIuu7h/zOlF/4Xfzg
 Rj8XUWo2UgiHjBx5E8ktunDOIFyjN/SLSLkTnp6tx90jxbBDajy/8NlbIooVU8i+
 yE1I19OmyLugyxwag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=UEv9VohQHb/HAaPVWKMAa8RP2VezH
 w5hQdpye0JuAl0=; b=H0DsBWsXso3wx1IKuuX0dB9qv7QnssJeBXh50Sm5qPWq2
 Cas9zYhF0SEVD2pvbksXz7r7PH/30ZrCUlUOJ5Sli9SS7aGYCtx1xifo6LKH5Xek
 DKL0GLkmFtZSKd4qJBV5wqDk4+MJFU7WGFZvzIoXvVQIZyQ3ZDg5a+T2s7PCVb2I
 rUZ+gKpwIOJyTmEbjpr91aA1bmbi5qpLRFWBjrN2GRXyMK5/XBwKVVvOk0GLdIEm
 KvDQ5DvTfiDoIORkw8OdbM+53y8r+LMBAA4LSykmLcADKJ2rldaoPBAmuO92iBr5
 5zGnfJVwoBjh1YVhyN4ywrNmwdEIAZr3XehvzHDpw==
X-ME-Sender: <xms:01UiYhrfiTtfD-giaC5aMnbrQHvNFMzmgB74azFuiVh-UlX9GHUhzA>
 <xme:01UiYjp2E7hLfdyeEfv1_RCPxiOW7MHo9rkyUarvo2fkiFw01USbAoihk9-iQOHIO
 yG_6oOyR96CiXTAHxk>
X-ME-Received: <xmr:01UiYuPKWR00axWAL7PALVkW2n7WxjyGtkqz4VJbwoCv-eSR3WJT0AxlHG3pA99vlWhlra1FFl43PQqOW-Y8T4OLsf_Sq_lyDnI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtkedguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enmhhishhsihhnghcuvffquchfihgvlhguucdlfedtmdenfghrlhcuvffnffculddvfedm
 negoteeftdduqddtudculdduhedmnecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehs
 thiftgigrdighiiiqeenucggtffrrghtthgvrhhnpedvfeetvddtgfeutdegkeegtdeigf
 duudfgiedutdegkefftdduueeugfelgeffheenucffohhmrghinhepkhgvrhhnvghlrdho
 rhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepph
 grthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:01UiYs7AqlPcPWyvFmhqP6xoHpcj7f6V3OWf-9LEguuor9-hBrWz7A>
 <xmx:01UiYg7wGKf3ADKL2ngPmzAFHmIF_VVfII4X0YAH8UV_RA2rO77mRQ>
 <xmx:01UiYkhmGX8OtJLxrWvZk0JUDnGoeqyRbF_M5dwYxMKYlFJsZFRCCg>
 <xmx:1FUiYqS4_fbNHh5vFO7WPFBeXnJxSum2g2Z7JDNlVqdboSMfxMu4Rw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Mar 2022 13:09:22 -0500 (EST)
From: Patrick Williams <patrick@stwcx.xyz>
To: 
Subject: [PATCH] hw/block: m25p80: Add support for w25q01jvq
Date: Fri,  4 Mar 2022 12:09:20 -0600
Message-Id: <20220304180920.1780992-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=patrick@stwcx.xyz;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: 17
X-Spam_score: 1.7
X-Spam_bar: +
X-Spam_report: (1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FROM_SUSPICIOUS_NTLD=0.499,
 FROM_SUSPICIOUS_NTLD_FP=1.997, PDS_OTHER_BAD_TLD=1.997, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Potin Lai <potin.lai@quantatw.com>, Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Patrick Williams <patrick@stwcx.xyz>, Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The w25q01jvq is a 128MB part.  Support is being added to the kernel[1]
and the two have been tested together.

1. https://lore.kernel.org/lkml/20220222092222.23108-1-potin.lai@quantatw.com/

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
Cc: Potin Lai <potin.lai@quantatw.com>
---
 hw/block/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index c6bf3c6bfa..7d3d8b12e0 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -340,6 +340,7 @@ static const FlashPartInfo known_devices[] = {
     { INFO("w25q80bl",    0xef4014,      0,  64 << 10,  16, ER_4K) },
     { INFO("w25q256",     0xef4019,      0,  64 << 10, 512, ER_4K) },
     { INFO("w25q512jv",   0xef4020,      0,  64 << 10, 1024, ER_4K) },
+    { INFO("w25q01jvq",   0xef4021,      0,  64 << 10, 2048, ER_4K) },
 };
 
 typedef enum {
-- 
2.34.1


