Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5251B56D05D
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jul 2022 19:14:14 +0200 (CEST)
Received: from localhost ([::1]:59134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAaVZ-0008AT-79
	for lists+qemu-devel@lfdr.de; Sun, 10 Jul 2022 13:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oAaJQ-000763-Iq
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 13:01:40 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:36822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oAaJO-0003QC-Uk
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 13:01:40 -0400
Received: by mail-pg1-x52d.google.com with SMTP id s206so2932890pgs.3
 for <qemu-devel@nongnu.org>; Sun, 10 Jul 2022 10:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fMy7spbq2+bUWgIyrJhJfd9Xs4+WXB+8x2SN8PxtJko=;
 b=H/JsKcYFYSWUuxhrnFHcHc3zpDP098NjyU/2wLpUyKQywwZWHF/PzIzK1X+oTCwTBS
 X3fTDMs6AWh7q1o3K3DmXFhiepPrdT/ahg54mLcuSqTImeepDVlEmsm5zAVFqH2sx5Lj
 cpQNZT/GlnG9M0EZb92V8983hWSv+r6gjSOOqG05Vup0H19Z/5IW8YQWzeu1BtPmV1oO
 Dilcxhbg7TDliYgUWIXNXJsFfsIpDm2C1MQWXcWmJSB0S6dl7Y95LQYR6X760KDiUFPH
 agSeBmVFuxYesq7h2V8gcJd9A+iSCmCKxZaHun4W3/0fApojHZi33u7B6v+vjOCPr7Q0
 apRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fMy7spbq2+bUWgIyrJhJfd9Xs4+WXB+8x2SN8PxtJko=;
 b=2KEyB5zwXvW6M7hAT0t0qwlTSknsdhgPguaUfjwGVAbZwxk/c8JMih/tGnnRQLVE+o
 Ca56dCfkV2i0rtyGzkMv5GB/K8edqm6E+pmZh3tL01RYEJi0fHaI51fm4xRPfMhqqkPr
 NUMCpTle3J8/SiwhPsBYhhPMly+DM7rLDxNH8g3SEY1SyB66viSyuHqyVV8d8L7W/k02
 8uWyZyMUQA1N3F7wqMChYbaK6nXfeGj6jX9RYFyw13/cjdS2HRAfB/saYQoyi1RaQ47L
 4hCFvTVDqbYRXuKML3I9bA4IdiqhT4QA+6uU6g2NlM6jawMNnZKzrH82qqugNK5+bNwj
 UiCg==
X-Gm-Message-State: AJIora/w4XwX1MJ6XI+7KH9qYM1zmLMsDh4sZovXSglEgUIXm4KRTtJD
 uIkzOJQwagOXxMARd2Vnt/aJy76SKNlG+trj
X-Google-Smtp-Source: AGRyM1unts2MxkBsWgc4PqlPNUmKYsS/cUpLIV5Z7T0oPKzIQ7kA7B7n+pgE9ojsEh9UlQqnkOkS2Q==
X-Received: by 2002:a05:6a00:852:b0:528:c669:ad65 with SMTP id
 q18-20020a056a00085200b00528c669ad65mr14220799pfk.75.1657472497469; 
 Sun, 10 Jul 2022 10:01:37 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.107.107])
 by smtp.googlemail.com with ESMTPSA id
 u14-20020a17090341ce00b0016c19417495sm2930596ple.239.2022.07.10.10.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 10:01:37 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, peter.maydell@linaro.org, berrange@redhat.com,
 jsnow@redhat.com, pbonzini@redhat.com, imammedo@redhat.com, mst@redhat.com,
 Ani Sinha <ani@anisinha.ca>
Subject: [PATCH v2 08/11] acpi/tests/bits: add biosbits config file for
 running bios tests
Date: Sun, 10 Jul 2022 22:30:11 +0530
Message-Id: <20220710170014.1673480-9-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220710170014.1673480-1-ani@anisinha.ca>
References: <20220710170014.1673480-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52d;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x52d.google.com
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

This change adds initial biosbits config file that instructs biosbits to run
bios test suits in batch mode. Additionally acpi and smbios structures are also
dumped.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 .../pytest/acpi-bits/bits-config/bits-cfg.txt  | 18 ++++++++++++++++++
 tests/pytest/acpi-bits/bits-config/meson.build | 11 +++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 tests/pytest/acpi-bits/bits-config/bits-cfg.txt
 create mode 100644 tests/pytest/acpi-bits/bits-config/meson.build

diff --git a/tests/pytest/acpi-bits/bits-config/bits-cfg.txt b/tests/pytest/acpi-bits/bits-config/bits-cfg.txt
new file mode 100644
index 0000000000..8010804453
--- /dev/null
+++ b/tests/pytest/acpi-bits/bits-config/bits-cfg.txt
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
diff --git a/tests/pytest/acpi-bits/bits-config/meson.build b/tests/pytest/acpi-bits/bits-config/meson.build
new file mode 100644
index 0000000000..bbd7a940dc
--- /dev/null
+++ b/tests/pytest/acpi-bits/bits-config/meson.build
@@ -0,0 +1,11 @@
+config_files = ['bits-cfg.txt']
+
+copycfgfiles = custom_target('copy cfg files',
+  input : config_files,
+  output :  config_files,
+  command : ['cp', '@INPUT@', '@OUTPUT@'],
+  install : true,
+  install_dir : 'bits-config',
+  build_by_default : true)
+
+other_deps += copycfgfiles
-- 
2.25.1


