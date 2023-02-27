Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C5F6A4438
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:21:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe6B-0007L5-AO; Mon, 27 Feb 2023 09:03:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe5z-0006w5-RZ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:03:21 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe5y-0007p3-BC
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:03:15 -0500
Received: by mail-wm1-x32a.google.com with SMTP id j3so4316512wms.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PasVDirs294RscXohIgiWTydLjXdrIBuzZcLem7x0wI=;
 b=bzWW9yTE3Uhs4Df6zF06t6/y3d/C+1dt0oD/qbedCmKwV7xCFqn6SwT2uLSffeaivG
 2bbWItsx5hbt1wv6B0t2Sf9wWoJho8BplhFvVE7JXcHFv9EnSDsh68hWv7FoGCI8b0g2
 2tzj/LQxJsWVb9G2L+Fcu+tDEfMi/lgq2jxqx9lLPqUABr+hUWPl16Tc0wqy5RyfbtaZ
 4jNhqkNuhXpiKPOgZGWWPX5vwUhmfAwZeOhdclAI+oW2/Ii3u9OKwETnUSGZwvy4556h
 rmPJ2dPFgYCbTcj1j8h+cYFzXSuNjc48Tnbur1kKpg7SU6OAsv2yXql1LSMQ9bHc6OFP
 0lLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PasVDirs294RscXohIgiWTydLjXdrIBuzZcLem7x0wI=;
 b=W9MXWu9V8Ss1jzZytNKkkpHrkGyzyoOEe+9NDilzUMYufzNDwTzFi1C4jozYDeYC9/
 7QeIRi3IUnAsDiGNgmNlmhXDh0DzombIW9xK+AFpwTNXwsezHGL7TNukr27q0430Itv3
 UdhXoRiBWi3ClZswhTSNFiWDsgIPpTrPU9xK6ttF8N5wDgqRuNk9gbrahh2cCNLR7lpO
 cwA47iG0d5e9P3nmV5lSeuBjcRsmfy2zlcp+kJSeu5kLOme3I2u4E3UY8v3kqZJoi9tT
 8iZDVicZflyXbTtAVa15umh51cl3Wm1EUO6y/uiB49mVQxmb/LbvP2aW/0nYOmZ8SLMv
 ckPQ==
X-Gm-Message-State: AO0yUKXTcW2BAck89y9xW7VIo2hNjmd+FcSqXUXsrOgWTmCDHa1RkFxb
 +Y8a5sjxMojRJRQ9rE7WkCg6LLoKbuVJSOXP
X-Google-Smtp-Source: AK7set/PYOudhv4C5FZGZan0ijij71DuXuzEF94H6bv7KMEUPv/nk1rbN4jVQxRzCb5zlT/WsvM+7Q==
X-Received: by 2002:a05:600c:44d2:b0:3ea:4af0:3475 with SMTP id
 f18-20020a05600c44d200b003ea4af03475mr12020929wmo.1.1677506592705; 
 Mon, 27 Feb 2023 06:03:12 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c379300b003e2052bad94sm12628885wmr.33.2023.02.27.06.03.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:03:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 020/126] target/xtensa/cpu: Include missing "memory.h" header
Date: Mon, 27 Feb 2023 15:00:27 +0100
Message-Id: <20230227140213.35084-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Under system emulation, xtensa_cpu_initfn() calls
memory_region_init_io(), itself declared in "exec/memory.h".

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221217172907.8364-10-philmd@linaro.org>
---
 target/xtensa/cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 2dc8f2d232..acaf8c905f 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -35,6 +35,9 @@
 #include "qemu/module.h"
 #include "migration/vmstate.h"
 #include "hw/qdev-clock.h"
+#ifndef CONFIG_USER_ONLY
+#include "exec/memory.h"
+#endif
 
 
 static void xtensa_cpu_set_pc(CPUState *cs, vaddr value)
-- 
2.38.1


