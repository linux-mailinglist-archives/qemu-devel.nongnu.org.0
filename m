Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9C151BCC0
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:06:52 +0200 (CEST)
Received: from localhost ([::1]:55030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYNn-0006yy-BK
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWp-0005FG-T0
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:07 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:43667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWn-0003HP-EJ
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:07 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 r1-20020a1c2b01000000b00394398c5d51so2243166wmr.2
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0QUzI2/FD81tuRNLLLXX+GyatmmpQmLOhxx+o3WhZiE=;
 b=SbANoYQJFLLJ3c8jbLidGtYUk+tVGDnAHYHFP53ilfZawv2sexopLVJJcG1vJSUgbo
 uwJ1EL4Ag9aakIeSJ408fPu/h1eS5LbLiSKce9Hcnj/WTEyzzf/GKmKz2sEjdmZOSfsl
 el5T+3hUZTgdK8Difd4PC/h9XuG4ohnC3hKwGOrto9r3pvOphyfY+sM7BnQIzSsqdlz0
 lH21RevOOcKEHiwBjPSoDIxz8VZbvZ6yDO6lEKmc2vafG1RGLd+YK8xPw+wWRpm1cWYg
 X/f411vhsF+gLHKnmToe3wAQgWvIEb1gK616lzROPqfHMNdhQ8y6EOGUFUdQsjoJQKru
 P9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0QUzI2/FD81tuRNLLLXX+GyatmmpQmLOhxx+o3WhZiE=;
 b=hTNqztVeN4m5jd2/C+7TqQGqttwO0Vx5RJEeWcH9E4U5LuQ0ap4nXqTZ/QxkVx1Djb
 xyd+NrtGT7QxBx5ghlZNRdsxBDjE2HnJBF6NXfq4uEjx+Mf8U2LVYNdBL4k0tOZ0rq4b
 jINFGGOxmWNCEQBp5c53Rza0bfFaG1NovOKn7Qgd7MnOWx6MlRVxFSmfjLFnXVbOQoFJ
 PzT6YQhqUXKoXWrmQmKN0kQN5NeeWp2/8N1cvf6N4PlZUXZjikfLzAmUUlctl6vHdkWQ
 ed/kZ2A2LlIm8Mr4Zx9AeONnXIYI0P+ZMJkh5vAxEnw4AoCpNIK4W2K7lzlxxcLbt0KU
 hC0g==
X-Gm-Message-State: AOAM531wtvds6m8ZjM/MAi6XfdrCVZuQDz1+SY6ZowNNcbCdUdg1LRSF
 HNCi0f5cJ5gwixSkj3/9cZueIUaUdiTmiw==
X-Google-Smtp-Source: ABdhPJz5Kec+w4le8b3NITX3D51pfgNHsNyl03vaJCSDSEU/dYgYp9C20Tu3AQDP5LB15bNywt4jew==
X-Received: by 2002:a7b:c095:0:b0:393:fd2e:9191 with SMTP id
 r21-20020a7bc095000000b00393fd2e9191mr3587417wmh.137.1651741924565; 
 Thu, 05 May 2022 02:12:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfe50e000000b0020c6a524fd5sm841612wrm.99.2022.05.05.02.12.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:12:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/23] target/arm: Use bool for is64 and ns in
 add_cpreg_to_hashtable
Date: Thu,  5 May 2022 10:11:40 +0100
Message-Id: <20220505091147.2657652-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505091147.2657652-1-peter.maydell@linaro.org>
References: <20220505091147.2657652-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Bool is a more appropriate type for these variables.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220501055028.646596-16-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8ee96d5c042..bba010d7cf5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8507,8 +8507,8 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
      */
     uint32_t key;
     ARMCPRegInfo *r2;
-    int is64 = (r->type & ARM_CP_64BIT) ? 1 : 0;
-    int ns = (secstate & ARM_CP_SECSTATE_NS) ? 1 : 0;
+    bool is64 = r->type & ARM_CP_64BIT;
+    bool ns = secstate & ARM_CP_SECSTATE_NS;
     int cp = r->cp;
     size_t name_len;
 
-- 
2.25.1


