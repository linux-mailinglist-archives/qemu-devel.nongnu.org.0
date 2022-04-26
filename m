Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9D3510767
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:47:22 +0200 (CEST)
Received: from localhost ([::1]:49184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQDZ-000408-8R
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmY-0002YN-9E
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:26 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:38763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmV-0004Mc-Ax
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:26 -0400
Received: by mail-pf1-x429.google.com with SMTP id b15so18710989pfm.5
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oxknAb8WZp8/c3OBXmugT+dPS7TU38e5j5a7fcIuSm4=;
 b=A6ej/pQ47OMHEP9PGF0kxeHiOWzJYZb9uwPq0j6LrLToaGLadL+FLS+BZaJnVln1fB
 sKCeG/LZdNU0nw/0Rq+LuqsCqF/9c7Zz6LFngs9hUh2H6rdVGsRkv0ZZzbfGm2tJPmKw
 g+35UpkXy5LwysyYOkrzAM/9gEV9LvTzgoxlGY5BeHEHh/MLtJd15cKaCsi39imuSdKT
 BX3MYFeGJ3ZkNWcQUfCInFkWoE0l6qT6Mbh1G9iQCvoL/dhfr/E/rU5mRGwtDZK2MYsL
 N+Kyia6u2WlGElaKWHiZLm0gyxvOOITdxOgum4Rs0GsYulxQ3wWfBzBFisRy/x43DE7d
 SqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oxknAb8WZp8/c3OBXmugT+dPS7TU38e5j5a7fcIuSm4=;
 b=1a8YlR5zAVcWBLtmHIH2UzBQ99Fwl533tdh3NTBjaCOy6RCIC68cxNAypzWTORnKA5
 yD3YiN2vMfytv6bqv3gO1k3BfGm1ftJUecK5XZRwERnNSdMk0t0u7M6V8Ygr/qZ/pN77
 rhynpTc2fZHWpJQrEDqrUTpiqNiznFPdAzbCK8PWWL9GjVSK6FN5N5YwTprLNe7Cy0gM
 up0vIf6NDVnuMGopGl5Fc1Aa6M9NxM1cuFwvSLEhRPztg31hdiUVIOxoZTbqQ3+wNq8R
 KEyAz9aBMlV23SQ/awfG1t03bXPqTixmM6WVjyjUmJSB2u7fqt1VHog+1d5mxif1ELoL
 bwhQ==
X-Gm-Message-State: AOAM531KgELLZTaU7sZVh904mDPmV88PbYOYBdIzCry2kjv7jiOf22jd
 OxIiPPGgKuOzm28eUOzorIsm+hcvRdWa6Q==
X-Google-Smtp-Source: ABdhPJxajNAXggiN8aS3ihsnByXJy9HxiRo+5j4RA9hsmdBD54zmT10lhZUMFqAE4fX995RSiY2Nyw==
X-Received: by 2002:a63:5d0a:0:b0:399:40fd:2012 with SMTP id
 r10-20020a635d0a000000b0039940fd2012mr21063148pgb.454.1650997162063; 
 Tue, 26 Apr 2022 11:19:22 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/68] target/nios2: Add NUM_GP_REGS and NUM_CP_REGS
Date: Tue, 26 Apr 2022 11:18:14 -0700
Message-Id: <20220426181907.103691-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Amir Gonnen <amir.gonnen@neuroblade.ai>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Amir Gonnen <amir.gonnen@neuroblade.ai>

Split NUM_CORE_REGS into components that can be used elsewhere.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
Message-Id: <20220303153906.2024748-3-amir.gonnen@neuroblade.ai>
[rth: Split out of a larger patch for shadow register sets.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-16-richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 3198c17213..09dc38a4e7 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -56,9 +56,11 @@ struct Nios2CPUClass {
 #define EXCEPTION_ADDRESS     0x00000004
 #define FAST_TLB_MISS_ADDRESS 0x00000008
 
+#define NUM_GP_REGS 32
+#define NUM_CR_REGS 32
 
 /* GP regs + CR regs + PC */
-#define NUM_CORE_REGS (32 + 32 + 1)
+#define NUM_CORE_REGS (NUM_GP_REGS + NUM_CR_REGS + 1)
 
 /* General purpose register aliases */
 #define R_ZERO   0
@@ -79,7 +81,7 @@ struct Nios2CPUClass {
 #define R_RA     31
 
 /* Control register aliases */
-#define CR_BASE  32
+#define CR_BASE  NUM_GP_REGS
 #define CR_STATUS    (CR_BASE + 0)
 #define   CR_STATUS_PIE  (1 << 0)
 #define   CR_STATUS_U    (1 << 1)
-- 
2.34.1


