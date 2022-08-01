Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8680F58720F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 22:12:47 +0200 (CEST)
Received: from localhost ([::1]:56974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIbmM-0002Wd-DG
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 16:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oIbjO-0008CT-5I
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 16:09:38 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:48511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oIbjM-0007Lk-DF
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 16:09:37 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 570FB3200947;
 Mon,  1 Aug 2022 16:09:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 01 Aug 2022 16:09:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1659384572; x=1659470972; bh=YPRkYCGhumV/fwi6YJgkwfbaQ
 /ot7EiZuE785X7ml/o=; b=iwA+xLhq2ZQxwQElwlMtub2E9guI4DZJZhc10HTIh
 Mrt8Q+Hximp/c0uHts2lVhAnkQPGa5A4AJtXgnPI6Db5WgmLQ1TE7bXfnpfEoLm7
 AeKlKBKc8ml7KyDE45IOVhKg/D3Y+saFvJjrBhwJRF5TNIs3G/y+BjXlBnnghJtR
 Qkv/Uf0tsLYOHCjcUlZBRdnGR0TnOFruupUYDcZNKOnX9xCj+UJoUUc/81CTb64i
 8g+Hbpd69beZKn3flmi9SRdjJ+GuAQP3KcJObASZp1CVg0LW88kxbLl9oIll/VkF
 Q4b5IYTNCNBA756hahFfZ/z71OyBIsIaFFljakqTmabDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1659384572; x=1659470972; bh=YPRkYCGhumV/fwi6YJgkwfbaQ/ot7EiZuE7
 85X7ml/o=; b=q0N5Sc9DYuHOirSnrldJWcHpc0tRavB7qwnDD9Hjd1BcmyBUJSN
 QXxpLk6UcRowos5nJOofrvdmtxnLx68yiottfiTkBUyX3Dkm9cB2WEgVZpn00sAd
 q9eRC9wMXM+WqW2VM0JX96bZ5YgTcMatPZi9161QofsG6NCfe5SGpZtmrzqx+Ams
 5PahjOc9owPiGKTYkFweoP3hS3w0E0O+qAfW72lCkbUIbsAc/zZvWgX9ookqy4VK
 yI+fUcCxeXaSZ2XPYrTzuh8KT92UGATJawlAFv/JjAxXYtXALvsprOz+ogjE+iF1
 Wdjaudcdf7SYD1arOzkJTu1VfRecMougGxg==
X-ME-Sender: <xms:_DLoYkyZecN48Mu1xGaQEm5vIJVg0AED3sgWOxvynTWjCGQTeHHNVA>
 <xme:_DLoYoSphvxdjRShe0T3y9b2s0TvXkHbQmkcfA14BFNvQ7pmfipEbaQ_EDD0Dn3_l
 avCCXFnL74LOO_y1hA>
X-ME-Received: <xmr:_DLoYmUdszbPBdxbOzfzI71ijHABndfi_kPrL1oTO2JQPz9kiQiLM395hU1--8WYXfxME5EE7t4aUShs9DLIH5TmeX_D3zsOjyN68NIkjEzlSosdiQF6v2jp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvfedgudegiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
 dtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
 sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpefhtedutdduveeileejje
 etffehueejudehgfffjeduhfeuleeludfffefgffevkeenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihgh
 horghtrdgtohhm
X-ME-Proxy: <xmx:_DLoYiiuqypa_YwEu9_cddEyAyrJI92W94McQcd2tltibL1sHDmq4A>
 <xmx:_DLoYmDbtOKTGJHuQKWe_XwBG9d1Q_SKvtIaMnvb0i19_71Q9EcpEg>
 <xmx:_DLoYjJEgAHX94wTptXZte9TKv7Cjr1Q2tVX5iBxuJm-KOSm-Jrl_A>
 <xmx:_DLoYpP0O5_E9Gg4cgfPUdf4So9gYnftoX6Kp4ucGc4It3KAIZhYFg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Aug 2022 16:09:31 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: laurent@vivier.eu
Cc: f4bug@amsat.org, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/2] linux-user: AT_BASE_PLATFORM for MIPS
Date: Mon,  1 Aug 2022 21:09:26 +0100
Message-Id: <20220801200928.73741-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.20;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

This series properly filled AT_BASE_PLATFORM of MIPS.
There is a checkpatch error about braces after if statement,
I intentionally left it for style consistency.

Thanks.
- Jiaxun

Jiaxun Yang (2):
  linux-user: Introduce stubs for ELF AT_BASE_PLATFORM
  linux-user: Set ELF_BASE_PLATFORM for MIPS

 linux-user/elfload.c | 60 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 2 deletions(-)

-- 
2.32.1 (Apple Git-133)


