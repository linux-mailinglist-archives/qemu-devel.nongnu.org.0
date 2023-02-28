Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 399636A60AF
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 21:49:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX6tc-0000ti-3B; Tue, 28 Feb 2023 15:48:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pX6tY-0000t7-Vj
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 15:48:21 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pX6tX-0006ZZ-EY
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 15:48:20 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id ED48B5C00DF;
 Tue, 28 Feb 2023 15:48:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 28 Feb 2023 15:48:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1677617298; x=1677703698; bh=T4
 DxE5/RjZ3mZ8CLqsE3AN6GYnJeLsyPZHiKvoacSss=; b=HqZ6W/J9saKyXG6H8F
 6hrq8EQfr5V8cKyHpC/lyW/0yVSf4vzjsXAgFubwZw3whvC3ZX3tfBHzkrLspoLQ
 45PKoCbQ6gknfLTAs1Qa/GPjVjVIlnROtBl3TrwfB3KvOU20grSmAoUvW43GZ7kO
 SMUYY1oTHhinAmzLoewnyxAoQThML9JcILeT+JtxadeXbsJ/oqSpv62K4J0My5e7
 JHQa++6ONwQ+hSUdh+roA5mWqecvKr8ogbR/dGfJbXTZgqXH74obWQtfmgwcKrcG
 oZaG/vS+7K97eZRhco3IwibDrK+HEwlUf/+MZZx91mY+tS9sxJm8nFFfxHrjRiV+
 MT4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1677617298; x=1677703698; bh=T4DxE5/RjZ3mZ
 8CLqsE3AN6GYnJeLsyPZHiKvoacSss=; b=eYaYvlPVqQbtAxWH/MqM3qsFbJ1GI
 OKQuOnEBYJNRGbLLoyDT7jfLRBLShmChhkdoS8ZrXuQAkbuGugXteLqa836DFP3L
 sEOX6sEU9SE2GD1LhIlZujasuKl58boM51wVzJbEzii2h5+FDZ6Gog960kqC/S2K
 6OzfQZWLN4zQ4aJdfflxGvzNGGq7Idj6vOfeNQ8tKCT0Rid/4FgL/B2dT3nDibC1
 Cwbza8v14YGEEE4JsMzIDv3Su+adxuYEFW4Kuj2Mop3or+9NMkqO8tT/LNlSuYmh
 wnTso/CTF2ukfw2ebrCb4hJBc8xO7QlLpF6CkIy5Hgq2dpHOIKj5hvBBg==
X-ME-Sender: <xms:kmj-Y59SzkbC5wdK4xH_qMNNH-vY5JAnkH7JVS4spkmuFH3sqaLn-A>
 <xme:kmj-Y9sjntg0HwWppUHWAPwamZtYHIBO_WnaLL62ACtvphbQLUm_9iOpTCQPTTKdr
 fTG6oG1BKkFKB9HRw>
X-ME-Received: <xmr:kmj-Y3Be0D4kQAwisPHh_4nGw12zYwvz2Ps3R6gtE7psMZKIfdEyViqIZEVPSNUe6N_rh9KS6cX-zovNZxNbpuDKvgy0zz0LiQHBvzRKzl9UQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelfedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
 evufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghnihgvlhcuighuuceo
 ugiguhesugiguhhuuhdrgiihiieqnecuggftrfgrthhtvghrnhepgfefgfegjefhudeike
 dvueetffelieefuedvhfehjeeljeejkefgffeghfdttdetnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:kmj-Y9dBtGejcD-k0__RJUjwkmRbds3uOmXA58iZx23tp09Xahg3ug>
 <xmx:kmj-Y-P2XnuxUayYfrCdoubNLMqmZEzMwZXFa0uGYJyPBYpI6JiHxw>
 <xmx:kmj-Y_msac2cIPU3FEE2SwaWfRiFZoXB4bVwuk7ZEJ_cpD2eEbnY4Q>
 <xmx:kmj-Y4XZAOJPbFTMHk2LHfxtxTD3wAqLhghkAy_BqGxrJ0KKSOwFCg>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Feb 2023 15:48:18 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: marcandre.lureau@gmail.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v3 2/4] qemu-keymap: Fix memory leaks
Date: Tue, 28 Feb 2023 13:48:02 -0700
Message-Id: <3f1aaa1fb5b5fa6daaf4e0080faeb4b094030a06.1677617035.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1677617035.git.dxu@dxuuu.xyz>
References: <cover.1677617035.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
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


