Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D6263B80
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 20:57:37 +0200 (CEST)
Received: from localhost ([::1]:52868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkvJ3-0000kB-4n
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 14:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36913)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1hkuyN-0004G9-HL
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 14:36:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1hkuyJ-0003cz-J1
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 14:36:15 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:40747)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1hkuyH-0003XD-GU
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 14:36:09 -0400
Received: by mail-wr1-x443.google.com with SMTP id r1so15765826wrl.7
 for <qemu-devel@nongnu.org>; Tue, 09 Jul 2019 11:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CGisyG8Oj2i3McJcTpliHuLEKd1p6QMEaWO+hjrPMu4=;
 b=p1DuEUhPXk0hO0GhIy+nFcH0RxvKEUeXJO848hEGbIguQBKLpUdlAI4LCiJ62/Tmqt
 PGvqEPYRPn+G/bE2PJRzWipBgtQK2kwcKSsn1DnZdwW3sJEmi50qP62uoHJJ9ppfyMhX
 Ef5fag9GBx8iqFAI6BXy/+rpoAd0f/n87Pz8NVf1zLrJOJL8dDYAK7r0E2FWGT45xQQq
 B66tyC4k42I52hK4hw8RVawDB9uI4gKj8grk78vwh7wzb2lDH0dpYRT56hD+IrFzGhss
 iLmhE2/CecvPHcDFiRB/k/pdGFC6wuvJ1fafxLcHa0MFG4ia7ynN8d/cUIsazOOjYFNt
 qgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CGisyG8Oj2i3McJcTpliHuLEKd1p6QMEaWO+hjrPMu4=;
 b=NU6R69EQVNAE/+4B6AfaoIV7cACTlz/ICL+D6m69zCVxs2rc3ySQg+DG8nZzX4Wfki
 i9qrgK2yJRxH/eB/4Bc8SBTkaphvB9vrpR2Q274juxvZp03W91eslSF2nwCVjcXACYUe
 /fF0x7O4oso3B5iEJscQApeXpRpQQhRW5GS8w5WDnnLpdNzrWda26lrhRHErtugWDI22
 BqJOSgeDhF7ucTZfOuOw7MxUlIcPhDMC5T01YiC0akaF1ghYZ7KgQrUyMRAc5FgNmJrM
 N84eIZImJyMdazw1Du1Rtzazu8Ybw7Awg4olyNQqf84BEKu+BtsAJVbscvXep5/elFqg
 8MSw==
X-Gm-Message-State: APjAAAWGWrMHUZccmp2PZzK9VXfgrTd44xssNtSAktA9jvnwyHmz0UdQ
 eD4KNfV1gwJQdDfjNmH3Z+SfovFJ
X-Google-Smtp-Source: APXvYqwG1J2yytUIB05VtevV//CNy7iSOiHbLK///ei+9UEUVlzA0w8CoTCqvbtPGJ1nMfs8bYrWfw==
X-Received: by 2002:a5d:620d:: with SMTP id y13mr27705798wru.243.1562697360652; 
 Tue, 09 Jul 2019 11:36:00 -0700 (PDT)
Received: from nullptr.home.dirty-ice.org
 (2a01-036c-0113-6e3f-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:6e3f::5])
 by smtp.gmail.com with ESMTPSA id c12sm20565042wrd.21.2019.07.09.11.35.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jul 2019 11:36:00 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
 <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
 <DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  9 Jul 2019 20:35:50 +0200
Message-Id: <0b7207b7ef4db3a894e9dbdefe4a007d8a19709c.1562695780.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1562695780.git.DirtY.iCE.hu@gmail.com>
References: <cover.1562695780.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PATCH 10/11] audio: remove read and write pcm_ops
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

They just called audio_pcm_sw_read/write anyway, so it makes no sense
to have them too.  (The noaudio's read is the only exception, but it
should work with the generic code too.)

