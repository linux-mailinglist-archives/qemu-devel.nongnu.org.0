Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BA1AD0CE
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Sep 2019 23:30:10 +0200 (CEST)
Received: from localhost ([::1]:50700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i74l5-0002k0-4b
	for lists+qemu-devel@lfdr.de; Sun, 08 Sep 2019 17:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46370)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1i74dv-0005VB-P0
 for qemu-devel@nongnu.org; Sun, 08 Sep 2019 17:22:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1i74dq-0005nw-Nw
 for qemu-devel@nongnu.org; Sun, 08 Sep 2019 17:22:43 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:32928)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1i74dp-0005ma-4t
 for qemu-devel@nongnu.org; Sun, 08 Sep 2019 17:22:38 -0400
Received: by mail-qk1-x732.google.com with SMTP id x134so11155909qkb.0
 for <qemu-devel@nongnu.org>; Sun, 08 Sep 2019 14:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CC7UlldrvJy8q5BHGKY3ed+L0GtDqSFJKC+sawO7zxA=;
 b=dbMqNb4sVDUEfSxtU0CktVgm6PKJrdEIKczsGORtwHJ4DCEE5Ya9+r8WbwUNTlfgoe
 iec054PBjlRBhy+QQ4Eu4rru6kPuPKdi17PJv7JrSgvfYYysSo1wbxE5eEx/z6TJAEG3
 2+4z/5rtIzmfxG36JLBEXSPpUNDZfUc+2bTBZdIgDkcod+vz7GrD8GqH2u3DisSTQNjN
 KrKUG4JXtHfyI9z8oUZJbxpBnYcSUa1eUy8PYC02WHvD4RJTV5UaQ9n52QeU13pPBokS
 An/GhfpEjPn5kIiuDtARoBYyBHjSpf7BK5XdGSHoRlqc94rKNjyrXhFUBOJReEyyglrW
 uclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CC7UlldrvJy8q5BHGKY3ed+L0GtDqSFJKC+sawO7zxA=;
 b=TYbHgRKXpvNjLG8pFINKAL+0szB97SHjlf5N5m8+DmevRueRwdmvA3OUXvgW79mFWn
 vGKKWScfHUrzy8M6YxFNn6D3Qii+j3bKJV6bR47So+xyfLqy67jUnHw4rxPxnn44EZw2
 0vaI736MrUIew7wNhCx0y0YNuw2Bz9TPvWpjXHaRupyzIzyfLeoAupSmPlI2K2FC14Fx
 T01R6i/J974s2X0E+6ae2Gr5fp1Baf6chPtdgpEbYvmXW5USvwMZieOegSLoU+nNnPxT
 TGTdzKoxV3BUx0Oh8rj6m4cdSkAOsxMwhPFaQ8rZzXDaPmGv9L96oyOAUd7DdJ+7ZVJ0
 NwPw==
X-Gm-Message-State: APjAAAVDIbzmcSuIWeP9S95ZtsVKiVvqWM9Df88O/R1KokTVi++PhF0k
 YtKqjAj4lBabOlL6LPR3OFdis8i1
X-Google-Smtp-Source: APXvYqyct6eT52oYvY1a9q9Hcb5npc3W9NltwXzdEN8xjjeVpI8oNK+hm2rmmmgElyK651gEbuZ8mA==
X-Received: by 2002:a05:620a:159b:: with SMTP id
 d27mr20304745qkk.298.1567977755385; 
 Sun, 08 Sep 2019 14:22:35 -0700 (PDT)
Received: from nullptr.home.dirty-ice.org
 (2a01-036c-0113-6ea8-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:6ea8::5])
 by smtp.gmail.com with ESMTPSA id e2sm5488112qkg.38.2019.09.08.14.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Sep 2019 14:22:35 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
 <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
 <DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  8 Sep 2019 23:22:07 +0200
