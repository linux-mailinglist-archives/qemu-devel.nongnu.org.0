Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C900A69D4D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 23:09:04 +0200 (CEST)
Received: from localhost ([::1]:43784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn8DX-00015M-D4
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 17:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42192)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1hn8Ct-0007y7-7f
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 17:08:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1hn8Cr-0004gx-HM
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 17:08:23 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:41104)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1hn8Cr-0004gS-9L
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 17:08:21 -0400
Received: by mail-wr1-x443.google.com with SMTP id c2so15388838wrm.8
 for <qemu-devel@nongnu.org>; Mon, 15 Jul 2019 14:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9EOsiPzupC9z3cs4OAkQhKC9rm1e4IxaFYIyQRaOKTQ=;
 b=krk6iapGlGo/qI9C2tVUenIxzRE3PFfjd1SvRsaXrFMBGvpIhYtccCNQ6W+TmNQDnB
 6OBVEC/n0mc1qXI8SxTQ1+V4j2PuMewXjj9muPJGOVL/9vWZ5L0uUyapqVmr2pH339MX
 uc1JNul1RICLK8SvEELWyU2qaygLcviUW4SZuG+CrTbILBJmhCvcRf6UmDpZGDWRRZcO
 k1oI3/GNl0DbA4uDzEKmMDjDtg9S4kKTue+a9/uJ859olWbqvZTvvneJtunVl7qeCw92
 gqEGmVS8AcQN4hCBJMD02x3JsIBFG/GeBto7ai0/FJTn+GDLc/GmMLRs3qzpzQS4bjBQ
 IZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9EOsiPzupC9z3cs4OAkQhKC9rm1e4IxaFYIyQRaOKTQ=;
 b=IQQwVPfKpFw7UVh2AZVKCQRMuVJbakzFJrgkPurq3vCasEaRFGVZPLgPA9A38qkeTx
 z6EYzfRyLPIt8UfLubFCI8w/7CQ8xu56Vx+ppCaRj66r2qZQ+RXN0t5m9RjTVy7PsArk
 J+tumMVGp9yP8wJ51dlap+VgLAauyIWUoBlMPR7dh9JjFHdHBfMElKltHwcQeTF1nCYx
 JOvHsneTV6kZMUblxLCceGbLIR/btzsXE14WtWI2GFeE3hQ8qb00qOWYdhJjXEU/i3/j
 Zxs2NhcHROJvWr8YTryJ0o114nwMlu5DrsW/qfFU0Vpk5nK68UVEEjv4Jco62udJVJMy
 1rJQ==
X-Gm-Message-State: APjAAAWFGBO5C9Uji0JXuuNcb2jzE0bTBQUhNjQCt/0q95gyJdWLLW1X
 2/RDklwVOZsnTIFSrTUOJ21PMjlC
X-Google-Smtp-Source: APXvYqwE4ZW4pXdv713Kqr6SnUgGEq5OU6LQQ++w0vSlaredEcNVGUU0NrtitLh6aIBkVj12/VbUkw==
X-Received: by 2002:a5d:6a84:: with SMTP id s4mr30438188wru.125.1563224899901; 
 Mon, 15 Jul 2019 14:08:19 -0700 (PDT)
Received: from nullptr.home.dirty-ice.org
 (2a01-036c-0113-31ca-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:31ca::5])
 by smtp.gmail.com with ESMTPSA id n8sm11513447wro.89.2019.07.15.14.08.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 14:08:19 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
 <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
 <DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 23:08:04 +0200
Message-Id: <090b3d94b6fd0d35a319b8092e68eb673285f661.1563224628.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1563224628.git.DirtY.iCE.hu@gmail.com>
References: <cover.1563224628.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PATCH v2 02/14] audio: basic support for multi
 backend audio
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Audio functions no longer access glob_audio_state, instead they get an
AudioState as a parameter.  This is required in order to support
multiple backends.

glob_audio_state is also gone, and replaced with a tailq so we can store
more than one states.

Signed-off-by: Kővágó, Zoltán <DirtY.iCE.hu@gmail.com>
---

