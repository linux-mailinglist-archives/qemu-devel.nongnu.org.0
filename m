Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC75E130821
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jan 2020 14:09:01 +0100 (CET)
Received: from localhost ([::1]:41952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1io5eO-0005Ew-Bu
	for lists+qemu-devel@lfdr.de; Sun, 05 Jan 2020 08:09:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58342)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1io5Uk-0002YW-Nb
 for qemu-devel@nongnu.org; Sun, 05 Jan 2020 07:59:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1io5Uj-0004hf-22
 for qemu-devel@nongnu.org; Sun, 05 Jan 2020 07:59:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26592
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1io5Ui-0004gJ-TN
 for qemu-devel@nongnu.org; Sun, 05 Jan 2020 07:59:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578229140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZtYURyag3DLg8nTLoi8QUVY5fdiTw/VqNJshcmNYPY8=;
 b=fAZlgszUjmCAJ9bHzD1k3GXgSWibWu0rtsNItHfGf+aCShI8fYnRDevWsQQXoJ7mZBzeoY
 Wp591MhfML4KYsWaWp/lRAphAsWUz9yRtDQ/53a0KCKimDqf2YzzlWNwZO5aQfFmyXZCyH
 lAbFCncg/gC1hGTkR8W9Vpv8rLSZo2A=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-hexgHBpRM3aMUq8li1tFUw-1; Sun, 05 Jan 2020 07:58:58 -0500
Received: by mail-qt1-f198.google.com with SMTP id d18so15702781qtp.16
 for <qemu-devel@nongnu.org>; Sun, 05 Jan 2020 04:58:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SruOAG0qaxCXWnEXh2DvWIZr1jCGMkEnWfc8/NLsCZo=;
 b=QZ0oW3CVvrexYLMec47o0ORI8pTkmpHl72y2lO2UE992EDuvSeok1UvGSzvhxX+Wme
 iXgxzmJh1p4b2fSj2qMrii/jp1L11XLxGkcsAuO0IzXmQpscl/U+YXDrCDe9a6BaiyqG
 z50AKkThlcqu166W1VM5GGen91vNH7+PyiW3wBfbfVj9FBS/bJGfMyaYrTFDxQP5ccxM
 a8Xxo5ovuIY28qRXl+yGe7VnNjMACBo4k4YCbx0qjj/ZeWzqyBMLdaKubT5wbF/1rnKP
 Ig0Yoqy9qOxh4bGOpUq+nYHkLb6RdBKijcLE57eNXpdQi7GKDKv/s8j2cpMi/Kup6nlp
 Xr3Q==
X-Gm-Message-State: APjAAAXbAnq+aflMGpbQt9ztxXAoV1NqyPJoAByLL4H/ZH2PSc+4SvMj
 jK8sxmngDZIV3ga139SNHDL1mNBoukwHwnnMi8BZ90XWjTN8LoDuysdSWwLtQ7r/S6gRkxCn2VO
 gJto9uAFT3ruS7S0=
X-Received: by 2002:ae9:e907:: with SMTP id x7mr79907341qkf.298.1578229137969; 
 Sun, 05 Jan 2020 04:58:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqwRKf0tmKYgAh3pkMnPtcG9U9GE+VIQmioCw6YOqtZ23/pBLNU7WWkITfJzlweXRCJbhXQcZg==
X-Received: by 2002:ae9:e907:: with SMTP id x7mr79907322qkf.298.1578229137639; 
 Sun, 05 Jan 2020 04:58:57 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id i90sm21633223qtd.49.2020.01.05.04.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2020 04:58:56 -0800 (PST)
Date: Sun, 5 Jan 2020 07:58:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 18/32] tests/bios-tables-test: add test cases for ACPI HMAT
Message-ID: <20200105125622.27231-19-mst@redhat.com>
References: <20200105125622.27231-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200105125622.27231-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-MC-Unique: hexgHBpRM3aMUq8li1tFUw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Jingqi Liu <Jingqi.liu@intel.com>, Tao Xu <tao3.xu@intel.com>,
 Markus Armbruster <armbru@redhat.com>, Daniel Black <daniel@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tao Xu <tao3.xu@intel.com>

ACPI table HMAT has been introduced, QEMU now builds HMAT tables for
Heterogeneous Memory with boot option '-numa node'.

