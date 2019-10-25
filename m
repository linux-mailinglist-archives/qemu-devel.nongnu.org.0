Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7290E44B0
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 09:40:04 +0200 (CEST)
Received: from localhost ([::1]:56970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNuCZ-00050F-EI
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 03:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38212)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iNtWa-0003PU-9B
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 02:56:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iNtWZ-0007iL-90
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 02:56:40 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:37036)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iNtWZ-0007fJ-2j
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 02:56:39 -0400
Received: by mail-wm1-x32e.google.com with SMTP id q130so808311wme.2
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 23:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T2JS5tpytl0ipi63acoLVuF4tI9OGVeaa1yG5nPh+p8=;
 b=g+2HT04wtDnVWJWN3ti1IWJObmTzDbVFpunoVejBtF2unoTBiVvJGcLv+QZ6mu9HJl
 CDCP7HB9U0sgUYnClrtOZtM0bJU7UqSDWIDJEErzdjYkoBv6V7t5JQZYFf3KP/V0C8Hl
 h69CgheTLA3NZFAxqMMcm+xValOePtkUjrRv3hCf5xgszJUiX+VL4WOwgvLBipo2IZEc
 RlZt41GUP8SSP8gC0lNRmrakDijFsIP2PmHRg/X7cvvlS17EeI/3pnUDjNs42Q0N4Qc6
 d/jbo8OQbVF5oEGK3BP/Kv/KgS7lO3UyWY7DOdSH4nHUSnkHwATVvdp/Q7ShLwjGFH5t
 pVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T2JS5tpytl0ipi63acoLVuF4tI9OGVeaa1yG5nPh+p8=;
 b=pX95sXjPwY3/a92cIAC+6dpnzMx8lOQt8fA7Md3n/z00Dis0UTuQBvTO5JK4bbT1B7
 8+2D40DsYU06h5p3yNMQ4GTnTCs9+gGZzVoVByZwrQOW0tqLG6SLaUT9nmPzt/q9Mp59
 t0QvIfHIDg+iPcyqewnFjMUih1MZR9JiVIkUmp2ifjLeVJ6i5QHI/BwYWQbsEVq9PZQf
 PKQgnkDK0Y7O6sRWtq7Gtnk8SJfHKUTV3kIP3A1pqwcT71vgv9gxKfkAdaaNw8nmXRey
 J+s5CCNV3T4EAZi/uAldt2EexJsXsdANQ5uIz/wGOEZ+nfdlAQ0ziuMCaYKITgKjxqqL
 Dymg==
X-Gm-Message-State: APjAAAVYB9995A8ymOjEIwnRFOv+hN0YJc4SZdObG6D+deWjju1x5TTt
 lTgD+zh/5F9zp57FSgo35akdAw==
X-Google-Smtp-Source: APXvYqzeqkj+Df+Cqsby9Qwm1zEZgq4USyXtVp2bLJhQAC2Vzq7nLElwFJZXjGHYt0s92wT9hpm3Lg==
X-Received: by 2002:a1c:e154:: with SMTP id y81mr1923565wmg.126.1571986598038; 
 Thu, 24 Oct 2019 23:56:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q18sm1034542wmk.39.2019.10.24.23.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 23:56:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 050211FFC5;
 Fri, 25 Oct 2019 07:37:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 45/73] target/m68k: fetch code with translator_ld
Date: Fri, 25 Oct 2019 07:36:45 +0100
Message-Id: <20191025063713.23374-46-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025063713.23374-1-alex.bennee@linaro.org>
References: <20191025063713.23374-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32e
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
 "Emilio G. Cota" <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 24c1dd3408a..fcdb7bc8e4e 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -384,7 +384,7 @@ static TCGv gen_ldst(DisasContext *s, int opsize, TCGv addr, TCGv val,
 static inline uint16_t read_im16(CPUM68KState *env, DisasContext *s)
 {
     uint16_t im;
-    im = cpu_lduw_code(env, s->pc);
+    im = translator_lduw(env, s->pc);
     s->pc += 2;
     return im;
 }
-- 
2.20.1


