Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE182F7CC3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:35:38 +0100 (CET)
Received: from localhost ([::1]:43366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PGL-0002Fv-I8
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:35:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3C-0006nT-2j
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P36-0003Ib-1v
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ech2SUjyUk80bT9CYIHII+RZubdosfd6kXATCvqsEz4=;
 b=ZfjOT61OSdvZvPtWYOO0vv2eW+DzR3Mwxv3RZxdBHNefm8Ch2Zw4x9vB2xFOa9R3pGb2jQ
 iGj6nQ9AIBXDR0mjvEbs7yd/RwEjgH0z3xEywAYaC1eIkFc6r2340uEHP0Xgm8Rphfuc3Y
 C2Dij1r9qfRNjGG0ie5lt5KaG4EhvmY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-ilsPyvVwMC6nocGoqhHzqA-1; Fri, 15 Jan 2021 08:21:51 -0500
X-MC-Unique: ilsPyvVwMC6nocGoqhHzqA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC2E7806660;
 Fri, 15 Jan 2021 13:21:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99CB96F7EA;
 Fri, 15 Jan 2021 13:21:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2125B1800607; Fri, 15 Jan 2021 14:21:46 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/30] sdlaudio: remove leftover SDL1.2 code
Date: Fri, 15 Jan 2021 14:21:17 +0100
Message-Id: <20210115132146.1443592-2-kraxel@redhat.com>
In-Reply-To: <20210115132146.1443592-1-kraxel@redhat.com>
References: <20210115132146.1443592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-id: 9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de
Message-Id: <20210110100239.27588-1-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/sdlaudio.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index 21b7a0484bec..bf3cfb845616 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -240,28 +240,24 @@ static void sdl_callback (void *opaque, Uint8 *buf, int len)
     }
 }
 
-#define SDL_WRAPPER_FUNC(name, ret_type, args_decl, args, fail, unlock) \
-    static ret_type glue(sdl_, name)args_decl                           \
-    {                                                                   \
-        ret_type ret;                                                   \
-                                                                        \
-        SDL_LockAudio();                                                \
-                                                                        \
-        ret = glue(audio_generic_, name)args;                           \
-                                                                        \
-        SDL_UnlockAudio();                                              \
-        return ret;                                                     \
+#define SDL_WRAPPER_FUNC(name, ret_type, args_decl, args)      \
+    static ret_type glue(sdl_, name)args_decl                  \
+    {                                                          \
+        ret_type ret;                                          \
+                                                               \
+        SDL_LockAudio();                                       \
+        ret = glue(audio_generic_, name)args;                  \
+        SDL_UnlockAudio();                                     \
+                                                               \
+        return ret;                                            \
     }
 
 SDL_WRAPPER_FUNC(get_buffer_out, void *, (HWVoiceOut *hw, size_t *size),
-                 (hw, size), *size = 0, sdl_unlock)
+                 (hw, size))
 SDL_WRAPPER_FUNC(put_buffer_out, size_t,
-                 (HWVoiceOut *hw, void *buf, size_t size), (hw, buf, size),
-                 /*nothing*/, sdl_unlock_and_post)
+                 (HWVoiceOut *hw, void *buf, size_t size), (hw, buf, size))
 SDL_WRAPPER_FUNC(write, size_t,
-                 (HWVoiceOut *hw, void *buf, size_t size), (hw, buf, size),
-                 /*nothing*/, sdl_unlock_and_post)
-
+                 (HWVoiceOut *hw, void *buf, size_t size), (hw, buf, size))
 #undef SDL_WRAPPER_FUNC
 
 static void sdl_fini_out (HWVoiceOut *hw)
-- 
2.29.2


