Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A44A63B866F
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 17:43:32 +0200 (CEST)
Received: from localhost ([::1]:53686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lycN9-0008CO-JV
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 11:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lycCI-0004xE-I9
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:32:18 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:34342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lycC6-00058o-3s
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:32:18 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id h18so1308549qve.1
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 08:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=axd5FwFxYr5TwF9xkQcmsEoUNJHQHfTsD3YGTro3Vwo=;
 b=BABfT5Msj7iRC+F1umVpXp82ytJioCT3C0XrxJe1CKZg0Kl1HjAbrvOy5XCR6Fw42n
 l0ABX5t74auZpQHIhupuavLN0yC974QnmkGivpCUGALMss1yps7ngYGgKzxBGL8PHUf1
 cMhExlNA9nXUE+h5CJg110Dpz135mNGoY9+TNi5Pj4dPQ/B2VsJaOyugbLubqDw3qS8J
 9c+37aJ9Fj2HmkFFiPp1HBOw7NROT6XPC7MjdoXZ6f2NYoRKOdSwlg7F/LLp1C3bT1b5
 zX5j/siTeWg+RnvdWcAXioSZo0iz24Gaf09aSqG7cHwWL3vW/GGrlOHPNizzPbhtrcLZ
 uj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=axd5FwFxYr5TwF9xkQcmsEoUNJHQHfTsD3YGTro3Vwo=;
 b=TPD/ze+k1nYMPFrGh3Oyq7jGCgaJ3E1O/4NuuHW+m9vEvmipeBBccQS9w4MugIiBC0
 9FhcFoTRNM7ZK6Trq0+9ZSZMoCHJ7VzioDdQiOI2n8KAYmtBOuaHVKZEx2NP9LxKJzOI
 8xd5agomc6J6r61TUPBtPShQrKuLwwwKv6HPz332R1AgGhLNo2reKUXqd41i9s/Tk+fE
 /ThD58bvbVmiGVMfkyo33y7xknQN+uYH3laWzOEtY5echaomnLHjnZFxoXFbqUu4P7SP
 8SwfB2v0dhTtimKPuRID+UQYyq9n5W8+n634Wbg/Pa2O47UdPQK3prnsevljp2/URbgA
 kN0g==
X-Gm-Message-State: AOAM533n2Cb5EX+5Hjuw9OBhgUgHHyt3uS0kjTYnQ4QKdGilMmWv8hUK
 Nh7XCtlldwVq7czURL/NA2AA5Q==
X-Google-Smtp-Source: ABdhPJygaEVwJ+J7Cxt1OC11yxEGcJfReihmocmAehXrYt3uypD99MSt8Ii1kMjXPH6dL/cvA6SGzQ==
X-Received: by 2002:a05:6214:c48:: with SMTP id r8mr787836qvj.62.1625067125156; 
 Wed, 30 Jun 2021 08:32:05 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id 4sm836131qkm.100.2021.06.30.08.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 08:32:04 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v5 08/10] tests/data/acpi/virt: Add IORT files for ITS
Date: Wed, 30 Jun 2021 11:31:54 -0400
Message-Id: <20210630153156.9421-9-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210630153156.9421-1-shashi.mallela@linaro.org>
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
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


