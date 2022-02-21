Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6002C4BD8D0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 10:59:54 +0100 (CET)
Received: from localhost ([::1]:37876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5U1-0003Yv-Fa
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 04:59:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zo-0000Dt-Do
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:45 -0500
Received: from [2a00:1450:4864:20::32f] (port=38467
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zZ-00013Z-8C
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:37 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 k127-20020a1ca185000000b0037bc4be8713so13069668wme.3
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=61CEyeaEKqT0X+d8dF55OnjNbWRRBgVyMed22FgL4ns=;
 b=VJ2Fqpq6i2TAtDDhwxGjufmn9e3g6/sg9n+qJUXhOnGF8GZB4rcxaMPU79WLRr4gpa
 Mm4QKNd1n6xKOpCyjMwDi7Ih6MyXSM0vT1ZMCWCgXWYy/JadqyGOIMp20X04irAhCP5k
 ZhZ31M+57eInoT8RqBdQt3bSAyDJrlrCGNCfqkHDVisCH4F20xZY1KR/6odY9/GlAEVy
 3iH1RtuJfyRxt3KsR6TZlLnnpXSMxsFhLx7I3dzVctSXPX8ySv7cdbWH7AKScETCHCZi
 xYNliXXDZkfOZ55pZd/nOYI61uEPskovicOpRKoKbMX/dLfD9oKR/HnczuXy0teX3VGL
 nLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=61CEyeaEKqT0X+d8dF55OnjNbWRRBgVyMed22FgL4ns=;
 b=DOncxj0LBmX+DRHfqFvqa8gmxzjC+PHjsh+V5BIAJ8jqQf0EDQsKDJ2mJf1pRqSnWw
 cbLmt8u1QQUdvOrS/j/sGd4CQx3aUF9FTZ2nyD9BQ1fU/wx/IJwZe59LqJxF079E9rph
 hNziHN/QyTGQGb1j8CfkwMggsuXgU+UozGpyojiy2D2uuvpXoypzCOXeectIo8FYWLR+
 G5xG4z0RiElAxdq0aXwyvHd5Ml1EeTU0brStr7BuX5cEvtD3DDDFnSYu7CJjERg3DO3/
 8W/1F+jN0vziVFy227tjaV8TQbESYjBQ16G6WyzC9qg6Kl+o+qZuMLgYWAzquxIGIegD
 9RIA==
X-Gm-Message-State: AOAM533XEpG+PRjByKGdChtvBZPwhtpq4eFamquD8UsnjsvKepbc9igM
 4qAPWHS3WP6/tQKN/RcMh4NRZ954sZG9wA==
X-Google-Smtp-Source: ABdhPJwjlHZNmU7pM65gX9VvENQFLT3jtknX0Aaifv7hLkKqHE3FjSIK2+BtEr6oh4HJxEmx0TCcCQ==
X-Received: by 2002:a05:600c:19ce:b0:37c:6fe:68b6 with SMTP id
 u14-20020a05600c19ce00b0037c06fe68b6mr20062988wmq.90.1645435701706; 
 Mon, 21 Feb 2022 01:28:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id q76sm7555778wme.1.2022.02.21.01.28.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:28:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/26] ui/cocoa: Remove allowedFileTypes restriction in
 SavePanel
Date: Mon, 21 Feb 2022 09:27:58 +0000
Message-Id: <20220221092800.404870-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221092800.404870-1-peter.maydell@linaro.org>
References: <20220221092800.404870-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, TVD_SUBJ_WIPE_DEBT=1.004,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

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
Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220215080307.69550-11-f4bug@amsat.org
Reviewed by: Cameron Esfahani <dirty@apple.com>
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 ui/cocoa.m | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index ac18e14ce01..7a1ddd4075f 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -100,7 +100,6 @@ static int gArgc;
 static char **gArgv;
 static bool stretch_video;
 static NSTextField *pauseLabel;
-static NSArray * supportedImageFileTypes;
 
 static QemuSemaphore display_init_sem;
 static QemuSemaphore app_started_sem;
@@ -1168,10 +1167,6 @@ QemuCocoaView *cocoaView;
         [pauseLabel setTextColor: [NSColor blackColor]];
         [pauseLabel sizeToFit];
 
-        // set the supported image file types that can be opened
-        supportedImageFileTypes = [NSArray arrayWithObjects: @"img", @"iso", @"dmg",
-                                 @"qcow", @"qcow2", @"cloop", @"vmdk", @"cdr",
-                                  @"toast", nil];
         [self make_about_window];
     }
     return self;
@@ -1414,7 +1409,6 @@ QemuCocoaView *cocoaView;
     openPanel = [NSOpenPanel openPanel];
     [openPanel setCanChooseFiles: YES];
     [openPanel setAllowsMultipleSelection: NO];
-    [openPanel setAllowedFileTypes: supportedImageFileTypes];
     if([openPanel runModal] == NSModalResponseOK) {
         NSString * file = [[[openPanel URLs] objectAtIndex: 0] path];
         if(file == nil) {
-- 
2.25.1


