Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB80BB31A9
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Sep 2019 21:26:51 +0200 (CEST)
Received: from localhost ([::1]:56566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9aAc-000068-PQ
	for lists+qemu-devel@lfdr.de; Sun, 15 Sep 2019 15:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39993)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1i9a7h-00061P-3Z
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 15:23:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1i9a7f-0001z8-Tx
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 15:23:49 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:43267)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1i9a7f-0001yr-N0
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 15:23:47 -0400
Received: by mail-ed1-x543.google.com with SMTP id r9so2479900edl.10
 for <qemu-devel@nongnu.org>; Sun, 15 Sep 2019 12:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DqChsnZIXAGMvroXVL0MQvbI8g2z6bOPhBgHC6Jjg7E=;
 b=a1Ha0zzMJIzsr9apMpWhp6SNsd+urEUORfOWPwnIP51/iyEBfLjGlx34Y0Vem8cCrf
 TnNkf6znufNY/HkPxZGIIUco5Ex9x3E17avFs5lMlll1S+xsO3Oq83UQx+UjCiK8YDjG
 Sh73y9ZNScQKj00cinRt6L6zzKY1Us073XDkGEj/XMrEXGim8clFCHIQO1obwwbSoRmY
 R+yUYui7Kct3imjW6SwC70LwieEKHpCNazMpUq2QSG5+PnWW8Bnd4cnIjERCxIN3dBAc
 WnOgs6vJj/+0s8xxYpP16QXC2gzhDnK6d7STfKSz9RvlsPe7NGPDImOWfUit2eVmeo44
 mXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DqChsnZIXAGMvroXVL0MQvbI8g2z6bOPhBgHC6Jjg7E=;
 b=CmRG3PGuDMjS4YwTEPz0EK6y/qyWm7/BBC4aTy3uUKS/eWhgp8r+LEjqG/FkA9IQsV
 UcFUMMHjeKouTe3jBpkSlKgQk4cB9BYA3Zp/zsVRjdea9PNmcEfLCsF7p233zfBseF7p
 LRx/XOqqU0FalKyufzbxyUt8HftTChMK4oUwX4q8CzX6c6l7309VrlC+6JunZnK0C1q6
 hzw5lwz1GOH6fXob1QIcs+xfF+sQ0NBu+qpWMjlvj3q1mjUH6X3UCaxXRTuFwAQ6vx9t
 i9ILqW8+iHz4Gj/AOuvMXL7R5y1tWnnzw5cfkAgmSY4PpirKoNjhBHM7upZi7QBtATic
 42hQ==
X-Gm-Message-State: APjAAAVjzIBpe8xsI/SSA1A9cxioXbtItbG3UW8rZDXwQxSNMHR33DCB
 dH0fYwozVSVN9nTJUTB1SVYVsTKD
X-Google-Smtp-Source: APXvYqzr2xj4qmMMiJ6/RU2LzYrwXQQpKxD/kzkWWpLmIT/CiRHcjdOYdYtiQXg2snGtm0reLDSRlA==
X-Received: by 2002:a50:c351:: with SMTP id q17mr20891295edb.123.1568575426537; 
 Sun, 15 Sep 2019 12:23:46 -0700 (PDT)
Received: from nullptr.home.dirty-ice.org
 (2a01-036c-0113-74ef-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:74ef::5])
 by smtp.gmail.com with ESMTPSA id j20sm6480562edy.95.2019.09.15.12.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2019 12:23:46 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
 <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
 <DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 15 Sep 2019 21:23:24 +0200
Message-Id: <3e95a57a0663f1f4464cd3515e252628791c971e.1568574965.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1568574965.git.DirtY.iCE.hu@gmail.com>
References: <cover.1568574965.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::543
Subject: [Qemu-devel] [PATCH v3 08/24] sdlaudio: port to the new audio
 backend api
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Kővágó, Zoltán <DirtY.iCE.hu@gmail.com>
---
 audio/sdlaudio.c | 87 +++++++++++++++++++++++-------------------------
 1 file changed, 42 insertions(+), 45 deletions(-)

diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index 14b11f0335..f7ac8cd101 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -41,8 +41,6 @@
 
 typedef struct SDLVoiceOut {
     HWVoiceOut hw;
-    size_t live;
-    size_t decr;
 } SDLVoiceOut;
 
 static struct SDLAudioState {
@@ -184,62 +182,59 @@ static void sdl_callback (void *opaque, Uint8 *buf, int len)
     SDLVoiceOut *sdl = opaque;
     SDLAudioState *s = &glob_sdl;
     HWVoiceOut *hw = &sdl->hw;
-    size_t samples = len >> hw->info.shift;
-    size_t to_mix, decr;
 
-    if (s->exit || !sdl->live) {
+    if (s->exit) {
         return;
     }
 
     /* dolog ("in callback samples=%zu live=%zu\n", samples, sdl->live); */
 
-    to_mix = MIN(samples, sdl->live);
-    decr = to_mix;
-    while (to_mix) {
-        size_t chunk = MIN(to_mix, hw->samples - hw->rpos);
-        struct st_sample *src = hw->mix_buf + hw->rpos;
-
-        /* dolog ("in callback to_mix %zu, chunk %zu\n", to_mix, chunk); */
-        hw->clip(buf, src, chunk);
-        hw->rpos = (hw->rpos + chunk) % hw->samples;
-        to_mix -= chunk;
-        buf += chunk << hw->info.shift;
+    while (hw->pending_emul && len) {
+        size_t write_len;
+        ssize_t start = ((ssize_t) hw->pos_emul) - hw->pending_emul;
+        if (start < 0) {
+            start += hw->size_emul;
+        }
+        assert(start >= 0 && start < hw->size_emul);
+
+        write_len = MIN(MIN(hw->pending_emul, len),
+                        hw->size_emul - start);
+
+        memcpy(buf, hw->buf_emul + start, write_len);
+        hw->pending_emul -= write_len;
+        len -= write_len;
+        buf += write_len;
     }
-    samples -= decr;
-    sdl->live -= decr;
-    sdl->decr += decr;
 
-    /* dolog ("done len=%zu\n", len); */
-
-    /* SDL2 does not clear the remaining buffer for us, so do it on our own */
-    if (samples) {
-        memset(buf, 0, samples << hw->info.shift);
+    /* clear remaining buffer that we couldn't fill with data */
+    if (len) {
+        memset(buf, 0, len);
     }
 }
 
-static size_t sdl_run_out(HWVoiceOut *hw, size_t live)
-{
-    size_t decr;
-    SDLVoiceOut *sdl = (SDLVoiceOut *) hw;
-
-    SDL_LockAudio();
-
-    if (sdl->decr > live) {
-        ldebug ("sdl->decr %d live %d sdl->live %d\n",
-                sdl->decr,
-                live,
-                sdl->live);
+#define SDL_WRAPPER_FUNC(name, ret_type, args_decl, args, fail, unlock) \
+    static ret_type glue(sdl_, name)args_decl                           \
+    {                                                                   \
+        ret_type ret;                                                   \
+                                                                        \
+        SDL_LockAudio();                                                \
+                                                                        \
+        ret = glue(audio_generic_, name)args;                           \
+                                                                        \
+        SDL_UnlockAudio();                                              \
+        return ret;                                                     \
     }
 
-    decr = MIN (sdl->decr, live);
-    sdl->decr -= decr;
-
-    sdl->live = live;
+SDL_WRAPPER_FUNC(get_buffer_out, void *, (HWVoiceOut *hw, size_t *size),
+                 (hw, size), *size = 0, sdl_unlock)
+SDL_WRAPPER_FUNC(put_buffer_out_nowrite, size_t,
+                 (HWVoiceOut *hw, void *buf, size_t size), (hw, buf, size),
+                 /*nothing*/, sdl_unlock_and_post)
+SDL_WRAPPER_FUNC(write, size_t,
+                 (HWVoiceOut *hw, void *buf, size_t size), (hw, buf, size),
+                 /*nothing*/, sdl_unlock_and_post)
 
-    SDL_UnlockAudio();
-
-    return decr;
-}
+#undef SDL_WRAPPER_FUNC
 
 static void sdl_fini_out (HWVoiceOut *hw)
 {
@@ -336,7 +331,9 @@ static void sdl_audio_fini (void *opaque)
 static struct audio_pcm_ops sdl_pcm_ops = {
     .init_out = sdl_init_out,
     .fini_out = sdl_fini_out,
-    .run_out  = sdl_run_out,
+    .write    = sdl_write,
+    .get_buffer_out = sdl_get_buffer_out,
+    .put_buffer_out = sdl_put_buffer_out_nowrite,
     .ctl_out  = sdl_ctl_out,
 };
 
-- 
2.23.0


