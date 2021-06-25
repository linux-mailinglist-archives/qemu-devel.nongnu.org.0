Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D893B4075
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:25:56 +0200 (CEST)
Received: from localhost ([::1]:60906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwi5z-0007dc-S1
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhyw-0001R7-EO
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:18:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhyu-0006VV-BA
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:18:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624612715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FHmgcv/XFBo2G0IZGjaWZIRglQSyLlHWOF9XnqtUN3o=;
 b=ROHFd8tKhANEY8MAiVVFPhI9teTIFMSwYZn9kJFCIv5PYx2Yo1LyyMk+YfCQr/JPsdtaEa
 +ejUp7i6qv0feYhMU628Z7NY10cX9dESrTUuZy09dz4HrvJ+7hjG46zSLIngYAsQnZEjfm
 Ao8DxYFchXCxaRtbHB3IZ5LmG2IHnGU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-hQIk7XsMM6iU6X6NjguxtA-1; Fri, 25 Jun 2021 05:18:34 -0400
X-MC-Unique: hQIk7XsMM6iU6X6NjguxtA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B9E1CC622
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 09:18:33 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4E3860C05;
 Fri, 25 Jun 2021 09:18:32 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/53] tests: acpi: add expected blob for DMAR table
Date: Fri, 25 Jun 2021 05:17:32 -0400
Message-Id: <20210625091818.1047980-9-imammedo@redhat.com>
In-Reply-To: <20210625091818.1047980-1-imammedo@redhat.com>
References: <20210625091818.1047980-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

    [000h 0000   4]                    Signature : "DMAR"    [DMA Remapping table]
    [004h 0004   4]                 Table Length : 00000050
    [008h 0008   1]                     Revision : 01
    [009h 0009   1]                     Checksum : F4
    [00Ah 0010   6]                       Oem ID : "BOCHS "
    [010h 0016   8]                 Oem Table ID : "BXPC    "
    [018h 0024   4]                 Oem Revision : 00000001
    [01Ch 0028   4]              Asl Compiler ID : "BXPC"
    [020h 0032   4]        Asl Compiler Revision : 00000001

    [024h 0036   1]           Host Address Width : 26
    [025h 0037   1]                        Flags : 01
    [026h 0038  10]                     Reserved : 00 00 00 00 00 00 00 00 00 00

    [030h 0048   2]                Subtable Type : 0000 [Hardware Unit Definition]
    [032h 0050   2]                       Length : 0018

    [034h 0052   1]                        Flags : 01
    [035h 0053   1]                     Reserved : 00
    [036h 0054   2]           PCI Segment Number : 0000
    [038h 0056   8]        Register Base Address : 00000000FED90000

    [040h 0064   1]            Device Scope Type : 03 [IOAPIC Device]
    [041h 0065   1]                 Entry Length : 08
    [042h 0066   2]                     Reserved : 0000
    [044h 0068   1]               Enumeration ID : 00
    [045h 0069   1]               PCI Bus Number : FF

    [046h 0070   2]                     PCI Path : 00,00

    [048h 0072   2]                Subtable Type : 0002 [Root Port ATS Capability]
    [04Ah 0074   2]                       Length : 0008

    [04Ch 0076   1]                        Flags : 01
    [04Dh 0077   1]                     Reserved : 00
    [04Eh 0078   2]           PCI Segment Number : 0000

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/q35/DMAR.dmar               | Bin 0 -> 80 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index a2843335c8..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DMAR.dmar",
diff --git a/tests/data/acpi/q35/DMAR.dmar b/tests/data/acpi/q35/DMAR.dmar
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..f74d25917b3ebe2914ac938e73768b83eeaa0802 100644
GIT binary patch
literal 80
zcmZ?qbqoq%U|?YU;^gn_5v<@85#X!<1dKp25F13Rfe1K|V1RIM{sRdya{!6|3=B*R
H9AI$({*?*=

literal 0
HcmV?d00001

-- 
2.27.0


