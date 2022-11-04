Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A9A619577
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 12:36:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oquys-0001A8-0e; Fri, 04 Nov 2022 07:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oquyp-00018q-PO
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 07:35:23 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oquym-00084y-Vy
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 07:35:23 -0400
Received: by mail-wm1-x336.google.com with SMTP id o30so2862781wms.2
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 04:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nHWSJ+DS7zWi4CyAI29TJeB0bJ7NNMFTP3CfxToiYuk=;
 b=jDlzL+hr4/8FeN+SSwQdFCjCO/yzF9FDEwRxWBVrGnsNA8l70VtCjHwJH5WWlL3gFn
 A/PIVllWV+CYAza9um2JHZJCPeXnw/eH/UuaynhjDEV7xnC/GG8x+77c89yEBWkNoplO
 QejDHSHnH47ZvkZUj8fRcbPZDJbotu+bSSYbbMLUQPiCL3CMiUwIEuoTJCwGurAKGGgw
 AC7PpJpGJ0DLDh4qseZWvo29umuhT1hLbkRubAHvrW4w27LkGqNr1ZiUaix8UbfTqmDB
 d+aCpaPdsPfO96e4fJjdthnVcsWehuH0laNZDo3QzqZJVVo6LTjwVxml5mBPTqsC9Jno
 P1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nHWSJ+DS7zWi4CyAI29TJeB0bJ7NNMFTP3CfxToiYuk=;
 b=Hl0TPUg0W0PYJqFekA04x6RlyJ2l19ZAghnQdbGeGe8M6ugJwpcF7RgrOLZjcwdGfM
 AyoCOaV9QVWEJQeX7phnBzsbOdSXbs/sjJTJOgdkcJ5OGc1oKRRCiy/tukJMIgzEwJze
 Q3LmUSuknKICqhhU47G8sBwEh28uvPTW+4BKe+MH6PNQB8qNXSuhWKmJeAvlUmgddaoh
 3kE+yKsAML43hcj5vI3d6LfjnaN5IRI5CI2NSuXks17ViL7WKc9XKtJuFvHFTEfoIhPh
 ttoal7xeTe4deE7iIGOWJvYrIa2uP7gh8yzqY2c+z1luWLUOKjbGHCwrLZrqfVt4OKzm
 j7qQ==
X-Gm-Message-State: ACrzQf3Yx/rFK1frXt5Ns4lnXRw+6I5U3NetpCKpPDoieudYvtm43EXn
 QfgxAw1Ms2DevVAPVrzucfybIPbKN23c4w==
X-Google-Smtp-Source: AMsMyM50U9ulJBcuL2KW7WkksjBoQDh+CfrSHeHYoFuPHbkRXzKOHREj4XxONeb+mfBSiiQYH7BP4g==
X-Received: by 2002:a05:600c:18a3:b0:3cf:8df1:ce6e with SMTP id
 x35-20020a05600c18a300b003cf8df1ce6emr5735723wmp.5.1667561719384; 
 Fri, 04 Nov 2022 04:35:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a5d4891000000b0023655e51c33sm3255743wrq.4.2022.11.04.04.35.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 04:35:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] hw/arm/boot: Set SME and SVE EL3 vector lengths when
 booting kernel
Date: Fri,  4 Nov 2022 11:35:09 +0000
Message-Id: <20221104113515.2278508-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104113515.2278508-1-peter.maydell@linaro.org>
References: <20221104113515.2278508-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When we direct boot a kernel on a CPU which emulates EL3, we need
to set up the EL3 system registers as the Linux kernel documentation
specifies:
 https://www.kernel.org/doc/Documentation/arm64/booting.rst

For SVE and SME this includes:
    - ZCR_EL3.LEN must be initialised to the same value for all CPUs the
      kernel is executed on.
    - SMCR_EL3.LEN must be initialised to the same value for all CPUs the
      kernel will execute on.

Although we are technically compliant with this, the "same value" we
currently use by default is the reset value of 0.  This will end up
forcing the guest kernel's SVE and SME vector length to be only the
smallest supported length.

Initialize the vector length fields to their maximum possible value,
which is 0xf. If the implementation doesn't actually support that
vector length then the effective vector length will be constrained
down to the maximum supported value at point of use.

This allows the guest to use all the vector lengths the emulated CPU
supports (by programming the _EL2 and _EL1 versions of these
registers.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221027140207.413084-2-peter.maydell@linaro.org
---
 hw/arm/boot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index b106f314685..17d38260faf 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -764,10 +764,12 @@ static void do_cpu_reset(void *opaque)
                     }
                     if (cpu_isar_feature(aa64_sve, cpu)) {
                         env->cp15.cptr_el[3] |= R_CPTR_EL3_EZ_MASK;
+                        env->vfp.zcr_el[3] = 0xf;
                     }
                     if (cpu_isar_feature(aa64_sme, cpu)) {
                         env->cp15.cptr_el[3] |= R_CPTR_EL3_ESM_MASK;
                         env->cp15.scr_el3 |= SCR_ENTP2;
+                        env->vfp.smcr_el[3] = 0xf;
                     }
                     /* AArch64 kernels never boot in secure mode */
                     assert(!info->secure_boot);
-- 
2.25.1


