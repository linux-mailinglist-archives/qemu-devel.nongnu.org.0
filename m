Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB05E2EFB8B
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 00:06:04 +0100 (CET)
Received: from localhost ([::1]:50996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky0pX-00040T-Ow
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 18:06:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0cb-00072J-4O
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:52:41 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0cZ-0008K4-EJ
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:52:40 -0500
Received: by mail-wr1-x431.google.com with SMTP id y17so10396142wrr.10
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 14:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Rq2dXRO/J6KxyNY5cPiwaGllbDhHPld9fCA5yF56M4=;
 b=f7UjCD18JEsTnXJz0BVpaEuoUft5qqkj3uemTB93r7YwKR01EhRrVTEFoLESeZLrUb
 2f1HrV6O5SrFwykuBkaE6KSLpkisB41fpNpXfKe4nyH/t6O4QA0XPnDDekQ0iz+CkRek
 Rltu3V6ofkUpgNOZpFYpOfTICVLK3vwOK4rPwOUaMmsA+dJVf5Z/yFomy4AyaBJMvf+p
 gnSnvTKDsZRBcpCoHLT7mZEquz5QNUSbL63xMsG/6ytiLzVIhimAsx/3BzKFOyn1fbVG
 RvYad0Cu0BV8qkJlfSTUhQBPZmUoCvZGBG/AgXJ0CildBiHengbhK7lRVfhzE2DZ7R7p
 4dmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Rq2dXRO/J6KxyNY5cPiwaGllbDhHPld9fCA5yF56M4=;
 b=kHYR9uJXJhFWNqsIIbtF58MVnRYskj3VYnmw92N6CRXJCf48EDbxnhI7RkRrlJieBz
 snRkNhGJY4jm5TT3OQZMA0PE1AHvQMQCyuilSEyncCcnECuS9bPJxeDRsDWgKXPnzp+7
 GZG0OWG47QC37qhGumpGNM0v7SUVDEhpwB32ZltN56EhqR5BVTbjHnLdc0qA58JKbx5W
 a6nLWDOKfrBK9ofRE/rfaJFyfIekDWZ1uRnq0vWnIzVRMwS2xLD5dnQP+uyyZDVdYxOp
 wYe89WmL/XJiwloOM+d1WpGPAtgk20LUGJDriRtOpcvJaXeI96cSxY3bbzyItZXEPA8s
 oE1A==
X-Gm-Message-State: AOAM53309OoF8ayM6SDyf2jQ0cxqjO2SlwBg7qX6yMAVC0bMtIRO5Max
 dV31FB7r9toyvCTnzhGhXWsM3UHw/c3Qxg==
X-Google-Smtp-Source: ABdhPJw44lXCcp+g6R2m+f47SXyw3bKHTJxNmz+jW1PkJw1/TwOd7LDjcYuCYbjqxZS4ErkRimOdxg==
X-Received: by 2002:a05:6000:108b:: with SMTP id
 y11mr5534120wrw.379.1610146357584; 
 Fri, 08 Jan 2021 14:52:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h16sm14296297wrq.29.2021.01.08.14.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 14:52:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B7E911FF9F;
 Fri,  8 Jan 2021 22:42:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 17/20] riscv: Add semihosting support for user mode
Date: Fri,  8 Jan 2021 22:42:53 +0000
Message-Id: <20210108224256.2321-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108224256.2321-1-alex.bennee@linaro.org>
References: <20210108224256.2321-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Keith Packard <keithp@keithp.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

This could made testing more easier and ARM/AArch64 has supported on
their linux user mode too, so I think it should be reasonable.

Verified GCC testsuite with newlib/semihosting.

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Reviewed-by: Keith Packard <keithp@keithp.com>
Message-Id: <20210107170717.2098982-7-keithp@keithp.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/riscv/cpu_loop.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index aa9e437875..9665dabb09 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -23,6 +23,7 @@
 #include "qemu.h"
 #include "cpu_loop-common.h"
 #include "elf.h"
+#include "hw/semihosting/common-semi.h"
 
 void cpu_loop(CPURISCVState *env)
 {
@@ -91,6 +92,10 @@ void cpu_loop(CPURISCVState *env)
             sigcode = TARGET_SEGV_MAPERR;
             sigaddr = env->badaddr;
             break;
+        case RISCV_EXCP_SEMIHOST:
+            env->gpr[xA0] = do_common_semihosting(cs);
+            env->pc += 4;
+            break;
         case EXCP_DEBUG:
         gdbstep:
             signum = TARGET_SIGTRAP;
-- 
2.20.1


