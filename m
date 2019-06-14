Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319D346669
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 19:55:12 +0200 (CEST)
Received: from localhost ([::1]:53906 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbqPp-0007y4-8p
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 13:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58667)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hbpqj-0005bV-61
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:18:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hbpqf-0007Ap-Ga
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:18:47 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:34588)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hbpqe-0006aI-As
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:18:44 -0400
Received: by mail-wm1-x341.google.com with SMTP id w9so9349677wmd.1
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 10:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+b63Y9PbLI6+aITJW7vKd87oH1u7+0WksIZYyx+bONM=;
 b=TJFWFBhSps8aAPjD6uLAT0Tj95Vx5KdrHJJEcmLqIKy3NVfeifbGwtWU9ASkxDdHcs
 S5IdMvLLHIFU0jhX5bHV7uwxlaC33Q3qSVYxeK8KjbNuUmzCX30JZT3MkZ0KilqlQ0UM
 hv8LHFxDRR9N7rjOyNp8kUBTQUgaJsS87DyuiYza0PKxIqD+QmO2wa9aXPNVduRphSYt
 6fLVZtMOK3ZlE9WyWK+MyT/T1HVaWzxtpP/JPIesF9MF91qPjbKxGI+8pbjR3zuGrrgZ
 96bKRej71AZMxJggZ3/Ol3O5bv7RJwltepRZrJQ+7n234nBZgZwp7oZrEpbJUtlzmis6
 dhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+b63Y9PbLI6+aITJW7vKd87oH1u7+0WksIZYyx+bONM=;
 b=EqYVE+y0Sqv2IkYGB023FKjJ+n++ms50keGfYrhxDnNYrSFv9SFiSxJdtUf1XjxFoZ
 glDUAf1P+bbDLWsO7DD4CnTeNudoe85GYA5hy1VVCtVa+sb+mY66pgbpnztKKjJG6LKZ
 FUC2Ru5fbtsLKC+LDd4rmNqx5zu4/idIliSJDCe8Pa3+7puaWmxKliFKixuQJ6o3mk7Q
 yo1L78SZWouGe/WjHjWUhMABjC0s8V0DvHiEfils2rQXo/8MiQeZeGDPaTLdNLccdoVl
 dLW5mU6SOOt6Xh49zygiRMP8h77akQ9kos+xq/vmn/9+jD1NjHBZ6uHdKGJkEKAI5oWr
 x+bg==
X-Gm-Message-State: APjAAAVPFHzX6r66g1ObmSHoheiBIRQvxegGiEBQe13dc5lEljuhzEum
 3j0Gl1l0qX4hbxlF8SoY7Sx48Q==
X-Google-Smtp-Source: APXvYqyv51qiQ/pFBZohY4DFImbVbgkL3DVlA2KqBrZdHJq18ShK2TIbSHtfIlQ6AwIVXXvrZ2hYYw==
X-Received: by 2002:a1c:c003:: with SMTP id q3mr8747990wmf.42.1560532707343;
 Fri, 14 Jun 2019 10:18:27 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id o126sm7688314wmo.31.2019.06.14.10.18.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 10:18:26 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9326C1FFBB;
 Fri, 14 Jun 2019 18:12:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 14 Jun 2019 18:11:45 +0100
Message-Id: <20190614171200.21078-36-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614171200.21078-1-alex.bennee@linaro.org>
References: <20190614171200.21078-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH v3 35/50] target/xtensa: fetch code with
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
Cc: Max Filippov <jcmvbkbc@gmail.com>, "Emilio G. Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/xtensa/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 6f1da87875..cb849ae2d9 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -863,7 +863,7 @@ static int arg_copy_compare(const void *a, const void *b)
 static void disas_xtensa_insn(CPUXtensaState *env, DisasContext *dc)
 {
     xtensa_isa isa = dc->config->isa;
-    unsigned char b[MAX_INSN_LENGTH] = {cpu_ldub_code(env, dc->pc)};
+    unsigned char b[MAX_INSN_LENGTH] = {translator_ldub(env, dc->pc)};
     unsigned len = xtensa_op0_insn_len(dc, b[0]);
     xtensa_format fmt;
     int slot, slots;
@@ -887,7 +887,7 @@ static void disas_xtensa_insn(CPUXtensaState *env, DisasContext *dc)
 
     dc->base.pc_next = dc->pc + len;
     for (i = 1; i < len; ++i) {
-        b[i] = cpu_ldub_code(env, dc->pc + i);
+        b[i] = translator_ldub(env, dc->pc + i);
     }
     xtensa_insnbuf_from_chars(isa, dc->insnbuf, b, len);
     fmt = xtensa_format_decode(isa, dc->insnbuf);
-- 
2.20.1


