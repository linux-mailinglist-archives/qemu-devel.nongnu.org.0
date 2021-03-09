Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E40033325EF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:59:24 +0100 (CET)
Received: from localhost ([::1]:60390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbxL-0001A7-TS
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:59:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJbNq-0007VI-50
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 07:22:42 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:54345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJbNo-0004bj-Da
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 07:22:41 -0500
Received: by mail-pj1-x1031.google.com with SMTP id i14so805708pjz.4
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 04:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0HHs9kfrDykWDzCr/qBTGO36y5GOBIOPNefhyhNJLMo=;
 b=nd5URoPesuvKmPSADLkVITFavFYhTm0fseAHZavic63H99v6FlO0fqMdimKYNXStVa
 cPGdAeGwu5EUxIP9munPGts6IcbEMv2hY0yYXNHlSrszJCBu4SMfkwJbTk4B1I57oX9J
 oKIneLSY9GfIcK2RSBvvajGo5/8CnXSt/Um2UnVeijdSlvzxDMiC5b57QjqSgzsjVg71
 HEaSYrZoxFPwY1NZtg0LxmPCU4RrxxgogLbKvELQqcjg8ElXuMyNNAAMZW35YfsNs66y
 u+i2HQC0QbqfPCirHcCtpOH2cOz+eYma4h7xIpKucQ0AAR6OjzzTzvXe1tEpqdDruwcz
 jTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0HHs9kfrDykWDzCr/qBTGO36y5GOBIOPNefhyhNJLMo=;
 b=nKikV8T9PBkHxkKSw0vyB5DsDaIxqTZ966rjcHhqnmkwCc9hZ2NWdX2K/Mi4gp4cJq
 MQo8yP+CvfLlid3m98zLhrWccIm2JqESJBKjmHfvEuNbjdWgNnX0c1MWhQB/22Z1QjAL
 Jk3Ry6DoaAjdMznUgbTmw2ln/VqAArN2s/zLSU9Jpr33m7QfoaLSNHSwvRpj3k7dNrpM
 dMi7lWMm3dw37si4xUDXqkz2VrLb7v7o52JmS63DLvw/fmbhu9t6Nv9FdNT94Gkeu+G9
 1vE1bStYkIPEFNk1d4gsjsX6yRIWnvSlbkLCTGcVdpnRs1+eats6z/DpAjVxcGinWzqq
 xF3Q==
X-Gm-Message-State: AOAM530Un7eLV3lMSu9rt/8o/qIMFcV772qQAyieaYFOEhc0GZlJ3NJ1
 lOWXIONx3gw+Iwn8kjXS8wR6s9MVpvPb9w==
X-Google-Smtp-Source: ABdhPJyvZf4cqJ4VK9BqTghZJCFOAVB+uLfSdS3eRi6kUEs4V9ozmwKb/rhmtdxSUKEa4kaBUnZ0kA==
X-Received: by 2002:a17:902:e54c:b029:e6:42ee:18ae with SMTP id
 n12-20020a170902e54cb02900e642ee18aemr3757448plf.68.1615292558387; 
 Tue, 09 Mar 2021 04:22:38 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d12c:1da1:5934:88c6])
 by smtp.gmail.com with ESMTPSA id l4sm9910596pgi.19.2021.03.09.04.22.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Mar 2021 04:22:37 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH 1/2] ui/cocoa: Show QEMU icon in the about window
Date: Tue,  9 Mar 2021 21:22:25 +0900
Message-Id: <20210309122226.23117-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 0ef5fdf3b7a..d8eacea6d22 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -39,6 +39,7 @@
 #include "qapi/qapi-commands-misc.h"
 #include "sysemu/blockdev.h"
 #include "qemu-version.h"
+#include "qemu/cutils.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include <Carbon/Carbon.h>
@@ -1401,18 +1402,13 @@ - (void)make_about_window
     y = about_height - picture_height - 10;
     NSRect picture_rect = NSMakeRect(x, y, picture_width, picture_height);
 
-    /* Get the path to the QEMU binary */
-    NSString *binary_name = [NSString stringWithCString: gArgv[0]
-                                      encoding: NSASCIIStringEncoding];
-    binary_name = [binary_name lastPathComponent];
-    NSString *program_path = [[NSString alloc] initWithFormat: @"%@/%@",
-    [[NSBundle mainBundle] bundlePath], binary_name];
-
     /* Make the picture of QEMU */
     NSImageView *picture_view = [[NSImageView alloc] initWithFrame:
                                                      picture_rect];
-    NSImage *qemu_image = [[NSWorkspace sharedWorkspace] iconForFile:
-                                                         program_path];
+    char *qemu_image_path_c = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/512x512/apps/qemu.png");
+    NSString *qemu_image_path = [NSString stringWithUTF8String:qemu_image_path_c];
+    g_free(qemu_image_path_c);
+    NSImage *qemu_image = [[NSImage alloc] initWithContentsOfFile:qemu_image_path];
     [picture_view setImage: qemu_image];
     [picture_view setImageScaling: NSImageScaleProportionallyUpOrDown];
     [superView addSubview: picture_view];
-- 
2.24.3 (Apple Git-128)


