Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D97213AD2EF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:35:03 +0200 (CEST)
Received: from localhost ([::1]:40212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKGc-0001gW-L5
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBq-0001dw-62
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:06 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:35345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBm-0001Uz-Is
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:05 -0400
Received: by mail-pf1-x431.google.com with SMTP id h12so8466039pfe.2
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 12:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZrJxA2097dXMmX/dlQGDy3yrhTNOTODlU+a5YheuYl4=;
 b=r4F0vv0K7h++rrjBcH4YVyP/irWyfQUiSAelLjujini/dwT8FILiWlr5gCB+Pt3W/7
 KyloRbt2sf7Dy34s95pn3jNrN/iF0Y6rozt9incqTi/CU1Y0bL5FMTpEsxxaYTMgpxrg
 SF6iYpwgJSW5XbJpJPcqU8T6LlqHuCj6cvJX+gU0CimfC0PdbKZBz6cmmo6l5b9EEC9Q
 24iOGk0hp1SYvyG5bK6dU6C1Vh2S+Sh8m1Ry5hJYvdPOt3foaZMSWWxXJQ47tJnmkY2G
 ePz2MvGa6rgm1xnYw+v66kKRTyM7OadrHRvQKimEku2hFgMcGA/V5WpJLMVhFHxJ4LTg
 4hUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZrJxA2097dXMmX/dlQGDy3yrhTNOTODlU+a5YheuYl4=;
 b=aTd6UnFL1bf8osBl+PIh2H+Jj3Ca/kxiokmseoNvoUcUmNEp7iljkUvol8sFRBh+FY
 Z6lV+FwiM9S2zP+lyc8hmqPY28khHff6tLUMw/KPo8iw0tr8wAjeyJ9mUfbOjixbBLoD
 J9UJq7FF0PMdE9EYbbfXsfDl3OuFc1ss+CCuuxfbpGJmdx7tPaoFiO8l1p/o1BnKrlrm
 wjzbuPgGEVn8rNG8XzlAojM0bvRo8rqOVYFkdipK6x17jTC6WQamP7dUVGeY2G6mgtcV
 +bk8vSozMOYBUoDuB9HzPr45oR95bcqnL+3DZ5kHMX8Wk3KdoeeLKqEO0RWjx+SbEPBf
 +hTg==
X-Gm-Message-State: AOAM533cfzXmTgSZH/ZcRehxi9hF/TtiJuXuIALEeh6O7CFGAdBDJ8Pa
 zzWUlPefeVxxK1XnCKbRFbfcn/1+k2dKag==
X-Google-Smtp-Source: ABdhPJwQdw9Z2mQJsTOHEWqtzZTzYA5c9UMd2yihPKHQoJ4BY/gVs+qcKBR1X+nSf4jgIzyNr5FNaQ==
X-Received: by 2002:a63:586:: with SMTP id 128mr3674093pgf.366.1624044601203; 
 Fri, 18 Jun 2021 12:30:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 92sm11938234pjv.29.2021.06.18.12.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:30:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/23] linux-user/nios2: Document non-use of setup_sigtramp
Date: Fri, 18 Jun 2021 12:29:43 -0700
Message-Id: <20210618192951.125651-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618192951.125651-1-richard.henderson@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Chris Wulff <crwulff@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/target_signal.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/nios2/target_signal.h b/linux-user/nios2/target_signal.h
index aebf749f12..fe266c4c51 100644
--- a/linux-user/nios2/target_signal.h
+++ b/linux-user/nios2/target_signal.h
@@ -19,4 +19,7 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+/* Nios2 uses a fixed address on the kuser page for sigreturn. */
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
+
 #endif /* NIOS2_TARGET_SIGNAL_H */
-- 
2.25.1


