Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2036A43AD
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:05:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe6N-0000YN-Vd; Mon, 27 Feb 2023 09:03:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe6L-0000GM-F5
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:03:37 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe6J-0007r5-RI
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:03:37 -0500
Received: by mail-wr1-x434.google.com with SMTP id e37so3867675wri.10
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=w35//Xi+HiFDJb401HrXFg/UrizCqNe+LmSJMze6aS0=;
 b=MxMY4xgPCbQcLjKGmcMG96NOl/DEJvs6McEitkcUOL3yq1O8Y89Lh9l8jZQDnHL982
 XLcRYgCwxAeiPdBGAHcmA4pZawdNJ+vM/iDGLSYeSyCKa4elMhcHcp+WPUYo1Gi894OF
 kvBPL5+dRB0TGYB7eNiUoHgzAtYfPPEC+mBiyPP+cxph/TseunILZFP6BwY8lb5vC6b0
 srwPlnbx4WA5j4dTiMFpJlIjoDSYg1MtlstDkIWV10iwS5X8ArSpp19/yrdb8LmBQVC1
 CX+T+yYs55aNVM3flIKCvqY+NC4dDQq0EWMt44Oy6q2sHZiR2dx9fORUyeoVGMo+GlKm
 gSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w35//Xi+HiFDJb401HrXFg/UrizCqNe+LmSJMze6aS0=;
 b=fTJa2WgyTP89/70Nj2wXalpWnmv0WAeljUQSwPWAl9JkszvWdN7/UqjkqoU0EIK2dW
 BZYEEQ9bviDWPNO5Zl+0DFaOw7Hi6RRf+6Br2Fcar0flBW5mTV4lR+ZK6Nm/Z2aWlVFZ
 ngbUBfHv6OTHEDsEIQgYeDJvX7MbIdZEpcVhMZ1pgd62aiufKl7npU37gFuihpID93IG
 wwSC5gLoapEnR4r8IRLwGZ0JjmbvlVcWJsp81wBxnifwDbhvSpgKBGXVshO/FzoS6lzk
 BKl4F/1QHu22XKk81GBf+gsox8Tp7Phu9jG7E/WuN5LR/0dUJuP/0l1/bcfgn4qkVqhq
 s64g==
X-Gm-Message-State: AO0yUKXNnXSRscGJxc7xyzvInMAXPTO5yLJ/MhAiDlOO2Mb5jEloDRDh
 D2wxw9ik7zm5cnILb7h1pkBp5mkmahIElKv2
X-Google-Smtp-Source: AK7set/N4djjq4CoAYtkK5jLov7XjWksfcbfMsH5gdiiVRdIA6o0Si1JqpYXfBkHFcweAZyEEl+U+w==
X-Received: by 2002:a05:6000:144e:b0:2cb:29eb:a35e with SMTP id
 v14-20020a056000144e00b002cb29eba35emr3237924wrx.11.1677506614134; 
 Mon, 27 Feb 2023 06:03:34 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a5d6a41000000b002c70a68111asm7316419wrw.83.2023.02.27.06.03.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:03:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 024/126] exec: Remove unused 'qemu/timer.h' timer
Date: Mon, 27 Feb 2023 15:00:31 +0100
Message-Id: <20230227140213.35084-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221219170806.60580-2-philmd@linaro.org>
---
 accel/tcg/cpu-exec.c      | 1 -
 accel/tcg/translate-all.c | 1 -
 include/exec/gen-icount.h | 1 -
 include/sysemu/cpus.h     | 1 -
 tcg/tcg.c                 | 1 -
 5 files changed, 5 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5357608b14..29b9bdac38 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -28,7 +28,6 @@
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
 #include "qemu/atomic.h"
-#include "qemu/timer.h"
 #include "qemu/rcu.h"
 #include "exec/log.h"
 #include "qemu/main-loop.h"
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 9e925c10f3..84f129337b 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -49,7 +49,6 @@
 #include "exec/translator.h"
 #include "qemu/bitmap.h"
 #include "qemu/qemu-print.h"
-#include "qemu/timer.h"
 #include "qemu/main-loop.h"
 #include "qemu/cacheinfo.h"
 #include "exec/log.h"
diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index c57204ddad..166170b08e 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -2,7 +2,6 @@
 #define GEN_ICOUNT_H
 
 #include "exec/exec-all.h"
-#include "qemu/timer.h"
 
 /* Helpers for instruction counting code generation.  */
 
diff --git a/include/sysemu/cpus.h b/include/sysemu/cpus.h
index 1bace3379b..0535a4c68a 100644
--- a/include/sysemu/cpus.h
+++ b/include/sysemu/cpus.h
@@ -1,7 +1,6 @@
 #ifndef QEMU_CPUS_H
 #define QEMU_CPUS_H
 
-#include "qemu/timer.h"
 #include "sysemu/accel-ops.h"
 
 /* register accel-specific operations */
diff --git a/tcg/tcg.c b/tcg/tcg.c
index a4a3da6804..9822c65ea8 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -34,7 +34,6 @@
 #include "qemu/cutils.h"
 #include "qemu/host-utils.h"
 #include "qemu/qemu-print.h"
-#include "qemu/timer.h"
 #include "qemu/cacheflush.h"
 #include "qemu/cacheinfo.h"
 
-- 
2.38.1


