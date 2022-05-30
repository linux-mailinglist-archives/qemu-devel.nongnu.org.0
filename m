Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67CA5385F3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:15:58 +0200 (CEST)
Received: from localhost ([::1]:52524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvi3h-000326-2N
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvM-0002dv-4F
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:21 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvF-0007AS-6Z
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:19 -0400
Received: by mail-wr1-x436.google.com with SMTP id q21so4085428wra.2
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jmdSDi7OZ3CLw863mo3YNTbjzT20pYO5UsVwQ0Hh3hM=;
 b=pPonqTdhlY5Iu5hOCS1urVfiJOleXxk6jYICjBI6A8ZyC/NvW8jwwtcFI0E3kJH86U
 XurGISrJAe/Z7dPv/W5MQmRyZN/JedVg5XV2RimqmOM1RHU6PhH+M5+vGpxo+IXcVSzi
 Qab7UD7ddGl+/VHoskQzG1av4G2kKVRvfkrA4y4n3HSap906ACxw4PDP48KA2o79Db3A
 eo1OZ22BGaRNL8npllydCQ8PJlS9fB4atFNJJ0NE4KJFggQZcAE18hLJ/V9jJC6eQEmf
 KkUTsOHb56J7pY624QGhiZJjHZJIMuqWdKcBd9h+fu5fyuH1vogDZPwHdqDXarJD2skH
 t64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jmdSDi7OZ3CLw863mo3YNTbjzT20pYO5UsVwQ0Hh3hM=;
 b=Q5hh8M5HXFa0jeLGhW5d3s29q1xB4tuXb3qDpLsfdPPsq57J5l5I0Gar02zVPCmneC
 tLpHcLM0TFE+4ufa5j8Jft3Gltuix0aHfnH8IHiX4E6dm11+MzGKk9qXBM7uYnWzhyrT
 BTOYWwrRT8lYez6Ms3TBgm/4hXEeeXhCrpVidrPX2NL8L8WJGJCe9P1ZzV05IUenkfL/
 n7deWE5XF42tmWQcyYhUgT7v8UEShYb7POoQBMvxGsEyxlxpDjpT6mg8tbppR6zCrEoZ
 9hKlfItsRlr+dHzeq0nMahJK3mCbNmE2jgrPmH9MpVYQ/ANNWvbVyg4KEvV5SV+Z5u3i
 Ke6w==
X-Gm-Message-State: AOAM5330vQ076BqOo5c/SrT48r6mH4kAnw2y9GzV2C8bA8+wr5sn434l
 YVd0q4MI/nyrRpwb4EWCrVNUqZfy5zarBw==
X-Google-Smtp-Source: ABdhPJx8s17Evjdt2ctSObOuJFBjGaEUoK5vpTUEVWaUDX1A2SAe7nfAspR19y1B7Ol/M95I87bg/g==
X-Received: by 2002:adf:f80a:0:b0:210:32ed:35bf with SMTP id
 s10-20020adff80a000000b0021032ed35bfmr5341015wrp.51.1653926831101; 
 Mon, 30 May 2022 09:07:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 001/117] docs/system/arm: Add FEAT_HCX to list of emulated
 features
Date: Mon, 30 May 2022 17:05:12 +0100
Message-Id: <20220530160708.726466-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

In commit 5814d587fe861fe9 we added support for emulating
FEAT_HCX (Support for the HCRX_EL2 register). However we
forgot to add it to the list in emulated.rst. Correct the
omission.

Fixes: 5814d587fe861fe9 ("target/arm: Enable FEAT_HCX for -cpu max")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220520084320.424166-1-peter.maydell@linaro.org
---
 docs/system/arm/emulation.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 3e95bba0d24..49cc3e8340e 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -29,6 +29,7 @@ the following architecture extensions:
 - FEAT_FRINTTS (Floating-point to integer instructions)
 - FEAT_FlagM (Flag manipulation instructions v2)
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
+- FEAT_HCX (Support for the HCRX_EL2 register)
 - FEAT_HPDS (Hierarchical permission disables)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
 - FEAT_IDST (ID space trap handling)
-- 
2.25.1


