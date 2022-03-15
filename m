Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F8E4D9BDD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:12:12 +0100 (CET)
Received: from localhost ([::1]:58646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6yB-00016v-QG
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:12:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6hu-0005CC-NN
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:55:23 -0400
Received: from [2607:f8b0:4864:20::62b] (port=37830
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6ho-00080S-P8
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:55:18 -0400
Received: by mail-pl1-x62b.google.com with SMTP id n2so16159434plf.4
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=46NBNvVoysH9eJqR3eLDXH7RhT1oumyXXssv7c0pDs4=;
 b=f4io/NGfwhnOScwGHCD+cp9MCtYbVyW/+cdsPMUURlxE0QlKDAkV8aXbxApXnmwpq9
 HmCfsda5AMaGdBTF1SUpdoOufYFS41oscoau6e/bMPWdtMCY+DrUKokubVXIzEwIvNIK
 71+mxYNz1yFI9tAvD3JY99LMvmSnP/C83z9MaA0a2/ICkqObBn6w3zeRpNK8kMxokKsq
 wJz5ohc+0tPS5HTJLrW0rYEWVkWRigBxJFIN7pmZ0NXDYsxd5z0BDDTj7EO5/Pfom7Sw
 RhsMgkDg73/snNpaZKy7UZRZmbyMWyUdHcI1GQ9gioHXei2ejxwpcz+J4iCKzi69kq33
 BDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=46NBNvVoysH9eJqR3eLDXH7RhT1oumyXXssv7c0pDs4=;
 b=3ms02HaXJG2DAp/sqiv7S87DKlqaHtIFlqnB/3uj56etwvRXtwHNfcIbjVmXaSjDiA
 HCa900K59nSt0S2/XD9dBTzc+x1LJ6c4i9XfvemRUyHa3vnr3XwEHAs/qXsmP7C2/b8v
 ejKL5G4YYH03VkY1+E/5KeIrLvqdSq5eSJGk0unfxBK/qzuQfj2eOovcTkQJ0aEjAEG6
 19htJLdQ+xiTtAtpAJlQttF3kxuxr7UhSYnz9YUlazQ4HoIXxbqWcU2FnF1JEzyR8nkW
 d0tR72bdss6bmdRu/H1YUhdIwx5g63WE1g60d1b4WkRa7LppAJlFdZb0fCYoNQUdl4+N
 Pf9w==
X-Gm-Message-State: AOAM530oK9lxOx6aZ/VzM2XaSfWIrpycVe3xku46tIP1mT5HmlWFfC5U
 jrqDqSaZ+7yTtz4YZkAbwYJxY508vgo=
X-Google-Smtp-Source: ABdhPJzBGKRkVO3KvNuBv2svgV/0Ojcyi9y18VrVjfN/usJJ9x8NBG0yQPfnNGvw3aDjNgJFLcW6xw==
X-Received: by 2002:a17:90a:5643:b0:1bf:ac1f:a1de with SMTP id
 d3-20020a17090a564300b001bfac1fa1demr4405183pji.224.1647348914792; 
 Tue, 15 Mar 2022 05:55:14 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a17090a460600b001bf355e964fsm3099227pjg.0.2022.03.15.05.55.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Mar 2022 05:55:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/21] audio: Log context for audio bug
Date: Tue, 15 Mar 2022 13:53:38 +0100
Message-Id: <20220315125350.82452-10-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
References: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Without this change audio_bug aborts when the bug condition is met,
which discards following useful logs. Call abort after such logs.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220306063202.27331-1-akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 audio/audio.c          | 25 ++++++++++++-------------
 audio/audio_template.h | 27 ++++++++++++---------------
 2 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index a88572e713..6bc313d9f5 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -117,7 +117,6 @@ int audio_bug (const char *funcname, int cond)
             AUD_log (NULL, "I am sorry\n");
         }
         AUD_log (NULL, "Context:\n");
-        abort();
     }
 
     return cond;
@@ -138,7 +137,7 @@ static inline int audio_bits_to_index (int bits)
     default:
         audio_bug ("bits_to_index", 1);
         AUD_log (NULL, "invalid bits %d\n", bits);
-        return 0;
+        abort();
     }
 }
 
