Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8153F7371
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:38:47 +0200 (CEST)
Received: from localhost ([::1]:48258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqIw-0002lX-OH
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqFy-0002i0-I1
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:42 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:40510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqFw-0005FQ-9c
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:42 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 x2-20020a1c7c02000000b002e6f1f69a1eso3916776wmc.5
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ovX+gLRUpgJWlCmrIqEwOljYQFDSIUjvrCkTGsB1Bic=;
 b=GkNx3mW3FavAqcSmL0s0NmrFV9jXOqoMjklEv/Z2FFOcKWfRApXTBuLT2AWwkBa5mh
 XweJHcUIrN13RLcthXK5c9GKJzVAeBDqUp4RZWBAoDswVLCtxu/M51LiZvd+GD7xdJXf
 lD2+Ptm7GkiOdJUktBOdjv+H9rU3tJLP/uNOYuECLAXC1WAqT3pd/qe1z0dlut9V8u4N
 uRzbxLUfQpZ/mYy0REpl/7YKtNprpXoT9r8i0O5xgXh/9MAi3kJkT3Fkks2t4z3LTYi2
 7jXhNfMe+zon3SQy5oW6gdLO41LZsSSRn4OIOVInaYxIRQEZ1aeAFdUVuWhboZxeejSg
 ysNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ovX+gLRUpgJWlCmrIqEwOljYQFDSIUjvrCkTGsB1Bic=;
 b=Gp/zHqc8sjhKQZE4cSGfI9NeYvR0OWqz1ZI8dht+EU6AvOH+UtYQa3gZJ24HwLGV7B
 VhEpAlWGH7xLSWxFZkQ/0n26a4fZd69AiXAVjYGVDHVp4J1n0qCcf98J5+/l1bBO5DYh
 BdQQyp40u+3lGwwQHMk/VTPlj/4XgXOw8rf29fD3GQgFX+NLqnwn1cZU+ZtP+AQD8Ovg
 +1abkX6U/hGxkoJlT8HZz2WASghr4BmgWL/KrJlwFeE2G8E3kEFcJRl2lBDTW9mrTr74
 S5/8vENIMjPgVuBz4M38FpTGixqSba9gRyCeoNEGmnxjEBDdtuONVoSsR2ky7KscqLRE
 8APg==
X-Gm-Message-State: AOAM5335Ww2ayg0pAeOLpZ4jGj/krBwzjLglYZvPu088BBJ3ZLMgs9JW
 plMLpSVYUaxy6kfGwog+UopD1MnQm4Asmg==
X-Google-Smtp-Source: ABdhPJxymnLlIsbwvbSYtcn+snUH8bpJdwGIa81oS5hgXtoGymlh/ZCLOLo/1OQY7miEgv8WVkY3CA==
X-Received: by 2002:a7b:c956:: with SMTP id i22mr2810595wml.82.1629887738769; 
 Wed, 25 Aug 2021 03:35:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.35.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:35:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/44] target/arm: Fix MVE VSLI by 0 and VSRI by <dt>
Date: Wed, 25 Aug 2021 11:34:53 +0100
Message-Id: <20210825103534.6936-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

In the MVE shift-and-insert insns, we special case VSLI by 0
and VSRI by <dt>. VSRI by <dt> means "don't update the destination",
which is what we've implemented. However VSLI by 0 is "set
destination to the input", so we don't want to use the same
special-casing that we do for VSRI by <dt>.

Since the generic logic gives the right answer for a shift
by 0, just use that.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve_helper.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index db5d6220854..f14fa914b68 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1279,11 +1279,12 @@ DO_2SHIFT_S(vrshli_s, DO_VRSHLS)
         uint16_t mask;                                                  \
         uint64_t shiftmask;                                             \
         unsigned e;                                                     \
-        if (shift == 0 || shift == ESIZE * 8) {                         \
+        if (shift == ESIZE * 8) {                                       \
             /*                                                          \
-             * Only VSLI can shift by 0; only VSRI can shift by <dt>.   \
-             * The generic logic would give the right answer for 0 but  \
-             * fails for <dt>.                                          \
+             * Only VSRI can shift by <dt>; it should mean "don't       \
+             * update the destination". The generic logic can't handle  \
+             * this because it would try to shift by an out-of-range    \
+             * amount, so special case it here.                         \
              */                                                         \
             goto done;                                                  \
         }                                                               \
-- 
2.20.1