Signed-off-by: Kővágó, Zoltán <DirtY.iCE.hu@gmail.com>
---
 audio/audio_int.h   |  5 -----
 audio/alsaaudio.c   | 12 ------------
 audio/audio.c       |  8 ++++----
 audio/coreaudio.c   |  6 ------
 audio/dsoundaudio.c | 12 ------------
 audio/noaudio.c     | 19 -------------------
 audio/ossaudio.c    | 12 ------------
 audio/paaudio.c     | 12 ------------
 audio/sdlaudio.c    |  6 ------
 audio/spiceaudio.c  | 12 ------------
 audio/wavaudio.c    |  6 ------
 11 files changed, 4 insertions(+), 106 deletions(-)

diff --git a/audio/audio_int.h b/audio/audio_int.h
index 7e00c1332e..003b7ab8cc 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -150,13 +150,11 @@ struct audio_pcm_ops {
     int  (*init_out)(HWVoiceOut *hw, struct audsettings *as, void *drv_opaque);
     void (*fini_out)(HWVoiceOut *hw);
     int  (*run_out) (HWVoiceOut *hw, int live);
-    int  (*write)   (SWVoiceOut *sw, void *buf, int size);
     int  (*ctl_out) (HWVoiceOut *hw, int cmd, ...);
 
     int  (*init_in) (HWVoiceIn *hw, struct audsettings *as, void *drv_opaque);
     void (*fini_in) (HWVoiceIn *hw);
     int  (*run_in)  (HWVoiceIn *hw);
-    int  (*read)    (SWVoiceIn *sw, void *buf, int size);
     int  (*ctl_in)  (HWVoiceIn *hw, int cmd, ...);
 };
 
@@ -210,11 +208,8 @@ audio_driver *audio_driver_lookup(const char *name);
 void audio_pcm_init_info (struct audio_pcm_info *info, struct audsettings *as);
 void audio_pcm_info_clear_buf (struct audio_pcm_info *info, void *buf, int len);
 
-int  audio_pcm_sw_write (SWVoiceOut *sw, void *buf, int len);
 int  audio_pcm_hw_get_live_in (HWVoiceIn *hw);
 
-int  audio_pcm_sw_read (SWVoiceIn *sw, void *buf, int len);
-
 int audio_pcm_hw_clip_out (HWVoiceOut *hw, void *pcm_buf,
                            int live, int pending);
 
diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index 3daa7c8f8f..e9e3a4819c 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -270,11 +270,6 @@ static int alsa_poll_in (HWVoiceIn *hw)
     return alsa_poll_helper (alsa->handle, &alsa->pollhlp, POLLIN);
 }
 
-static int alsa_write (SWVoiceOut *sw, void *buf, int len)
-{
-    return audio_pcm_sw_write (sw, buf, len);
-}
-
 static snd_pcm_format_t aud_to_alsafmt (AudioFormat fmt, int endianness)
 {
     switch (fmt) {
@@ -988,11 +983,6 @@ static int alsa_run_in (HWVoiceIn *hw)
     return read_samples;
 }
 
-static int alsa_read (SWVoiceIn *sw, void *buf, int size)
-{
-    return audio_pcm_sw_read (sw, buf, size);
-}
-
 static int alsa_ctl_in (HWVoiceIn *hw, int cmd, ...)
 {
     ALSAVoiceIn *alsa = (ALSAVoiceIn *) hw;
@@ -1076,13 +1066,11 @@ static struct audio_pcm_ops alsa_pcm_ops = {
     .init_out = alsa_init_out,
     .fini_out = alsa_fini_out,
     .run_out  = alsa_run_out,
-    .write    = alsa_write,
     .ctl_out  = alsa_ctl_out,
 
     .init_in  = alsa_init_in,
     .fini_in  = alsa_fini_in,
     .run_in   = alsa_run_in,
-    .read     = alsa_read,
     .ctl_in   = alsa_ctl_in,
 };
 
diff --git a/audio/audio.c b/audio/audio.c
index d73cc086b6..b79f56fe64 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -594,7 +594,7 @@ static int audio_pcm_sw_get_rpos_in (SWVoiceIn *sw)
     }
 }
 
