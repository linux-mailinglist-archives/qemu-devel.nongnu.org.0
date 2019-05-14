Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849FD1CC6F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 18:03:19 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50399 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQZte-0004u2-O3
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 12:03:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hQZjr-0004oK-EU
	for qemu-devel@nongnu.org; Tue, 14 May 2019 11:53:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hQZjp-0006KO-V5
	for qemu-devel@nongnu.org; Tue, 14 May 2019 11:53:11 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:53175)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hQZjp-0006Go-MJ
	for qemu-devel@nongnu.org; Tue, 14 May 2019 11:53:09 -0400
Received: by mail-wm1-x341.google.com with SMTP id y3so3436936wmm.2
	for <qemu-devel@nongnu.org>; Tue, 14 May 2019 08:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=l/EZtOIUyXPpqgCV5lyhmXRqV1pA86ugcjhdZROi1Z8=;
	b=WkCkO8qKAZ0uLl0RhQASW3MB8JEW4RRqIqUsDKImnpMMIk29f3qEKUNrTYkEBZYmHr
	D32fT3MeKJhYM3X/GpeYf7M7p1k8CWXMIABmmZdmF3iJ35J7/edececFU7SI4PeudjoA
	TrtGcLb0JoqELZpEufqX8t/2mT0UzICJSO7H8Dh5CBI15Mp25cwlpSzKT2Cz4SCCZhTh
	XFSPpqxgdN8nmOcLJnNLV+CkAgMefNvPu7IXRgU3RbTKkdv04HgR2HqhWLysnj+yul1w
	ekf+F/aVMendG+tYDh0cnAtNg+AapBLAgNBnXlnalZicvcwVP3Nr2WP/WkxRooI1Awko
	5PYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=l/EZtOIUyXPpqgCV5lyhmXRqV1pA86ugcjhdZROi1Z8=;
	b=Awt+lXwJc4cCIPVOuuvtXkkbJQd0U/CvKcuUbspuCBiraokxWDaCbeIlMJPPZz1b/X
	VfzhbyUBHU+PRYvhwhhnTy7yX4HNdWHY+T+usxF+cW27VSNPD/tlyIngheSls+6k+FSK
	IeF5DGVc0V4bBgP3panM1qWb6L0UI6GTPL/jF+j7dXk1NPYZ4OaqA8oQjDwIWOzHGK2+
	L7PTZ9pz09UJEEMWqeAXoBIaZ8AH7iKzHTbRVsJXeCV7BH4NxNEaiWxyMhR7d60+e5US
	NCq7K+qf1K1PcCwuyvr188eTI4eGvObI5SHslvuqxyi/N+3aBt4bBFEnZR26h9Z3xis0
	OHeQ==
X-Gm-Message-State: APjAAAVD7bqgwExjqZSvJV+dkw3FCenjDoXWPqCl43wVcT4fF7udqEaK
	cMWvICnLJYVV/4NzeErypuftdQ==
X-Google-Smtp-Source: APXvYqzOnXYL4rjzQGrip1yjubbr5tijHpTWP72i8Gjtg1J+oqDJQjJrn/AiyPdZve0Pia6sAaN6dQ==
X-Received: by 2002:a1c:9c03:: with SMTP id f3mr20577817wme.67.1557849188513; 
	Tue, 14 May 2019 08:53:08 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id 15sm3580767wmg.36.2019.05.14.08.53.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 May 2019 08:53:05 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B877F1FF98;
	Tue, 14 May 2019 16:53:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 14 May 2019 16:52:58 +0100
Message-Id: <20190514155301.16123-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190514155301.16123-1-alex.bennee@linaro.org>
References: <20190514155301.16123-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [RFC PATCH 08/11] target/arm: correct return values
 for WRITE/READ in arm-semi
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The documentation says the write should return the number of bytes not
written on an error (0 means everything was written). Read provides a
buffer length and the return value should be the buffer length - bytes
actually read. Remove the incorrect FIXME's and return the correct
values.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/arm-semi.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index a3bbef18ef7..3ae8f05d51b 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -334,13 +334,15 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         } else {
             s = lock_user(VERIFY_READ, arg1, len, 1);
             if (!s) {
-                /* FIXME - should this error code be -TARGET_EFAULT ? */
-                return (uint32_t)-1;
+                /* Return bytes not written on error */
+                return len;
             }
             ret = set_swi_errno(ts, write(arg0, s, len));
             unlock_user(s, arg1, 0);
-            if (ret == (uint32_t)-1)
-                return -1;
+            if (ret == (uint32_t)-1) {
+                ret = 0;
+            }
+            /* Return bytes not written */
             return len - ret;
         }
     case TARGET_SYS_READ:
@@ -355,15 +357,17 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         } else {
             s = lock_user(VERIFY_WRITE, arg1, len, 0);
             if (!s) {
-                /* FIXME - should this error code be -TARGET_EFAULT ? */
-                return (uint32_t)-1;
+                /* return bytes not read */
+                return len;
             }
             do {
                 ret = set_swi_errno(ts, read(arg0, s, len));
             } while (ret == -1 && errno == EINTR);
             unlock_user(s, arg1, len);
-            if (ret == (uint32_t)-1)
-                return -1;
+            if (ret == (uint32_t)-1) {
+                ret = 0;
+            }
+            /* Return bytes not read */
             return len - ret;
         }
     case TARGET_SYS_READC:
-- 
2.20.1


