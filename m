Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B44B31CC
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Sep 2019 21:42:00 +0200 (CEST)
Received: from localhost ([::1]:56690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9aPH-0007Oe-Ij
	for lists+qemu-devel@lfdr.de; Sun, 15 Sep 2019 15:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40058)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1i9a7l-00068l-Uv
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 15:23:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1i9a7k-00020n-8U
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 15:23:53 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:35756)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1i9a7k-00020b-0N
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 15:23:52 -0400
Received: by mail-ed1-x541.google.com with SMTP id f24so13626384edv.2
 for <qemu-devel@nongnu.org>; Sun, 15 Sep 2019 12:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6rs3TPdCsFFW0U3YSZY/8pCDEwrPkuPGfLpcnKffuLQ=;
 b=okEB9y+bpQjTcxAnguv+C2jTwCbngoYEvxgwC0poKtll1RzBDtxpa9LOW1iQnMo+ME
 mOHneVV9bFRrPNAoGOvY9rkt5vUOjS11+OSOdccNIrVJ81SqJEE6GeA7Ru5Q503XTUfx
 B2tfqrJjIVvLoKDud/Ea0zyZ4xKT5HXSTEfdM6H3TP9VycqnM3yXRJyLNXelttr94ZCw
 Bum1DUBkLteA9CdKUoAkp65f3l6WM+xcqYxYMV8LS0rLyhVYfbgaAVOv563bBUithsgt
 j2aZW/Tz+VcL5gjvCDUsRcByA/By1MUDFa/4V8F7gOlWVlo5Y1utfldRtePkzsZDXRZI
 avyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6rs3TPdCsFFW0U3YSZY/8pCDEwrPkuPGfLpcnKffuLQ=;
 b=gELHFahTJaIJ2iUzH0nW8v+2+zap9DFev/oBFBwvvSqraiheDQiM461x3JOL1xDu5T
 3+M7FsZ+sPZ3ZA7qjhaB/JhvNJa3aRfIshwxKIx7VdLQ1Qkpr+ydTiakjjfRtCATNnEj
 xyn5ivtL95MMMzAziGy2M7cOll2ZtH7yfsS5E0uIbf1QD/4p6Nh2QjUlsHV9b9kt/Qsf
 t+cnT3dKfokcH53xnOZwaZljLMaDopt1i+sAqCQ7K1oflAzhWvKu8kkOgv3x0lkhTN1v
 c8AnXWfiX9B7Wmkd4b2IjS7CY+FOKM9kE5+HDNS0dePeU/8yC4Hrhtn2LsEymJCsS0U+
 B2kw==
X-Gm-Message-State: APjAAAVrQ35x4wec3hzDCnsxP2hVnW60bjhJG8CIjdXiDF3OPAe/tOhB
 rvSMJb1FkKi7ldx1iAl3oBIrMMHO
X-Google-Smtp-Source: APXvYqwsubS7bJbsDT0O0ntMTSBypORrWeIDrfDs+vy2Qy1U8ZvjK2hYgpo2TCE3CwtG++nmxP/UGw==
X-Received: by 2002:a17:907:4301:: with SMTP id
 nh1mr48384665ejb.245.1568575430738; 
 Sun, 15 Sep 2019 12:23:50 -0700 (PDT)
Received: from nullptr.home.dirty-ice.org
 (2a01-036c-0113-74ef-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:74ef::5])
 by smtp.gmail.com with ESMTPSA id j20sm6480562edy.95.2019.09.15.12.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2019 12:23:50 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
 <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
 <DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 15 Sep 2019 21:23:29 +0200
Message-Id: <431af275a903b435f44fffa94896dbfd5bd4ecce.1568574965.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1568574965.git.DirtY.iCE.hu@gmail.com>
References: <cover.1568574965.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: [Qemu-devel] [PATCH v3 13/24] audio: common rate control code for
 timer based outputs
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

This commit removes the ad-hoc rate-limiting code from noaudio and
wavaudio, and replaces them with a (slightly modified) code from
spiceaudio.  This way multiple write calls (for example when the
circular buffer wraps around) do not cause problems.

