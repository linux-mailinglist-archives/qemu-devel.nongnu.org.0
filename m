Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 978FF4B65DA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:19:51 +0100 (CET)
Received: from localhost ([::1]:45848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJt3u-0008D9-Oc
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:19:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJsoq-0002M2-MQ
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:04:16 -0500
Received: from [2607:f8b0:4864:20::433] (port=36627
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJsoo-0002CJ-Lu
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:04:16 -0500
Received: by mail-pf1-x433.google.com with SMTP id z16so11703992pfh.3
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 00:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jlmSMkeCwUd8E6YT5e8ACCLaTL1+jSNfQP2Uet5vd1k=;
 b=Vsu05IcYogJ9RCx0U2sONAuRdU0LGye//Z1BINch0tqJd1FSPtqtPac38NK1b4k2DH
 evW5atpiRIJzGoqNMLZvN/ZdFJoKUyRMFAfsMMYDaZ+paBlmJrHRHLZ6CBIW+kSYSYmp
 jmHxYPlmNsXrAzzVJY80pJxHOUdcy5+6wVFEoUYv6M+rthdtJBXlwFpIRVMR9Lu9Lx6y
 3MCs7GopaYnStg2KuIWulaoBp0jMMKvwKokuqni7hRRcLNEIRGb1kdhfZZkeZ8dV/erJ
 iYOE6Xz9+yIUTKPlqXThJRc6VyFWGCB9E8hNjAabGW+Br6g9G8hMUbgHUEFtuBOQloJH
 hZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jlmSMkeCwUd8E6YT5e8ACCLaTL1+jSNfQP2Uet5vd1k=;
 b=p0SBH+C2QA+cFEp6abXv9G1FOIZVlwC0ayHyuBkwqdFhyUDJFD2pTePemhIumQY0Ir
 gd8QQKMjZUG1lHuPLOCMi0uSFWwaKI8e1XEqOkSdI1GR0oWVz1qNaCQOIj9AVVdQ9GFW
 4hxLYxxJmBqykLWEdxEi32yUpP9mQwNaCQyGzdOCvh1+NPf+TrJ+7e6aVsW6GZHKBdRC
 to8GWWxjWQR9g2ANRHL41nv8nSc/3kJZRG2GhN6qKwbMegOB7CsFzEOIMP3dUx4D0hKL
 NZhYrjSgwzbkKtzj54cr/a8X6+0Isj0mqyJk8Ab1if1AOrcfF4m/p4hMqicYZJr4KtH5
 OV0w==
X-Gm-Message-State: AOAM530Ahp+WXNGQtVIMFvEa0OV2XOZKHa7z+Wxt9ees1PwXHcp6O4f6
 ovrYvtv182leKtN7J7VFYQUkvDuj4mk=
X-Google-Smtp-Source: ABdhPJxRAsA2QerClXHOPbUKm41qG1ce8/XlcYt63Nv1De4u+OWkOrDIP8wgQpVpz5ZtEfB/lSqK8g==
X-Received: by 2002:a63:18e:: with SMTP id 136mr2522079pgb.478.1644912253175; 
 Tue, 15 Feb 2022 00:04:13 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id oo9sm13830622pjb.10.2022.02.15.00.04.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 00:04:12 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Cameron Esfahani <dirty@apple.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 07/15] block/file-posix: Remove a deprecation warning on
 macOS 12
Date: Tue, 15 Feb 2022 09:02:59 +0100
Message-Id: <20220215080307.69550-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215080307.69550-1-f4bug@amsat.org>
References: <20220215080307.69550-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

When building on macOS 12 we get:

  block/file-posix.c:3335:18: warning: 'IOMasterPort' is deprecated: first deprecated in macOS 12.0 [-Wdeprecated-declarations]
      kernResult = IOMasterPort( MACH_PORT_NULL, &masterPort );
                   ^~~~~~~~~~~~
                   IOMainPort

Replace by IOMainPort, redefining it to IOMasterPort if not available.

Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed by: Cameron Esfahani <dirty@apple.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 block/file-posix.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 1f1756e192..13393ad296 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3319,17 +3319,23 @@ BlockDriver bdrv_file = {
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
@@ -3342,7 +3348,7 @@ static char *FindEjectableOpticalMedia(io_iterator_t *mediaIterator)
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