-int audio_pcm_sw_read (SWVoiceIn *sw, void *buf, int size)
+static int audio_pcm_sw_read(SWVoiceIn *sw, void *buf, int size)
 {
     HWVoiceIn *hw = sw->hw;
     int samples, live, ret = 0, swlim, isamp, osamp, rpos, total = 0;
@@ -696,7 +696,7 @@ static int audio_pcm_hw_get_live_out (HWVoiceOut *hw, int *nb_live)
 /*
  * Soft voice (playback)
  */
-int audio_pcm_sw_write (SWVoiceOut *sw, void *buf, int size)
+static int audio_pcm_sw_write(SWVoiceOut *sw, void *buf, int size)
 {
     int hwsamples, samples, isamp, osamp, wpos, live, dead, left, swlim, blck;
     int ret = 0, pos = 0, total = 0;
@@ -854,7 +854,7 @@ int AUD_write (SWVoiceOut *sw, void *buf, int size)
         return 0;
     }
 
-    return sw->hw->pcm_ops->write(sw, buf, size);
+    return audio_pcm_sw_write(sw, buf, size);
 }
 
 int AUD_read (SWVoiceIn *sw, void *buf, int size)
@@ -869,7 +869,7 @@ int AUD_read (SWVoiceIn *sw, void *buf, int size)
         return 0;
     }
 
-    return sw->hw->pcm_ops->read(sw, buf, size);
+    return audio_pcm_sw_read(sw, buf, size);
 }
 
 int AUD_get_buffer_size_out (SWVoiceOut *sw)
diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index f0ab4014a8..091fe84a34 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -489,11 +489,6 @@ static OSStatus audioDeviceIOProc(
     return 0;
 }
 
-static int coreaudio_write (SWVoiceOut *sw, void *buf, int len)
-{
-    return audio_pcm_sw_write (sw, buf, len);
-}
-
 static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
                               void *drv_opaque)
 {
@@ -692,7 +687,6 @@ static struct audio_pcm_ops coreaudio_pcm_ops = {
     .init_out = coreaudio_init_out,
     .fini_out = coreaudio_fini_out,
     .run_out  = coreaudio_run_out,
-    .write    = coreaudio_write,
     .ctl_out  = coreaudio_ctl_out
 };
 
diff --git a/audio/dsoundaudio.c b/audio/dsoundaudio.c
index 07260f881e..11594c3095 100644
--- a/audio/dsoundaudio.c
+++ b/audio/dsoundaudio.c
@@ -454,11 +454,6 @@ static int dsound_ctl_out (HWVoiceOut *hw, int cmd, ...)
     return 0;
 }
 
-static int dsound_write (SWVoiceOut *sw, void *buf, int len)
-{
-    return audio_pcm_sw_write (sw, buf, len);
-}
-
 static int dsound_run_out (HWVoiceOut *hw, int live)
 {
     int err;
@@ -645,11 +640,6 @@ static int dsound_ctl_in (HWVoiceIn *hw, int cmd, ...)
     return 0;
 }
 
-static int dsound_read (SWVoiceIn *sw, void *buf, int len)
-{
-    return audio_pcm_sw_read (sw, buf, len);
-}
-
 static int dsound_run_in (HWVoiceIn *hw)
 {
     int err;
@@ -856,13 +846,11 @@ static struct audio_pcm_ops dsound_pcm_ops = {
     .init_out = dsound_init_out,
     .fini_out = dsound_fini_out,
     .run_out  = dsound_run_out,
-    .write    = dsound_write,
     .ctl_out  = dsound_ctl_out,
 
     .init_in  = dsound_init_in,
     .fini_in  = dsound_fini_in,
     .run_in   = dsound_run_in,
-    .read     = dsound_read,
     .ctl_in   = dsound_ctl_in
 };
 
diff --git a/audio/noaudio.c b/audio/noaudio.c
index 14a0e4ab29..cbb02d9e49 100644
--- a/audio/noaudio.c
+++ b/audio/noaudio.c
@@ -61,11 +61,6 @@ static int no_run_out (HWVoiceOut *hw, int live)
     return decr;
 }
 
