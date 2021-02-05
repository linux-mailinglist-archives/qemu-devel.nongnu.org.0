Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7673B310D04
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:12:43 +0100 (CET)
Received: from localhost ([::1]:57474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82mo-0004IQ-GD
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:12:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82eY-0004MX-2e
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:04:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82eU-00033b-Tb
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:04:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612537446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SSM+mYEGXLsaone1ZdOs9Nhm6Xe5Ed6Gpm/kadhfMks=;
 b=Fs1byG9RPZKUBvlTCl7v9nkjN9+K4vLwdhH5BlEwZrwjnPO+k4jssSz/o7Go25R4k2lhNE
 R2cG5xjZ84haHokRCgEoIEHJ6vhkk8BGqf3NZ2ikNOcgpTMeFKT29Un4mV/ogsSAYtYerJ
 t8r9x00uAEA3/CqSvJi4/5T87bErCDw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-Pqt7n2k9MpauIZ0rdxMQFQ-1; Fri, 05 Feb 2021 10:04:04 -0500
X-MC-Unique: Pqt7n2k9MpauIZ0rdxMQFQ-1
Received: by mail-ej1-f71.google.com with SMTP id hx26so6840195ejc.3
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 07:04:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SSM+mYEGXLsaone1ZdOs9Nhm6Xe5Ed6Gpm/kadhfMks=;
 b=mfukq7BapPmJCitTEaQpBOg085fYwgcujTYDoho0SFrdvAQnHykJ78Ginizt/0oZLB
 N0kzX/eIuOkeUJ/crDQEIfhdep3IiuhXlFX17Q9qwyoHDQ5vVz/G8GVptgIgdZfBBq5m
 lM84X0AP2W5DcI1npT4KqzmdKwbQic9z5kyGIZD/DvTZ8+GE1l3HM9qjOcCbAvQdbLBV
 SfMLTC9jHARigvXaKSU3vopTzg8oB6kzjpiz0+DitK4b7pPv4aexxF+OUamEJp4v+IEl
 iQwl1BVqRFl7Kq49iWWyC+L3wbRC5+uK+/xlUTY8i8GO1rk5Hjp5W/sTgLsyX5m68bQE
 IGaw==
X-Gm-Message-State: AOAM531ExbVPeK5H+0rQuiCvd4FREUCJXhKqBD83Z/xPQDsYb2e+4vtw
 UlIy9AiqL+4blo7xlpZkSMLc5NzaHxh7xHt6GbtHaWXl2Eg8s9drJQypI5XQtdMNc514Fom6h59
 TbBITGfKTbAxvk6mdN6nwGGuEebNxEpCQYT4+Vc9pd1FBjoDKMrmsbKqqpaPf
X-Received: by 2002:aa7:d901:: with SMTP id a1mr3912666edr.120.1612537442917; 
 Fri, 05 Feb 2021 07:04:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy50q6rklfuPzhw/oz8kaQiXKwBXtADVmqPGEXwU7Ii/IUe3UW0EnfrLE5BRxLrL8+6F+twYg==
X-Received: by 2002:aa7:d901:: with SMTP id a1mr3912647edr.120.1612537442748; 
 Fri, 05 Feb 2021 07:04:02 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id dt17sm3981273ejb.70.2021.02.05.07.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 07:04:02 -0800 (PST)
Date: Fri, 5 Feb 2021 10:04:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 11/16] tests/acpi: allow updates for expected data files
Message-ID: <20210205150135.94643-12-mst@redhat.com>
References: <20210205150135.94643-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210205150135.94643-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marian Postevca <posteuca@mutex.one>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marian Postevca <posteuca@mutex.one>

