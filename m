Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C210B39A811
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:15:00 +0200 (CEST)
Received: from localhost ([::1]:42624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqvr-00059J-MH
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loqu2-0002Cr-Fn
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:13:06 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loqtz-0005Qj-Ka
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:13:06 -0400
Received: by mail-wr1-x435.google.com with SMTP id a20so6664150wrc.0
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 10:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T5utTavgkp5XUgjC2Nw+5xAxnWI2T3w58+Vqg3JiwKg=;
 b=I811LdHo1ma4E4wT9cIT+n27QkxysNMTcgUuUy5yqpacEX/En63EqpH0oB4J4Jj0dS
 HUgz/Wbr3TQTlW02Fe8657irJRZ17T+u7iAc/DD9gwAPDUEdrtsHlIKN1zpGHiW18r75
 N0QdXOt/Z9XhzB+55JnmhbynTVAAmSFy0ZUcIYSbITYBc/wGdR3PDdZnLe0/oddO3ry0
 w9eJng8RDFbEil0gaZA2wyahCM9oG9+MRuX2NLqnAhw5hpLylP+6ip8ddoGV62+2Ne2v
 Iw0awxTkrZeLKvR7Ye2YwD7XCwRWKPdHnch3+dI46KFv/Cy6q1J4cFHpcujoIJun899r
 PO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T5utTavgkp5XUgjC2Nw+5xAxnWI2T3w58+Vqg3JiwKg=;
 b=AgvJFsRAPfoz+br99TZOliFbGwBQKJTnThbDKctY/hg2r7uOVD2SLuIvcwzJdnuVSB
 HCrJC/10gMWPhoo63ChLPwxhMt3H5DrM1xFaPm3TZLdkJlYHyFmD5I0cgeQsff2+kbok
 uCXko4MDvC1dx5Q4Xlm1VItEzdpcKU0dhnQJDZjIpqlHyItqp7SC3i0SWtE9ruvXcf1/
 2si3fuCYrilzfEx2ko7Nxkwf31nnlDv6NG/DSaP9YjjZ7QK8XFxG8y1XnumY5fsHqqSC
 RajoPh5yZFBIESgWrZlnXUpaJHkjLC2p4MJZsWQIXk3vSnoHuZ6guii/AVF/6NxrJr+f
 SBHA==
X-Gm-Message-State: AOAM530MMLJAWylOfPo4drlzh5bc4i+4PuUEFWpMzs7ErdYXScC3kiy7
 mlIoNf8ea+qoubbF7Cec5OJBOQ==
X-Google-Smtp-Source: ABdhPJx7RokBRTt7bEXH9G74UsUDYHiorpx07mqPWj/7gR+D50pJGigGk5FuFzNNhUc/stt7PBzVJQ==
X-Received: by 2002:adf:e487:: with SMTP id i7mr43416wrm.348.1622740382214;
 Thu, 03 Jun 2021 10:13:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m5sm6190319wmq.6.2021.06.03.10.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 10:13:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/acpi: Provide stub version of acpi_ghes_record_errors()
Date: Thu,  3 Jun 2021 18:12:57 +0100
Message-Id: <20210603171259.27962-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603171259.27962-1-peter.maydell@linaro.org>
References: <20210603171259.27962-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Igor Mammedov <imammedo@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Swetha <swjoshi@microsoft.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Generic code in target/arm wants to call acpi_ghes_record_errors();
provide a stub version so that we don't fail to link when
CONFIG_ACPI_APEI is not set. This requires us to add a new
ghes-stub.c file to contain it and the meson.build mechanics
to use it when appropriate.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/acpi/ghes-stub.c | 17 +++++++++++++++++
 hw/acpi/meson.build |  6 +++---
 2 files changed, 20 insertions(+), 3 deletions(-)
 create mode 100644 hw/acpi/ghes-stub.c

diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
new file mode 100644
index 00000000000..9faba043b85
--- /dev/null
+++ b/hw/acpi/ghes-stub.c
@@ -0,0 +1,17 @@
+/*
+ * Support for generating APEI tables and recording CPER for Guests:
+ * stub functions.
+ *
+ * Copyright (c) 2021 Linaro, Ltd
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/acpi/ghes.h"
+
+int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
+{
+    return -1;
+}
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index dd69577212a..03ea43f8627 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -13,13 +13,13 @@ acpi_ss.add(when: 'CONFIG_ACPI_PCI', if_true: files('pci.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_VMGENID', if_true: files('vmgenid.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_HMAT', if_true: files('hmat.c'))
-acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'), if_false:('ghes-stub.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_X86', if_true: files('core.c', 'piix4.c', 'pcihp.c'), if_false: files('acpi-stub.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
 acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
 acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
 acpi_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
-softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c'))
+softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c'))
 softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 'aml-build-stub.c',
-                                                  'acpi-x86-stub.c', 'ipmi-stub.c'))
+                                                  'acpi-x86-stub.c', 'ipmi-stub.c', 'ghes-stub.c'))
-- 
2.20.1


