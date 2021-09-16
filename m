Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBD540DB43
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 15:32:28 +0200 (CEST)
Received: from localhost ([::1]:36442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQrV5-0007j8-9p
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 09:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mQrRx-000520-EK
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 09:29:13 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:41532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mQrRw-0007d7-1I
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 09:29:13 -0400
Received: by mail-pf1-x42a.google.com with SMTP id x7so5852049pfa.8
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 06:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a/nPhJuP95RL5fMCHVyTOvgO3IX+H7wE9bjcTGUL250=;
 b=MXLlOiNs5ylwbG7mzwLpDNH5O1BN16VX0GhTyCLO38iE2ipwcWlrhIQX9t0oYpZCep
 zgzYjRsGjMNV6gl10CyxukilZgl8/4b4WuSRuhzkj31IfpI6Bcylhoawapfmq5y1WnYI
 p70G67bI2eKUvxG40g2X8HKrUjFAutVmyVHF2/fvwkaNmqqXTthy9Ewv3XG+nqsJqRRG
 HIERc2MrlmLcYOF4o2IXhk4Q+Kqk9GdDF0+6CgK+Wue5xDthaOG1YcFWwT35I7iRVJsv
 U73TN5hPfp1P9v7uAOqzmT4f3CMn8hnB/qzQE7XrXbKNS+WS3NlelU9gjTKV9FdDJGIc
 3OfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a/nPhJuP95RL5fMCHVyTOvgO3IX+H7wE9bjcTGUL250=;
 b=BKwgpxAVoQv9zqRW+z+qh1U2PfaO50KTYrf73qZfImldPgoo7V+cUKl5pmlEyJvwrb
 AA+PmkXeI0rKDmFm4ygQsTNgQ97hbZbZbYcJwtLt+5vO5GbZ1SxKFQOZVUBk86BYa7Oc
 vak+i6JKKCFxwGyRkMpJPweZH+tqg6+EvoMYX8ksy8EmJLKzgnntDpiCXZ/hTEXJph7d
 iRpwUOvQGMb/jMA5bGFhqU6yYoKrDt6PKDbyuZeHsg+up93P1Osap3gTrBKNN2CCZsdu
 K639q9SOXcoggG3+ViaUJG6kykQ611mBGkhUkVGfmIf43KCiEEU40XJYElPt7YN+zW66
 oRUg==
X-Gm-Message-State: AOAM531MT+TzTQmcsqsb8EljIDDpGGGxYHlSWhjecRfXfko2blIkJRmh
 OnbWiISBckRiAaEEKMEuU4QlLktUL5Cvmg==
X-Google-Smtp-Source: ABdhPJwb4+Z0hmzXxZVTEjlP3X7du/g//2jAll7yim9Nm81KYelTdrilo4MFEafbou18/mQVBiyPbQ==
X-Received: by 2002:aa7:8e91:0:b0:43e:1dd:812b with SMTP id
 a17-20020aa78e91000000b0043e01dd812bmr5110764pfr.35.1631798949492; 
 Thu, 16 Sep 2021 06:29:09 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.233.134])
 by smtp.googlemail.com with ESMTPSA id w67sm3458272pfb.99.2021.09.16.06.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 06:29:09 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org,
	qemu-stable@nongnu.org
Subject: [PATCH v2 1/3] bios-tables-test: allow changes in DSDT ACPI tables
 for q35
Date: Thu, 16 Sep 2021 18:58:36 +0530
Message-Id: <20210916132838.3469580-2-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916132838.3469580-1-ani@anisinha.ca>
References: <20210916132838.3469580-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42a;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, philmd@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, jusual@redhat.com,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to commit a change to fix IO address range allocated for acpi pci
hotplug in q35. This affects DSDT tables. This change allows DSDT table
modification so that unit tests are not broken.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..a02b88305c 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,12 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/q35/DSDT.tis",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/DSDT.nohpet",
+"tests/data/acpi/q35/DSDT.dimmpxm",
+"tests/data/acpi/q35/DSDT.acpihmat",
-- 
2.25.1


