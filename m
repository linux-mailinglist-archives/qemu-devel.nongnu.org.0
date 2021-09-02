Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D3B3FED80
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 14:08:55 +0200 (CEST)
Received: from localhost ([::1]:49968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLlWY-0006Y3-By
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 08:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLl0r-0000Ya-MC
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:36:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLl0p-00050d-LV
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:36:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630582567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rGhYkGaTbRnDnO/+Iu5k3IeDOskzfQSnn1VuABRxm9c=;
 b=Nj7qKJcqnRFJjBdNP8592ZQ0st75CuhNCBoVZFVd1qWYjr016Kb0d81QjEi5YkOJYTg3KE
 hoQxtPH6bgtZxzs9/Er13L62oQxlRq+q2ontYZjnaMx1CVr+Fuc2X4pph8nCnucfEELb3H
 Rn77fVMoYalH+dZRIsk96556r80499Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-qeF9KemIOle9ybyzCo0ODw-1; Thu, 02 Sep 2021 07:36:06 -0400
X-MC-Unique: qeF9KemIOle9ybyzCo0ODw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AC1D107ACC7
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 11:36:05 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3FD56ACE3;
 Thu,  2 Sep 2021 11:36:04 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/15] tests: acpi: update expected blobs
Date: Thu,  2 Sep 2021 07:35:47 -0400
Message-Id: <20210902113551.461632-12-imammedo@redhat.com>
In-Reply-To: <20210902113551.461632-1-imammedo@redhat.com>
References: <20210902113551.461632-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DSDT:
+            Device (S10)
+            {
+                Name (_ADR, 0x00020000)  // _ADR: Address
+            }

New IVRS table:

[000h 0000   4]                    Signature : "IVRS"    [I/O Virtualization Reporting Structure]
[004h 0004   4]                 Table Length : 00000068
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 43
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   4]          Virtualization Info : 00002800
[028h 0040   8]                     Reserved : 0000000000000000

[030h 0048   1]                Subtable Type : 10 [Hardware Definition Block]
[031h 0049   1]                        Flags : D1
[032h 0050   2]                       Length : 0038
[034h 0052   2]                     DeviceId : 0010

[036h 0054   2]            Capability Offset : 0040
[038h 0056   8]                 Base Address : 00000000FED80000
[040h 0064   2]            PCI Segment Group : 0000
[042h 0066   2]          Virtualization Info : 0000
[044h 0068   4]                     Reserved : 00000044

[048h 0072   1]                   Entry Type : 02
[049h 0073   2]                    Device ID : 0000
[04Bh 0075   1]                 Data Setting : 00

[04Ch 0076   1]                   Entry Type : 02
[04Dh 0077   2]                    Device ID : 0008
[04Fh 0079   1]                 Data Setting : 00

[050h 0080   1]                   Entry Type : 02
[051h 0081   2]                    Device ID : 0010
[053h 0083   1]                 Data Setting : 00

[054h 0084   1]                   Entry Type : 02
[055h 0085   2]                    Device ID : 00F8
[057h 0087   1]                 Data Setting : 00

[058h 0088   1]                   Entry Type : 02
[059h 0089   2]                    Device ID : 00FA
[05Bh 0091   1]                 Data Setting : 00

[05Ch 0092   1]                   Entry Type : 02
[05Dh 0093   2]                    Device ID : 00FB
[05Fh 0095   1]                 Data Setting : 00

[060h 0096   1]                   Entry Type : 48
[061h 0097   2]                    Device ID : 0000
[063h 0099   1]                 Data Setting : 00
[064h 0100   1]                       Handle : 00
[065h 0101   2]        Source Used Device ID : 00A0
[067h 0103   1]                      Variety : 01

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
  v2:
    - rebase on top of ACPI PCI hotplug changes
---
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 tests/data/acpi/q35/DSDT.ivrs               | Bin 0 -> 8306 bytes
 tests/data/acpi/q35/IVRS.ivrs               | Bin 0 -> 104 bytes
 3 files changed, 2 deletions(-)
 create mode 100644 tests/data/acpi/q35/DSDT.ivrs

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 3a51c50d8f..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT",
-"tests/data/acpi/q35/IVRS.ivrs",
diff --git a/tests/data/acpi/q35/DSDT.ivrs b/tests/data/acpi/q35/DSDT.ivrs
new file mode 100644
index 0000000000000000000000000000000000000000..950c286b4c751f3c116a11d8892779942375e16b
GIT binary patch
literal 8306
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
Om<Viw6=vv}VgCoUJHKiG

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/IVRS.ivrs b/tests/data/acpi/q35/IVRS.ivrs
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..17611202e53a32f7da8e4925d6955b384670b8b1 100644
GIT binary patch
literal 104
zcmeYa3kuF)U|?W$cJg=j2v%^42yj*a0!E-1hz+6{G(ZFd2wb#a5MXcsa&G*C3Ng3<
b8B8F|0mK48`~!%80r77J1`m*;1q_S;Any(V

literal 0
HcmV?d00001

-- 
2.27.0


