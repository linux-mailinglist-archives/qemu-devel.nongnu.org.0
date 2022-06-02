Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B9253C0D0
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:31:04 +0200 (CEST)
Received: from localhost ([::1]:59702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtLL-0005il-Cd
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsh3-0004xL-4l
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:25 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:52095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsh0-0000DL-Rp
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:24 -0400
Received: by mail-pj1-x102b.google.com with SMTP id cx11so6028962pjb.1
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iCOG6DsXO7r1GwfN6wKfqvV2SzATr8uc1yKAbhFIADk=;
 b=WHTZ1AjzKSx6vBe8d+WassEtCMBWyrCv8R6MB+aGns5aLIh5dmWbrYAqAlEBvrNUf2
 fZrLPelzQtSjTOWqIP9zHrBzt4d9bDw5tVqB+kGZ//G1jWb0PebijjU0rbE4CcqndRVK
 Jz1U3/zO9I2nRWkLlJFUfgYdYg1GhxPiYLK0kQJROvJjh0WU7cXcfKHBECrtUBA/vQFv
 6gsFuzPg8uJN6Zi4InFl3v21YNIZpwCusaO90FjClSqlYvupr6vC94a4zdL5ioHTeo/b
 ZxUzDwnwJm3BTu/iF1xEOMALbgLkz+fQAU+9RQeSpYMGvS1nEt66xSCxlzv6bKaQDqVD
 5U+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iCOG6DsXO7r1GwfN6wKfqvV2SzATr8uc1yKAbhFIADk=;
 b=Fu2W4BSeSuQc+8xwCWjJEvDWZEJYM84Ut3t9nQsIiFT68b6hUHFzozY4kad06/XrnJ
 ToCdDokHVQA88uMO5MQaqxNtbyYY9jZ4C714cp9uCR8iXS6IZTjFfBedwwk2zhvaPRYs
 aggwZHQ758ICV0Mn+MZfJWZt57uc+jxwLhPz8B6fEFLqfx/yohkmuIkIsbcOvR2Y6cet
 8lggkzAmX0P6EfL+bZ1cwydhROFSZT31W47mDG1rQ8HFOhX7j7VzTYtxusDNFGVQf7df
 Jn2/z4vumRam5YrP8+9jz9F9aMxUHONdC7vFxhVa3zlgEkxY9axwOQKe5xuAYa5jjcOb
 SmEg==
X-Gm-Message-State: AOAM531mNiDw0A1Evz5ennS9wJqWHJxi3WMWd/zatZb0WfZAkPFA50Rp
 OqAVPfEjH+VNtM/0K7yFWsZoLZY1XY4BZA==
X-Google-Smtp-Source: ABdhPJxZQnwkKD+vVPMuPQ+WYUk4Wo3w8AxT2upjENfULfMQCIUX2Af7F9ocbnB9sfbvAeMqYe+WrA==
X-Received: by 2002:a17:903:288:b0:15f:a13:dfd5 with SMTP id
 j8-20020a170903028800b0015f0a13dfd5mr7035089plr.55.1654206561568; 
 Thu, 02 Jun 2022 14:49:21 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 31/71] target/arm: Move error for sve%d property to
 arm_cpu_sve_finalize
Date: Thu,  2 Jun 2022 14:48:13 -0700
Message-Id: <20220602214853.496211-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Keep all of the error messages together.  This does mean that
when setting many sve length properties we'll only generate
one error, but we only really need one.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 51c5d8d4bc..e18f585fa7 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -487,8 +487,13 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
                                   "using only sve<N> properties.\n");
             } else {
                 error_setg(errp, "cannot enable sve%d", vq * 128);
-                error_append_hint(errp, "This CPU does not support "
-                                  "the vector length %d-bits.\n", vq * 128);
+                if (vq_supported) {
+                    error_append_hint(errp, "This CPU does not support "
+                                      "the vector length %d-bits.\n", vq * 128);
+                } else {
+                    error_append_hint(errp, "SVE not supported by KVM "
+                                      "on this host\n");
+                }
             }
             return;
         } else {
@@ -606,12 +611,6 @@ static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    if (value && kvm_enabled() && !kvm_arm_sve_supported()) {
-        error_setg(errp, "cannot enable %s", name);
-        error_append_hint(errp, "SVE not supported by KVM on this host\n");
-        return;
-    }
-
     cpu->sve_vq_map = deposit32(cpu->sve_vq_map, vq - 1, 1, value);
     cpu->sve_vq_init |= 1 << (vq - 1);
 }
-- 
2.34.1


