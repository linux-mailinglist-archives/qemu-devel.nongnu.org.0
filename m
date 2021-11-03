Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA524446EC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:19:59 +0100 (CET)
Received: from localhost ([::1]:59436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJva-0004FK-H1
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJiR-00047B-SJ
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:06:23 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJiQ-0003x6-8f
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:06:23 -0400
Received: by mail-wr1-x434.google.com with SMTP id t30so4596410wra.10
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v1JcCS5FU5lQIgjMOx9iobI/E3bd5os0yVrUnngO3MA=;
 b=PPnQ6xVLKofP4mDH7vGWOqXA9tRzQRCqS3lxPZ9EzRgTGfdVing9AFKyJfCZKtqzcG
 hFM98766+FhGVz4H4FK5MqNOX+ftmNrj4nexabgvTquOPWSAGzps/sFb+3sB1shnQ2wR
 eA9Af5VSXOzDmqoYp+YOgpCkU7JcHv4kHaEcFZQOCOboaYhoPRplqvRtV0yQotLsIx7S
 Stuh+/pc0S2n3gFBAZAzlvCn3SpHBUsqBDbkUfnsmwNPJ01WgDmUpOtDB6girZMwl2Hw
 R/FXQXeNglyr8WFTdAXZeySoM7G5NDDOfJ2HUEpRzwAygibBsTpkjWIgK4J2y0iFcV3L
 chBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v1JcCS5FU5lQIgjMOx9iobI/E3bd5os0yVrUnngO3MA=;
 b=IxHHHshwvncJ+IRWY0WEBQpzMVmRrhmKTlNINRA/7/+H4cCYYsKJa/zAcTgXLbP8U/
 nJdEAvE+odbkA3pvCEeWsLHZX+SwUe/tgIOpVP3o42jqIcfynGEKauGns9T35OleV4g5
 11AK1BEMO82fjofeDF1HDxD9i7Rwe6VTGHZo8+tyVh60SR0EbF6ITmmNwx2srxO4Up+U
 5lZ10z2NlrnaRT5pKAG6SUYS0pxSr+DnHcmZyQ1QwHBU0kMYjt2wAgenUeBuaieku6SE
 jyff58PnUYWJnaPVhfGk2YgxzpVlgT9b3o0VbD6wInCA+/dcZvhxuj4OR0FnPkkZKXfn
 ISRw==
X-Gm-Message-State: AOAM5335bk0W4a2qzjQEBaBUacIg0ZMhZi3lJaybssq0Vn2SMBTP0hGT
 LqHrzPgnd+UcoJjx0CL99jsA4Q==
X-Google-Smtp-Source: ABdhPJytkVsb0mXY4T55pQM5TZ9H59VQDA9lZy9oAsWh3wBbYawqHkusH5+Hgpdo31MfgzEPwXGTCQ==
X-Received: by 2002:adf:db47:: with SMTP id f7mr39845141wrj.113.1635959179675; 
 Wed, 03 Nov 2021 10:06:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m22sm642504wmq.38.2021.11.03.10.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:06:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 354701FF9F;
 Wed,  3 Nov 2021 17:05:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 08/21] tests/tcg: enable debian-nios2-cross for test building
Date: Wed,  3 Nov 2021 17:05:45 +0000
Message-Id: <20211103170558.717981-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211103170558.717981-1-alex.bennee@linaro.org>
References: <20211103170558.717981-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now we have a nios2 test image we can start using it to build tests.
However signal handling in nios2 is still broken so we disable the
signals and linux-test tests that trigger the bug.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211026102234.3961636-12-alex.bennee@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index a4d7a6f2e5..a2ad6f71b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -228,6 +228,7 @@ F: target/microblaze/
 F: hw/microblaze/
 F: disas/microblaze.c
 F: tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh
+F: tests/tcg/nios2/Makefile.target
 
 MIPS TCG CPUs
 M: Philippe Mathieu-Daudé <f4bug@amsat.org>
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index d74ed50c18..9b76f58258 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -60,6 +60,7 @@ fi
 : ${cross_cc_mips64="mips64-linux-gnuabi64-gcc"}
 : ${cross_cc_mipsel="mipsel-linux-gnu-gcc"}
 : ${cross_cc_mips="mips-linux-gnu-gcc"}
+: ${cross_cc_nios2="nios2-linux-gnu-gcc"}
 : ${cross_cc_ppc="powerpc-linux-gnu-gcc"}
 : ${cross_cc_cflags_ppc="-m32"}
 : ${cross_cc_ppc64="powerpc64-linux-gnu-gcc"}
@@ -159,6 +160,11 @@ for target in $target_list; do
       container_image=debian-mips-cross
       container_cross_cc=mips-linux-gnu-gcc
       ;;
+    nios2-*)
+      container_hosts=x86_64
+      container_image=debian-nios2-cross
+      container_cross_cc=nios2-linux-gnu-gcc
+      ;;
     ppc-*|ppc64abi32-*)
       container_hosts=x86_64
       container_image=debian-powerpc-test-cross
diff --git a/tests/tcg/nios2/Makefile.target b/tests/tcg/nios2/Makefile.target
new file mode 100644
index 0000000000..b38e2352b7
--- /dev/null
+++ b/tests/tcg/nios2/Makefile.target
@@ -0,0 +1,11 @@
+# nios2 specific test tweaks
+
+# Currently nios2 signal handling is broken
+run-signals: signals
+	$(call skip-test, $<, "BROKEN")
+run-plugin-signals-with-%:
+	$(call skip-test, $<, "BROKEN")
+run-linux-test: linux-test
+	$(call skip-test, $<, "BROKEN")
+run-plugin-linux-test-with-%:
+	$(call skip-test, $<, "BROKEN")
-- 
2.30.2


