Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5BF52F698
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:11:46 +0200 (CEST)
Received: from localhost ([::1]:38342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsCif-0000PR-4S
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbL-0007zv-9O
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:11 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:45846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbJ-0003yJ-OQ
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:11 -0400
Received: by mail-pl1-x633.google.com with SMTP id q18so8553151pln.12
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+d9/jr06nswWZQd9Uw/cJzKLCMbhQR5Mz1vx++OuQjc=;
 b=MUNBlr7H6MFyk2Ky/KpfGeRE1qKyJQqE6r0ZhBFuhvvGRMV0yfGhUlTINLBLmund0u
 DSf00Ur2t5KvB5sLJPd7BsWDh6pAYdMYpV+aQN2jX+Vx3huZj3168XIcJaYt0uzjUmUR
 9wEFh+Cg0ombwJrBR32npC8+nxMGYnVd5JcshuxACRAKdX++aYpJBKi4C1LjOo/A6jI8
 Apai37L/cE96AshiWrRIMMFV5tn15ESaeNUGKeuYNC+0mzWmuLpBixoE8YPdwEVWwfUW
 bt62cKehddpWWjdWEMkt6EKdi80vboqqNd5wcBn/MIttmW1EdlgyCLCIGprA2zPUVHAO
 MMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+d9/jr06nswWZQd9Uw/cJzKLCMbhQR5Mz1vx++OuQjc=;
 b=CG5F8YY00pS9uPoI/dxojamerdsaHMsI4kVgQSZOgSi1/MjMaUTTgNqoi1xpNAuiMW
 ENcchxf7leOlZ/oolpl8MZXofd9j8v9/q0g2EiGWry+VIpONJ9tmov3X7lpR4XdKbwJU
 hGxZigMMrhPBiPn6YM87lmk2Kra2GwGm8RACuf748NgB7OXv6URn7Oux8YUW3rPwPL5X
 9WK7uhKAGrTUJTF8/+a8GEANIeyRM3/2GbarR3sz0G156bTnDB2sV+M92W3tKK/DJ+OH
 N9oBCcJt/heUwuU+JYNH4YqmLUEUd2lJZyf3JDDmBusUTqRy9a4EnGq3fxEsA5jExOSq
 YfKA==
X-Gm-Message-State: AOAM532tVy4M1/J/yr0pldnZNm/020l2/qLzfVzUE1iD3zYicrfkXsBn
 gvL8Ci3RYMuNsddycLbYzrDhEBeZNtQjuA==
X-Google-Smtp-Source: ABdhPJwrz/o1vcREE6G9h8f5q/6TFgBazp2Y6YB0P48YFXzMR8Dx7lFwbQZqYIDIIJAg8xcpzmUxNg==
X-Received: by 2002:a17:90b:3a85:b0:1df:f22e:cd9 with SMTP id
 om5-20020a17090b3a8500b001dff22e0cd9mr7530803pjb.206.1653091446561; 
 Fri, 20 May 2022 17:04:06 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 03/49] semihosting: Improve condition for config.c and
 console.c
Date: Fri, 20 May 2022 17:03:14 -0700
Message-Id: <20220521000400.454525-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

While CONFIG_SEMIHOSTING is currently only set for softmmu,
this will not continue to be true.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/semihosting/meson.build b/semihosting/meson.build
index ea8090abe3..4344e43fb9 100644
--- a/semihosting/meson.build
+++ b/semihosting/meson.build
@@ -1,4 +1,4 @@
-specific_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
+specific_ss.add(when: ['CONFIG_SEMIHOSTING', 'CONFIG_SOFTMMU'], if_true: files(
   'config.c',
   'console.c',
 ))
-- 
2.34.1


