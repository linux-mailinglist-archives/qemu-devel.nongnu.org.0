Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A767E31F607
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 09:47:35 +0100 (CET)
Received: from localhost ([::1]:38534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD1Rm-0002fy-Mm
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 03:47:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD1Pi-0001tc-LE
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 03:45:26 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:43668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD1Ph-00067K-2D
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 03:45:26 -0500
Received: by mail-pg1-x529.google.com with SMTP id n10so3393511pgl.10
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 00:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ufy+iOhuKKrdzU0OG+n8uVDY7T3yMNBsfV5nYATH0O4=;
 b=JgkpCXhsd7t3Ey6XINlyyn+RZknDUnVUGhp3bWhoKAyu+xwaomAzt4rLItAQ7ytUlo
 B/snRPZxh34SEsOoyDZFCpv4cS0sYzcK5N9ItxwVz5zmbdenD2kwyvj1NC4gX6lfZ5z0
 MhCL9/2TVzoH+UjreNLJfYQzsAfPoJlTXmNnkOJrAq1P52eyLxCt1++R8HF5t1EhYRhZ
 vQvQnWIPk07BzP66GL5Tq2wjNEWG5nYG1WrsEm5mD9YMsWQfwBRcDwMrGZcrAxdjHwg4
 BElzNtgupa5FQVavfrdwjsUNiqylE1paf/hEjgbtEXZe2s8o0VJvqm28+Bxx51BRKRtb
 e7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ufy+iOhuKKrdzU0OG+n8uVDY7T3yMNBsfV5nYATH0O4=;
 b=P5Fe2KnnTHf6Lg2KvCROdOagez0DOUqPQIVR0IVCaTy2dieDEphO6n7MxQ7taHQFzw
 +5jIhO0sAqTeN8Q5J5WRKcDyXfVa+3LmOe0rxewHBL+egVI/0QJLB9Uc22W6dgmeuWtn
 olnrQZnpN748NH/MgC8ROeZ67figEPJ0/bLv0RZnhs1r4IGfJ6SJantJtP3jDCL6YYVN
 PmtmgeuDQg/bZ59Z4OXLuPmztGo5B8C1oPDYWrJCCmzr/qh+ju/FkD/5JOVezOlkxXOg
 xZlcmt6+lzwfLs7k8LScYCCOx+QtlkmtNbuU+aP8GAVegjWipxvZBx9duYHC+VIc3GMo
 uMxw==
X-Gm-Message-State: AOAM530ovhckbNyzP//otUQ2gXR4YO3nSdulWV9IftO5fFxj5uQCSpcQ
 N+tlO2uXeQ3PU0h+KKfaS74DCvimYxe2Ag==
X-Google-Smtp-Source: ABdhPJz0vORB5oyTiOneS4KevdLHJMb0SRxRJOJ4ZDvQCi63+tkl0eS/FEDNfxuo1rHPcLex+CivXg==
X-Received: by 2002:a63:4b21:: with SMTP id y33mr7605217pga.73.1613724323551; 
 Fri, 19 Feb 2021 00:45:23 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d8f0:71c1:3d6a:4f53])
 by smtp.gmail.com with ESMTPSA id z125sm9285129pgz.45.2021.02.19.00.45.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Feb 2021 00:45:23 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Use kCGColorSpaceSRGB
Date: Fri, 19 Feb 2021 17:45:18 +0900
Message-Id: <20210219084518.90246-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x529.google.com
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

kCGColorSpaceGenericRGB | Apple Developer Documentation
https://developer.apple.com/documentation/coregraphics/kcgcolorspacegenericrgb
> Deprecated
> Use kCGColorSpaceSRGB instead.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 13fba8103e1..686fbb1b457 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -437,7 +437,7 @@ - (void) drawRect:(NSRect) rect
             screen.bitsPerPixel, //bitsPerPixel
             (screen.width * (screen.bitsPerComponent/2)), //bytesPerRow
 #ifdef __LITTLE_ENDIAN__
-            CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB), //colorspace for OS X >= 10.4
+            CGColorSpaceCreateWithName(kCGColorSpaceSRGB), //colorspace for OS X >= 10.5
             kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipFirst,
 #else
             CGColorSpaceCreateDeviceRGB(), //colorspace for OS X < 10.4 (actually ppc)
-- 
2.24.3 (Apple Git-128)


