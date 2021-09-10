Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC12406DC2
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 16:49:35 +0200 (CEST)
Received: from localhost ([::1]:48086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOhqQ-0007YF-4M
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 10:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mOhhF-0002JD-5P
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:40:05 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:43701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mOhh9-0002xs-Vy
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:40:04 -0400
Received: by mail-qk1-x729.google.com with SMTP id ay33so2138879qkb.10
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 07:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kCylM2PJxf6V961yTwfP1rpV65wzYK9sB+B03vYoel8=;
 b=kSpjbkC31bkfre1vCjVYBRbqF13eumlTHhjS056hWRPpxjTE0fIdqBaRWkdvOpZLh7
 LHQrgCZd37q0lLERJZA5ah50qMqT/WcdRYHdIEqqBuZK9P2s74vl+f6808ZZmqxqDTdu
 b5Z++7yQWSc3Jpw4uY0m9h0v17L7GJoRoFNELpF7WoPKBmF5UrCq1GMQ2bRR8ezbDP9d
 t3cOE8wUjHknkyNrFAETBNNiUs44beWYgFj0jHjEt+DIwrq8IxRjx51m2zKvVELKx1bY
 xNdVdgHi3szCaelglT2qHs+QAXAqaKF9rc7LADo4oobzsJjxW27a5xSIqXUYugA+G3gT
 yCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kCylM2PJxf6V961yTwfP1rpV65wzYK9sB+B03vYoel8=;
 b=EWO7Q21KT+GZEvJFVs+Ex+0bFiy8Gn4AuGY19IgtT0nr5CB0ImQGerJ9KmNE6dZ5Mk
 YSst4c1gMHR235nyyR/RbSc5i8bZ0gyBQZTLadhL8mSdgfGlnVIuWTdSpm7MSQdEeFm4
 nCTt6FBo34LiAl7LX6RK/wVCSejHeq3nhADk9nXEtFcSPcYChXLrKTwEHr6Vcgxo7VH4
 dNYVCQ2r0p/Kx9RYG9/ZgelItmV5AlN4pWkrPDfnZ1fYy5y/x712EwB51FyuiwFTB7do
 pbHZ2qUSoWD6jE7ZIM1ZBIkGcQsR0QAMYHdMR4DzuMRRzCKK0grYi56OdR//1WtP2VgI
 PbyA==
X-Gm-Message-State: AOAM531GTtIlob8LxGQGuIdtIldaa9v3i5Ag2t9c34ujerUMCvXPMgBJ
 YFmGBnkKX5OctggE2xSQh/V3Xg==
X-Google-Smtp-Source: ABdhPJzsD5EkctnAIkjvmzuJi6g4JkSKWm56ilnPdY5JTfJPBXCTq1Fxbij14yoyPdi+Wc9Z7bsA9w==
X-Received: by 2002:a05:620a:b0f:: with SMTP id
 t15mr8094687qkg.352.1631284799143; 
 Fri, 10 Sep 2021 07:39:59 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id a9sm3827042qkk.82.2021.09.10.07.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 07:39:58 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v9 7/9] tests/data/acpi/virt: Add IORT files for ITS
Date: Fri, 10 Sep 2021 10:39:49 -0400
Message-Id: <20210910143951.92242-8-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210910143951.92242-1-shashi.mallela@linaro.org>
References: <20210910143951.92242-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x729.google.com
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 narmstrong@baylibre.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added expected IORT files applicable with latest GICv3
ITS changes.Temporarily differences in these files are
okay.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


