Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31684446B4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:10:07 +0100 (CET)
Received: from localhost ([::1]:53648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJm3-0006cN-4Y
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJiH-0003ft-BY
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:06:13 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJiF-0003Yk-2w
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:06:13 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d3so4604806wrh.8
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hsyzSfNK3dBgoCFVsZ9lOYqPSB9PzljxnnVJgvNEjq0=;
 b=m2Tordfy4dWXxx3MJQfltnw64sdqI5/7ECBEDW0P4rFnDIh2eFHn++jpRmANV7wCbn
 FkPNeRMlNcMYCWYkal3Wu2d+ap4WegMWMSdK+POogGy3via5Clae/1B0Cgn3JOg7Yrpo
 KU87o6hv6Y+D6e0jHhkpqF98cOXwOG7LqMBotcwREa79oh7vt1aam8qhCNBKJbbq1L5l
 l3X79wSGe6tImVzcBPC/WgT2zVBiT2S9iWt2SHMyJ3kYRbbLRelbXipSaLt6j3E0gqOx
 cQ7XNLYi5g5Zsjc6FsB1NTZiFVSWVlYGFHegZWkdRoaq5XT3IDZXQ0GbVofLnmqlTmWB
 s7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hsyzSfNK3dBgoCFVsZ9lOYqPSB9PzljxnnVJgvNEjq0=;
 b=LexT7gAEUrk/NR05oJDO90UmMiomwv5W4dNp6ivxy2AN/WfR/9PJ4ygS9zOP55aqeo
 wHtu8k0GwaEzViNlopT+D0tscluPoRPx8MCu6SyDXo+AOnHlzZSZGxQRjlkksYBWUCNU
 OmFakVwECPwgpL81GJ+0alQti+3nfW14cdx14kGW4i0S8ZleEGSnGYTOvp4cZcXlOgg4
 hn2l+4mWQJg70AJo3joWTP1Pid/Xe4rse4FpQNQD0RR/6lqUZsqMfTovMQ3TLeVcj/dQ
 v2yjcJveirKsaYpspIOmSN3TCABDz1vA1BVVmrqwq99agiGkmRRygDQ/EMg5Gh/mvyKK
 uyFQ==
X-Gm-Message-State: AOAM530myyqU/A1IjknNpSOjaaWDz5/AYBIHRTQmcF32xXpfyV76axUj
 8lfDCp90dmCX1VnCtv10ZYHudQ==
X-Google-Smtp-Source: ABdhPJyani5e0XEPaELhad2Yjqdd+rfZ0hWLKwrxBsnDZbCIczdEESl8BkWMXpU0e1yxpJErRwD6Bw==
X-Received: by 2002:adf:8b06:: with SMTP id n6mr58787096wra.5.1635959169612;
 Wed, 03 Nov 2021 10:06:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o3sm2942236wms.10.2021.11.03.10.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:06:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0FBA81FF9D;
 Wed,  3 Nov 2021 17:05:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 06/21] tests/tcg: Fix some targets default cross compiler path
Date: Wed,  3 Nov 2021 17:05:43 +0000
Message-Id: <20211103170558.717981-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211103170558.717981-1-alex.bennee@linaro.org>
References: <20211103170558.717981-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We do not want a shell command substitution, but a parameter
substitution (with assignment). Replace $() -> ${}, otherwise
the expanded command return an empty string and the $cross_cc
variable is not set.

Fixes: 634ef789f8e ("tests/tcg: add more default compilers to configure.sh")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[AJB: disable sh4 linux-test]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211023164329.328137-1-f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211026102234.3961636-9-alex.bennee@linaro.org>

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index ccf84e5559..d74ed50c18 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -46,7 +46,7 @@ fi
 : ${cross_cc_aarch64="aarch64-linux-gnu-gcc"}
 : ${cross_cc_aarch64_be="$cross_cc_aarch64"}
 : ${cross_cc_cflags_aarch64_be="-mbig-endian"}
-: $(cross_cc_alpha="alpha-linux-gnu-gcc")
+: ${cross_cc_alpha="alpha-linux-gnu-gcc"}
 : ${cross_cc_arm="arm-linux-gnueabihf-gcc"}
 : ${cross_cc_cflags_armeb="-mbig-endian"}
 : ${cross_cc_hexagon="hexagon-unknown-linux-musl-clang"}
@@ -56,17 +56,17 @@ fi
 : ${cross_cc_cflags_i386="-m32"}
 : ${cross_cc_m68k="m68k-linux-gnu-gcc"}
 : ${cross_cc_microblaze="microblaze-linux-musl-gcc"}
-: $(cross_cc_mips64el="mips64el-linux-gnuabi64-gcc")
-: $(cross_cc_mips64="mips64-linux-gnuabi64-gcc")
-: $(cross_cc_mipsel="mipsel-linux-gnu-gcc")
-: $(cross_cc_mips="mips-linux-gnu-gcc")
+: ${cross_cc_mips64el="mips64el-linux-gnuabi64-gcc"}
+: ${cross_cc_mips64="mips64-linux-gnuabi64-gcc"}
+: ${cross_cc_mipsel="mipsel-linux-gnu-gcc"}
+: ${cross_cc_mips="mips-linux-gnu-gcc"}
 : ${cross_cc_ppc="powerpc-linux-gnu-gcc"}
 : ${cross_cc_cflags_ppc="-m32"}
 : ${cross_cc_ppc64="powerpc64-linux-gnu-gcc"}
 : ${cross_cc_ppc64le="powerpc64le-linux-gnu-gcc"}
-: $(cross_cc_riscv64="riscv64-linux-gnu-gcc")
+: ${cross_cc_riscv64="riscv64-linux-gnu-gcc"}
 : ${cross_cc_s390x="s390x-linux-gnu-gcc"}
-: $(cross_cc_sh4="sh4-linux-gnu-gcc")
+: ${cross_cc_sh4="sh4-linux-gnu-gcc"}
 : ${cross_cc_cflags_sparc="-m32 -mv8plus -mcpu=ultrasparc"}
 : ${cross_cc_sparc64="sparc64-linux-gnu-gcc"}
 : ${cross_cc_cflags_sparc64="-m64 -mcpu=ultrasparc"}
diff --git a/tests/tcg/sh4/Makefile.target b/tests/tcg/sh4/Makefile.target
index 47c39a44b6..0e96aeff16 100644
--- a/tests/tcg/sh4/Makefile.target
+++ b/tests/tcg/sh4/Makefile.target
@@ -12,3 +12,9 @@ run-signals: signals
 	$(call skip-test, $<, "BROKEN")
 run-plugin-signals-with-%:
 	$(call skip-test, $<, "BROKEN")
+
+# This test is currently broken: https://gitlab.com/qemu-project/qemu/-/issues/704
+run-linux-test: linux-test
+	$(call skip-test, $<, "BROKEN")
+run-plugin-linux-test-with-%:
+	$(call skip-test, $<, "BROKEN")
-- 
2.30.2


