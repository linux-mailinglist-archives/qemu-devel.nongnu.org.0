Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D532F7D06
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:47:01 +0100 (CET)
Received: from localhost ([::1]:48306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PRM-0007n6-Lr
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:47:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3Y-0007DX-NK
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3B-0003Kg-KX
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/CsAFhHZipfI4c7va0vtqF+oszypLzX1Hm3+BZ1ugGs=;
 b=OxQP3Lx1vUGDNHVV8V/WJXR1z+CW+FZeO6Bxj2z8EVsE/yPD08rJQUw7ZGRZyRIdqHIx7/
 zq42xg1HYuAxb3qKERuZFqeBgFtootCw4KAN6MuJiqzIajS0lULBh2iLF3NI+MvhAkTdwQ
 /zFEKot7yGrUD927U/pyRig0t5cWjyg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-nNx3R6-FNcaeLpAWgVVb8Q-1; Fri, 15 Jan 2021 08:21:56 -0500
X-MC-Unique: nNx3R6-FNcaeLpAWgVVb8Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDED0180A09B;
 Fri, 15 Jan 2021 13:21:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39FA219726;
 Fri, 15 Jan 2021 13:21:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D77F01800D4B; Fri, 15 Jan 2021 14:21:46 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/30] paaudio: remove unneeded code
Date: Fri, 15 Jan 2021 14:21:32 +0100
Message-Id: <20210115132146.1443592-17-kraxel@redhat.com>
In-Reply-To: <20210115132146.1443592-1-kraxel@redhat.com>
References: <20210115132146.1443592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Commit baea032ec7 "audio/paaudio: fix ignored buffer_length setting"
added code to handle buffer_length defaults. This was unnecessary
because the audio_buffer_* functions in audio/audio.c already handle
this. Remove the unneeded code.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-id: 9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de
Message-Id: <20210110100239.27588-16-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/paaudio.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index 4a1ffda753d5..86038f3e1392 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -539,8 +539,7 @@ static int qpa_init_out(HWVoiceOut *hw, struct audsettings *as,
 
     audio_pcm_init_info (&hw->info, &obt_as);
     hw->samples = audio_buffer_samples(
-        qapi_AudiodevPaPerDirectionOptions_base(ppdo),
-        &obt_as, ppdo->buffer_length);
+        qapi_AudiodevPaPerDirectionOptions_base(ppdo), &obt_as, 46440);
 
     return 0;
 
@@ -587,8 +586,7 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
 
     audio_pcm_init_info (&hw->info, &obt_as);
     hw->samples = audio_buffer_samples(
-        qapi_AudiodevPaPerDirectionOptions_base(ppdo),
-        &obt_as, ppdo->buffer_length);
+        qapi_AudiodevPaPerDirectionOptions_base(ppdo), &obt_as, 46440);
 
     return 0;
 
@@ -738,10 +736,6 @@ static void qpa_volume_in(HWVoiceIn *hw, Volume *vol)
 static int qpa_validate_per_direction_opts(Audiodev *dev,
                                            AudiodevPaPerDirectionOptions *pdo)
 {
-    if (!pdo->has_buffer_length) {
-        pdo->has_buffer_length = true;
-        pdo->buffer_length = 46440;
-    }
     if (!pdo->has_latency) {
         pdo->has_latency = true;
         pdo->latency = 15000;
-- 
2.29.2


