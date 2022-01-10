Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD0C4899F8
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 14:31:22 +0100 (CET)
Received: from localhost ([::1]:47160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6uld-0004tT-GM
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 08:31:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6uRw-00008l-Ln
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:11:00 -0500
Received: from [2a00:1450:4864:20::32a] (port=42902
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6uRh-0008Un-Cw
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:11:00 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso7250281wme.1
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 05:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oetO7aKXzKFQoezQrscPJAT1pLRp71rd97o5y+AiOV8=;
 b=GRfIyIG7ulqJq3Z5yS6bimdOqy8VFjA48bsj3Ao5ByZ/Qd9lIoXEGm/sKUB7ECX5sy
 qy4LDr11Er7jQ4w0RCpFVVl4dS4a1Wwhsic7zr55GRLGLzaddjYvKTotxz+KqRMhgRDI
 CTiKfrm8ypnwQ4B0ki98Of/CIcgpqFtj263KlYyTl5DbrFxW6OIx/EoYWhClKfF+sqB+
 l2aqH0LnF1HbIn0R3uew05/vU95Ez6ELwGYOKVNLwxdSJ5y67hNo7duwuJZWHLg/uRC4
 IIpKEwALSi08lIhSplsiTP7wGA1sLypHqmXCLo6z4SDYNelUbOE5IdohL4uZuElomelM
 gCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oetO7aKXzKFQoezQrscPJAT1pLRp71rd97o5y+AiOV8=;
 b=ce+yJG/7i1kA+4d44QU19DsWcyLfS97n4jblqCAWFvKuo4BIGrPiME5vYFjFGl9Nz4
 mOXVcMMCj9O+8fxDJsNsz3Va5xHQigGZcqDSTdmOyiGlYUC6dHmD0geAgsJQFhq4NbD3
 9/n1VZwwYqrpVwq+DfeW8MQHrhI0uRForqhokkcJk2de1AtPDsEvhpQ4eCwmcDTMmzEm
 NUu60+mLMo8u3clPfhPQdJj7MTdDhOsl33s6fzL80jU1UP/g1E63jvejJPPK7Ah+1J/Y
 cGNvAUJL0Xc3sXRwRPbJv1qtH3HVmFmH/B/ceDR6efRZGVSp35oSDJi0ngv95raDgGYP
 JzPA==
X-Gm-Message-State: AOAM530I9rIawSvINNuQsK7/xXjRBHjlnRGKvkE39VgucTGZIiZzBIob
 Rpol2c+vWWrqRarkYzLKuhi7EAY4AuDhTA==
X-Google-Smtp-Source: ABdhPJyPSuhJ3fYfyaf7gutir+WDeGD+9B/Q87or6zMgyLoaudA6ag2GP5NP4D+spY1Cs6kL9DZJMQ==
X-Received: by 2002:a05:600c:1e8f:: with SMTP id
 be15mr21940249wmb.83.1641820233579; 
 Mon, 10 Jan 2022 05:10:33 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id r7sm1772695wmq.18.2022.01.10.05.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 05:10:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 6/7] block/file-posix: Remove a deprecation warning on
 macOS 12
Date: Mon, 10 Jan 2022 14:10:00 +0100
Message-Id: <20220110131001.614319-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110131001.614319-1-f4bug@amsat.org>
References: <20220110131001.614319-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

When building on macOS 12 we get:

  block/file-posix.c:3335:18: warning: 'IOMasterPort' is deprecated: first deprecated in macOS 12.0 [-Wdeprecated-declarations]
      kernResult = IOMasterPort( MACH_PORT_NULL, &masterPort );
                   ^~~~~~~~~~~~
                   IOMainPort

Replace by IOMainPort, redefining it to IOMasterPort if not
available, using Clang __is_identifier() feature (this code
is guarded by __APPLE__ #ifdef'ry).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Checkpatch:

 WARNING: architecture specific defines should be avoided

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 block/file-posix.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index b283093e5b7..1d0512026c5 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3324,17 +3324,22 @@ BlockDriver bdrv_file = {
 #if defined(__APPLE__) && defined(__MACH__)
 static kern_return_t GetBSDPath(io_iterator_t mediaIterator, char *bsdPath,
                                 CFIndex maxPathSize, int flags);
+
+#if !__is_identifier(IOMainPort) /* macOS >= 12.0 */
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
@@ -3347,7 +3352,7 @@ static char *FindEjectableOpticalMedia(io_iterator_t *mediaIterator)
         }
         CFDictionarySetValue(classesToMatch, CFSTR(kIOMediaEjectableKey),
                              kCFBooleanTrue);
-        kernResult = IOServiceGetMatchingServices(masterPort, classesToMatch,
+        kernResult = IOServiceGetMatchingServices(mainPort, classesToMatch,
                                                   mediaIterator);
         if (kernResult != KERN_SUCCESS) {
             error_report("Note: IOServiceGetMatchingServices returned %d",
-- 
2.33.1


