Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9906C2F063F
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 11:05:11 +0100 (CET)
Received: from localhost ([::1]:56850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyXaw-00033U-Lo
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 05:05:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXYg-0001DL-NE
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:02:50 -0500
Received: from mailout02.t-online.de ([194.25.134.17]:47304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXYf-0005Gn-3O
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:02:50 -0500
Received: from fwd05.aul.t-online.de (fwd05.aul.t-online.de [172.20.27.149])
 by mailout02.t-online.de (Postfix) with SMTP id 9E48341BBE3A;
 Sun, 10 Jan 2021 11:02:46 +0100 (CET)
Received: from linpower.localnet
 (ZZ4B+EZdoheBFqCKvGzaHXSWmtWglRZDPhjzb4w2t8vqRko9bQ4mNLUhO6YakwkQWx@[93.236.152.29])
 by fwd05.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kyXYW-1Qu1Lc0; Sun, 10 Jan 2021 11:02:40 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id DECF0200611; Sun, 10 Jan 2021 11:02:39 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 01/23] sdlaudio: remove leftover SDL1.2 code
Date: Sun, 10 Jan 2021 11:02:17 +0100
Message-Id: <20210110100239.27588-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: ZZ4B+EZdoheBFqCKvGzaHXSWmtWglRZDPhjzb4w2t8vqRko9bQ4mNLUhO6YakwkQWx
X-TOI-EXPURGATEID: 150726::1610272960-000174C8-111B19AD/0/0 CLEAN NORMAL
X-TOI-MSGID: e41d6245-f53d-4bea-89aa-6feb0c65990b
Received-SPF: none client-ip=194.25.134.17;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout02.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?q?Zolt=C3=A1n=20K=C5=91v=C3=A1g=C3=B3?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/sdlaudio.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index 21b7a0484b..bf3cfb8456 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -240,28 +240,24 @@ static void sdl_callback (void *opaque, Uint8 *buf, int len)
     }
 }
 
-#define SDL_WRAPPER_FUNC(name, ret_type, args_decl, args, fail, unlock) \
-    static ret_type glue(sdl_, name)args_decl                           \
-    {                                                                   \
-        ret_type ret;                                                   \
-                                                                        \
-        SDL_LockAudio();                                                \
-                                                                        \
-        ret = glue(audio_generic_, name)args;                           \
-                                                                        \
-        SDL_UnlockAudio();                                              \
-        return ret;                                                     \
+#define SDL_WRAPPER_FUNC(name, ret_type, args_decl, args)      \
+    static ret_type glue(sdl_, name)args_decl                  \
+    {                                                          \
+        ret_type ret;                                          \
+                                                               \
+        SDL_LockAudio();                                       \
+        ret = glue(audio_generic_, name)args;                  \
+        SDL_UnlockAudio();                                     \
+                                                               \
+        return ret;                                            \
     }
 
 SDL_WRAPPER_FUNC(get_buffer_out, void *, (HWVoiceOut *hw, size_t *size),
-                 (hw, size), *size = 0, sdl_unlock)
+                 (hw, size))
 SDL_WRAPPER_FUNC(put_buffer_out, size_t,
-                 (HWVoiceOut *hw, void *buf, size_t size), (hw, buf, size),
-                 /*nothing*/, sdl_unlock_and_post)
+                 (HWVoiceOut *hw, void *buf, size_t size), (hw, buf, size))
 SDL_WRAPPER_FUNC(write, size_t,
-                 (HWVoiceOut *hw, void *buf, size_t size), (hw, buf, size),
-                 /*nothing*/, sdl_unlock_and_post)
-
+                 (HWVoiceOut *hw, void *buf, size_t size), (hw, buf, size))
 #undef SDL_WRAPPER_FUNC
 
 static void sdl_fini_out (HWVoiceOut *hw)
-- 
2.26.2


