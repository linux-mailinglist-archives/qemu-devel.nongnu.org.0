Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3283754FC
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 15:43:01 +0200 (CEST)
Received: from localhost ([::1]:33104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leeHM-0003yt-8j
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 09:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leeCg-0006jg-6Q
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:38:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leeCe-0007eG-LG
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:38:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620308288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/bdOhY3sBOcIHJeoCe6CkJ1QfZvAaT12hvfPxmFulM0=;
 b=diAk3LMOlfbES4tV7FjKNoalRYDIzxql+fuvw50YYXcjrxxjmW98+zMC6uRAF5HQrsAU7U
 X1MzwlvgmJLId0zYbCZutsDUbsq7JH3SjRoBb3iSDlRZljwSgcpEUpuuV/CUbXl3uJW9Ms
 gyNv0PZMEjVVs+XkW90LB4grNr5xT/4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-WcTK1gb8P8uVtBlkp6njpw-1; Thu, 06 May 2021 09:38:06 -0400
X-MC-Unique: WcTK1gb8P8uVtBlkp6njpw-1
Received: by mail-wm1-f69.google.com with SMTP id
 s66-20020a1ca9450000b0290149fce15f03so2675155wme.9
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 06:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/bdOhY3sBOcIHJeoCe6CkJ1QfZvAaT12hvfPxmFulM0=;
 b=oDFI+sNziKos2ieYMOurQf0q8qtlcZpYrPz7ktnSpc461hN980EKIIVNMFE/LWWI0S
 ux1VdeBhKG+E8lW1rTqAehkGP+mfs/AA1KSGgbFQrxo+WWojB5AT4cuy77R7Qmm8NBgV
 xHywu0DuwlXQkxF9XRqbGveRk1557kAgu4pAMC3wNMZd8yxlmdJ2rZhaBBD5Yh7tqtFM
 Diq1PLq4nCpeGBfZ9byklSPJwU9uTTI3gcWrN7ZzfxnBTxkLLMI+5JoyKooavBexKmn6
 RX+1yAV6I+PHQ34TjBFcpjAUr72SowfMUfaUvZez8GopW1eWKg+dV9o2tcwnHHHgti5y
 sKAA==
X-Gm-Message-State: AOAM531ZFu20sUmiNsrZMSZ9orTZ+PY6d/KDzwUIO4pgF24KefSnWjLw
 3EgozNR9Z0v4W6lymcii4zB3eRoNTeT2rg8h4Fv5JntGfPbaxA+HP7AUd8WmdWdK8e5+dcu3QFC
 Ic17SCYnfQXNJyIPcfHCV4RY+/2r3q8hQqZorzgFuwBzNfQZ4dSf6TkQ4WmTFi3JJ
X-Received: by 2002:a1c:1bc9:: with SMTP id b192mr15231220wmb.3.1620308285237; 
 Thu, 06 May 2021 06:38:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaU39xWPKmAxzTDnRmk4BpB3yHtP51ZUdmNXUtU3rYDqeE9UGHa8wm/T1yoDDa+r7xsmcCLw==
X-Received: by 2002:a1c:1bc9:: with SMTP id b192mr15231189wmb.3.1620308284991; 
 Thu, 06 May 2021 06:38:04 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id o17sm4231200wrs.48.2021.05.06.06.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 06:38:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/9] audio/alsaaudio: Replace ALSA alloca() by malloc()
 equivalent
Date: Thu,  6 May 2021 15:37:50 +0200
Message-Id: <20210506133758.1749233-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210506133758.1749233-1-philmd@redhat.com>
References: <20210506133758.1749233-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
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


