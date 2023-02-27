Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7146A43F8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:14:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe6C-0007au-8r; Mon, 27 Feb 2023 09:03:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe66-0006y1-FG
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:03:23 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe63-0007pL-UR
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:03:21 -0500
Received: by mail-wm1-x332.google.com with SMTP id az36so4324949wmb.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YB6GhDc8o2Ro4z8NqE3FKc8wK6B4wm3bzailT0lBjJU=;
 b=wnTEVmg2NW4lps7TPlLTw8XoE5BjEdUi30K4RQ83P9lFQleB3EQkYm7pt4Ny7Pbp2+
 HjBEGSd+OXHDIyZ55yIwk5RH6Ty1aNF/uGM+Y4Pz26kFhNhwj/76Ype2zGv/x7g67VPy
 iOIBMeU1okoxgjVdXK/NYlI7kKXWhQyXt8E0HTPU2kq2PPKyTTveNVrPkev8W/f0CqV/
 ea606smX/6xAA1yYs5Ctf9cEN9fD57+So/pF1vztZJ3TmensC4Mfn7pmwTnRMYYyw82a
 5+1xnd+N6TiX5YTZ/v7pfSgINnoHH3vFCh4ol3cf327WtRuhb/Ez+s4zsh35f+XQlUOy
 8iLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YB6GhDc8o2Ro4z8NqE3FKc8wK6B4wm3bzailT0lBjJU=;
 b=7YKt0PUDjvOIcYKUhBnttTrQTyHM7pS586yBtP8OrGBvp4xGp5j4dIeXejxRg+fVm6
 RaZNsuDYEIu2dSAINDi6HW/D3TMPHCcLoxzGMI68d2Q6LmukR27L/xNsihR9wvUDexhz
 T2k9Z7nFareug/GxJ11A81Zdf/eHUBr1oJdcyPIax41rx3Nvv4YktYH/gtQb3pi3rYt4
 WnCq6ywrRBqS16ZLyxcJV8kGwOSaSbzpDk0MI8ZHCQ8ESpEHTG3F5Cex7W3xjRvbFvTv
 LPKinZFF+S85U81a6CiwXvZZnYM1mO/KWnBMmz50WUHoM6XU632eBfMi6IRvXnMVUVg1
 pOyg==
X-Gm-Message-State: AO0yUKWMdK/vl8Y/cNjQ7dFK5A5NsIS3DsgYTYW/l7qQI65pR+i+n8y2
 6VkhPLhXNjCjWtUM4YvTl35oCPnHUNX7jdSm
X-Google-Smtp-Source: AK7set/5cDiLwIoud8duOvo0fwm99ZMcVWRSr9Knu78UAWjPeIhD06kPC15o5zKN+u4OPEwhAm+cXg==
X-Received: by 2002:a05:600c:4929:b0:3e2:6ec:7fb7 with SMTP id
 f41-20020a05600c492900b003e206ec7fb7mr18223080wmp.0.1677506597808; 
 Mon, 27 Feb 2023 06:03:17 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a5d5704000000b002c559843748sm7232200wrv.10.2023.02.27.06.03.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:03:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 021/126] target/tricore: Remove unused fields from
 CPUTriCoreState
Date: Mon, 27 Feb 2023 15:00:28 +0100
Message-Id: <20230227140213.35084-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Remove dead code:
- unused fields in CPUTriCoreState
- (unexisting) tricore_def_t structure
- forward declaration of tricore_boot_info structure
  (declared in "hw/tricore/tricore.h", used once in
   hw/tricore/tricore_testboard.c).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-Id: <20230117184217.83305-1-philmd@linaro.org>
---
 target/tricore/cpu.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index 3b9c533a7c..47d0ffb745 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -25,10 +25,6 @@
 #include "qemu/cpu-float.h"
 #include "tricore-defs.h"
 
-struct tricore_boot_info;
-
-typedef struct tricore_def_t tricore_def_t;
-
 typedef struct CPUArchState {
     /* GPR Register */
     uint32_t gpr_a[16];
@@ -179,16 +175,9 @@ typedef struct CPUArchState {
     uint32_t M3CNT;
     /* Floating Point Registers */
     float_status fp_status;
-    /* QEMU */
-    int error_code;
-    uint32_t hflags;    /* CPU State */
 
     /* Internal CPU feature flags.  */
     uint64_t features;
-
-    const tricore_def_t *cpu_model;
-    void *irq[8];
-    struct QEMUTimer *timer; /* Internal timer */
 } CPUTriCoreState;
 
 /**
-- 
2.38.1