@@ -156,7 +155,7 @@ void *audio_calloc (const char *funcname, int nmemb, size_t size)
         AUD_log (NULL, "%s passed invalid arguments to audio_calloc\n",
                  funcname);
         AUD_log (NULL, "nmemb=%d size=%zu (len=%zu)\n", nmemb, size, len);
-        return NULL;
+        abort();
     }
 
     return g_malloc0 (len);
@@ -543,7 +542,7 @@ static size_t audio_pcm_hw_get_live_in(HWVoiceIn *hw)
     size_t live = hw->total_samples_captured - audio_pcm_hw_find_min_in (hw);
     if (audio_bug(__func__, live > hw->conv_buf->size)) {
         dolog("live=%zu hw->conv_buf->size=%zu\n", live, hw->conv_buf->size);
-        return 0;
+        abort();
     }
     return live;
 }
@@ -581,7 +580,7 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
     }
     if (audio_bug(__func__, live > hw->conv_buf->size)) {
         dolog("live_in=%zu hw->conv_buf->size=%zu\n", live, hw->conv_buf->size);
-        return 0;
+        abort();
     }
 
     rpos = audio_ring_posb(hw->conv_buf->pos, live, hw->conv_buf->size);
@@ -656,7 +655,7 @@ static size_t audio_pcm_hw_get_live_out (HWVoiceOut *hw, int *nb_live)
 
         if (audio_bug(__func__, live > hw->mix_buf->size)) {
             dolog("live=%zu hw->mix_buf->size=%zu\n", live, hw->mix_buf->size);
-            return 0;
+            abort();
         }
         return live;
     }
