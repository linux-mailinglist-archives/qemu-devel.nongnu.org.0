Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BD317AAA3
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 17:37:33 +0100 (CET)
Received: from localhost ([::1]:52542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9tV6-0005S2-V7
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 11:37:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59101)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j9tOy-0003JI-2T
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:31:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j9tOw-00028Z-UQ
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:31:12 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40535)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j9tOw-00027U-MR
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:31:10 -0500
Received: by mail-wr1-x444.google.com with SMTP id r17so7794267wrj.7
 for <qemu-devel@nongnu.org>; Thu, 05 Mar 2020 08:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8houcYe7KUIwDQbN8/wwPDt2OpHbE7pOYm4MOnfdoYo=;
 b=RIZVL8OYDiYAtvZS31rqRtTKmduNqaZ+5WOcIodDasjLup6BjxrfhMrQZrvXzOZc/7
 mQL4DjU7mCvTxtHWiOlj6VDnSqT1hwDST5vughJedZ6sbktL7hVI/uCVzu5rHwnqN9KN
 2W31bty/kf2LMYriSy0UhBRi3Gd867+0OpSYR1eRyv4Qlp1yyIWi3B6feufeR3Adz729
 RZF4EiRVBHcZzJ/xKok6HCay0i+90aHltjtG195Hz+jGvEgLhy9vZWAOs3ghZi2pdfP9
 eKXPGHmBZpVTjSnbwnC4Oxc4cgBxNIUgk1jkb+gy5srXc08Gi269ce3sEGy1FdxqRedq
 Tm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8houcYe7KUIwDQbN8/wwPDt2OpHbE7pOYm4MOnfdoYo=;
 b=J8ZURqnMVW0ttqpOPn/SHADT3LB3URoAkffXlM7sN++Ca9dNwYnWsVfZPKq2zBWkjs
 8v5tXdOGcsv6mLoi33f/cq8e6P1PB83IUjfyMsQqW27ngUsEeByoSiYrOTpdBfp4vveP
 JCxzGEDsPE8LdszMoVzrDx1mPIXI/fcDMMhMxmxZhAMKbkGCtJI8UZVRM0IbYDU/cCBq
 W3CyxwPa1n/TTkgwCkhoYD212dFQthQPPrAnvvT6MqdbhGKJnCdaqGm1YAx/DCqIba5v
 QPmhakTJnTcGxZUDXo/EXXu2mr7DoyWOix7n0WAVrAJFrB14Wkbj6b1D7Yjgs4Ng7nrC
 XHag==
X-Gm-Message-State: ANhLgQ3wFk7sLDKCibxmu+2sETq4ISiZ2g6yjYSVihvOd0AY97Ro+wES
 H3UGxsgaO1rFJeoyCZDB9smh8cEKkkYxgQ==
X-Google-Smtp-Source: ADFU+vuar8lwv6spxGxa9C1oKTSQWIBPXhMEOIxL8HB5UhgGfQ044Xi9MbalxkSAl54CX/wz9+8wvw==
X-Received: by 2002:a05:6000:106:: with SMTP id
 o6mr10960969wrx.120.1583425869156; 
 Thu, 05 Mar 2020 08:31:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w22sm10310729wmk.34.2020.03.05.08.31.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 08:31:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/37] hw/arm/gumstix: Simplify since the machines are
 little-endian only
Date: Thu,  5 Mar 2020 16:30:29 +0000
Message-Id: <20200305163100.22912-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305163100.22912-1-peter.maydell@linaro.org>
References: <20200305163100.22912-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

As the Connex and Verdex machines only boot in little-endian,
we can simplify the code.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/gumstix.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index f26a0e8010f..3a4bc332c42 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -51,7 +51,6 @@ static void connex_init(MachineState *machine)
 {
     PXA2xxState *cpu;
     DriveInfo *dinfo;
-    int be;
     MemoryRegion *address_space_mem = get_system_memory();
 
     uint32_t connex_rom = 0x01000000;
@@ -66,14 +65,9 @@ static void connex_init(MachineState *machine)
         exit(1);
     }
 
-#ifdef TARGET_WORDS_BIGENDIAN
-    be = 1;
-#else
-    be = 0;
-#endif
     if (!pflash_cfi01_register(0x00000000, "connext.rom", connex_rom,
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               sector_len, 2, 0, 0, 0, 0, be)) {
+                               sector_len, 2, 0, 0, 0, 0, 0)) {
         error_report("Error registering flash memory");
         exit(1);
     }
@@ -87,7 +81,6 @@ static void verdex_init(MachineState *machine)
 {
     PXA2xxState *cpu;
     DriveInfo *dinfo;
-    int be;
     MemoryRegion *address_space_mem = get_system_memory();
 
     uint32_t verdex_rom = 0x02000000;
@@ -102,14 +95,9 @@ static void verdex_init(MachineState *machine)
         exit(1);
     }
 
-#ifdef TARGET_WORDS_BIGENDIAN
-    be = 1;
-#else
-    be = 0;
-#endif
     if (!pflash_cfi01_register(0x00000000, "verdex.rom", verdex_rom,
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               sector_len, 2, 0, 0, 0, 0, be)) {
+                               sector_len, 2, 0, 0, 0, 0, 0)) {
         error_report("Error registering flash memory");
         exit(1);
     }
-- 
2.20.1


