Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40686B31AA
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Sep 2019 21:28:20 +0200 (CEST)
Received: from localhost ([::1]:56580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9aC3-0001UI-8v
	for lists+qemu-devel@lfdr.de; Sun, 15 Sep 2019 15:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39924)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1i9a7b-0005x5-On
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 15:23:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1i9a7Z-0001wp-Ri
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 15:23:43 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:32768)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1i9a7Z-0001wb-Ia
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 15:23:41 -0400
Received: by mail-ed1-x541.google.com with SMTP id c4so2493162edl.0
 for <qemu-devel@nongnu.org>; Sun, 15 Sep 2019 12:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gQTXEae4XxyiTnyrCdtpgMdBnrBg+8cJykseiI2XC+k=;
 b=qQsilSh/8vi2ThzgGa0LJBB3rs4+V8rY7K1Lt8sVVgDqDatVQhd89Opbat0C9vPzTz
 s1OJLM+myeBSezRmLmpXOqOScuFuaHEEq7AQAQ+kjik9d39oj5jtUqU40ne7/EwXJSkh
 g8UEVvQgy+F8sRsz1adI8ciVqPnI0rhahlo3Y7RhALehDpFqUlUu6WLO8Ay5jimiovlI
 qTZN6G5YbLZO7VaQ0oaz71NTj9NtbkSRpDVEyH/bdY1jrCS6pPpqC+3gexJTYxWfhKwe
 kJVN+Pgk/t4TJPdiH6pFGiXB/gTUoLsGUEUEm7ibmSNq0PBKSWr1hCsLwxHG4b8UnBqI
 OtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gQTXEae4XxyiTnyrCdtpgMdBnrBg+8cJykseiI2XC+k=;
 b=H+UZDtOTLRjgKQXj60UCuAM9NJ2JcTW4FoZWQi/Ki6k87W1JjENansGPE0IHbb0Ldb
 cZXZu/tx6L1GYTo+do9vd9azOCmO2aOg7CxnVJ4062IZNN5IlXfquavid1Aj6oZrOMMV
 xVeqED0k+U+J9wsMqZvKWq8s7q/H6tsP5tjKl7T3spKMMwZIuxEt1E44/loMGhv9aEAU
 ysD1UjowrWaPrIFKyP19vvOcIADInv2yma5FiKNMNcEpcIW+qqj092kANPFlNGSqOCuu
 79v8X0+wM9B5e6GVDWs/p9Ol6e3KafX5DUOylsVFfrPHQ2GL2beAwdjKpdGT+QZmb96T
 wW4A==
X-Gm-Message-State: APjAAAWEF6A09HH72PmDZKbV92ynCukhPYNgaAojTk3cmhLReJEixthA
 XBFA+N3xoZCzMMvnVbBOBr9YHawA
X-Google-Smtp-Source: APXvYqzlovuyyiAwg5eCzLVtxdyU13MZj52TQqzoPVYkOYDj8gEc1ZLTQZv/lblsYsMalwXCV29ELQ==
X-Received: by 2002:aa7:c415:: with SMTP id j21mr51060004edq.282.1568575420121; 
 Sun, 15 Sep 2019 12:23:40 -0700 (PDT)
Received: from nullptr.home.dirty-ice.org
 (2a01-036c-0113-74ef-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:74ef::5])
 by smtp.gmail.com with ESMTPSA id j20sm6480562edy.95.2019.09.15.12.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2019 12:23:39 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
 <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
 <DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 15 Sep 2019 21:23:17 +0200
Message-Id: <6ba56ad4506c283aa903e8029f5fa53520b27544.1568574965.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1568574965.git.DirtY.iCE.hu@gmail.com>
References: <cover.1568574965.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: [Qemu-devel] [PATCH v3 01/24] audio: api for mixeng code free
 backends
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

This will make it possible to skip mixeng with audio playback and
recording, allowing us to free ourselves from the limitations of the
current mixeng (stereo, int64 samples only).  In this case, HW and SW
voices will be essentially the same, for every SW voice we will create
a HW voice, since we can no longer mix multiple voices together.

Some backends expect us to call a function when we have data ready
write()/read() style, while others provide a buffer and expects us to
directly write/read it, so for optimal performance audio_pcm_ops provide
methods for both cases.  Previously backends asked mixeng for more data
in run_out/run_it, now instead mixeng or the frontends will call the
backends, so that's why two sets of functions required.  audio.c
contains glue code between the two styles, so backends only ever have to
implement one style and frontends are free to call whichever is more
convenient for them.

Signed-off-by: Kővágó, Zoltán <DirtY.iCE.hu@gmail.com>
---

