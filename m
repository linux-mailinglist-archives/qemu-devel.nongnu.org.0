Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DF34D9BB3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 13:59:00 +0100 (CET)
Received: from localhost ([::1]:60318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6lP-0007eL-I9
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 08:58:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6hP-0004l9-UE
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:54:51 -0400
Received: from [2607:f8b0:4864:20::1031] (port=56318
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6hO-0007lL-8r
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:54:51 -0400
Received: by mail-pj1-x1031.google.com with SMTP id e3so17601482pjm.5
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ot2D326O8foCPTFoiSw5ZmusSMStw8kBL5YJqBE67gs=;
 b=L/VP+LBuDd5iaY9YsUnQMhiCXMuLHym9yo7pc5slZY22YRb71dxWjFZur/3rqK6hjA
 41KA0uABCYrbfO9wLaAM6oDfWCXgHo/Q6bZS7hNmG4hN8fEZwnaQLwXqp9GFUuQ1ival
 KctGZUSUn6auDAa922oeggX3Gf3JVzJ2ZzQiVqRq7x/tvPWF2q9RArWnagSvMM78SYh1
 PzJCTBy7ZWswJpNP2ProqIiL/EmNnQKpEJdaDH3cPwMNDTWiPqK4TxQRlJfcmFAMZeLO
 C2HWN6rbuxqyUEliXRWwst6SS58whHpdIlnhwe2ntyk0jO3exY5I+2KcgmiB5gYF3bA2
 qpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ot2D326O8foCPTFoiSw5ZmusSMStw8kBL5YJqBE67gs=;
 b=239zHhw0Ae0iNgG1/rWnhVglrPBAX7+GtCNjor4BrjYqajZc7tjnk4cKRTpJTYfS8H
 Htn0OPa4vKjqVuq/QNYq9M09D4gduoyL6F6yxQG7TUHKFBR+uilW4Xc/4zIB0IMJ6IK1
 J+rAGWikEjMlwRqcqNjci1B/fTViYq0ACboZRdh53x4FTBUf++dU2iT1ycmh8mVL7IrW
 GotiqZwnj7Vhny2W0oJQe/xlY+gRfuPzGhZK+JwykVNo8OP4h6tgDTLtmJ5WpBz8wiKt
 yNq0kV+UqwSSBSHbvAIhHiRsi4xfa2v9QAS9W8R/brj5DzLE/rkWUzCwd70uIrHvcDv/
 JHhA==
X-Gm-Message-State: AOAM5329QHIAYUJQf1Flq/qyXaXi4R600GGfz5DEaRcMG0nY0En3QF8d
 ChrWjuf5luoo6aWBpv8tu2I/DFESDUs=
X-Google-Smtp-Source: ABdhPJwyDL436cgneKoW9OA7bw0tEWBcgwCyBEMHflFZA0k8E0tlapz30AG2+aVOsrdmaO8+cPPJyQ==
X-Received: by 2002:a17:90a:f8c:b0:1bc:cf23:2319 with SMTP id
 12-20020a17090a0f8c00b001bccf232319mr4487280pjz.67.1647348888736; 
 Tue, 15 Mar 2022 05:54:48 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a056a00214700b004c169d45699sm24048615pfk.184.2022.03.15.05.54.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Mar 2022 05:54:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/21] block/file-posix: Remove a deprecation warning on macOS
 12
Date: Tue, 15 Mar 2022 13:53:35 +0100
Message-Id: <20220315125350.82452-7-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
References: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When building on macOS 12 we get:

  block/file-posix.c:3335:18: warning: 'IOMasterPort' is deprecated: first deprecated in macOS 12.0 [-Wdeprecated-declarations]
      kernResult = IOMasterPort( MACH_PORT_NULL, &masterPort );
                   ^~~~~~~~~~~~
                   IOMainPort

Replace by IOMainPort, redefining it to IOMasterPort if not available.

Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed by: Cameron Esfahani <dirty@apple.com>
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 block/file-posix.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index c000a61db2..39a3d6dbe6 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3320,17 +3320,23 @@ BlockDriver bdrv_file = {
 #if defined(__APPLE__) && defined(__MACH__)
 static kern_return_t GetBSDPath(io_iterator_t mediaIterator, char *bsdPath,
                                 CFIndex maxPathSize, int flags);
+
+#if !defined(MAC_OS_VERSION_12_0) \
+    || (MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_VERSION_12_0)
+#define IOMainPort IOMasterPort
+#endif
+
 static char *FindEjectableOpticalMedia(io_iterator_t *mediaIterator)
 {
     kern_return_t kernResult = KERN_FAILURE;
-    mach_port_t     masterPort;
+    mach_port_t mainPort;
     CFMutableDictionaryRef  classesToMatch;
     const char *matching_array[] = {kIODVDMediaClass, kIOCDMediaClass};
     char *mediaType = NULL;
 
-    kernResult = IOMasterPort( MACH_PORT_NULL, &masterPort );
+    kernResult = IOMainPort(MACH_PORT_NULL, &mainPort);
     if ( KERN_SUCCESS != kernResult ) {
-        printf( "IOMasterPort returned %d\n", kernResult );
+        printf("IOMainPort returned %d\n", kernResult);
     }
 
     int index;
@@ -3343,7 +3349,7 @@ static char *FindEjectableOpticalMedia(io_iterator_t *mediaIterator)
         }
         CFDictionarySetValue(classesToMatch, CFSTR(kIOMediaEjectableKey),
                              kCFBooleanTrue);
-        kernResult = IOServiceGetMatchingServices(masterPort, classesToMatch,
+        kernResult = IOServiceGetMatchingServices(mainPort, classesToMatch,
                                                   mediaIterator);
         if (kernResult != KERN_SUCCESS) {
             error_report("Note: IOServiceGetMatchingServices returned %d",
-- 
2.34.1


