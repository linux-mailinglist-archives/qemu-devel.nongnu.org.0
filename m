Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5820639BE44
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:14:07 +0200 (CEST)
Received: from localhost ([::1]:53628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDOY-0008MX-BY
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkk-0008QU-8I
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:32:58 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:56029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkb-0002Ah-Gw
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:32:57 -0400
Received: by mail-wm1-x330.google.com with SMTP id g204so5720154wmf.5
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QruW2yuHWroD/WpqnI/5LDTpQWpXeY+42xPYVRJQ+80=;
 b=vFqXM8X5vIPtKdmqPez8EQFPlIFyhbZeU71gi8KwCYJ0+yz7ha44qVqvSTjQLbN4zu
 mWgTia7lJReCWrKA5y49AcqoleL1c/BNLvFtkn3OUGlI6wWFqQJODMdWE+RatWzIzMMk
 CnjXllbRbQsrKZaBJet3ytN/2eMXXVD8u1tIZY9dArpq4BdywOIgASYFM9y4rLVMtHBk
 w3mfPZVknWqYBR05JnN+bMvT4xEeFK1rMqmF5/RSCz/wFmQ9RCQlDiFrQwCrKA5dP/2Z
 zIvR1LmIu29s5iRP6popwNplpL/Oc6f+JkOIhZR1FNbutFZsfFUZsmAWVPpEsRS+lb2A
 0qww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QruW2yuHWroD/WpqnI/5LDTpQWpXeY+42xPYVRJQ+80=;
 b=OITNgVXwb8i6rD5X9AeThexlzKlkz/Lj/tZm0r9c2HYp0vT/nttR8dqbqdPO9/sS8c
 hY0r+Y4TLCAfVrWq56tFur1rUCPhJV8bBj6DdNsMv5vtuUv8gxllW0NBhWc2ow0Zeb4k
 x3X0PoYOResZhUNVS9mDkkX6ZgodO7V3fR3Mjs0DZRWGEDpkB5HFObqDahrsI0Brx6mg
 j9jeI0ztGc25nYqnKqIMAMEeAminZ93Wn5ZV3Nh5/JnNTmz/OTuzSQo4gaZ36jsRjs5F
 s5PPMtkEb0lrH7hqAdx4gQK4aKS6MaozctazybmtZfGhGnTq781FByzMvb1MBpQcXD60
 9hZQ==
X-Gm-Message-State: AOAM531BopWN9PTiNs3dFyVXOp83a2gACBADqEZSe3WRDTdOAa2ljwNr
 JJb3uCdJJX1jw8RqXxK/B/+KAg==
X-Google-Smtp-Source: ABdhPJy12T0kC3vixKWYr/mUIN+evrh5xV5WaZUdZUG3S3u3GtOgATbqG3yicbqgnuzlUoUylGiDWA==
X-Received: by 2002:a05:600c:47d7:: with SMTP id
 l23mr4611072wmo.49.1622824367987; 
 Fri, 04 Jun 2021 09:32:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u14sm8911091wmc.41.2021.06.04.09.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:32:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A886D2000C;
 Fri,  4 Jun 2021 16:53:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 89/99] target/arm: cpu64: some final cleanup on
 aarch64_cpu_finalize_features
Date: Fri,  4 Jun 2021 16:53:02 +0100
Message-Id: <20210604155312.15902-90-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

bail out immediately if ARM_FEATURE_AARCH64 is not set,
and add an else statement when checking for accelerators.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu64.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 3058e2c273..ecce8c4308 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -473,26 +473,25 @@ void aarch64_cpu_finalize_features(ARMCPU *cpu, Error **errp)
 {
     Error *local_err = NULL;
 
-    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        if (!cpu_sve_finalize_features(cpu, &local_err)) {
+    if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+        return;
+    }
+    if (!cpu_sve_finalize_features(cpu, &local_err)) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    /*
+     * KVM does not support modifications to this feature.
+     * We have not registered the cpu properties when KVM
+     * is in use, so the user will not be able to set them.
+     */
+    if (tcg_enabled()) {
+        if (!cpu_pauth_finalize(cpu, &local_err)) {
             error_propagate(errp, local_err);
             return;
         }
-
-        /*
-         * KVM does not support modifications to this feature.
-         * We have not registered the cpu properties when KVM
-         * is in use, so the user will not be able to set them.
-         */
-        if (tcg_enabled()) {
-            if (!cpu_pauth_finalize(cpu, &local_err)) {
-                error_propagate(errp, local_err);
-                return;
-            }
-        }
-    }
-
-    if (kvm_enabled()) {
+    } else if (kvm_enabled()) {
         kvm_arm_steal_time_finalize(cpu, &local_err);
         if (local_err != NULL) {
             error_propagate(errp, local_err);
-- 
2.20.1


