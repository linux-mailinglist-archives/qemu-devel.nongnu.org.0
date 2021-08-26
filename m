Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02503F8CD0
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:17:33 +0200 (CEST)
Received: from localhost ([::1]:54444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJ0K-0000m8-2B
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImm-0005Ry-KC
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:28 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImk-0008P5-36
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:28 -0400
Received: by mail-wr1-x434.google.com with SMTP id f5so6090421wrm.13
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TnzDm71KYQud7PpDKftXAENgNcbR1ab0xNUtbCpYsT8=;
 b=GmOW035Az/K6UJTzhy1VKDXx8AJGdoqdUiYgLsmUnfAxHNL46gCOnByy5WBbQiYCl/
 YHkp21/zvqxsWuRQBQjBmeykEIcw//p0es1C2G8QEUBHj6vjj6rQhwhjABkBkRCWMIkr
 nEVkrb43oFK9ew/YhSkBB/fNF9yP7K5gXyjIxHLItG//iqXCe+Fs9JT474JVPfoW0BqI
 oZtZHwEfsq99fI3PigrmRqm7qWoQrBQVIBpV5Hb1haiGx/4W3BzxVfPYhWpSG1BXdrFt
 WuhKkyCtcXndgjfBtPjIlFUsDpyf8Lo3swQAFwPHw5wTiW4J3Psjy47zRCg7xpBzIg/N
 +unQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TnzDm71KYQud7PpDKftXAENgNcbR1ab0xNUtbCpYsT8=;
 b=N5ol6QBiS5SJ5lsXbeN9PETZzmCLZYgYCluZg8Jkf5NdWCIay2W7MZKQ+akjVwYsDq
 anF6+So9ATQ2PevjA2ICnJD41EkfBV7+0Zqg6BA72owS6eR7TCgB9oI0qoazXo8B/mMO
 etYejeqM1zaXYMzltSPeAzlobK9Q9ZivDzdwgRIvmqfvXmkdklt99ykSl44qW1ecAwMX
 /Z+xrmgsVpgY2cPm+auiL6mC1UCGuCHskDMMYTVqDqLvQRf+oVtfhRWMQ40IYMUaOPAg
 7KQ8l5H+3Y3w3IigjvfSchCEua9jEbXttVaB/LFKGRh+VF7aEGVz4iFamt86vd2GNUVJ
 kmcg==
X-Gm-Message-State: AOAM532UXna+pOVn4+L8FN5muZdZWQqMSzN5inpRaJnjHm9aGlBT/H4Q
 PuSfvU6R9/SokvH6fiXAHB7erSVmx6nzhA==
X-Google-Smtp-Source: ABdhPJyYS2C8m9sS3sUTfMfE4R/KR2PDvTvCoJjssL4n2A/+Z/7prH5KHVUhswptzhvpYecl1TUTIQ==
X-Received: by 2002:adf:f7ce:: with SMTP id a14mr5247523wrq.174.1629997404748; 
 Thu, 26 Aug 2021 10:03:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/37] MAINTAINERS: Add ACPI specs documents to ACPI and NVDIMM
 sections
Date: Thu, 26 Aug 2021 18:02:44 +0100
Message-Id: <20210826170307.27733-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add entries for the ACPI specs documents in docs/specs to
appropriate sections of MAINTAINERS.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-id: 20210727170414.3368-6-peter.maydell@linaro.org
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6b3697962c1..dffcb651f46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1751,6 +1751,10 @@ F: qapi/acpi.json
 F: tests/qtest/bios-tables-test*
 F: tests/qtest/acpi-utils.[hc]
 F: tests/data/acpi/
+F: docs/specs/acpi_cpu_hotplug.rst
+F: docs/specs/acpi_mem_hotplug.rst
+F: docs/specs/acpi_pci_hotplug.rst
+F: docs/specs/acpi_hw_reduced_hotplug.rst
 
 ACPI/HEST/GHES
 R: Dongjiu Geng <gengdongjiu1@gmail.com>
@@ -2057,6 +2061,7 @@ F: hw/acpi/nvdimm.c
 F: hw/mem/nvdimm.c
 F: include/hw/mem/nvdimm.h
 F: docs/nvdimm.txt
+F: docs/specs/acpi_nvdimm.rst
 
 e1000x
 M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
-- 
2.20.1


