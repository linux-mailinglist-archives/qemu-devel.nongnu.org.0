Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8E412BF91
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Dec 2019 00:16:58 +0100 (CET)
Received: from localhost ([::1]:47270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ilLKK-0001dC-TV
	for lists+qemu-devel@lfdr.de; Sat, 28 Dec 2019 18:16:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39939)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ilLFX-0004eJ-SK
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 18:12:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ilLFW-0005JO-R3
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 18:11:59 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:35965)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ilLFW-0005Fg-LG
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 18:11:58 -0500
Received: by mail-pj1-x1044.google.com with SMTP id n59so6564019pjb.1
 for <qemu-devel@nongnu.org>; Sat, 28 Dec 2019 15:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o4tOjWH6ALV81K/fF+oLX92Wb4vwp7buMFAa8+Hf4/8=;
 b=MBnOOf7vawqZ29ltJGufOPxKSdWs1FzS8LCIURURTxW0R3SU+m1jR7nvcvkcpudOr1
 WfeUdXH/Hj3zxm9kAFLyt9MzBqGz6oJE0ORKU2/niUuEospE5EP6JP0QxG7VbhJMKTfZ
 Vy6dzUiYYbCjys0KXJUpKQJwOMcQFRWxzZK/JPYzp9IQj9dbJ1gJoIlJ4j1HJd/mNGeM
 4Rhybu3Drj0ig7eGfS58mLUNfLV+plKv3ZC0axH9hWgpephi2ZJzw8Qgyqfw//S6k+pM
 dnnndZDGQRxoLKGw23o8Z8sASjvGsccxLPAl01K2wlvabeso55fpBlIGSrR9bnW0H9J7
 i2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o4tOjWH6ALV81K/fF+oLX92Wb4vwp7buMFAa8+Hf4/8=;
 b=ieJDd+GfYDemVdqJBKCb5wrT5DPXcM6msHj0zj8orxA0p3ozJ32keRZ72PtYZSP/Wx
 peWOY1mfrcJ7Yeg5DKLyorXxa3BxX8INjR7k+v8Kns5PpvFbxXm4qRdIB6DJYs5oQfxI
 vNMdePoMUq5pSe2rogrvDH7R59R2EwWZm6Vvcqn15irINuZA/6hHgFxS1fazjI2vCpeq
 dv0Wm0T45H7y7KWiSkhzhaNTJP1aHKVaOHwGEcB+U/vKTmOMkIvvWaglieAAb0KHZ2NK
 qQMwPkubozevr5rrRg0PSnpFs0asPAtSP2G26wP1Y7GQwIP1Vwn0ezETlNmbnP3a+zAF
 w33A==
X-Gm-Message-State: APjAAAXtB3cCcbF8TzSRBJr4ioURTjVHXVoXqhWRSGGc0d9RLb4OhA6W
 qsyX0SaU4CPe9tLVyWjaA0VCGXfme1k=
X-Google-Smtp-Source: APXvYqzpVkolM/7oxCIoetBaBPaj20Zztm+P4Qeq+ru0JG0traHPq8QlJk04UX1oDbP45iKQ03ZuVA==
X-Received: by 2002:a17:90a:d804:: with SMTP id
 a4mr35592977pjv.11.1577574717387; 
 Sat, 28 Dec 2019 15:11:57 -0800 (PST)
Received: from localhost.localdomain (194-223-58-9.tpgi.com.au. [194.223.58.9])
 by smtp.gmail.com with ESMTPSA id c18sm21077186pfr.40.2019.12.28.15.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2019 15:11:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/29] linux-user: Include trace-root.h in syscall-trace.h
Date: Sun, 29 Dec 2019 10:11:03 +1100
Message-Id: <20191228231124.18307-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191228231124.18307-1-richard.henderson@linaro.org>
References: <20191228231124.18307-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Code movement in an upcoming patch will show that this file
was implicitly depending on trace-root.h being included beforehand.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/user/syscall-trace.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/user/syscall-trace.h b/include/user/syscall-trace.h
index 9e60473643..79fd3e5aa9 100644
--- a/include/user/syscall-trace.h
+++ b/include/user/syscall-trace.h
@@ -10,6 +10,8 @@
 #ifndef _SYSCALL_TRACE_H_
 #define _SYSCALL_TRACE_H_
 
+#include "trace-root.h"
+
 /*
  * These helpers just provide a common place for the various
  * subsystems that want to track syscalls to put their hooks in. We
-- 
2.20.1


