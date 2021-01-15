Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0087E2F7DD3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:13:29 +0100 (CET)
Received: from localhost ([::1]:40454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Pqy-0006ub-2H
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:13:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3h-0007Ec-MO
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3B-0003Kj-Pl
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EpOOK1CspKZO58htbzpQyU23REswRuLr7U08A9xXOzU=;
 b=b4ZiwQfYsEyQBl6ji4HJBpaCInlkq5Ilj6cVIGIVwutld1dYM26VDcyjGJYTeeWmPX+9Lj
 Gf6kMVpbAG4a4xOca/pSk0BqSDL127a9izr7YnJ4tMQyfjJCEzzEIDBxJJ/xgLE9wV0SXM
 t19U93obX5y4LPs6KL1P8aX46phw8w4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-UFS7yLOqOluFg_Hku6EczA-1; Fri, 15 Jan 2021 08:21:59 -0500
X-MC-Unique: UFS7yLOqOluFg_Hku6EczA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F20F0806660;
 Fri, 15 Jan 2021 13:21:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B277163746;
 Fri, 15 Jan 2021 13:21:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 51CBD1800D54; Fri, 15 Jan 2021 14:21:47 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/30] audio: Add spaces around operator/delete redundant spaces
Date: Fri, 15 Jan 2021 14:21:41 +0100
Message-Id: <20210115132146.1443592-26-kraxel@redhat.com>
In-Reply-To: <20210115132146.1443592-1-kraxel@redhat.com>
References: <20210115132146.1443592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Zhang Han <zhanghan64@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Han <zhanghan64@huawei.com>

Fix problems about spaces:
-operator needs spaces around it, add them.
-somespaces are redundant, remove them.

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210115012431.79533-1-zhanghan64@huawei.com
Message-Id: <20210115012431.79533-3-zhanghan64@huawei.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio_template.h | 2 +-
 audio/coreaudio.c      | 2 +-
 audio/dsoundaudio.c    | 2 +-
 audio/jackaudio.c      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/audio/audio_template.h b/audio/audio_template.h
index f77210e40435..f82593bb8db2 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -208,7 +208,7 @@ static void glue (audio_pcm_hw_gc_, TYPE) (HW **hwp)
         QLIST_REMOVE (hw, entries);
         glue (hw->pcm_ops->fini_, TYPE) (hw);
         glue (s->nb_hw_voices_, TYPE) += 1;
-        glue (audio_pcm_hw_free_resources_ ,TYPE) (hw);
+        glue (audio_pcm_hw_free_resources_ , TYPE) (hw);
         g_free (hw);
         *hwp = NULL;
     }
diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index 408b5871261c..6ca0d79c1f5e 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -270,7 +270,7 @@ static void coreaudio_logstatus (OSStatus status)
 {
     const char *str = "BUG";
 
-    switch(status) {
+    switch (status) {
     case kAudioHardwareNoError:
         str = "kAudioHardwareNoError";
         break;
diff --git a/audio/dsoundaudio.c b/audio/dsoundaudio.c
index e59bd83dc717..21c2891772de 100644
--- a/audio/dsoundaudio.c
+++ b/audio/dsoundaudio.c
@@ -133,7 +133,7 @@ static void dsound_log_hresult (HRESULT hr)
         break;
 #endif
 #ifdef DSERR_GENERIC
-    case DSERR_GENERIC :
+    case DSERR_GENERIC:
         str = "An undetermined error occurred inside the DirectSound subsystem";
         break;
 #endif
diff --git a/audio/jackaudio.c b/audio/jackaudio.c
index f8afb5cc318c..3031c4e29bd4 100644
--- a/audio/jackaudio.c
+++ b/audio/jackaudio.c
@@ -277,7 +277,7 @@ static int qjack_process(jack_nframes_t nframes, void *arg)
         if (likely(c->enabled)) {
             qjack_buffer_read_l(&c->fifo, buffers, nframes);
         } else {
-            for(int i = 0; i < c->nchannels; ++i) {
+            for (int i = 0; i < c->nchannels; ++i) {
                 memset(buffers[i], 0, nframes * sizeof(float));
             }
         }
-- 
2.29.2


