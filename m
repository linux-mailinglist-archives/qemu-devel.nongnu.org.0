Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1962DAE48
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 14:50:36 +0100 (CET)
Received: from localhost ([::1]:56842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpAip-000180-UA
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 08:50:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kpAgu-0008FB-7t
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 08:48:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kpAgr-0007Ft-3H
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 08:48:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608040111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DuLkplo5t37rXxGgxXzT8WIWZid5j+FrkR/NEO57R28=;
 b=UEh/bTr63domQFJ4EX50vPGGO/uOlUBUhMseCbJucUh81dnAZ0sjnOAJP+hCEnqN/Q0rG4
 eb+eZd7mFde1SccVj8v1izSDg9KzpvmZ8Eb21pAoET6xiF+MW3ASNCHeWk75i6dR/qqgLy
 OyMzlXMDDyS1YiGCTp7r1PrQZr9i5IQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-uQVPioKBOpesUOj8iP0whQ-1; Tue, 15 Dec 2020 08:48:29 -0500
X-MC-Unique: uQVPioKBOpesUOj8iP0whQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD7E9107ACE3;
 Tue, 15 Dec 2020 13:48:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79C3419C66;
 Tue, 15 Dec 2020 13:48:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A70E89D99; Tue, 15 Dec 2020 14:48:26 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] audio: remove unused function audio_is_cleaning_up()
Date: Tue, 15 Dec 2020 14:48:23 +0100
Message-Id: <20201215134826.5504-5-kraxel@redhat.com>
In-Reply-To: <20201215134826.5504-1-kraxel@redhat.com>
References: <20201215134826.5504-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Gerd Hoffmann <kraxel@redhat.com>, Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

The previous commit removed the last call site of
audio_is_cleaning_up(). Remove the now unused function.

Tested-by: Howard Spoelstra <hsp.cat7@gmail.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-id: 20201213130528.5863-4-vr_qemu@t-online.de
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio.h | 1 -
 audio/audio.c | 8 --------
 2 files changed, 9 deletions(-)

diff --git a/audio/audio.h b/audio/audio.h
index b883ebfb1f8e..41b3ef04eae1 100644
--- a/audio/audio.h
+++ b/audio/audio.h
@@ -160,7 +160,6 @@ static inline void *advance (void *p, int incr)
 int wav_start_capture(AudioState *state, CaptureState *s, const char *path,
                       int freq, int bits, int nchannels);
 
-bool audio_is_cleaning_up(void);
 void audio_cleanup(void);
 
 void audio_sample_to_uint64(const void *samples, int pos,
diff --git a/audio/audio.c b/audio/audio.c
index 46578e4a583b..a21340927033 100644
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
-- 
2.27.0


