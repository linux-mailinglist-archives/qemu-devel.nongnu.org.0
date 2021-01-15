Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CFF2F7D67
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:57:43 +0100 (CET)
Received: from localhost ([::1]:54432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Pbi-0005YC-B5
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:57:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3M-00073N-Du
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3A-0003J5-8Y
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lijfuh4ogh+RJzDwIEQJkzCTtJubUXLmtHSgaBsd0Hk=;
 b=hNL3Vn2DY6RR4R9FjtvUZr0GcC1qwwaR8d2tUwX2Em2cpcGs7UvXU3nw/oZtc3uvcC1aqE
 LJ0CQ0cT5DkPcxWhUzOr2QWf/zaVOjo+dv4jBwhe6XcUfShyLpErIlbKPQ7iGpgozxnb0y
 Zs7iY3o+FH+A/C/2BqCxqPQGgiVIkQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-KpMkoVyROLeysWSSUmsR9g-1; Fri, 15 Jan 2021 08:21:55 -0500
X-MC-Unique: KpMkoVyROLeysWSSUmsR9g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C84A8030A3;
 Fri, 15 Jan 2021 13:21:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51F5F60BF3;
 Fri, 15 Jan 2021 13:21:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E1C851800D4C; Fri, 15 Jan 2021 14:21:46 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/30] paaudio: comment bugs in functions qpa_init_*
Date: Fri, 15 Jan 2021 14:21:33 +0100
Message-Id: <20210115132146.1443592-18-kraxel@redhat.com>
In-Reply-To: <20210115132146.1443592-1-kraxel@redhat.com>
References: <20210115132146.1443592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

The audio buffer size in audio/paaudio.c is typically larger
than expected. Just comment the bugs in qpa_init_in() and
qpa_init_out() for now. Fixing these bugs may break glitch free
audio playback with fine tuned user audio settings.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-id: 9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de
Message-Id: <20210110100239.27588-17-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/paaudio.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index 86038f3e1392..ff3dd01c96dd 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -538,6 +538,10 @@ static int qpa_init_out(HWVoiceOut *hw, struct audsettings *as,
     }
 
     audio_pcm_init_info (&hw->info, &obt_as);
+    /*
+     * This is wrong. hw->samples counts in frames. hw->samples will be
+     * number of channels times larger than expected.
+     */
     hw->samples = audio_buffer_samples(
         qapi_AudiodevPaPerDirectionOptions_base(ppdo), &obt_as, 46440);
 
@@ -585,6 +589,10 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
     }
 
     audio_pcm_init_info (&hw->info, &obt_as);
+    /*
+     * This is wrong. hw->samples counts in frames. hw->samples will be
+     * number of channels times larger than expected.
+     */
     hw->samples = audio_buffer_samples(
         qapi_AudiodevPaPerDirectionOptions_base(ppdo), &obt_as, 46440);
 
-- 
2.29.2


