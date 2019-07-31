Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6877C8AB
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 18:29:17 +0200 (CEST)
Received: from localhost ([::1]:42774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsrTY-0006IL-Lc
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 12:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45130)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hsrPk-0004rI-0o
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:25:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hsrPi-0000K1-VX
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:25:19 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:42668)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hsrPi-0000Iz-Ol
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:25:18 -0400
Received: by mail-wr1-x441.google.com with SMTP id x1so20468004wrr.9
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 09:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6rBgm6yeoP4dSiIy9CSawJxQKN5hehrRgPjAazWUJvg=;
 b=OJr6W4aF4LvhNjVK1hCkkFmZgQP9e6wbXNdnO2MZgZNyOxXhAqYS/K3wI0s8Hbk2Fs
 jCzUZPw78pbnnlsENV3YB11PuFHzD8Zoy0NkQbrhFPYQcWYuWM5q31jqzYkyFk9ca3yc
 SqcF0OBDS/ig7Xp7ygtGafRlNYgmPXrHhLFAnE/Iu0NtIU4VjzGV5qFeJBev0GkAOK4l
 g1K3/PhKuLvpETKpjarTWRKavoEFmuG/iLMsxW4nAqsS9/+eTpAeQtYInZ7vmjtxCJqe
 lmriFRRCvS4cvAixFDvsryIG4MRI6JBa0mipU3Ku2ffUrvD/6WF7itExGt5zf3CCa7jb
 vHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6rBgm6yeoP4dSiIy9CSawJxQKN5hehrRgPjAazWUJvg=;
 b=lg6xwmIFfJo1IuWiHByfUtDxgSZbSqlByEVBuqjgjV2/OGnj5Gt737XaKZO28uYGxQ
 LdhBzWkNQAC5Qnk9cgtdWSi8BeSExHfKXYBY8Pg0rWMxCqVzd7u6hjSYSZUtUuvV3mN+
 G7nGOnquXNEr1eamBcZFqNemA15fZ/x2TOYVtDtP4nnBxArzFNYAWRHQZj6DrpkvMqeW
 dTUwfyD4aK+r/upa3VKLxR4mipkTNSBjyPNtKrfReMKA/D4rU7GCOl4GHoI27dfTIU6E
 wXhPmMlY9Ef6VdmmzOOQ5mqN0qGnKlKh5XXqsVjeYCMgwGjk4Yw4utNSTtWgA59iAmc8
 zcpw==
X-Gm-Message-State: APjAAAVNzs84L9xPSilTwKENpu2X5TAIT3XTEAAdurI/yhJBKQw6Q4Mx
 p2YU/ouPBPxP3AAhCchLylwYTpkwQJQ=
X-Google-Smtp-Source: APXvYqwxDYOiTdll1q5kYxnUFXr+mgD1tt3VhB701NmMYKXG0o9Oy+E4itq9UKqE9MQtWwMXvO7xVA==
X-Received: by 2002:adf:eb0f:: with SMTP id s15mr58680526wrn.324.1564590317693; 
 Wed, 31 Jul 2019 09:25:17 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id t63sm62676709wmt.6.2019.07.31.09.25.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 09:25:15 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AB41D1FFB8;
 Wed, 31 Jul 2019 17:07:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 17:06:59 +0100
Message-Id: <20190731160719.11396-35-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731160719.11396-1-alex.bennee@linaro.org>
References: <20190731160719.11396-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-devel] [PATCH v4 34/54] target/i386: fetch code with
 translator_ld
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, aaron@os.amperecomputing.com,
 cota@braap.org, Paolo Bonzini <pbonzini@redhat.com>, bobby.prani@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/i386/translate.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 03150a86e23..bf4cd875aba 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -1925,28 +1925,28 @@ static uint64_t advance_pc(CPUX86State *env, DisasContext *s, int num_bytes)
 
 static inline uint8_t x86_ldub_code(CPUX86State *env, DisasContext *s)
 {
-    return cpu_ldub_code(env, advance_pc(env, s, 1));
+    return translator_ldub(env, advance_pc(env, s, 1));
 }
 
 static inline int16_t x86_ldsw_code(CPUX86State *env, DisasContext *s)
 {
-    return cpu_ldsw_code(env, advance_pc(env, s, 2));
+    return translator_ldsw(env, advance_pc(env, s, 2));
 }
 
 static inline uint16_t x86_lduw_code(CPUX86State *env, DisasContext *s)
 {
-    return cpu_lduw_code(env, advance_pc(env, s, 2));
+    return translator_lduw(env, advance_pc(env, s, 2));
 }
 
 static inline uint32_t x86_ldl_code(CPUX86State *env, DisasContext *s)
 {
-    return cpu_ldl_code(env, advance_pc(env, s, 4));
+    return translator_ldl(env, advance_pc(env, s, 4));
 }
 
 #ifdef TARGET_X86_64
 static inline uint64_t x86_ldq_code(CPUX86State *env, DisasContext *s)
 {
-    return cpu_ldq_code(env, advance_pc(env, s, 8));
+    return translator_ldq(env, advance_pc(env, s, 8));
 }
 #endif
 
-- 
2.20.1