@@ -706,7 +705,7 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
     live = sw->total_hw_samples_mixed;
     if (audio_bug(__func__, live > hwsamples)) {
         dolog("live=%zu hw->mix_buf->size=%zu\n", live, hwsamples);
-        return 0;
+        abort();
     }
 
     if (live == hwsamples) {
@@ -998,7 +997,7 @@ static size_t audio_get_avail (SWVoiceIn *sw)
     if (audio_bug(__func__, live > sw->hw->conv_buf->size)) {
         dolog("live=%zu sw->hw->conv_buf->size=%zu\n", live,
               sw->hw->conv_buf->size);
-        return 0;
+        abort();
     }
 
     ldebug (
@@ -1028,7 +1027,7 @@ static size_t audio_get_free(SWVoiceOut *sw)
     if (audio_bug(__func__, live > sw->hw->mix_buf->size)) {
         dolog("live=%zu sw->hw->mix_buf->size=%zu\n", live,
               sw->hw->mix_buf->size);
-        return 0;
+        abort();
     }
 
     dead = sw->hw->mix_buf->size - live;
@@ -1170,7 +1169,7 @@ static void audio_run_out (AudioState *s)
 
         if (audio_bug(__func__, live > hw->mix_buf->size)) {
             dolog("live=%zu hw->mix_buf->size=%zu\n", live, hw->mix_buf->size);
-            continue;
+            abort();
         }
 
         if (hw->pending_disable && !nb_live) {
@@ -1203,7 +1202,7 @@ static void audio_run_out (AudioState *s)
         if (audio_bug(__func__, hw->mix_buf->pos >= hw->mix_buf->size)) {
             dolog("hw->mix_buf->pos=%zu hw->mix_buf->size=%zu played=%zu\n",
                   hw->mix_buf->pos, hw->mix_buf->size, played);
-            hw->mix_buf->pos = 0;
+            abort();
         }
 
 #ifdef DEBUG_OUT
@@ -1223,7 +1222,7 @@ static void audio_run_out (AudioState *s)
             if (audio_bug(__func__, played > sw->total_hw_samples_mixed)) {
                 dolog("played=%zu sw->total_hw_samples_mixed=%zu\n",
                       played, sw->total_hw_samples_mixed);
-                played = sw->total_hw_samples_mixed;
+                abort();
             }
 
             sw->total_hw_samples_mixed -= played;
@@ -1346,7 +1345,7 @@ static void audio_run_capture (AudioState *s)
             if (audio_bug(__func__, captured > sw->total_hw_samples_mixed)) {
                 dolog("captured=%zu sw->total_hw_samples_mixed=%zu\n",
                       captured, sw->total_hw_samples_mixed);
-                captured = sw->total_hw_samples_mixed;
+                abort();
             }
 
             sw->total_hw_samples_mixed -= captured;
diff --git a/audio/audio_template.h b/audio/audio_template.h
index d2d348638b..7192b19e73 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -59,12 +59,13 @@ static void glue(audio_init_nb_voices_, TYPE)(AudioState *s,
     if (audio_bug(__func__, !voice_size && max_voices)) {
         dolog ("drv=`%s' voice_size=0 max_voices=%d\n",
                drv->name, max_voices);
-        glue (s->nb_hw_voices_, TYPE) = 0;
+        abort();
     }
 
     if (audio_bug(__func__, voice_size && !max_voices)) {
         dolog ("drv=`%s' voice_size=%d max_voices=0\n",
                drv->name, voice_size);
+        abort();
     }
 }
 
@@ -81,6 +82,7 @@ static void glue(audio_pcm_hw_alloc_resources_, TYPE)(HW *hw)
         size_t samples = hw->samples;
         if (audio_bug(__func__, samples == 0)) {
             dolog("Attempted to allocate empty buffer\n");
+            abort();
         }
 
         HWBUF = g_malloc0(sizeof(STSampleBuffer) + sizeof(st_sample) * samples);
@@ -252,12 +254,12 @@ static HW *glue(audio_pcm_hw_add_new_, TYPE)(AudioState *s,
 
     if (audio_bug(__func__, !drv)) {
         dolog ("No host audio driver\n");
-        return NULL;
+        abort();
     }
 
     if (audio_bug(__func__, !drv->pcm_ops)) {
         dolog ("Host audio driver without pcm_ops\n");
-        return NULL;
+        abort();
     }
 
     hw = audio_calloc(__func__, 1, glue(drv->voice_size_, TYPE));
@@ -275,12 +277,13 @@ static HW *glue(audio_pcm_hw_add_new_, TYPE)(AudioState *s,
     QLIST_INIT (&hw->cap_head);
 #endif
     if (glue (hw->pcm_ops->init_, TYPE) (hw, as, s->drv_opaque)) {
-        goto err0;
+        g_free(hw);
+        return NULL;
     }
 
     if (audio_bug(__func__, hw->samples <= 0)) {
         dolog("hw->samples=%zd\n", hw->samples);
-        goto err1;
+        abort();
     }
 
     if (hw->info.is_float) {
@@ -309,12 +312,6 @@ static HW *glue(audio_pcm_hw_add_new_, TYPE)(AudioState *s,
     audio_attach_capture (hw);
 #endif
     return hw;
-
- err1:
-    glue (hw->pcm_ops->fini_, TYPE) (hw);
- err0:
-    g_free (hw);
-    return NULL;
 }
 
 AudiodevPerDirectionOptions *glue(audio_get_pdo_, TYPE)(Audiodev *dev)
@@ -435,7 +432,7 @@ void glue (AUD_close_, TYPE) (QEMUSoundCard *card, SW *sw)
     if (sw) {
         if (audio_bug(__func__, !card)) {
             dolog ("card=%p\n", card);
-            return;
+            abort();
         }
 
         glue (audio_close_, TYPE) (sw);
@@ -457,7 +454,7 @@ SW *glue (AUD_open_, TYPE) (
     if (audio_bug(__func__, !card || !name || !callback_fn || !as)) {
         dolog ("card=%p name=%p callback_fn=%p as=%p\n",
                card, name, callback_fn, as);
-        goto fail;
+        abort();
     }
 
     s = card->state;
@@ -468,12 +465,12 @@ SW *glue (AUD_open_, TYPE) (
 
     if (audio_bug(__func__, audio_validate_settings(as))) {
         audio_print_settings (as);
-        goto fail;
+        abort();
     }
 
     if (audio_bug(__func__, !s->drv)) {
         dolog ("Can not open `%s' (no host audio driver)\n", name);
-        goto fail;
+        abort();
     }
 
     if (sw && audio_pcm_info_eq (&sw->info, as)) {
-- 
2.34.1