Message-Id: <7d47239069c7acdd22926e390f09f9bb8a3b08d9.1567965065.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1567965065.git.DirtY.iCE.hu@gmail.com>
References: <cover.1567965065.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::732
Subject: [Qemu-devel] [PATCH v2 07/24] paaudio: port to the new audio
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
 audio/Makefile.objs  |   1 -
 audio/audio_pt_int.c | 173 --------------------
 audio/audio_pt_int.h |  22 ---
 audio/paaudio.c      | 372 ++++++-------------------------------------
 configure            |   5 -
 5 files changed, 45 insertions(+), 528 deletions(-)
 delete mode 100644 audio/audio_pt_int.c
 delete mode 100644 audio/audio_pt_int.h

diff --git a/audio/Makefile.objs b/audio/Makefile.objs
index dca87f6347..d7490a379f 100644
--- a/audio/Makefile.objs
+++ b/audio/Makefile.objs
@@ -2,7 +2,6 @@ common-obj-y = audio.o audio_legacy.o noaudio.o wavaudio.o mixeng.o
 common-obj-$(CONFIG_SPICE) += spiceaudio.o
 common-obj-$(CONFIG_AUDIO_COREAUDIO) += coreaudio.o
 common-obj-$(CONFIG_AUDIO_DSOUND) += dsoundaudio.o
-common-obj-$(CONFIG_AUDIO_PT_INT) += audio_pt_int.o
 common-obj-$(CONFIG_AUDIO_WIN_INT) += audio_win_int.o
 common-obj-y += wavcapture.o
 
