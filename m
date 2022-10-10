Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DDE5F9A94
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 10:03:28 +0200 (CEST)
Received: from localhost ([::1]:43040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohnl1-0001Eb-3i
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 04:03:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohnfX-0003wA-IR
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 03:57:49 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:38715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohnfV-0005r2-QQ
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 03:57:47 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so12388668pjq.3
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 00:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iQZ+FgCz5SrCTdStkCDUF1z7fXi8GkHJqh1qsWGmHaA=;
 b=DT0yIf7wV5yDwZdiUnoucvHd6TVAevqafts9LP8REGrZncaRBUb/Ae63UxGNStZ6FX
 orJd418KbDoCLHTwSorGdocV81Ywf/HtCz9R8GUgCx8i/nP3LAobm6W8ouRZJ0wGPHh3
 6G/BztPQ3G1efQG2VY8HNaPJrQ7g2ImbOAgQ2pv9wYlaO4OuXYHAzMMSl8GuYuOhjhkP
 c0WxsZDUAL2P6nlVoVU97SLyH/fEAf6Tw1miEmEJ+Yw8o1Yif/1Z7YrahFpjI4bWu726
 0ZRk2lRSDFU4tpJUxJkNORAa2q7myI1IqPCtVwxyNs3BkikTsTHqxdSVLzV49T3qsMl/
 1Yug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iQZ+FgCz5SrCTdStkCDUF1z7fXi8GkHJqh1qsWGmHaA=;
 b=XEuLE8E/9QUXIFNOfzsbi7wPsw6TxWUfLptqVwJsXjg3h2TcX+jmzCFtWwJ6nFUceK
 e7l0m+q1EAA3tv+z37/IRcyXY631VFtqusr2yv02FnS5SdSPhrMj9vd6JTqTyt/kqH2Q
 CFH+v/xCN5T7gmWoNxyQXoYBSatb2OH5Klt5WtcgWXia2FVWCjBKBNYpCvzHq18cxRTy
 LxmRfrdHvqHWSqgvnZ5l+K8CaUydeu9fb6Ea3QGu8kQzbUv93oJshcCTv5kLXDCDiec+
 ydIEz5muFKsUWtRzXolqqJaxgq8B8SAQ5fJKOKQprNpooMPioC+gr4FRwP7wwzuB/+Cj
 Hevw==
X-Gm-Message-State: ACrzQf1WrBDgyENisfamV+WOYYjG5/WD3O/gjHO98NC70GibqHkLZikS
 xRVEWpvuW3omqIB21EIieegbYYCwvtXanw==
X-Google-Smtp-Source: AMsMyM7rLrerDG8+Robr7U0Ek6g0S9DPaBNEz98RyfpLu0KUrLKl6FAao+otjfxHQCcAfuYGZMMATg==
X-Received: by 2002:a17:902:b942:b0:178:be25:203f with SMTP id
 h2-20020a170902b94200b00178be25203fmr18184466pls.101.1665388663998; 
 Mon, 10 Oct 2022 00:57:43 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.239.238])
 by smtp.googlemail.com with ESMTPSA id
 s2-20020a625e02000000b005624b4bd738sm6200379pfb.156.2022.10.10.00.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 00:57:43 -0700 (PDT)
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
Subject: [PATCH v3 07/10] acpi/tests/avocado/bits: add biosbits config file
 for running bios tests
Date: Mon, 10 Oct 2022 13:26:16 +0530
Message-Id: <20221010075619.4147111-8-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221010075619.4147111-2-ani@anisinha.ca>
References: <20221010075619.4147111-2-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102e.google.com
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


