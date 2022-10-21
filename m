Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AEA6074E8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:19:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olp7e-0002oX-L0
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:19:27 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olosd-0003nn-LV
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olore-0001wU-OA
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:02:56 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olorc-0006IG-5p
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:02:54 -0400
Received: by mail-pl1-x636.google.com with SMTP id l4so1895115plb.8
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 03:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YgQtEmb1p2deCFko285rAhivjkemFQQDkkRHh36xjFA=;
 b=5jyjJkYhGWnu4yjNv5g2aQZQdfGhDRdXaHd1zQlZHvcAqDPK6VUlTGCOqmLMrTCe9r
 h+idU8a4fgBWTXfpX/o66TXtKolXWzOdkTE0AZWhlWgd0LojvxrVEiN0KNEHSMG6Ppoe
 vjei9TPKNyfG8+uufJ+2V3J9qsuQbKWE1qjvBZlo7emrm4Zi5gNgnz7/3GNE6m8bipis
 aOJjk+/vTXTXgHGHNK8BdXTZj3L98addJnoop4FG5opp+4UJNTL8/j6Y2utKFkYhUti4
 vAwPnV0uBw+jJxZ23APallXqO7ybs0vARivBkQ7oKRYAxbIfw3XssAUqOdnU2a0Ag44P
 ANHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YgQtEmb1p2deCFko285rAhivjkemFQQDkkRHh36xjFA=;
 b=jFJZksqZdpM/zOGKC7MC3VmExQNEqGtjn00yUU6nbuxvLqntfC8h83MxPlgsYAjwhD
 /Evj3FdO1GaiSsrkV959MRLJRucai3SHWtCOR8MPmh927JDXxLqKHAmFO3JzXJLwi9BC
 jYJD33pBfOPdzCzGLkHJbwcOdBCf05bN0HPuIWMJy0cMx7JASsbI/DxqTuszm7Uzfobe
 zzcozc0K5AybglQ/88p+oGdo4OJovjoiO5uQ1uuyIpmdCfgYsVFZRJCPbZBLBd4Os42F
 7ntRfrMR7hrxmr5cHy+3icYjs7aQaPZLiX3yOd4uvKFfgNM5w8eHRuDDpNKrmMy1THdW
 sx8g==
X-Gm-Message-State: ACrzQf3jXfLfMU7kZYGJ67PqCnOCNlPX2qHgOwp3uhPU9yyCfd+1rf6G
 9Xi1Jr0cYq+rd3wagEagQ4+yuA==
X-Google-Smtp-Source: AMsMyM7EIENVcIZ8tF7TQ8LU4JOdxAvzRCeHz0EsAwavpqfuql7DCuCh8J3eRtldevklxqmbZ5V0Jw==
X-Received: by 2002:a17:903:22d0:b0:185:5421:a5d3 with SMTP id
 y16-20020a17090322d000b001855421a5d3mr18330732plg.119.1666346568261; 
 Fri, 21 Oct 2022 03:02:48 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.212.245.138])
 by smtp.googlemail.com with ESMTPSA id
 e14-20020a631e0e000000b0042fe1914e26sm12997375pge.37.2022.10.21.03.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 03:02:47 -0700 (PDT)
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
Subject: [PATCH v7 4/7] acpi/tests/avocado/bits: add biosbits config file for
 running bios tests
Date: Fri, 21 Oct 2022 15:21:05 +0530
Message-Id: <20221021095108.104843-5-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021095108.104843-1-ani@anisinha.ca>
References: <20221021095108.104843-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::636;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x636.google.com
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
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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


