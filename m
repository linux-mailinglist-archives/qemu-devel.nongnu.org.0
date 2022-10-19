Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A157603868
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 05:07:59 +0200 (CEST)
Received: from localhost ([::1]:39284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okzQz-0006TL-Uy
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 23:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okzIC-0001uY-5Q
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 22:58:52 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:35338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okzIA-0003Rx-1X
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 22:58:51 -0400
Received: by mail-pg1-x534.google.com with SMTP id u71so15056781pgd.2
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 19:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YOSZuHIdixMwcXyYrUoyvs/iImC1NT84EcySJMnm0Qw=;
 b=dwFGT777BEzu95G1OwQkpZdApkTPP9swjmCBCMKR/ezf7ppGCNcf7F0Em//5ZxhomB
 9eON76qCcER7V7OyeEw+Z8QOs7vZyhTytOmjq+D4fLvui1LEBjNI1wY2r5fD5f3TIjZR
 E34hugOQ6wrZZ4GNWtgZolyRSioXPRfVNWrQb82/Bf2tgpGqTt8BLOp6ZdZAMY9EcKd0
 wCeOL/qTo4Q5NY+fyzVvAYA3hYzuXtIOCF5g72jhGXwt9hWF/xGoeiHwYLxcXe441v5L
 y1FsorU0py69Y5dDuS9yLdyWwTN7WlSqW+hTtr+MsF8SNPFrDfOU38DeaIFxztUaGcBb
 a/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YOSZuHIdixMwcXyYrUoyvs/iImC1NT84EcySJMnm0Qw=;
 b=sRAbjuAkSMm1IONeMrskFtXWOgTAz/9kTAu8RCnGWQhFRuRExPGRy/5rlrg5Eurzhe
 vlAOtv2mcPE8F6PDF+Q2azHucKv4ZGNTQEGD93SuiRlqjbqmqUBd7yTvrT2om4zD8G69
 tuafBX3zf3fM3gnlqCDwCvL5hGc2Y+Dok9YMDBaYPbIg0DU1niC32tYxydH5b4k7QjYT
 yibVSQeiaDI0iobSz/SxzztaksJiWY+meODwipdX0Ba5kMpN3MoH+MrOqpKurv91hRXP
 +dhdUOzpDtwviuTwj4cMqMuLvByJVciv48lUrjU+0zeMyeXwZ4wwYwsERqZmaXRRYD2H
 z1TA==
X-Gm-Message-State: ACrzQf2WtcUIkdOkgMKzmZ4/pfpvo8nD1ONj0vjwbotclIEdF3gy+esd
 3wGsZerSyVbfh9YQwhpMT2yPSA==
X-Google-Smtp-Source: AMsMyM5LCt7TMvNQuI/TBARLQzD1sN33zTpFekLInjeb0BpecAZksxQ+EJNbtsHbpV6CCRXjxN+YQQ==
X-Received: by 2002:a65:6c08:0:b0:448:c216:fe9 with SMTP id
 y8-20020a656c08000000b00448c2160fe9mr5202004pgu.243.1666148328586; 
 Tue, 18 Oct 2022 19:58:48 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.142.248])
 by smtp.googlemail.com with ESMTPSA id
 203-20020a6214d4000000b005626fcc32b0sm10320593pfu.175.2022.10.18.19.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 19:58:48 -0700 (PDT)
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
Subject: [PATCH v5 02/10] acpi/tests/avocado/bits: add SPDX license
 identifiers for bios bits tests
Date: Wed, 19 Oct 2022 08:28:20 +0530
Message-Id: <20221019025828.683113-3-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019025828.683113-1-ani@anisinha.ca>
References: <20221019025828.683113-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::534;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x534.google.com
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


