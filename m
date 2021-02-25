Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66624324C29
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 09:43:05 +0100 (CET)
Received: from localhost ([::1]:41280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFCEi-0002xf-FC
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 03:43:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lFCDt-0002YD-8w
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 03:42:14 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:34285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lFCDq-0003n0-GT
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 03:42:13 -0500
Received: by mail-pj1-x102e.google.com with SMTP id o22so4694215pjs.1
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 00:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c7hafPRIBJNWRGEzSYObN+J4lcA+ioV0M3zxtIKpfcA=;
 b=klN627QQ7jfrmGhWDt7pB2bgImhFWz74Wr0rKFw0V4Z8203VN7JoPH6PUqzgUDPReq
 usM0k6xIJ7tWBv5W9ygWxVqhfdetQuGz8SOORtdhYI8EYo93kXzlsNkne6GyVGcwGGgr
 30SiLDONoSRoWZDcX4HhW34casgkzTyIJO+mE+B7yP1ED5TmPc6uGvZieJoqUyaBUSR4
 ET7BM0zXpfl1QQ5dotija6rRWljsORz0fKEzqaMsVOIHdVqETO+B2YhGaLeLQsxxt0a6
 nwL7iOZj4ArpJ4Z0nGSujrCqyiDx0x1GGkAj+P6Pber2Eq7hP5r1K26XPspeKk7H61ph
 APmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c7hafPRIBJNWRGEzSYObN+J4lcA+ioV0M3zxtIKpfcA=;
 b=n6SSLEz9ooLP8OQqTAb1zZ/MGcArNCPj/2gPKsCTbFEu7Apmv9JeOBkxWhDF1wf8HH
 H4gT+Z5s0aN3uMEbEWrQ0QDYUHxGsEH7nEAzczo2fn/BME4DOdKBx0dzRExW1Ad7XR5m
 BqjamYpPNHA/Sv/DfmKflgTVcov0JzVgwfhIr7xs03D5i5g3i2A5GIcGj1YcFKyrHlxn
 kqNWjPEmMf2OqbsktmaEg/KzeOkoQ1nXgUNp22oZ9tjVVSgwYz2HhQt3UnAFpCbPDyCn
 z1lzpXhefYQa4V4fwgiuxvW/AlQ6+M6wP+EoLcj5KkF1xTepBX3A9MPFyQWb6pyjOhCV
 ftYQ==
X-Gm-Message-State: AOAM532Dqjq69GqGYRCyUrFa9qTauwWKA3EirzKS0lSYcR8MkTSovlf0
 F9aUYWZEPT6zb97TIlMqtBPAgUj89urZww==
X-Google-Smtp-Source: ABdhPJzdc72Kw6OvDjIHegoiWjuz7Nef9oMbdyqdGscD/mBktDCg9Xa/hAR702FzckH5qDl0o88iWw==
X-Received: by 2002:a17:90b:1290:: with SMTP id
 fw16mr2272219pjb.99.1614242527459; 
 Thu, 25 Feb 2021 00:42:07 -0800 (PST)
Received: from localhost.localdomain ([2400:4050:c360:8200:29a8:515b:7b7:9008])
 by smtp.gmail.com with ESMTPSA id bg16sm3671858pjb.43.2021.02.25.00.42.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Feb 2021 00:42:06 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Mark variables static
Date: Thu, 25 Feb 2021 17:42:02 +0900
Message-Id: <20210225084202.39601-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102e.google.com
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
 ui/cocoa.m | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 0ef5fdf3b7a..9e9a2f88dde 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -80,7 +80,7 @@ static void cocoa_switch(DisplayChangeListener *dcl,
 
 static void cocoa_refresh(DisplayChangeListener *dcl);
 
-NSWindow *normalWindow, *about_window;
+static NSWindow *normalWindow, *about_window;
 static const DisplayChangeListenerOps dcl_ops = {
     .dpy_name          = "cocoa",
     .dpy_gfx_update = cocoa_update,
@@ -93,11 +93,11 @@ static void cocoa_switch(DisplayChangeListener *dcl,
 static int last_buttons;
 static int cursor_hide = 1;
 
-int gArgc;
-char **gArgv;
-bool stretch_video;
-NSTextField *pauseLabel;
-NSArray * supportedImageFileTypes;
+static int gArgc;
+static char **gArgv;
+static bool stretch_video;
+static NSTextField *pauseLabel;
+static NSArray * supportedImageFileTypes;
 
 static QemuSemaphore display_init_sem;
 static QemuSemaphore app_started_sem;
@@ -135,7 +135,7 @@ static bool bool_with_iothread_lock(BoolCodeBlock block)
 }
 
 // Mac to QKeyCode conversion
-const int mac_to_qkeycode_map[] = {
+static const int mac_to_qkeycode_map[] = {
     [kVK_ANSI_A] = Q_KEY_CODE_A,
     [kVK_ANSI_B] = Q_KEY_CODE_B,
     [kVK_ANSI_C] = Q_KEY_CODE_C,
-- 
2.24.3 (Apple Git-128)


