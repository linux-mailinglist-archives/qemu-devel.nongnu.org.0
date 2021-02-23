Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 784B4322E85
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:15:07 +0100 (CET)
Received: from localhost ([::1]:54576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEaL4-0000pN-DH
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:15:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaD0-0007Wp-HQ
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:06:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaCy-0004vw-Jw
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:06:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614096403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=07i4A4LgHGvFyYVn0cL1PlwUR1Iqv8XV1F3PqdDQFLI=;
 b=OK8X/z3clajW/IrnRBTBHDO7om0DCU0OmXv3a4tLoyDL5JF/8BP9qqYu3GE2U8JYgNW+UU
 Eo2ZlrgW7tURuoceORxktc6+/h/hWL6OoA2NP9O3djsyExn/1bw7xzcEAHh1AFrmHy9YsQ
 lAQ/PHzqimZpYnkTxoWbQt4Rul4g+uk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-kXrUsuntPv6s1E11jEuwKw-1; Tue, 23 Feb 2021 11:04:05 -0500
X-MC-Unique: kXrUsuntPv6s1E11jEuwKw-1
Received: by mail-wr1-f70.google.com with SMTP id d7so7489044wri.23
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 08:04:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=07i4A4LgHGvFyYVn0cL1PlwUR1Iqv8XV1F3PqdDQFLI=;
 b=Lje3si3CqlA1gU7ApRkajJBx1kpMqnwMjovyvxo4Qav+kjhR+5LEwdLRgEGAZziHlu
 TKC3HQlG2VMbJZngZJtryBBw1Y+SIBZf4SC5AjZoyPEXNv7qlLa9NvyA9gFbUIiXykj9
 BGL08yf2GJMNlxB2AThQwaZcln2mfg8ipED7KUqgNAuQgsKAK7/DeRMJvMXBD6Ebs19f
 YwsgTq7Sl7N0cqstmafqvnDUXEUvjZbI/jeWFCtQPI6BUq13ow083ZcOSjY/YhYXld42
 2rBPWjW5Zded9jbahZovaotQuKzKqwuUR9NN+P6hj1SS2a0uzeRbxWbM2rWb06ZbrcVA
 xDug==
X-Gm-Message-State: AOAM533rwCWt+videEKFuZzL4JUHpVs5k4VKMWLqsGL1CIJ5eaSkVUzg
 OxsVBQLZcNXp86g+71B7uDdeRLAp+17tXRXQvncKU/ZkA10gEBIRPvDuUVM01sAl3A8rXQB7Gbc
 2xa9OrqfPo2zo6ZrWVNFs6mAPiZKXn+y6bjLUxcA6m+jAhy0g2yDUtWY76Wc/
X-Received: by 2002:a1c:a98c:: with SMTP id
 s134mr23980439wme.174.1614096244348; 
 Tue, 23 Feb 2021 08:04:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkzOIGhqxOaHFTfw1LqMGxEnsF9n2UysuxPkpSwj4po5Xm2sXO1S+4rzBH6CFDO2jQba48LQ==
X-Received: by 2002:a1c:a98c:: with SMTP id
 s134mr23980407wme.174.1614096244139; 
 Tue, 23 Feb 2021 08:04:04 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id f8sm3107714wml.20.2021.02.23.08.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 08:04:03 -0800 (PST)
Date: Tue, 23 Feb 2021 11:04:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/17] qtest: update tests/qtest/bios-tables-test-allowed-diff.h
Message-ID: <20210223160144.1507082-10-mst@redhat.com>
References: <20210223160144.1507082-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210223160144.1507082-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

The following tests will modify acpi tables.
prepare qtests to allow acpi table change.
add new tables for new tests.
- tests/data/acpi/pc/DSDT.nohpet
- tests/data/acpi/pc/FACP.nosmm
- tests/data/acpi/q35/DSDT.nohpet
- tests/data/acpi/q35/FACP.nosmm

Acked-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Message-Id: <c8285f54deab362ed839d31f0fb5bb590ab71fdd.1613615732.git.isaku.yamahata@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 14 ++++++++++++++
 tests/data/acpi/pc/DSDT.nohpet              |  0
 tests/data/acpi/pc/FACP.nosmm               |  0
 tests/data/acpi/q35/DSDT.nohpet             |  0
 tests/data/acpi/q35/FACP.nosmm              |  0
 5 files changed, 14 insertions(+)
 create mode 100644 tests/data/acpi/pc/DSDT.nohpet
 create mode 100644 tests/data/acpi/pc/FACP.nosmm
 create mode 100644 tests/data/acpi/q35/DSDT.nohpet
 create mode 100644 tests/data/acpi/q35/FACP.nosmm

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..95592459c5 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,15 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/FACP.nosmm",
+"tests/data/acpi/pc/DSDT.nohpet",
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/q35/DSDT.tis",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/FACP.nosmm",
+"tests/data/acpi/q35/DSDT.nohpet",
+"tests/data/acpi/q35/DSDT.dimmpxm",
+"tests/data/acpi/q35/DSDT.acpihmat",
diff --git a/tests/data/acpi/pc/DSDT.nohpet b/tests/data/acpi/pc/DSDT.nohpet
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/pc/FACP.nosmm b/tests/data/acpi/pc/FACP.nosmm
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/DSDT.nohpet b/tests/data/acpi/q35/DSDT.nohpet
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/FACP.nosmm b/tests/data/acpi/q35/FACP.nosmm
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST


