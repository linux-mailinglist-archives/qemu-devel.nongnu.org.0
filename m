Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E65441A9B2F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 12:45:19 +0200 (CEST)
Received: from localhost ([::1]:47688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOfXi-0007IR-V3
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 06:45:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45605)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jOfUw-0002Pw-CT
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 06:42:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jOfUr-00038m-Mb
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 06:42:26 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:53113)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jOfUr-00038K-Gm
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 06:42:21 -0400
Received: by mail-wm1-x32a.google.com with SMTP id o81so11243878wmo.2
 for <qemu-devel@nongnu.org>; Wed, 15 Apr 2020 03:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lUvP8ILsx2IDdEAZ5yyYY9/3My9j0MLorL0tokHSiKc=;
 b=kVn17K3RRpWAUiMVy8jLloOQ73Uzb/t3cz8e3frYLgH5nHxI5YVgqZnJ1FhIh+h5LS
 OYOgUdoj/egm1rChyWkXP9tunqhrEpma9q4NPthI+C20c9DMuOfbyTpXw5SiDY4qmBI/
 nzuPgQMjEOQ65MpT/8E2Pe3Z79axe423n3nLM0YXt2sjX4d50EZblNkCC+BGHI0Uil9a
 75k84yJfySKba0BZSvL4DXc5YIBHC4hwn/k61+qU2+gcX9B9SMiBp+x4aQdifhOWk8Fm
 tjyJLtkNtop8mHXLXKWqhFjGOA53CVg7gcrk9PHhGTwEhBK6t2YZect2qFupHkJky3A7
 Z+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lUvP8ILsx2IDdEAZ5yyYY9/3My9j0MLorL0tokHSiKc=;
 b=kjabjz9PhEbc/HwMN4b2QPCIlaT1U4F8zPSDGrbOlkJJjkQoU1JIeNuP3++2H8uySx
 aXC2QDSf8ix0yPXQV7rjj5wVECgj6JhEVQwhn6U7PDCuRRwh7CQtA840EWBYvyKjwwdp
 9Qdqz+joedppXdVTlVTrwFIRF9e2AdVx6ctXaeBbJEWbKvVRrePJrMsIDmQVyeO0iot1
 mSQrjKcDhRsTGHXQ/j7ECRISi6cWBON+TXPDi68PXdv5akQjm7oCtenOHP/3ACws/zaE
 JjW67+fzFbWnyNNDsy/JrLXWasNPNM8KgDgyrI+2GCr3St2G4UzXtTjcM+lnubFolgJ9
 IjnA==
X-Gm-Message-State: AGi0PuZjA//74iwTRABHDHhYHBanKsuv+EGdemsjzJoZ/zlH6VAqzmKJ
 6WqOZrNMAqxab+LIFSZBHQfjPg==
X-Google-Smtp-Source: APiQypJKxHMP/I1VgGmLVXJtPq1oEs6y6kdDSQFICuMplf8DVubgmUPMThU9fW3/UHQ7oCWu619eIg==
X-Received: by 2002:a1c:4409:: with SMTP id r9mr4712601wma.165.1586947340337; 
 Wed, 15 Apr 2020 03:42:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w17sm14375640wru.20.2020.04.15.03.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 03:42:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6C2B91FF91;
 Wed, 15 Apr 2020 11:42:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 5/8] target/m68k/helper: Fix m68k_fpu_gdb_get_reg() use of
 GByteArray
Date: Wed, 15 Apr 2020 11:42:08 +0100
Message-Id: <20200415104211.9388-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415104211.9388-1-alex.bennee@linaro.org>
References: <20200415104211.9388-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32a
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Since a010bdbe719 the gdbstub API takes a GByteArray*. Unfortunately
we forgot to update the gdb_get_reg*() calls. Do it now.

Fixes: a010bdbe719 ("extend GByteArray to read register helpers")
Reported-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200409172509.4078-1-philmd@redhat.com>
Message-Id: <20200414200631.12799-11-alex.bennee@linaro.org>

diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 014657c6372..cad40838956 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -109,8 +109,8 @@ static int m68k_fpu_gdb_get_reg(CPUM68KState *env, GByteArray *mem_buf, int n)
 {
     if (n < 8) {
         int len = gdb_get_reg16(mem_buf, env->fregs[n].l.upper);
-        len += gdb_get_reg16(mem_buf + len, 0);
-        len += gdb_get_reg64(mem_buf + len, env->fregs[n].l.lower);
+        len += gdb_get_reg16(mem_buf, 0);
+        len += gdb_get_reg64(mem_buf, env->fregs[n].l.lower);
         return len;
     }
     switch (n) {
-- 
2.20.1


