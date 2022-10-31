Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA5D6137E8
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:26:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUnh-0006bQ-8g; Mon, 31 Oct 2022 09:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1opUnQ-0006K3-BY
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:25:45 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1opUnO-0007jg-SZ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:25:44 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 725A55C012D;
 Mon, 31 Oct 2022 09:25:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 31 Oct 2022 09:25:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1667222742; x=1667309142; bh=xW
 WmlZqKiSO1F01j+4qKscub1x7utoknBLquo34mzSU=; b=JIWQJ3DzfxTA0Xl3O6
 irO3PuvA3l559LF0W8A1V25dr1tHuj9OBpgA7qbi0udYhusC4Nv6zBaynR3MlGO7
 rZTyNLhgYM6MlckWKE2odxuCQJGIUpoqRR2FpMd9BwnvTsTgW6R5xxdwBJy9cgEv
 zhwmyKZ+vqYfQVQ1KBSFXnv4bnGKruzkyfe6mOXGqwLOLWaQfEcQybZioUFg44Mn
 iOLP8AA3nizrA7fBD9AOs9ikHycO2MAfLe7T4Ay8ZBIJII/fu9zNHfny8CEaLBCo
 jtK81STYAzh3zqwi+vTbNebVRPJd2Qf77Eg3QSCLcPDuRoJAJy5HAiXKFrCJO+Ee
 PyKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1667222742; x=1667309142; bh=xWWmlZqKiSO1F
 01j+4qKscub1x7utoknBLquo34mzSU=; b=Lm3clRIT58W4cBqvV8OWpZcuOPDKx
 mBQF/xFpjXdaQVpgu5niXkyIfNdmvXAPa6F+iJlD28N/A2xDln9PkRgfdL1sN4RR
 lyRT1XMicqcgh6AMvl8quKvGvnR7hsFV01ySXIZg5Ma98tMnvDTTF0xFH6jPs4xo
 68xihlyur/UL2G9SF1/QUW3rYAqDxqLgHtKiIGMRPCOGo78NWM3uYmWL0eBZXyQI
 Fa/UJylqP0J69ISe+jFA9ovl9S/+/i0pgr12zWrlqPJblZ/++vwgIvQSTeo6CPgy
 gDq9lYufhPMkKDOeL8uzsXnOMklItPla+61PH6nnKxHXoUhkYQsqEn0qQ==
X-ME-Sender: <xms:1sxfY6hQRjsrJtNM3lC4h9UVwZ88yA4yoW6hDm2nLNYrhTF3V7zsrw>
 <xme:1sxfY7BjPbzICLvmJvnR3FHMTLa-Q78nJYlgxMD-w7jACsWtOltIZmXpLo4ZjPGbm
 _I-L9PH8m_GkcLEbX4>
X-ME-Received: <xmr:1sxfYyHqU8sx3tzX1fQxm8LSLTnsEBCKgXfDb9zz7yJ2m4J8xyM89_6ZqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudefgdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
 sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvuedvvd
 egkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihgh
 horghtrdgtohhm
X-ME-Proxy: <xmx:1sxfYzTCY7DQs-asiFbpvryy2ndVieI0yUqwp4aRbJAmWLrN4suTDA>
 <xmx:1sxfY3wsKBez6LkArtExIsyZxSfQx1snK-2PkAIWiWAq5Hh26U8Fig>
 <xmx:1sxfYx71SP_DoshwqTS85ynI2DJvqhRzpTyXjybXIRrWqS1MSN1kkQ>
 <xmx:1sxfYy_NhR6tVulYV9qjEQC3L97pO8yVOD6csmhGhd7u-fJUSdWbrg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Oct 2022 09:25:41 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, pavel.dovgalyuk@ispras.ru,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 2/3] target/mips: Cast offset field of Octeon BBIT to
 int16_t
Date: Mon, 31 Oct 2022 13:25:30 +0000
Message-Id: <20221031132531.18122-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031132531.18122-1-jiaxun.yang@flygoat.com>
References: <20221031132531.18122-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=jiaxun.yang@flygoat.com;
 helo=out2-smtp.messagingengine.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

As per "Cavium Networks OCTEON Plus CN50XX Hardware Reference
Manual" offset field is signed 16 bit value. However arg_BBIT.offset
is unsigned. We need to cast it as signed to do address calculation.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2:
Do casting in decodetree. (philmd)
---
 target/mips/tcg/octeon.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/octeon.decode b/target/mips/tcg/octeon.decode
index 8929ad088e..0c787cb498 100644
--- a/target/mips/tcg/octeon.decode
+++ b/target/mips/tcg/octeon.decode
@@ -12,7 +12,7 @@
 # BBIT132    111110 ..... ..... ................
 
 %bbit_p      28:1 16:5
-BBIT         11 set:1 . 10 rs:5 ..... offset:16 p=%bbit_p
+BBIT         11 set:1 . 10 rs:5 ..... offset:s16 p=%bbit_p
 
 # Arithmetic
 # BADDU rd, rs, rt
-- 
2.34.1


