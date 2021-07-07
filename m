Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A493BE0DD
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 04:27:06 +0200 (CEST)
Received: from localhost ([::1]:49128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0xHF-0008KB-80
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 22:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0x9F-0000Y1-NR
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 22:18:49 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:33780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0x8p-0001Oh-My
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 22:18:49 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id fi7so377384qvb.0
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 19:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=axd5FwFxYr5TwF9xkQcmsEoUNJHQHfTsD3YGTro3Vwo=;
 b=apcHyZXrL5OiL06X4SWkjgRhiaTnh/LHUC2lRmdQBUK4m2bGlxdvqgIf8FlL/p6BmH
 1Mkq4/NkoNvJPBjS4F6GLA+2ZXoMmzZCdd17+hsUfdDfz4aPJ608M5e8cJawDxs3pKI3
 5+xqJm5f50ElAaKtki3fQqJN84zWhzt4zw77/RdIWXoofvjQnqbc3r1oidix/lFZdjsD
 7jDXuFTBKTcM6c0vYxrkhWjEFwCL7TEw1wAHE9yoKm0KJ8DN/tRxZ3c1tQDP/+mYcreX
 QMtAgy0HP+jS/HkaI8U04B/OHrq340CDmF11oA71cBQZEsro9RjEyDGvyBN8/4t9Tfob
 2YBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=axd5FwFxYr5TwF9xkQcmsEoUNJHQHfTsD3YGTro3Vwo=;
 b=mjMKD3l8aqjlKrM5tUTyeMdgmxSMUeouI7R7wEx0GN7FCcfCgRwnadHHN/tlxcuhs+
 HN/ilmxMuF7ZiZRHavCuCTg0mP1p8Qt974NtNly9KGQoyWebPIAGt9tZDyDVjfZMpHpN
 WJI8DGutd684E2PBnTzQDJISIpY+3jGW+A+zhg8NLtIyW0CQpyTznkhcuYUhA9gDokND
 Jt34BLnO+HPrLnbCyOWoj/BOBUWxjHloLfnuz+XdwMFiBmdN7oIQ45b0GPV95lkQyQ4L
 7m0UI4OrQjur/krKb0GXcnI8Dh/UwRc3XefIhplu7pxy0drPINNxFOG9WkzfARSeCuf9
 89hA==
X-Gm-Message-State: AOAM531asL5yfPlotQeygZs1yebbPgzlWGbqV6YkhVgv1U+b5q+px/SQ
 fyxG3uqI39+SJ0wsn+lrWSUiHA==
X-Google-Smtp-Source: ABdhPJwP4gFdTENA7iLyy4bEHWYxdBnAcisBn3Ewu0Uvvl0+lF6XXJISChwfBcDdrCsZtcKBpaI3BA==
X-Received: by 2002:a0c:be85:: with SMTP id n5mr21497718qvi.59.1625624302855; 
 Tue, 06 Jul 2021 19:18:22 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id z6sm7768613qke.24.2021.07.06.19.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 19:18:22 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v6 08/10] tests/data/acpi/virt: Add IORT files for ITS
Date: Tue,  6 Jul 2021 22:18:13 -0400
Message-Id: <20210707021815.45938-9-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210707021815.45938-1-shashi.mallela@linaro.org>
References: <20210707021815.45938-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf2b.google.com
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added expected IORT files applicable with latest GICv3
ITS changes.Temporarily differences in these files are
okay.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 tests/data/acpi/virt/IORT                   | 0
 tests/data/acpi/virt/IORT.memhp             | 0
 tests/data/acpi/virt/IORT.numamem           | 0
 tests/data/acpi/virt/IORT.pxb               | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 5 files changed, 4 insertions(+)
 create mode 100644 tests/data/acpi/virt/IORT
 create mode 100644 tests/data/acpi/virt/IORT.memhp
 create mode 100644 tests/data/acpi/virt/IORT.numamem
 create mode 100644 tests/data/acpi/virt/IORT.pxb

diff --git a/tests/data/acpi/virt/IORT b/tests/data/acpi/virt/IORT
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/IORT.memhp b/tests/data/acpi/virt/IORT.memhp
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/IORT.numamem b/tests/data/acpi/virt/IORT.numamem
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/IORT.pxb b/tests/data/acpi/virt/IORT.pxb
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..2ef211df59 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/IORT",
+"tests/data/acpi/virt/IORT.memhp",
+"tests/data/acpi/virt/IORT.numamem",
+"tests/data/acpi/virt/IORT.pxb",
-- 
2.27.0