diff --git a/audio/audio_pt_int.c b/audio/audio_pt_int.c
deleted file mode 100644
index 9f9d44ad4a..0000000000
--- a/audio/audio_pt_int.c
+++ /dev/null
@@ -1,173 +0,0 @@
-#include "qemu/osdep.h"
-#include "audio.h"
-
-#define AUDIO_CAP "audio-pt"
-
-#include "audio_int.h"
-#include "audio_pt_int.h"
-
-static void GCC_FMT_ATTR(3, 4) logerr (struct audio_pt *pt, int err,
-                                       const char *fmt, ...)
-{
-    va_list ap;
-
-    va_start (ap, fmt);
-    AUD_vlog (pt->drv, fmt, ap);
-    va_end (ap);
-
-    AUD_log (NULL, "\n");
-    AUD_log (pt->drv, "Reason: %s\n", strerror (err));
-}
-
-int audio_pt_init (struct audio_pt *p, void *(*func) (void *),
-                   void *opaque, const char *drv, const char *cap)
-{
-    int err, err2;
-    const char *efunc;
-    sigset_t set, old_set;
-
-    p->drv = drv;
-
-    err = sigfillset (&set);
-    if (err) {
-        logerr(p, errno, "%s(%s): sigfillset failed", cap, __func__);
-        return -1;
-    }
-
-    err = pthread_mutex_init (&p->mutex, NULL);
-    if (err) {
-        efunc = "pthread_mutex_init";
-        goto err0;
-    }
-
-    err = pthread_cond_init (&p->cond, NULL);
-    if (err) {
-        efunc = "pthread_cond_init";
-        goto err1;
-    }
-
-    err = pthread_sigmask (SIG_BLOCK, &set, &old_set);
-    if (err) {
-        efunc = "pthread_sigmask";
-        goto err2;
-    }
-
-    err = pthread_create (&p->thread, NULL, func, opaque);
-
-    err2 = pthread_sigmask (SIG_SETMASK, &old_set, NULL);
-    if (err2) {
-        logerr(p, err2, "%s(%s): pthread_sigmask (restore) failed",
-               cap, __func__);
-        /* We have failed to restore original signal mask, all bets are off,
-           so terminate the process */
-        exit (EXIT_FAILURE);
-    }
-
-    if (err) {
-        efunc = "pthread_create";
-        goto err2;
-    }
-
-    return 0;
-
- err2:
-    err2 = pthread_cond_destroy (&p->cond);
-    if (err2) {
-        logerr(p, err2, "%s(%s): pthread_cond_destroy failed", cap, __func__);
-    }
-
- err1:
-    err2 = pthread_mutex_destroy (&p->mutex);
-    if (err2) {
-        logerr(p, err2, "%s(%s): pthread_mutex_destroy failed", cap, __func__);
-    }
-
- err0:
-    logerr(p, err, "%s(%s): %s failed", cap, __func__, efunc);
-    return -1;
-}
-
-int audio_pt_fini (struct audio_pt *p, const char *cap)
-{
-    int err, ret = 0;
-
-    err = pthread_cond_destroy (&p->cond);
-    if (err) {
-        logerr(p, err, "%s(%s): pthread_cond_destroy failed", cap, __func__);
-        ret = -1;
-    }
-
-    err = pthread_mutex_destroy (&p->mutex);
-    if (err) {
-        logerr(p, err, "%s(%s): pthread_mutex_destroy failed", cap, __func__);
-        ret = -1;
-    }
-    return ret;
-}
-
-int audio_pt_lock (struct audio_pt *p, const char *cap)
-{
-    int err;
-
-    err = pthread_mutex_lock (&p->mutex);
-    if (err) {
-        logerr(p, err, "%s(%s): pthread_mutex_lock failed", cap, __func__);
-        return -1;
-    }
-    return 0;
-}
-
-int audio_pt_unlock (struct audio_pt *p, const char *cap)
-{
-    int err;
-
-    err = pthread_mutex_unlock (&p->mutex);
-    if (err) {
-        logerr(p, err, "%s(%s): pthread_mutex_unlock failed", cap, __func__);
-        return -1;
-    }
-    return 0;
-}
-
-int audio_pt_wait (struct audio_pt *p, const char *cap)
-{
-    int err;
-
-    err = pthread_cond_wait (&p->cond, &p->mutex);
-    if (err) {
-        logerr(p, err, "%s(%s): pthread_cond_wait failed", cap, __func__);
-        return -1;
-    }
-    return 0;
-}
-
-int audio_pt_unlock_and_signal (struct audio_pt *p, const char *cap)
-{
-    int err;
-
-    err = pthread_mutex_unlock (&p->mutex);
-    if (err) {
-        logerr(p, err, "%s(%s): pthread_mutex_unlock failed", cap, __func__);
-        return -1;
-    }
-    err = pthread_cond_signal (&p->cond);
-    if (err) {
-        logerr(p, err, "%s(%s): pthread_cond_signal failed", cap, __func__);
-        return -1;
-    }
-    return 0;
-}
-
-int audio_pt_join (struct audio_pt *p, void **arg, const char *cap)
-{
-    int err;
-    void *ret;
-
-    err = pthread_join (p->thread, &ret);
-    if (err) {
-        logerr(p, err, "%s(%s): pthread_join failed", cap, __func__);
-        return -1;
-    }
-    *arg = ret;
-    return 0;
-}
diff --git a/audio/audio_pt_int.h b/audio/audio_pt_int.h
deleted file mode 100644
index 4c0c15b9af..0000000000
--- a/audio/audio_pt_int.h
+++ /dev/null
@@ -1,22 +0,0 @@
-#ifndef QEMU_AUDIO_PT_INT_H
-#define QEMU_AUDIO_PT_INT_H
-
-#include <pthread.h>
-
-struct audio_pt {
-    const char *drv;
-    pthread_t thread;
-    pthread_cond_t cond;
-    pthread_mutex_t mutex;
-};
-
-int audio_pt_init (struct audio_pt *, void *(*) (void *), void *,
-                   const char *, const char *);
-int audio_pt_fini (struct audio_pt *, const char *);
-int audio_pt_lock (struct audio_pt *, const char *);
-int audio_pt_unlock (struct audio_pt *, const char *);
-int audio_pt_wait (struct audio_pt *, const char *);
-int audio_pt_unlock_and_signal (struct audio_pt *, const char *);
-int audio_pt_join (struct audio_pt *, void **, const char *);
-
-#endif /* QEMU_AUDIO_PT_INT_H */
diff --git a/audio/paaudio.c b/audio/paaudio.c
index bfef9acaad..75fce53202 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -9,7 +9,6 @@
 
 #define AUDIO_CAP "pulseaudio"
 #include "audio_int.h"
