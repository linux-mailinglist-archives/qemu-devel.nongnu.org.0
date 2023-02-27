Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 341C76A43AC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:05:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe6Y-0000sb-QE; Mon, 27 Feb 2023 09:03:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe6W-0000on-64
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:03:48 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe6U-0007t9-LG
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:03:47 -0500
Received: by mail-wr1-x431.google.com with SMTP id r7so6341297wrz.6
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3T9UbW8I9A0yfvG+yJvRZjmnRJP1MBpZUv/14zFw1WE=;
 b=hOYliEGODC4JBFj+J8wwjSqW/Vt/61381+kM8K2rmBzkYDwFRVwydeFK8bSfY5ubLH
 N7l1bkzrAr6aWMrxb9UIVfaj6VD1TR7Hq/2ZUUfzEuv6DIXzwCa7SOVA4LnrNjlj4qzh
 s4GNzHm5E5y15l/ny4r/cKiE8WARgAJ4i5AYaVSVBOeZFibxyWHlZYX7sRIzCzzf1qM7
 MwpBGXovtkSe4htbOiQbV1g1x5uKOvDJoEQAA3ZLS5qzcD0FHib/81rovd4HDv86WAut
 HsuohbeRiFYTyGAjRWct3B3RSz5g53QA8e5R5HaocMPjyShJ3wvbodO9UGSfB8TUpbQe
 LdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3T9UbW8I9A0yfvG+yJvRZjmnRJP1MBpZUv/14zFw1WE=;
 b=KAY2BdQC4YOrcTw3nAEAB6tm0EXxE9VzbllHs/Tlw0J69OiyzNbmGZiO4oXgI1qTWI
 aFZRMU3WKsS0xAoGcZ9y0IrDrnM42VdmDuzvCX069fxyFaQQ+74TfkcpRd2GFrngxutX
 JQRkISNNEfHS3PVthX4Qxg/uW3o+9X0WBn7K6p/l8pW3AMpZXyc9QB+XIHpBE2Ijjr03
 Bp48boZKp6swSiLVz030SUsyrSLqWwnG/jwfjdXwWq6rtov4rFOkieLQlOJ6mG1bnyv4
 tSZIJQljZtW+rrSONYFFu/+DZ/bIgZ4+M95paN47dLfmwtzmV4c4YNFBo8X3vVkM4Iv9
 uIsQ==
X-Gm-Message-State: AO0yUKUT/QwLinTksq4IwezGpUfG4jXOxPxXjKV1qHtkPS7wom+VhqTl
 SG/XaqraTN/gn+FwH4AcoNGb5iVGQ4ouhnlA
X-Google-Smtp-Source: AK7set955xCaH+B9pIXGjJD1jmmz2eErXbG4Tb35NAxY7eE+UQQw0dhJNlCg/Uaq5xsLxrPTU2d4Sw==
X-Received: by 2002:adf:f04e:0:b0:2c7:17a5:8687 with SMTP id
 t14-20020adff04e000000b002c717a58687mr9881532wro.0.1677506624523; 
 Mon, 27 Feb 2023 06:03:44 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a056000124800b002c71d206329sm7171921wrx.55.2023.02.27.06.03.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:03:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 026/126] tcg/tcg-op-gvec: Remove unused "qemu/main-loop.h"
 header
Date: Mon, 27 Feb 2023 15:00:33 +0100
Message-Id: <20230227140213.35084-17-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
Message-Id: <20221219170806.60580-3-philmd@linaro.org>
---
 tcg/tcg-op-gvec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 079a761b04..aacedd3e15 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -21,7 +21,6 @@
 #include "tcg/tcg.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-op-gvec.h"
-#include "qemu/main-loop.h"
 #include "tcg/tcg-gvec-desc.h"
 
 #define MAX_UNROLL  4
-- 
2.38.1


