Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC733BD4FB
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 00:36:32 +0200 (CEST)
Received: from localhost ([::1]:43176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCtQ7-0001Fp-No
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 18:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56689)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iCs4x-00036M-JO
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 17:10:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iCs4w-0007Vv-ER
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 17:10:35 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:36936)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iCs4w-0007V2-8X
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 17:10:34 -0400
Received: by mail-wr1-x441.google.com with SMTP id i1so3660371wro.4
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 14:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MWM8c/ngVzHwEcGuCZ94NCB6djP16UjmEi7NIKWPziA=;
 b=h/PuG35CXQwFCNaABEv1GtRf05A8zv/uJEEFZrrMySX7z/1qb2EASBPERoaBL6mklX
 IXIYnc9nLzD9Knv7kixCYkCJE/v7wNScZD7elqN8yr1kkJ7woEjEVwdMleAw+TIWlMhq
 pdEV/1oAwwZegX40SD9ranW6mjgNSGPYaRJ89xfy8Qp46p5hhvQWhMUqd/PQHzgFWK8B
 XKsiz7ZUbDWzjtKB0uibsFkY4X6YJ7UQuoe3wnjhtBkCVlXwJkRuWbDE9vmUut5L4W+e
 wFkRbprvMbXkunX3JHQWIlY0hF6IBVehIv2A3mQRot9I/s9h0pXdpxYwG6xm5L52ZvaO
 phIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MWM8c/ngVzHwEcGuCZ94NCB6djP16UjmEi7NIKWPziA=;
 b=E+T03U/1G9UOKIhPkb2KkyjEeQwIUEo3+ekyM/osSEypgVpH0XDBz+7yAoP0PgPQ9X
 3cfq9yIzq9wQ6QTawOqjCKpju2JkPlQ/GdllDaRFJfnkmpYZU8v4jFSbf/81RTE5o5Sm
 0ORHjCnu9NU8K0iYK7GMRkwE4BsTzPwCK9B/H0uHMvfa1HaGFmdo1KCX0aRqV7s9JqRm
 jkfWqHlOj5Hchb3RKxF3pWsNjXzrX9qK9YgFUmV2TjAfAascIpSsR3A8ogjuAKfSJYRm
 dJTTNJw70ZKGjaJo205yLpxzg20uTWZ4tWPjaPokcksvwvKyQAKgzowb3PCtPSzvA5tX
 Haug==
X-Gm-Message-State: APjAAAVZ0MKiWJluEt+GXCUCJQKEA0XakTUeHxtsT7Y0MBgOOGUHE3VB
 Yldnl+PzyfG/4vilSlrKbDxOX2XScLN3Rg==
X-Google-Smtp-Source: APXvYqzuTTw9Dq4kDJNVHEfJv2J8fTYOxIhRf8eIpfBb3j2yhu+TQfC/ysV2aPnQ3dsaLvul3+ObCA==
X-Received: by 2002:a5d:5643:: with SMTP id j3mr4923811wrw.357.1569359433186; 
 Tue, 24 Sep 2019 14:10:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k24sm4115569wmi.1.2019.09.24.14.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2019 14:10:32 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6FC9A1FFA5;
 Tue, 24 Sep 2019 22:01:08 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 18/33] tests/tcg: re-enable linux-test for ppc64abi32
Date: Tue, 24 Sep 2019 22:00:51 +0100
Message-Id: <20190924210106.27117-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924210106.27117-1-alex.bennee@linaro.org>
References: <20190924210106.27117-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
 Richard Henderson <richard.henderson@linaro.org>, jsnow@redhat.com,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now we have fixed the signal delivary bug we can remove this horrible
hack from the system.

Cc: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - drop un-needed cflags
---
 tests/tcg/multiarch/Makefile.target | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 6b1e30e2fec..657a04f802d 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -12,14 +12,6 @@ VPATH 		+= $(MULTIARCH_SRC)
 MULTIARCH_SRCS   =$(notdir $(wildcard $(MULTIARCH_SRC)/*.c))
 MULTIARCH_TESTS  =$(MULTIARCH_SRCS:.c=)
 
-# FIXME: ppc64abi32 linux-test seems to have issues but the other basic tests work
-ifeq ($(TARGET_NAME),ppc64abi32)
-BROKEN_TESTS = linux-test
-endif
-
-# Update TESTS
-TESTS		+= $(filter-out $(BROKEN_TESTS), $(MULTIARCH_TESTS))
-
 #
 # The following are any additional rules needed to build things
 #
@@ -39,3 +31,6 @@ run-test-mmap: test-mmap
 run-test-mmap-%: test-mmap
 	$(call run-test, test-mmap-$*, $(QEMU) -p $* $<,\
 		"$< ($* byte pages) on $(TARGET_NAME)")
+
+# Update TESTS
+TESTS += $(MULTIARCH_TESTS)
-- 
2.20.1


