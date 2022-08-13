Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A67591C03
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 18:32:50 +0200 (CEST)
Received: from localhost ([::1]:44454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMu47-0005cf-Ox
	for lists+qemu-devel@lfdr.de; Sat, 13 Aug 2022 12:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oMtz4-000894-Tl
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 12:27:34 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:41479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oMtz3-0005Tc-78
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 12:27:34 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B7B4B5C00DA;
 Sat, 13 Aug 2022 12:27:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sat, 13 Aug 2022 12:27:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1660408051; x=1660494451; bh=Zk
 jXCaOWL58K7ZMeAQFjuuRpamyHM5rJ95oAggQodcA=; b=IH0fgTpXw5ISl4F4Tw
 eKTZqB/lkkCjsBdiHX8ZKR+0l7ZnMuJnmBGym7EGJtgpnPHunThxdKaKwf/ltwOi
 8yH0F4NVQwpIB+zsYijcgF2ni8fHI/BRiTfm8e2ddVJ8Lk3rG6kbGZPF7zVMaoBf
 iqYDDBeh6T/uIY6zeWZZAo4m8bEVhezlHlNPuDZfaaYiOMnuGbiRwd9EDm8lHz3y
 bEpbAqbiDm/Kw9GeUI0dHwTQJ1vfv0Oae4D1GHEEufvRLSQMMfe+OZl7PIDxEhEf
 MltiJ6g5OvYeaxi3tALl+A5SHCy7Gyx/AGF1wn9KomiksCROg1tbWmrsOSyhgskL
 Wflw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1660408051; x=1660494451; bh=ZkjXCaOWL58K7
 ZMeAQFjuuRpamyHM5rJ95oAggQodcA=; b=BGtO/sg9AHSB7UKisE2oATYgwc1Te
 4lqtizG61bJ4NR1dgzRzFLXj+VtkD7ujbTguogiPrJjuwHMuMcq70GuW5DGCbvIu
 VwJsdE95tMtAuj0FGB8AMp+MZlRGv6P+JDMSySbMPLL8cJQ7v8EX4nm2ygWYeriF
 ZDYFlJqJGfhs4ai9NzNak7lyNSPK/3qXxYQqnlkPfA8LVEskTGjhhxCcCkdotV6x
 aqT0WXyLkYDApiJF8ulNyW6lehbYgkpQa5l9ANzmwu0spObC0oSftF16mySFUozO
 c1M+kSIjb6QkYlj31jRCSfsDFPn0RHCVTbJKgbnSiTJ7TQgB+hEM9ghvA==
X-ME-Sender: <xms:89D3Yr2X8xCuavpNiDN80IpEdGJPJgIE4zByi5PY0mqfE6EUFM3dUg>
 <xme:89D3YqGFPSJVSv_5OLGtu_Ve3twZ8UZjJiOP9RgfrVCt-Oly7rQrFxxKmy-Zzbtfd
 BbOijOw36-eHTD-1tA>
X-ME-Received: <xmr:89D3Yr7jDKClEcqdLFgvlHYVWlWFRVa2b6UCCq3ljUCX0lrAfJ9hghStyJfP8BfpgcO8ymYEqGcQYyQ7499HkRQWyfNpY48ZsTwxqLQadb3-GdA_BJlLK_UG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegkedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
 ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
 nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvue
 dvvdegkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
 ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:89D3Yg0YJbbu8nKtjVmN37sKrGoCLP9Nd7zt9jO_6ZGAYgBL5J74tg>
 <xmx:89D3YuGvpo9ZAhb6rvbG7tlWbgD_KS9rOLjm0Aluz5W-KpjpL-Ttyg>
 <xmx:89D3Yh-lT67G0SwszHkU7Fw7WfihWokNYU-nVJyluUhABNc6dH3Viw>
 <xmx:89D3YgM48CycLGXODvBBBsIAhdiacsHrwepgQycrJBx3QXfBp9Pa4A>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Aug 2022 12:27:31 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: f4bug@amsat.org
Cc: qemu-devel@nongnu.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 2/2] hw/mips/boston: Pack fdt in fdt filter
Date: Sat, 13 Aug 2022 17:27:20 +0100
Message-Id: <20220813162720.60008-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220813162720.60008-1-jiaxun.yang@flygoat.com>
References: <20220813162720.60008-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=jiaxun.yang@flygoat.com;
 helo=out5-smtp.messagingengine.com
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

FDT can be awfully fat after series of modifications in fdt
filter. Just pack it up before add to ram.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/boston.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 5145179951..a40f193f78 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -400,6 +400,7 @@ static const void *boston_fdt_filter(void *opaque, const void *fdt_orig,
                         1, boston_memmap[BOSTON_HIGHDDR].base + ram_low_sz,
                         1, ram_high_sz);
 
+    fdt_pack(fdt);
     fdt = g_realloc(fdt, fdt_totalsize(fdt));
     qemu_fdt_dumpdtb(fdt, fdt_sz);
 
-- 
2.32.1 (Apple Git-133)


