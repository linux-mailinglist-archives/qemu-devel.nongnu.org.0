Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B3A5525D9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 22:37:06 +0200 (CEST)
Received: from localhost ([::1]:37700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3O8v-0008VR-7E
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 16:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o3O1c-0002t9-Tk
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 16:29:33 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:56041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o3O1b-0000Lu-BT
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 16:29:32 -0400
Received: by mail-pj1-x1033.google.com with SMTP id w24so2820776pjg.5
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 13:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/31GHgPwc38/P7VhJ785CAYgmQ8Ze6Y5TLzEVb/KrKA=;
 b=SMPJ7rIe9XtcQ7nVBcY2Qk9tQAIpmCOc6I+IT8AdpsGkpuB83qhcBLp8WMhYaPo5Zb
 VjkQW6Hy9HZpzH50gxiHaiGZriUhteQFZ/Bbf45I9VAH++Zow7SLMlMBt4wEQ86dab/v
 56eYC1yewJT4rjFLP6oP7iMMK+WMNL5RNPJQYHauf9cyBa6/yigS7AglOAiQ2nF8gmv2
 u9MTdTC3KE/QVoGAWCfk8y4Yti9WcBOcDO4l6qjRVY52whBn0agPWrxO/pOzQMpQbxYE
 v2oBtuymXyJ5va1brAtKF5t5s/kDHAmXkQizFJij25oQdDF5Q4QyN9YisFFfDbmtJyDu
 etsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/31GHgPwc38/P7VhJ785CAYgmQ8Ze6Y5TLzEVb/KrKA=;
 b=kQdsMF3TYaBUUZmfH5/5A1GRJ1H5UGCP/CtNwcYqh7raLxqRSVg/HsVD76+vPQLpsr
 237AKrnnXwWhl0a/i6it95whoh9FEVP7WnhpJp6B3Ss2keatHiu1EqnGNJQvDY527AYk
 48UvLFuVB0u+be9dKXWCGS5ikooNjakTIgwpNCD/lsM24IpipVhG/eJQkakbvcpHvl98
 hTGPqbXEW20vrTZTjsJcVo2BXExXhBb4CQg6BH7LrZsjeb4q97FABWwXpqAyz4XIDG81
 kLV35XEFpM2l5/A0vCwXG0xihmu5fX7W8HiMH3Y/jUB2Kwe1bbptNAYUQoHcmUC3+N2w
 JNog==
X-Gm-Message-State: AJIora/G8gJN86Exg27t86CzQ6y/q0Iwel4+TW9ZciGook2CW2pPQ7UV
 KeT4x6TXrgR3j42vDty3PqI=
X-Google-Smtp-Source: AGRyM1t6X16GTKt6q5yt+0PcpoXLGlDQAKgmaI1MDrlrYAUDn8RPh+U6SdfCYZMYkdU0Holv8u0fMA==
X-Received: by 2002:a17:90b:4b82:b0:1e6:7853:c004 with SMTP id
 lr2-20020a17090b4b8200b001e67853c004mr39766769pjb.136.1655756969876; 
 Mon, 20 Jun 2022 13:29:29 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:650a:2825:1:f038])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a170902f78300b0016788487357sm9119947pln.132.2022.06.20.13.29.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Jun 2022 13:29:29 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v3] ui/cocoa: Take refresh rate into account
Date: Tue, 21 Jun 2022 05:29:21 +0900
Message-Id: <20220620202921.21062-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1033.google.com
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
dpy_set_ui_info() and update_displaychangelistener(), allowing the
guest and DisplayChangeListener to consume the information.

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


