Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 398212F0653
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 11:14:48 +0100 (CET)
Received: from localhost ([::1]:57122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyXkF-0006v9-9J
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 05:14:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXZC-00027r-Nq
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:22 -0500
Received: from mailout07.t-online.de ([194.25.134.83]:59858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXZA-0005Wl-Mj
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:22 -0500
Received: from fwd19.aul.t-online.de (fwd19.aul.t-online.de [172.20.27.65])
 by mailout07.t-online.de (Postfix) with SMTP id 7234D42DAAD1;
 Sun, 10 Jan 2021 11:03:19 +0100 (CET)
Received: from linpower.localnet
 (EX69uYZrrhX73Qye7hJAYo+vBEbH4cFar-iPZOKHspH9B5DdyWparAiHPKR7JIqwFZ@[93.236.152.29])
 by fwd19.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kyXYy-4AWRlI0; Sun, 10 Jan 2021 11:03:08 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 00E7F20063A; Sun, 10 Jan 2021 11:02:39 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 12/23] audio: remove remaining unused plive code
Date: Sun, 10 Jan 2021 11:02:28 +0100
Message-Id: <20210110100239.27588-12-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: EX69uYZrrhX73Qye7hJAYo+vBEbH4cFar-iPZOKHspH9B5DdyWparAiHPKR7JIqwFZ
X-TOI-EXPURGATEID: 150726::1610272989-00008954-54B0D0A2/0/0 CLEAN NORMAL
X-TOI-MSGID: d60598f8-040c-4e4f-b808-548f0e079ba3
Received-SPF: none client-ip=194.25.134.83;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout07.t-online.de
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
Cc: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?q?Zolt=C3=A1n=20K=C5=91v=C3=A1g=C3=B3?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 73ad33ef7b "audio: remove plive" forgot to remove this code.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 22d769db0c..34c9cb9182 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1132,7 +1132,7 @@ static void audio_run_out (AudioState *s)
 
     while ((hw = audio_pcm_hw_find_any_enabled_out(s, hw))) {
         size_t played, live, prev_rpos, free;
-        int nb_live, cleanup_required;
+        int nb_live;
 
         live = audio_pcm_hw_get_live_out (hw, &nb_live);
         if (!nb_live) {
@@ -1194,7 +1194,6 @@ static void audio_run_out (AudioState *s)
             audio_capture_mix_and_clear (hw, prev_rpos, played);
         }
 
-        cleanup_required = 0;
         for (sw = hw->sw_head.lh_first; sw; sw = sw->entries.le_next) {
             if (!sw->active && sw->empty) {
                 continue;
@@ -1210,7 +1209,6 @@ static void audio_run_out (AudioState *s)
 
             if (!sw->total_hw_samples_mixed) {
                 sw->empty = 1;
-                cleanup_required |= !sw->active && !sw->callback.fn;
             }
 
             if (sw->active) {
@@ -1220,19 +1218,6 @@ static void audio_run_out (AudioState *s)
                 }
             }
         }
-
-        if (cleanup_required) {
-            SWVoiceOut *sw1;
-
-            sw = hw->sw_head.lh_first;
-            while (sw) {
-                sw1 = sw->entries.le_next;
-                if (!sw->active && !sw->callback.fn) {
-                    audio_close_out (sw);
-                }
-                sw = sw1;
-            }
-        }
     }
 }
 
-- 
2.26.2


