Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5FBB31C2
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Sep 2019 21:37:44 +0200 (CEST)
Received: from localhost ([::1]:56648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9aL9-00022q-OJ
	for lists+qemu-devel@lfdr.de; Sun, 15 Sep 2019 15:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40021)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1i9a7i-00063Y-Hm
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 15:23:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1i9a7h-0001zi-Cv
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 15:23:50 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:43400)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1i9a7h-0001zM-6j
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 15:23:49 -0400
Received: by mail-ed1-x52e.google.com with SMTP id r9so2479925edl.10
 for <qemu-devel@nongnu.org>; Sun, 15 Sep 2019 12:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DUW7OK1573+eRJ/c4anJ7nOB3W09/QGNLs1FK1NrsmM=;
 b=QNZxXXirzCh84qU7P008e9TrdHG7H8baMWI5cC2oiOEY5fhNcH5EO/oVh8/BAtUv+i
 mh0Beo2rCIs/dTCmsmrntzYXbDK5YbcikYI9f5ihq8V6diJBQf3+mlJAg9kEXLlHk1WU
 6mHH9VwISkO0whrE62c2h3r4SgGU+WuiDj3jcSHtHJiwj9+izLP3UrcXQhilmS2wZ+sx
 el30o2ud4//CobqA5wJrpCUYDFT5oYY+qEAv7dk3gJMTKnkeEweN82+uH8GNndzF+lZn
 DXfrmj5j9XNWT6yXnQ1zga/bmws4pxTJc8c29pH2lz0SDfXFBmNA1bjZBRKSq4EwPhhg
 U13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DUW7OK1573+eRJ/c4anJ7nOB3W09/QGNLs1FK1NrsmM=;
 b=iXAC8bthHCDnQSmc5niXWkmGP9IPKbRbgjSi9WXm6SqV+ppG5h/UK0NRSx7Tl/HTlt
 9s6l/upfnIVz4WSXoe/frb8D7J+cZcuinzUUdJLUkQ17615a9B2iqb37VBbUXKrVCS7c
 OPi19pV0OGqYNuGT31v6WxT/MDwS8fD11OqRd52Klq26c+DSWo77TgnxC2BHdusSLKa1
 zOJj49lqqtgl7obqRs3WzSctWYkSR87w5wme3eiTwkRzar6KgfmFjjl8saMWr2/UVH8a
 jZWfkF7UI96kRcyMiGTRva0/eN0hbmI67FViKKXbw5WkOBKdSqVi2LnSymcHOP05pwTM
 fMnw==
X-Gm-Message-State: APjAAAVrr8Y3K1TxpKlwiWJZlKbTjyaNwI9oCGx53CwhX9mn8vKdzs6f
 4FTaxMKwDlrlN+VtjxepL61V0Jue
X-Google-Smtp-Source: APXvYqxvBWzfMm4bklRWvLGZs4PBpU8jspd4l4CpH4XcJubhFGAxgmevGQAb3+rG5oUtJrqrc4yfkw==
X-Received: by 2002:aa7:db05:: with SMTP id t5mr59331743eds.242.1568575428029; 
 Sun, 15 Sep 2019 12:23:48 -0700 (PDT)
Received: from nullptr.home.dirty-ice.org
 (2a01-036c-0113-74ef-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:74ef::5])
 by smtp.gmail.com with ESMTPSA id j20sm6480562edy.95.2019.09.15.12.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2019 12:23:47 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
 <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
 <DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 15 Sep 2019 21:23:26 +0200
Message-Id: <fc447ed1336d60025485bbe6f3a4da52b1359077.1568574965.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1568574965.git.DirtY.iCE.hu@gmail.com>
References: <cover.1568574965.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::52e
Subject: [Qemu-devel] [PATCH v3 10/24] wavaudio: port to the new audio
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
 audio/wavaudio.c | 54 ++++++++----------------------------------------
 1 file changed, 9 insertions(+), 45 deletions(-)

diff --git a/audio/wavaudio.c b/audio/wavaudio.c
index b6eeeb4e26..7816097db8 100644
--- a/audio/wavaudio.c
+++ b/audio/wavaudio.c
@@ -36,52 +36,28 @@ typedef struct WAVVoiceOut {
     HWVoiceOut hw;
     FILE *f;
     int64_t old_ticks;
-    void *pcm_buf;
     int total_samples;
 } WAVVoiceOut;
 
