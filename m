Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29B91801BF
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 16:26:18 +0100 (CET)
Received: from localhost ([::1]:35604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBglt-0005mV-Gd
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 11:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44223)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jBghY-00080j-J2
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 11:21:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jBghX-0003tQ-9s
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 11:21:48 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:50657)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jBghX-0003lF-1n
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 11:21:47 -0400
Received: by mail-wm1-x343.google.com with SMTP id a5so1866813wmb.0
 for <qemu-devel@nongnu.org>; Tue, 10 Mar 2020 08:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6Hj0Y3He2pns4P8rEr+hvQWBwPDxCqgnnx2gyymh94c=;
 b=HT2EXLjG6jiTBe4dZ4SHOrmUTsQXrxQ7Y+r8TH3s8ckmEet7Ug++eq6U0PkuOw9yxJ
 aKD9EuzocTGB1MiZ3bcW5U3ArnCFL+DwFOeHwFUVMfKoH5MxJ8uz/b3XkfVxZFVBgUWU
 bNsLB7046FKR3Dh77lABdh5Cs15bP7EExlCQG3lWa9485jYZ0tq2cABy+ldzd2ErxtQm
 H54czXwHOzRx/ksApsQPuInmU89J9gNJK8JtTNqerKcZxFO6oYyq2+GncKIOKmjKiCfL
 MnmERl2XlhjhaPPV/RlcW3LzGwJZ+KkmjcPbRt+TIj4BWCcCAq7Jle38rDhbRy0hpeKa
 yrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6Hj0Y3He2pns4P8rEr+hvQWBwPDxCqgnnx2gyymh94c=;
 b=XQRyJiauJJkelE6iySngbehzFbmSXyiN+xXUBr5dXXLO7VvWsq8PCJbgWt6SC4YO28
 O+gYIRcqvLW+QH96MaNSQCBv/8/FWHjR6cozzYFhTipClBhHgH5h6qxdjpZyV3/l07b1
 vsULLRg64DfV3Hzv7Oq5akGOuN14kY4D9fBm3hbMo5m3APluuMkSJssN+c2PkPOJPDhf
 InMSx7uqQH2VeQFEQEDiFQGFubiHpNDwNKNDhIhLX48IP/o+NjsaOSR3UTYTYrQppZMk
 ARG6CBx9q8+5NAwtlE2yzUO3GKH5+7pxlaAB/wZgd9cgVfHKoAENhckEevdV27M/l8D5
 X8jg==
X-Gm-Message-State: ANhLgQ3uO/VHVEQ+bexh7i+2vuZQUMEnokP0K7+u8yE1TMQbPmRpiArp
 SOIM4+NC+3JQ1TA8DrVBHGeke4GJDxiaKg==
X-Google-Smtp-Source: ADFU+vtEYgThX98Y2gSeyDRpHSH5V3lU2yVfL7gPtqsVhEk21o0Cjgglg+GNKaBPCZ9OKMg99g4b7g==
X-Received: by 2002:a1c:7ec5:: with SMTP id z188mr2626871wmc.52.1583853704611; 
 Tue, 10 Mar 2020 08:21:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i9sm4554232wmd.37.2020.03.10.08.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 08:21:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests: Disable dbus-vmstate-test
Date: Tue, 10 Mar 2020 15:21:41 +0000
Message-Id: <20200310152141.13959-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The dbus-vmstate-test has been failing in some Patchew configs
since about the 6th March:

  dbus-daemon[9321]: Could not get password database information for UID of current process: User "???" unknown or no memory to allocate password entry

  **
  ERROR:/tmp/qemu-test/src/tests/qtest/dbus-vmstate-test.c:114:get_connection: assertion failed (err == NULL): The connection is closed (g-io-error-quark, 18)
  cleaning up pid 9321
  ERROR - Bail out! ERROR:/tmp/qemu-test/src/tests/qtest/dbus-vmstate-test.c:114:get_connection: assertion failed (err == NULL): The connection is closed (g-io-error-quark, 18)
  make: *** [/tmp/qemu-test/src/tests/Makefile.include:632: check-qtest-x86_64] Error 1
  make: *** Waiting for unfinished jobs....

It's not clear why this is happening (perhaps a recently revealed
race condition or a change in the patchew build environment?).

For the moment, disable this test so that patchew test runs are
useful and don't email the list with spurious failure mails.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/Makefile.include | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/Makefile.include b/tests/qtest/Makefile.include
index 383b0ab2171..5115f7897db 100644
--- a/tests/qtest/Makefile.include
+++ b/tests/qtest/Makefile.include
@@ -18,7 +18,8 @@ check-qtest-pci-$(CONFIG_IVSHMEM_DEVICE) += ivshmem-test
 DBUS_DAEMON := $(shell which dbus-daemon 2>/dev/null)
 ifneq ($(GDBUS_CODEGEN),)
 ifneq ($(DBUS_DAEMON),)
-check-qtest-pci-$(CONFIG_GIO) += dbus-vmstate-test
+# Temporarily disabled due to Patchew failures:
+#check-qtest-pci-$(CONFIG_GIO) += dbus-vmstate-test
 endif
 endif
 
-- 
2.20.1


