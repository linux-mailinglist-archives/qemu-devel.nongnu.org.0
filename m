Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5210A4CD83E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:46:24 +0100 (CET)
Received: from localhost ([::1]:45794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQA8N-0004NJ-CI
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:46:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQA30-0003wx-JT
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:40:51 -0500
Received: from [2607:f8b0:4864:20::62e] (port=45949
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQA2z-00084I-99
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:40:50 -0500
Received: by mail-pl1-x62e.google.com with SMTP id s1so8037527plg.12
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 07:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=untwttg2h9MUzs6wtedAKndtsuh/tYZaw3CDKZL3ZkM=;
 b=xmQXtTC1D8YZukvU/3lM8dtfMest9d5YMBYQNwxDmXqwGpo38YWE48OEe51I7hb9++
 q6KL2Mp7OE/Q/v0pDJ2qPSux0iHWhfY1dKHiT1B/etfgfM7ClAC/uWv0Ynzjjgp1pqq/
 JBH9eUh4GriLcK/mlxLXLMxQKOvZqobWSSMXVMThgqhQLtZfiN5t+bf73Yi2MquFYihB
 vYNBhcfrVNm1GRisRHHfNlkOllKXRKHrbgPC/VEC9JmBXq5XWm50OGBFtWIZJb1ibRXk
 nOLa7QU1MWh8GSci2wcI40qj84mWfVAsVxwcUGDs53hegKoQ17f3KyI8pLR/97cLvd8X
 qYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=untwttg2h9MUzs6wtedAKndtsuh/tYZaw3CDKZL3ZkM=;
 b=PLT60h4fUAKJBdXlqJ5PGSrzTA4Ak/0RpfF01zuDZ/s0F8SYxMwfLhYDUdAC4rznH3
 5VqCwrF5tSKBJh7bHePKMgdIMNGIsZK7tnhPS9xGarxUhH6D63DocrrhD/zY0jKr3k3D
 yiCGuu9ckhu+7/woz+Py1jWmEmM5cEEkkHmBdOIWN+MF+UPVHuEur3cMXsCDJ+ELqadM
 94oOsa9TKz5YMNd+YysU/flTEa92F0f0BsWgDuMMcoT5QmXmBhUz7KB8FS6x3nKaM2ED
 CPEwvHk8qS2TJ0OdgCueJZGJTg+iflQb89BZUJ57vcamuUS9U/k7HDW/oE8GvYLj/jf/
 RC1g==
X-Gm-Message-State: AOAM532u1Hotf+EC0EmK7AcKwnGd2udE7EWJu5wn08ptEenR/0h6Obt/
 fCs4Gp+Y7aL/CgFkhHd7tZSQlx6Vp678wQ==
X-Google-Smtp-Source: ABdhPJycj7NsxQoIdRsQshuAdrj+fZCWD3MxPSY+kN9K76ArBFiSpExO8CnrBDH8K6PXbpMyAedr+Q==
X-Received: by 2002:a17:902:8a85:b0:151:b3c6:87f8 with SMTP id
 p5-20020a1709028a8500b00151b3c687f8mr6525312plo.129.1646408446606; 
 Fri, 04 Mar 2022 07:40:46 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.152.50])
 by smtp.googlemail.com with ESMTPSA id
 ck20-20020a17090afe1400b001bd0494a4e7sm5448366pjb.16.2022.03.04.07.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 07:40:46 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PATCH v7 1/4] tests/acpi: i386: allow FACP acpi table changes
Date: Fri,  4 Mar 2022 21:10:29 +0530
Message-Id: <20220304154032.2071585-2-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304154032.2071585-1-ani@anisinha.ca>
References: <20220304154032.2071585-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::62e;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: liavalb@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liav Albani <liavalb@gmail.com>

The FACP table is going to be changed for x86/q35 machines. To be sure
the following changes are not breaking any QEMU test this change follows
step 2 from the bios-tables-test.c guide on changes that affect ACPI
tables.

Signed-off-by: Liav Albani <liavalb@gmail.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..7570e39369 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/FACP",
+"tests/data/acpi/q35/FACP.nosmm",
+"tests/data/acpi/q35/FACP.slic",
+"tests/data/acpi/q35/FACP.xapic",
-- 
2.25.1