Signed-off-by: Kővágó, Zoltán <DirtY.iCE.hu@gmail.com>
---
 audio/audio.c      | 30 +++++++++++++++++++++++++++
 audio/audio_int.h  |  9 ++++++++
 audio/noaudio.c    | 49 ++++++++++++++++++++------------------------
 audio/spiceaudio.c | 51 ++++++++--------------------------------------
 audio/wavaudio.c   | 21 +++++++++----------
 5 files changed, 79 insertions(+), 81 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index ba07fb77dd..fab1e35718 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -2051,3 +2051,33 @@ const char *audio_get_id(QEMUSoundCard *card)
         return "";
     }
 }
+
+void audio_rate_start(RateCtl *rate)
+{
+    memset(rate, 0, sizeof(RateCtl));
+    rate->start_ticks = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+}
+
+size_t audio_rate_get_bytes(struct audio_pcm_info *info, RateCtl *rate,
+                            size_t bytes_avail)
+{
+    int64_t now;
+    int64_t ticks;
+    int64_t bytes;
+    int64_t samples;
+    size_t ret;
+
+    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    ticks = now - rate->start_ticks;
+    bytes = muldiv64(ticks, info->bytes_per_second, NANOSECONDS_PER_SECOND);
+    samples = (bytes - rate->bytes_sent) >> info->shift;
+    if (samples < 0 || samples > 65536) {
+        AUD_log(NULL, "Resetting rate control (%" PRId64 " samples)\n", samples);
+        audio_rate_start(rate);
+        samples = 0;
+    }
+
+    ret = MIN(samples << info->shift, bytes_avail);
+    rate->bytes_sent += ret;
+    return ret;
+}
diff --git a/audio/audio_int.h b/audio/audio_int.h
index 20021df9e8..778615ccaf 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -242,6 +242,15 @@ void *audio_calloc (const char *funcname, int nmemb, size_t size);
 
 void audio_run(AudioState *s, const char *msg);
 
+typedef struct RateCtl {
+    int64_t start_ticks;
+    int64_t bytes_sent;
+} RateCtl;
+
+void audio_rate_start(RateCtl *rate);
+size_t audio_rate_get_bytes(struct audio_pcm_info *info, RateCtl *rate,
+                            size_t bytes_avail);
+
 #define VOICE_ENABLE 1
 #define VOICE_DISABLE 2
 #define VOICE_VOLUME 3
diff --git a/audio/noaudio.c b/audio/noaudio.c
index b054fd225b..9f1cc67df9 100644
--- a/audio/noaudio.c
+++ b/audio/noaudio.c
@@ -33,33 +33,27 @@
 
 typedef struct NoVoiceOut {
     HWVoiceOut hw;
-    int64_t old_ticks;
+    RateCtl rate;
 } NoVoiceOut;
 
 typedef struct NoVoiceIn {
     HWVoiceIn hw;
-    int64_t old_ticks;
+    RateCtl rate;
 } NoVoiceIn;
 
 static size_t no_write(HWVoiceOut *hw, void *buf, size_t len)
 {
     NoVoiceOut *no = (NoVoiceOut *) hw;
-    int64_t now;
-    int64_t ticks;
-    int64_t bytes;
-
-    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    ticks = now - no->old_ticks;
-    bytes = muldiv64(ticks, hw->info.bytes_per_second, NANOSECONDS_PER_SECOND);
-
-    no->old_ticks = now;
-    return MIN(len, bytes);
+    return audio_rate_get_bytes(&hw->info, &no->rate, len);
 }
 
 static int no_init_out(HWVoiceOut *hw, struct audsettings *as, void *drv_opaque)
 {
+    NoVoiceOut *no = (NoVoiceOut *) hw;
+
     audio_pcm_init_info (&hw->info, as);
     hw->samples = 1024;
+    audio_rate_start(&no->rate);
     return 0;
 }
 
