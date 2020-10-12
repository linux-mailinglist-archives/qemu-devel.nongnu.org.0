Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F8B28BC17
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 17:36:46 +0200 (CEST)
Received: from localhost ([::1]:34324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRzsT-0000S0-Bf
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 11:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzq5-0006MZ-BO
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 11:34:17 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzq1-0007DR-Sv
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 11:34:17 -0400
Received: by mail-wm1-x344.google.com with SMTP id k18so17959352wmj.5
 for <qemu-devel@nongnu.org>; Mon, 12 Oct 2020 08:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jFGBpg8QTM0wW80ptrMfB2TplDyv41drpm/PS9njFvg=;
 b=XV8umfJvSJXqFbxT3gHEcYkxjJhgGsSJq6EUVHE9M319Gvvb1wDfJmmkKxohnrRNGx
 FPZ1Q6FopWRAyyhooxMI7rkzsbyfGWh7XCFH9SVl4jWNsGBd6m6hAl7AitZ01bH4tliF
 0Y9ZxQ7Zlg2VPH1LW13E3B0Cxo5qU9mRgMvmn3GZBhQKnTaG8TkG7diEOmZEshogJulx
 SE4URXaOVbiNpM2JC+SICZ2chVIXIexHbm/mq+OsrGTn4RYVTMsniN+MlXEjeD883ynT
 /wE/TQSt2dkUsVg8Ka22il4bVeASf39mFNmmOZQa8qno2xzXzeWl/FlvX5xgbJ0UglLa
 RJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jFGBpg8QTM0wW80ptrMfB2TplDyv41drpm/PS9njFvg=;
 b=MgiTlBUy60w6ugb+qChQn6qA6F2ly2MWCzUY/gp5cHVKgfayLQn3X5m++FheVlC2CH
 mJBb2GjzY5CBkOJ8h//sbtL17/vY9jSsQuuVLih+7ZLAPIOhEHR8LnFF7WrgWDZMm4cj
 GoqS1KKiTkYLdx3WEBSUWG9LjlTZAePWrbCkKldk7CLz/uxixMWn4r/CffwNk07kuXRd
 EZAAt0wvQ9TiSBa6az0Ef9Xrn+FKDPgUc/c9ECS6BHelJVcMBkOKt2FWYbsoIHDrXSJ3
 pGn26gVkTNay/UI6f1ZGcrvfwlMdeQiiOSOpSVYxWe8zo+nSBS9lBjLuiudI015Wps4w
 OdRg==
X-Gm-Message-State: AOAM531MQKNTVTaVF7TSv83mFqmC5NFTf3lT9MejBepZMLXDvM/uO/xc
 osslGJLVhfnOXXhUXWHHw1jhig==
X-Google-Smtp-Source: ABdhPJzypsoiPwm2v8O3AuymBEmc7aEADWoLERICH7cmGoorUXvuoPYYonW3WodfQkNDSoGwYZiL6A==
X-Received: by 2002:a7b:c20a:: with SMTP id x10mr10758173wmi.29.1602516852533; 
 Mon, 12 Oct 2020 08:34:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] Deprecate Unicore32 port
Date: Mon, 12 Oct 2020 16:33:25 +0100
Message-Id: <20201012153408.9747-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Deprecate our Unicore32 target support:
 * the Linux kernel dropped support for unicore32 in commit
   05119217a9bd199c for its 5.9 release (with rationale in the
   cover letter: https://lkml.org/lkml/2020/8/3/232 )
 * there is apparently no upstream toolchain that can create unicore32
   binaries
 * the maintainer doesn't seem to have made any contributions to
   QEMU since the port first landed in 2012
 * nobody else seems to have made changes to the unicore code except
   for generic cleanups either

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
We last considered this back in 2018, but in the end both QEMU
and the kernel gave the port a stay of execution; the maintenance
situation doesn't seem to have improved, and now the kernel has
dropped support and especially given the lack of a toolchain
I think it's time to start the deprecation process here.
---
 docs/system/deprecated.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 851dbdeb8ab..4c52098c707 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -416,6 +416,14 @@ The above, converted to the current supported format::
 linux-user mode CPUs
 --------------------
 
+``unicore32`` CPUs (since 5.2.0)
+''''''''''''''''''''''''''''''''
+
+The ``unicore32`` guest CPU support is deprecated and will be removed in
+a future version of QEMU. Support for this CPU was removed from the
+upstream Linux kernel, and there is no available upstream toolchain
+to build binaries for it.
+
 ``tilegx`` CPUs (since 5.1.0)
 '''''''''''''''''''''''''''''
 
-- 
2.20.1


