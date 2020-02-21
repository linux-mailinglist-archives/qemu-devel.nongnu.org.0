Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C570F167E0A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 14:09:29 +0100 (CET)
Received: from localhost ([::1]:57078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j583c-0008NN-SD
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 08:09:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56447)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j5823-0006WD-15
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:07:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j5822-0002Uw-2q
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:07:50 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41637)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j5821-0002UY-Sc
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:07:50 -0500
Received: by mail-wr1-x442.google.com with SMTP id c9so1984388wrw.8
 for <qemu-devel@nongnu.org>; Fri, 21 Feb 2020 05:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=B9G9wP9yd2t33Xt2CQJ/kBsj3Yd6lYldXl2KRvMY6ks=;
 b=fWlubCz/PjHPuPsSpd7VhJ5DmSGdB1Tc3ZjTqDK7VYc+wkMX4XZf5WZSGmWMOr2f1R
 YZTCJkr8l2eWi4sTMnl7JY1GLgpCSjuwz5FmwpW/Prp33pEypAuw+Dn5iIeFAuVW7S0Z
 njyPBfnivx+wRlFQAOiU1e48IwweFDlPay3JpH4fpJZCoChzsmjQ35ur3FHN9vBJPEN8
 RkSY8yE9aEMn7y8zi8DVEgJ2Vfmi1dn85sURHygrE2/yQLdD+8Igz/Cb/fGXqwNORcOw
 yln8dh+c6T0sl9JVINR6+nTQvaxBWeY30ieLGPFiRwkMYHJbcdQvKsgxJZPxxiu3rjqG
 YNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B9G9wP9yd2t33Xt2CQJ/kBsj3Yd6lYldXl2KRvMY6ks=;
 b=ew7A+0IspT5uuD+QxVJ2mhtxpF+ySsVTZjvyRoCEW+jX66buGznBdCjQ1ypJFuksOo
 86A0f/VYabzalmJV0PGJp8tEo1RoVUQWOTbwCAWE2aeImPPs2us//y6tq4PI49kGPnJq
 ZYZvDkpfVt2RSn8ZA9QbYKkEzxQxhXxwbb+WSISmAzSSm6EuTGLI08t9hde5KYpZa2LC
 mmmLby2/VJUH+hmRsp5smJGfIJObavOE5Y3aShONnFx87LnbCLucHlfakDorApaAqP+z
 Gu6YdtDKLzsACOfMGODvxxMMhgtgWeclCnS9+mlog6Rjy6BTP+G9wWgGFnrgOqR7V4pR
 KkRQ==
X-Gm-Message-State: APjAAAVsES96GYf8JBtJpxjRqwPi15bizxaMJBAza9t782GDfCHTnuhU
 9tPLr9G5NJGpkb5y3Yhi37yHu/DFkKbpsg==
X-Google-Smtp-Source: APXvYqyCmNDKPjpaOrLY6uZR9M4mSpdzlMq+rJw5WZplzZIrm1Wigi8DMRxOF1Hk2GlK7IPZ8Ue76A==
X-Received: by 2002:adf:a1d9:: with SMTP id v25mr47782570wrv.160.1582290468546; 
 Fri, 21 Feb 2020 05:07:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p15sm3598892wma.40.2020.02.21.05.07.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 05:07:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/52] z2: Make providing flash images non-mandatory
Date: Fri, 21 Feb 2020 13:06:53 +0000
Message-Id: <20200221130740.7583-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200221130740.7583-1-peter.maydell@linaro.org>
References: <20200221130740.7583-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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

From: Guenter Roeck <linux@roeck-us.net>

Up to now, the z2 machine only boots if a flash image is provided.
This is not really necessary; the machine can boot from initrd or from
SD without it. At the same time, having to provide dummy flash images
is a nuisance and does not add any real value. Make it optional.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20200217210903.18602-1-linux@roeck-us.net
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/z2.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 34794fe3ae6..4bb237f22d2 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -314,12 +314,6 @@ static void z2_init(MachineState *machine)
     be = 0;
 #endif
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    if (!dinfo && !qtest_enabled()) {
-        error_report("Flash image must be given with the "
-                     "'pflash' parameter");
-        exit(1);
-    }
-
     if (!pflash_cfi01_register(Z2_FLASH_BASE, "z2.flash0", Z2_FLASH_SIZE,
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                                sector_len, 4, 0, 0, 0, 0, be)) {
-- 
2.20.1


