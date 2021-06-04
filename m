Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AF139BEB5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:27:40 +0200 (CEST)
Received: from localhost ([::1]:46410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDbf-00018Z-QD
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCl0-0000a9-7n
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:33:14 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:53779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkn-0002FF-55
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:33:14 -0400
Received: by mail-wm1-x333.google.com with SMTP id h3so5739709wmq.3
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xfsi0lTAgR9azxMfpWXQUQ//2Zf5ZUMfbhMWxCScq+0=;
 b=zH2kST0KdUrWybiGIhRu12LOpnFkhLJqwAGTA774+26P8thcPUioyiwZsnewErKmUc
 edQKrlvM5deNcd8bM7BD/f+5P4Jojt4APhudjziIFl26rRjhWIFzuIcKJgHV55dNpoDI
 So+D9c7Ktk+cc2Fjv1vhd7Qk1lPZDhIQIq3UXEGoo4OeoAlLgCJan2GYzDIiTWo051jA
 m09I0ynBOHGrxTiOAY5QlN3HsdaTytQLf5rZFScrYAQjzwPyd0TV9naJpzLskYkK0mWe
 MMwP3UNjkwjCBsiBTv8Mnd8AW9qpBzyt9GVJzfhaKB2TGgls01/ASPaGDDIo9mW74Kw1
 vHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xfsi0lTAgR9azxMfpWXQUQ//2Zf5ZUMfbhMWxCScq+0=;
 b=pCLLkG8Zq9xzYS0x5lw7gxaDKCpoEdNzbuXCy/jeWeZXoj8lPPEg7mlopjLKkFWzNV
 uEC5IkfhwxgOcNkkj0bznUHuzdX77rLTRgkShmNqt8m4hi7S2m9OAjiDkPwdjNQHM0WQ
 ZqVrXfDvz+fWjl/jDaWfKOHNuFe5+CCaeH6siX5z57lB75JXBWAQZPL3J0OsZpNmxLcT
 TFZ9d1nHxopgvpEq2P3S0GTqv+9Or9AhPTxFiisxM2+kzDL+rXLtnp97/b8JsB6Djq7A
 HeAC2RztM2Kwpqa7v0Hg4q5Yjtm20SCgg6fLIOzpItkKuf5HLFXDlzrBfpb+DRgulQrV
 vqRQ==
X-Gm-Message-State: AOAM530VkbVLvLBI3ULKiCnp2GL6Jhwp0PnFmQXcrBUyw6BW/r4KlKhu
 yhQcKVk475SVNLg7CguFHMU8Wq2w73iHKw==
X-Google-Smtp-Source: ABdhPJwowIYcAHdAwWNVsZDsvOYvhSwnzPQL19QhWnGup5ZnB/m4KJEJsn3QlcEXTfogsL4zNTL9RA==
X-Received: by 2002:a05:600c:358f:: with SMTP id
 p15mr4621878wmq.14.1622824378322; 
 Fri, 04 Jun 2021 09:32:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c12sm8239845wrr.90.2021.06.04.09.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:32:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E371E20014;
 Fri,  4 Jun 2021 16:53:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 91/99] target/arm: tcg: remove superfluous CONFIG_TCG check
Date: Fri,  4 Jun 2021 16:53:04 +0100
Message-Id: <20210604155312.15902-92-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

modules under tcg/ are only built for CONFIG_TCG anyway.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/vfp_helper.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/arm/tcg/vfp_helper.c b/target/arm/tcg/vfp_helper.c
index 521719f327..0cc6c85270 100644
--- a/target/arm/tcg/vfp_helper.c
+++ b/target/arm/tcg/vfp_helper.c
@@ -21,10 +21,8 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "internals.h"
-#ifdef CONFIG_TCG
 #include "qemu/log.h"
 #include "fpu/softfloat.h"
-#endif
 
 /* VFP support.  We follow the convention used for VFP instructions:
    Single precision routines have a "s" suffix, double precision a
@@ -40,8 +38,6 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
     vfp_set_fpscr(env, val);
 }
 
-#ifdef CONFIG_TCG
-
 #define VFP_HELPER(name, p) HELPER(glue(glue(vfp_,name),p))
 
 #define VFP_BINOP(name) \
@@ -1110,5 +1106,3 @@ void HELPER(check_hcr_el2_trap)(CPUARMState *env, uint32_t rt, uint32_t reg)
 
     raise_exception(env, EXCP_HYP_TRAP, syndrome, 2);
 }
-
-#endif
-- 
2.20.1


