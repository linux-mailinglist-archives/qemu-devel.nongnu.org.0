Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2903A16306E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 20:44:44 +0100 (CET)
Received: from localhost ([::1]:41142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j48nT-0002aC-7z
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 14:44:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55208)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j48ic-0003hz-8G
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 14:39:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j48ib-0004Qo-7J
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 14:39:42 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:35795)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j48ib-0004PT-1R
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 14:39:41 -0500
Received: by mail-pl1-x62a.google.com with SMTP id g6so8487794plt.2
 for <qemu-devel@nongnu.org>; Tue, 18 Feb 2020 11:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oZO5RKA9Grp6ITlGi7FVOEFNRvhDdW0o8hVNMgXHdmY=;
 b=z5PZcdM3GwfshQMTb+zkOYVWQxLMe8XtkmZqYkJdrc92e/r8MZUVqGsfVy9QAbBAAf
 /yvajMui0bQH9bVNuH539y0Ce8CedmHmiO5zmiwosDHjFfxOqb/TPpYXAQr1IXfc4FIQ
 OKCyCbXJ77pbWZ+6UsbXdKOFGPJL1heXOmi+xovIztzXx9+2aXKvQlsA/oQhOGV92prL
 /FHNURWpHnW28ywc7QsXzNquhaXqt0Vz7bSkyy4Qmzwh8jwy6h47/5Fw5ZutD6rky9ZS
 YI7JVVnG6Smm25aaNJfyDYfI4gmXsZnLFv/J1IkYAiZfxKSbEHT46Xbr791zWNFdxf7E
 0Zrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oZO5RKA9Grp6ITlGi7FVOEFNRvhDdW0o8hVNMgXHdmY=;
 b=azVHyeTk2uI5MwCXkfBKv3ZT3j6KkiyCsTk0L9f2y6dvWrXYIea2J2tbN972c6Den3
 K9xYu3EAoiybl24IbOh/lUKX4XrC+EOYRFguHprGKn5NEED2oM0rw7ebPQtRso1GAl+4
 FSqR3DxWUiqDrMUgVcJUY2XrbZf6AJNtcZqPiuJMTOjDJj4R6M5NmEz11d/7TknKqvz8
 odPAfgdvz71GOBjmh3mo15voNGS8eyFGCeMg7D7wWkCy/e5eD0aje7ju6ZnRZmJBZrvi
 gqU0cGerTNLuh+IJ3DfQAKLirEvzD6yv5W6O4snCfw8bgJB7cb3zeWapfo+28+8UeaXZ
 sbYA==
X-Gm-Message-State: APjAAAWgmPRIA83lXY+SvYNcQC6oOfPRKGS0voCqE4KA/iEglK0OwJji
 H2VtXoyUl+Ir3g9FpuVQDuoTwcA0WU8=
X-Google-Smtp-Source: APXvYqxlpeMl5Vr3NbRjwzUh7EVnLc0egj8jw7aF5cye/pcUh5850dJGtrBvmOowzSmvkzFJ47rtrw==
X-Received: by 2002:a17:90a:db0b:: with SMTP id
 g11mr4395370pjv.140.1582054779627; 
 Tue, 18 Feb 2020 11:39:39 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id y15sm424395pgj.78.2020.02.18.11.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 11:39:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 6/9] hw/hppa/dino: Add comments with register name
Date: Tue, 18 Feb 2020 11:39:26 -0800
Message-Id: <20200218193929.11404-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200218193929.11404-1-richard.henderson@linaro.org>
References: <20200218193929.11404-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::62a
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
Cc: peter.maydell@linaro.org, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Add a comment with the name of each register in the 0x800-0x8ff range.

Acked-by: Helge Deller <deller@gmx.de>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20200218063355.18577-2-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/hppa/dino.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index 9797a7f0d9..c237ad3b1b 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -85,18 +85,18 @@
 
 #define DINO800_REGS ((DINO_TLTIM - DINO_GMASK) / 4)
 static const uint32_t reg800_keep_bits[DINO800_REGS] = {
-            MAKE_64BIT_MASK(0, 1),
-            MAKE_64BIT_MASK(0, 7),
-            MAKE_64BIT_MASK(0, 7),
-            MAKE_64BIT_MASK(0, 8),
-            MAKE_64BIT_MASK(0, 7),
-            MAKE_64BIT_MASK(0, 9),
-            MAKE_64BIT_MASK(0, 32),
-            MAKE_64BIT_MASK(0, 8),
-            MAKE_64BIT_MASK(0, 30),
-            MAKE_64BIT_MASK(0, 25),
-            MAKE_64BIT_MASK(0, 22),
-            MAKE_64BIT_MASK(0, 9),
+    MAKE_64BIT_MASK(0, 1),  /* GMASK */
+    MAKE_64BIT_MASK(0, 7),  /* PAMR */
+    MAKE_64BIT_MASK(0, 7),  /* PAPR */
+    MAKE_64BIT_MASK(0, 8),  /* DAMODE */
+    MAKE_64BIT_MASK(0, 7),  /* PCICMD */
+    MAKE_64BIT_MASK(0, 9),  /* PCISTS */
+    MAKE_64BIT_MASK(0, 32), /* Undefined */
+    MAKE_64BIT_MASK(0, 8),  /* MLTIM */
+    MAKE_64BIT_MASK(0, 30), /* BRDG_FEAT */
+    MAKE_64BIT_MASK(0, 25), /* PCIROR */
+    MAKE_64BIT_MASK(0, 22), /* PCIWOR */
+    MAKE_64BIT_MASK(0, 9),  /* TLTIM */
 };
 
 typedef struct DinoState {
-- 
2.20.1


