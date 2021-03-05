Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48DB32E7BD
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 13:14:19 +0100 (CET)
Received: from localhost ([::1]:60672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI9LW-0007Rh-Tm
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 07:14:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lI9KU-0006bv-3z
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 07:13:14 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:45180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lI9KS-0002Bw-7F
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 07:13:13 -0500
Received: by mail-pg1-x532.google.com with SMTP id p21so1239577pgl.12
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 04:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=66iL00YLYKFrHwsjhhHxvsd7PuxyrL1cuFY2bhZimf4=;
 b=JhdtP68z94meSwcA3FdxwVU4GlbrBAF2Yr1taatO1wX9yPBkRaNKdT8gvEtnf05How
 g07SnyaLRP29fIPcs+0DblZYXIESq8Gv29jvryhRJQOGMutFVFK60KPkd5fwbvYYL3jU
 J2LT0RIoKS7CAj4e0L6Uyu7g1YU/EEOiltk+WMtaUtrwqlgR1aelnOGKZ+mU3pyQY499
 n1Q5lpAzvHvLtAyvilIfDUyXtNTQK5oxx235lccLTke1uTsRuIkOs37GRpLJilH4qkvH
 LiKGcwrBIAlZCBtvmTruQDXwOxuBFFUNlNuF47MRD6G2VHhjgIuPg1ZorL6VsyuV9ZM3
 1RGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=66iL00YLYKFrHwsjhhHxvsd7PuxyrL1cuFY2bhZimf4=;
 b=tkBrJwKoFAvDZIxZJcYxYLY5Dg9C4tEm4ugEwFeUkDw8y3Prb7STos4NA5LAXYFQQP
 S1jCxCDvGsXfKUc7aUV0xJBitFGGkYbeXhJ12gD20JPd6l3P/0ur9EUYIW2HQMWjwwQu
 4SlQD6y0Jlav8/yrB8F7TpAlGvo+qXVJQxtidco/p7dDGt+OG31qVfsUX74IU1z4A3R5
 zQxCVqisZ+jiWnyTuTWYmKmrRbOUm88MAYrqn/k7+Fft5U0maoGamnlOWcH3X0xdhvRa
 5FvM6ZHKdvjM03/eJ935a/E1MStl5DeygqqvFNgYBt9cp7V+dqImKmIRgM6WcsppYmdg
 lVng==
X-Gm-Message-State: AOAM530bvKj5xY0khJ9Cg9pqbiYu8njxmWkKIGDONi3OI/G1cl7KSYXt
 T1osDkw6q5zM4y3e6US7TAgyJBXUdAGYAQ==
X-Google-Smtp-Source: ABdhPJyjmsnl5qGMLy3ft6pCtr6gjTbE4OVYm3IuqLkXcaVFH2jmHNPwTnn10dvTOL+tm7r/YCfEpg==
X-Received: by 2002:a65:6208:: with SMTP id d8mr8135115pgv.365.1614946389932; 
 Fri, 05 Mar 2021 04:13:09 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:6076:fea8:b0ba:4fdb])
 by smtp.gmail.com with ESMTPSA id c12sm2263454pjq.48.2021.03.05.04.13.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Mar 2021 04:13:09 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v4] ui/cocoa: Use kCGColorSpaceSRGB
Date: Fri,  5 Mar 2021 21:13:04 +0900
Message-Id: <20210305121304.65096-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x532.google.com
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

This change also removes the legacy color space specification for
PowerPC.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index f27beb30e6e..3e1a7b7d519 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -463,13 +463,8 @@ - (void) drawRect:(NSRect) rect
             DIV_ROUND_UP(bitsPerPixel, 8) * 2, //bitsPerComponent
             bitsPerPixel, //bitsPerPixel
             stride, //bytesPerRow
-#ifdef __LITTLE_ENDIAN__
-            CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB), //colorspace for OS X >= 10.4
-            kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipFirst,
-#else
-            CGColorSpaceCreateDeviceRGB(), //colorspace for OS X < 10.4 (actually ppc)
-            kCGImageAlphaNoneSkipFirst, //bitmapInfo
-#endif
+            CGColorSpaceCreateWithName(kCGColorSpaceSRGB), //colorspace
+            kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipFirst, //bitmapInfo
             dataProviderRef, //provider
             NULL, //decode
             0, //interpolate
-- 
2.24.3 (Apple Git-128)


