Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346492F7DD4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:13:43 +0100 (CET)
Received: from localhost ([::1]:41268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PrC-0007GC-6U
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:13:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0PEV-00015E-7t
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:33:43 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:33803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0PEP-00082g-7X
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:33:42 -0500
Received: by mail-wm1-x330.google.com with SMTP id o10so1904621wmc.1
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nX0nZR8ML7YatFNFZPaARqTOhSbYyFFOXgEPNCPi1K0=;
 b=qRdBArrxhbyczAAg/gGAt9VhAGoaX191RUCq6rAOK1YV7su7KepAPsZpdqMRRQQeqp
 2XaSeTgRCkwKFPHBIl2jI0z6vl4ZKCmnSIUzeZANSl79/F4QI3Dv7a0avkRZfd1u7UNW
 aWgpoR/90wrA9VnR3OLWW929c7iGwaHkSSCDo+J4rD2okgESH7m89rVsHdFtoa0ZrdGA
 UabbIYJJq+FrH/d7QSwswFkL6IlP/khl+tCVKvn2557cvhlyxU3ZakYgarNWOFrnrUrZ
 +CIAxO7Q/AscUOVnjxlm5YXKUHUKRTNMiMKh52l7JVG2k0krN2Yq7JZHH8eA9zENLaJ5
 ms0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nX0nZR8ML7YatFNFZPaARqTOhSbYyFFOXgEPNCPi1K0=;
 b=fpz+v0fvQx9FyB30yjrrw3KdUxEQKcftDD0KBx/gFFG0IQZ+acfeWB+Lt7FUFzI2+3
 ttS2Rbx3gTCoGsqze6YBQTqPJrO6ORQ5sr4ir1V4S68qFAGUHjG/Zcw2hNslMTL1xdgl
 5gWsMBWrKDyt0fSpz9uL3XPQ8uX1p5r8M2niPBzYfIjaQUjiER4uXkvvGEFVz3UTVVm8
 +96PMSpgVNWCNRqDxCI25cYthfnUSvTWgorOGbZUI6fWK1qrfYUoCPNd5awHlHIObN0T
 FWiX0E6WkFnsC56daGpma42zlg5C2YODaO6vir9b7EhCq+a5GQlXz6xeYATKQbMpQf5S
 gqPg==
X-Gm-Message-State: AOAM532XMIfLdC283CCP/1drIX3Hk+MKCWX1zlzTWWhwP7nvjTbF7IMo
 TPHclFM0ijsbKRWnpUc/i9kKkA==
X-Google-Smtp-Source: ABdhPJyDTRD/t49c0CUfrI5G9jYNWvwgs6QtSx2cwUc9ock9zqWe5GN5IcO687sv7fH0OpG64tpL1w==
X-Received: by 2002:a1c:8195:: with SMTP id c143mr8653328wmd.59.1610717615541; 
 Fri, 15 Jan 2021 05:33:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a12sm16384923wrh.71.2021.01.15.05.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:33:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F03731FF7E;
 Fri, 15 Jan 2021 13:08:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 27/30] riscv: Add semihosting support for user mode
Date: Fri, 15 Jan 2021 13:08:25 +0000
Message-Id: <20210115130828.23968-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Keith Packard <keithp@keithp.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

This could made testing more easier and ARM/AArch64 has supported on
their linux user mode too, so I think it should be reasonable.

Verified GCC testsuite with newlib/semihosting.

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Keith Packard <keithp@keithp.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210107170717.2098982-7-keithp@keithp.com>
Message-Id: <20210108224256.2321-18-alex.bennee@linaro.org>

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


