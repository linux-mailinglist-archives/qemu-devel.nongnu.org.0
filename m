Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C692D8D2C
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 14:12:06 +0100 (CET)
Received: from localhost ([::1]:56420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koRAT-0001BL-A6
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 08:12:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1koR4K-0006ct-6W
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 08:05:44 -0500
Received: from mailout11.t-online.de ([194.25.134.85]:58914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1koR4F-0000jx-5P
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 08:05:43 -0500
Received: from fwd23.aul.t-online.de (fwd23.aul.t-online.de [172.20.26.128])
 by mailout11.t-online.de (Postfix) with SMTP id 76EAA42229D8;
 Sun, 13 Dec 2020 14:05:37 +0100 (CET)
Received: from linpower.localnet
 (XKnOyeZSYh+WU4gWoIYlY58ntX8OdE8NCAiTLe0-uKiSxJNvrtxFAGJh+MdYWDlgkS@[79.208.17.59])
 by fwd23.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1koR4C-0NfIy80; Sun, 13 Dec 2020 14:05:36 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 2253E200625; Sun, 13 Dec 2020 14:05:28 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 4/4] audio: remove unused function audio_is_cleaning_up()
Date: Sun, 13 Dec 2020 14:05:28 +0100
Message-Id: <20201213130528.5863-4-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <1a970310-4cff-f2f7-985e-05b2f4cd446b@t-online.de>
References: <1a970310-4cff-f2f7-985e-05b2f4cd446b@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: XKnOyeZSYh+WU4gWoIYlY58ntX8OdE8NCAiTLe0-uKiSxJNvrtxFAGJh+MdYWDlgkS
X-TOI-EXPURGATEID: 150726::1607864736-00017F06-4C10CF18/0/0 CLEAN NORMAL
X-TOI-MSGID: 5afa17a4-9fc0-4b39-bad4-2b54fee62e50
Received-SPF: none client-ip=194.25.134.85;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout11.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous commit removed the last call site of
audio_is_cleaning_up(). Remove the now unused function.

Tested-by: Howard Spoelstra <hsp.cat7@gmail.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c | 8 --------
 audio/audio.h | 1 -
 2 files changed, 9 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 46578e4a58..a213409270 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1588,13 +1588,6 @@ static void audio_vm_change_state_handler (void *opaque, int running,
     audio_reset_timer (s);
 }
 
-static bool is_cleaning_up;
-
-bool audio_is_cleaning_up(void)
-{
-    return is_cleaning_up;
-}
-
 static void free_audio_state(AudioState *s)
 {
     HWVoiceOut *hwo, *hwon;
@@ -1647,7 +1640,6 @@ static void free_audio_state(AudioState *s)
 
 void audio_cleanup(void)
 {
-    is_cleaning_up = true;
     while (!QTAILQ_EMPTY(&audio_states)) {
         AudioState *s = QTAILQ_FIRST(&audio_states);
         QTAILQ_REMOVE(&audio_states, s, list);
diff --git a/audio/audio.h b/audio/audio.h
index b883ebfb1f..41b3ef04ea 100644
--- a/audio/audio.h
+++ b/audio/audio.h
@@ -160,7 +160,6 @@ static inline void *advance (void *p, int incr)
 int wav_start_capture(AudioState *state, CaptureState *s, const char *path,
                       int freq, int bits, int nchannels);
 
-bool audio_is_cleaning_up(void);
 void audio_cleanup(void);
 
 void audio_sample_to_uint64(const void *samples, int pos,
-- 
2.26.2