-static size_t wav_run_out(HWVoiceOut *hw, size_t live)
+static size_t wav_write_out(HWVoiceOut *hw, void *buf, size_t len)
 {
     WAVVoiceOut *wav = (WAVVoiceOut *) hw;
-    size_t rpos, decr, samples;
-    uint8_t *dst;
-    struct st_sample *src;
     int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     int64_t ticks = now - wav->old_ticks;
     int64_t bytes =
         muldiv64(ticks, hw->info.bytes_per_second, NANOSECONDS_PER_SECOND);
 
-    if (bytes > INT_MAX) {
-        samples = INT_MAX >> hw->info.shift;
-    }
-    else {
-        samples = bytes >> hw->info.shift;
-    }
-
+    bytes = MIN(bytes, len);
+    bytes = bytes >> hw->info.shift << hw->info.shift;
     wav->old_ticks = now;
-    decr = MIN (live, samples);
-    samples = decr;
-    rpos = hw->rpos;
-    while (samples) {
-        int left_till_end_samples = hw->samples - rpos;
-        int convert_samples = MIN (samples, left_till_end_samples);
-
-        src = hw->mix_buf + rpos;
-        dst = advance (wav->pcm_buf, rpos << hw->info.shift);
-
-        hw->clip (dst, src, convert_samples);
-        if (fwrite (dst, convert_samples << hw->info.shift, 1, wav->f) != 1) {
-            dolog ("wav_run_out: fwrite of %d bytes failed\nReaons: %s\n",
-                   convert_samples << hw->info.shift, strerror (errno));
-        }
 
-        rpos = (rpos + convert_samples) % hw->samples;
-        samples -= convert_samples;
-        wav->total_samples += convert_samples;
+    if (bytes && fwrite(buf, bytes, 1, wav->f) != 1) {
+        dolog("wav_write_out: fwrite of %zu bytes failed\nReaons: %s\n",
+              bytes, strerror(errno));
     }
 
-    hw->rpos = rpos;
-    return decr;
+    wav->total_samples += bytes >> hw->info.shift;
+    return bytes;
 }
 
 /* VICE code: Store number as little endian. */
@@ -137,13 +113,6 @@ static int wav_init_out(HWVoiceOut *hw, struct audsettings *as,
     audio_pcm_init_info (&hw->info, &wav_as);
 
     hw->samples = 1024;
-    wav->pcm_buf = audio_calloc(__func__, hw->samples, 1 << hw->info.shift);
-    if (!wav->pcm_buf) {
-        dolog("Could not allocate buffer (%zu bytes)\n",
-              hw->samples << hw->info.shift);
-        return -1;
-    }
-
     le_store (hdr + 22, hw->info.nchannels, 2);
     le_store (hdr + 24, hw->info.freq, 4);
     le_store (hdr + 28, hw->info.freq << (bits16 + stereo), 4);
@@ -153,8 +122,6 @@ static int wav_init_out(HWVoiceOut *hw, struct audsettings *as,
     if (!wav->f) {
         dolog ("Failed to open wave file `%s'\nReason: %s\n",
                wav_path, strerror(errno));
-        g_free (wav->pcm_buf);
-        wav->pcm_buf = NULL;
         return -1;
     }
 
@@ -208,9 +175,6 @@ static void wav_fini_out (HWVoiceOut *hw)
                wav->f, strerror (errno));
     }
     wav->f = NULL;
-
-    g_free (wav->pcm_buf);
-    wav->pcm_buf = NULL;
 }
 
 static int wav_ctl_out (HWVoiceOut *hw, int cmd, ...)
@@ -234,7 +198,7 @@ static void wav_audio_fini (void *opaque)
 static struct audio_pcm_ops wav_pcm_ops = {
     .init_out = wav_init_out,
     .fini_out = wav_fini_out,
-    .run_out  = wav_run_out,
+    .write    = wav_write_out,
     .ctl_out  = wav_ctl_out,
 };
 
-- 
2.23.0