@@ -70,15 +64,21 @@ static void no_fini_out (HWVoiceOut *hw)
 
 static int no_ctl_out (HWVoiceOut *hw, int cmd, ...)
 {
-    (void) hw;
-    (void) cmd;
+    NoVoiceOut *no = (NoVoiceOut *) hw;
+
+    if (cmd == VOICE_ENABLE) {
+        audio_rate_start(&no->rate);
+    }
     return 0;
 }
 
 static int no_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
 {
+    NoVoiceIn *no = (NoVoiceIn *) hw;
+
     audio_pcm_init_info (&hw->info, as);
     hw->samples = 1024;
+    audio_rate_start(&no->rate);
     return 0;
 }
 
@@ -89,25 +89,20 @@ static void no_fini_in (HWVoiceIn *hw)
 
 static size_t no_read(HWVoiceIn *hw, void *buf, size_t size)
 {
-    size_t to_clear;
     NoVoiceIn *no = (NoVoiceIn *) hw;
+    int64_t bytes = audio_rate_get_bytes(&hw->info, &no->rate, size);
 
-    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    int64_t ticks = now - no->old_ticks;
-    int64_t bytes =
-        muldiv64(ticks, hw->info.bytes_per_second, NANOSECONDS_PER_SECOND);
-
-    no->old_ticks = now;
-    to_clear = MIN(bytes, size);
-
-    audio_pcm_info_clear_buf(&hw->info, buf, to_clear >> hw->info.shift);
-    return to_clear;
+    audio_pcm_info_clear_buf(&hw->info, buf, bytes >> hw->info.shift);
+    return bytes;
 }
 
 static int no_ctl_in (HWVoiceIn *hw, int cmd, ...)
 {
-    (void) hw;
-    (void) cmd;
+    NoVoiceIn *no = (NoVoiceIn *) hw;
+
+    if (cmd == VOICE_ENABLE) {
+        audio_rate_start(&no->rate);
+    }
     return 0;
 }
 
diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c
index ff4e4dcbb0..4ce4f94c6d 100644
--- a/audio/spiceaudio.c
+++ b/audio/spiceaudio.c
@@ -40,15 +40,10 @@
 #define LINE_IN_SAMPLES (256 * 4)
 #endif
 
