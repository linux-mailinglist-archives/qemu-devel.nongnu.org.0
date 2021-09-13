Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273BA409985
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:39:43 +0200 (CEST)
Received: from localhost ([::1]:34552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPoze-0003KJ-6e
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYt-00015V-FN
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:12:03 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:38412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYr-0008DK-5O
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:12:03 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso7411818wms.3
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 09:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DnHcKYAUuBwzxze38c9ICqdqdR0A+i5ARIkB9vVjhDI=;
 b=YR+sTuyQeKW/OQMKiky9/j6OVTOzhVfVUe7RUTGexFfcyt8SV5VPlLitiLvYVcdoM/
 inqYpOqbEYE9PuQn+9Er2EDAOOqKRMZgVDADFoIUVV2eWKxdpnFPMjRmRLv4iHYeEbdR
 5kvC/rlvgG57ViC0YKopm4HrFUfTZBYY5WQSdS2t2XsIXXdIf5/VwcJcDKraGeKGa69J
 d9NJfgG81QZuHCGGN6REEvJZhCtvEDMx88QfOj9YLqyrBuso8iXVr8USk+YyMKm88tl9
 eIby0l+JdUF4XEWsXKMxGRth5xOngZOu3Gfzd/2IREJw+VLf1BvfCvgjAxnN//JqEX6t
 k3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DnHcKYAUuBwzxze38c9ICqdqdR0A+i5ARIkB9vVjhDI=;
 b=L08BT8D3b43F+81g8r9N+DYoeLTGMFpWcETzfuN9tje/BefPCEC8CIWD+/EDbQkPkx
 nm28B1WRk9B3K4Dllw+4w8oLKmQJsECpkv0ifoRJH8gV0FaC4J6DjW7jQ6otaAm4oQBH
 h7pkVV+kG6b0EyBAqN8VT4gP0ZI/9D09JsiwnZyrhn16SBvhzLyu1In1ptqQqHWOT7kN
 PPcC3NL3+Wb0mNctotz+/mHXjX54j7g5LHPYg/0v2Ba3z6ZgEtGhPT0e8MVM0CPYvRN+
 5IzpPqF0xPWbJr63vpKBP3sbqrqL691OCueXkjFfDQAv3XcIqpmu/O+nNwKm/vTFwEiF
 cumQ==
X-Gm-Message-State: AOAM531rZkfiwRnbDV5JWcfUSedWoLeMhddJbL32QsnXevt2MlNMKbh9
 GtSBbhmZuT7QU906xZd1K5CeD0q0hWbs5g==
X-Google-Smtp-Source: ABdhPJxyK/Bj+5FNobF96sjTICO8+kIzHA1uxSQpnk+2CZ5VkF1ixMzq6XXBpXlVwdUdA0oBQTIFBw==
X-Received: by 2002:a7b:cc14:: with SMTP id f20mr11960574wmh.137.1631549518789; 
 Mon, 13 Sep 2021 09:11:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm7629265wmq.43.2021.09.13.09.11.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 09:11:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/23] tests/data/acpi/virt: Add IORT files for ITS
Date: Mon, 13 Sep 2021 17:11:36 +0100
Message-Id: <20210913161144.12347-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913161144.12347-1-peter.maydell@linaro.org>
References: <20210913161144.12347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Shashi Mallela <shashi.mallela@linaro.org>

Added expected IORT files applicable with latest GICv3
ITS changes.Temporarily differences in these files are
okay.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210910143951.92242-8-shashi.mallela@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 tests/data/acpi/virt/IORT                   | 0
 tests/data/acpi/virt/IORT.memhp             | 0
 tests/data/acpi/virt/IORT.numamem           | 0
 tests/data/acpi/virt/IORT.pxb               | 0
 5 files changed, 4 insertions(+)
 create mode 100644 tests/data/acpi/virt/IORT
 create mode 100644 tests/data/acpi/virt/IORT.memhp
 create mode 100644 tests/data/acpi/virt/IORT.numamem
 create mode 100644 tests/data/acpi/virt/IORT.pxb

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf..2ef211df597 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/IORT",
+"tests/data/acpi/virt/IORT.memhp",
+"tests/data/acpi/virt/IORT.numamem",
+"tests/data/acpi/virt/IORT.pxb",
diff --git a/tests/data/acpi/virt/IORT b/tests/data/acpi/virt/IORT
new file mode 100644
index 00000000000..e69de29bb2d
diff --git a/tests/data/acpi/virt/IORT.memhp b/tests/data/acpi/virt/IORT.memhp
new file mode 100644
index 00000000000..e69de29bb2d
diff --git a/tests/data/acpi/virt/IORT.numamem b/tests/data/acpi/virt/IORT.numamem
new file mode 100644
index 00000000000..e69de29bb2d
diff --git a/tests/data/acpi/virt/IORT.pxb b/tests/data/acpi/virt/IORT.pxb
new file mode 100644
index 00000000000..e69de29bb2d
-- 
2.20.1


