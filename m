Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9835B31AE
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Sep 2019 21:30:35 +0200 (CEST)
Received: from localhost ([::1]:56594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9aEE-0003nf-JC
	for lists+qemu-devel@lfdr.de; Sun, 15 Sep 2019 15:30:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39930)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1i9a7c-0005xR-AE
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 15:23:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1i9a7a-0001x2-IW
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 15:23:44 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:32769)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1i9a7a-0001wl-A0
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 15:23:42 -0400
Received: by mail-ed1-x542.google.com with SMTP id c4so2493176edl.0
 for <qemu-devel@nongnu.org>; Sun, 15 Sep 2019 12:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lDG6NNDECQDn4/nyyITVRisGzx5VHFjiAPGOHzavck0=;
 b=jrlx9cGDmj6FGmXnUr0ITnmu6RO5pc/3KV3VIC5u/2wyd9EWjMEpw2FPeahmLRyMRm
 5J6KB8zJL5u5CxvU9+AydP2p3TqgvuvXrDeYUAmu9WL0qWkvmseG4mp04pOvlQhhNkeM
 djqhbtIhhANWbTtvZbiGxti5D8vj2kTvFSfmgd1vldzx+d7oqHC1VhFm6KKzGMcIRUiw
 /F/MzzXsMDy5sw+S18Chi6S/MxocZXixPNInVMbcbyVuDcS2rCotKXlPC7LL/u+HgcJs
 2OUjK3iZdo3MnfzkCskaKtItENc3v3Q2vyu8KuL6Tt0JWOR44MsMgK0aFZIgUL7stG+2
 l0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lDG6NNDECQDn4/nyyITVRisGzx5VHFjiAPGOHzavck0=;
 b=eii/EbPoANaZbEfhTD2/OijFW9Kn2j1EYgdsCp9qwaPW9cKOl3E9Y6xL34QuMxXhs7
 ZKvVw3s52i53SjkA+mUyKtWhZYbIqpkM9Ah9dAFJii8dER3MRCnzEBQE3Sp5teLddUOn
 88nnbOHRkbn/pHI5jKB0gX82NyE80aipcWxEsVmyV0g18giN9tUqgBlxD4P5Bd921Gb/
 wxvIkmh7ZrU/kBDUw/++KMzcAM1qHrCCo48iUod68hl4Rlxdt6No+BRwf8ga/tRGfb4t
 GBoKXtx3g/L65YN3KefVpe/AGwJurUlLvfk3CqPS28fNzeVMHvbicpyBi8Q6nvEWFRPt
 dnuw==
X-Gm-Message-State: APjAAAUdYK5hvTnjShGbHQxMbv+VvxUkimTlnIe9/ABpyagvKNTMZxIZ
 qkTeguDgLDj2Fb+NMBnm4cV+81/q
X-Google-Smtp-Source: APXvYqzbrVgKDOq8jTOYptEaurBjC+5R/RY8RWcNchZ3l6OJ48vnpo8vvY7Lov45vEGJa7V/5lX/Yw==
X-Received: by 2002:a05:6402:13d0:: with SMTP id
 a16mr58178216edx.154.1568575421015; 
 Sun, 15 Sep 2019 12:23:41 -0700 (PDT)
Received: from nullptr.home.dirty-ice.org
 (2a01-036c-0113-74ef-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:74ef::5])
 by smtp.gmail.com with ESMTPSA id j20sm6480562edy.95.2019.09.15.12.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2019 12:23:40 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
 <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
 <DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 15 Sep 2019 21:23:18 +0200
