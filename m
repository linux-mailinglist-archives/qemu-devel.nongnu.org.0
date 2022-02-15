Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBA24B6602
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:27:53 +0100 (CET)
Received: from localhost ([::1]:60494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJtBg-0001QR-Fq
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:27:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJspH-0002wI-6c
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:04:43 -0500
Received: from [2607:f8b0:4864:20::42c] (port=38527
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJspE-0002EF-Ly
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:04:42 -0500
Received: by mail-pf1-x42c.google.com with SMTP id e17so14082891pfv.5
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 00:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VfGP9v+SJGC5s5c3YVjK2aTHozdvRpFoivfAAZxpXGU=;
 b=HSqynoji1/D/Iimk02xnb1G8LlcdK2NSX7zRXXd/oe34IfWx9xbKtKVm+r04RCIkk2
 taLynsAZ3I0g5CYhYwGrZ1tTSIXyeILa+4B5XZOUdFROTDVstXakdivZyJHp+U/phiEs
 FyqKnzHwvbJX1fim3R+xMHEPrhjPARdP/DLH6KiVCGYxZrkAeFcaLE3EsrHUzChCcAGa
 d7zQ5TED81rmRZjcQG1N/7D7/74USp6gty351IDlOXBb3sCbjW8PwbyiFdzhC2C6PeMN
 bSd2tzMRlZYE02yq1vwfvwn9gwzSxksw0IgAmBImqtvXLvM8RcVlp7x87YyrHBbDvX/p
 JwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VfGP9v+SJGC5s5c3YVjK2aTHozdvRpFoivfAAZxpXGU=;
 b=MT3O7Bp1nJjLa9/L4k9NnCZHF+mGOKerAB+mS+D7dlXT5xvDOsRMNxTJtE6re/CnaY
 holKKtQ+cYe8irEamFC9Tv+c7HdKBDPRv52HWFPiRvFtWRSS02hxgK4Ypb6G8LJ3XVp6
 I6wBfx4W2YVWY8um2L9BED6bPJxxeQZZJW0K4FssmdJMYcuphQetx2lCTxa5K9A2VRJM
 hnv8sO72ZuAwKIOAatfjn//j+wqB/XFUThYXAUl6LKbGy4KqfqkG9PZukgGy2DCPwLLO
 0OSZlzvrb6NhRZugzsCvr5U+Qodbf5TSrlw7XtRKVFBzVPkBbJmUYpUlv4QxUlPIrRsR
 QxTg==
X-Gm-Message-State: AOAM532v+8TDOg8z7bXbkhUQ2zSBXAyBn+APmK4rs9smYO9jMQpe1sA1
 0DN3Ml1uoBAk9Ctji9SaZTz4TfiCzfI=
X-Google-Smtp-Source: ABdhPJzTnMNlOMmBZf0fIqHVO9VB4k9mFDM4bLWRovuyVlu2lcfYxuQxV7uWBPzledvNaGvi07L9Ag==
X-Received: by 2002:a63:5a14:: with SMTP id o20mr451619pgb.197.1644912279025; 
 Tue, 15 Feb 2022 00:04:39 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id o7sm36902930pfk.184.2022.02.15.00.04.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 00:04:38 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Cameron Esfahani <dirty@apple.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 10/15] ui/cocoa: Remove allowedFileTypes restriction in
 SavePanel
Date: Tue, 15 Feb 2022 09:03:02 +0100
Message-Id: <20220215080307.69550-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215080307.69550-1-f4bug@amsat.org>
References: <20220215080307.69550-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

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
Reviewed by: Cameron Esfahani <dirty@apple.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 ui/cocoa.m | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index ac18e14ce0..7a1ddd4075 100644
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
2.34.1


