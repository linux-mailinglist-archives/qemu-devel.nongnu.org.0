Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFEE39BDDC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:00:06 +0200 (CEST)
Received: from localhost ([::1]:36590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDAz-0002T4-Qs
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRC-0002g5-A8
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:12:46 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCR7-0003nJ-Tc
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:12:46 -0400
Received: by mail-wr1-x42b.google.com with SMTP id z8so9831691wrp.12
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dQ5wxdfmiKKfim62JoM4B+biad6w8O8eV+yYLw/gu6A=;
 b=UJ5lzGopsP9AQtjSgFaH1tpTRzHkHZ/Vq1B2TWuYenV1Wu/faEwBOseEXSRS5oigbX
 +4CSqyhboHFqh5+npL7V6R6cxMq/jE8LvXbq5G/46qWnKOOyWbI+ifSQcOnDbwM3HC66
 vyd7X1wxtPPCP3vmso89pBgQ1k3vEV6gfJu1QG4fNlKLqR5wMS6v0WgFSzTnSUItHsde
 su25ryqMMGLLXTyDYevVndq4Pw/RhI+O3PP/HXKibfnYP/bTS0a6zM7yWYA2VrCEqRGe
 FfRE277Derg5DcQy6/gWZR1luhFS9CN8dkuNrM8NNEOUj8p4Y3p39C5nWjEC2mdG0NsR
 g2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dQ5wxdfmiKKfim62JoM4B+biad6w8O8eV+yYLw/gu6A=;
 b=g36zxwWmLppCBeqtvOH96A6j7KmYKaWWutJ27BDylDo3fiQ48YLcuysAqB7t39BHFV
 Hd18q8BkrydbzG43cUzShV8WQZWDAJBv1RVnPBWFqd92zzGPt5RrjyH0Xd7e9ahfP4qd
 BdxnqXRjnGq3lNj3VFLuKgicIeqp28YGXEvDhTEWiadLlVr3JQWZGKBDhpW3ZOIKQJT0
 UEHdkFE38gQRZ54C+W/dy7rYIehi9uDouNfrOd17wS/2cfGMFpd2APpSUbyB8M0eK3Ps
 6RlT6bkqLFdgwqdlLvK1hNi4jlZoLSfvZpujCTmruAd7Qs1X31aRXvRDrodAaRVO537P
 MHyQ==
X-Gm-Message-State: AOAM533zHZBeDuM+n993OwDFEp9l9vSHAnS8F3v+vz7suNy+enoH47yI
 JFL2d5zQ+FZb6Hk4iBlFoQ9LOA==
X-Google-Smtp-Source: ABdhPJy0E5A78t5pbqJPgPl2OKCYyJ4M2NiHTQjl/OPl++T7//3MFdFkbe169O/lMiNl+dW7b4IwFw==
X-Received: by 2002:a5d:4287:: with SMTP id k7mr4860461wrq.98.1622823160471;
 Fri, 04 Jun 2021 09:12:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u7sm1508669wrt.18.2021.06.04.09.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:12:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1A3B920002;
 Fri,  4 Jun 2021 16:53:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 84/99] target/arm: cpu-common: wrap a64-only check with
 is_a64
Date: Fri,  4 Jun 2021 16:52:57 +0100
Message-Id: <20210604155312.15902-85-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

now that is_a64() is just always false when !TARGET_AARCH64,
we can just use that instead of introducing a new ifdef.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-common.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu-common.c b/target/arm/cpu-common.c
index b7a199a8d6..585223350f 100644
--- a/target/arm/cpu-common.c
+++ b/target/arm/cpu-common.c
@@ -305,9 +305,13 @@ uint64_t arm_sctlr(CPUARMState *env, int el)
 {
     /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
     if (el == 0) {
-        ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, 0);
-        el = (mmu_idx == ARMMMUIdx_E20_0 || mmu_idx == ARMMMUIdx_SE20_0)
-            ? 2 : 1;
+        if (is_a64(env)) {
+            ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, 0);
+            el = (mmu_idx == ARMMMUIdx_E20_0 || mmu_idx == ARMMMUIdx_SE20_0)
+                ? 2 : 1;
+        } else {
+            el = 1;
+        }
     }
     return env->cp15.sctlr_el[el];
 }
-- 
2.20.1


