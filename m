Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A714D56D04E
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jul 2022 19:05:17 +0200 (CEST)
Received: from localhost ([::1]:40044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAaMu-0003LU-KQ
	for lists+qemu-devel@lfdr.de; Sun, 10 Jul 2022 13:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oAaJ4-0006A8-Gx
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 13:01:18 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:35359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oAaJ2-0003M4-Su
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 13:01:18 -0400
Received: by mail-pf1-x433.google.com with SMTP id x184so3021752pfx.2
 for <qemu-devel@nongnu.org>; Sun, 10 Jul 2022 10:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8xI127TuMpWagqt4gaMUCdmrPt0g4XZZcxZXIgy9RrI=;
 b=dAfXHOc8Bi/kRYU8m9b2zHwY3kjrvfBARNOentwll5yTdqW5Wj5ZL0WfBDnor1Mjkl
 f5+IVBJgj7OGgsfH2f3eIa1iHDuodKL8GiBB7HZoFp4aswkHwPzKdW1/21k5F4K74riv
 NPyBtXun3wsDRG6zvhwdesL4tebfYRIYHJZmPJUJLxEufaM+/+F/Luv45OpVyk/eqWhM
 3JY2qRer9j8jNa2GCZCUYiHxkRxf1B1daxihkSXJRiUOR4Yeigx+64YuBNICYIp/vs+C
 LHqFd1pkkW69K+miFusywmX2iJuPeYi/Taxtg5bMuTW9yAHQvlTgMd5Qk8a3aTdyhf3Y
 WKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8xI127TuMpWagqt4gaMUCdmrPt0g4XZZcxZXIgy9RrI=;
 b=ma8erWcgn78NyPbf3ADB1H/sWqMqSjLBvKbYXj7YnPdwrbZJ17BtFLHXjXoNcyE+EL
 czHsH/d5gAaZDy50CZlJxXTQtbxyVhTTKwdgKC4Th9XV9771FXPxOhiw4AdT8jrKcNBo
 qGk91Sce7z4eNkAhY6nGVVXWSNLD0OJGvf7+8oiAMOlSyHXfa+xKChlhjXcE5fVMw3x3
 z8eWtcUMluPO87MTcNhQshLYpiVayT9ltnNZyFcTGdGXRFFsP+i++EoegG/idapI87Dm
 30jBTHqT/gi4yV3JPKSy4rW5hyA+kRNibzE4olrhq0Xywh0KxWmUoSb+DGpw7vpvzIr9
 p+7g==
X-Gm-Message-State: AJIora/lZL5ksuzvFIYQVQzon4GeNUVzOUa0Yk8m9KNPxnD7oZr3ZjCT
 S7+HKi7vJK3ZO9YTPgztFM14uH2K1xM1WsrG
X-Google-Smtp-Source: AGRyM1uGBY86Oq6rpSMy2hd7UdaaLxzA/G9pjmt9je/GZjkkL2YlZtpFEBdmPTsIoo98DuiBBNh+Uw==
X-Received: by 2002:a05:6a00:22d6:b0:525:74b3:d020 with SMTP id
 f22-20020a056a0022d600b0052574b3d020mr14130560pfj.80.1657472475361; 
 Sun, 10 Jul 2022 10:01:15 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.107.107])
 by smtp.googlemail.com with ESMTPSA id
 u14-20020a17090341ce00b0016c19417495sm2930596ple.239.2022.07.10.10.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 10:01:14 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, peter.maydell@linaro.org, berrange@redhat.com,
 jsnow@redhat.com, pbonzini@redhat.com, imammedo@redhat.com, mst@redhat.com,
 Ani Sinha <ani@anisinha.ca>
Subject: [PATCH v2 02/11] acpi/tests/bits: add SPDX license identifiers for
 bios bits tests
Date: Sun, 10 Jul 2022 22:30:05 +0530
Message-Id: <20220710170014.1673480-3-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220710170014.1673480-1-ani@anisinha.ca>
References: <20220710170014.1673480-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::433;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added the SPDX license identifiers based on the following output from the
licensee tool for bios bits:

$ licensee detect bits/
License:        NOASSERTION
Matched files:  COPYING
COPYING:
  Content hash:  7a1fdfa894728ea69588977442c92073aad69e50
  License:       NOASSERTION
  Closest non-matching licenses:
    BSD-3-Clause-Clear similarity:  85.82%
    BSD-4-Clause similarity:        83.69%
    BSD-3-Clause similarity:        77.27%

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/pytest/acpi-bits/bits-tests/smbios.py    | 2 ++
 tests/pytest/acpi-bits/bits-tests/testacpi.py  | 2 ++
 tests/pytest/acpi-bits/bits-tests/testcpuid.py | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/tests/pytest/acpi-bits/bits-tests/smbios.py b/tests/pytest/acpi-bits/bits-tests/smbios.py
index 9667d0542c..05ee8661c2 100644
--- a/tests/pytest/acpi-bits/bits-tests/smbios.py
+++ b/tests/pytest/acpi-bits/bits-tests/smbios.py
@@ -1,6 +1,8 @@
 # Copyright (c) 2015, Intel Corporation
 # All rights reserved.
 #
+# SPDX-License-Identifier: BSD-3-Clause-Clear
+#
 # Redistribution and use in source and binary forms, with or without
 # modification, are permitted provided that the following conditions are met:
 #
diff --git a/tests/pytest/acpi-bits/bits-tests/testacpi.py b/tests/pytest/acpi-bits/bits-tests/testacpi.py
index 9ec452f330..8e6bb3bbc6 100644
--- a/tests/pytest/acpi-bits/bits-tests/testacpi.py
+++ b/tests/pytest/acpi-bits/bits-tests/testacpi.py
@@ -1,6 +1,8 @@
 # Copyright (c) 2015, Intel Corporation
 # All rights reserved.
 #
+# SPDX-License-Identifier: BSD-3-Clause-Clear
+#
 # Redistribution and use in source and binary forms, with or without
 # modification, are permitted provided that the following conditions are met:
 #
diff --git a/tests/pytest/acpi-bits/bits-tests/testcpuid.py b/tests/pytest/acpi-bits/bits-tests/testcpuid.py
index ac55d912e1..94cc149556 100644
--- a/tests/pytest/acpi-bits/bits-tests/testcpuid.py
+++ b/tests/pytest/acpi-bits/bits-tests/testcpuid.py
@@ -1,6 +1,8 @@
 # Copyright (c) 2012, Intel Corporation
 # All rights reserved.
 #
+# SPDX-License-Identifier: BSD-3-Clause-Clear
+#
 # Redistribution and use in source and binary forms, with or without
 # modification, are permitted provided that the following conditions are met:
 #
-- 
2.25.1


