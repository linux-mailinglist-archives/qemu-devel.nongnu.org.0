Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1FF2C3E9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 12:05:58 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60160 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVYzV-000253-UL
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 06:05:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hVYtg-0006Mm-Ft
	for qemu-devel@nongnu.org; Tue, 28 May 2019 05:59:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hVYtf-0005Y3-2h
	for qemu-devel@nongnu.org; Tue, 28 May 2019 05:59:56 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38499)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hVYtd-0005Un-Ql
	for qemu-devel@nongnu.org; Tue, 28 May 2019 05:59:54 -0400
Received: by mail-wm1-x341.google.com with SMTP id t5so2126710wmh.3
	for <qemu-devel@nongnu.org>; Tue, 28 May 2019 02:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ouRT/UBjHUBeDQJ4QIlqT44+hOMvQz+edWkO1B7kdOs=;
	b=ms7W1F5XzBFG5JijFLJunNaYtYsk8F/vVqdW/xzYhD3ydGsnnEE6AN0GxkKEkCGJ/u
	1gDnKMiLlSGY8oISRir891gZNePmpaHULIOcoXoYQKSrHBUz2+wNwLRKWEPFwK9G3TFa
	j87xKyq1x0sZX5rlTRBhhkSY4UUFo+dNZ2FTwmSAsAKdA2V1MExuyagbq7YaNHbzuQnd
	81U2coUsUKmvG4TlKXKx0QTw23vReUMzEC6I91NdjhICqnE5eBlUxxEhxRClNm+tNG4d
	kTBbIvqG00wzrIY4AV1h4FE1YownzdAyeYHGhivEJAN89GXbPcmdnQm4ks6N/GwlsKaj
	c3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ouRT/UBjHUBeDQJ4QIlqT44+hOMvQz+edWkO1B7kdOs=;
	b=bMtT3aNfIDEo/z9vNcHNyJjYv49YJSoPywZhNvlQ9i+G9vjoaJkgfRAHOQGC8rNi54
	WF5KKPfV0mCYVZLjCbWknhyg3dx2XndbyDimwzrcKVH2yZiPJsk62ZI7+RpRNBVz5NUR
	fJeqgWe9QgzQfFyv3KqNQZnZDR/3neS+XuY4xi3fps/h30DQysv91iwS7aNKzSX/IJwe
	fDTpq3R2RL6fHjvM1lR0vfMv7qeX+qlg1U75GRA6G9+8cwu2G8Mr9WNS77rTmYRtnAej
	d0Y/K/auPEl0R68C4aJCUXXZHw6Cw3VYVKUvb4GOQkdQZ1+ynCg2eVfyUkVITokJOJVV
	nLUA==
X-Gm-Message-State: APjAAAVwr/2Fa4uy/e3RwQfz7njkCRIY+eQRtNkZRg1kBwrlv6pIjl6Y
	TjGgJu6iC8HtCAUZ6Rwx1N7wxw==
X-Google-Smtp-Source: APXvYqzUbfXTbcjgke2A08laVAFZyJ/sL3TlVP7DtJi2yS/vBnEeBFPJ8PQFrCcI10QKz6lc0/NbPw==
X-Received: by 2002:a1c:35c9:: with SMTP id c192mr2568076wma.147.1559037592661;
	Tue, 28 May 2019 02:59:52 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	c131sm2165251wma.31.2019.05.28.02.59.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 May 2019 02:59:51 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C059E1FF9E;
	Tue, 28 May 2019 10:49:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Tue, 28 May 2019 10:49:40 +0100
Message-Id: <20190528094953.14898-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528094953.14898-1-alex.bennee@linaro.org>
References: <20190528094953.14898-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PULL 15/28] tests/tcg/multiarch: add hello world
 system test
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is not really i386 only, we can have the same test for all
architectures supporting system tests.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

diff --git a/tests/tcg/i386/Makefile.softmmu-target b/tests/tcg/i386/Makefile.softmmu-target
index 53c9c5ece06..c31bbbf39a7 100644
--- a/tests/tcg/i386/Makefile.softmmu-target
+++ b/tests/tcg/i386/Makefile.softmmu-target
@@ -27,7 +27,7 @@ CFLAGS+=-m32
 LINK_SCRIPT=$(I386_SYSTEM_SRC)/kernel.ld
 LDFLAGS=-Wl,-T$(LINK_SCRIPT) -Wl,-melf_i386
 # FIXME: move to common once x86_64 is bootstrapped
-TESTS+=$(X86_TESTS)
+TESTS+=$(X86_TESTS) $(MULTIARCH_TESTS)
 endif
 CFLAGS+=-nostdlib -ggdb -O0 $(MINILIB_INC)
 LDFLAGS+=-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
diff --git a/tests/tcg/i386/system/hello.c b/tests/tcg/multiarch/system/hello.c
similarity index 100%
rename from tests/tcg/i386/system/hello.c
rename to tests/tcg/multiarch/system/hello.c
-- 
2.20.1


