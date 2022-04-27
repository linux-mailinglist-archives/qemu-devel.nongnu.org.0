Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69709511C9A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 19:27:25 +0200 (CEST)
Received: from localhost ([::1]:48316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njlRk-00065U-HJ
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 13:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1njlMY-00063T-2D
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:22:03 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:44642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1njlMV-000186-Eh
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:22:01 -0400
Received: by mail-pg1-x536.google.com with SMTP id v10so1941139pgl.11
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 10:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WQsutAy+FdgpsWqrim8hxnGCb/1/Ut4iQvf1aGwFKic=;
 b=Op9vE6ll2ZxeWbGVGZEhnBjqn3jFGir6ICAhfHOGINFKnAjpWU1l9yzKdrI7g8unpJ
 E9iwSjTh5f/LHnRkFf30OxgUIudJCitU9AxJQD+GLDOg+Xhv8e1SxHfeny5YoM2nvvZ6
 YFtxE6kK/LF/RGhwixVLU5Kj1nIN8V3oq8YxiYL4y1eQi4UMrQZkRQGCX2gGYnWQntUa
 tTGXZZA8ZX2julZwG0MV9iDCe9XJhRGHxZHxxVRku4d75nftOUKWzZHRlf4vsTXFJ7SQ
 Ntk0y6ZTccYouTEX+CFsmjJ7b9CsfOlAhIuZ8IXF7iDanLjrJFP35MXxABwanN9z8oYw
 hMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WQsutAy+FdgpsWqrim8hxnGCb/1/Ut4iQvf1aGwFKic=;
 b=0Kq8IRmIY/btgd/+E2zgivKDzex4VcdNOrECUFBKtGhRMwE4PRuQD4IJ1KRMETHVR9
 VnjnemLAzjVGF9eOvrXm2ZUOXkfmmpUCs/8YGPCtuvl6ZM7LpkJ24sBYMaRx8QhhXxko
 /CWF/vVYAMKE9AHmGYQVvdGR8X4nU4N32f+6u8M93aU5DJyCmBGJ1VKj4U/HeqaVvAYH
 oPL6zeQ5Q1qbqu6oiYOgMlgHftPsn6KvFVw+9G5F4UZHyyM+BuBS2pTIjIhcPsdfRq+6
 ACsgJ451dzR6+XYtmw07J3iuEaX3hZZ4r5HZn3atmQ7zI4ewwwOP244pGiKtnGxvBU6N
 zTTw==
X-Gm-Message-State: AOAM531WSG366ECW47qurvJU/G5wYiMzdRu/DU+81gC68s+f+nYASd3v
 xEadUlxCu/qBfdN9RKJXhkFy+hpz8mY=
X-Google-Smtp-Source: ABdhPJx/myRPhuR55a74HdT70HFNXwrpzvOTVQHeCRLKndhcEkRrxu+jSerzNlNLoGxgHl6P5zl7sA==
X-Received: by 2002:a63:6cc5:0:b0:3ab:7a48:af2b with SMTP id
 h188-20020a636cc5000000b003ab7a48af2bmr10544359pgc.302.1651080117930; 
 Wed, 27 Apr 2022 10:21:57 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:76e8:b785:3fb9:b6d6])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a056a00239000b004fa7103e13csm21202124pfc.41.2022.04.27.10.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 10:21:57 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] tests/tcg/xtensa: enable autorefill phys_mem tests for
 MMUv3
Date: Wed, 27 Apr 2022 10:21:38 -0700
Message-Id: <20220427172140.1406059-6-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427172140.1406059-1-jcmvbkbc@gmail.com>
References: <20220427172140.1406059-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Autorefill tests in the phys_mem test suite are disabled for cores that
have spanning TLB way, i.e. for all MMUv3 cores. Instead of disabling it
invalidate TLB mappings for entries that conflict with the test.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 tests/tcg/xtensa/test_phys_mem.S | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/xtensa/test_phys_mem.S b/tests/tcg/xtensa/test_phys_mem.S
index 9bb3ee3866ed..f935a702945c 100644
--- a/tests/tcg/xtensa/test_phys_mem.S
+++ b/tests/tcg/xtensa/test_phys_mem.S
@@ -2,7 +2,7 @@
 
 test_suite phys_mem
 
-#if XCHAL_HAVE_PTP_MMU && !XCHAL_HAVE_SPANNING_WAY
+#if XCHAL_HAVE_PTP_MMU
 
 .purgem test_init
 
@@ -13,6 +13,14 @@ test_suite phys_mem
     witlb   a2, a3
     movi    a2, 0xc0000000
     wsr     a2, ptevaddr
+#if XCHAL_HAVE_SPANNING_WAY
+    movi    a2, 0xc0000000 | XCHAL_SPANNING_WAY
+    idtlb   a2
+    iitlb   a2
+    movi    a2, 0x20000000 | XCHAL_SPANNING_WAY
+    idtlb   a2
+    iitlb   a2
+#endif
 .endm
 
 test inst_fetch_get_pte_no_phys
-- 
2.30.2


