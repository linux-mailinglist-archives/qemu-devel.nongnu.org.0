Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0339C5A3
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Aug 2019 20:50:15 +0200 (CEST)
Received: from localhost ([::1]:45698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1xag-00047u-It
	for lists+qemu-devel@lfdr.de; Sun, 25 Aug 2019 14:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57706)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1i1xXG-0001BK-D5
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 14:46:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1i1xXF-0004ng-6J
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 14:46:42 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:42397)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1i1xXF-0004nV-1z
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 14:46:41 -0400
Received: by mail-qk1-x743.google.com with SMTP id 201so12427582qkm.9
 for <qemu-devel@nongnu.org>; Sun, 25 Aug 2019 11:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cz79XjdkmViVpdk1H7R3zTMM+q7tgUGQ9sdBd1DrXRo=;
 b=QcuzilRIE/pH6kRXpxc2nxhJBJWV2PBVN7j1LjVjLeYrSlioi8R6xm3/hC0310PPeb
 k8uzCLp8HDok/J8k28IKGGouqKa+EcHiX7RL8CwaL8bxrMhCWW18M6Q5qOTrOssn25LJ
 mVH+QtoqT/c8gbtiQeYTChnhIoQ9qbu10/mpIGhENBRE/jVs0toXrMzJaKuzEYZ4jOyy
 1mZ8y428PcdYrWdFQ7suZE8uJUo+Pv2VJ01IdYrDWdGnHysJUOqZieJ/vnud64ifLnHE
 ZF0tcHf8ZoqCfY3KwumpU1jjDzTvtdN0YCcB+vIU/o+FxLv18koOW/oH4vPtk6DRc2sS
 xm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cz79XjdkmViVpdk1H7R3zTMM+q7tgUGQ9sdBd1DrXRo=;
 b=DM8d+FgV5NsjOxDjU49c2TWqz//giFY0pPefcUf110yBPMKYJHcdPylUhCHStDSJeS
 ppZ5KV+bkEnxwq3MtpUf8A5yEH9gLuFrgk4bwr46lnq/nJGYxpBdr+ikm7kH/Bv709L+
 GT/7keK8QnH6pQcDUOuQHRsrRPwnYoVIKrwzENrEDj0D+lt/SG4vQN4nSCGdNYgjHO7p
 TMt6TtllLGWgTtlHBZzcUGi7ZFU6sWLWEzqtbURMzWEAX+P5pxKg1R7G85NYU6NrajXm
 YMgcnM8uKPV5cs0t3qDB5vztBZY2zsv4w8czgjxx3V2aRo5JWuIDLCqlA/JF+uHBoZJE
 OqCQ==
X-Gm-Message-State: APjAAAVXvR2RF6dgJCVbmaUWvpCE75zMFLF97oohdupugtZAcHddN/+c
 IjbjyeakUX+PqS6tTRUt09ITdp/hALA=
X-Google-Smtp-Source: APXvYqyF+NSlXzCQZvZZO/29FPVRg4wVW85zDGPu/mbniFJWpzh/N7BIc14l4BPeCCS3q5/2ip6LSw==
X-Received: by 2002:a05:620a:68b:: with SMTP id
 f11mr7666240qkh.339.1566758800536; 
 Sun, 25 Aug 2019 11:46:40 -0700 (PDT)
Received: from nullptr.home.dirty-ice.org
 (2a01-036c-0113-61b1-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:61b1::5])
 by smtp.gmail.com with ESMTPSA id d3sm5348870qtq.32.2019.08.25.11.46.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Aug 2019 11:46:40 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
 <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
 <DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 25 Aug 2019 20:46:10 +0200
Message-Id: <dcff895661435b76f4159d3547b60e6c08cb777c.1566755452.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1566755452.git.DirtY.iCE.hu@gmail.com>
References: <cover.1566755452.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::743
Subject: [Qemu-devel] [PATCH 08/25] sdlaudio: port to the new audio backend
 api
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
-
-    /* dolog ("done len=%zu\n", len); */
 
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
+SDL_WRAPPER_FUNC(get_buffer_out, void *, (HWVoiceOut *hw, size_t *size),
+                 (hw, size), *size = 0, sdl_unlock)
+SDL_WRAPPER_FUNC(put_buffer_out_nowrite, size_t,
+                 (HWVoiceOut *hw, void *buf, size_t size), (hw, buf, size),
+                 /*nothing*/, sdl_unlock_and_post)
+SDL_WRAPPER_FUNC(write, size_t,
+                 (HWVoiceOut *hw, void *buf, size_t size), (hw, buf, size),
+                 /*nothing*/, sdl_unlock_and_post)
 
-    sdl->live = live;
-
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
2.22.0


