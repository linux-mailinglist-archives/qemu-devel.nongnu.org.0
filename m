Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D3CBF953
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 20:39:55 +0200 (CEST)
Received: from localhost ([::1]:42592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDYgE-0001KC-6A
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 14:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41865)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iDYcQ-0007rv-OS
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 14:35:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iDYcO-0006L8-Uo
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 14:35:58 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39242)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iDYcO-0006K5-K3
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 14:35:56 -0400
Received: by mail-wm1-x332.google.com with SMTP id v17so3621543wml.4
 for <qemu-devel@nongnu.org>; Thu, 26 Sep 2019 11:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ov3u3ezyjcCtxOd7uFlkTeMqTxqDHxZSRy3AZWqjwuI=;
 b=SSiWHvMTzGwrfQCMUHt6lV+mpNivJ3VO+EKiUhQs1LaNWbxb1c/LBp3lZw3Zx0is91
 zzlAayhKFtya6fNO/kPt5eDmReFyL+kTNspNR1iYUCL0XWD2foOKebXVl4uSV+gaT1F1
 koOaNrtrSy2Jx2OEv1wXj3kcyRrzPW/KJ0216KT9pjVNSY5oqVlcLOM30AZXhVgQt2zM
 MnTiwGX2a1iRoHr/sC9Ke9OKm4U/vFZD4CC0nq5j3fHOXtThaQ1uxeizFX0B5Fkdhpwk
 k/UOqNtgIrNGBxY8eNTcDILMnVMxzLhfxuIyMR7qf/96AcYf3GcgPAX1jdb5FFV1xNKa
 UCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ov3u3ezyjcCtxOd7uFlkTeMqTxqDHxZSRy3AZWqjwuI=;
 b=ay4gp+3nKNYmx0m/3o2SK58oGjNiiel5KaAiiuBhwFsqQdbZRAHqdLvt5JM0q+esfT
 26wmIiUmN3t/pJs93jYCHG+v5E51miLz9ZAYr+/KI/Z6j+kdIK8DtReqjCT8pCd99Ne+
 Mf7eSKcDhTx778vwObuMH05PjUsgXsFTuA7WJwAiQpoZPyy7L3rJXGFpYyNrSB1/DE5N
 pHI53Xok/ZElyEtnNYexdjIzwNzW8fmEhJ6it6ADmSCc6QYMQgt+ohSBlvinkuiOaSqa
 aaWb8XyHattCAzx7ZLRGeIgug9OkAxJ+TkR6giVxW+TiD8HcwDYG9G9aPqqEZdMCT5/j
 Goeg==
X-Gm-Message-State: APjAAAX3mLAf5Il4mZyeXAs3hOhsCZhrVFfz+C0ThQ+tSjTugMB3Pz12
 oPtbzn/t9QXc2Zs8aDuczgQJuQ==
X-Google-Smtp-Source: APXvYqxC4MAzos2IvMIsczkGU3q+Md9/KRyAAs/AqHOc6nOR0tVckJwHYj749lCl09g9+vPVhjnCGA==
X-Received: by 2002:a1c:2089:: with SMTP id g131mr4026584wmg.33.1569522955271; 
 Thu, 26 Sep 2019 11:35:55 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x5sm50650wrg.69.2019.09.26.11.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 11:35:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 649EE1FF8F;
 Thu, 26 Sep 2019 19:35:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 02/28] target/alpha: Fix SWCR_MAP_UMZ
Date: Thu, 26 Sep 2019 19:35:27 +0100
Message-Id: <20190926183553.13895-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190926183553.13895-1-alex.bennee@linaro.org>
References: <20190926183553.13895-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::332
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

We were setting the wrong bit.  The fp_status.flush_to_zero
setting is overwritten by either the constant 1 or the value
of fpcr_flush_to_zero depending on bits within an fp insn.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20190921043256.4575-3-richard.henderson@linaro.org>

diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index 6c1703682e..10602fb339 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -71,7 +71,7 @@ void cpu_alpha_store_fpcr(CPUAlphaState *env, uint64_t val)
         env->fp_status.flush_inputs_to_zero = 1;
     }
     if (env->swcr & SWCR_MAP_UMZ) {
-        env->fp_status.flush_to_zero = 1;
+        env->fpcr_flush_to_zero = 1;
     }
     env->fpcr_exc_enable &= ~(alpha_ieee_swcr_to_fpcr(env->swcr) >> 32);
 #endif
-- 
2.20.1


