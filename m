Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A12013AB44E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 15:08:40 +0200 (CEST)
Received: from localhost ([::1]:44058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrl9-00079n-Ni
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 09:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltrKp-0008AJ-0C
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:41:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltrKn-0007qB-7G
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:41:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623933684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ZKzF45+727kt8OSP71o2D3f16M6AIfBGgonwO7kikk=;
 b=Iai97Wxm0AyFw/JNTnvwa/F5+tO2zOJff6RMFnN1aLbvTYLLUGlip167LcPA6idyrhWMzA
 M7SfEb+1hE7cxB67ZVNa6mIRzcYCOxoFFVfIJTBedZc7wevHaJ6Q8COHt9A6fPjd4S7elg
 H6lfUx+wGe2Hin24utGqGND6aj9+8N4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-QqMco7j1MvCPxe0zK_ChkA-1; Thu, 17 Jun 2021 08:41:23 -0400
X-MC-Unique: QqMco7j1MvCPxe0zK_ChkA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1903F80ED9B;
 Thu, 17 Jun 2021 12:41:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADDAC5C22A;
 Thu, 17 Jun 2021 12:41:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C033E18017C9; Thu, 17 Jun 2021 14:41:07 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] paaudio: remove unused stream flags
Date: Thu, 17 Jun 2021 14:41:02 +0200
Message-Id: <20210617124107.2386073-3-kraxel@redhat.com>
In-Reply-To: <20210617124107.2386073-1-kraxel@redhat.com>
References: <20210617124107.2386073-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

In current code there are no calls to pa_stream_get_latency()
or pa_stream_get_time() to receive latency or time information.

Remove the flags PA_STREAM_INTERPOLATE_TIMING and
PA_STREAM_AUTO_TIMING_UPDATE which instruct PulseAudio to
calculate this information in regular intervals.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20210517194604.2545-2-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/paaudio.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index c97b22e970d8..14b4269c5500 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -463,10 +463,7 @@ static pa_stream *qpa_simple_new (
 
     pa_stream_set_state_callback(stream, stream_state_cb, c);
 
-    flags =
-        PA_STREAM_INTERPOLATE_TIMING
-        | PA_STREAM_AUTO_TIMING_UPDATE
-        | PA_STREAM_EARLY_REQUESTS;
+    flags = PA_STREAM_EARLY_REQUESTS;
 
     if (dev) {
         /* don't move the stream if the user specified a sink/source */
-- 
2.31.1


