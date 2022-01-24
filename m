Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2150E4993BA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 21:39:00 +0100 (CET)
Received: from localhost ([::1]:36940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC679-0005G5-8B
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 15:38:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5lC-0006ZZ-CO
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:21 -0500
Received: from [2a00:1450:4864:20::630] (port=42796
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5lA-0003C7-T9
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:18 -0500
Received: by mail-ej1-x630.google.com with SMTP id m4so24687896ejb.9
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 12:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c3bRSi+/BjoZC9gfGoDbtSBXc4bxJ4NSTI3qm7LnSUw=;
 b=B/A7R9OI2OWSC97pKkhX7R7CRK5Z6p5OcXVZBG8+8bOaUa5qyPym32sczarjW2tcyK
 S7t4KeOZsU6dJAYOdv6nKlLUYrD/D5+sws7OfR1BpeApB1Yxi9ea10W4j0wB0Ew1EycT
 XW1UPgVh5OoDOt5kYMOYJdzZk+iWvoAok0TjvKLIiK79IdRP/sQ+bj3wfRLRyeeb2/UF
 b7/lxCVX45AjaF17bNxUqTyi9CVQMAhx2eQXybpU8gewDG+jQMXZEB8hNCUtAJj28icV
 4BaI8S3M+xdGIljVpxchA2h+EXGvtFr9tKhgHqjVGD314X7kOJeUr4vIVt1Jabmv/Vyd
 mJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c3bRSi+/BjoZC9gfGoDbtSBXc4bxJ4NSTI3qm7LnSUw=;
 b=H7a0ZTvqECcKSubcWYMAhJ47XcT/6GHvQOo9f5OQi53Bk4pfW9cG2Jaet88pzasSls
 mH9cY5/Z8N8jIaO7t5IA8ewdNANRqxcTAnhz7w5Q/qglPJDp0cSVZpkuJu6S8F5qf42w
 QHvfuwReJBA8L9fXQM9mVYTdEBkPM+G0yFI5174gsC8qsRVybJUD+fuFQyeGvnPEWEWt
 cwPvY+/8yFCRny7u7/wWlYjyxavyNyunRBsVm0rqhPhFf+nsvMV17yNe8ZE+vhYvQGXS
 uROHqqF7YFLUKfdKwcGcmphNbKXtVJvkaX7VbQwQiPLVdqyI5mqoBKRvvc1jpD/XNNGI
 cI+Q==
X-Gm-Message-State: AOAM532357fJeic4z4qO/Bfhrdn8Tm4JNWwybCeeCFjo4lgl88qEboKV
 IV9JEd8uWIsqDvWSJzMoyAXZpw==
X-Google-Smtp-Source: ABdhPJzfUPqdqfMRv/6JsICgJIl9LFH4neB9z/74kz9wQj/lSPysj6myFc9pCStH0E5koqAyJtyhlQ==
X-Received: by 2002:a17:906:a091:: with SMTP id
 q17mr13631031ejy.669.1643055375651; 
 Mon, 24 Jan 2022 12:16:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s7sm5285484ejo.53.2022.01.24.12.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 12:16:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A4AB01FFBB;
 Mon, 24 Jan 2022 20:16:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 03/22] Makefile: also remove .gcno files when cleaning
Date: Mon, 24 Jan 2022 20:15:49 +0000
Message-Id: <20220124201608.604599-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124201608.604599-1-alex.bennee@linaro.org>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: aaron@os.amperecomputing.com, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Left over .gcno files from old builds can really confuse gcov and the
user expects a clean slate after "make clean". Make clean mean clean.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index db9a788601..65e0d2dd4e 100644
--- a/Makefile
+++ b/Makefile
@@ -206,7 +206,8 @@ recurse-clean: $(addsuffix /clean, $(ROM_DIRS))
 clean: recurse-clean
 	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean || :
 	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) clean-ctlist || :
-	find . \( -name '*.so' -o -name '*.dll' -o -name '*.[oda]' \) -type f \
+	find . \( -name '*.so' -o -name '*.dll' -o \
+	 	  -name '*.[oda]' -o -name '*.gcno' \) -type f \
 		! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-aarch64.a \
 		! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-arm.a \
 		-exec rm {} +
-- 
2.30.2


