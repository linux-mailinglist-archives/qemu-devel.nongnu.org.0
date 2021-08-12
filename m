Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97CE3EA90E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 19:03:01 +0200 (CEST)
Received: from localhost ([::1]:46198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEE6e-0007An-Gf
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 13:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDxw-0007tH-MD
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 12:54:00 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:37582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDxq-00064u-9W
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 12:54:00 -0400
Received: by mail-qk1-x72c.google.com with SMTP id 14so7379089qkc.4
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 09:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Z9C/CE+ufbrmEIPZ5EzW7+qdrK3GH7DzEHvIuwOuiY=;
 b=zDPpISjA5V6kc8hUUeqRWuV2IfSKlCj7r/LnHxg/bexmj0M0ePeRNp/IJ76+hkLpvc
 ntpo5pB5tph1TAzqDc22Fb5Pt6vINoM7REapDL6nngumVEz9xkNAKZqgso0vAuVf8kir
 sha7wqjxRWd3tEdf8Vo31DXz0gPGu7MrEPRyzcAgPeGiXI6Y3AYhlvwYUi6fobAqFJ71
 jeqgS/FYb62PZeD2mFu0kB/SAdqO0//U4MQywmcrJcB185bwsqcfyK9r7btvnrc2Hr45
 7okw3tty+rk2hgb2GZQt4YtlxJL873SLb8bC9BEjn8Doj4TZKD7TCCk3SmDBiUXsdKKj
 sHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Z9C/CE+ufbrmEIPZ5EzW7+qdrK3GH7DzEHvIuwOuiY=;
 b=BWdMyr/70LK9qMsJwP1xiA3ZSw3f6S/iCPuCBBGcJiTzR1haZJzcVWuux9tcAgo/vo
 1QT30JPOTY5Y2xNY+A5EF8LJ79sSKEoUA79hs674Yhk8YGWBvAxm+hQdBIbtFay5hMqm
 ZUwHmzzwtP/RGZHI8c+PWNjXCLr3+2BZkLJ6/ZmWNRhfxpMne4Tv34rg1CNECjjHDzq0
 z2KaFF0DXO0WPX5P1LcsY/KaL+ymTO3iAWbSOUHf/OLTGop6cakjl5XpbpaxCafaC5an
 HdK+Chy7VUIxnS43YcVj4O/7/O7vQ2K/vWQHL9eNzsFhAnbPuK9CCMy1kv7xxoavVsqL
 oxUw==
X-Gm-Message-State: AOAM530KAQvIq6E4X6btyuIaQcwCFKvSncUFiTl4YP8cPgPt9XH+Xyld
 8fo60tF+h0iGrBLBxebNG5fpZw==
X-Google-Smtp-Source: ABdhPJzylGq0tX+9hXZaEW+K0I9nMmyHO4hcZQSuDDqn8FWU34GYzMPiJRvRHiXsdn8E+IT5JDyaSQ==
X-Received: by 2002:ae9:e813:: with SMTP id a19mr5600845qkg.246.1628787232288; 
 Thu, 12 Aug 2021 09:53:52 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id c69sm1714864qkg.1.2021.08.12.09.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 09:53:52 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v8 08/10] tests/data/acpi/virt: Add IORT files for ITS
Date: Thu, 12 Aug 2021 12:53:39 -0400
Message-Id: <20210812165341.40784-9-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210812165341.40784-1-shashi.mallela@linaro.org>
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72c.google.com
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 narmstrong@baylibre.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added expected IORT files applicable with latest GICv3
ITS changes.Temporarily differences in these files are
okay.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
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