-static int no_write (SWVoiceOut *sw, void *buf, int len)
-{
-    return audio_pcm_sw_write(sw, buf, len);
-}
-
 static int no_init_out(HWVoiceOut *hw, struct audsettings *as, void *drv_opaque)
 {
     audio_pcm_init_info (&hw->info, as);
@@ -118,18 +113,6 @@ static int no_run_in (HWVoiceIn *hw)
     return samples;
 }
 
-static int no_read (SWVoiceIn *sw, void *buf, int size)
-{
-    /* use custom code here instead of audio_pcm_sw_read() to avoid
-     * useless resampling/mixing */
-    int samples = size >> sw->info.shift;
-    int total = sw->hw->total_samples_captured - sw->total_hw_samples_acquired;
-    int to_clear = MIN (samples, total);
-    sw->total_hw_samples_acquired += total;
-    audio_pcm_info_clear_buf (&sw->info, buf, to_clear);
-    return to_clear << sw->info.shift;
-}
-
 static int no_ctl_in (HWVoiceIn *hw, int cmd, ...)
 {
     (void) hw;
@@ -151,13 +134,11 @@ static struct audio_pcm_ops no_pcm_ops = {
     .init_out = no_init_out,
     .fini_out = no_fini_out,
     .run_out  = no_run_out,
-    .write    = no_write,
     .ctl_out  = no_ctl_out,
 
     .init_in  = no_init_in,
     .fini_in  = no_fini_in,
     .run_in   = no_run_in,
-    .read     = no_read,
     .ctl_in   = no_ctl_in
 };
 
diff --git a/audio/ossaudio.c b/audio/ossaudio.c
index 456fba7480..b99edbec17 100644
--- a/audio/ossaudio.c
+++ b/audio/ossaudio.c
@@ -134,11 +134,6 @@ static void oss_poll_in (HWVoiceIn *hw)
     qemu_set_fd_handler(oss->fd, oss_helper_poll_in, NULL, hw->s);
 }
 
-static int oss_write (SWVoiceOut *sw, void *buf, int len)
-{
-    return audio_pcm_sw_write (sw, buf, len);
-}
-
 static int aud_to_ossfmt (AudioFormat fmt, int endianness)
 {
     switch (fmt) {
@@ -788,11 +783,6 @@ static int oss_run_in (HWVoiceIn *hw)
     return read_samples;
 }
 
-static int oss_read (SWVoiceIn *sw, void *buf, int size)
-{
-    return audio_pcm_sw_read (sw, buf, size);
-}
-
 static int oss_ctl_in (HWVoiceIn *hw, int cmd, ...)
 {
     OSSVoiceIn *oss = (OSSVoiceIn *) hw;
@@ -855,13 +845,11 @@ static struct audio_pcm_ops oss_pcm_ops = {
     .init_out = oss_init_out,
     .fini_out = oss_fini_out,
     .run_out  = oss_run_out,
-    .write    = oss_write,
     .ctl_out  = oss_ctl_out,
 
     .init_in  = oss_init_in,
     .fini_in  = oss_fini_in,
     .run_in   = oss_run_in,
-    .read     = oss_read,
     .ctl_in   = oss_ctl_in
 };
 
diff --git a/audio/paaudio.c b/audio/paaudio.c
index d320d2e453..12471154ed 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -295,11 +295,6 @@ static int qpa_run_out (HWVoiceOut *hw, int live)
     return decr;
 }
 
-static int qpa_write (SWVoiceOut *sw, void *buf, int len)
-{
-    return audio_pcm_sw_write (sw, buf, len);
-}
-
 /* capture */
 static void *qpa_thread_in (void *arg)
 {
@@ -388,11 +383,6 @@ static int qpa_run_in (HWVoiceIn *hw)
     return incr;
 }
 
-static int qpa_read (SWVoiceIn *sw, void *buf, int len)
-{
-    return audio_pcm_sw_read (sw, buf, len);
-}
-
 static pa_sample_format_t audfmt_to_pa (AudioFormat afmt, int endianness)
 {
     int format;
@@ -1016,13 +1006,11 @@ static struct audio_pcm_ops qpa_pcm_ops = {
     .init_out = qpa_init_out,
     .fini_out = qpa_fini_out,
     .run_out  = qpa_run_out,
-    .write    = qpa_write,
     .ctl_out  = qpa_ctl_out,
 
     .init_in  = qpa_init_in,
     .fini_in  = qpa_fini_in,
     .run_in   = qpa_run_in,
-    .read     = qpa_read,
     .ctl_in   = qpa_ctl_in
 };
 
diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index 42f7614124..c7fd487e0e 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -217,11 +217,6 @@ static void sdl_callback (void *opaque, Uint8 *buf, int len)
     }
 }
 
