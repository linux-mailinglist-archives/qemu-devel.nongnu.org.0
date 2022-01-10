Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F124899AB
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 14:16:03 +0100 (CET)
Received: from localhost ([::1]:60554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6uWo-0002Hs-GQ
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 08:16:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6uRF-0008CN-8L
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:10:18 -0500
Received: from [2a00:1450:4864:20::336] (port=36540
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6uRD-0008ME-1y
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:10:16 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so9709502wmk.1
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 05:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7J38PA7fo5uOi1FDkTH3MlYdSdNJH0Ez5wJ7c5zRjGA=;
 b=SaZoKm9S3wqSqADbVJ+0ZoWzk4nljHmuLkxbidOglgscrdbGbzC6GvxX1Mu7moH3e7
 yYPFx38FpJjrkeFzS5RP0wpa/31ePpf/PPOSQbcqWL6KRivZ0qdGodc7KW0v9RHSJBrQ
 G/dGDhFVlAh7vJ1hz3p8PuxlaaUGzK3D50TM3YUbgtgp/mfiQunAIYj+C3bBW3oTj6ce
 egbWERUALBhCWQQe3ApDx0eWaha/F7sl7VDdBvmESnOYRrPRVrgOR4Ik2Qi0zRpyLp6k
 DQLKOWku5LWqlFWSNPAJa4Y9FBX3bJQsJlP2WZ0Wcm1tnK+yZFfLQpk8iwIDj1VAx+YD
 GXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7J38PA7fo5uOi1FDkTH3MlYdSdNJH0Ez5wJ7c5zRjGA=;
 b=jGSts3PyEn/tc+MQPO0Esb9m4/ctwvB5gp9mVG59lgPXNZiZg7d9JeWVnupUFY9wDm
 utkBz52wAXjgFj2BxHCvW06zMJB5/F+tVwagFO9Uq/hNgIwGiYQBsyL3VZ7QwwklUHr+
 Xe0UfqPUKdjH20f5yX/wp9ADNt9nxJRjNU/kVt5n1OBVoGNySpspU0LOpZTlbXr3aPKI
 TjO0NWQHMExVq8ZYoCxjVyS4XDHr5JE3G++PzH4VVywXNNKzHqdAyAm7ADLdfK2nPpkt
 CXQMgf5c3gIZmvX1/NVwxBx2JRBumajp26RXpF827fe6cEjJxiQwm1CkzAE02ne4DvYg
 fGyA==
X-Gm-Message-State: AOAM530LGbYXjZ7B940RWIRe6a7Sf3nDqTT8qZqF/ffK5ZsWmYvPmzap
 uwlSddtAYXTYAc308xB0mmmb/fhmO76xYQ==
X-Google-Smtp-Source: ABdhPJxr8MoHgU5OZVvs/hmm5M11/b9B2wOkr5WtXqVonyuNzlu7v3cEPr0dZadAmgnyuOyfxhAx1A==
X-Received: by 2002:a1c:545b:: with SMTP id p27mr12228387wmi.178.1641820213499; 
 Mon, 10 Jan 2022 05:10:13 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id l4sm6632689wrm.62.2022.01.10.05.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 05:10:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 2/7] ui/cocoa: Remove allowedFileTypes restriction in
 SavePanel
Date: Mon, 10 Jan 2022 14:09:56 +0100
Message-Id: <20220110131001.614319-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110131001.614319-1-f4bug@amsat.org>
References: <20220110131001.614319-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SUBJ_WIPE_DEBT=1.004 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

setAllowedFileTypes is deprecated in macOS 12.

Per Akihiko Odaki [*]:

  An image file, which is being chosen by the panel, can be a
  raw file and have a variety of file extensions and many are not
  covered by the provided list (e.g. "udf"). Other platforms like
  GTK can provide an option to open a file with an extension not
  listed, but Cocoa can't. It forces the user to rename the file
  to give an extension in the list. Moreover, Cocoa does not tell
  which extensions are in the list so the user needs to read the
  source code, which is pretty bad.

Since this code is harming the usability rather than improving it,
simply remove the [NSSavePanel allowedFileTypes:] call, fixing:

  [2789/6622] Compiling Objective-C object libcommon.fa.p/ui_cocoa.m.o
  ui/cocoa.m:1411:16: error: 'setAllowedFileTypes:' is deprecated: first deprecated in macOS 12.0 - Use -allowedContentTypes instead [-Werror,-Wdeprecated-declarations]
      [openPanel setAllowedFileTypes: supportedImageFileTypes];
                 ^
  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/NSSavePanel.h:215:49: note: property 'allowedFileTypes' is declared deprecated here
  @property (nullable, copy) NSArray<NSString *> *allowedFileTypes API_DEPRECATED("Use -allowedContentTypes instead", macos(10.3,12.0));
                                                  ^
  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/NSSavePanel.h:215:49: note: 'setAllowedFileTypes:' has been explicitly marked deprecated here
  FAILED: libcommon.fa.p/ui_cocoa.m.o

[*] https://lore.kernel.org/qemu-devel/4dde2e66-63cb-4390-9538-c032310db3e3@gmail.com/

Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 ui/cocoa.m | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 69745c483b4..dec22968815 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -100,7 +100,6 @@ static void cocoa_switch(DisplayChangeListener *dcl,
 static char **gArgv;
 static bool stretch_video;
 static NSTextField *pauseLabel;
-static NSArray * supportedImageFileTypes;
 
 static QemuSemaphore display_init_sem;
 static QemuSemaphore app_started_sem;
@@ -1162,10 +1161,6 @@ - (id) init
         [pauseLabel setTextColor: [NSColor blackColor]];
         [pauseLabel sizeToFit];
 
-        // set the supported image file types that can be opened
-        supportedImageFileTypes = [NSArray arrayWithObjects: @"img", @"iso", @"dmg",
-                                 @"qcow", @"qcow2", @"cloop", @"vmdk", @"cdr",
-                                  @"toast", nil];
         [self make_about_window];
     }
     return self;
@@ -1408,7 +1403,6 @@ - (void)changeDeviceMedia:(id)sender
     openPanel = [NSOpenPanel openPanel];
     [openPanel setCanChooseFiles: YES];
     [openPanel setAllowsMultipleSelection: NO];
-    [openPanel setAllowedFileTypes: supportedImageFileTypes];
     if([openPanel runModal] == NSModalResponseOK) {
         NSString * file = [[[openPanel URLs] objectAtIndex: 0] path];
         if(file == nil) {
-- 
2.33.1


