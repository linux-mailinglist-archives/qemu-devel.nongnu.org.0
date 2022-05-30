Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFFF538600
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:20:49 +0200 (CEST)
Received: from localhost ([::1]:60146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvi8M-0008IO-TF
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvN-0002e5-6V
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:21 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:46991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvG-0007AW-4g
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:20 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 r123-20020a1c2b81000000b0039c1439c33cso1164091wmr.5
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=z/EiYIg0W6+dtf+QTbWYS+jOx0Pk8vnVY1fISas01J4=;
 b=kSps6zC81cchITJlV9DqAehU8MN3pIWwZPfsVjI7CHGg0KTNXSFt0PLL+VDy+viEwp
 O5CGVwwvXs5dactB0ZpTQt66sjKLvbjdwys8Cvjei+A43GXxlXauMLK3QUMtsiQJLKQ2
 o4ssVn/5TpOtc32cNEtFgs+TFpugIHAZV+NSv4F3WSf3orwSZ3hSusSQpWc2qldguifx
 XgSR8RS5VAxnkWPUbTr0YoUjwrP1N5Dyt9EwV0rS9/YHDrOx1vTXzP6/lBtMufq+E8JZ
 q9P8h62b5r9oH20DDQhGHt7SGVTHQeHLj9xp+FuHpzW+9WCOHm7WAyGWMb8LLhs2tM2A
 HWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z/EiYIg0W6+dtf+QTbWYS+jOx0Pk8vnVY1fISas01J4=;
 b=VEFscJm7mVNyi9qxMY3P6E7ful3qLTCVf8H/oU+FSC0Ho1rhvacpXJCShnXUMRXuuq
 zIPQEPwr4F3ae0Ly42/I/yXs50B/fvZXHfj7AqNucnEQQX8rcO4VlIjx47f14K7rhNrH
 DfnA/uCFzAKFpa38ptJK2/KjyMpssA0Upu/sn1jpNNPgg5SqbdRGfQAIxdnxL2CnWZaV
 06/333rin7KZm7jDw9QropKwNDmrqoI3KxNtWGSJIzpw4wtXi4fbkNzawX/p7FyTfSiE
 h4NnlsfSujxKSb53bm6SzdQgVUPRlcaobOnyMV7NGKcMmyB7xPftztBy6unu3JV8Lmvm
 JGcA==
X-Gm-Message-State: AOAM533OT7OCN3i8yIKZyLzxZooOxTDxgCTXTw1OqDkVXRucEfSHqL+e
 oBuZeoYTtPXTcT2ZkXQAYzvES3J1y7pzow==
X-Google-Smtp-Source: ABdhPJyB9CqeTJVs1JdK7xmkI63FPpxiRldpRCNvLlY6fIKFHN1ha13ET4Ig4x3v4xUNstKX/M/X7Q==
X-Received: by 2002:a05:600c:3ac7:b0:397:5cb4:a2b5 with SMTP id
 d7-20020a05600c3ac700b003975cb4a2b5mr19592605wms.5.1653926831789; 
 Mon, 30 May 2022 09:07:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 002/117] target/arm/hvf: Include missing "cpregs.h"
Date: Mon, 30 May 2022 17:05:13 +0100
Message-Id: <20220530160708.726466-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Fix when building HVF on macOS Aarch64:

  target/arm/hvf/hvf.c:586:15: error: unknown type name 'ARMCPRegInfo'; did you mean 'ARMCPUInfo'?
          const ARMCPRegInfo *ri;
                ^~~~~~~~~~~~
                ARMCPUInfo
  target/arm/cpu-qom.h:38:3: note: 'ARMCPUInfo' declared here
  } ARMCPUInfo;
    ^
  target/arm/hvf/hvf.c:589:14: error: implicit declaration of function 'get_arm_cp_reginfo' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
          ri = get_arm_cp_reginfo(arm_cpu->cp_regs, key);
               ^
  target/arm/hvf/hvf.c:589:12: warning: incompatible integer to pointer conversion assigning to 'const ARMCPUInfo *' (aka 'const struct ARMCPUInfo *') from 'int' [-Wint-conversion]
          ri = get_arm_cp_reginfo(arm_cpu->cp_regs, key);
             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  target/arm/hvf/hvf.c:591:26: error: no member named 'type' in 'struct ARMCPUInfo'
              assert(!(ri->type & ARM_CP_NO_RAW));
                       ~~  ^
  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/assert.h:99:25: note: expanded from macro 'assert'
      (__builtin_expect(!(e), 0) ? __assert_rtn(__func__, __ASSERT_FILE_NAME, __LINE__, #e) : (void)0)
                          ^
  target/arm/hvf/hvf.c:591:33: error: use of undeclared identifier 'ARM_CP_NO_RAW'
              assert(!(ri->type & ARM_CP_NO_RAW));
                                  ^
  1 warning and 4 errors generated.

Fixes: cf7c6d1004 ("target/arm: Split out cpregs.h")
Reported-by: Duncan Bayne <duncan@bayne.id.au>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220525161926.34233-1-philmd@fungible.com
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1029
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/hvf/hvf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 86710509d20..1fdc5eef92b 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -17,6 +17,7 @@
 #include "sysemu/hvf_int.h"
 #include "sysemu/hw_accel.h"
 #include "hvf_arm.h"
+#include "cpregs.h"
 
 #include <mach/mach_time.h>
 
-- 
2.25.1


