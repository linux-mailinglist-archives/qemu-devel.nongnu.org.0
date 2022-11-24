Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5074637AE0
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 15:00:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyCkd-00030x-K5; Thu, 24 Nov 2022 08:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oyCkb-00030R-Tf
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 08:58:49 -0500
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oyCka-0006JW-3m
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 08:58:49 -0500
Received: by mail-qv1-xf30.google.com with SMTP id df6so1022186qvb.0
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 05:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QqoMdCVCm6VT4OCmWmzBFvryjicjy7Ycz0sGRr4CCRE=;
 b=qtovHEVWI8+fn58Q/crRJlPDvwZXmYw1+vOj1b8VJeu/XJ+8Bu7SJPq4SUM/8SMnW/
 qurPiVDsY/CgycEvJIwbTG4vLULo1FPN2fqcbx7SfnYfOJjQqjrgD2sCZpl02NuN7TBW
 jqXXUNoiZljbA19OUEOtX8TlF80YQbFpsUgpMTh2W9RlAbA1TnxvaQLwvEPy43WNlbDh
 /dGmkVUP+ujvQG/VVgJQV3Nh/6gomPnVW/1Wr+OAJLTyWSf5zb3ko0fBRhzVI270hZ6d
 /BfKkOBLbg+qoMwtL/XRR3i/d70ze/ZjWWTA9s1MyHnb3LcG0wHuD41vQbgCcqv/k7vl
 JqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QqoMdCVCm6VT4OCmWmzBFvryjicjy7Ycz0sGRr4CCRE=;
 b=JfwMTEuJYmy2eOjH9i4zVAdYs0aW9Wt3rGxqTgkBNldHzbXSV3OWEoMmO3jqORP460
 cfuoOywexY7xaXD8nWov7/tlKaGvvdw5IvwJz2G/+wksu16fMg6Rn5XxE/DPgjiJrQms
 95TSODpJeo7h95eQuQ6KIQJojaePLDYRJDRvOmkJThgY03b9oToW1zrNXc+JFlbNHt9o
 Y2/hN4ZvGCpnxxcD8Xn71xUquECnGOK/Ar1ua9PgvFYwenfTPYS5N5PcbgrJXHAQagoy
 1gw4ompaIG2ZvIwinZOwqdKJMkfPpQ3TpumooQYYfj+fIcKSFIOh28hTqJ+spO7bE+2L
 3z9Q==
X-Gm-Message-State: ANoB5pk3mkaj6Kf5ZZXE3OA6PTSFYFYcLijqhXObq64J7FuVt7wcfdS/
 NiQuOBDJjvp2IeGh5483jldNRg==
X-Google-Smtp-Source: AA0mqf4Z8Z/PZ4Iuql8jQusew5nhRvhEFD0mfojfNkYWOzkVsUlbOH29Bwz46Q/EuOregbGij0dkUA==
X-Received: by 2002:a05:6214:5f86:b0:4c6:141f:819d with SMTP id
 ls6-20020a0562145f8600b004c6141f819dmr20223185qvb.34.1669298326694; 
 Thu, 24 Nov 2022 05:58:46 -0800 (PST)
Received: from anisinha-lenovo.apac.nsn-net.net ([131.228.104.69])
 by smtp.googlemail.com with ESMTPSA id
 h11-20020ac8714b000000b00342f8d4d0basm607138qtp.43.2022.11.24.05.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 05:58:46 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] acpi/tests/avocado/bits: add SPDX license identifiers for
 bios bits tests
Date: Thu, 24 Nov 2022 19:28:34 +0530
Message-Id: <20221124135834.924426-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::f30;
 envelope-from=ani@anisinha.ca; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Michael Tsirkin <mst@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: qemu-trivial@nongnu.org
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/avocado/acpi-bits/bits-tests/smbios.py2    | 4 ++++
 tests/avocado/acpi-bits/bits-tests/testacpi.py2  | 4 ++++
 tests/avocado/acpi-bits/bits-tests/testcpuid.py2 | 4 ++++
 3 files changed, 12 insertions(+)

Apologies for this. Somehow this patch fell off my tree between multiple
revisions. Quite trivial and does not affect any QEMU codebase.

diff --git a/tests/avocado/acpi-bits/bits-tests/smbios.py2 b/tests/avocado/acpi-bits/bits-tests/smbios.py2
index 9667d0542c..fc623de072 100644
--- a/tests/avocado/acpi-bits/bits-tests/smbios.py2
+++ b/tests/avocado/acpi-bits/bits-tests/smbios.py2
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
diff --git a/tests/avocado/acpi-bits/bits-tests/testacpi.py2 b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
index dbc150076e..f818a9cce6 100644
--- a/tests/avocado/acpi-bits/bits-tests/testacpi.py2
+++ b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
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
diff --git a/tests/avocado/acpi-bits/bits-tests/testcpuid.py2 b/tests/avocado/acpi-bits/bits-tests/testcpuid.py2
index ac55d912e1..7adefbe355 100644
--- a/tests/avocado/acpi-bits/bits-tests/testcpuid.py2
+++ b/tests/avocado/acpi-bits/bits-tests/testcpuid.py2
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


