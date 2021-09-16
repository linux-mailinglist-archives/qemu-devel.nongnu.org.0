Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE18B40DE81
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:48:39 +0200 (CEST)
Received: from localhost ([::1]:51286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtcs-0007lv-KP
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLV-0001Ni-Oj
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:41 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:42516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLQ-0002Sr-Qb
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:41 -0400
Received: by mail-pl1-x631.google.com with SMTP id n4so4081699plh.9
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jAI1XCWGYN+pfAsCZFTEnAEoAetKy0IcJx6ab0+wDcg=;
 b=TBdmkxtq2CIedgYBkpubctNylv4K0FRXEIb4ZxzRTzQKYTi0ngXTmpFYUGCYF2SgND
 lZ6pf0mdlihvz+Ui2y9nFtkCcYL/IoAlkm94/n2ZcRHnoVMFD1aiBcPy53RnHzvPgmay
 z1i7WzW4yfNvFxIyx4qmBdL6CpqV55O83Qzr4Pa5VrsTkz7vLnm0eyLuuIrFX/3X5Frr
 2UgCYZFhs99GyAEE1PEnVSe9YaEiumcitP3hOfmne0eb46tJVbSOoRDAwMYfS6okmDwL
 hyK0gsa+2KF1flFx81DTd2tEK3kemS6Ft6cRpPuUiLnRg/w27jFtVumM3UfiL/eQ7WBU
 dE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jAI1XCWGYN+pfAsCZFTEnAEoAetKy0IcJx6ab0+wDcg=;
 b=LANVUyiVtxCXeIo8a7OIsY7JFAjfMNBo46m/miq5hylJnPlvSWpz3FeDTKxK4QlLby
 Dpb44+cy4xjXPGy3BrBuA6nDCiP1AEZK5+8BtKLu9NafGXwUH/fb9ZTzDBjXhHWiuXVy
 inCfJYzv6Mw/h1ENPRXfQHe1BLK2r8VMd92p2CV27Dzb6cS7BRavJAqRYUWCRXh2QIBX
 oL+d6RRan8d+wElmd1YeZSk717WLn0gKIVkV9rtHqdGuIcGVyVI6DJpE8dRPgUEA6V30
 +VnMCLLng66E4UYkjF3b4tZigkmcrNnQKKdW1/ZVAwbzQu2JxPLxlUESP/8mA76N0VL6
 02gA==
X-Gm-Message-State: AOAM531IgZkJGDCfHNIWrPvpAfqHblSNexhhzYi6d3dwWgDoqRspvr9o
 JDbkcQVGD7aqb/XPSnsJapiUIKS/AfUJKg==
X-Google-Smtp-Source: ABdhPJwEe/kKX98Lcuz83h2dgghHa5/Jn9n0tQZMAjcj1Mna4ytGUQVsvdujj2caalgRuAwNLPNIfQ==
X-Received: by 2002:a17:90a:e7cd:: with SMTP id
 kb13mr5262807pjb.52.1631806235338; 
 Thu, 16 Sep 2021 08:30:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/35] target/hexagon: Remove unused has_work() handler
Date: Thu, 16 Sep 2021 08:30:03 -0700
Message-Id: <20210916153025.1944763-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

has_work() is sysemu specific, and Hexagon target only provides
a linux-user implementation. Remove the unused hexagon_cpu_has_work().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-13-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/cpu.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 3338365c16..aa01974807 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -189,11 +189,6 @@ static void hexagon_cpu_synchronize_from_tb(CPUState *cs,
     env->gpr[HEX_REG_PC] = tb->pc;
 }
 
-static bool hexagon_cpu_has_work(CPUState *cs)
-{
-    return true;
-}
-
 void restore_state_to_opc(CPUHexagonState *env, TranslationBlock *tb,
                           target_ulong *data)
 {
@@ -287,7 +282,6 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_reset(dc, hexagon_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = hexagon_cpu_class_by_name;
-    cc->has_work = hexagon_cpu_has_work;
     cc->dump_state = hexagon_dump_state;
     cc->set_pc = hexagon_cpu_set_pc;
     cc->gdb_read_register = hexagon_gdb_read_register;
-- 
2.25.1


