Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED52D2F7D40
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:54:45 +0100 (CET)
Received: from localhost ([::1]:45840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PYr-0001tE-09
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:54:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3L-00071W-KL
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3A-0003JI-8A
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=In8PUGOOa/IGTluhAQ9CWs/0bnDy0RkHyhU9+DnYd6g=;
 b=FoROWvnlU2DzHny8d4QoN9RJCvGFWQwOEB7G4QK39elL4tpd93/dGUMG3efE0ATib3jIF2
 ejzz+l1O1AiD6suEjTWh5fhOSj4p4OtL7z1OVE3Zt0xDmr0Eg2mwSl6eaUTkgaG1/opOPm
 DD6lxr2EWDlg8pbhOsyC8nSe2hl4j2g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-Cm4Tkn3XMcmGx-U26vEqbA-1; Fri, 15 Jan 2021 08:21:56 -0500
X-MC-Unique: Cm4Tkn3XMcmGx-U26vEqbA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 929A7100F340;
 Fri, 15 Jan 2021 13:21:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85E7310027A5;
 Fri, 15 Jan 2021 13:21:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AB6A21800D47; Fri, 15 Jan 2021 14:21:46 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/30] audio: remove remaining unused plive code
Date: Fri, 15 Jan 2021 14:21:28 +0100
Message-Id: <20210115132146.1443592-13-kraxel@redhat.com>
In-Reply-To: <20210115132146.1443592-1-kraxel@redhat.com>
References: <20210115132146.1443592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Commit 73ad33ef7b "audio: remove plive" forgot to remove this code.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-id: 9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de
Message-Id: <20210110100239.27588-12-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 22d769db0c99..34c9cb918279 100644
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
2.29.2