-#include "audio_pt_int.h"
 
 typedef struct PAConnection {
     char *server;
@@ -30,28 +29,16 @@ typedef struct {
 
 typedef struct {
     HWVoiceOut hw;
-    size_t done;
-    size_t live;
-    size_t decr;
-    size_t rpos;
     pa_stream *stream;
-    void *pcm_buf;
-    struct audio_pt pt;
     paaudio *g;
     size_t samples;
 } PAVoiceOut;
 
 typedef struct {
     HWVoiceIn hw;
-    size_t done;
-    size_t dead;
-    size_t incr;
-    size_t wpos;
     pa_stream *stream;
-    void *pcm_buf;
-    struct audio_pt pt;
     const void *read_data;
-    size_t read_index, read_length;
+    size_t read_length;
     paaudio *g;
     size_t samples;
 } PAVoiceIn;
@@ -89,298 +76,96 @@ static inline int PA_STREAM_IS_GOOD(pa_stream_state_t x)
 }
 #endif
 
-#define CHECK_SUCCESS_GOTO(c, rerror, expression, label)        \
+#define CHECK_SUCCESS_GOTO(c, expression, label, msg)           \
     do {                                                        \
         if (!(expression)) {                                    \
-            if (rerror) {                                       \
-                *(rerror) = pa_context_errno ((c)->context);    \
-            }                                                   \
+            qpa_logerr(pa_context_errno((c)->context), msg);    \
             goto label;                                         \
         }                                                       \
     } while (0)
 
-#define CHECK_DEAD_GOTO(c, stream, rerror, label)                       \
+#define CHECK_DEAD_GOTO(c, stream, label, msg)                          \
     do {                                                                \
         if (!(c)->context || !PA_CONTEXT_IS_GOOD (pa_context_get_state((c)->context)) || \
             !(stream) || !PA_STREAM_IS_GOOD (pa_stream_get_state ((stream)))) { \
             if (((c)->context && pa_context_get_state ((c)->context) == PA_CONTEXT_FAILED) || \
                 ((stream) && pa_stream_get_state ((stream)) == PA_STREAM_FAILED)) { \
-                if (rerror) {                                           \
-                    *(rerror) = pa_context_errno ((c)->context);        \
-                }                                                       \
+                qpa_logerr(pa_context_errno((c)->context), msg);        \
             } else {                                                    \
-                if (rerror) {                                           \
-                    *(rerror) = PA_ERR_BADSTATE;                        \
-                }                                                       \
+                qpa_logerr(PA_ERR_BADSTATE, msg);                       \
             }                                                           \
             goto label;                                                 \
         }                                                               \
     } while (0)
 
-static int qpa_simple_read (PAVoiceIn *p, void *data, size_t length, int *rerror)
+static size_t qpa_read(HWVoiceIn *hw, void *data, size_t length)
 {
+    PAVoiceIn *p = (PAVoiceIn *) hw;
     PAConnection *c = p->g->conn;
+    size_t l;
+    int r;
 
     pa_threaded_mainloop_lock(c->mainloop);
 
-    CHECK_DEAD_GOTO(c, p->stream, rerror, unlock_and_fail);
-
-    while (length > 0) {
-        size_t l;
-
-        while (!p->read_data) {
-            int r;
-
-            r = pa_stream_peek (p->stream, &p->read_data, &p->read_length);
-            CHECK_SUCCESS_GOTO(c, rerror, r == 0, unlock_and_fail);
-
-            if (!p->read_data) {
-                pa_threaded_mainloop_wait(c->mainloop);
-                CHECK_DEAD_GOTO(c, p->stream, rerror, unlock_and_fail);
-            } else {
-                p->read_index = 0;
-            }
-        }
-
-        l = p->read_length < length ? p->read_length : length;
-        memcpy (data, (const uint8_t *) p->read_data+p->read_index, l);
-
-        data = (uint8_t *) data + l;
-        length -= l;
+    CHECK_DEAD_GOTO(c, p->stream, unlock_and_fail,
+                    "pa_threaded_mainloop_lock failed\n");
 
-        p->read_index += l;
-        p->read_length -= l;
+    if (!p->read_length) {
+        r = pa_stream_peek(p->stream, &p->read_data, &p->read_length);
+        CHECK_SUCCESS_GOTO(c, r == 0, unlock_and_fail,
+                           "pa_stream_peek failed\n");
+    }
 
-        if (!p->read_length) {
-            int r;
+    l = MIN(p->read_length, length);
+    memcpy(data, p->read_data, l);
 
-            r = pa_stream_drop (p->stream);
-            p->read_data = NULL;
-            p->read_length = 0;
-            p->read_index = 0;
+    p->read_data += l;
+    p->read_length -= l;
 
-            CHECK_SUCCESS_GOTO(c, rerror, r == 0, unlock_and_fail);
-        }
+    if (!p->read_length) {
+        r = pa_stream_drop(p->stream);
+        CHECK_SUCCESS_GOTO(c, r == 0, unlock_and_fail,
+                           "pa_stream_drop failed\n");
     }
 
     pa_threaded_mainloop_unlock(c->mainloop);
-    return 0;
+    return l;
 
 unlock_and_fail:
     pa_threaded_mainloop_unlock(c->mainloop);
-    return -1;
+    return 0;
 }
 
-static int qpa_simple_write (PAVoiceOut *p, const void *data, size_t length, int *rerror)
+static size_t qpa_write(HWVoiceOut *hw, void *data, size_t length)
 {
+    PAVoiceOut *p = (PAVoiceOut *) hw;
     PAConnection *c = p->g->conn;
+    size_t l;
+    int r;
 
     pa_threaded_mainloop_lock(c->mainloop);
 
-    CHECK_DEAD_GOTO(c, p->stream, rerror, unlock_and_fail);
+    CHECK_DEAD_GOTO(c, p->stream, unlock_and_fail,
+                    "pa_threaded_mainloop_lock failed\n");
 
-    while (length > 0) {
-        size_t l;
-        int r;
+    l = pa_stream_writable_size(p->stream);
 
-        while (!(l = pa_stream_writable_size (p->stream))) {
-            pa_threaded_mainloop_wait(c->mainloop);
-            CHECK_DEAD_GOTO(c, p->stream, rerror, unlock_and_fail);
-        }
-
-        CHECK_SUCCESS_GOTO(c, rerror, l != (size_t) -1, unlock_and_fail);
-
-        if (l > length) {
-            l = length;
-        }
+    CHECK_SUCCESS_GOTO(c, l != (size_t) -1, unlock_and_fail,
+                       "pa_stream_writable_size failed\n");
 
-        r = pa_stream_write (p->stream, data, l, NULL, 0LL, PA_SEEK_RELATIVE);
-        CHECK_SUCCESS_GOTO(c, rerror, r >= 0, unlock_and_fail);
-
-        data = (const uint8_t *) data + l;
-        length -= l;
+    if (l > length) {
+        l = length;
     }
 
+    r = pa_stream_write(p->stream, data, l, NULL, 0LL, PA_SEEK_RELATIVE);
+    CHECK_SUCCESS_GOTO(c, r >= 0, unlock_and_fail, "pa_stream_write failed\n");
+
     pa_threaded_mainloop_unlock(c->mainloop);
-    return 0;
+    return l;
 
 unlock_and_fail:
     pa_threaded_mainloop_unlock(c->mainloop);
-    return -1;
-}
-
-static void *qpa_thread_out (void *arg)
-{
-    PAVoiceOut *pa = arg;
-    HWVoiceOut *hw = &pa->hw;
-
-    if (audio_pt_lock(&pa->pt, __func__)) {
-        return NULL;
-    }
-
-    for (;;) {
-        size_t decr, to_mix, rpos;
-
-        for (;;) {
-            if (pa->done) {
-                goto exit;
-            }
-
-            if (pa->live > 0) {
-                break;
-            }
-
-            if (audio_pt_wait(&pa->pt, __func__)) {
-                goto exit;
-            }
-        }
-
-        decr = to_mix = MIN(pa->live, pa->samples >> 5);
-        rpos = pa->rpos;
-
-        if (audio_pt_unlock(&pa->pt, __func__)) {
-            return NULL;
-        }
-
-        while (to_mix) {
-            int error;
-            size_t chunk = MIN (to_mix, hw->samples - rpos);
-            struct st_sample *src = hw->mix_buf + rpos;
-
-            hw->clip (pa->pcm_buf, src, chunk);
-
-            if (qpa_simple_write (pa, pa->pcm_buf,
-                                  chunk << hw->info.shift, &error) < 0) {
-                qpa_logerr (error, "pa_simple_write failed\n");
-                return NULL;
-            }
-
-            rpos = (rpos + chunk) % hw->samples;
-            to_mix -= chunk;
-        }
-
-        if (audio_pt_lock(&pa->pt, __func__)) {
-            return NULL;
-        }
-
-        pa->rpos = rpos;
-        pa->live -= decr;
-        pa->decr += decr;
-    }
-
- exit:
-    audio_pt_unlock(&pa->pt, __func__);
-    return NULL;
-}
-
-static size_t qpa_run_out(HWVoiceOut *hw, size_t live)
-{
-    size_t decr;
-    PAVoiceOut *pa = (PAVoiceOut *) hw;
-
-    if (audio_pt_lock(&pa->pt, __func__)) {
-        return 0;
-    }
-
-    decr = MIN (live, pa->decr);
-    pa->decr -= decr;
-    pa->live = live - decr;
-    hw->rpos = pa->rpos;
-    if (pa->live > 0) {
-        audio_pt_unlock_and_signal(&pa->pt, __func__);
-    }
-    else {
-        audio_pt_unlock(&pa->pt, __func__);
-    }
-    return decr;
-}
-
-/* capture */
-static void *qpa_thread_in (void *arg)
-{
-    PAVoiceIn *pa = arg;
-    HWVoiceIn *hw = &pa->hw;
-
-    if (audio_pt_lock(&pa->pt, __func__)) {
-        return NULL;
-    }
-
-    for (;;) {
-        size_t incr, to_grab, wpos;
-
-        for (;;) {
-            if (pa->done) {
-                goto exit;
-            }
-
-            if (pa->dead > 0) {
-                break;
-            }
-
-            if (audio_pt_wait(&pa->pt, __func__)) {
-                goto exit;
-            }
-        }
-
-        incr = to_grab = MIN(pa->dead, pa->samples >> 5);
-        wpos = pa->wpos;
-
-        if (audio_pt_unlock(&pa->pt, __func__)) {
-            return NULL;
-        }
-
-        while (to_grab) {
-            int error;
-            size_t chunk = MIN (to_grab, hw->samples - wpos);
-            void *buf = advance (pa->pcm_buf, wpos);
-
-            if (qpa_simple_read (pa, buf,
-                                 chunk << hw->info.shift, &error) < 0) {
-                qpa_logerr (error, "pa_simple_read failed\n");
-                return NULL;
-            }
-
-            hw->conv (hw->conv_buf + wpos, buf, chunk);
-            wpos = (wpos + chunk) % hw->samples;
-            to_grab -= chunk;
-        }
-
-        if (audio_pt_lock(&pa->pt, __func__)) {
-            return NULL;
-        }
-
-        pa->wpos = wpos;
-        pa->dead -= incr;
-        pa->incr += incr;
-    }
-
- exit:
-    audio_pt_unlock(&pa->pt, __func__);
-    return NULL;
-}
-
-static size_t qpa_run_in(HWVoiceIn *hw)
-{
-    size_t live, incr, dead;
-    PAVoiceIn *pa = (PAVoiceIn *) hw;
-
-    if (audio_pt_lock(&pa->pt, __func__)) {
-        return 0;
-    }
-
-    live = audio_pcm_hw_get_live_in (hw);
-    dead = hw->samples - live;
-    incr = MIN (dead, pa->incr);
-    pa->incr -= incr;
-    pa->dead = dead - incr;
-    hw->wpos = pa->wpos;
-    if (pa->dead > 0) {
-        audio_pt_unlock_and_signal(&pa->pt, __func__);
-    }
-    else {
-        audio_pt_unlock(&pa->pt, __func__);
-    }
-    return incr;
+    return 0;
 }
 
 static pa_sample_format_t audfmt_to_pa (AudioFormat afmt, int endianness)
@@ -468,13 +253,6 @@ static void stream_state_cb (pa_stream *s, void * userdata)
     }
 }
 
-static void stream_request_cb (pa_stream *s, size_t length, void *userdata)
-{
-    PAConnection *c = userdata;
-
-    pa_threaded_mainloop_signal(c->mainloop, 0);
-}
-
 static pa_stream *qpa_simple_new (
         PAConnection *c,
         const char *name,
@@ -497,8 +275,6 @@ static pa_stream *qpa_simple_new (
     }
 
     pa_stream_set_state_callback(stream, stream_state_cb, c);
-    pa_stream_set_read_callback(stream, stream_request_cb, c);
-    pa_stream_set_write_callback(stream, stream_request_cb, c);
 
     flags =
         PA_STREAM_INTERPOLATE_TIMING
@@ -579,28 +355,9 @@ static int qpa_init_out(HWVoiceOut *hw, struct audsettings *as,
     hw->samples = pa->samples = audio_buffer_samples(
         qapi_AudiodevPaPerDirectionOptions_base(ppdo),
         &obt_as, ppdo->buffer_length);
-    pa->pcm_buf = audio_calloc(__func__, hw->samples, 1 << hw->info.shift);
-    pa->rpos = hw->rpos;
-    if (!pa->pcm_buf) {
-        dolog("Could not allocate buffer (%zu bytes)\n",
-              hw->samples << hw->info.shift);
-        goto fail2;
-    }
-
-    if (audio_pt_init(&pa->pt, qpa_thread_out, hw, AUDIO_CAP, __func__)) {
-        goto fail3;
-    }
 
     return 0;
 
- fail3:
-    g_free (pa->pcm_buf);
-    pa->pcm_buf = NULL;
- fail2:
-    if (pa->stream) {
-        pa_stream_unref (pa->stream);
-        pa->stream = NULL;
-    }
  fail1:
     return -1;
 }
@@ -647,28 +404,9 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
     hw->samples = pa->samples = audio_buffer_samples(
         qapi_AudiodevPaPerDirectionOptions_base(ppdo),
         &obt_as, ppdo->buffer_length);
-    pa->pcm_buf = audio_calloc(__func__, hw->samples, 1 << hw->info.shift);
-    pa->wpos = hw->wpos;
-    if (!pa->pcm_buf) {
-        dolog("Could not allocate buffer (%zu bytes)\n",
-              hw->samples << hw->info.shift);
-        goto fail2;
-    }
-
-    if (audio_pt_init(&pa->pt, qpa_thread_in, hw, AUDIO_CAP, __func__)) {
-        goto fail3;
-    }
 
     return 0;
 
- fail3:
-    g_free (pa->pcm_buf);
-    pa->pcm_buf = NULL;
- fail2:
-    if (pa->stream) {
-        pa_stream_unref (pa->stream);
-        pa->stream = NULL;
-    }
  fail1:
     return -1;
 }
@@ -696,42 +434,22 @@ static void qpa_simple_disconnect(PAConnection *c, pa_stream *stream)
 
 static void qpa_fini_out (HWVoiceOut *hw)
 {
-    void *ret;
     PAVoiceOut *pa = (PAVoiceOut *) hw;
 
-    audio_pt_lock(&pa->pt, __func__);
-    pa->done = 1;
-    audio_pt_unlock_and_signal(&pa->pt, __func__);
-    audio_pt_join(&pa->pt, &ret, __func__);
-
     if (pa->stream) {
         qpa_simple_disconnect(pa->g->conn, pa->stream);
         pa->stream = NULL;
     }
-
-    audio_pt_fini(&pa->pt, __func__);
-    g_free (pa->pcm_buf);
-    pa->pcm_buf = NULL;
 }
 
 static void qpa_fini_in (HWVoiceIn *hw)
 {
-    void *ret;
     PAVoiceIn *pa = (PAVoiceIn *) hw;
 
-    audio_pt_lock(&pa->pt, __func__);
-    pa->done = 1;
-    audio_pt_unlock_and_signal(&pa->pt, __func__);
-    audio_pt_join(&pa->pt, &ret, __func__);
-
     if (pa->stream) {
         qpa_simple_disconnect(pa->g->conn, pa->stream);
         pa->stream = NULL;
     }
-
-    audio_pt_fini(&pa->pt, __func__);
-    g_free (pa->pcm_buf);
-    pa->pcm_buf = NULL;
 }
 
 static int qpa_ctl_out (HWVoiceOut *hw, int cmd, ...)
@@ -1005,12 +723,12 @@ static void qpa_audio_fini (void *opaque)
 static struct audio_pcm_ops qpa_pcm_ops = {
     .init_out = qpa_init_out,
     .fini_out = qpa_fini_out,
-    .run_out  = qpa_run_out,
+    .write    = qpa_write,
     .ctl_out  = qpa_ctl_out,
 
     .init_in  = qpa_init_in,
     .fini_in  = qpa_fini_in,
-    .run_in   = qpa_run_in,
+    .read     = qpa_read,
     .ctl_in   = qpa_ctl_in
 };
 
diff --git a/configure b/configure
index 95134c0180..15bf2a30fd 100755
--- a/configure
+++ b/configure
@@ -297,7 +297,6 @@ host_cc="cc"
 libs_cpu=""
 libs_softmmu=""
 libs_tools=""
-audio_pt_int=""
 audio_win_int=""
 libs_qga=""
 debug_info="yes"
@@ -3420,7 +3419,6 @@ for drv in $audio_drv_list; do
     pa | try-pa)
     if $pkg_config libpulse --exists; then
         pulse_libs=$($pkg_config libpulse --libs)
-        audio_pt_int="yes"
         if test "$drv" = "try-pa"; then
             audio_drv_list=$(echo "$audio_drv_list" | sed -e 's/try-pa/pa/')
         fi
@@ -6655,9 +6653,6 @@ echo "PULSE_LIBS=$pulse_libs" >> $config_host_mak
 echo "COREAUDIO_LIBS=$coreaudio_libs" >> $config_host_mak
 echo "DSOUND_LIBS=$dsound_libs" >> $config_host_mak
 echo "OSS_LIBS=$oss_libs" >> $config_host_mak
-if test "$audio_pt_int" = "yes" ; then
-  echo "CONFIG_AUDIO_PT_INT=y" >> $config_host_mak
-fi
 if test "$audio_win_int" = "yes" ; then
   echo "CONFIG_AUDIO_WIN_INT=y" >> $config_host_mak
 fi
-- 
2.23.0


