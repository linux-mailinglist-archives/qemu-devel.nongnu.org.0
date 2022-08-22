Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B6F59BC54
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 11:10:38 +0200 (CEST)
Received: from localhost ([::1]:46174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ3S9-0004BF-57
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 05:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oQ3Mt-0005KL-L4
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:05:11 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:45679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oQ3Ms-0006pv-7z
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:05:11 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 x63-20020a17090a6c4500b001fabbf8debfso10574925pjj.4
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 02:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=xlZh3k59/5+iFFhHlHitsL1nJoDHeLLXvjMfiF3l4Es=;
 b=m+tMLdyFekjul1gWUJPr//lqF6xvXgBIU2iFh/9nMaZn8UMAKGvJ/TZveD+fLyG0jc
 oHWV1HwFhsL3feHv8VrV2MiRJkN1KfvTvGJFys85Oou4M4S5c3xYkj7/OITJ9AIVBq+C
 uKD+meCwC8G0yTAaWf8FA2Jd//yZufBg/qGk7EO8JdaQuovyP92NtwvejLQY20GdsHYl
 QuSnPMp9oXpRMMGcsKnWr2lAuyV5yJ+9XFrLp0J5D4OYdeWbJH2ZT91yWIPUj98qLAUD
 CqLE1+GNkB1j+SE9xB7anu2TdAenJMJI4Uz31eho5i8B65hSszGmOGuimd9agdaG9rlk
 zuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=xlZh3k59/5+iFFhHlHitsL1nJoDHeLLXvjMfiF3l4Es=;
 b=tXZwudWsZlQ6o4uZVpN6FWnK9ehPLJM6WDPVxtRzd1191rMwnM7SkpeM/a3UDTd6qa
 Qrafpo+7AD2u8EI80zO7sfhMRFLtv8Z3TFD5pXfyHWfC6d2tEYxUdZTEM1dWQt84K7s6
 Pfob2S7OM1oa7DMOsGknlTV8DJH0TDWjzGqOyx4drY44hLEz+Rzoz+88auWVF+ydRCFN
 hNMSQtp9pqrjHYUKY41qYXeI7GLjeeiKSngpV8MSVxNNaLhfGl5uAsul9tu2RIOMTIJM
 8Bm6cmz/pPNZ8zlEM3peZA+h6jbQONfS3oIFuam4iN25J5edPXBfPZFiChMC0go0SL0l
 BF2Q==
X-Gm-Message-State: ACgBeo07SXnpMFzsNcgT2YMXszrSpUqXtfWsXPmlWoqp84Gigdvz3jdo
 Y4YqQTOlLsQEq0k0oyCzqJ9SfSpeqScwkg==
X-Google-Smtp-Source: AA6agR6TzTtPQBBKbwQ9k5vt2hoPjDjgFsc3qiIsTW1bPCi74VuGsEvkxj1bzea+wxGMD2x0UiqGjA==
X-Received: by 2002:a17:90a:6001:b0:1fa:e851:3480 with SMTP id
 y1-20020a17090a600100b001fae8513480mr16110035pji.153.1661159108688; 
 Mon, 22 Aug 2022 02:05:08 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([116.73.134.198])
 by smtp.googlemail.com with ESMTPSA id
 n34-20020a635c62000000b0041c3ab14ca1sm7015428pgm.0.2022.08.22.02.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 02:05:08 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Cc: yvugenfi@redhat.com, jusual@redhat.com, kkostiuk@redhat.com,
 ybendito@redhat.com
Subject: [PATCH 1/4] hw/acpi: allow changes to DSDT and DMAR tables
Date: Mon, 22 Aug 2022 14:34:34 +0530
Message-Id: <20220822090438.426748-2-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822090438.426748-1-ani@anisinha.ca>
References: <20220822090438.426748-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102b;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102b.google.com
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

Our next change modifies DMAR and DSDT tables. Make sure we whitelist those
changes so that bios-table-test does not break.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/data/acpi/q35/DSDT.dmar               | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
 2 files changed, 2 insertions(+)
 create mode 100644 tests/data/acpi/q35/DSDT.dmar

diff --git a/tests/data/acpi/q35/DSDT.dmar b/tests/data/acpi/q35/DSDT.dmar
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..4efed12b59 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.dmar",
+"tests/data/acpi/q35/DMAR.dmar",
-- 
2.25.1