Signed-off-by: Marian Postevca <posteuca@mutex.one>
Message-Id: <20210119003216.17637-2-posteuca@mutex.one>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 94 +++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..b20ae72949 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,95 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/APIC",
+"tests/data/acpi/virt/FACP",
+"tests/data/acpi/virt/GTDT",
+"tests/data/acpi/virt/MCFG",
+"tests/data/acpi/virt/SPCR",
+"tests/data/acpi/virt/DSDT",
+"tests/data/acpi/virt/APIC.numamem",
+"tests/data/acpi/virt/FACP.numamem",
+"tests/data/acpi/virt/GTDT.numamem",
+"tests/data/acpi/virt/MCFG.numamem",
+"tests/data/acpi/virt/SPCR.numamem",
+"tests/data/acpi/virt/DSDT.numamem",
+"tests/data/acpi/virt/SRAT.numamem",
+"tests/data/acpi/virt/DSDT.memhp",
+"tests/data/acpi/virt/NFIT.memhp",
+"tests/data/acpi/virt/SSDT.memhp",
+"tests/data/acpi/virt/SLIT.memhp",
+"tests/data/acpi/virt/SRAT.memhp",
+"tests/data/acpi/virt/SPCR.memhp",
+"tests/data/acpi/virt/MCFG.memhp",
+"tests/data/acpi/virt/GTDT.memhp",
+"tests/data/acpi/virt/APIC.memhp",
+"tests/data/acpi/virt/FACP.memhp",
+"tests/data/acpi/virt/DSDT.pxb",
+
+"tests/data/acpi/pc/SRAT.acpihmat",
+"tests/data/acpi/pc/HPET",
+"tests/data/acpi/pc/DSDT.hpbrroot",
+"tests/data/acpi/pc/SRAT.numamem",
+"tests/data/acpi/pc/DSDT.dimmpxm",
+"tests/data/acpi/pc/DSDT.acpihmat",
+"tests/data/acpi/pc/FACP",
+"tests/data/acpi/pc/SRAT.cphp",
+"tests/data/acpi/pc/DSDT.numamem",
+"tests/data/acpi/pc/DSDT.bridge",
+"tests/data/acpi/pc/HMAT.acpihmat",
+"tests/data/acpi/pc/DSDT.cphp",
+"tests/data/acpi/pc/APIC.dimmpxm",
+"tests/data/acpi/pc/SRAT.memhp",
+"tests/data/acpi/pc/SLIT.cphp",
+"tests/data/acpi/pc/DSDT.hpbridge",
+"tests/data/acpi/pc/NFIT.dimmpxm",
+"tests/data/acpi/pc/APIC.cphp",
+"tests/data/acpi/pc/SSDT.dimmpxm",
+"tests/data/acpi/pc/SRAT.dimmpxm",
+"tests/data/acpi/pc/APIC.acpihmat",
+"tests/data/acpi/pc/DSDT.memhp",
+"tests/data/acpi/pc/DSDT.ipmikcs",
+"tests/data/acpi/pc/SLIT.memhp",
+"tests/data/acpi/pc/WAET",
+"tests/data/acpi/pc/DSDT",
+"tests/data/acpi/pc/APIC",
+"tests/data/acpi/pc/DSDT.roothp",
+
+"tests/data/acpi/q35/SRAT.acpihmat",
+"tests/data/acpi/q35/HPET",
+"tests/data/acpi/q35/SRAT.numamem",
+"tests/data/acpi/q35/DSDT.dimmpxm",
+"tests/data/acpi/q35/DSDT.acpihmat",
+"tests/data/acpi/q35/FACP",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/SRAT.cphp",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/HMAT.acpihmat",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/APIC.dimmpxm",
+"tests/data/acpi/q35/SRAT.memhp",
+"tests/data/acpi/q35/SLIT.cphp",
+"tests/data/acpi/q35/NFIT.dimmpxm",
+"tests/data/acpi/q35/APIC.cphp",
+"tests/data/acpi/q35/SSDT.dimmpxm",
+"tests/data/acpi/q35/SRAT.dimmpxm",
+"tests/data/acpi/q35/APIC.acpihmat",
+"tests/data/acpi/q35/MCFG",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/SLIT.memhp",
+"tests/data/acpi/q35/WAET",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.tis",
+"tests/data/acpi/q35/SRAT.mmio64",
+"tests/data/acpi/q35/TPM2.tis",
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/q35/APIC",
+
+"tests/data/acpi/microvm/APIC.pcie",
+"tests/data/acpi/microvm/DSDT.pcie",
+"tests/data/acpi/microvm/DSDT.usb",
+"tests/data/acpi/microvm/DSDT.rtc",
+"tests/data/acpi/microvm/FACP",
+"tests/data/acpi/microvm/APIC.ioapic2",
+"tests/data/acpi/microvm/DSDT.ioapic2",
+"tests/data/acpi/microvm/DSDT",
+"tests/data/acpi/microvm/APIC",
-- 
MST


