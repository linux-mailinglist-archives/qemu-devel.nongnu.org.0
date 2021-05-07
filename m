Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 713C9376750
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 16:56:58 +0200 (CEST)
Received: from localhost ([::1]:38630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf1uT-0003pz-FV
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 10:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1i9-0007s7-7a
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:44:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1i5-0000oT-2w
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620398648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/bdOhY3sBOcIHJeoCe6CkJ1QfZvAaT12hvfPxmFulM0=;
 b=RBmkarIQePHLIY2cHeYblK3Le+SfkAv/DMlfnWz3Z80p4bfKAtHk9C0ErRYKaZyZ8YGo0F
 FpmJVndZIkwN0Rd9LgDGpBsUoNqJ4lFKq8Ziv3sH+snifJQh7Qf9rULgip1liuMTEgsBQh
 qExhO4BWsLQaKm/GOMqSghWN4Tsa720=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-o28EOKUwOAOyS25y7haaPw-1; Fri, 07 May 2021 10:44:07 -0400
X-MC-Unique: o28EOKUwOAOyS25y7haaPw-1
Received: by mail-wm1-f70.google.com with SMTP id
 t7-20020a1cc3070000b029014131bbe82eso3990978wmf.3
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 07:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/bdOhY3sBOcIHJeoCe6CkJ1QfZvAaT12hvfPxmFulM0=;
 b=afM9w84B+3xaTKnbZ1rXmh8/zNA2byYuWJUqD6LNfcnhi00rRlHhKpOBrWAtE89wIT
 7rLj9Dwc1ma169biXKtV7OlB9Wc+j3Cv6rCe0sNjVdtD7btY2zqhGUwtoCknO+vcq1I/
 rvpNKWpFLXutKpx9Exi1+ZdKVNuJrhXB7IL6m6T7hydqIfcdMNKl3kpF5Pa/990raqkX
 DMZU4bRXHEkm4qcGk7qU2kn5mmUNSgqXq/q9WAPWXCHyHvu7d8/x/JIfzURIzmF6boZo
 64yeEM7jDfeYyc5fx4AzRxK8QukOZEwqXfAvt6vbHKdKqTS2GaZRiZwgXMKOBp9gCK3f
 Cmyg==
X-Gm-Message-State: AOAM530HZyc52FOuZydekbi0z6IFhUg47quHReZZrA8CaB1GaQgPmH4A
 cXbEJ/xmJiRKY8/aNO3oZwuYVdBTGzSdN1nUgOdN+oghu97/sb3nIZMxQYCVAV3moWCClt/QpWq
 obvHshjc3HXlKmZRGW+i5xPrsHvfxu21Y7t3zFDmLTg/v2O/B5UqU6J3QoYqDhyZn
X-Received: by 2002:a5d:4a51:: with SMTP id v17mr9368909wrs.259.1620398645592; 
 Fri, 07 May 2021 07:44:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAGBqHXqPnxWmUTdUgr41RWwEb2R01PCsDEiapDu7vy61qLy24zEvVbo/zgUT9ufemsXGN8A==
X-Received: by 2002:a5d:4a51:: with SMTP id v17mr9368879wrs.259.1620398645319; 
 Fri, 07 May 2021 07:44:05 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id r5sm7924414wmh.23.2021.05.07.07.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 07:44:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/17] audio/alsaaudio: Replace ALSA alloca() by malloc()
 equivalent
Date: Fri,  7 May 2021 16:43:08 +0200
Message-Id: <20210507144315.1994337-11-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210507144315.1994337-1-philmd@redhat.com>
References: <20210507144315.1994337-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ALLOCA(3) man-page mentions its "use is discouraged".

Define the cleanup functions for the snd_pcm_[hw/sw]_params_t types,
and replace the ALSA alloca() calls by equivalent ALSA malloc().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 audio/alsaaudio.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index fcc2f62864f..f39061ebc42 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -70,6 +70,9 @@ struct alsa_params_obt {
     snd_pcm_uframes_t samples;
 };
 
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(snd_pcm_hw_params_t, snd_pcm_hw_params_free)
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(snd_pcm_sw_params_t, snd_pcm_sw_params_free)
+
 static void GCC_FMT_ATTR (2, 3) alsa_logerr (int err, const char *fmt, ...)
 {
     va_list ap;
@@ -410,9 +413,9 @@ static void alsa_dump_info (struct alsa_params_req *req,
 static void alsa_set_threshold (snd_pcm_t *handle, snd_pcm_uframes_t threshold)
 {
     int err;
-    snd_pcm_sw_params_t *sw_params;
+    g_autoptr(snd_pcm_sw_params_t) sw_params = NULL;
 
-    snd_pcm_sw_params_alloca (&sw_params);
+    snd_pcm_sw_params_malloc(&sw_params);
 
     err = snd_pcm_sw_params_current (handle, sw_params);
     if (err < 0) {
@@ -444,7 +447,7 @@ static int alsa_open(bool in, struct alsa_params_req *req,
     AudiodevAlsaOptions *aopts = &dev->u.alsa;
     AudiodevAlsaPerDirectionOptions *apdo = in ? aopts->in : aopts->out;
     snd_pcm_t *handle;
-    snd_pcm_hw_params_t *hw_params;
+    g_autoptr(snd_pcm_hw_params_t) hw_params = NULL;
     int err;
     unsigned int freq, nchannels;
     const char *pcm_name = apdo->has_dev ? apdo->dev : "default";
@@ -455,7 +458,7 @@ static int alsa_open(bool in, struct alsa_params_req *req,
     freq = req->freq;
     nchannels = req->nchannels;
 
-    snd_pcm_hw_params_alloca (&hw_params);
+    snd_pcm_hw_params_malloc(&hw_params);
 
     err = snd_pcm_open (
         &handle,
-- 
2.26.3


