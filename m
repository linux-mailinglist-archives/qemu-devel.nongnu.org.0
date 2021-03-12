Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560AD33917F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 16:37:52 +0100 (CET)
Received: from localhost ([::1]:44638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKjrL-0006YA-C6
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 10:37:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKjbE-0006vL-Mh
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:21:12 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKjbC-0004ol-Nt
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:21:12 -0500
Received: by mail-wr1-x434.google.com with SMTP id f12so5009624wrx.8
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 07:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3RKQma1l7Rl7FkdhJhcWopqorchNx7lcyhOmW3wkAf4=;
 b=nhA60YIpoVF+gz95EPN2kVsbRQaMNm4hXqSo6dQjNtb8IyAXNgUqsQP63Z75dhTndg
 IjI3D/2NtBxAh9xbWvY/mmTU+0UWivD0VLDTBV67qlpslYSXJshB6i5ARwiutplmT7rs
 ZhVXib/F5jOrwIaeb+Ole/wgw24/hTFYGckvfvmVAGqzJdCFWArAWnZ5YrE3maVjK7wL
 zVw2uwCiJpyv0amnQgDVQQX+uZxO3pK4IC3ZKkIrqGe8e8Fv033tyrVO2GD3fcfo8HpH
 ksV/q549Xahjk77hpLDQbzrhCIpWTipfwcZhKPA7Nl8cAXtbmWn9VFRX6CsqNQi1YRRt
 q/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=3RKQma1l7Rl7FkdhJhcWopqorchNx7lcyhOmW3wkAf4=;
 b=IwZjLEce8Rs08eZTHojjQDVRylPy29FFyhMFlcVExPBXBZ3Jv07B/vI+IY/Xc12NR1
 n03Lj/V90yRMMUoED2HZLjD2jvlhv6vjtnQKhlNq8ftl/g410PI0hkcrrEveHWwaQcR/
 ddEj8xCF98h6BIwkTtE7I+7ANthr64gwI7UzWpyUQKx5GQASYq8l44cAYlNdJ7wZbZvZ
 NFHuIMZHOM84cNApXkI3BmALKNyDLcj3aBplNUqS3psI9VI0OjNcUUofVuhtarbIjxRQ
 yetyRaNRsBBsojtE+0fvarBwawfKNfuU2a9j2Ud3L7r/u3geQEx1wQ04O9lhAuNtbywM
 pmjQ==
X-Gm-Message-State: AOAM533zmHtZozkIGfBktG8m7rhUaJ9UYPZadCk9r7zoERQzSrLhIApI
 dzcV6l5LXfzdtnFu8bjef7u+OrqfvAI=
X-Google-Smtp-Source: ABdhPJxyAcH7zlQqvHiuAcWnT7QZwfvFe0aqG5jkm9F08OT5NmETWiwjV0dzMK3ajWjU7jTkxGeomA==
X-Received: by 2002:a5d:640b:: with SMTP id z11mr14169105wru.327.1615562468097; 
 Fri, 12 Mar 2021 07:21:08 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j136sm2564398wmj.35.2021.03.12.07.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 07:21:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/tcg: Run tests on arch variants again
Date: Fri, 12 Mar 2021 16:21:05 +0100
Message-Id: <20210312152105.1836543-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We used to run the TCG tests for various QEMU targets, but at
some points it got restricted to base directories in tests/tcg/.
For example, armeb/mipsel/mips64/... targets are currently skipped.

The configuration Makefiles in default-configs/targets/ provide all
the required information, in particular TARGET_BASE_ARCH.

Source the target default-configs.mak and optionally process the
TARGET_ARCH / TARGET_BASE_ARCH Makefiles (if these variables differ
from TARGET_NAME).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/tcg/Makefile.target | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 24d75a5801f..677b247328f 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -85,6 +85,10 @@ TIMEOUT=15
 endif
 
 ifdef CONFIG_USER_ONLY
+
+# FIXME bsd-user?
+include $(SRC_PATH)/default-configs/targets/$(TARGET_NAME)-linux-user.mak
+
 # The order we include is important. We include multiarch first and
 # then the target. If there are common tests shared between
 # sub-targets (e.g. ARM & AArch64) then it is up to
@@ -92,6 +96,16 @@ ifdef CONFIG_USER_ONLY
 # architecture in its VPATH.
 -include $(SRC_PATH)/tests/tcg/multiarch/Makefile.target
 -include $(SRC_PATH)/tests/tcg/$(TARGET_NAME)/Makefile.target
+ifneq ($(TARGET_ARCH),)
+ifneq ($(TARGET_ARCH),$(TARGET_NAME))
+-include $(SRC_PATH)/tests/tcg/$(TARGET_ARCH)/Makefile.target
+endif
+endif
+ifneq ($(TARGET_BASE_ARCH),)
+ifneq ($(TARGET_BASE_ARCH),$(TARGET_ARCH))
+-include $(SRC_PATH)/tests/tcg/$(TARGET_BASE_ARCH)/Makefile.target
+endif
+endif
 
 # Add the common build options
 CFLAGS+=-Wall -Werror -O0 -g -fno-strict-aliasing
@@ -102,12 +116,25 @@ endif
 %: %.c
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 else
+
+include $(SRC_PATH)/default-configs/targets/$(TARGET_NAME)-softmmu.mak
+
 # For softmmu targets we include a different Makefile fragement as the
 # build options for bare programs are usually pretty different. They
 # are expected to provide their own build recipes.
 -include $(SRC_PATH)/tests/tcg/minilib/Makefile.target
 -include $(SRC_PATH)/tests/tcg/multiarch/system/Makefile.softmmu-target
 -include $(SRC_PATH)/tests/tcg/$(TARGET_NAME)/Makefile.softmmu-target
+ifneq ($(TARGET_ARCH),)
+ifneq ($(TARGET_ARCH),$(TARGET_NAME))
+-include $(SRC_PATH)/tests/tcg/$(TARGET_ARCH)/Makefile.softmmu-target
+endif
+endif
+ifneq ($(TARGET_BASE_ARCH),)
+ifneq ($(TARGET_BASE_ARCH),$(TARGET_ARCH))
+-include $(SRC_PATH)/tests/tcg/$(TARGET_BASE_ARCH)/Makefile.softmmu-target
+endif
+endif
 
 endif
 
-- 
2.26.2


