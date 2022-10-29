Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24551611F39
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 04:02:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oobAC-00007l-2k; Fri, 28 Oct 2022 22:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oobA1-000069-QG
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 22:01:22 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oobA0-0002aD-4m
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 22:01:21 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C29833200065;
 Fri, 28 Oct 2022 22:01:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 28 Oct 2022 22:01:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1667008878; x=1667095278; bh=Kz
 7Z7k+bPnmutGT2CzsqAfsbFsWvfGVl+CZZN4GvZxc=; b=pq2lVl4k0FC70fcGSK
 WqSsc1eMNpKYLue4pEDo51vsMI+cb+1bh1Qh4//vjTe19a0DOYns/Cy+rCYHnz0T
 B7uoDKqZYswdWncLW5MVrI/N1djxIzse5XSb3DZXMKM4u6OD8nVzsXsaPI6vcoYl
 RZmSy8pjEy9SzduhSTfHW0Mlcl89475s+ro8sw7BE62UDqGoShVNgkF6wHzFvmLT
 r3e/8Z25bWgT1q7pXldXnyT/fMOPaTSTR8IdYwwCTOz3P81JzPJahcwTNz9EVNYG
 9kIcXEn7jpJ3qsXBYuh33FBSMtxRxyjMCwuEctpGhtv6YbRJNHpDdH09uIACoSrM
 KSUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1667008878; x=1667095278; bh=Kz7Z7k+bPnmut
 GT2CzsqAfsbFsWvfGVl+CZZN4GvZxc=; b=tyoPerQz4UBItBBM/x3QxmOm8HlPZ
 tXhJD68O8xJuNCyMx+ERKscZmhiT5VQUbceCQVuBBCaT4eAoCojBbEXpS6GdI7Xs
 Gdk4UY/l3iPqO5aVzAzZp61cLdtlkqULDKvwJWfK882+zeIfOY2WnRT7ACBq8oKM
 sgGd49rk7Ms5w0ah/X03RZQIk5ULOPec39M3OiHDYhmcUPBc4udJws+51YbJmhqL
 x+IreQmpGa3kcynTbzenyQYB3Rb9Ww5mtmhQu90iCJ8948ZUwx9CsgeAayOadyKQ
 7cKIy2hSyMJcL5IYkt5EIeh6lx/xhq9kjWH/aUVMfxfjnRBc/7AcY5vJg==
X-ME-Sender: <xms:bolcY40wypN1tdCbRaqU997qmtcx342oxA-OWNdiNpmLzVPP7sM4_g>
 <xme:bolcYzF2p-R8rmoV7IxdFYJ6tPjWP80aUkwLskHkEhUy1y1ua10GvysrjiABOgLRm
 2lLQ8360V-1X174YYc>
X-ME-Received: <xmr:bolcYw6xCTqTV9t3ZMkSYTbOhzabeSH28u5ED6CVsMKcw_OuwUoLwUpcFtPb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdejgdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
 sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvuedvvd
 egkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihgh
 horghtrdgtohhm
X-ME-Proxy: <xmx:bolcYx1j_gyVEbw-Qw9eHCcU45iQDP17ZMivfBoxnPFjOKyRY2F49w>
 <xmx:bolcY7EFXNZ8jemmBkx_giyh0pLAe4hTvBLWudqRI1B9cNsuYoIyLw>
 <xmx:bolcY68OXjBYnO2XEdAxJJwFcsl_QYfqlCuN2VI5XBblH20PSQpeCQ>
 <xmx:bolcYwS4xUewQWD5Z1s-MDsHX0Tf8SE9-fZiNXb8PmFMJxf0Eym5PQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Oct 2022 22:01:17 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: f4bug@amsat.org
Cc: qemu-devel@nongnu.org, pavel.dovgalyuk@ispras.ru,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 2/3] target/mips: Cast offset field of Octeon BBIT to int16_t
Date: Sat, 29 Oct 2022 03:00:29 +0100
Message-Id: <20221029020030.13936-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20221029020030.13936-1-jiaxun.yang@flygoat.com>
References: <20221029020030.13936-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As per "Cavium Networks OCTEON Plus CN50XX Hardware Reference
Manual" offset field is signed 16 bit value. However arg_BBIT.offset
is unsigned. We need to cast it as signed to do address calculation.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 target/mips/tcg/octeon_translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/octeon_translate.c b/target/mips/tcg/octeon_translate.c
index 6a207d2e7e..e8f2277c51 100644
--- a/target/mips/tcg/octeon_translate.c
+++ b/target/mips/tcg/octeon_translate.c
@@ -38,7 +38,7 @@ static bool trans_BBIT(DisasContext *ctx, arg_BBIT *a)
     }
 
     ctx->hflags |= MIPS_HFLAG_BC;
-    ctx->btarget = ctx->base.pc_next + 4 + a->offset * 4;
+    ctx->btarget = ctx->base.pc_next + 4 + (int16_t)a->offset * 4;
     ctx->hflags |= MIPS_HFLAG_BDS32;
 
     tcg_temp_free(t0);
-- 
2.37.1 (Apple Git-137.1)