Notes:
    Changes from v2:
    
    * audio_pcm_hw_run_out: handle NULL result from get_buffer_out

 audio/audio.c          | 216 ++++++++++++++++++++++++++++++++++++++++-
 audio/audio_int.h      |  43 ++++++--
 audio/audio_template.h |   1 +
 3 files changed, 251 insertions(+), 9 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index e99fcd0694..e29a1e15eb 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -573,6 +573,25 @@ size_t audio_pcm_hw_clip_out(HWVoiceOut *hw, void *pcm_buf,
     return clipped;
 }
 
+static void audio_pcm_hw_clip_out2(HWVoiceOut *hw, void *pcm_buf, size_t len)
+{
+    size_t clipped = 0;
+    size_t pos = hw->rpos;
+
+    while (len) {
+        st_sample *src = hw->mix_buf + pos;
+        uint8_t *dst = advance(pcm_buf, clipped << hw->info.shift);
+        size_t samples_till_end_of_buf = hw->samples - pos;
+        size_t samples_to_clip = MIN(len, samples_till_end_of_buf);
+
+        hw->clip(dst, src, samples_to_clip);
+
+        pos = (pos + samples_to_clip) % hw->samples;
+        len -= samples_to_clip;
+        clipped += samples_to_clip;
+    }
+}
+
 /*
  * Soft voice (capture)
  */
@@ -1050,6 +1069,36 @@ static void audio_capture_mix_and_clear(HWVoiceOut *hw, size_t rpos,
     mixeng_clear(hw->mix_buf, samples - n);
 }
 
+static size_t audio_pcm_hw_run_out(HWVoiceOut *hw, size_t live)
+{
+    size_t clipped = 0;
+
+    while (live) {
+        size_t size, decr, proc;
+        void *buf = hw->pcm_ops->get_buffer_out(hw, &size);
+        if (!buf) {
+            /* retrying will likely won't help, drop everything. */
+            hw->rpos = (hw->rpos + live) % hw->samples;
+            return clipped + live;
+        }
+
+        decr = MIN(size >> hw->info.shift, live);
+        audio_pcm_hw_clip_out2(hw, buf, decr);
+        proc = hw->pcm_ops->put_buffer_out(hw, buf, decr << hw->info.shift) >>
+            hw->info.shift;
+
+        live -= proc;
+        clipped += proc;
+        hw->rpos = (hw->rpos + proc) % hw->samples;
+
+        if (proc == 0 || proc < decr) {
+            break;
+        }
+    }
+
+    return clipped;
+}
+
 static void audio_run_out (AudioState *s)
 {
     HWVoiceOut *hw = NULL;
@@ -1097,7 +1146,11 @@ static void audio_run_out (AudioState *s)
         }
 
         prev_rpos = hw->rpos;
-        played = hw->pcm_ops->run_out (hw, live);
+        if (hw->pcm_ops->run_out) {
+            played = hw->pcm_ops->run_out(hw, live);
+        } else {
+            played = audio_pcm_hw_run_out(hw, live);
+        }
         replay_audio_out(&played);
         if (audio_bug(__func__, hw->rpos >= hw->samples)) {
             dolog("hw->rpos=%zu hw->samples=%zu played=%zu\n",
@@ -1156,6 +1209,35 @@ static void audio_run_out (AudioState *s)
     }
 }
 
+static size_t audio_pcm_hw_run_in(HWVoiceIn *hw, size_t samples)
+{
+    size_t conv = 0;
+
+    while (samples) {
+        size_t proc;
+        size_t size = samples << hw->info.shift;
+        void *buf = hw->pcm_ops->get_buffer_in(hw, &size);
+
+        assert((size & hw->info.align) == 0);
+        if (size == 0) {
+            hw->pcm_ops->put_buffer_in(hw, buf, size);
+            break;
+        }
+
+        proc = MIN(size >> hw->info.shift,
+                   hw->samples - hw->wpos);
+
+        hw->conv(hw->conv_buf + hw->wpos, buf, proc);
+        hw->wpos = (hw->wpos + proc) % hw->samples;
+
+        samples -= proc;
+        conv += proc;
+        hw->pcm_ops->put_buffer_in(hw, buf, proc << hw->info.shift);
+    }
+
+    return conv;
+}
+
 static void audio_run_in (AudioState *s)
 {
     HWVoiceIn *hw = NULL;
@@ -1165,7 +1247,12 @@ static void audio_run_in (AudioState *s)
         size_t captured = 0, min;
 
         if (replay_mode != REPLAY_MODE_PLAY) {
-            captured = hw->pcm_ops->run_in(hw);
+            if (hw->pcm_ops->run_in) {
+                captured = hw->pcm_ops->run_in(hw);
+            } else {
+                captured = audio_pcm_hw_run_in(
+                    hw, hw->samples - audio_pcm_hw_get_live_in(hw));
+            }
         }
         replay_audio_in(&captured, hw->conv_buf, &hw->wpos, hw->samples);
 
@@ -1259,12 +1346,137 @@ void audio_run(AudioState *s, const char *msg)
 #endif
 }
 
