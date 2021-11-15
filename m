Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77F7450701
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:31:58 +0100 (CET)
Received: from localhost ([::1]:55260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmd1Z-00040N-JR
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:31:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mmczA-0001HJ-Jy
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:29:28 -0500
Received: from [2a00:1450:4864:20::434] (port=34355
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mmcz8-0004NE-34
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:29:28 -0500
Received: by mail-wr1-x434.google.com with SMTP id d5so31117669wrc.1
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ugXBxSmeupCizDXfYa8He48thNIJcW9wKUQYZQowkzE=;
 b=CK4Sb2r6X8vAQL0REB88Z65LkMv4g+fkrWCUWd1LLzNQxtPhnvq8B6EujoHO7SCKgk
 nkIPs+2EOMT5zFrFPfaloYy0elWN8KJhT2K6gCXAaJFS0pX2vbvPLf8llk2btnp5TJRX
 mS/hPo/mz31lhud3h+4v7HEOZIiivY+/wftgzrke0xlShZfamep9Zmylmwhh9mZIfSbm
 cqEdqFE+hufho/aKov8q0hpNrdkrtGkkIIVCUUTN9BMr2JxvCdd+bWnpYHTTm6tlIUwi
 c4AF2dEQ7nPpxpGY7t+a+55Wt11fjbQgdCyzgHohkGekBQPTmlvKwMI+s+rUp/QVTgJC
 54JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ugXBxSmeupCizDXfYa8He48thNIJcW9wKUQYZQowkzE=;
 b=zdgu2tVm8FAkbZ80wG+753N5O3WrKRFWvqxa3xJ+otAMVC+m+G38Y4jmzyXOCbzk8/
 tuO/xOmUOhqPaYkEIj+m04VG7BrMB3NSvZ6PYm2EDrgP66n0a6PnT5g8GPxmnGJnuWw4
 LAum5DK8AccOG1Co1hY63wnxCsec/AwoDdEufoSc+//AU858tULubgEQECC1SJFizgSD
 tVsu3tLzi5DvS7wP9AHldJ2zvh8a5rBx5O/GJuvZh7Mt5YTGPlbM3IA+CuENl4zYHK2o
 KgdMbndjHoH9hWBytbcJzW/k1B+CSheTMNwO2sM8D8u/hNp8ezG2H+L+8ySKm6UI0uEc
 Yqhw==
X-Gm-Message-State: AOAM530PzXhnxN/mW9mwKEeJl2qhXCXRS6xNAEsjdm7/vtf+693wvuwY
 AOP9QfUwZdHkgO1mhCIJnjM1jEf2Zv0rvA==
X-Google-Smtp-Source: ABdhPJx/iNuvJrQ5wL5ZWXSunaEvDaFJTvP18bgc6o8nnnC4exf6KJXsSZVqm0ulhjI6X90t7lwCig==
X-Received: by 2002:adf:e747:: with SMTP id c7mr47899656wrn.38.1636986564797; 
 Mon, 15 Nov 2021 06:29:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s13sm20895835wmc.47.2021.11.15.06.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:29:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4390E1FF9A;
 Mon, 15 Nov 2021 14:29:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 3/6] tests/vm: don't build using TCG by default
Date: Mon, 15 Nov 2021 14:29:12 +0000
Message-Id: <20211115142915.3797652-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211115142915.3797652-1-alex.bennee@linaro.org>
References: <20211115142915.3797652-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While it is useful to run these images using TCG their performance
will not be anything like the native guests. Don't do it by default.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/393
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/Makefile.include | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index f8ca619cf2..ae91f5043e 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -2,14 +2,22 @@
 
 .PHONY: vm-build-all vm-clean-all
 
+HOST_ARCH = $(if $(ARCH),$(ARCH),$(shell uname -m))
+
 EFI_AARCH64 = $(wildcard $(BUILD_DIR)/pc-bios/edk2-aarch64-code.fd)
 
-IMAGES := freebsd netbsd openbsd centos fedora haiku.x86_64
+X86_IMAGES := freebsd netbsd openbsd centos fedora haiku.x86_64
 ifneq ($(GENISOIMAGE),)
-IMAGES += ubuntu.i386 centos
+X86_IMAGES += ubuntu.i386 centos
 ifneq ($(EFI_AARCH64),)
-IMAGES += ubuntu.aarch64 centos.aarch64
+ARM64_IMAGES += ubuntu.aarch64 centos.aarch64
+endif
 endif
+
+ifeq ($(HOST_ARCH),x86_64)
+IMAGES=$(X86_IMAGES) $(if $(USE_TCG),$(ARM64_IMAGES))
+else ifeq ($(HOST_ARCH),aarch64)
+IMAGES=$(ARM64_IMAGES) $(if $(USE_TCG),$(X86_IMAGES))
 endif
 
 IMAGES_DIR := $(HOME)/.cache/qemu-vm/images
@@ -43,7 +51,7 @@ else
 endif
 	@echo "  vm-build-haiku.x86_64           - Build QEMU in Haiku VM"
 	@echo ""
-	@echo "  vm-build-all                    - Build QEMU in all VMs"
+	@echo "  vm-build-all                    - Build QEMU in: $(IMAGES)"
 	@echo "  vm-clean-all                    - Clean up VM images"
 	@echo
 	@echo "For trouble-shooting:"
@@ -56,6 +64,7 @@ endif
 	@echo '    EXTRA_CONFIGURE_OPTS="..."   - Pass to configure step'
 	@echo "    J=[0..9]*            	 - Override the -jN parameter for make commands"
 	@echo "    LOG_CONSOLE=1        	 - Log console to file in: ~/.cache/qemu-vm "
+	@echo "    USE_TCG=1        	         - Use TCG for cross-arch images"
 	@echo "    QEMU=/path/to/qemu		 - Change path to QEMU binary"
 ifeq ($(HAVE_PYTHON_YAML),yes)
 	@echo "    QEMU_CONFIG=/path/conf.yml   - Change path to VM configuration .yml file."
-- 
2.30.2


