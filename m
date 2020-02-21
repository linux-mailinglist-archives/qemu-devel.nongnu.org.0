Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC8B167E22
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 14:13:13 +0100 (CET)
Received: from localhost ([::1]:57250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j587E-00072A-J0
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 08:13:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56476)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j5825-0006bu-Sn
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:07:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j5824-0002W8-SW
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:07:53 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36596)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j5824-0002Vm-Mu
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:07:52 -0500
Received: by mail-wm1-x341.google.com with SMTP id p17so1776516wma.1
 for <qemu-devel@nongnu.org>; Fri, 21 Feb 2020 05:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DxdO7EU52xd3l5dM1HO6ldFtWdD2ROmRpEMpsBaKfGc=;
 b=w4KI827aC8d2X/kqG1eJviq5sBTgfcslYEyuzjtlK6vi6zkX6r+YdujR7Lf9SxHu0l
 YwHBHxoE9e3+bIMt6RMnLgexFgvRGkQtPj5tooT25WUYoctU7c/IjUyi6JA29su++1WR
 Yj+nYIgRkS7BQc6jrrDpec1qI+/QddIK23kg7XmWQXWTGlr1022IuBAiaf+zvvRQl6x5
 YlgzQu/opojExWBaobwOEcnail5MWWJxCKByfhDjLnq2M1sa+moekq3ECrgHlxCnZkZN
 8cgFYVR2ImTOkwaoA1K93C+cSSUdD6e1y1EvV942kgkaCv6uIREibhDxSF6y3fXVGgSC
 po8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DxdO7EU52xd3l5dM1HO6ldFtWdD2ROmRpEMpsBaKfGc=;
 b=sSZLXi/H3ZR0leoffympUA5RCz3cpgRPYl7ysLnjZ7GPb0H5psbHpktHGpEkzYNQkz
 125t2EWhoLuTLAD8VKoOLga20VFdR2DrYe+/NXc/c1fDxXZoMPjJIdyqaKXMQeNUSEi1
 rPv2P3Ff5pXFYtZsgtE3J8ElTCTs8ycX5sobEmoL+GdKQGVHIVHe4C3npQTyTgGEnGpx
 u/xXZf0B+aki1zEFE5TJgU6YiAYVV/gCXEi9Y/sIabJx/TNvH5HIRrp7npVZFcE9NCTf
 y+5QOmlZioR3UdJpK9ZrTOsnLv4LRBBmiPf2727dQSns6VXYgcsrDm+m3l7G0KbUsZM1
 mpfw==
X-Gm-Message-State: APjAAAWggwqiGDvVtcvFzDvve/Z55ivgXTefTB+x1rk9hsqfFHzDJpOU
 1sDq8PGLWo437ZIKAXL7fRx4oBJCN6E1JQ==
X-Google-Smtp-Source: APXvYqwHHQTlduBU9Fiz62M8sK5flmled3nrVC4c+ie65EBSYAder/uPOie4vcYv+brI7xep1dFA2A==
X-Received: by 2002:a1c:238e:: with SMTP id j136mr3736756wmj.17.1582290471292; 
 Fri, 21 Feb 2020 05:07:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p15sm3598892wma.40.2020.02.21.05.07.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 05:07:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/52] target/arm: Flush high bits of sve register after
 AdvSIMD TBL/TBX
Date: Fri, 21 Feb 2020 13:06:55 +0000
Message-Id: <20200221130740.7583-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200221130740.7583-1-peter.maydell@linaro.org>
References: <20200221130740.7583-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Message-id: 20200214194643.23317-3-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 620a4290671..096a854aed7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -6964,6 +6964,7 @@ static void disas_simd_tb(DisasContext *s, uint32_t insn)
     tcg_temp_free_i64(tcg_resl);
     write_vec_element(s, tcg_resh, rd, 1, MO_64);
     tcg_temp_free_i64(tcg_resh);
+    clear_vec_high(s, true, rd);
 }
 
 /* ZIP/UZP/TRN
-- 
2.20.1