Add test cases on PC and Q35 machines with 2 numa nodes.
Because HMAT is generated when system enable numa, the
following tables need to be added for this test:
    tests/data/acpi/pc/APIC.acpihmat
    tests/data/acpi/pc/SRAT.acpihmat
    tests/data/acpi/pc/HMAT.acpihmat
    tests/data/acpi/pc/DSDT.acpihmat
    tests/data/acpi/q35/APIC.acpihmat
    tests/data/acpi/q35/SRAT.acpihmat
    tests/data/acpi/q35/HMAT.acpihmat
    tests/data/acpi/q35/DSDT.acpihmat

Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Daniel Black <daniel@linux.ibm.com>
Reviewed-by: Jingqi Liu <Jingqi.liu@intel.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Tao Xu <tao3.xu@intel.com>
Message-Id: <20191213011929.2520-9-tao3.xu@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/bios-tables-test-allowed-diff.h |  8 +++++
 tests/bios-tables-test.c              | 44 +++++++++++++++++++++++++++
 tests/data/acpi/pc/APIC.acpihmat      |  0
 tests/data/acpi/pc/DSDT.acpihmat      |  0
 tests/data/acpi/pc/HMAT.acpihmat      |  0
 tests/data/acpi/pc/SRAT.acpihmat      |  0
 tests/data/acpi/q35/APIC.acpihmat     |  0
 tests/data/acpi/q35/DSDT.acpihmat     |  0
 tests/data/acpi/q35/HMAT.acpihmat     |  0
 tests/data/acpi/q35/SRAT.acpihmat     |  0
 10 files changed, 52 insertions(+)
 create mode 100644 tests/data/acpi/pc/APIC.acpihmat
 create mode 100644 tests/data/acpi/pc/DSDT.acpihmat
 create mode 100644 tests/data/acpi/pc/HMAT.acpihmat
 create mode 100644 tests/data/acpi/pc/SRAT.acpihmat
 create mode 100644 tests/data/acpi/q35/APIC.acpihmat
 create mode 100644 tests/data/acpi/q35/DSDT.acpihmat
 create mode 100644 tests/data/acpi/q35/HMAT.acpihmat
 create mode 100644 tests/data/acpi/q35/SRAT.acpihmat

diff --git a/tests/bios-tables-test-allowed-diff.h b/tests/bios-tables-test=
-allowed-diff.h
index dfb8523c8b..3c9e0c979b 100644
--- a/tests/bios-tables-test-allowed-diff.h
+++ b/tests/bios-tables-test-allowed-diff.h
@@ -1 +1,9 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/APIC.acpihmat",
+"tests/data/acpi/pc/SRAT.acpihmat",
+"tests/data/acpi/pc/HMAT.acpihmat",
+"tests/data/acpi/pc/DSDT.acpihmat",
+"tests/data/acpi/q35/APIC.acpihmat",
+"tests/data/acpi/q35/SRAT.acpihmat",
+"tests/data/acpi/q35/HMAT.acpihmat",
+"tests/data/acpi/q35/DSDT.acpihmat",
diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index bc0ad594a1..f1ac2d7e96 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -947,6 +947,48 @@ static void test_acpi_virt_tcg_numamem(void)
=20
 }
=20
+static void test_acpi_tcg_acpi_hmat(const char *machine)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine =3D machine;
+    data.variant =3D ".acpihmat";
+    test_acpi_one(" -machine hmat=3Don"
+                  " -smp 2,sockets=3D2"
+                  " -m 128M,slots=3D2,maxmem=3D1G"
+                  " -object memory-backend-ram,size=3D64M,id=3Dm0"
+                  " -object memory-backend-ram,size=3D64M,id=3Dm1"
+                  " -numa node,nodeid=3D0,memdev=3Dm0"
+                  " -numa node,nodeid=3D1,memdev=3Dm1,initiator=3D0"
+                  " -numa cpu,node-id=3D0,socket-id=3D0"
+                  " -numa cpu,node-id=3D0,socket-id=3D1"
+                  " -numa hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmem=
ory,"
+                  "data-type=3Daccess-latency,latency=3D1"
+                  " -numa hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmem=
ory,"
+                  "data-type=3Daccess-bandwidth,bandwidth=3D65534M"
+                  " -numa hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmem=
ory,"
+                  "data-type=3Daccess-latency,latency=3D65534"
+                  " -numa hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmem=
ory,"
+                  "data-type=3Daccess-bandwidth,bandwidth=3D32767M"
+                  " -numa hmat-cache,node-id=3D0,size=3D10K,level=3D1,"
+                  "associativity=3Ddirect,policy=3Dwrite-back,line=3D8"
+                  " -numa hmat-cache,node-id=3D1,size=3D10K,level=3D1,"
+                  "associativity=3Ddirect,policy=3Dwrite-back,line=3D8",
+                  &data);
+    free_test_data(&data);
+}
+
+static void test_acpi_q35_tcg_acpi_hmat(void)
+{
+    test_acpi_tcg_acpi_hmat(MACHINE_Q35);
+}
+
+static void test_acpi_piix4_tcg_acpi_hmat(void)
+{
+    test_acpi_tcg_acpi_hmat(MACHINE_PC);
+}
+
 static void test_acpi_virt_tcg(void)
 {
     test_data data =3D {
@@ -991,6 +1033,8 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
         qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm)=
;
         qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
+        qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hma=
t);
+        qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
     } else if (strcmp(arch, "aarch64") =3D=3D 0) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
diff --git a/tests/data/acpi/pc/APIC.acpihmat b/tests/data/acpi/pc/APIC.acp=
ihmat
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/pc/DSDT.acpihmat b/tests/data/acpi/pc/DSDT.acp=
ihmat
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/pc/HMAT.acpihmat b/tests/data/acpi/pc/HMAT.acp=
ihmat
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/pc/SRAT.acpihmat b/tests/data/acpi/pc/SRAT.acp=
ihmat
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/APIC.acpihmat b/tests/data/acpi/q35/APIC.a=
cpihmat
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.a=
cpihmat
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/HMAT.acpihmat b/tests/data/acpi/q35/HMAT.a=
cpihmat
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/SRAT.acpihmat b/tests/data/acpi/q35/SRAT.a=
cpihmat
new file mode 100644
index 0000000000..e69de29bb2
--=20
MST


