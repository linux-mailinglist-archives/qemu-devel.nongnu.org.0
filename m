Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B2C5448AB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:21:32 +0200 (CEST)
Received: from localhost ([::1]:38862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzFIB-0003ar-KQ
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7V-0001cT-U4
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:26 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7T-00066W-Dy
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:25 -0400
Received: by mail-wr1-x42d.google.com with SMTP id k16so31480008wrg.7
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=kIvAW33Xnjg8FxQHlUQZrjhFZhed2xMGpf7iSMt46Cs=;
 b=Tfv6rHlgIQ/2qLYdA8pWVP7TGSU4nNZVGiLLKJSm9BEFY4fTJg2KLdNJ0bYdriMPt9
 Lg6DO5vuD7SmOw83Pg+urgl7Z6bVayOkOIk8wt0LxFYG6mwXNj2Z69OTtkxF8r0boihL
 qeysuxJShUZq2lKLkbHTL8qMnSGv7qL+tgvUZPjVezdE1GyGT5PFk7Cwv4tNNG8VWsW5
 HTwEM/+VlbYRoZbGTpZYWr40b9gW57czGf02C7Aecezd5euPvhGHDPDJEBQqjCmXDVPz
 Qgl9MixPO0rhrCvRcY0+bfE22EfNFpJKrFsAWAGx5gXrTVZ/7rqWdVS0mt2YZsdq2iVr
 YjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kIvAW33Xnjg8FxQHlUQZrjhFZhed2xMGpf7iSMt46Cs=;
 b=VL0/XBE0VkT7k1wdb8GSgNCFyqT82/JIrkOh4mJm1euDJyw9pylAmN1NSQpiJ232EK
 l1M5trT11ladn5eF9v6ZrR1Ffvd8WS6wO26fbvbj530I41vvyajf1gnpbjfbjExOIvGH
 RC7/jNt44aL/okNMTir0dsCTkPdQcTuQGxKl0t/tubIyV1hkmIA3fI1Axkm8G0dPeCJj
 f62NjcCqGgSkehcgigKhmlUknJgxJvIh2P5cH7H9b1THHnTQn7U9j+FZnPXFwztOCNBP
 zhQ5dk8vJmR4ycxfDUjDfEJMN2BnvKOxyZZSkhCCz+KKjnhJJt20jxZnyN4BPMo4wOE9
 jpig==
X-Gm-Message-State: AOAM533ocCqU7tpvdSZfy+C1ZnRITn/XJF7Vz6up/yiEN1rA3mTHHIMF
 5lDWg+4wOt+KL4Hb3tdlU4CFfG+6PxZXSw==
X-Google-Smtp-Source: ABdhPJx3CIh2KjQEjjFunJFfwehGEGpKoWzpLyQoOu62Yr5k2gQPiwvbbKTaouPKARoDU4Twq8AB4Q==
X-Received: by 2002:a5d:6945:0:b0:211:7de7:7247 with SMTP id
 r5-20020a5d6945000000b002117de77247mr37017126wrw.169.1654765581358; 
 Thu, 09 Jun 2022 02:06:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/55] target/arm: Remove route_to_el2 check from
 sve_exception_el
Date: Thu,  9 Jun 2022 10:05:20 +0100
Message-Id: <20220609090537.1971756-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

We handle this routing in raise_exception.  Promoting the value early
means that we can't directly compare FPEXC_EL and SVEEXC_EL.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220607203306.657998-4-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c228deca755..1bd77af7e50 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6149,8 +6149,7 @@ int sve_exception_el(CPUARMState *env, int el)
             /* fall through */
         case 0:
         case 2:
-            /* route_to_el2 */
-            return hcr_el2 & HCR_TGE ? 2 : 1;
+            return 1;
         }
 
         /* Check CPACR.FPEN.  */
-- 
2.25.1


