Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F2E53667D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 19:17:52 +0200 (CEST)
Received: from localhost ([::1]:42138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudax-0001o9-9K
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 13:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1nudH3-0006PH-Tx
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:57:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1nudH0-00071H-Uh
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:57:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653670631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=p7zVZfoCFlNsM1dh5SAn5qzh6r7+8o7mtAE1WeGxU9Y=;
 b=J1DDvhjI88RQD03E2b8Jr9vHQWS1dwOcjPR5J2kKwY/x5/2k01Vn3TuZyXvKUW8s72c25/
 clRBUL/b5tOOl5bXETnUEiiV0M4UjO85HBEt+6gafRUSP4udXIJLsZm5KYhzLDCAmhmUFz
 eT8SXyiSS/vVuY8n9mG9k44JdQYHO4I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-wpzQhioCOQyHqYp-pkPpBg-1; Fri, 27 May 2022 12:57:08 -0400
X-MC-Unique: wpzQhioCOQyHqYp-pkPpBg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01F37185A79C;
 Fri, 27 May 2022 16:57:07 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.192.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF0212026D64;
 Fri, 27 May 2022 16:57:05 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Julia Suvorova <jusual@redhat.com>
Subject: [PATCH 0/5] hw/smbios: add core_count2 to smbios table type 4
Date: Fri, 27 May 2022 18:56:46 +0200
Message-Id: <20220527165651.28092-1-jusual@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The SMBIOS 3.0 specification provides the ability to reflect over
255 cores. The 64-bit entry point has been used for a while, but
structure type 4 has not been updated before, so the dmidecode output
looked like this (-smp 280):

    Handle 0x0400, DMI type 4, 42 bytes
    Processor Information
    ...
        Core Count: 24
        Core Enabled: 24
        Thread Count: 1
    ...

Big update in the bios-tables-test as it couldn't work with SMBIOS 3.0.

Julia Suvorova (5):
  hw/smbios: add core_count2 to smbios table type 4
  bios-tables-test: teach test to use smbios 3.0 tables
  tests/acpi: allow changes for core_count2 test
  bios-tables-test: add test for number of cores > 255
  tests/acpi: update tables for new core count test

 include/hw/firmware/smbios.h         |   3 +
 hw/smbios/smbios.c                   |  11 ++-
 tests/qtest/bios-tables-test.c       | 136 +++++++++++++++++++++------
 tests/data/acpi/q35/APIC.core-count2 | Bin 0 -> 2478 bytes
 tests/data/acpi/q35/DSDT.core-count2 | Bin 0 -> 32429 bytes
 tests/data/acpi/q35/FACP.core-count2 | Bin 0 -> 244 bytes
 6 files changed, 121 insertions(+), 29 deletions(-)
 create mode 100644 tests/data/acpi/q35/APIC.core-count2
 create mode 100644 tests/data/acpi/q35/DSDT.core-count2
 create mode 100644 tests/data/acpi/q35/FACP.core-count2

-- 
2.35.1


