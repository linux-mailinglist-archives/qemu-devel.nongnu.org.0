Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD447C8C6
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 18:33:51 +0200 (CEST)
Received: from localhost ([::1]:42866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsrXy-0006lP-Qq
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 12:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45281)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hsrPr-0005Bd-1c
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:25:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hsrPq-0000Pr-3y
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:25:26 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35215)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hsrPp-0000P8-UI
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:25:26 -0400
Received: by mail-wr1-x436.google.com with SMTP id y4so70383353wrm.2
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 09:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3EcRLt1hOeMs35DCT9AnFf1hI7OqAUwmCSb9V9Rrwzo=;
 b=AB2l6WKzxHgRFsZ5PZAJAcK/ibVegEzzDoCy3zEIF559/7rCnSqxUx3CjonlDv/CDa
 ISrqRCauJ+zBTlBLl1dk12lzJ4Xx/JgFL3bhgvUfKlMIWCFqI+YyT4u3533Sh/SXf33O
 tg5mfW8E1e/Fmb/z4RgUMj98lfnGaZc8F9m74Ie4sbNIEr9Sg37aIsvG5IXtPtnd80zR
 Y9yGKHnNVZ/2jg/hJIO7liddESi+m8W48s13fP6gHmhrJmdBV8B5H02i3/HPyGaBt9It
 oL2APUdiEqzSbD3SjtZVLK2yASZjvMD8AafV/JQT8Ux7/SHj4RyYNmqqG2a0iKblPcqk
 lBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3EcRLt1hOeMs35DCT9AnFf1hI7OqAUwmCSb9V9Rrwzo=;
 b=UM4Vc3j1/ugPvXmL9W+/rDhUwTwhA2IrXwRv/OBKrCSqUkxC0YkRi5U1442NI5miZl
 x6Ao4NxSccb1QfxRE29LAvghy1J9B1btkpET6HK5QwuU3jWYF9aZKUtHj3uQW4MK2WlX
 l7ADMs3ev4dkoWNoV5EKsWkvv3vONJN9v/YiPJt8kBsvonYJqS2D9haP3IOO9Ql36DoH
 BInuRGc9uABhR9xf3PdpPk/uJbzCTDo8f0sadhtsztjuy+qD16UeOlXAZ5g65mWSLEgh
 n28TXBcbR8fHqHdHlJcGvMF8LTMDbNshe1U61ViBwJU23NNYc8U/jKbieQDsefOHu0vJ
 ji9w==
X-Gm-Message-State: APjAAAWWXtxoLJUafRjf8fiknbzmjkBT+AjUoAILZ7UEp9TfSFxKELWv
 nQzUsCoozkoLMN+NO6yJzeXY5Q==
X-Google-Smtp-Source: APXvYqyHNEn8K2uJNImDkMwQwHbJuE652ANIAoiFhmGUhmI1DteCEDwddkmLv5whIS49IQlDwGvfsg==
X-Received: by 2002:adf:9ece:: with SMTP id b14mr85957473wrf.192.1564590324820; 
 Wed, 31 Jul 2019 09:25:24 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id l17sm47513042wrr.94.2019.07.31.09.25.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 09:25:22 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 710331FFA9;
 Wed, 31 Jul 2019 17:07:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 17:06:46 +0100
Message-Id: <20190731160719.11396-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731160719.11396-1-alex.bennee@linaro.org>
References: <20190731160719.11396-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::436
Subject: [Qemu-devel] [PATCH v4 21/54] atomic_template: fix indentation in
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
 aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, bobby.prani@gmail.com,
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
index 313a4c7ed97..53899bbbc21 100644
--- a/accel/tcg/atomic_template.h
+++ b/accel/tcg/atomic_template.h
@@ -284,7 +284,7 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr,
 
 #define GEN_ATOMIC_HELPER(X)                                        \
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
-                 ABI_TYPE val EXTRA_ARGS)                           \
+                        ABI_TYPE val EXTRA_ARGS)                    \
 {                                                                   \
     ATOMIC_MMU_DECLS;                                               \
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP;                           \
-- 
2.20.1