+void *audio_generic_get_buffer_in(HWVoiceIn *hw, size_t *size)
+{
+    ssize_t start;
+
+    if (unlikely(!hw->buf_emul)) {
+        size_t calc_size = hw->samples << hw->info.shift;
+        hw->buf_emul = g_malloc(calc_size);
+        hw->size_emul = calc_size;
+        hw->pos_emul = hw->pending_emul = 0;
+    }
+
+    while (hw->pending_emul < hw->size_emul) {
+        size_t read_len = MIN(hw->size_emul - hw->pos_emul,
+                              hw->size_emul - hw->pending_emul);
+        size_t read = hw->pcm_ops->read(hw, hw->buf_emul + hw->pos_emul,
+                                        read_len);
+        hw->pending_emul += read;
+        if (read < read_len) {
+            break;
+        }
+    }
+
+    start = ((ssize_t) hw->pos_emul) - hw->pending_emul;
+    if (start < 0) {
+        start += hw->size_emul;
+    }
+    assert(start >= 0 && start < hw->size_emul);
+
+    *size = MIN(hw->pending_emul, hw->size_emul - start);
+    return hw->buf_emul + start;
+}
+
+void audio_generic_put_buffer_in(HWVoiceIn *hw, void *buf, size_t size)
+{
+    assert(size <= hw->pending_emul);
+    hw->pending_emul -= size;
+}
+
+void *audio_generic_get_buffer_out(HWVoiceOut *hw, size_t *size)
+{
+    if (unlikely(!hw->buf_emul)) {
+        size_t calc_size = hw->samples << hw->info.shift;
+
+        hw->buf_emul = g_malloc(calc_size);
+        hw->size_emul = calc_size;
+        hw->pos_emul = hw->pending_emul = 0;
+    }
+
+    *size = MIN(hw->size_emul - hw->pending_emul,
+                hw->size_emul - hw->pos_emul);
+    return hw->buf_emul + hw->pos_emul;
+}
+
+size_t audio_generic_put_buffer_out_nowrite(HWVoiceOut *hw, void *buf,
+                                            size_t size)
+{
+    assert(buf == hw->buf_emul + hw->pos_emul &&
+           size + hw->pending_emul <= hw->size_emul);
+
+    hw->pending_emul += size;
+    hw->pos_emul = (hw->pos_emul + size) % hw->size_emul;
+
+    return size;
+}
+
+size_t audio_generic_put_buffer_out(HWVoiceOut *hw, void *buf, size_t size)
+{
+    audio_generic_put_buffer_out_nowrite(hw, buf, size);
+
+    while (hw->pending_emul) {
+        size_t write_len, written;
+        ssize_t start = ((ssize_t) hw->pos_emul) - hw->pending_emul;
+        if (start < 0) {
+            start += hw->size_emul;
+        }
+        assert(start >= 0 && start < hw->size_emul);
+
+        write_len = MIN(hw->pending_emul, hw->size_emul - start);
+
+        written = hw->pcm_ops->write(hw, hw->buf_emul + start, write_len);
+        hw->pending_emul -= written;
+
+        if (written < write_len) {
+            break;
+        }
+    }
+
+    /*
+     * fake we have written everything. non-written data remain in pending_emul,
+     * so we do not have to clip them multiple times
+     */
+    return size;
+}
+
+size_t audio_generic_write(HWVoiceOut *hw, void *buf, size_t size)
+{
+    size_t dst_size, copy_size;
+    void *dst = hw->pcm_ops->get_buffer_out(hw, &dst_size);
+    copy_size = MIN(size, dst_size);
+
+    memcpy(dst, buf, copy_size);
+    return hw->pcm_ops->put_buffer_out(hw, buf, copy_size);
+}
+
+size_t audio_generic_read(HWVoiceIn *hw, void *buf, size_t size)
+{
+    size_t dst_size, copy_size;
+    void *dst = hw->pcm_ops->get_buffer_in(hw, &dst_size);
+    copy_size = MIN(size, dst_size);
+
+    memcpy(dst, buf, copy_size);
+    hw->pcm_ops->put_buffer_in(hw, buf, copy_size);
+    return copy_size;
+}
+
+
 static int audio_driver_init(AudioState *s, struct audio_driver *drv,
                              bool msg, Audiodev *dev)
 {
     s->drv_opaque = drv->init(dev);
 
     if (s->drv_opaque) {
+        if (!drv->pcm_ops->get_buffer_in) {
+            drv->pcm_ops->get_buffer_in = audio_generic_get_buffer_in;
+            drv->pcm_ops->put_buffer_in = audio_generic_put_buffer_in;
+        }
+        if (!drv->pcm_ops->get_buffer_out) {
+            drv->pcm_ops->get_buffer_out = audio_generic_get_buffer_out;
+            drv->pcm_ops->put_buffer_out = audio_generic_put_buffer_out;
+        }
+
         audio_init_nb_voices_out(s, drv);
         audio_init_nb_voices_in(s, drv);
         s->drv = drv;
diff --git a/audio/audio_int.h b/audio/audio_int.h
index a674c5374a..8fb1ca8a8d 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -65,6 +65,8 @@ typedef struct HWVoiceOut {
     uint64_t ts_helper;
 
     struct st_sample *mix_buf;
+    void *buf_emul;
+    size_t pos_emul, pending_emul, size_emul;
 
     size_t samples;
     QLIST_HEAD (sw_out_listhead, SWVoiceOut) sw_head;
@@ -87,6 +89,8 @@ typedef struct HWVoiceIn {
     uint64_t ts_helper;
 
     struct st_sample *conv_buf;
+    void *buf_emul;
+    size_t pos_emul, pending_emul, size_emul;
 
     size_t samples;
     QLIST_HEAD (sw_in_listhead, SWVoiceIn) sw_head;
@@ -147,17 +151,42 @@ struct audio_driver {
 };
 
 struct audio_pcm_ops {
-    int  (*init_out)(HWVoiceOut *hw, struct audsettings *as, void *drv_opaque);
-    void (*fini_out)(HWVoiceOut *hw);
+    int    (*init_out)(HWVoiceOut *hw, audsettings *as, void *drv_opaque);
+    void   (*fini_out)(HWVoiceOut *hw);
     size_t (*run_out)(HWVoiceOut *hw, size_t live);
-    int  (*ctl_out) (HWVoiceOut *hw, int cmd, ...);
-
-    int  (*init_in) (HWVoiceIn *hw, struct audsettings *as, void *drv_opaque);
-    void (*fini_in) (HWVoiceIn *hw);
+    size_t (*write)   (HWVoiceOut *hw, void *buf, size_t size);
+    /*
+     * get a buffer that after later can be passed to put_buffer_out; optional
+     * returns the buffer, and writes it's size to size (in bytes)
+     * this is unrelated to the above buffer_size_out function
+     */
+    void  *(*get_buffer_out)(HWVoiceOut *hw, size_t *size);
+    /*
+     * put back the buffer returned by get_buffer_out; optional
+     * buf must be equal the pointer returned by get_buffer_out,
+     * size may be smaller
+     */
+    size_t (*put_buffer_out)(HWVoiceOut *hw, void *buf, size_t size);
+    int    (*ctl_out) (HWVoiceOut *hw, int cmd, ...);
+
+    int    (*init_in) (HWVoiceIn *hw, audsettings *as, void *drv_opaque);
+    void   (*fini_in) (HWVoiceIn *hw);
     size_t (*run_in)(HWVoiceIn *hw);
-    int  (*ctl_in)  (HWVoiceIn *hw, int cmd, ...);
+    size_t (*read)    (HWVoiceIn *hw, void *buf, size_t size);
+    void  *(*get_buffer_in)(HWVoiceIn *hw, size_t *size);
+    void   (*put_buffer_in)(HWVoiceIn *hw, void *buf, size_t size);
+    int    (*ctl_in)  (HWVoiceIn *hw, int cmd, ...);
 };
 
+void *audio_generic_get_buffer_in(HWVoiceIn *hw, size_t *size);
+void audio_generic_put_buffer_in(HWVoiceIn *hw, void *buf, size_t size);
+void *audio_generic_get_buffer_out(HWVoiceOut *hw, size_t *size);
+size_t audio_generic_put_buffer_out(HWVoiceOut *hw, void *buf, size_t size);
+size_t audio_generic_put_buffer_out_nowrite(HWVoiceOut *hw, void *buf,
+                                            size_t size);
+size_t audio_generic_write(HWVoiceOut *hw, void *buf, size_t size);
+size_t audio_generic_read(HWVoiceIn *hw, void *buf, size_t size);
+
 struct capture_callback {
     struct audio_capture_ops ops;
     void *opaque;
diff --git a/audio/audio_template.h b/audio/audio_template.h
index 2562bf5f00..ff4a173f18 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -71,6 +71,7 @@ static void glue(audio_init_nb_voices_, TYPE)(AudioState *s,
 
 static void glue (audio_pcm_hw_free_resources_, TYPE) (HW *hw)
 {
+    g_free(hw->buf_emul);
     g_free (HWBUF);
     HWBUF = NULL;
 }
-- 
2.23.0


