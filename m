Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E146A5F0A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 19:52:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX548-0006kr-Dv; Tue, 28 Feb 2023 13:51:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pX546-0006kg-St
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 13:51:06 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pX545-0006zK-Cu
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 13:51:06 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E647E5C00D8;
 Tue, 28 Feb 2023 13:51:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 28 Feb 2023 13:51:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1677610264; x=
 1677696664; bh=HIHkUaAmd5J5Zb5kIv9UKGwuKi6dQDwTNzuIX4wlNzo=; b=M
 Kl1bqOrNuW5aZUjsxlhxh+Z2HaLl8H9O4A0Qil+BGEl1plFrusvqcev+C5tdSip5
 izi/ukeznr07BfHty7zTLO8hLIG5XUUsboyZ+6HLM64gvqaavsUzLBg4R8YxKmGR
 PPDcXZ5WhzvHsRd1Hj3+O0kRf5HkR7szFh5E2+aCPV1ILy7y0oVxAZcobh7Yxbab
 ts1B3XyzlN2pFwdhFIkyIMEX7wl21tWNfNzyYIuT2vQ1+0IRP5fyPrQ37bEHx2Id
 hJxCKlItpuBJlSi2zuV9F0PjBfYkBm8+2otN1S/pzNguvqnIZPDceA+0GzEJ7k3d
 EhHaTDUP0irZ02dpCvU9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677610264; x=
 1677696664; bh=HIHkUaAmd5J5Zb5kIv9UKGwuKi6dQDwTNzuIX4wlNzo=; b=o
 qkeJEP12/pQqPFUyDfGde6RR0HSjxe3ga5ZsN/9DZUjZtdR6Tv2X9+DtKlmffaGJ
 en6Epkt0C2bo+peRVN03TTf+2bKdUKVYQV/ymGI/LfYgzoPbME6TIJ2PfUUpWNUP
 6rYuF7ihCRRI8Dor350GL/GSqIdU1JHqrz0wdqZu3roLhHivPJJNoa1l3iCSb6M7
 leoeYjdXiZclbJV5TPvttFibBaBp6lBbGx4kghjYd4ld1e1eD7GKQF9bJhKEUX6p
 lNNcLNTOtJikVVnZm+wLVlNFUmOW8fUVxFhTXT6dOivyAFIkFrJsj072o38wEhT1
 1l2JI7vzPw+VkIGLB1WBQ==
X-ME-Sender: <xms:GE3-Y2I1VW_IzqxgydVcqgTiANZm0e-DGbaWuNGx9U-Y19ByItevwg>
 <xme:GE3-Y-Lii28qpQwOIU9Q3_mwAZScuHA8QMTZQKyQFhtL21YJU_N1GpSyDSEPZSf0w
 mwDSSL6ICLB1RRHDw>
X-ME-Received: <xmr:GE3-Y2v-HkgcbacspH2V1779tniF_hpYsXUMLWFyWq4jrnOfkPn1_NJgjP8GG3iE4xe4C1KhOWAB-lJaQixqLUgi-a0QZODz6ohAblmF-OAI7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelfedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredt
 redtjeenucfhrhhomhepffgrnhhivghlucgiuhcuoegugihusegugihuuhhurdighiiiqe
 enucggtffrrghtthgvrhhnpeetheekkefggfeivedvtefgleeiffdtleegfeeuledvuddt
 vdduhfekgfdutdevkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegugihusegugihuuhhurdighiii
X-ME-Proxy: <xmx:GE3-Y7bhTSdY--pziFdh-Ojn_LNhuJyHLnv2eY8wTiyrzWncwIAOtg>
 <xmx:GE3-Y9Zi_tg_KsXzuJVE3mCIhkzTTIsXEWiUc_FuHVmlQ_VZFKt_Bw>
 <xmx:GE3-Y3D1SiPjTiA1p4EQi6QhVuhJZRafXbNQIRqOK-LtvmazZfng-w>
 <xmx:GE3-Y8wt3zTcBA04XAls8hRqmV8PcE9BTxqgLKzRd60vFV6LqU23Hw>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Feb 2023 13:51:04 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 marcandre.lureau@gmail.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] crypto/luks: Initialize stack variable to silence
 warning
Date: Tue, 28 Feb 2023 11:50:34 -0700
Message-Id: <af41fdbe67d2ad08909703f43fc4cc1b68a00bcd.1677609866.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1677609866.git.dxu@dxuuu.xyz>
References: <cover.1677609866.git.dxu@dxuuu.xyz>
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


