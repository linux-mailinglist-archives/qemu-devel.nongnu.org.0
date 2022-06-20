Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6866C55225A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 18:35:34 +0200 (CEST)
Received: from localhost ([::1]:54094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3KNB-00023N-3i
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 12:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o3KGV-00009I-D2
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:28:39 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:40849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o3KGS-0005Xp-VV
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:28:39 -0400
Received: by mail-pl1-x62d.google.com with SMTP id k7so10197139plg.7
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 09:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C1ikJSSx6wxnf9SUIb7UnDNbdrrrk7MCfII3HEq0LWw=;
 b=Zr912ZX0bZuE8rmMAnTy+C1+i075i6Oiv55tAPNXXEUzNXxlTAzv7MEIw029OZIfBs
 zsq1aySZetnxLrFvl9FZLP/3/vfYKEuvMuFrgPyHWdl3h9DgeENAwjG4hQ5vc6rVizuY
 wa+yEEp8as9ArMaYch8qEJAY0CohFPyxKQLyXeT5yYWhya7TvSBB7yKVsY5CkMQxEtH/
 X7frHdPYOkTleVXsB9uD7v9sDMrEl1lqE9zNXyha8r1rpIgkC/m5ki7pGe+XUWboArq8
 +HTRINZ3BEpnCfoJUcmubzndmpiAxadUt7B4CWayBXa/ANw1OvSqwVfIfOaScYEknIAa
 AAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C1ikJSSx6wxnf9SUIb7UnDNbdrrrk7MCfII3HEq0LWw=;
 b=A/BT674nYXBOjyZt01Hxyv4RRPywVzUjohkvxw/tf/r8jJUXlZoINfxGbYj0SjZvYZ
 2epZdrSBmV1+7QDgy0WlyJzDiNQAwAQJfs/EiLPShOQQjTTUy07aKR/cFvDkZGqGsa8O
 5G018c+jZGGugAXfBMmIYT5R9vRc76hIiflwyCPZ8ocvq7+b/kq75C/eX2zhKjT1Yzgd
 xEoDZ+LrjO8hJxW2agGQm06oHTsPzWRWBf3EiRIp7X1gedTn5mFNy3pPp2gB2P9CLgYP
 brkIh0TUoK3iGOYFWSqP+xfQSZs/HyNE12p2sH3y2qiBoLxHY/zTbDzq9GRRsnDwzxMw
 55pQ==
X-Gm-Message-State: AJIora9FEodxCc6ya/azEebDtmoATRhYceNGJlUWe0ONnyYVO8xH000/
 dVkKXgkFrrhPgbaS4WrH6RS7GlUvTPo=
X-Google-Smtp-Source: AGRyM1slC/tob0yErgBcXyj9kRxc13yjJ6fBGUV3W1LIUNbs3sVVSbM9cfuq52NwzXWOw6A037/dHw==
X-Received: by 2002:a17:902:d58d:b0:16a:1aaa:bfad with SMTP id
 k13-20020a170902d58d00b0016a1aaabfadmr9407242plh.24.1655742514912; 
 Mon, 20 Jun 2022 09:28:34 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:650a:2825:1:f038])
 by smtp.gmail.com with ESMTPSA id
 c127-20020a624e85000000b0050dc76281f0sm9188223pfb.202.2022.06.20.09.28.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Jun 2022 09:28:33 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v2] ui/cocoa: Take refresh rate into account
Date: Tue, 21 Jun 2022 01:28:25 +0900
Message-Id: <20220620162825.19977-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62d.google.com
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

Retreieve the refresh rate of the display and reflect it with
dpy_set_ui_info() and update_displaychangelistener().

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


