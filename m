Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6173948C617
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:29:55 +0100 (CET)
Received: from localhost ([::1]:49576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7edO-0006jJ-G9
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:29:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n7dI3-0008Gd-7j
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:03:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n7dI1-0001OU-6q
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:03:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641992624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eb7O60CuaeZ43O7a1viSTcqQDKEuCEf4pSgt399lK3Y=;
 b=DE6VNtpH5rAfnyt4ab8KirMAMx5p0VqfnrBJfxo1QHrFl7Y4mvdY5CQ3HEj6MTMtHS0y2e
 +XnrPTkRFL209MKRoBNhLQEFpv2Vz40jS+GSTwNiw6a1L64PFgCTmCWxuD3XP7Ihn+J6S6
 Na+HObo3Uez4LaXo7IrqdGLmfj+ZhBc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-A6X-ojG6MC61v_RtCIHRlA-1; Wed, 12 Jan 2022 08:03:41 -0500
X-MC-Unique: A6X-ojG6MC61v_RtCIHRlA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AD64190B2A2;
 Wed, 12 Jan 2022 13:03:40 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F0A67B6F8;
 Wed, 12 Jan 2022 13:03:39 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] tests: acpi: update expected blobs
Date: Wed, 12 Jan 2022 08:03:32 -0500
Message-Id: <20220112130332.1648664-5-imammedo@redhat.com>
In-Reply-To: <20220112130332.1648664-1-imammedo@redhat.com>
References: <20220112130332.1648664-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Marian Postevca <posteuca@mutex.one>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Expected changes caused by previous commit:

nvdimm ssdt (q35/pc/virt):
  - *     OEM Table ID     "NVDIMM  "
  + *     OEM Table ID     "NVDIMM"

SLIC test FADT (tests/data/acpi/q35/FACP.slic):
  -[010h 0016   8]                 Oem Table ID : "ME      "
  +[010h 0016   8]                 Oem Table ID : "ME"

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
 tests/data/acpi/pc/SSDT.dimmpxm             | Bin 734 -> 734 bytes
 tests/data/acpi/q35/FACP.slic               | Bin 244 -> 244 bytes
 tests/data/acpi/q35/SSDT.dimmpxm            | Bin 734 -> 734 bytes
 tests/data/acpi/virt/SSDT.memhp             | Bin 736 -> 736 bytes
 5 files changed, 4 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 7faa8f53be..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/SSDT.memhp",
-"tests/data/acpi/pc/SSDT.dimmpxm",
-"tests/data/acpi/q35/SSDT.dimmpxm",
-"tests/data/acpi/q35/FACP.slic",
diff --git a/tests/data/acpi/pc/SSDT.dimmpxm b/tests/data/acpi/pc/SSDT.dimmpxm
index a50a961fa1d9b0dd8ea4096d652c83bcf04db20b..ac55387d57e48adb99eb738a102308688a262fb8 100644
GIT binary patch
delta 33
ocmcb|dXH5iIM^lR9uortW0;e_vq!LkUzm%huP+0`Mu}rg0HzrUKL7v#

delta 33
ocmcb|dXH5iIM^lR9uortqnMMwvq!LkUzm%hudjl_Mu}rg0HV1GKL7v#

diff --git a/tests/data/acpi/q35/FACP.slic b/tests/data/acpi/q35/FACP.slic
index 891fd4b784b7b6b3ea303976db7ecd5b669bc84b..15986e095cf2db7ee92f7ce113c1d46d54018c62 100644
GIT binary patch
delta 32
lcmeyu_=Qoz&CxmF3j+fK^CjmX$6yZyUsoUp2qsG00RW!Z2#x>%

delta 32
kcmeyu_=Qoz&CxmF3j+fKvygL;W3Y#Uud4zWOq93-0G2oijsO4v

diff --git a/tests/data/acpi/q35/SSDT.dimmpxm b/tests/data/acpi/q35/SSDT.dimmpxm
index 617a1c911c7d6753bcedc8ecc52e3027a5259ad6..98e6f0e3f3bb02dd419e36bdd1db9b94c728c406 100644
GIT binary patch
delta 33
ocmcb|dXH5iIM^lR9uortqnnezvq!LkUzm%huP+0`Mu}rg0Ho;&F8}}l

delta 33
ocmcb|dXH5iIM^lR9uortBb$@Ivq!LkUzm%hudjl_Mu}rg0HKKqF8}}l

diff --git a/tests/data/acpi/virt/SSDT.memhp b/tests/data/acpi/virt/SSDT.memhp
index e8b850ae2239d8f496b12de672c2a1268e2f269d..375d7b6fc85a484f492a26ccd355c205f2c34473 100644
GIT binary patch
delta 33
ocmaFB`hZm;IM^lR0TTlQqrH>Avq!LkUzm%huP+0`Mu`(l0HqiSFaQ7m

delta 33
ocmaFB`hZm;IM^lR0TTlQ<9{cAXOCb7zc3e1Uta}<jS?rA0JOLYFaQ7m

-- 
2.31.1


