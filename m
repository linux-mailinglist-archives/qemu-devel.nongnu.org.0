Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 792456A708A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 17:07:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOyt-0008NG-Oh; Wed, 01 Mar 2023 11:07:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pXOyq-0008Ks-Cw
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 11:07:01 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pXOyl-0003dT-9d
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 11:06:57 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 0C8EB320095D;
 Wed,  1 Mar 2023 11:06:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 01 Mar 2023 11:06:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1677686813; x=
 1677773213; bh=Y8s3dr39XUKGzeqILlG7QC9XkUZaeFRhrypkaE1hxTY=; b=I
 T6m4qUqwHctWB5dYcpKjJH32pIutnOAdldycpTcEQlAgsZ/TUAifhxAFbSCSBgj9
 8rYCyHRUNaCcFIk3QGothpKaQoCiyfZdIpHbKsMhSdaHy679TeV+PMxirLUqmZAI
 8+C5IVPsVqDLeGesoKs942jnx6iYGc/t1EQI5SDL//veT9nQzOw+4E6JB0x8v73e
 CTYIbKUn414X1VuMgglc2JfwcltGoEP41MorQM6GdsYJKFvcd5TUXcZy2c3mpDbT
 +Qm1k2650Xkro4QUhYkPgqUr/BmkLLamfif+sGrjqwfzILO1SV23K84wsGjCNU0s
 wqNxsSji8foXyOiIxZKng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677686813; x=
 1677773213; bh=Y8s3dr39XUKGzeqILlG7QC9XkUZaeFRhrypkaE1hxTY=; b=U
 Z1oc0UZOgWx4dHBQ9pltgco76rJ1wvAKWSfDhlm8hb5E+aVPiUVmLlz0+80CLZ74
 gd1KunVUlYhPsfoolrHHMH4TMN7RgT7KO1/RHn7STrX3TWdCC9aapIF7M8AjWEzR
 cThT/oUZuxlE1T75Ept+qGEUg2Wp79g6L8CLLzSFKs0z/yChYLsGCMB7ZjzXLNxp
 2hbGMlPai+LDBhwbyRTcB0cmrVqs6ZvCMw9H6lpgpA8/Co8yF7KYN/s8GwfUKJfq
 LwRN4KyG4b+xUrnGEyp4ZRG976Y4Qe6VCqVRy7q5NSMBnm56JsW1FqgKPs00PVOz
 l4quTfQdyIFmrjIZqeS2g==
X-ME-Sender: <xms:HXj_YydJu4FwSKfa-Y2mDmrCU2WqpyU7YGNG9TMdoewl1ytR8XhZFQ>
 <xme:HXj_Y8NLYQqPxL4bnM2We01N0ybU-YMq-4IlQVNgFD458pgqcpc1fo9Ey4BctP-Rv
 ot5OmqCw2RNyLXdhA>
X-ME-Received: <xmr:HXj_YzjMor6Nu3q81PDwV525zXZLNBdPMa7yqhu4-7dzYbYZaSnBYN-atvsECpLSTprcVRK1QwcnE9r1Nk2Nly1QYr68LjLe-AT_S8jF9V11sg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelhedgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredt
 redtjeenucfhrhhomhepffgrnhhivghlucgiuhcuoegugihusegugihuuhhurdighiiiqe
 enucggtffrrghtthgvrhhnpeetheekkefggfeivedvtefgleeiffdtleegfeeuledvuddt
 vdduhfekgfdutdevkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegugihusegugihuuhhurdighiii
X-ME-Proxy: <xmx:HXj_Y_-vTofYXrRiu38nwmwBt_qV6WbuyTIsiENHOOFl7vHA-_03Sg>
 <xmx:HXj_Y-vN9-srEbtTbQ3D0RtnyKf9Pwf0y4BMbz_c6Luoe-IYx5ft4g>
 <xmx:HXj_Y2FrDjt7fLYEwGN7O84clYD6CAWnrBR7gST1_ImNdJY9Yg8c_Q>
 <xmx:HXj_Y004OCTmcv9jN-9tEd9KxCs5ux1ZhCnj8i_haSPyTNsVlMbXqA>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Mar 2023 11:06:53 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9=20marcandre=20=2E=20lureau=20=40=20gmail=20=2E=20com?=
 <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH 1/2] crypto/luks: Initialize stack variable to silence warning
Date: Wed,  1 Mar 2023 09:05:45 -0700
Message-Id: <dc09bbd28e2471cb145ed0056d789220358e1efa.1677686566.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1677686566.git.dxu@dxuuu.xyz>
References: <cover.1677686566.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=dxu@dxuuu.xyz;
 helo=wout1-smtp.messagingengine.com
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
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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


