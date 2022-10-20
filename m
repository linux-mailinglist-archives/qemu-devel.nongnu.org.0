Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC5860635B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:41:36 +0200 (CEST)
Received: from localhost ([::1]:53314 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWjm-0001Pe-7d
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:41:34 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWiV-0002fa-PC
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olUm4-0007x9-Ls
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:35:52 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:44814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olUm2-0006zT-Qy
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:35:48 -0400
Received: by mail-pg1-x52c.google.com with SMTP id q1so19067950pgl.11
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1QJlH3nxyraSiaYzNcUEV4zTnDjvyhWQFqaziLu8vMk=;
 b=bfmr3B/px1VQeWH/cAdSLKa8PWvaR7HFCieWE1QVlpHUljP4vafky5EFSJEexi1AFZ
 nLiRrbJzalmbfVAXRITaQKaK1sf8sPTOa/AKEemacUwfQ/W5GqApr1W42CN2VX7Q1uEa
 fJ0HCVWHRF2sxT5199zFR05bHDMRM0kHTKhxG3kFya5YAOr0M/PRERfGYFHbrNqby+KS
 tqiXuxIHKjMTBCTlJmZD9z5/gE8WeyhjdwT16nMbyBtq3vpJ+q2EHfLiaoSxkHKNii90
 DXowtlsbPQlDZOEEjgYu3M+SzsgN0i0cEdhlB1gLLUVyOqV4FuNMrmCl2UYG0zK1buDt
 D+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1QJlH3nxyraSiaYzNcUEV4zTnDjvyhWQFqaziLu8vMk=;
 b=Rib5h0sZxEYL9M201/kyt2OdjYxiIOLhJz/qRrJOi7StorGLP8y9CZEit9zQypgVyM
 u+Dl1BQN9THaPy2vINxhcubQ4Dua1sog082mV4hewDTPBUn0uqEvD/lejZrs1aEUxTD4
 z7Dmiy7wQbgrIUEIlzCGhRVMN6bgKRVsPadlt+XpVf0yX68EL8QchEs7DrFg3BsAN5tn
 chtSuVaqpGrsYJsr6jpCXpp4CddDk1drW9J/V910ac/trk2bAwVT2UnATLyCpkJlmIw+
 ewxtIPnncmakS5GDe4XMTKzCrCluGqU+IIKCwla64RARt13tPebrproI+UWuN1DxPFAg
 Dpwg==
X-Gm-Message-State: ACrzQf0tt5x1jCkzfcLppMRbPPsRYnBM4jLQK9LmELs0kdHr/M7qeIPR
 ZFDecl8usHkHayHTguUptErahASJidcUnBXT
X-Google-Smtp-Source: AMsMyM6GRp1WcRYq7hO+TTx0nO0ZvIHhyPFeWn72knJJc4EBySssXHPcPVGUuxnxLCU/xTkj0GbzJw==
X-Received: by 2002:a63:6a06:0:b0:439:cc64:50e6 with SMTP id
 f6-20020a636a06000000b00439cc6450e6mr11418861pgc.483.1666269345318; 
 Thu, 20 Oct 2022 05:35:45 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.212.246.137])
 by smtp.googlemail.com with ESMTPSA id
 l11-20020a170903244b00b00176b3c9693esm12794174pls.299.2022.10.20.05.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:35:45 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v6 02/10] acpi/tests/avocado/bits: add SPDX license
 identifiers for bios bits tests
Date: Thu, 20 Oct 2022 18:04:58 +0530
Message-Id: <20221020123506.26363-3-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020123506.26363-1-ani@anisinha.ca>
References: <20221020123506.26363-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52c;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x52c.google.com
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
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Michael Tsirkin <mst@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/acpi-bits/bits-tests/smbios.py2    | 4 ++++
 tests/avocado/acpi-bits/bits-tests/testacpi.py2  | 4 ++++
 tests/avocado/acpi-bits/bits-tests/testcpuid.py2 | 4 ++++
 3 files changed, 12 insertions(+)

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
index 9ec452f330..18dc818d62 100644
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


