Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A36167E17
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 14:11:56 +0100 (CET)
Received: from localhost ([::1]:57206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j585z-0004aY-Oo
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 08:11:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56487)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j5827-0006f3-7u
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:07:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j5825-0002Wp-Pz
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:07:55 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:45946)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j5825-0002WM-Ja
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:07:53 -0500
Received: by mail-wr1-x442.google.com with SMTP id g3so1977158wrs.12
 for <qemu-devel@nongnu.org>; Fri, 21 Feb 2020 05:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=B8FETunjdDzohDWrvxwGEHSQ/75b6YPRtF3e06IhvLQ=;
 b=e+gDthJf8CtX/fw9I0E6R7UjxY6ekWZg77lR+BHzWHoSXwey9pr9ny69Sbem3hAdcu
 Vc9bdxNn3BTXIpGqXz+JYbXfqG+3Dbp5nbfaZhwZgSQHBSfOQMOdL6bROwVFsApizhXh
 0EF43GkHWtharvEVqXchS/f6W+Nrscal+awsyb40VKO3zjIt/9YwIe9le0ztWyYfPyPk
 UEM859eLG8+DJsHtJT8pZdWnpepRcmmu9GeeelsjLEwfgl4Bd+Saaf1qKXUK1eAaqx8J
 UNs+FFPU76LOzXvxm/+g62hM6I/x8lZA0pOwdM9qpcgAqJ3xcDHGw1IRBOi1WLBhWTMI
 Qt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B8FETunjdDzohDWrvxwGEHSQ/75b6YPRtF3e06IhvLQ=;
 b=WbqtZ75DQceHsYU7xtBB98/RUro21nKiccmbrDRtAbBZZfTSji2SB+7RP8vqQgnYBi
 F2TbWzKo265emkPMV9vPY3aGxw7byrtRdZpZq408qIuJfNIrQRnca2uTa0p44OzUEc4M
 xpa6o6fiGdK8JElKpzdAGazFtvjuxH4bUSRiSgmYwvx4yvQh2uHCKX4YDeCb5rbOwuuB
 Q/TK9MtPP9BE0pp1nnBx8hmrqcMZjHsOcBu2g+HXdWkgp1XmNKPV9nF7SqJ7DASBDvMo
 L3vbphko2MFTnFDDW3gEpBvXEFGjXqeq3tFGaO7CmuWWRrWwX5Vip2n6O1BW1u4GYR0s
 uyvg==
X-Gm-Message-State: APjAAAVvaY4YRCcgBPsRUEz1molNatpBLx/qybJ4l7s5Qsb76/5T/4wG
 2nZS0Z4X1GNxOGfZZuDUJ6NFKXcSYw2tXw==
X-Google-Smtp-Source: APXvYqxnbIoXnB0IlBm/kWORNwpdz/3c1o7+qEsvXWbdeyiSbuAMmLv+jjt+mhXGl0TLP3PclxDL2g==
X-Received: by 2002:a5d:6703:: with SMTP id o3mr46556882wru.235.1582290472303; 
 Fri, 21 Feb 2020 05:07:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p15sm3598892wma.40.2020.02.21.05.07.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 05:07:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/52] target/arm: Flush high bits of sve register after
 AdvSIMD ZIP/UZP/TRN
Date: Fri, 21 Feb 2020 13:06:56 +0000
Message-Id: <20200221130740.7583-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200221130740.7583-1-peter.maydell@linaro.org>
References: <20200221130740.7583-1-peter.maydell@linaro.org>
MIME-Version: 1.0
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

From: Richard Henderson <richard.henderson@linaro.org>

Writes to AdvSIMD registers flush the bits above 128.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200214194643.23317-4-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 096a854aed7..b83d09dbcd7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -7054,6 +7054,7 @@ static void disas_simd_zip_trn(DisasContext *s, uint32_t insn)
     tcg_temp_free_i64(tcg_resl);
     write_vec_element(s, tcg_resh, rd, 1, MO_64);
     tcg_temp_free_i64(tcg_resh);
+    clear_vec_high(s, true, rd);
 }
 
 /*
-- 
2.20.1


