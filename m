Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D7756136F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 09:42:55 +0200 (CEST)
Received: from localhost ([::1]:50404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6opC-0008QY-8B
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 03:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o6on8-00067K-UU
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 03:40:47 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:42394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o6on4-00017P-K8
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 03:40:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to;
 bh=LIouQHuFAtN0AF/IT8vgAnoVxzxbRBcvcSpMJp9p9M8=;
 b=qvQKHiBDEQOxqGHD7XDDXFOJob5YKVzwLe4LVMAzS9oCVEaQvug5MKF3
 u+yVe4y+NyENeZYI4eYAVjqJh+R+JOSRjU4qb2+n+j8JmqpfXc5q2XCA8
 5wpsVRF+xmmVRy1IdKrNfhdL7TsBUt9tF/utNDlqYXmCrlZIeaNt5gPoe g=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Brice.Goglin@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.92,233,1650924000"; d="scan'208";a="18149006"
Received: from clt-128-93-179-171.vpn.inria.fr (HELO [128.93.179.171])
 ([128.93.179.171]) by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 09:40:40 +0200
Subject: [PATCH v4 2/4] tests: acpi: add and whitelist *.hmat-noinitiator
 expected blobs
From: Brice Goglin <Brice.Goglin@inria.fr>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Liu Jingqi <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr>
Message-ID: <fcdba7cd-3b64-4ba6-ab06-7b53efe2f574@inria.fr>
Date: Thu, 30 Jun 2022 09:40:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xWGmdpENNXHUFmIuBAMmIO5Ucsxs5XoiH"
Received-SPF: pass client-ip=192.134.164.104;
 envelope-from=Brice.Goglin@inria.fr; helo=mail3-relais-sop.national.inria.fr
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xWGmdpENNXHUFmIuBAMmIO5Ucsxs5XoiH
Content-Type: multipart/mixed; boundary="creeEshIcG9Gk2e23RGOtw7Vy3WZdojId";
 protected-headers="v1"
From: Brice Goglin <Brice.Goglin@inria.fr>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Liu Jingqi <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Message-ID: <fcdba7cd-3b64-4ba6-ab06-7b53efe2f574@inria.fr>
Subject: [PATCH v4 2/4] tests: acpi: add and whitelist *.hmat-noinitiator
 expected blobs
References: <ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr>
In-Reply-To: <ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr>

--creeEshIcG9Gk2e23RGOtw7Vy3WZdojId
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

=2E. which will be used by follow up hmat-noinitiator test-case.

Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
  tests/data/acpi/q35/APIC.acpihmat-noinitiator | 0
  tests/data/acpi/q35/DSDT.acpihmat-noinitiator | 0
  tests/data/acpi/q35/FACP.acpihmat-noinitiator | 0
  tests/data/acpi/q35/HMAT.acpihmat-noinitiator | 0
  tests/data/acpi/q35/SRAT.acpihmat-noinitiator | 0
  tests/qtest/bios-tables-test-allowed-diff.h   | 5 +++++
  6 files changed, 5 insertions(+)
  create mode 100644 tests/data/acpi/q35/APIC.acpihmat-noinitiator
  create mode 100644 tests/data/acpi/q35/DSDT.acpihmat-noinitiator
  create mode 100644 tests/data/acpi/q35/FACP.acpihmat-noinitiator
  create mode 100644 tests/data/acpi/q35/HMAT.acpihmat-noinitiator
  create mode 100644 tests/data/acpi/q35/SRAT.acpihmat-noinitiator

diff --git a/tests/data/acpi/q35/APIC.acpihmat-noinitiator b/tests/data/a=
cpi/q35/APIC.acpihmat-noinitiator
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/DSDT.acpihmat-noinitiator b/tests/data/a=
cpi/q35/DSDT.acpihmat-noinitiator
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/FACP.acpihmat-noinitiator b/tests/data/a=
cpi/q35/FACP.acpihmat-noinitiator
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/HMAT.acpihmat-noinitiator b/tests/data/a=
cpi/q35/HMAT.acpihmat-noinitiator
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/SRAT.acpihmat-noinitiator b/tests/data/a=
cpi/q35/SRAT.acpihmat-noinitiator
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bi=
os-tables-test-allowed-diff.h
index dfb8523c8b..ae025e3a3e 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,6 @@
  /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/APIC.acpihmat-noinitiator",
+"tests/data/acpi/q35/DSDT.acpihmat-noinitiator",
+"tests/data/acpi/q35/FACP.acpihmat-noinitiator",
+"tests/data/acpi/q35/HMAT.acpihmat-noinitiator",
+"tests/data/acpi/q35/SRAT.acpihmat-noinitiator",
--=20
2.30.2




--creeEshIcG9Gk2e23RGOtw7Vy3WZdojId--

--xWGmdpENNXHUFmIuBAMmIO5Ucsxs5XoiH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEelpOgOQAl7r26tY4RJGQ8yNavTsFAmK9U3cFAwAAAAAACgkQRJGQ8yNavTs5
mg//dJBCeZ8Ie06vE6iwN1ezDUTZnWGRFNwhOeJg7Ir8JDYnA4Liq/HWuT1kOwA+f6xBISlvt9mr
/JwSL8u6DoD5iOLU2cI27ZF5fD86Hc8w8TtIcgNHLJPa593z7w77Mxw8g9nseZCskbd6tRhXPHPw
JAezGgX1d+ie0WPh/LFDQynSnb+ZFeXxesaMUfDsrKR5SA3Gf13yiwUXYOs8vGVJTvn8AmnK1N2I
h+ZOnsriUSj7HNIl0TlUdKHfT8qRDz5IdWhkMVeQA875aEBk2/7zxI0nvGXSwXESIij7+wAMEb+w
vjAuMnIp3i12EniLsAlddLWaSa/CuV/uYzu0Qur2vHSqD59h30FePlS+iH1i3G8Odjk48BxM4smJ
X/s3gVC21UIgh++6ACU3rAVikT25Cb1o6OI2GT34aqoG3YoNN0onvUK1mh/1/LA6vg2usLG0ptpq
UNc7/ZpageaCtfnV62Svvd8U2mveboZc5FDSjEu+yIyUf4PC78oRa6bqNVvaU2HhPCpoQuUHMFp7
MvpwmU+xWJ0DA2cd8JLJ098GJH+UQpHC8l0aP7vGcgNfL0aAaZsQqqZMBi6PzSSTHzTwg3+8qdir
6hiRK7U8hXXuA6wPRCJfiXX+zHiX7am8yHa+z04RgO4jtmRewiD3hOJIbjb/Bh9WnIrvQpO7nxof
5ck=
=lKTw
-----END PGP SIGNATURE-----

--xWGmdpENNXHUFmIuBAMmIO5Ucsxs5XoiH--