Message-Id: <3978a3642e68da4d0af61c7618fcaa4ee22b009f.1568574965.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1568574965.git.DirtY.iCE.hu@gmail.com>
References: <cover.1568574965.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::542
Subject: [Qemu-devel] [PATCH v3 02/24] alsaaudio: port to the new audio
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
 audio/alsaaudio.c | 302 ++++++++++++----------------------------------
 1 file changed, 80 insertions(+), 222 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index 591344dccd..19124d09d8 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -44,9 +44,6 @@ struct pollhlp {
 
 typedef struct ALSAVoiceOut {
     HWVoiceOut hw;
-    int wpos;
-    int pending;
-    void *pcm_buf;
     snd_pcm_t *handle;
     struct pollhlp pollhlp;
     Audiodev *dev;
@@ -55,7 +52,6 @@ typedef struct ALSAVoiceOut {
 typedef struct ALSAVoiceIn {
     HWVoiceIn hw;
     snd_pcm_t *handle;
-    void *pcm_buf;
     struct pollhlp pollhlp;
     Audiodev *dev;
 } ALSAVoiceIn;
@@ -602,102 +598,64 @@ static int alsa_open(bool in, struct alsa_params_req *req,
     return -1;
 }
 
-static snd_pcm_sframes_t alsa_get_avail (snd_pcm_t *handle)
+static size_t alsa_write(HWVoiceOut *hw, void *buf, size_t len)
 {
-    snd_pcm_sframes_t avail;
-
-    avail = snd_pcm_avail_update (handle);
-    if (avail < 0) {
-        if (avail == -EPIPE) {
-            if (!alsa_recover (handle)) {
-                avail = snd_pcm_avail_update (handle);
-            }
-        }
-
-        if (avail < 0) {
-            alsa_logerr (avail,
-                         "Could not obtain number of available frames\n");
-            return -1;
-        }
-    }
+    ALSAVoiceOut *alsa = (ALSAVoiceOut *) hw;
+    size_t pos = 0;
+    size_t len_frames = len >> hw->info.shift;
+
+    while (len_frames) {
+        char *src = advance(buf, pos);
+        snd_pcm_sframes_t written;
+
+        written = snd_pcm_writei(alsa->handle, src, len_frames);
+
+        if (written <= 0) {
+            switch (written) {
+            case 0:
+                trace_alsa_wrote_zero(len_frames);
+                return pos;
+
+            case -EPIPE:
+                if (alsa_recover(alsa->handle)) {
+                    alsa_logerr(written, "Failed to write %zu frames\n",
+                                len_frames);
+                    return pos;
+                }
+                trace_alsa_xrun_out();
+                continue;
+
+            case -ESTRPIPE:
+                /*
+                 * stream is suspended and waiting for an application
+                 * recovery
+                 */
+                if (alsa_resume(alsa->handle)) {
+                    alsa_logerr(written, "Failed to write %zu frames\n",
+                                len_frames);
+                    return pos;
+                }
+                trace_alsa_resume_out();
+                continue;
 
-    return avail;
-}
+            case -EAGAIN:
+                return pos;
 
-static void alsa_write_pending (ALSAVoiceOut *alsa)
-{
-    HWVoiceOut *hw = &alsa->hw;
-
-    while (alsa->pending) {
-        int left_till_end_samples = hw->samples - alsa->wpos;
-        int len = MIN (alsa->pending, left_till_end_samples);
-        char *src = advance (alsa->pcm_buf, alsa->wpos << hw->info.shift);
-
-        while (len) {
-            snd_pcm_sframes_t written;
-
-            written = snd_pcm_writei (alsa->handle, src, len);
-
-            if (written <= 0) {
-                switch (written) {
-                case 0:
-                    trace_alsa_wrote_zero(len);
-                    return;
-
-                case -EPIPE:
-                    if (alsa_recover (alsa->handle)) {
-                        alsa_logerr (written, "Failed to write %d frames\n",
-                                     len);
-                        return;
-                    }
-                    trace_alsa_xrun_out();
-                    continue;
-
-                case -ESTRPIPE:
-                    /* stream is suspended and waiting for an
-                       application recovery */
-                    if (alsa_resume (alsa->handle)) {
-                        alsa_logerr (written, "Failed to write %d frames\n",
-                                     len);
-                        return;
-                    }
-                    trace_alsa_resume_out();
-                    continue;
-
-                case -EAGAIN:
-                    return;
-
-                default:
-                    alsa_logerr (written, "Failed to write %d frames from %p\n",
-                                 len, src);
-                    return;
-                }
+            default:
+                alsa_logerr(written, "Failed to write %zu frames from %p\n",
+                            len, src);
+                return pos;
             }
-
-            alsa->wpos = (alsa->wpos + written) % hw->samples;
-            alsa->pending -= written;
-            len -= written;
         }
-    }
-}
-
-static size_t alsa_run_out(HWVoiceOut *hw, size_t live)
-{
-    ALSAVoiceOut *alsa = (ALSAVoiceOut *) hw;
-    size_t decr;
-    snd_pcm_sframes_t avail;
 
-    avail = alsa_get_avail (alsa->handle);
-    if (avail < 0) {
-        dolog ("Could not get number of available playback frames\n");
-        return 0;
+        pos += written << hw->info.shift;
+        if (written < len_frames) {
+            break;
+        }
+        len_frames -= written;
     }
 
-    decr = MIN (live, avail);
-    decr = audio_pcm_hw_clip_out (hw, alsa->pcm_buf, decr, alsa->pending);
-    alsa->pending += decr;
-    alsa_write_pending (alsa);
-    return decr;
+    return pos;
 }
 
 static void alsa_fini_out (HWVoiceOut *hw)
@@ -706,9 +664,6 @@ static void alsa_fini_out (HWVoiceOut *hw)
 
     ldebug ("alsa_fini\n");
     alsa_anal_close (&alsa->handle, &alsa->pollhlp);
-
-    g_free(alsa->pcm_buf);
-    alsa->pcm_buf = NULL;
 }
 
 static int alsa_init_out(HWVoiceOut *hw, struct audsettings *as,
@@ -737,14 +692,6 @@ static int alsa_init_out(HWVoiceOut *hw, struct audsettings *as,
     audio_pcm_init_info (&hw->info, &obt_as);
     hw->samples = obt.samples;
 
-    alsa->pcm_buf = audio_calloc(__func__, obt.samples, 1 << hw->info.shift);
-    if (!alsa->pcm_buf) {
-        dolog("Could not allocate DAC buffer (%zu samples, each %d bytes)\n",
-              hw->samples, 1 << hw->info.shift);
-        alsa_anal_close1 (&handle);
-        return -1;
-    }
-
     alsa->pollhlp.s = hw->s;
     alsa->handle = handle;
     alsa->dev = dev;
@@ -839,14 +786,6 @@ static int alsa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
     audio_pcm_init_info (&hw->info, &obt_as);
     hw->samples = obt.samples;
 
-    alsa->pcm_buf = audio_calloc(__func__, hw->samples, 1 << hw->info.shift);
-    if (!alsa->pcm_buf) {
-        dolog("Could not allocate ADC buffer (%zu samples, each %d bytes)\n",
-              hw->samples, 1 << hw->info.shift);
-        alsa_anal_close1 (&handle);
-        return -1;
-    }
-
     alsa->pollhlp.s = hw->s;
     alsa->handle = handle;
     alsa->dev = dev;
@@ -858,129 +797,48 @@ static void alsa_fini_in (HWVoiceIn *hw)
     ALSAVoiceIn *alsa = (ALSAVoiceIn *) hw;
 
     alsa_anal_close (&alsa->handle, &alsa->pollhlp);
-
-    g_free(alsa->pcm_buf);
-    alsa->pcm_buf = NULL;
 }
 
-static size_t alsa_run_in(HWVoiceIn *hw)
+static size_t alsa_read(HWVoiceIn *hw, void *buf, size_t len)
 {
     ALSAVoiceIn *alsa = (ALSAVoiceIn *) hw;
-    int hwshift = hw->info.shift;
-    int i;
-    size_t live = audio_pcm_hw_get_live_in (hw);
-    size_t dead = hw->samples - live;
-    size_t decr;
-    struct {
-        size_t add;
-        size_t len;
-    } bufs[2] = {
-        { .add = hw->wpos, .len = 0 },
-        { .add = 0,        .len = 0 }
-    };
-    snd_pcm_sframes_t avail;
-    snd_pcm_uframes_t read_samples = 0;
-
-    if (!dead) {
-        return 0;
-    }
+    size_t pos = 0;
 
-    avail = alsa_get_avail (alsa->handle);
-    if (avail < 0) {
-        dolog ("Could not get number of captured frames\n");
-        return 0;
-    }
-
-    if (!avail) {
-        snd_pcm_state_t state;
-
-        state = snd_pcm_state (alsa->handle);
-        switch (state) {
-        case SND_PCM_STATE_PREPARED:
-            avail = hw->samples;
-            break;
-        case SND_PCM_STATE_SUSPENDED:
-            /* stream is suspended and waiting for an application recovery */
-            if (alsa_resume (alsa->handle)) {
-                dolog ("Failed to resume suspended input stream\n");
-                return 0;
-            }
-            trace_alsa_resume_in();
-            break;
-        default:
-            trace_alsa_no_frames(state);
-            return 0;
-        }
-    }
+    while (len) {
+        void *dst = advance(buf, pos);
+        snd_pcm_sframes_t nread;
 
-    decr = MIN(dead, avail);
-    if (!decr) {
-        return 0;
-    }
+        nread = snd_pcm_readi(alsa->handle, dst, len >> hw->info.shift);
 
-    if (hw->wpos + decr > hw->samples) {
-        bufs[0].len = (hw->samples - hw->wpos);
-        bufs[1].len = (decr - (hw->samples - hw->wpos));
-    }
-    else {
-        bufs[0].len = decr;
-    }
+        if (nread <= 0) {
+            switch (nread) {
+            case 0:
+                trace_alsa_read_zero(len);
+                return pos;;
 
-    for (i = 0; i < 2; ++i) {
-        void *src;
-        struct st_sample *dst;
-        snd_pcm_sframes_t nread;
-        snd_pcm_uframes_t len;
-
-        len = bufs[i].len;
-
-        src = advance (alsa->pcm_buf, bufs[i].add << hwshift);
-        dst = hw->conv_buf + bufs[i].add;
-
-        while (len) {
-            nread = snd_pcm_readi (alsa->handle, src, len);
-
-            if (nread <= 0) {
-                switch (nread) {
-                case 0:
-                    trace_alsa_read_zero(len);
-                    goto exit;
-
-                case -EPIPE:
-                    if (alsa_recover (alsa->handle)) {
-                        alsa_logerr (nread, "Failed to read %ld frames\n", len);
-                        goto exit;
-                    }
-                    trace_alsa_xrun_in();
-                    continue;
-
-                case -EAGAIN:
-                    goto exit;
-
-                default:
-                    alsa_logerr (
-                        nread,
-                        "Failed to read %ld frames from %p\n",
-                        len,
-                        src
-                        );
-                    goto exit;
+            case -EPIPE:
+                if (alsa_recover(alsa->handle)) {
+                    alsa_logerr(nread, "Failed to read %zu frames\n", len);
+                    return pos;
                 }
-            }
+                trace_alsa_xrun_in();
+                continue;
 
-            hw->conv (dst, src, nread);
+            case -EAGAIN:
+                return pos;
 
-            src = advance (src, nread << hwshift);
-            dst += nread;
-
-            read_samples += nread;
-            len -= nread;
+            default:
+                alsa_logerr(nread, "Failed to read %zu frames to %p\n",
+                            len, dst);
+                return pos;;
+            }
         }
+
+        pos += nread << hw->info.shift;
+        len -= nread << hw->info.shift;
     }
 
- exit:
-    hw->wpos = (hw->wpos + read_samples) % hw->samples;
-    return read_samples;
+    return pos;
 }
 
 static int alsa_ctl_in (HWVoiceIn *hw, int cmd, ...)
@@ -1065,12 +923,12 @@ static void alsa_audio_fini (void *opaque)
 static struct audio_pcm_ops alsa_pcm_ops = {
     .init_out = alsa_init_out,
     .fini_out = alsa_fini_out,
-    .run_out  = alsa_run_out,
+    .write    = alsa_write,
     .ctl_out  = alsa_ctl_out,
 
     .init_in  = alsa_init_in,
     .fini_in  = alsa_fini_in,
-    .run_in   = alsa_run_in,
+    .read     = alsa_read,
     .ctl_in   = alsa_ctl_in,
 };
 
-- 
2.23.0


