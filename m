Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E6E26A9C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 21:11:35 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49834 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTWeE-0005MB-DW
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 15:11:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35158)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hTWOr-0008Lh-Ag
	for qemu-devel@nongnu.org; Wed, 22 May 2019 14:55:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hTWCA-00082m-GE
	for qemu-devel@nongnu.org; Wed, 22 May 2019 14:42:35 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:44893)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hTWCA-00082T-9q
	for qemu-devel@nongnu.org; Wed, 22 May 2019 14:42:34 -0400
Received: by mail-yb1-xb41.google.com with SMTP id x187so1239402ybc.11
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 11:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=p/AR+QB1/uCfqQ+ytrGBnYCYqwPtnBM3b7CBgieQEw0=;
	b=OBFpmPi9AWbdbtlYgTZidrE4QnXMu+xB9Qsjq6MUEiJotntcRpE6196p4t87OpGn+w
	tivMWHcZP1f/68eWfkTp0LXDzPcZJUyc09KvuhoG9+nyYzBW56wpJTlM6FJO9T2+0r4p
	FD+8m5+R4gaVVJ30i0UBAu1RGbdbEUErxX3b6QEPzX72VuARHtLrucetpKP3LpnXXOfj
	lZMnOJtEv17bB5VqpFK40bp9zNs7XONIKYOQKXB6NsMZM+6MJGC7Y+j8SC4vk6Yogrws
	zyRgs6+gEBExms0b+JgU5qHT1hV5Fx5HhS3j0Af+MhWUH8Xtp3tPv6Kx2CkdjK1tsQ/s
	RDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=p/AR+QB1/uCfqQ+ytrGBnYCYqwPtnBM3b7CBgieQEw0=;
	b=MnajBEt6gqhu4Fzxl5kO5YSoiNOzN4S4rmEZMqDOXkLwLs52CKFH8+SA8FQ1Un97y+
	LsO9XpSzN2fCrLmPvKKcjM/YvEVqnn16nGSpYdwVXoTZiLspfNmz7fH8EcLgsVcsEwOD
	SIuzwa0cuZbSTw3qfxPGZ8Kixk4H3FNgR1PoKRUNm+IZjNkoQhDmrM/WtMzkxISDfvDo
	BqKFaDN2UnikFPE+RDqQ+8LjkXHVrNGf6MxdgwJI5SrL8l4U7c7plBCKWm0zspShYEOQ
	2higDRMHC/Za5NHRmd2/8Bz31yaD1hVoDjOIcLW19iTTWDyuxGVtdR1O77hWMNcrUwyX
	Kwvg==
X-Gm-Message-State: APjAAAVuYIqPWBjG59/+EWfRxaAfwlrSaZ8Qc0oKE/wjSM4oykWvW01+
	Y4OzJMYQXSlfFy8Kg6KofCb+mLi+FSk=
X-Google-Smtp-Source: APXvYqxHn/Nv6iZ1tAHwIaEOxekjuUslKbVcIy+HZvDliwPpijCsPY0RNTYLWmEMMTW6Gu+u34ixDQ==
X-Received: by 2002:a25:abf3:: with SMTP id
	v106mr10653436ybi.123.1558550553422; 
	Wed, 22 May 2019 11:42:33 -0700 (PDT)
Received: from localhost.localdomain ([71.46.56.17])
	by smtp.gmail.com with ESMTPSA id
	206sm1299445ywq.74.2019.05.22.11.42.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 May 2019 11:42:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 22 May 2019 14:42:06 -0400
Message-Id: <20190522184226.17871-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522184226.17871-1-richard.henderson@linaro.org>
References: <20190522184226.17871-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::b41
Subject: [Qemu-devel] [PULL 05/25] crypto: Use O_CLOEXEC in
 qcrypto_random_init
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoids leaking the /dev/urandom fd into any child processes.

Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 crypto/random-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/crypto/random-platform.c b/crypto/random-platform.c
index 260b64564d..6df40744c7 100644
--- a/crypto/random-platform.c
+++ b/crypto/random-platform.c
@@ -42,9 +42,9 @@ int qcrypto_random_init(Error **errp)
 #else
     /* TBD perhaps also add support for BSD getentropy / Linux
      * getrandom syscalls directly */
-    fd = open("/dev/urandom", O_RDONLY);
+    fd = open("/dev/urandom", O_RDONLY | O_CLOEXEC);
     if (fd == -1 && errno == ENOENT) {
-        fd = open("/dev/random", O_RDONLY);
+        fd = open("/dev/random", O_RDONLY | O_CLOEXEC);
     }
 
     if (fd < 0) {
-- 
2.17.1


