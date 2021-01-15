Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A00CA2F7CB4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:33:36 +0100 (CET)
Received: from localhost ([::1]:37388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PEN-0008A5-Lm
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:33:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3M-00074E-NF
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3A-0003JG-76
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0LBA83OsZdc5NiYe4eEtS2i8fh03LsyFVlbEeRAvgyM=;
 b=IOC+fi0KRCBRqwS+jDRVzkdXrDr7OjdA4C3wGC5DfHpHEwsezs76QUUTu5xXaTAbOZIXx8
 jft25XeFTnD3dAZOWVUftOgoyeK0eFIFAMc8xNu/8w1YxM6/3g8S98Af147aNjzYf/17EK
 zrLuYGg7YqXjrmCRH+jjgmX7/ie4YfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-10kBzmYTPtSz1VTraCGoIQ-1; Fri, 15 Jan 2021 08:21:56 -0500
X-MC-Unique: 10kBzmYTPtSz1VTraCGoIQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC2E9CE649;
 Fri, 15 Jan 2021 13:21:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90DA01975E;
 Fri, 15 Jan 2021 13:21:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 188EB1800D50; Fri, 15 Jan 2021 14:21:47 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/30] dsoundaudio: rename dsound_open()
Date: Fri, 15 Jan 2021 14:21:37 +0100
Message-Id: <20210115132146.1443592-22-kraxel@redhat.com>
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

Rename dsound_open() to dsound_set_cooperative_level(). The
only task of that function is to set the cooperative level for
DirectSound.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-id: 9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de
Message-Id: <20210110100239.27588-21-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/dsoundaudio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/audio/dsoundaudio.c b/audio/dsoundaudio.c
index 0fbdf770ac75..d3695f3af653 100644
--- a/audio/dsoundaudio.c
+++ b/audio/dsoundaudio.c
@@ -342,7 +342,7 @@ static void dsound_clear_sample (HWVoiceOut *hw, LPDIRECTSOUNDBUFFER dsb,
     dsound_unlock_out (dsb, p1, p2, blen1, blen2);
 }
 
-static int dsound_open (dsound *s)
+static int dsound_set_cooperative_level(dsound *s)
 {
     HRESULT hr;
     HWND hwnd;
@@ -673,7 +673,7 @@ static void *dsound_audio_init(Audiodev *dev)
         }
     }
 
-    err = dsound_open (s);
+    err = dsound_set_cooperative_level(s);
     if (err) {
         dsound_audio_fini (s);
         return NULL;
-- 
2.29.2