-typedef struct SpiceRateCtl {
-    int64_t               start_ticks;
-    int64_t               bytes_sent;
-} SpiceRateCtl;
-
 typedef struct SpiceVoiceOut {
     HWVoiceOut            hw;
     SpicePlaybackInstance sin;
-    SpiceRateCtl          rate;
+    RateCtl               rate;
     int                   active;
     uint32_t              *frame;
     uint32_t              fpos;
@@ -58,7 +53,7 @@ typedef struct SpiceVoiceOut {
 typedef struct SpiceVoiceIn {
     HWVoiceIn             hw;
     SpiceRecordInstance   sin;
-    SpiceRateCtl          rate;
+    RateCtl               rate;
     int                   active;
 } SpiceVoiceIn;
 
@@ -89,32 +84,6 @@ static void spice_audio_fini (void *opaque)
     /* nothing */
 }
 
-static void rate_start (SpiceRateCtl *rate)
-{
-    memset (rate, 0, sizeof (*rate));
-    rate->start_ticks = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-}
-
-static int rate_get_samples (struct audio_pcm_info *info, SpiceRateCtl *rate)
-{
-    int64_t now;
-    int64_t ticks;
-    int64_t bytes;
-    int64_t samples;
-
-    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    ticks = now - rate->start_ticks;
-    bytes = muldiv64(ticks, info->bytes_per_second, NANOSECONDS_PER_SECOND);
-    samples = (bytes - rate->bytes_sent) >> info->shift;
-    if (samples < 0 || samples > 65536) {
-        error_report("Resetting rate control (%" PRId64 " samples)", samples);
-        rate_start(rate);
-        samples = 0;
-    }
-    rate->bytes_sent += samples << info->shift;
-    return samples;
-}
-
 /* playback */
 
 static int line_out_init(HWVoiceOut *hw, struct audsettings *as,
@@ -154,7 +123,6 @@ static void line_out_fini (HWVoiceOut *hw)
 static void *line_out_get_buffer(HWVoiceOut *hw, size_t *size)
 {
     SpiceVoiceOut *out = container_of(hw, SpiceVoiceOut, hw);
-    size_t decr;
 
     if (!out->frame) {
         spice_server_playback_get_buffer(&out->sin, &out->frame, &out->fsize);
@@ -162,12 +130,10 @@ static void *line_out_get_buffer(HWVoiceOut *hw, size_t *size)
     }
 
     if (out->frame) {
-        decr = rate_get_samples(&hw->info, &out->rate);
-        decr = MIN(out->fsize - out->fpos, decr);
-
-        *size = decr << hw->info.shift;
+        *size = audio_rate_get_bytes(
+            &hw->info, &out->rate, (out->fsize - out->fpos) << hw->info.shift);
     } else {
-        rate_start(&out->rate);
+        audio_rate_start(&out->rate);
     }
     return out->frame + out->fpos;
 }
@@ -197,7 +163,7 @@ static int line_out_ctl (HWVoiceOut *hw, int cmd, ...)
             break;
         }
         out->active = 1;
-        rate_start (&out->rate);
+        audio_rate_start(&out->rate);
         spice_server_playback_start (&out->sin);
         break;
     case VOICE_DISABLE:
@@ -273,8 +239,7 @@ static void line_in_fini (HWVoiceIn *hw)
 static size_t line_in_read(HWVoiceIn *hw, void *buf, size_t len)
 {
     SpiceVoiceIn *in = container_of (hw, SpiceVoiceIn, hw);
-    uint64_t delta_samp = rate_get_samples(&hw->info, &in->rate);
-    uint64_t to_read = MIN(len >> 2, delta_samp);
+    uint64_t to_read = audio_rate_get_bytes(&hw->info, &in->rate, len) >> 2;
     size_t ready = spice_server_record_get_samples(&in->sin, buf, to_read);
 
     /* XXX: do we need this? */
@@ -296,7 +261,7 @@ static int line_in_ctl (HWVoiceIn *hw, int cmd, ...)
             break;
         }
         in->active = 1;
-        rate_start (&in->rate);
+        audio_rate_start(&in->rate);
         spice_server_record_start (&in->sin);
         break;
     case VOICE_DISABLE:
diff --git a/audio/wavaudio.c b/audio/wavaudio.c
index 7816097db8..cb2783e82a 100644
--- a/audio/wavaudio.c
+++ b/audio/wavaudio.c
@@ -35,21 +35,15 @@
 typedef struct WAVVoiceOut {
     HWVoiceOut hw;
     FILE *f;
-    int64_t old_ticks;
+    RateCtl rate;
     int total_samples;
 } WAVVoiceOut;
 
 static size_t wav_write_out(HWVoiceOut *hw, void *buf, size_t len)
 {
     WAVVoiceOut *wav = (WAVVoiceOut *) hw;
-    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    int64_t ticks = now - wav->old_ticks;
-    int64_t bytes =
-        muldiv64(ticks, hw->info.bytes_per_second, NANOSECONDS_PER_SECOND);
-
-    bytes = MIN(bytes, len);
-    bytes = bytes >> hw->info.shift << hw->info.shift;
-    wav->old_ticks = now;
+    int64_t bytes = audio_rate_get_bytes(&hw->info, &wav->rate, len);
+    assert(bytes >> hw->info.shift << hw->info.shift == bytes);
 
     if (bytes && fwrite(buf, bytes, 1, wav->f) != 1) {
         dolog("wav_write_out: fwrite of %zu bytes failed\nReaons: %s\n",
@@ -130,6 +124,8 @@ static int wav_init_out(HWVoiceOut *hw, struct audsettings *as,
                strerror(errno));
         return -1;
     }
+
+    audio_rate_start(&wav->rate);
     return 0;
 }
 
@@ -179,8 +175,11 @@ static void wav_fini_out (HWVoiceOut *hw)
 
 static int wav_ctl_out (HWVoiceOut *hw, int cmd, ...)
 {
-    (void) hw;
-    (void) cmd;
+    WAVVoiceOut *wav = (WAVVoiceOut *) hw;
+
+    if (cmd == VOICE_ENABLE) {
+        audio_rate_start(&wav->rate);
+    }
     return 0;
 }
 
-- 
2.23.0


