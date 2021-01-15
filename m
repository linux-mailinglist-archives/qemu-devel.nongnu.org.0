Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD982F7D10
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:47:53 +0100 (CET)
Received: from localhost ([::1]:50606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PSD-0000K2-1x
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:47:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3h-0007Ea-Lh
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3C-0003Lh-Qw
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yh7FnvFpRcEKg5rTGuSDzqs3YMIZFvsDfSQ26RdYsUM=;
 b=X4OkpcYv4SUSRdarc2AAYlMQNVKBCtqCWhpVlxeQOq4aHhRP54lkkbtZYIZa7PAS0xlGdg
 T1Ytudt4dpGORP3fWb56yqH28GiPx1SjFr5Mkkjm5s+RsDIWeYyWdaPtyvljKAVQtugnq5
 pZv/DOgR64rO66E3QSPtkzEhuVyzssI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-YhQlRL_GNKCVhKPcbUWSFA-1; Fri, 15 Jan 2021 08:21:58 -0500
X-MC-Unique: YhQlRL_GNKCVhKPcbUWSFA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E48D7100F341;
 Fri, 15 Jan 2021 13:21:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A873B6F80A;
 Fri, 15 Jan 2021 13:21:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5C3511800D55; Fri, 15 Jan 2021 14:21:47 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/30] audio: foo* bar" should be "foo *bar".
Date: Fri, 15 Jan 2021 14:21:42 +0100
Message-Id: <20210115132146.1443592-27-kraxel@redhat.com>
In-Reply-To: <20210115132146.1443592-1-kraxel@redhat.com>
References: <20210115132146.1443592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Zhang Han <zhanghan64@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Han <zhanghan64@huawei.com>

transfer "foo* " to "foo *"

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
Message-id: 20210115012431.79533-1-zhanghan64@huawei.com
Message-Id: <20210115012431.79533-4-zhanghan64@huawei.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/coreaudio.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index 6ca0d79c1f5e..b7c02e0e516d 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -421,12 +421,12 @@ COREAUDIO_WRAPPER_FUNC(write, size_t, (HWVoiceOut *hw, void *buf, size_t size),
 /* callback to feed audiooutput buffer */
 static OSStatus audioDeviceIOProc(
     AudioDeviceID inDevice,
-    const AudioTimeStamp* inNow,
-    const AudioBufferList* inInputData,
-    const AudioTimeStamp* inInputTime,
-    AudioBufferList* outOutputData,
-    const AudioTimeStamp* inOutputTime,
-    void* hwptr)
+    const AudioTimeStamp *inNow,
+    const AudioBufferList *inInputData,
+    const AudioTimeStamp *inInputTime,
+    AudioBufferList *outOutputData,
+    const AudioTimeStamp *inOutputTime,
+    void *hwptr)
 {
     UInt32 frameCount, pending_frames;
     void *out = outOutputData->mBuffers[0].mData;
-- 
2.29.2


