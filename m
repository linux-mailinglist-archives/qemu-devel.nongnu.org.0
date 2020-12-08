Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CCC2D340A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:42:48 +0100 (CET)
Received: from localhost ([::1]:54242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjot-00089X-7L
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:42:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kminm-0007uh-QX
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmink-0005vK-11
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DbpWHn7kujA8od1bySqWm905L7EHYrNPshpti/pX4Go=;
 b=AJwqldjUc3cMF9ofLLbXsvLEmsO3EqqiRd1FDSFxB7OlZMGgi14LdvvbaicsJMwc0Ua7ty
 KfhrwwZ4r6HA/Fn/0aCNa87oywAvBsr+X5YS9uxKwFSiY7Bq2yoRt6mtPtWqHNqshuW8OL
 VzUUzecR7zIqmUfIL4tPEPTKQfnbaK4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-A1_cs9-hMNumqvchmgvcKg-1; Tue, 08 Dec 2020 14:37:23 -0500
X-MC-Unique: A1_cs9-hMNumqvchmgvcKg-1
Received: by mail-wr1-f69.google.com with SMTP id y5so2619371wrs.15
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:37:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DbpWHn7kujA8od1bySqWm905L7EHYrNPshpti/pX4Go=;
 b=SPbWDyiEVUXv7faZ5RZvhcE/PZV1KBvrsK1yehBKIAbe3z/RiPZTkGkaVx0IorjZY2
 t/8PbUfVfGwbBj9CF6yANqQHN0Hv9wBWl7rOTOz7Y/5M3XRRpA3sSBf4AlFGdaUp47eo
 R4ry2v41y/cu6Q8OMSJyG8sKBcv+ReuM9RHrvC2NzV/TAefiTyEPVvq22cVfmrkhhDWd
 Heb1oR/zz7lL3CmIoCEeREkM6tB5a5yd4lpjF7iU1NrMvKc3uQ7Mf1A7mKysC0J9/U0I
 QEv5CKPzL41+bZyzz99V90ODfv/8spvuoX0EANWhL6ZPX3zrGJ8C9EFl5UcI+ybCV0xn
 F5cw==
X-Gm-Message-State: AOAM531j21WwebK1H2vhm36rZK5HoIbkRwT+ilOJeBFJ4VDZOECa0h8u
 z5cX8jRgZFIP15UiR5urysBbvQlIz+gzUgpwZVfXEsYvMemqIJS9LBn3VKXVMUBdueoqZtn3Uex
 v+aU1fmn2m1LWK1bqUBStj+H/MHHaRHsI3FoWDJk+tYVcatxlehe6WCdsN7g4
X-Received: by 2002:a5d:5105:: with SMTP id s5mr9751204wrt.136.1607456241619; 
 Tue, 08 Dec 2020 11:37:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYSt74A8PJgjSPjTvtQ0uqCCnQempJxlJc99okz9810oyoSBKbo7qjVx/SPAavzA4zuWvnEA==
X-Received: by 2002:a5d:5105:: with SMTP id s5mr9751192wrt.136.1607456241468; 
 Tue, 08 Dec 2020 11:37:21 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id k7sm9311751wrn.63.2020.12.08.11.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:37:20 -0800 (PST)
Date: Tue, 8 Dec 2020 14:37:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 59/66] tests/acpi: allow expected files change
Message-ID: <20201208193307.646726-60-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Change that will be introduced by following patch:

@@ -557,6 +557,7 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPCDSDT", 0x00000001)
                 CINS,   1,
                 CRMV,   1,
                 CEJ0,   1,
+                CEJF,   1,
                 Offset (0x05),
                 CCMD,   8
             }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20201207140739.3829993-5-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..cc75f3fc46 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,22 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT",
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/q35/DSDT.tis",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/DSDT.dimmpxm",
+"tests/data/acpi/q35/DSDT.acpihmat",
+"tests/data/acpi/pc/DSDT.bridge",
+"tests/data/acpi/pc/DSDT.ipmikcs",
+"tests/data/acpi/pc/DSDT.cphp",
+"tests/data/acpi/pc/DSDT.memhp",
+"tests/data/acpi/pc/DSDT.numamem",
+"tests/data/acpi/pc/DSDT.dimmpxm",
+"tests/data/acpi/pc/DSDT.acpihmat",
+"tests/data/acpi/pc/DSDT.roothp",
+"tests/data/acpi/pc/DSDT.hpbridge",
+"tests/data/acpi/pc/DSDT.hpbrroot",
-- 
MST


