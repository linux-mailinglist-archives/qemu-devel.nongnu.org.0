Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C132B2FAE1A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 01:38:34 +0100 (CET)
Received: from localhost ([::1]:60734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1f2X-00085T-RR
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 19:38:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marian@mutex.one>)
 id 1l1ewg-00030a-3j; Mon, 18 Jan 2021 19:32:30 -0500
Received: from mail.mutex.one ([62.77.152.124]:49554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marian@mutex.one>)
 id 1l1ewd-0004Bn-OI; Mon, 18 Jan 2021 19:32:29 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.mutex.one (Postfix) with ESMTP id ED0E0BF4265B;
 Tue, 19 Jan 2021 02:32:25 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
 by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V8qHXvWHbvXq; Tue, 19 Jan 2021 02:32:25 +0200 (EET)
Received: [127.0.0.1] (localhost [127.0.0.1])nknown [109.103.89.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mutex.one (Postfix) with ESMTPSA id D1476BF423B3;
 Tue, 19 Jan 2021 02:32:24 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
 t=1611016345; bh=y7JLysCHpkns1hYxYdlzzv9H47TyaL9EnTVW5Ece6RA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F48KP/GpE70+jhaT5F8fWBe7kBEe48c268fgVRdwqFnjR2AxwBJhpWegQHSyDKlxf
 bsSpqTbsYUpkbhl07q+I/11QCKMYUWJrv3vEZStehr3ALLp0AK2T3k4n2KlVVXFQpm
 DLjxRiLi0EWrRFAIxaOWlNdkAqAbe2/deZCukBkk=
From: Marian Postevca <posteuca@mutex.one>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/5] tests/acpi: disallow updates for expected data files
Date: Tue, 19 Jan 2021 02:32:16 +0200
Message-Id: <20210119003216.17637-6-posteuca@mutex.one>
In-Reply-To: <20210119003216.17637-1-posteuca@mutex.one>
References: <20210119003216.17637-1-posteuca@mutex.one>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=62.77.152.124; envelope-from=marian@mutex.one;
 helo=mail.mutex.one
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>, qemu-arm@nongnu.org,
 Marian Postevca <posteuca@mutex.one>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Marian Postevca <posteuca@mutex.one>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 94 ---------------------
 1 file changed, 94 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index b20ae72949..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,95 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/APIC",
-"tests/data/acpi/virt/FACP",
-"tests/data/acpi/virt/GTDT",
-"tests/data/acpi/virt/MCFG",
-"tests/data/acpi/virt/SPCR",
-"tests/data/acpi/virt/DSDT",
-"tests/data/acpi/virt/APIC.numamem",
-"tests/data/acpi/virt/FACP.numamem",
-"tests/data/acpi/virt/GTDT.numamem",
-"tests/data/acpi/virt/MCFG.numamem",
-"tests/data/acpi/virt/SPCR.numamem",
-"tests/data/acpi/virt/DSDT.numamem",
-"tests/data/acpi/virt/SRAT.numamem",
-"tests/data/acpi/virt/DSDT.memhp",
-"tests/data/acpi/virt/NFIT.memhp",
-"tests/data/acpi/virt/SSDT.memhp",
-"tests/data/acpi/virt/SLIT.memhp",
-"tests/data/acpi/virt/SRAT.memhp",
-"tests/data/acpi/virt/SPCR.memhp",
-"tests/data/acpi/virt/MCFG.memhp",
-"tests/data/acpi/virt/GTDT.memhp",
-"tests/data/acpi/virt/APIC.memhp",
-"tests/data/acpi/virt/FACP.memhp",
-"tests/data/acpi/virt/DSDT.pxb",
-
-"tests/data/acpi/pc/SRAT.acpihmat",
-"tests/data/acpi/pc/HPET",
-"tests/data/acpi/pc/DSDT.hpbrroot",
-"tests/data/acpi/pc/SRAT.numamem",
-"tests/data/acpi/pc/DSDT.dimmpxm",
-"tests/data/acpi/pc/DSDT.acpihmat",
-"tests/data/acpi/pc/FACP",
-"tests/data/acpi/pc/SRAT.cphp",
-"tests/data/acpi/pc/DSDT.numamem",
-"tests/data/acpi/pc/DSDT.bridge",
-"tests/data/acpi/pc/HMAT.acpihmat",
-"tests/data/acpi/pc/DSDT.cphp",
-"tests/data/acpi/pc/APIC.dimmpxm",
-"tests/data/acpi/pc/SRAT.memhp",
-"tests/data/acpi/pc/SLIT.cphp",
-"tests/data/acpi/pc/DSDT.hpbridge",
-"tests/data/acpi/pc/NFIT.dimmpxm",
-"tests/data/acpi/pc/APIC.cphp",
-"tests/data/acpi/pc/SSDT.dimmpxm",
-"tests/data/acpi/pc/SRAT.dimmpxm",
-"tests/data/acpi/pc/APIC.acpihmat",
-"tests/data/acpi/pc/DSDT.memhp",
-"tests/data/acpi/pc/DSDT.ipmikcs",
-"tests/data/acpi/pc/SLIT.memhp",
-"tests/data/acpi/pc/WAET",
-"tests/data/acpi/pc/DSDT",
-"tests/data/acpi/pc/APIC",
-"tests/data/acpi/pc/DSDT.roothp",
-
-"tests/data/acpi/q35/SRAT.acpihmat",
-"tests/data/acpi/q35/HPET",
-"tests/data/acpi/q35/SRAT.numamem",
-"tests/data/acpi/q35/DSDT.dimmpxm",
-"tests/data/acpi/q35/DSDT.acpihmat",
-"tests/data/acpi/q35/FACP",
-"tests/data/acpi/q35/DSDT.mmio64",
-"tests/data/acpi/q35/SRAT.cphp",
-"tests/data/acpi/q35/DSDT.numamem",
-"tests/data/acpi/q35/DSDT.bridge",
-"tests/data/acpi/q35/HMAT.acpihmat",
-"tests/data/acpi/q35/DSDT.cphp",
-"tests/data/acpi/q35/APIC.dimmpxm",
-"tests/data/acpi/q35/SRAT.memhp",
-"tests/data/acpi/q35/SLIT.cphp",
-"tests/data/acpi/q35/NFIT.dimmpxm",
-"tests/data/acpi/q35/APIC.cphp",
-"tests/data/acpi/q35/SSDT.dimmpxm",
-"tests/data/acpi/q35/SRAT.dimmpxm",
-"tests/data/acpi/q35/APIC.acpihmat",
-"tests/data/acpi/q35/MCFG",
-"tests/data/acpi/q35/DSDT.memhp",
-"tests/data/acpi/q35/SLIT.memhp",
-"tests/data/acpi/q35/WAET",
-"tests/data/acpi/q35/DSDT.ipmibt",
-"tests/data/acpi/q35/DSDT.tis",
-"tests/data/acpi/q35/SRAT.mmio64",
-"tests/data/acpi/q35/TPM2.tis",
-"tests/data/acpi/q35/DSDT",
-"tests/data/acpi/q35/APIC",
-
-"tests/data/acpi/microvm/APIC.pcie",
-"tests/data/acpi/microvm/DSDT.pcie",
-"tests/data/acpi/microvm/DSDT.usb",
-"tests/data/acpi/microvm/DSDT.rtc",
-"tests/data/acpi/microvm/FACP",
-"tests/data/acpi/microvm/APIC.ioapic2",
-"tests/data/acpi/microvm/DSDT.ioapic2",
-"tests/data/acpi/microvm/DSDT",
-"tests/data/acpi/microvm/APIC",
-- 
2.26.2