Notes:
    Changes from v1:
    
    * Moved wav_capture/vnc audiodev param to a separate commit

 audio/audio.h          |  12 +++--
 audio/audio_int.h      |   2 +
 audio/audio_template.h |   2 +-
 audio/audio.c          | 102 +++++++++++++++++++++++++++++++----------
 audio/wavcapture.c     |   6 +--
 monitor/misc.c         |   2 +-
 ui/vnc.c               |   2 +-
 7 files changed, 95 insertions(+), 33 deletions(-)

diff --git a/audio/audio.h b/audio/audio.h
index 64b0f761bc..ad2457f4de 100644
--- a/audio/audio.h
+++ b/audio/audio.h
@@ -78,8 +78,10 @@ typedef struct SWVoiceOut SWVoiceOut;
 typedef struct CaptureVoiceOut CaptureVoiceOut;
 typedef struct SWVoiceIn SWVoiceIn;
 
+typedef struct AudioState AudioState;
 typedef struct QEMUSoundCard {
     char *name;
+    AudioState *state;
     QLIST_ENTRY (QEMUSoundCard) entries;
 } QEMUSoundCard;
 
@@ -92,7 +94,8 @@ void AUD_log (const char *cap, const char *fmt, ...) GCC_FMT_ATTR(2, 3);
 
 void AUD_register_card (const char *name, QEMUSoundCard *card);
 void AUD_remove_card (QEMUSoundCard *card);
