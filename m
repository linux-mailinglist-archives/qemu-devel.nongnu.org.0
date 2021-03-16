Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F7133D22C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 11:51:11 +0100 (CET)
Received: from localhost ([::1]:56376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM7I6-0004wL-Gq
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 06:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM7F1-0001Vx-RA
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:47:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM7Ey-00008T-Rw
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:47:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615891676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ymyrr+jeHk2GXb54WOBG62It1gs6WqwaBFik8eJiS9Y=;
 b=ec/c9dxPoFgPmo/NFjBGeb4mXGnO0BfEMBYAoE5ReNn4B+9zLqs9MkrFR1Fu096f9w8VSn
 7eKkMMc23k6Oph06FtdISb4qNCWElcA8+jKfylJM7XdHYoXWAqIDtX4bvJnwoKvRJxguo7
 IGRgqNJTzfLqxrSlWhPzurdqlix20Gg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-8UludegKMjS4xrGGMrmDsA-1; Tue, 16 Mar 2021 06:47:52 -0400
X-MC-Unique: 8UludegKMjS4xrGGMrmDsA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA144801817;
 Tue, 16 Mar 2021 10:47:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89C6950F1A;
 Tue, 16 Mar 2021 10:47:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6ADFB1800617; Tue, 16 Mar 2021 11:47:45 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] coreaudio: Drop support for macOS older than 10.6
Date: Tue, 16 Mar 2021 11:47:43 +0100
Message-Id: <20210316104745.2196286-2-kraxel@redhat.com>
In-Reply-To: <20210316104745.2196286-1-kraxel@redhat.com>
References: <20210316104745.2196286-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Mac OS X 10.6 was released in 2009.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210311151512.22096-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/coreaudio.c | 103 ----------------------------------------------
 1 file changed, 103 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index b7c02e0e516d..c5f0b615d643 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -32,10 +32,6 @@
 #define AUDIO_CAP "coreaudio"
 #include "audio_int.h"
 
-#ifndef MAC_OS_X_VERSION_10_6
-#define MAC_OS_X_VERSION_10_6 1060
-#endif
-
 typedef struct coreaudioVoiceOut {
     HWVoiceOut hw;
     pthread_mutex_t mutex;
@@ -45,9 +41,6 @@ typedef struct coreaudioVoiceOut {
     AudioDeviceIOProcID ioprocid;
 } coreaudioVoiceOut;
 
-#if MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_6
-/* The APIs used here only become available from 10.6 */
-
 static OSStatus coreaudio_get_voice(AudioDeviceID *id)
 {
     UInt32 size = sizeof(*id);
@@ -169,102 +162,6 @@ static OSStatus coreaudio_get_isrunning(AudioDeviceID id, UInt32 *result)
                                       &size,
                                       result);
 }
-#else
-/* Legacy versions of functions using deprecated APIs */
-
-static OSStatus coreaudio_get_voice(AudioDeviceID *id)
-{
-    UInt32 size = sizeof(*id);
-
-    return AudioHardwareGetProperty(
-        kAudioHardwarePropertyDefaultOutputDevice,
-        &size,
-        id);
-}
-
-static OSStatus coreaudio_get_framesizerange(AudioDeviceID id,
-                                             AudioValueRange *framerange)
-{
-    UInt32 size = sizeof(*framerange);
-
-    return AudioDeviceGetProperty(
-        id,
-        0,
-        0,
-        kAudioDevicePropertyBufferFrameSizeRange,
-        &size,
-        framerange);
-}
-
-static OSStatus coreaudio_get_framesize(AudioDeviceID id, UInt32 *framesize)
-{
-    UInt32 size = sizeof(*framesize);
-
-    return AudioDeviceGetProperty(
-        id,
-        0,
-        false,
-        kAudioDevicePropertyBufferFrameSize,
-        &size,
-        framesize);
-}
-
-static OSStatus coreaudio_set_framesize(AudioDeviceID id, UInt32 *framesize)
-{
-    UInt32 size = sizeof(*framesize);
-
-    return AudioDeviceSetProperty(
-        id,
-        NULL,
-        0,
-        false,
-        kAudioDevicePropertyBufferFrameSize,
-        size,
-        framesize);
-}
-
-static OSStatus coreaudio_get_streamformat(AudioDeviceID id,
-                                           AudioStreamBasicDescription *d)
-{
-    UInt32 size = sizeof(*d);
-
-    return AudioDeviceGetProperty(
-        id,
-        0,
-        false,
-        kAudioDevicePropertyStreamFormat,
-        &size,
-        d);
-}
-
-static OSStatus coreaudio_set_streamformat(AudioDeviceID id,
-                                           AudioStreamBasicDescription *d)
-{
-    UInt32 size = sizeof(*d);
-
-    return AudioDeviceSetProperty(
-        id,
-        0,
-        0,
-        0,
-        kAudioDevicePropertyStreamFormat,
-        size,
-        d);
-}
-
-static OSStatus coreaudio_get_isrunning(AudioDeviceID id, UInt32 *result)
-{
-    UInt32 size = sizeof(*result);
-
-    return AudioDeviceGetProperty(
-        id,
-        0,
-        0,
-        kAudioDevicePropertyDeviceIsRunning,
-        &size,
-        result);
-}
-#endif
 
 static void coreaudio_logstatus (OSStatus status)
 {
-- 
2.30.2