-static int sdl_write_out (SWVoiceOut *sw, void *buf, int len)
-{
-    return audio_pcm_sw_write (sw, buf, len);
-}
-
 static int sdl_run_out (HWVoiceOut *hw, int live)
 {
     int decr;
@@ -342,7 +337,6 @@ static struct audio_pcm_ops sdl_pcm_ops = {
     .init_out = sdl_init_out,
     .fini_out = sdl_fini_out,
     .run_out  = sdl_run_out,
-    .write    = sdl_write_out,
     .ctl_out  = sdl_ctl_out,
 };
 
diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c
index 6f4a0558f8..6e7f13cffa 100644
--- a/audio/spiceaudio.c
+++ b/audio/spiceaudio.c
@@ -193,11 +193,6 @@ static int line_out_run (HWVoiceOut *hw, int live)
     return decr;
 }
 
-static int line_out_write (SWVoiceOut *sw, void *buf, int len)
-{
-    return audio_pcm_sw_write (sw, buf, len);
-}
-
 static int line_out_ctl (HWVoiceOut *hw, int cmd, ...)
 {
     SpiceVoiceOut *out = container_of (hw, SpiceVoiceOut, hw);
@@ -326,11 +321,6 @@ static int line_in_run (HWVoiceIn *hw)
     return num_samples;
 }
 
-static int line_in_read (SWVoiceIn *sw, void *buf, int size)
-{
-    return audio_pcm_sw_read (sw, buf, size);
-}
-
 static int line_in_ctl (HWVoiceIn *hw, int cmd, ...)
 {
     SpiceVoiceIn *in = container_of (hw, SpiceVoiceIn, hw);
@@ -378,13 +368,11 @@ static struct audio_pcm_ops audio_callbacks = {
     .init_out = line_out_init,
     .fini_out = line_out_fini,
     .run_out  = line_out_run,
-    .write    = line_out_write,
     .ctl_out  = line_out_ctl,
 
     .init_in  = line_in_init,
     .fini_in  = line_in_fini,
     .run_in   = line_in_run,
-    .read     = line_in_read,
     .ctl_in   = line_in_ctl,
 };
 
diff --git a/audio/wavaudio.c b/audio/wavaudio.c
index bbf3f3b346..17ab921cef 100644
--- a/audio/wavaudio.c
+++ b/audio/wavaudio.c
@@ -84,11 +84,6 @@ static int wav_run_out (HWVoiceOut *hw, int live)
     return decr;
 }
 
-static int wav_write_out (SWVoiceOut *sw, void *buf, int len)
-{
-    return audio_pcm_sw_write (sw, buf, len);
-}
-
 /* VICE code: Store number as little endian. */
 static void le_store (uint8_t *buf, uint32_t val, int len)
 {
@@ -240,7 +235,6 @@ static struct audio_pcm_ops wav_pcm_ops = {
     .init_out = wav_init_out,
     .fini_out = wav_fini_out,
     .run_out  = wav_run_out,
-    .write    = wav_write_out,
     .ctl_out  = wav_ctl_out,
 };
 
-- 
2.22.0


