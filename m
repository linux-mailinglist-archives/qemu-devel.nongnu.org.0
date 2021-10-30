Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0508440A89
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:20:00 +0200 (CEST)
Received: from localhost ([::1]:34314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgs1P-0006ve-Px
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrpd-0003fD-7A
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:07:49 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrpb-0004ri-Cp
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:07:48 -0400
Received: by mail-wm1-x331.google.com with SMTP id y196so1228060wmc.3
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BqzEw7yUxiaZ94tLfUkzwAZHnZ1n+ceNrdq9HHkBLlI=;
 b=iuYwz4GREiMoshQjb6UJgdhCRJIOUv4Fxec16uUB3mvr7mgMt7/KHqgnwVXlUhZQGs
 OrcDo6U3HQpA9ByUJGje2CBlwvBtmAsERcKsTHqAJUd3kFAxxFlxrUDdD96//f+Ble+4
 w2edkm1/iWWHoWvIUR7FyysQOBI4EKivSXVZgHNZPMFuzdwakAPFFmQ/sCzkL2u4dsrh
 dKXdM7t+kNNH79SJwOJVh5kfhl84f5YXaZdESZKgjx+M9/GmW827jgTBVlD9hyfTu3jE
 jxX+GMuLjIGtksZq/YNDOvnfeCvfXSUHK/Cmy2QfCluF4vcm1d6PffJflG53HpAaoTVX
 BVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BqzEw7yUxiaZ94tLfUkzwAZHnZ1n+ceNrdq9HHkBLlI=;
 b=4X9JxgqonAXwr701UBKZGba88A7O8uKCJIx4PKXELK6s7mR166mpVW42yrVdLsjc7X
 5OVJVbkbmOV8ABQxxI5/XY1WoCQGtJDiCPvSGulrKRgL7B4dLHRPx2Rw2F8Dmkkl0h4u
 mL5pbEXQIqkrr3R5hNQXIfwiIEpSJq2dafS0dZqG3PxOtasIzNYkwj1BjfxKwfHulCZ7
 NgKsKWDYc+GgSCMPKVEiVByV3AlD9CAYS9xZIZ057+XkZnu9J/7CgTEmu0Q0yFNsFNID
 aK24AUlZTC0X4/Pu7ZMYOCJ5IGD5+bMeYWOAqi+AaSW9UiX0t9Qg8eqRQY8bTchpmtzH
 u6gQ==
X-Gm-Message-State: AOAM530LhfXovbg0jhckGh8yIBSrilSp7r4DKacuDx6Y1XrS8oon9Ez6
 yh20PxcbCjCOXqcZuotjDLLzBQNu0ZU=
X-Google-Smtp-Source: ABdhPJyyBwvBfEGThcbdy+Je2bgd9jlN7j+vACan5Dp8aFTxqyWUhwwSXY/Lk3h0MO/C2Jl/lRtF6Q==
X-Received: by 2002:a05:600c:35d0:: with SMTP id
 r16mr27623800wmq.97.1635613665245; 
 Sat, 30 Oct 2021 10:07:45 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 t6sm7930369wmq.31.2021.10.30.10.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:07:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/30] hw/intc/sh_intc: Drop another useless macro
Date: Sat, 30 Oct 2021 19:06:03 +0200
Message-Id: <20211030170615.2636436-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211030170615.2636436-1-f4bug@amsat.org>
References: <20211030170615.2636436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

The INT_REG_PARAMS macro was only used a few times within one function
on adjacent lines and is actually more complex than writing out the
parameters so simplify it by expanding the macro at call sites and
dropping the #define.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <d3bdfdc5ab5ae1c51a6c6c38bde3829a99f85ce5.1635541329.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/sh_intc.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index 175d12b371c..b908be0ff5b 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -432,16 +432,12 @@ int sh_intc_init(MemoryRegion *sysmem,
     memory_region_init_io(&desc->iomem, NULL, &sh_intc_ops, desc, "intc",
                           0x100000000ULL);
 
-#define INT_REG_PARAMS(reg_struct, type, action, j) \
-        reg_struct->action##_reg, #type, #action, j
     if (desc->mask_regs) {
         for (i = 0; i < desc->nr_mask_regs; i++) {
             struct intc_mask_reg *mr = desc->mask_regs + i;
 
-            j += sh_intc_register(sysmem, desc,
-                                  INT_REG_PARAMS(mr, mask, set, j));
-            j += sh_intc_register(sysmem, desc,
-                                  INT_REG_PARAMS(mr, mask, clr, j));
+            j += sh_intc_register(sysmem, desc, mr->set_reg, "mask", "set", j);
+            j += sh_intc_register(sysmem, desc, mr->clr_reg, "mask", "clr", j);
         }
     }
 
@@ -449,13 +445,10 @@ int sh_intc_init(MemoryRegion *sysmem,
         for (i = 0; i < desc->nr_prio_regs; i++) {
             struct intc_prio_reg *pr = desc->prio_regs + i;
 
-            j += sh_intc_register(sysmem, desc,
-                                  INT_REG_PARAMS(pr, prio, set, j));
-            j += sh_intc_register(sysmem, desc,
-                                  INT_REG_PARAMS(pr, prio, clr, j));
+            j += sh_intc_register(sysmem, desc, pr->set_reg, "prio", "set", j);
+            j += sh_intc_register(sysmem, desc, pr->clr_reg, "prio", "clr", j);
         }
     }
-#undef INT_REG_PARAMS
 
     return 0;
 }
-- 
2.31.1


