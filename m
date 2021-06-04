Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F38E639BE54
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:17:01 +0200 (CEST)
Received: from localhost ([::1]:36632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDRN-0007zK-1a
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCke-0008Da-Cr
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:32:53 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:34638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCka-0002A0-PF
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:32:52 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso4548699wmc.1
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5E665klXVT6SgVYAKD/ACEUSAkv3dyFCri5JuwiYWIQ=;
 b=E5VZBNng/kVQRvDNyQZ6xIFIFh0io5q6S/g/QnrodIjXOZAep9gDcFhz2zlHj4+hPX
 PFrjs3KCp4Vupy18rFpz0pGME8NuyljiUaDcVUciwlNca8M3q26JnPhzY2U6BhgcYHar
 XVEzYcU6r26c77/C/6e1QVKfRw1BZZNIF4GW88u3rHzaQ7M7D5+gQrgN0LlvIn7OZAAQ
 slgukS01TUAHFfyGJFLcH1XPjIL4sEfiSoNe0DgnDNlt604bunngaC+sgjQ2XvM+jvG1
 2TlhLVTGYl4YhWvplZmY54GbuR9iRp36XnYlJ7U0dNFr/rqRM08vaGC5dJpBgH8J8nyn
 OSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5E665klXVT6SgVYAKD/ACEUSAkv3dyFCri5JuwiYWIQ=;
 b=mhVgKMmhHnGaRw7i4EYxIgfFYuS+ea/xWNJeddE+F4G7J5cC2KNnXywBxo3CO1fcty
 o19UVu7xn4z7klgOHh5tH3HO8t42+L1UDPQL5Ov5FdtoD0M16jLTmDebzbombKeg79aX
 i+CY+DqjrjefoJlANKLnDcuFk5wBSGeAqTFihZK0qeKbroMmKUFRSesmVsT75bMj4+Bo
 rPSHr5+Y6RO9Pt8TWqrZEJPS+pczL3ee1SGi7lWmz204b+qnTl9zCD+/JnY00+/WStzt
 T5ZfMM7C9/oBaYQU5gPRFyEGqSHqymNixYvm3lkZBI7qRZAXrIsQtbUEWbBl5aizIzXq
 cB4A==
X-Gm-Message-State: AOAM530SNzp+WPoZqGI2cqU8r0KeP2foFWBAw+RbdrntUn+7ObrnhdGu
 206mg5EFLT3II2BwBX4aZJsXMg==
X-Google-Smtp-Source: ABdhPJzPuvsEG+Y5zHvPQbFx0daEuH/fcRnH40fmpMpukBt1C4vV+H+EcO7C1Tdttg6hL8rpJuDErg==
X-Received: by 2002:a05:600c:2146:: with SMTP id
 v6mr4523210wml.131.1622824367342; 
 Fri, 04 Jun 2021 09:32:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b8sm5464966wmd.35.2021.06.04.09.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:32:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A236E1FFCE;
 Fri,  4 Jun 2021 16:53:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 56/99] target/arm: wrap call to aarch64_sve_change_el in
 tcg_enabled()
Date: Fri,  4 Jun 2021 16:52:29 +0100
Message-Id: <20210604155312.15902-57-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

After this patch it is possible to build only kvm:

./configure --disable-tcg --enable-kvm

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-sysemu.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
index c09c89eeac..2d3fe4f643 100644
--- a/target/arm/cpu-sysemu.c
+++ b/target/arm/cpu-sysemu.c
@@ -917,11 +917,13 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     unsigned int cur_el = arm_current_el(env);
     int rt;
 
-    /*
-     * Note that new_el can never be 0.  If cur_el is 0, then
-     * el0_a64 is is_a64(), else el0_a64 is ignored.
-     */
-    aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
+    if (tcg_enabled()) {
+        /*
+         * Note that new_el can never be 0.  If cur_el is 0, then
+         * el0_a64 is is_a64(), else el0_a64 is ignored.
+         */
+        aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
+    }
 
     if (cur_el < new_el) {
         /*
-- 
2.20.1


