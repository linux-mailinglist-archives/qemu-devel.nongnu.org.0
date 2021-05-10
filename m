Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81019378C4C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:34:32 +0200 (CEST)
Received: from localhost ([::1]:35336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg57H-0002o5-GO
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z4-0005qM-3y
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:02 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:47065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z2-0003Dt-EY
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:01 -0400
Received: by mail-wr1-x432.google.com with SMTP id x5so16404065wrv.13
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=npXNIiYkeWt5H2uCDWYRlI5CamdzntGn3P3qzZfcjMs=;
 b=JRlLrIsRKJGGbovlOGiY2o9e0uyuegJN96HmHlgCE3d4cwaKTu2zQKUaC8ed58kFKV
 DXF9lOvHu+E7WNTomksN3EQ0vAO+sl6CpuCaaFS72p57YzOnG+6HUPzMptCtbBLzE/IY
 ulS0M3u8g3VA5n9xCloJlhS33GmnWrEutk2U6z3SU8m+844VTtakXYceUnK8U3QyrYmm
 5+FQmnHawp7NwXcYm9L29dmdPrumJbsYU/M/f/MgMju5lOMeDZaD4EEl+83x+4I3VtZ6
 U4pG8EentSMZeJx8x6Ff6kIv92PXyJPBnrshHXhSFWAxS30sEXToMO/XAafux8euQitU
 DWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=npXNIiYkeWt5H2uCDWYRlI5CamdzntGn3P3qzZfcjMs=;
 b=AgeE0NZtRV5ZVN/qJIf7OGaNtq0t9mdjxH8MWb5EoEUvC4o7Z14C+6rB4g5ytdbacC
 O1RVHzpyvGQbd1/V5CwUA43rvg8IaXi8hutJ9P4K91i9URK+K57DNTfeSxtXeuObA8lF
 unsyujvVpt3wwIkG+WdXUSq6Xnf7iAVFnYPmtyXDhkecoUTEGPFh3CdBVVVU/J7HdUuL
 Y74MKfQ6075KUdNeREtSDmtNDETsxpqQ4FPkHVFJEfIPkK4L+Dv2HxNQAqFXahfBBWNc
 TLTf2FrT6AIXDOmiXzvZq5dqu22zylutjHuqEYBzD5V/yBtbgLJctDHO7s90JP+zB3/d
 eSZA==
X-Gm-Message-State: AOAM532KUoazH+4KDQGEM38+ODgdkBzAjgAhTgoIDZ6UxNbMbkHifVDS
 srNtv40VJe4rHk293CvmgpfTXCzjNNL4wQ==
X-Google-Smtp-Source: ABdhPJyJUnWL6Nh5M1tjo1pbNeZHju3trhRkRhx0JffTZKDJCNpEXPzK8Is5JnKnQfKq/6LlB2cdnA==
X-Received: by 2002:adf:dcc5:: with SMTP id x5mr31003477wrm.1.1620649559162;
 Mon, 10 May 2021 05:25:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d9sm22749897wrp.47.2021.05.10.05.25.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 05:25:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/26] target/arm: Delete unused typedef
Date: Mon, 10 May 2021 13:25:35 +0100
Message-Id: <20210510122548.28638-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510122548.28638-1-peter.maydell@linaro.org>
References: <20210510122548.28638-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The VFPGenFixPointFn typedef is unused; delete it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210430132740.10391-11-peter.maydell@linaro.org
---
 target/arm/translate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 095b5c509e1..58cb3e8aafe 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -69,8 +69,6 @@ static const char * const regnames[] =
 /* Function prototypes for gen_ functions calling Neon helpers.  */
 typedef void NeonGenThreeOpEnvFn(TCGv_i32, TCGv_env, TCGv_i32,
                                  TCGv_i32, TCGv_i32);
-/* Function prototypes for gen_ functions for fix point conversions */
-typedef void VFPGenFixPointFn(TCGv_i32, TCGv_i32, TCGv_i32, TCGv_ptr);
 
 /* initialize TCG globals.  */
 void arm_translate_init(void)
-- 
2.20.1


