Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114362DAE45
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 14:50:29 +0100 (CET)
Received: from localhost ([::1]:56542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpAig-00010s-0W
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 08:50:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kpAgt-0008F3-C3
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 08:48:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kpAgr-0007FB-3B
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 08:48:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608040110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fI+QQ7FwNszPqBHjqQsEhWeJnnkFBxwInWIoU5Mf4/E=;
 b=PAUttBSFE/AxIJ8pSq6FygBpYdM39YZHGUjwxoEo+19JsPvykq9uPNcJCw3631te8nDkwM
 kdSyUE5DZ+HdQLNxnNLbf95jSol7u3keQMmmCsehIQRC5bgwHj0+vIznq63A4vfgml8zqL
 9B9pl7UYhiyRKIgx5BdoChbYR/G2Dcg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-n3GZ-jdRN0KAJN7ksUV5QQ-1; Tue, 15 Dec 2020 08:48:28 -0500
X-MC-Unique: n3GZ-jdRN0KAJN7ksUV5QQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1BA5801B14;
 Tue, 15 Dec 2020 13:48:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7517419C44;
 Tue, 15 Dec 2020 13:48:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8A1AAA1EE; Tue, 15 Dec 2020 14:48:26 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] coreaudio: rename misnamed variable fake_as
Date: Tue, 15 Dec 2020 14:48:20 +0100
Message-Id: <20201215134826.5504-2-kraxel@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

While the variable once was used to fake audio settings, since
commit ed2a4a7941 "audio: proper support for float samples in
mixeng" this is no longer true. Rename the variable to obt_as.
This is the same naming scheme as in audio/sdlaudio.c

Tested-by: Howard Spoelstra <hsp.cat7@gmail.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-id: 20201213130528.5863-1-vr_qemu@t-online.de
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/coreaudio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index 4b4365660fcf..0ee85052c452 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -482,7 +482,7 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
     Audiodev *dev = drv_opaque;
     AudiodevCoreaudioPerDirectionOptions *cpdo = dev->u.coreaudio.out;
     int frames;
-    struct audsettings fake_as;
+    struct audsettings obt_as;
 
     /* create mutex */
     err = pthread_mutex_init(&core->mutex, NULL);
@@ -491,8 +491,8 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
         return -1;
     }
 
-    fake_as = *as;
-    as = &fake_as;
+    obt_as = *as;
+    as = &obt_as;
     as->fmt = AUDIO_FORMAT_F32;
     audio_pcm_init_info (&hw->info, as);
 
-- 
2.27.0


