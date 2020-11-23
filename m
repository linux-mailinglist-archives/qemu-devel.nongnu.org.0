Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 919312C1788
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 22:18:28 +0100 (CET)
Received: from localhost ([::1]:48750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khJEB-0007S3-53
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 16:18:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIjD-0002NN-6h
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:46:29 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIj9-0001kS-1y
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:46:24 -0500
Received: by mail-wr1-x429.google.com with SMTP id z7so4297112wrn.3
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 12:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KNh0pIqDMIwzmpZMDW4GayC8CZVQW/Y3xdXOMEVkIms=;
 b=gvjYTmYyf7xM65RfbQ4mUQCdIOqOV3DiYN00YuEQMoNkxEzDv9IWVI+hFbTG3eylcl
 5iPcZ0dh1O2K9elpPvxV+iVE6DR7Oe0rbsQmPzrUdwXOOvz8g0g6Xs5sz1ASnDGR5BwI
 A+7BY3YlWpA4uiWhCiR+NGY7GSBTEMPOh3/zZxqc5e1Krnsi8SinzOo0p3mY3J+FAxN3
 vcLs4DK3xrRkKOx8rVbwtSPEraij4xCfY89eg2/jlBZWKdGLPSPNSEjn9WOrFH8WgGY1
 VgfSczilrrWFydQiGb1xeHX2i4Fc82awPaN66F1dPtwczFKIe9hoq9m6Bhr1xgX0Xo2n
 M3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KNh0pIqDMIwzmpZMDW4GayC8CZVQW/Y3xdXOMEVkIms=;
 b=HwKl7WgAtvEjmh0BHQSL7ieKWhfFFHejIV0uhmfbfN2ZBqAnTtgFgRd7HuX1ZNUdbK
 wfsgZTN+iM7sGaQk1X671X1CJ8fciTLs8FpJ6IZa07ZIz9goKfavswDjtweO5EwGFZGK
 DdpG+VsNyeJkxUhpvm2WTbv+83S5RY5dMJw22mEPzrdWIofYh9bjXUn2vULUqyAn1pdA
 T+9vjOi+ZclQ0uWD19t8WXRfdY5gFOBweervKYcwpHQ5q7u361g4hN0WhBb44S4Er9HF
 sru56caHDyfuUZxTbiqJUTkD++RoesX6eROFaQZIsxAySfnv86EfknjP3pr1q4kSdLPB
 PDAQ==
X-Gm-Message-State: AOAM531+rNjQ5WdhC79xMR2C3CNFHw5N4HtEhVaipMLrZArAYdNBhSKO
 I7MzCLYAe5BFF7G1cJ5N76HG/K7kY1U=
X-Google-Smtp-Source: ABdhPJx+M4/91DBBBPNzgZVd41UD3vMMOU0OG5OEUgyXZw4md0YoOoCLjIkJ9eKQ7JQeyMe92Dmnmg==
X-Received: by 2002:adf:f852:: with SMTP id d18mr1487789wrq.232.1606164380083; 
 Mon, 23 Nov 2020 12:46:20 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id h98sm16992027wrh.69.2020.11.23.12.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 12:46:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/28] target/mips: Rename lmmi_helper.c as
 loong-simd_helper.c
Date: Mon, 23 Nov 2020 21:44:38 +0100
Message-Id: <20201123204448.3260804-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201123204448.3260804-1-f4bug@amsat.org>
References: <20201123204448.3260804-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The LoongMMI extension has been renamed LoongSIMD
(part of the LoongISA). Rename the helper file accordingly.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201120210844.2625602-17-f4bug@amsat.org>
---
 target/mips/{lmmi_helper.c => vendor-loong-simd_helper.c} | 0
 target/mips/meson.build                                   | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename target/mips/{lmmi_helper.c => vendor-loong-simd_helper.c} (100%)

diff --git a/target/mips/lmmi_helper.c b/target/mips/vendor-loong-simd_helper.c
similarity index 100%
rename from target/mips/lmmi_helper.c
rename to target/mips/vendor-loong-simd_helper.c
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 8cc1d0ca0f7..d9285ae047a 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -4,10 +4,10 @@
   'fpu_helper.c',
   'gdbstub.c',
   'helper.c',
-  'lmmi_helper.c',
   'op_helper.c',
   'mod-dsp_helper.c',
   'mod-msa_helper.c',
+  'vendor-loong-simd_helper.c',
   'vendor-vr54xx_helper.c',
 
   'translate.c',
-- 
2.26.2


