Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFABBAB85E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 14:50:50 +0200 (CEST)
Received: from localhost ([::1]:55816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6DhR-0000zK-M8
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 08:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54719)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i6Ddy-0007Lb-LC
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 08:47:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i6Ddw-0005uh-3e
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 08:47:14 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:39104)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i6Ddv-0005qa-CD
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 08:47:11 -0400
Received: by mail-wm1-x342.google.com with SMTP id q12so6965351wmj.4
 for <qemu-devel@nongnu.org>; Fri, 06 Sep 2019 05:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hEwLxmZ1/l0uu9kShjHwMMLEdP39KievYwY8GQL60m8=;
 b=ISykOZyoibJVDfT6r5ER/Cdm3h0RYkfNxSmE+rhXbYyZkgRHh4yE3UlbvriKbbgMwz
 GP6wkhrfpFp8pd0ksP5zAT6o7mdM3obF11ynirNwIeBBH4M9+kxyuLhM8aP60evV31Kz
 XT3Kgj4GLOCMADjy4Cc6MLCiyxqpjrT9XXl9em0ckyRhabV26TBzC15z4yBptJLgvmzL
 zKNu98Jfg4d4naOEbtxpX8V01HOlTzazsk20OXgKG7T08wEGl+lpeH64jilqNY5NmFE4
 vG70thB3FzsfDNvxi12OB4BT24SXlYwivf+FDGBNH9sdfisSrYs9OMn9/KeoBGuMhhhr
 UUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hEwLxmZ1/l0uu9kShjHwMMLEdP39KievYwY8GQL60m8=;
 b=o8EE8Vd8A8sEHraS7s+IWZuwpCovgVcp9jFBqd+3FPwxx76rgTe/51/s8//TwSWCAY
 EiW6t6D+rHcw9CaObRFE5jhXqIgq8cLtxYujD7EeMjAMbV7bQjtpQ6yIW1wtyg+GvY37
 NWMNY+sD1v21Y3QRuhr4z2OREDnKSvW9i8tZXC5yNDVs9uFgEEoXeysun4IbwJfIVkzt
 npUAiNrWkJecf9BfY6aYYVdUQN0zL7kbRuNcZRrRzOb/LVE8kcwaHU5iiH7PO4i7VcpS
 EV+kgshOzphq0zLK7bV7AwKNwodMfFK1d8d+EA6gNTYZd7pNENVNz7zaiSV+++Y/oETO
 Ps4w==
X-Gm-Message-State: APjAAAXOtlt6J1JMDBCxkZUiomFNg50+S8DUksJF7zVHyrTLJx+k1okI
 LWJBDbCuI1ZDaTX8ht8gGNtv+Q==
X-Google-Smtp-Source: APXvYqxfo06XiGkIY5264Adx2bgXrmb/sVFOSUGHcvmR48xOMRusHk6ba/4XgAyxjPNiFVxx4IOdlQ==
X-Received: by 2002:a1c:1d85:: with SMTP id d127mr7590265wmd.14.1567774029855; 
 Fri, 06 Sep 2019 05:47:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l1sm6733467wrb.1.2019.09.06.05.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 05:47:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0F9861FF91;
 Fri,  6 Sep 2019 13:47:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Fri,  6 Sep 2019 13:47:06 +0100
Message-Id: <20190906124706.19145-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190906124706.19145-1-alex.bennee@linaro.org>
References: <20190906124706.19145-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH v3 4/4] atomic_template: fix indentation in
 GEN_ATOMIC_HELPER
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/atomic_template.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
index df9c8388178..287433d809b 100644
--- a/accel/tcg/atomic_template.h
+++ b/accel/tcg/atomic_template.h
@@ -149,7 +149,7 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr,
 
 #define GEN_ATOMIC_HELPER(X)                                        \
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
-                 ABI_TYPE val EXTRA_ARGS)                           \
+                        ABI_TYPE val EXTRA_ARGS)                    \
 {                                                                   \
     ATOMIC_MMU_DECLS;                                               \
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP;                           \
-- 
2.20.1


