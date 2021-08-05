Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A7C3E1EC7
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 00:34:26 +0200 (CEST)
Received: from localhost ([::1]:40732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBlwX-0001K4-0Z
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 18:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mBlsU-0007xe-4R
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:30:14 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:35748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mBlsQ-0005v6-GQ
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:30:13 -0400
Received: by mail-qv1-xf36.google.com with SMTP id 3so3842457qvd.2
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 15:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=axd5FwFxYr5TwF9xkQcmsEoUNJHQHfTsD3YGTro3Vwo=;
 b=t6NsvtOHR3VbHxim/vjLd+v+JY+lv9/6PszTwXWwlL+2HxUs8TdW7ZMS9J3oosZa//
 g6XZVHcg89jIxGSLq75u4Qoa2h5LFDLbvyvokH3YG1CIx/l6O2eMaKZW4C1hx+OUU709
 bA62VCA2n/aQnBF+rt85Ap7LyJLh27VkwRo0cH6rIcG6HNQvARoLSc/4Ba6NPchtMNn5
 e5HvH6S7vrW7r8eMS0fWnqyaiV7aun9iVJGQLiFk/KQLuTE4n1bOhZFeQp+6cLf9bQMv
 WjsNwGlA4oPI9m0rBXVr6Boldz0vsHwITI47psS475Gh9a3PLi3xCMB2xItRv3yucC7K
 TF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=axd5FwFxYr5TwF9xkQcmsEoUNJHQHfTsD3YGTro3Vwo=;
 b=eqhdXgIukF4reskXQfw+QiS3OOwiKB1BIN1FaMugwKRRlfJlGKWIvNjEz6zB75Mm7X
 sNINCrg7lUekSEOA2yksfdIrb0cQEwXH5QT9pG1HiueHwsIkcYSGdHDGRLh75DKPepL+
 ID+hqtgz8HcahXnsYChybVbNT6xC8WiK08sGrL/15NXbQfnDz4/oRRoovrp/iPlB2PGW
 5eQzIdw4y8Y3uEzesUSTaPu4evR5XxcTRA37e3tOhgioq5Go7SMqAf9MuD3FPn9oqJDm
 7IX8WL4+h/H3OR1Opack6LfXF36adrzBExIjRgM4edTjogo1ZABzEMP7l7zNJy5SDAQr
 74/w==
X-Gm-Message-State: AOAM530Gq6OC4DIZaSqd3S1X50SmhMUTSynxf52SVHQ3YodEKoZlFOE7
 HsuVDoPQeEGtJBU2+QjjuLARiw==
X-Google-Smtp-Source: ABdhPJwmSuN/IEWioJSbB07mGJeCDXZFiVonww/sMz5txiMpgWDbzvnSy6kSK3bRSuji2LOC8wzo1Q==
X-Received: by 2002:a0c:e394:: with SMTP id a20mr7733532qvl.42.1628202609372; 
 Thu, 05 Aug 2021 15:30:09 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id d28sm3655195qkj.25.2021.08.05.15.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 15:30:09 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v7 08/10] tests/data/acpi/virt: Add IORT files for ITS
Date: Thu,  5 Aug 2021 18:30:00 -0400
Message-Id: <20210805223002.144855-9-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210805223002.144855-1-shashi.mallela@linaro.org>
References: <20210805223002.144855-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf36.google.com
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


