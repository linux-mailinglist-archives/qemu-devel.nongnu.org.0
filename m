Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1CF54BCAF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 23:20:47 +0200 (CEST)
Received: from localhost ([::1]:53906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Dxt-0007K7-PD
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 17:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1DwY-0006ds-OL
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 17:19:22 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:54081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1DwX-0000eG-3C
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 17:19:22 -0400
Received: by mail-pj1-x102a.google.com with SMTP id a10so9530281pju.3
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 14:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b7zyL/AatFht9mQJtX8T9ULXvPB4VSYZWAfw8YivCf0=;
 b=bopvsu8sSAmRK1nmx+U7WZuIyn17ShtLcISttphtqQyhO7pRZDx3HVbwN40KR6GN4a
 hCzdNKfH53yTHMmHjZ2kgCqhsc0DbKzKD3LhuBD/ThxeQjjx6wOmnu4yD6TnEB3fbBpx
 RH9/iGCfPiA3hcnZJtYDpaC4SFw89QhDA9E7vvPgLo2FKWEwf+Em9UykZLeHM1MgbRE3
 011dp3m91dSyM03LN8xneTa46Q0sVFLQ6X03bWn7qr9BEwuKa5rqU4zNd5QAkVxgmsky
 QRUeDtZlPN/4FhYXLNdD8RzOV/8+/u8RAEigNVP5Ud4ACG/wAslTxAb5knhnlzTg4fA2
 ehKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b7zyL/AatFht9mQJtX8T9ULXvPB4VSYZWAfw8YivCf0=;
 b=4a3VOSvor2XIDDNGJ3I1mVJ12VoH5iypooIhqj+XQDsvK5ht7cWnm/CgVYkLGWHaik
 iPH2MqiexoSKag3yZ9eSYv91FDi7ZY/RN8nbrTN9CTo3iqTZdmKyikWsi1EFXTXBqLd7
 +pN6Lxv5N2OmB2GWk/QX23TW5juStt7bjhQ27lTcUKvcgnGuvHhjO3JD7VWei4wU7DJv
 Uev/715Kn7ReIbZ+icOYly3TZPhUutTDfNdofNLGGynFb/K+LLp4vXfbNWGITnErv/a/
 GaF8sxUo26fP6ERe8UZdsRoI75jhINZQeRlkvMmSHOYbBrHRttJkQNFt0dBHH3oCRW7S
 q9XQ==
X-Gm-Message-State: AOAM533wczRsZsWkja9Nt3l2BvupGi8oUCKHR7hnhNrSHlzeML7X8xbZ
 u5Fy8uWnm4GQLsFeH+btXVw=
X-Google-Smtp-Source: AGRyM1uyDQ7+WrlcA2rihM5/eYJY8bM4odO/0GNg1N20b3ibL+XRJnakYXPnHek8PGqS5RS7HjjdBg==
X-Received: by 2002:a17:903:2c2:b0:168:e323:d471 with SMTP id
 s2-20020a17090302c200b00168e323d471mr6025674plk.147.1655241559481; 
 Tue, 14 Jun 2022 14:19:19 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d5aa:1806:cce3:7773])
 by smtp.gmail.com with ESMTPSA id
 z6-20020aa791c6000000b0051bed79a5e6sm8297236pfa.90.2022.06.14.14.19.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Jun 2022 14:19:18 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH] ui/cocoa: Take refresh rate into account
Date: Wed, 15 Jun 2022 06:19:09 +0900
Message-Id: <20220614211909.94060-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 meson.build |  3 ++-
 ui/cocoa.m  | 12 ++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 0c2e11ff071..0f83f3730af 100644
--- a/meson.build
+++ b/meson.build
@@ -575,7 +575,8 @@ if get_option('attr').allowed()
   endif
 endif
 
-cocoa = dependency('appleframeworks', modules: 'Cocoa', required: get_option('cocoa'))
+cocoa = dependency('appleframeworks', modules: ['Cocoa', 'CoreVideo'],
+                   required: get_option('cocoa'))
 if cocoa.found() and get_option('sdl').enabled()
   error('Cocoa and SDL cannot be enabled at the same time')
 endif
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 84c84e98fc5..0000a3949c6 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -561,8 +561,20 @@ - (void) updateUIInfoLocked
         CGDirectDisplayID display = [[description objectForKey:@"NSScreenNumber"] unsignedIntValue];
         NSSize screenSize = [[[self window] screen] frame].size;
         CGSize screenPhysicalSize = CGDisplayScreenSize(display);
+        CVDisplayLinkRef displayLink;
 
         frameSize = isFullscreen ? screenSize : [self frame].size;
+
+        if (!CVDisplayLinkCreateWithCGDisplay(display, &displayLink)) {
+            CVTime period = CVDisplayLinkGetNominalOutputVideoRefreshPeriod(displayLink);
+            CVDisplayLinkRelease(displayLink);
+            if (!(period.flags & kCVTimeIsIndefinite)) {
+                update_displaychangelistener(&dcl,
+                                             1000 * period.timeValue / period.timeScale);
+                info.refresh_rate = (int64_t)1000 * period.timeScale / period.timeValue;
+            }
+        }
+
         info.width_mm = frameSize.width / screenSize.width * screenPhysicalSize.width;
         info.height_mm = frameSize.height / screenSize.height * screenPhysicalSize.height;
     } else {
-- 
2.32.1 (Apple Git-133)


