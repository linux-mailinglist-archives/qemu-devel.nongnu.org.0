Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BC1466B8
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 20:00:10 +0200 (CEST)
Received: from localhost ([::1]:53932 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbqUj-0002zm-4t
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 14:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34064)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hbq0J-00076X-QC
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:28:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hbq0H-0003zK-Ak
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:28:42 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45297)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hbq0F-0003jn-LU
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:28:40 -0400
Received: by mail-wr1-x444.google.com with SMTP id f9so3316794wre.12
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 10:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6P43XFojefi1AlRvRGu6U5nFz+CBkKm3yL3ZJgj6xbU=;
 b=D7sTN8MzBLAHNKpUlI2YFWHFJcOSeugjwk0VvXAAUxQMfcJ/SPpSKZ3/uLe799EzlA
 jBtu6vs7Jh0pPB6ZQ2erWrztSE8KVByfVh32lDQNjxc9cQXI7j34FQF2HY63zX5+452G
 1JmsUJ8tjFWBLWGQtNSx4u68EKZm4eIiB3H9bmyAtPJCA3tKE15uQIY0XVEvkfoTx3G5
 0KhUhvA0UZjgO+WS+T+w56cNkQ6DnYMpva+8LJ6oQqfmaRpTwk+NOdJ122NQuE1kcKMU
 +zdtWiGRiZcwbFRMcUTBqEyRsXyt6Er90UvJoLjfKoxEb9yMV3uOUJomImiugtLxkgXB
 QaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6P43XFojefi1AlRvRGu6U5nFz+CBkKm3yL3ZJgj6xbU=;
 b=XP1P7fqO3shiwhNes1ROV77stqKsYuihtDxM2HBANTFyrCyY2bKZfqWcJ6nWxWSosb
 rtIlKtEn4YfwpiYnJ7S80XfIKF6PiPmnAr71/xDNQl/YZ647UHoPvLsVoVxe+o8zg2Ze
 PPjfe/l9++lMk7G0k8CrhSGs62XyUcKncx2WRhs3kXWuCqlz5CMUpDMTwaEfssb45+Kv
 2VgWV+avvY6NfzuO0WJcqUUksZwu5xjyWAM27QAkuaNCKNOqbVVS1fNgVNRMQyns8N6x
 nB7y9yB+iu/S8krurQ7wTUaBCbB/HqgIkH/l3LyW2m+nxYsGJtRe3u5IEx8pMhMaKEwK
 D9kg==
X-Gm-Message-State: APjAAAXbtpRGf0KSJFszGBLfxykhxI9nFbOVFZInWzByWkBLG7VXOrd2
 TwE12NYmjpHpH0aw2GjSDLxKug==
X-Google-Smtp-Source: APXvYqxl6mL7tTz7X7KEtG2vqgQMbj67v6Cc1Rl4iudjG1CUlvN3GaFe4IW9bcSP3mAkcN1XqsCGkA==
X-Received: by 2002:a5d:63cb:: with SMTP id c11mr65591079wrw.65.1560533308268; 
 Fri, 14 Jun 2019 10:28:28 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id u13sm2127233wrq.62.2019.06.14.10.28.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 10:28:27 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 17B7E1FFB3;
 Fri, 14 Jun 2019 18:12:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 14 Jun 2019 18:11:39 +0100
Message-Id: <20190614171200.21078-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614171200.21078-1-alex.bennee@linaro.org>
References: <20190614171200.21078-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH v3 29/50] target/i386: fetch code with
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Emilio G. Cota" <cota@braap.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/i386/translate.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 03150a86e2..bf4cd875ab 100644
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


