Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8476AB6A0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 07:54:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ4jG-0007Ms-Sg; Mon, 06 Mar 2023 01:53:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4j5-00079c-A2
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:53:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4j2-0000eJ-OT
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:53:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678085615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bh6wdhO+WouvYQ/SQj4MSPyJuPYWqKs6U5t/o0h6ePY=;
 b=UdMNe6qGLerW93TStRmS9VxUy0uunisWd0DbQQfRiMByDTkPeiz2Opeex7lExVlvu0draN
 c03fdc5xeSVzHN/Ek9nV20iWZTAmtnLmkOVJFMXKE6QwSPJ3YEtsYM74WvJdvkfZr0kQ+5
 cvS55aU0X2nkOH7v7fZ2Kb61leohU2o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-ex4SeQXGNgSNL0IJDUJhJA-1; Mon, 06 Mar 2023 01:53:34 -0500
X-MC-Unique: ex4SeQXGNgSNL0IJDUJhJA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31B7A3828884;
 Mon,  6 Mar 2023 06:53:34 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F2BD492C14;
 Mon,  6 Mar 2023 06:53:33 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 20/27] audio: remove unused noop_conv() function
Date: Mon,  6 Mar 2023 10:51:55 +0400
Message-Id: <20230306065202.2160066-21-marcandre.lureau@redhat.com>
In-Reply-To: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
References: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Volker Rümelin <vr_qemu@t-online.de>

The function audio_capture_mix_and_clear() no longer uses
audio_pcm_sw_write() to resample audio frames from one internal
buffer to another. For this reason, the noop_conv() function is
now unused. Remove it.

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20230224190555.7409-8-vr_qemu@t-online.de>
---
 audio/audio.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 44eb7b63b4..556696b095 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -381,13 +381,6 @@ void audio_pcm_info_clear_buf (struct audio_pcm_info *info, void *buf, int len)
 /*
  * Capture
  */
-static void noop_conv (struct st_sample *dst, const void *src, int samples)
-{
-    (void) src;
-    (void) dst;
-    (void) samples;
-}
-
 static CaptureVoiceOut *audio_pcm_capture_find_specific(AudioState *s,
                                                         struct audsettings *as)
 {
@@ -485,7 +478,6 @@ static int audio_attach_capture (HWVoiceOut *hw)
         sw->info = hw->info;
         sw->empty = 1;
         sw->active = hw->enabled;
-        sw->conv = noop_conv;
         sw->ratio = ((int64_t) hw_cap->info.freq << 32) / sw->info.freq;
         sw->vol = nominal_volume;
         sw->rate = st_rate_start (sw->info.freq, hw_cap->info.freq);
-- 
2.39.2


