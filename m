Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D4133153C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:51:56 +0100 (CET)
Received: from localhost ([::1]:33162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJK2t-0001yK-Cg
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:51:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkt-0006kZ-Tp
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:19 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:40818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkc-00075M-Lv
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:19 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so4303597wmy.5
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NB7nposQJpxyIMdm8nUqV5xwBd8WtTScPeFLeCpKkEo=;
 b=QkdGcnDy/453Vka3jxbjlAmdXZtoMB5ko8BWs8owJh1srEKNDWwEhHd82suRyZnb1A
 eV45jJJ4USfQ+WY2hFT8n1M8LviBY+rKegR48J4hRa0YoEU7Yi0+6GUQKGcR7CMFGBwa
 5E2WJK7EYN/Izj9wu4z00PbvUQNcVZWlywxkuFlvGa9BoH4Ono/PtGfkHjMarVi12Hi/
 TZSQNpDNQdaio8iSLrx7SEOE1RbG+uFyYR2s24y4WWmMad27zCuLJMjAc1WLKHamslLC
 1HoLvPdkRbuh+J7aNQhCh+q7+hlJkefuK4Y5L48ccIvRnfFVhD5ZO0hsJNkTu8m0/nJT
 iEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NB7nposQJpxyIMdm8nUqV5xwBd8WtTScPeFLeCpKkEo=;
 b=VFjVM4oCESozKZT0HdHXmaS/fJHTj1QGd1GoGx+J8mfbsJMgImPqmSYHvR1xUMvRVY
 OtMVbO17Ck6Hc4u+CvroR6Tsm1IR8mHNthfmSlsSYS2eQzdX9iNs8r3M9Mzuy6UztLyX
 zWH5X9wZg9APVprDwvnwEHJCI+hjHyXgjofC1BseIoFHJPP0utRx2O4DCj5fpw90LkDR
 O2QU14QMRSCvJStVGPuMa/2vt7eIffbepQBuxJgmPxycsGNNWdcrt4v0CEzxx+0AFs/o
 FnXu+aNDhnJiHBZd7CB0D487qzkjzeCuruD5QiQvT1yzl50eLuCGVrNj3Mz7w/eYX5DE
 qORg==
X-Gm-Message-State: AOAM530rm570I8oMUEYIlx7rRSR4qQe0Xr+Q94miw1DUKTUrIJz0+k3z
 edO5kE+2H/dFattFtu3QGm97WUq/crYcJg==
X-Google-Smtp-Source: ABdhPJz5AQqTsapHkD71vbUtUpoKHwYHb5oo01Jukqx8KOm78/I3mJKqCake+kfC9ZPYJr0/3wlI4Q==
X-Received: by 2002:a1c:b4c6:: with SMTP id d189mr22900111wmf.72.1615224780978; 
 Mon, 08 Mar 2021 09:33:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:00 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/54] hw/arm/Kconfig: Move ARMSSE_CPUID and ARMSSE_MHU stanzas
 to hw/misc
Date: Mon,  8 Mar 2021 17:32:09 +0000
Message-Id: <20210308173244.20710-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ARMSSE_CPUID and ARMSSE_MHU Kconfig stanzas are for the devices
implemented by hw/misc/cpuid.c and hw/misc/armsse-mhu.c.  Move them
to hw/misc/Kconfig where they belong.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-20-peter.maydell@linaro.org
---
 hw/arm/Kconfig  | 6 ------
 hw/misc/Kconfig | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 5b3bd1e866b..69a550a0fcd 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -522,9 +522,3 @@ config ARMSSE
     select UNIMP
     select SSE_COUNTER
     select SSE_TIMER
-
-config ARMSSE_CPUID
-    bool
-
-config ARMSSE_MHU
-    bool
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 19c216f3efb..16b96e4dafb 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -2,6 +2,12 @@ config APPLESMC
     bool
     depends on ISA_BUS
 
+config ARMSSE_CPUID
+    bool
+
+config ARMSSE_MHU
+    bool
+
 config MAX111X
     bool
 
-- 
2.20.1