-CaptureVoiceOut *AUD_add_capture (
+CaptureVoiceOut *AUD_add_capture(
+    AudioState *s,
     struct audsettings *as,
     struct audio_capture_ops *ops,
     void *opaque
@@ -160,8 +163,8 @@ static inline void *advance (void *p, int incr)
 #define audio_MAX(a, b) ((a)<(b)?(b):(a))
 #endif
 
-int wav_start_capture (CaptureState *s, const char *path, int freq,
-                       int bits, int nchannels);
+int wav_start_capture(AudioState *state, CaptureState *s, const char *path,
+                      int freq, int bits, int nchannels);
 
 bool audio_is_cleaning_up(void);
 void audio_cleanup(void);
@@ -175,4 +178,7 @@ void audio_parse_option(const char *opt);
 void audio_init_audiodevs(void);
 void audio_legacy_help(void);
 
+AudioState *audio_state_by_name(const char *name);
+const char *audio_get_id(QEMUSoundCard *card);
+
 #endif /* QEMU_AUDIO_H */
diff --git a/audio/audio_int.h b/audio/audio_int.h
index 8164696b2c..9f01f6ad00 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -196,6 +196,8 @@ typedef struct AudioState {
 
     bool timer_running;
     uint64_t timer_last;
+
+    QTAILQ_ENTRY(AudioState) list;
 } AudioState;
 
 extern const struct mixeng_volume nominal_volume;
diff --git a/audio/audio_template.h b/audio/audio_template.h
index c721fed75d..54f07338e7 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -428,7 +428,7 @@ SW *glue (AUD_open_, TYPE) (
     struct audsettings *as
     )
 {
-    AudioState *s = &glob_audio_state;
+    AudioState *s = card->state;
     AudiodevPerDirectionOptions *pdo = glue(audio_get_pdo_, TYPE)(s->dev);
 
     if (audio_bug(__func__, !card || !name || !callback_fn || !as)) {
diff --git a/audio/audio.c b/audio/audio.c
index 8d2f580788..4baa37caac 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -87,7 +87,8 @@ audio_driver *audio_driver_lookup(const char *name)
     return NULL;
 }
 
-static AudioState glob_audio_state;
+static QTAILQ_HEAD(AudioStateHead, AudioState) audio_states =
+    QTAILQ_HEAD_INITIALIZER(audio_states);
 
 const struct mixeng_volume nominal_volume = {
     .mute = 0,
@@ -1236,11 +1237,14 @@ static void audio_run_capture (AudioState *s)
 
 void audio_run (const char *msg)
 {
-    AudioState *s = &glob_audio_state;
+    AudioState *s;
+
+    QTAILQ_FOREACH(s, &audio_states, list) {
+        audio_run_out(s);
+        audio_run_in(s);
+        audio_run_capture(s);
+    }
 
-    audio_run_out (s);
-    audio_run_in (s);
-    audio_run_capture (s);
 #ifdef DEBUG_POLL
     {
         static double prevtime;
@@ -1304,13 +1308,11 @@ bool audio_is_cleaning_up(void)
     return is_cleaning_up;
 }
 
-void audio_cleanup(void)
+static void free_audio_state(AudioState *s)
 {
-    AudioState *s = &glob_audio_state;
     HWVoiceOut *hwo, *hwon;
     HWVoiceIn *hwi, *hwin;
 
-    is_cleaning_up = true;
     QLIST_FOREACH_SAFE(hwo, &s->hw_head_out, entries, hwon) {
         SWVoiceCap *sc;
 
@@ -1347,6 +1349,17 @@ void audio_cleanup(void)
         qapi_free_Audiodev(s->dev);
         s->dev = NULL;
     }
+    g_free(s);
+}
+
+void audio_cleanup(void)
+{
+    is_cleaning_up = true;
+    while (!QTAILQ_EMPTY(&audio_states)) {
+        AudioState *s = QTAILQ_FIRST(&audio_states);
+        QTAILQ_REMOVE(&audio_states, s, list);
+        free_audio_state(s);
+    }
 }
 
 static const VMStateDescription vmstate_audio = {
@@ -1373,28 +1386,33 @@ static AudiodevListEntry *audiodev_find(
     return NULL;
 }
 
-static int audio_init(Audiodev *dev)
+/*
+ * if we have dev, this function was called because of an -audiodev argument =>
+ *   initialize a new state with it
+ * if dev == NULL => legacy implicit initialization, return the already created
+ *   state or create a new one
+ */
+static AudioState *audio_init(Audiodev *dev)
 {
+    static bool atexit_registered;
     size_t i;
     int done = 0;
     const char *drvname = NULL;
     VMChangeStateEntry *e;
-    AudioState *s = &glob_audio_state;
+    AudioState *s;
     struct audio_driver *driver;
     /* silence gcc warning about uninitialized variable */
     AudiodevListHead head = QSIMPLEQ_HEAD_INITIALIZER(head);
 
-    if (s->drv) {
-        if (dev) {
-            dolog("Cannot create more than one audio backend, sorry\n");
-            qapi_free_Audiodev(dev);
-        }
-        return -1;
-    }
-
     if (dev) {
         /* -audiodev option */
         drvname = AudiodevDriver_str(dev->driver);
+    } else if (!QTAILQ_EMPTY(&audio_states)) {
+        /*
+         * todo: check for -audiodev once we have normal audiodev selection
+         * support
+         */
+        return QTAILQ_FIRST(&audio_states);
     } else {
         /* legacy implicit initialization */
         head = audio_handle_legacy_opts();
@@ -1408,12 +1426,18 @@ static int audio_init(Audiodev *dev)
         dev = QSIMPLEQ_FIRST(&head)->dev;
         audio_validate_opts(dev, &error_abort);
     }
+
+    s = g_malloc0(sizeof(AudioState));
     s->dev = dev;
 
     QLIST_INIT (&s->hw_head_out);
     QLIST_INIT (&s->hw_head_in);
     QLIST_INIT (&s->cap_head);
-    atexit(audio_cleanup);
+    if (!atexit_registered) {
+        atexit(audio_cleanup);
+        atexit_registered = true;
+    }
+    QTAILQ_INSERT_TAIL(&audio_states, s, list);
 
     s->ts = timer_new_ns(QEMU_CLOCK_VIRTUAL, audio_timer, s);
 
@@ -1478,7 +1502,7 @@ static int audio_init(Audiodev *dev)
 
     QLIST_INIT (&s->card_head);
     vmstate_register (NULL, 0, &vmstate_audio, s);
-    return 0;
+    return s;
 }
 
 void audio_free_audiodev_list(AudiodevListHead *head)
@@ -1493,10 +1517,13 @@ void audio_free_audiodev_list(AudiodevListHead *head)
 
 void AUD_register_card (const char *name, QEMUSoundCard *card)
 {
-    audio_init(NULL);
+    if (!card->state) {
+        card->state = audio_init(NULL);
+    }
+
     card->name = g_strdup (name);
     memset (&card->entries, 0, sizeof (card->entries));
-    QLIST_INSERT_HEAD (&glob_audio_state.card_head, card, entries);
+    QLIST_INSERT_HEAD(&card->state->card_head, card, entries);
 }
 
 void AUD_remove_card (QEMUSoundCard *card)
@@ -1506,16 +1533,21 @@ void AUD_remove_card (QEMUSoundCard *card)
 }
 
 
-CaptureVoiceOut *AUD_add_capture (
+CaptureVoiceOut *AUD_add_capture(
+    AudioState *s,
     struct audsettings *as,
     struct audio_capture_ops *ops,
     void *cb_opaque
     )
 {
-    AudioState *s = &glob_audio_state;
     CaptureVoiceOut *cap;
     struct capture_callback *cb;
 
+    if (!s) {
+        /* todo: remove when we have normal audiodev selection support */
+        s = audio_init(NULL);
+    }
+
     if (audio_validate_settings (as)) {
         dolog ("Invalid settings were passed when trying to add capture\n");
         audio_print_settings (as);
@@ -1805,3 +1837,25 @@ int audio_buffer_bytes(AudiodevPerDirectionOptions *pdo,
     return audio_buffer_samples(pdo, as, def_usecs) *
         audioformat_bytes_per_sample(as->fmt);
 }
+
+AudioState *audio_state_by_name(const char *name)
+{
+    AudioState *s;
+    QTAILQ_FOREACH(s, &audio_states, list) {
+        assert(s->dev);
+        if (strcmp(name, s->dev->id) == 0) {
+            return s;
+        }
+    }
+    return NULL;
+}
+
+const char *audio_get_id(QEMUSoundCard *card)
+{
+    if (card->state) {
+        assert(card->state->dev);
+        return card->state->dev->id;
+    } else {
+        return "";
+    }
+}
diff --git a/audio/wavcapture.c b/audio/wavcapture.c
index 74320dfecc..81c5c19032 100644
--- a/audio/wavcapture.c
+++ b/audio/wavcapture.c
@@ -105,8 +105,8 @@ static struct capture_ops wav_capture_ops = {
     .info = wav_capture_info
 };
 
-int wav_start_capture (CaptureState *s, const char *path, int freq,
-                       int bits, int nchannels)
+int wav_start_capture(AudioState *state, CaptureState *s, const char *path,
+                      int freq, int bits, int nchannels)
 {
     WAVState *wav;
     uint8_t hdr[] = {
@@ -171,7 +171,7 @@ int wav_start_capture (CaptureState *s, const char *path, int freq,
         goto error_free;
     }
 
-    cap = AUD_add_capture (&as, &ops, wav);
+    cap = AUD_add_capture(state, &as, &ops, wav);
     if (!cap) {
         error_report("Failed to add audio capture");
         goto error_free;
diff --git a/monitor/misc.c b/monitor/misc.c
index 00338c002a..e393333a0e 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -1156,7 +1156,7 @@ static void hmp_wavcapture(Monitor *mon, const QDict *qdict)
     bits = has_bits ? bits : 16;
     nchannels = has_channels ? nchannels : 2;
 
-    if (wav_start_capture (s, path, freq, bits, nchannels)) {
+    if (wav_start_capture(NULL, s, path, freq, bits, nchannels)) {
         monitor_printf(mon, "Failed to add wave capture\n");
         g_free (s);
         return;
diff --git a/ui/vnc.c b/ui/vnc.c
index 38f92bfca3..140f364dda 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -1222,7 +1222,7 @@ static void audio_add(VncState *vs)
     ops.destroy = audio_capture_destroy;
     ops.capture = audio_capture;
 
-    vs->audio_cap = AUD_add_capture(&vs->as, &ops, vs);
+    vs->audio_cap = AUD_add_capture(NULL, &vs->as, &ops, vs);
     if (!vs->audio_cap) {
         error_report("Failed to add audio capture");
     }
-- 
2.22.0


