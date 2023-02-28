Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9166A60B0
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 21:49:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX6td-0000u6-20; Tue, 28 Feb 2023 15:48:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pX6tZ-0000tB-5Y
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 15:48:21 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pX6tX-0006ZP-MR
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 15:48:20 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 4F0AF5C01C2;
 Tue, 28 Feb 2023 15:48:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 28 Feb 2023 15:48:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1677617298; x=
 1677703698; bh=HIHkUaAmd5J5Zb5kIv9UKGwuKi6dQDwTNzuIX4wlNzo=; b=r
 ghP0hRTCtRE08E/pghD1fsvyFGoO2WN08Ej5oU2kYPThFuOeE8GlgDwaSDo5ivdp
 BFBBa7+WZ0BpktlsMifP5DMBN73CaVEkMVzpG4F0rmH+fCODdPbujufYviodMW9Z
 8WFJ4HG/fykMcRTCNgyBr0B4cQ4wceaechqCxtmAYpaB/vb6JXxdDiD9VeW8mg8m
 DyEWuOUxaZ3c/1X/ZTBxx563pPoNsvYuzRFOVfQEORojz6cTd0sfPUqHR2hGs5bE
 PqiFoK6IDwIb6HvSM6EYe0cUtNwn2ZuHuWQq8SLd50W+D0PF2q9Uvy1t1BhIhcJE
 HHgZVPlffBcCOyQhp3nig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677617298; x=
 1677703698; bh=HIHkUaAmd5J5Zb5kIv9UKGwuKi6dQDwTNzuIX4wlNzo=; b=P
 5iDzJ8Hvhys1nGci+jkYXEaDpOzMK/iilAewb2DsBcKZrFfZqqc0CDyCiP8iSevC
 8mUdOTKXN3+Cl3xo3sJiE4QF0EqqusoaFgZ/DX/3DIHufm0EDKlN3aR5YgBCONxq
 Z4ARZez0qiG27gtjzAzigL5KUdxPV8zKrd5WB24qN9+YOdtjLNChcCVHkaENTg6J
 jvokF2CY8069ezEi69/dajg5AlWiehXaSl0Fbky/mcN97dYYN02zG2akjMAt6CkR
 uU3Y5IkBhPmFCiODTyQjkhnQVxWRUQ8+Jm1xnKYh6qP6bQiyF1+anovpKvoxa8gS
 DBwdtAYHSQzFdawu5AgWA==
X-ME-Sender: <xms:kmj-Y_3CPsddf7tlMRxPpaXCoyNIC3Vi2PlYaSjzYmVhTzKC22SIbQ>
 <xme:kmj-Y-FvGqjim4sttNFwIUFDKUkXjG8vpboZaAlgaKi4TGut85PI06SpzN-ezooJ8
 qdvm3kzm8AeRSEBDg>
X-ME-Received: <xmr:kmj-Y_4gkozag-p4yV3Bl8kejIbphHX329f_4MgtkmJxkdLqoEQYoNbuCPZNxFrysjdN_AX8mJYZ9ElyXq_ocx_FVezdDnLgQ1rbz_ejKItTdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelfedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredt
 redtjeenucfhrhhomhepffgrnhhivghlucgiuhcuoegugihusegugihuuhhurdighiiiqe
 enucggtffrrghtthgvrhhnpeetheekkefggfeivedvtefgleeiffdtleegfeeuledvuddt
 vdduhfekgfdutdevkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegugihusegugihuuhhurdighiii
X-ME-Proxy: <xmx:kmj-Y02s5xZV36E2td83dp6yJhlvXWnAfn-YASMfLgiPtYiyo3llNw>
 <xmx:kmj-YyFPsb5TWER8EL5EtXx8c02usnJ5agf4z7vRC7vh7XFiXctQlQ>
 <xmx:kmj-Y1_z6I84HQVKsKEaKRPEGYSiAJ7sLm9pnZP8sluXmkei5rdkkQ>
 <xmx:kmj-Y9MfV5D2SOEDJQR5_-EuMlf9BeiUU6msdrk5MELFa1SU5EsTuQ>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Feb 2023 15:48:17 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9=20marcandre=20=2E=20lureau=20=40=20gmail=20=2E=20com?=
 <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH v3 1/4] crypto/luks: Initialize stack variable to silence
 warning
Date: Tue, 28 Feb 2023 13:48:01 -0700
Message-Id: <7d55ac8f0d021d39809298cac2f13f3826c284c8.1677617035.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1677617035.git.dxu@dxuuu.xyz>
References: <cover.1677617035.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=dxu@dxuuu.xyz;
 helo=out1-smtp.messagingengine.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

With `../configure --enable-sanitizers`, I was getting the following
build error:

        In file included from /usr/include/string.h:535,
                         from /home/dxu/dev/qemu/include/qemu/osdep.h:99,
                         from ../crypto/block-luks.c:21:
        In function ‘memset’,
            inlined from ‘qcrypto_block_luks_store_key’ at ../crypto/block-luks.c:843:9:
        /usr/include/bits/string_fortified.h:59:10: error: ‘splitkeylen’ may be used
        uninitialized [-Werror=maybe-uninitialized]
           59 |   return __builtin___memset_chk (__dest, __ch, __len,
              |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           60 |                                  __glibc_objsize0 (__dest));
              |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
        ../crypto/block-luks.c: In function ‘qcrypto_block_luks_store_key’:
        ../crypto/block-luks.c:699:12: note: ‘splitkeylen’ was declared here
          699 |     size_t splitkeylen;
              |            ^~~~~~~~~~~
        cc1: all warnings being treated as errors

The function is actually correct -- in the cleanup branch `splitkeylen`
usage is guarded by checking `splitkey` nullness. But the compiler is
not smart enough to realize that.

Fix warning by initializing the variable.

Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
---
 crypto/block-luks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/block-luks.c b/crypto/block-luks.c
index 5688783ab1..bfdef25c80 100644
--- a/crypto/block-luks.c
+++ b/crypto/block-luks.c
@@ -696,7 +696,7 @@ qcrypto_block_luks_store_key(QCryptoBlock *block,
     QCryptoBlockLUKS *luks = block->opaque;
     QCryptoBlockLUKSKeySlot *slot;
     g_autofree uint8_t *splitkey = NULL;
-    size_t splitkeylen;
+    size_t splitkeylen = 0;
     g_autofree uint8_t *slotkey = NULL;
     g_autoptr(QCryptoCipher) cipher = NULL;
     g_autoptr(QCryptoIVGen) ivgen = NULL;
-- 
2.39.1


