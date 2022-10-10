Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A9A5F9AAC
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 10:08:58 +0200 (CEST)
Received: from localhost ([::1]:43086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohnqL-000455-3L
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 04:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohnf5-0003df-U5
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 03:57:20 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:39641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohnf0-0005kc-Dp
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 03:57:19 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 v10-20020a17090a634a00b00205e48cf845so12381875pjs.4
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 00:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e3JfFuZi6I+seBNMmr4ApLQZaG1FLkSLtCQeY0Qdlu0=;
 b=na1qHAiz/2uC1UDuV2d/7fM+pOcu891y/DysnGWIh9PUw/QWCVrcSSkuiUKGYhWOCB
 ekR9DwuBX5LqSXvBzXrWzbUw0E8iPAwqdCbzSHIrVRMy3up6HSlBmOh0Yo19i9t2LXPU
 xpePq1oP1jwY1qxMz0JS1ntcG8Xn+9Vlf1M2E/C6zcNcD3dQ9mxj8FlR2niQZq7e5E7h
 PIFLHU3rLcM2INPDtsHZFFy3mULrYly9UFEJZzgb7WA8Qv7lGu8Q/Am+pkMIIdX5sxE+
 v1v5+FiQKN/7xg9PyBDHU9TkwKadDmlRr9yOav4KnyDDq3u9ao/FOFc2G/PNZU/h6OrX
 nTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e3JfFuZi6I+seBNMmr4ApLQZaG1FLkSLtCQeY0Qdlu0=;
 b=J03AVrhBxuVp6ZZaeigjWufNT5c+a6QlYUFzBFhgPC505knoLjt4i7i2z5i68bjBrh
 O11IERryrbfS9+VUQ0AR7SI8V0djrDuCQTsgvsHfQo7U/0r0FlyR3mbc1/EirAxgDbeh
 dLVfrwVrA7I4oOmsGwzEQIEQE9WuUmUGyd/Y5cdWvVXy4Pxj2iUgYAwTJ5bzNY82qy3P
 leXRJnaSBY82V9bAF+6KH+2HSIKeT+lAvzJXltdYWB4ocjI9yhGz6TE1LsVQzYQ+LQfJ
 FeMM5/7VUJkrG6RD6aRXCd3KLaqFpCCihaZxZoCjmMyIcYEcDcnLnzJW4wUK8VcJ3RL5
 Tkdw==
X-Gm-Message-State: ACrzQf3NMQ9mgi1bbW+O85yXEAjgltEUgrB9uPmuky7FTq0n3fYwyp0c
 Zm/86H3Q4gNwZXllzMKzKSlfH7CIQTKp8g==
X-Google-Smtp-Source: AMsMyM7+bh2wmLG2/I+/qVQV2MZVx6dO8ixg1SKxWP9eU2C936L0TDEgzhDA3799M138YNas4BzWrg==
X-Received: by 2002:a17:90a:ea95:b0:20a:f65b:143b with SMTP id
 h21-20020a17090aea9500b0020af65b143bmr19585879pjz.230.1665388632750; 
 Mon, 10 Oct 2022 00:57:12 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.239.238])
 by smtp.googlemail.com with ESMTPSA id
 s2-20020a625e02000000b005624b4bd738sm6200379pfb.156.2022.10.10.00.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 00:57:12 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: mst@redhat.com, imammedo@redhat.com, Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 02/10] acpi/tests/avocado/bits: add SPDX license
 identifiers for bios bits tests
Date: Mon, 10 Oct 2022 13:26:11 +0530
Message-Id: <20221010075619.4147111-3-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221010075619.4147111-2-ani@anisinha.ca>
References: <20221010075619.4147111-2-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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

Added the SPDX license identifiers for biosbits tests.
Also added a comment on each of the test scripts to indicate that they run
from within the biosbits environment and hence are not subjected to the regular
maintanance acivities for QEMU and is excluded from the dependency management
challenges in the host testing environment.

Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Maydell Peter <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/avocado/acpi-bits/bits-tests/smbios.py    | 4 ++++
 tests/avocado/acpi-bits/bits-tests/testacpi.py  | 4 ++++
 tests/avocado/acpi-bits/bits-tests/testcpuid.py | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/tests/avocado/acpi-bits/bits-tests/smbios.py b/tests/avocado/acpi-bits/bits-tests/smbios.py
index 9667d0542c..fc623de072 100644
--- a/tests/avocado/acpi-bits/bits-tests/smbios.py
+++ b/tests/avocado/acpi-bits/bits-tests/smbios.py
@@ -1,6 +1,8 @@
 # Copyright (c) 2015, Intel Corporation
 # All rights reserved.
 #
+# SPDX-License-Identifier: BSD-3-Clause
+#
 # Redistribution and use in source and binary forms, with or without
 # modification, are permitted provided that the following conditions are met:
 #
@@ -24,6 +26,8 @@
 # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
+# This script runs only from the biosbits VM.
+
 """SMBIOS/DMI module."""
 
 import bits
diff --git a/tests/avocado/acpi-bits/bits-tests/testacpi.py b/tests/avocado/acpi-bits/bits-tests/testacpi.py
index 9ec452f330..18dc818d62 100644
--- a/tests/avocado/acpi-bits/bits-tests/testacpi.py
+++ b/tests/avocado/acpi-bits/bits-tests/testacpi.py
@@ -1,6 +1,8 @@
 # Copyright (c) 2015, Intel Corporation
 # All rights reserved.
 #
+# SPDX-License-Identifier: BSD-3-Clause
+#
 # Redistribution and use in source and binary forms, with or without
 # modification, are permitted provided that the following conditions are met:
 #
@@ -24,6 +26,8 @@
 # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
+# This script runs only from the biosbits VM.
+
 """Tests for ACPI"""
 
 import acpi
diff --git a/tests/avocado/acpi-bits/bits-tests/testcpuid.py b/tests/avocado/acpi-bits/bits-tests/testcpuid.py
index ac55d912e1..7adefbe355 100644
--- a/tests/avocado/acpi-bits/bits-tests/testcpuid.py
+++ b/tests/avocado/acpi-bits/bits-tests/testcpuid.py
@@ -1,6 +1,8 @@
 # Copyright (c) 2012, Intel Corporation
 # All rights reserved.
 #
+# SPDX-License-Identifier: BSD-3-Clause
+#
 # Redistribution and use in source and binary forms, with or without
 # modification, are permitted provided that the following conditions are met:
 #
@@ -24,6 +26,8 @@
 # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
+# This script runs only from the biosbits VM.
+
 """Tests and helpers for CPUID."""
 
 import bits
-- 
2.34.1


