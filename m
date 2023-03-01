Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 181836A7089
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 17:07:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOyw-0008OW-HB; Wed, 01 Mar 2023 11:07:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pXOyt-0008N6-0E
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 11:07:03 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pXOyq-0003ed-5I
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 11:07:02 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 2F90632004AE;
 Wed,  1 Mar 2023 11:06:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 01 Mar 2023 11:06:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1677686817; x=
 1677773217; bh=sMf43TVwgi++OC7K4toVYgDwaIu2Rs2OOEwE/2BNMss=; b=D
 0xmsxMjWsT3JfTXDIw1MTWmb1uZZ//sbTxB2PBLkAl50l2e0FBUiG7iUBRqnCZEu
 mq5JgItUQUPjQCI+QJYT6REnwtFb+p/vS9ACGsVRMaVcVBrHQgs2ZLlgJDuRt4HI
 wl3PiC7qOpSIO4Ky4XL54a2i3+hMcd3WN/y4ULFI/mYydSZWzVsYRj6KMIenWK5G
 VMc01Zuipdvx9vie6osYPl66S1Y8kel1P4SBLKBS6cLwAmK0ZyTr83QYch+rdTRq
 T7v1fKgy2FsOLqj38IXFFW+bl5I+yzb3Ns+BW+K6VQGDnuaXsmBhsCNzq4dikb6E
 UwCXaRaApRuNVo2DlkNIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677686817; x=
 1677773217; bh=sMf43TVwgi++OC7K4toVYgDwaIu2Rs2OOEwE/2BNMss=; b=K
 1WJuAJOrP7sFUV357T/uwP3gPdibUsrTHd2Sfn60FsFfaQiOjOHaPNvUafSdt9Qa
 EGt7hago/YQSImdAVx6Ed8o7mwYlrXv8RsTEbN891msnvtdDkGHErsi5Tkr7M/1s
 4BGK9Ej+gLvb4nb3G9ZklJ1Lbz0pnk+IMHVG2cK9yEMaRe2QGdUQSGHysKOylMUu
 nY6xiWlo/Aizwq2Y4XoNG3NEBmUop7MbvRAK8NXb4zuiEY8BxwH6D2VS9FJXqS/L
 ba+pMD6hp34DwQG3z8uSObnCyMBrbEttFFD5RKwGbuIR+KQiVYL3na0/dWZc5q78
 2BrAMYQ5wnFrZgcj4MnOQ==
X-ME-Sender: <xms:IXj_Y93n8vQpq4XAcuN_CN9cb164Khsk0jr47cOqgdFNXPHD9j4wNA>
 <xme:IXj_Y0FjbzVpCz6OVmHA_2JJWkXaHpb15wYEYq0Y5yPIXWXeBfELsOlDUo-LCZzm3
 ncvWedd0MCFQv4gow>
X-ME-Received: <xmr:IXj_Y94A5qg_w3BQYq5ifd5_y8NMePhbl_TTZu72aqaCpl1J9P1v4SXPELTLPlxlZjECg6MiaJOUK43glyzA7AXhdlU-x3532y_Y5ZH1R_7HcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelhedgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredt
 redtjeenucfhrhhomhepffgrnhhivghlucgiuhcuoegugihusegugihuuhhurdighiiiqe
 enucggtffrrghtthgvrhhnpeetheekkefggfeivedvtefgleeiffdtleegfeeuledvuddt
 vdduhfekgfdutdevkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegugihusegugihuuhhurdighiii
X-ME-Proxy: <xmx:IXj_Y60-QSR0JBy-u24-XDVpWyxd74LrejB4g0EOqKLkkN-c5rovHg>
 <xmx:IXj_YwHi1hflfI6RG2EaaqD9zhyEQ69a5Jg-MxP5u-4L4Z3iuE8MAg>
 <xmx:IXj_Y7-8Xe2dXQesxX54fo9jbLIlFr03NaScTr2cfXfX2_XK9hDLMw>
 <xmx:IXj_Y1TOAY_Y3q5WTTLsrzF5VeZldmgIyemstV1fyu8HLTYoGQ398w>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Mar 2023 11:06:57 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: marcandre.lureau@gmail.com,
	berrange@redhat.com
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 2/2] qemu-keymap: Fix memory leaks
Date: Wed,  1 Mar 2023 09:05:46 -0700
Message-Id: <54431d56ee32fd9f01f2080dc5e8606e4b83fb3a.1677686566.git.dxu@dxuuu.xyz>
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

When building with `--enable-sanitizers`, I was getting quite a few
memory leak crashes from ASAN:

        [21/574] Generating pc-bios/keymaps/fr-ch with a custom command
        FAILED: pc-bios/keymaps/fr-ch
        /home/dxu/dev/qemu/build/qemu-keymap -f pc-bios/keymaps/fr-ch -l ch -v fr

        =================================================================
        ==3232549==ERROR: LeakSanitizer: detected memory leaks

        Direct leak of 1424 byte(s) in 1 object(s) allocated from:
            #0 0x7f32636bf411 in __interceptor_calloc /usr/src/debug/gcc/gcc/...
            #1 0x7f32635db73e  (/usr/lib/libxkbcommon.so.0+0x2273e)

Fix leaks by correctly decrementing refcounts on xkb structs.

Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qemu-keymap.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/qemu-keymap.c b/qemu-keymap.c
index 229866e004..ed8cee3467 100644
--- a/qemu-keymap.c
+++ b/qemu-keymap.c
@@ -203,6 +203,7 @@ int main(int argc, char *argv[])
     map = xkb_keymap_new_from_names(ctx, &names, XKB_KEYMAP_COMPILE_NO_FLAGS);
     if (!map) {
         /* libxkbcommon prints error */
+        xkb_context_unref(ctx);
         exit(1);
     }
 
@@ -227,7 +228,11 @@ int main(int argc, char *argv[])
     state = xkb_state_new(map);
     xkb_keymap_key_for_each(map, walk_map, state);
     xkb_state_unref(state);
+    xkb_keymap_unref(map);
+    xkb_context_unref(ctx);
     state = NULL;
+    map = NULL;
+    ctx = NULL;
 
     /* add quirks */
     fprintf(outfile,
-- 
2.39.1


