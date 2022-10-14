Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2E25FF32F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 19:54:36 +0200 (CEST)
Received: from localhost ([::1]:49488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojOtH-0004a6-98
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 13:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ojObz-000347-OC
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 13:36:43 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:42847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ojObw-00085n-DV
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 13:36:43 -0400
Received: by mail-pf1-x430.google.com with SMTP id i3so5518658pfk.9
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 10:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JhP3V8fuNS6YIALSqLJDMdY4c06/PmVYaaaEFPf1ptc=;
 b=1Ds8NOPYrSEmCmUluEpXdiRc/8eir5OlFzcOdkm7QycW4MyTFduyObmMSVg/JpBBXu
 TOCwSGcpbvy5w8/JudQZkiB6AP9iY0uecFJyFInCfqH7UoOTYzuv06NsLfsU7CyUzkLM
 qr+SaOrHFWvyBlk+VT3eFNJu7C6bmjduKg1SA7us95bTQ1LInG1aHUpDdGys/E2kxwPx
 6KTVAYnSbyN8T8YePdCyFxVXBA7LsR0BenyfVXgKVj6aIA/NdJP0FrxciSmOR8LdyHc4
 wL6q65tgLFW6yYw5357zCJHxhLtMwVzmRFPjdvVRFEmG8Hk+uYJnzr0W2Pj1OZ6XMgVy
 IRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JhP3V8fuNS6YIALSqLJDMdY4c06/PmVYaaaEFPf1ptc=;
 b=NUwv1mHgAONvrABhYGO8njDtAWZTeR/y1hJ+iASC1+nAvdHWxf4sVuhsa4yyLcx7NT
 kPIE2mcISJgHsG/tYOk3l0RF41yusjniJaIoDSRy53WT4Jdp9P9uOVxMl2MibZZ27W4Z
 Yk74j5POv8hRkTieKEp3t1yrhBUUIjG5w5QqVeotte/zKqm7n+mpDtkn+4Vun+tIUMN8
 /5OFoPmfEWgJd1WEkm1EUXK3hmK4h5BpF0sHFmvT5qeNJjAA6X+8+iP/Bl5cUXogDPqZ
 wBQ38hBbO/LNZvSdAieIFCnKrABvJ56LUYiL8JWcrOaiqkYBDWUM3jE4MgnycliaM76D
 7LxQ==
X-Gm-Message-State: ACrzQf1Dh+TSI/sx2/Qv7WnhEKRBxdqtVy5ZYwg1RCClF2qSHqZrcvQJ
 I4iTnF+BuTfYGbqqpMiRSmCtfg==
X-Google-Smtp-Source: AMsMyM4JWrsJZpbgiq8r72tWeFuT8dqdkDF5JAQm1Co1hlpgG+2iQGadaDQdL4fLCYPSIWaNvYsNXw==
X-Received: by 2002:a05:6a00:1596:b0:563:9a1a:b5b0 with SMTP id
 u22-20020a056a00159600b005639a1ab5b0mr6412417pfk.38.1665768998914; 
 Fri, 14 Oct 2022 10:36:38 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.243.197])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a1709027fcd00b0016d8d277c02sm2030042plb.25.2022.10.14.10.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 10:36:38 -0700 (PDT)
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
Subject: [PATCH v4 07/10] acpi/tests/avocado/bits: add biosbits config file
 for running bios tests
Date: Fri, 14 Oct 2022 23:05:05 +0530
Message-Id: <20221014173508.222823-8-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221014173508.222823-1-ani@anisinha.ca>
References: <20221014173508.222823-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::430;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x430.google.com
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

This change adds initial biosbits config file that instructs biosbits to run
bios test suits in batch mode. Additionally acpi and smbios structures are also
dumped.

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
 .../avocado/acpi-bits/bits-config/bits-cfg.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 tests/avocado/acpi-bits/bits-config/bits-cfg.txt

diff --git a/tests/avocado/acpi-bits/bits-config/bits-cfg.txt b/tests/avocado/acpi-bits/bits-config/bits-cfg.txt
new file mode 100644
index 0000000000..8010804453
--- /dev/null
+++ b/tests/avocado/acpi-bits/bits-config/bits-cfg.txt
@@ -0,0 +1,18 @@
+# BITS configuration file
+[bits]
+
+# To run BITS in batch mode, set batch to a list of one or more of the
+# following keywords; BITS will then run all of the requested operations, then
+# save the log file to disk.
+#
+# test: Run the full BITS testsuite.
+# acpi: Dump all ACPI structures.
+# smbios: Dump all SMBIOS structures.
+#
+# Leave batch set to an empty string to disable batch mode.
+# batch =
+
+# Uncomment the following to run all available batch operations
+# please take a look at boot/python/init.py in bits zip file
+# to see how these options are parsed and used.
+batch = test acpi smbios
-- 
2.34.1


