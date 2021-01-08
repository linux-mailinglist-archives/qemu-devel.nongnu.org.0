Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058A22EF7BF
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 19:56:18 +0100 (CET)
Received: from localhost ([::1]:52970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxwvp-0007mL-3S
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 13:56:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwrl-00029C-EK
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:52:06 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwrg-0000tY-0t
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:52:05 -0500
Received: by mail-wr1-x435.google.com with SMTP id t16so9984402wra.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 10:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2hPNMUgLjGsZrofLM5ryEx3n5GB4TeZrlJdrp1nvvfk=;
 b=refXlTezGFlTShhI14ujOQG2wRkydbRfMU1xpG2mLGK0IDxt30Iu6spwWEmDtqNBCN
 rlTnUriaKdxckSpcOTwMHRosc/gQ7cOVDPwZOZLLbPZ2wDqLPOGgbIuOn0GrerN7Ua+0
 TYYwV6UtJg+7yhTese+eP3oUc7UHkOlOSqs8UgiIjbwK58y0ao1t2DYak0wv9A3oiovg
 qEifirTyi9juzBwucnY5D5FVXAoYMProqX7vK0HQS52JqHX0x5Ul98cguXSQwhbhHZX0
 BnpfI+BB++rXsZM9HuO7gtLURS1Sc+vup2T5cZ9HONVMcZKAjsi43K+9xeaV5QlSg4iw
 uQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2hPNMUgLjGsZrofLM5ryEx3n5GB4TeZrlJdrp1nvvfk=;
 b=otP53appD+KpWe0/GN9KhvKVjH/6+DqQGNg+SSRFf8ghHzigMR95J5ZZcnMbnEjE3A
 NdmMktqOh/+ikb+FS3x7oEyhm4nDcQ4pUHI/zoVFk2dWvE1R9ag/LRhiCmWmD8Yd8H1L
 xZ7aRI6MTc+z4Mqiu84NMmC/XjXdOfZ+Ltyi7qnAoEz+q46uQkXViKsCezVKj68pwLV7
 oz3+125adS89RkK/cE1/YnsivdCW7NheS5VbdcUBxLLEDxDYVzJGnHwWvCWhDQSF8Ibl
 eoXzGcqf33XaYKja54QIM0bAssPl2IVdEm3NRsWXlmXD1BmxYF0HKYEPN5FUMxLJejNR
 4eyA==
X-Gm-Message-State: AOAM532lSmpv/Sgphtx92BpFbtqa+FcXgJReXO2NRotshzoqQeWLjK6R
 lPU0S9dwUA95Rb0rOuj4yM6wasCkMacM7suUfTZLaNNRWTc+6mdhwOUQmyQjubS5KJ2LBr/dGyn
 dFIZ/y/zhFVgKIUVJuWfn0X1ya6es6Bxgh9BDkEnxbvBbNXdB29NU1PpL7HxO1Akj8zdzNw==
X-Google-Smtp-Source: ABdhPJyDH7b4UK5Hn5qzzQQor/2N0wRAoAmoGNgBjgAsX8opPc324S1Su4XyxMGNWpmSbKR6lkXlVQ==
X-Received: by 2002:adf:b519:: with SMTP id a25mr4908777wrd.263.1610131918416; 
 Fri, 08 Jan 2021 10:51:58 -0800 (PST)
Received: from vanye.hemma.eciton.net
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id b19sm12353373wmj.37.2021.01.08.10.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 10:51:58 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/6] target/arm: make ARMCPU.ctr 64-bit
Date: Fri,  8 Jan 2021 18:51:51 +0000
Message-Id: <20210108185154.8108-4-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108185154.8108-1-leif@nuviainc.com>
References: <20210108185154.8108-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When FEAT_MTE is implemented, the AArch64 view of CTR_EL0 adds the
TminLine field in bits [37:32].
Extend the ctr field to be able to hold this context.

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index fadd1a47df..063228de2a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -931,7 +931,7 @@ struct ARMCPU {
     uint64_t midr;
     uint32_t revidr;
     uint32_t reset_fpsid;
-    uint32_t ctr;
+    uint64_t ctr;
     uint32_t reset_sctlr;
     uint64_t pmceid0;
     uint64_t pmceid1;
-- 
2.20.1


