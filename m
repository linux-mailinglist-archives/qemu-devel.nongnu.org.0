Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD40620461
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 01:00:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osC1D-0004Q6-A2; Mon, 07 Nov 2022 18:59:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC1B-0004Pm-HS
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:59:05 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC1A-0001Wm-27
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:59:05 -0500
Received: by mail-wr1-x42c.google.com with SMTP id cl5so18500112wrb.9
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 15:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gGjizUHazVMEhGpGHPz/tSQ2RTzswCYSaXcHonZGCKI=;
 b=aDQpPQOOIuRPCIbsGhazbvF5TfVzNjXghvrVtQoCYaR+/HHUH0QFdCLIb9QleD2eIK
 dxMzyWyDt8RmfDjA8P9xvw1IvLXqw7t8q7beEuAD3tY8gMQfOp7zZmY0qq/HEZG9LH2t
 F9GlrS6K0tHA0pkhEiahDYgCOqyI4ZZhX+TohtHPU3yoeFytTwX6oIwn3/HG/bBPU/KJ
 LqFT0CTJg47gLb+MNzkYXyxN1DPhdueEpuO92HUUljl773QcZapYL9rlTFQdyeV82hZE
 rDEjuqBHt0P5kueus7jbHCV0gngVucyOGDb0WKyHXy7YpObs33CG4Lnj1dmychqd7me/
 0Dvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gGjizUHazVMEhGpGHPz/tSQ2RTzswCYSaXcHonZGCKI=;
 b=Qv+T7nsRPhIDc1eO8kolXfwX2H7b3NBsK6UDlBkvUa4eqyCsHqBLHle3iDkSTrrCcN
 DVUsTbW0gaWRHU4tEiatbGTj8VY/qz1lzmYXR/LMKwSTQi/ctP3pVBvoM8AInU80TF+Z
 UsICB/Qbu3i+4oIl2qIx/HlxMlxj58RMpor1eYhg0AlK8mFjBkuTprC66ZPMgjUU5cz8
 O67AeKS9HC5ufXt6440x4tTj2679wx2LhA7qGmrmkL7JigVViohnGaOdr82iliSx7gmG
 pLj0o36PZ4TPf7v6JdJineyFXpen9gbWsGhPrlW14T16+uWdOTxXP8BiFfxjhkjZMFlU
 Assg==
X-Gm-Message-State: ACrzQf3ZXd3dM5Nz7OWg0envx8egx5OihChLU/EPpdK+hbeanUkhDoy/
 dFB8Gnf+AjKQqCL2NpUZGBC7ss/JCac/WA==
X-Google-Smtp-Source: AMsMyM4OrWnCVMb52BWYQsQb5iqHJPypk+uGRR435Cb7Y+H0Wkneyxacgf9TKZcTewQ4iQUroQqT3Q==
X-Received: by 2002:a5d:4644:0:b0:236:cb94:4c6c with SMTP id
 j4-20020a5d4644000000b00236cb944c6cmr28684573wrs.544.1667865543324; 
 Mon, 07 Nov 2022 15:59:03 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j5-20020adfe505000000b0023c8026841csm8730142wrm.23.2022.11.07.15.59.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Nov 2022 15:59:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Stefan Weil <sw@weilnetz.de>
Subject: [PULL 08/14] disas/nanomips: Use G_GNUC_PRINTF to avoid invalid
 string formats
Date: Tue,  8 Nov 2022 00:58:16 +0100
Message-Id: <20221107235822.71458-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235822.71458-1-philmd@linaro.org>
References: <20221107235822.71458-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

Suggested-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221101114458.25756-4-philmd@linaro.org>
---
 disas/nanomips.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas/nanomips.c b/disas/nanomips.c
index e4b21e7c45..3f45447292 100644
--- a/disas/nanomips.c
+++ b/disas/nanomips.c
@@ -95,7 +95,7 @@ typedef struct Pool {
 #define IMGASSERTONCE(test)
 
 
-static char *img_format(const char *format, ...)
+static char * G_GNUC_PRINTF(1, 2) img_format(const char *format, ...)
 {
     char *buffer;
     va_list args;
-- 
2.38.1


