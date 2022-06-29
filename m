Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B342155FC27
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 11:38:15 +0200 (CEST)
Received: from localhost ([::1]:36346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6U9G-0001Pt-Ov
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 05:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o6U5w-00077K-O1
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 05:34:48 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:45914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o6U5u-0000mF-H1
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 05:34:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to;
 bh=2tskaEb9ykKCmOVLxloM8FV35x0IRjSBPtcawga+w+8=;
 b=FyBKoGjOUGXVTQJhKdaF3SJiCEMlHo8jIcfEA8PQmtmY+dBAhRtItdnz
 jmRgHGIBthvYPIIUhirUgDnWQ88FO/jymw7a4Lz7ZDjfpmlealDAW//MZ
 YtLlRhZJ9Z8xXHzzbzIznUNT8cLjThpw+DjTB40xdwMRqfDRcdZ+sb3Dx 4=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Brice.Goglin@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.92,231,1650924000"; d="scan'208";a="18060907"
Received: from clt-128-93-179-171.vpn.inria.fr (HELO [128.93.179.171])
 ([128.93.179.171]) by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2022 11:34:45 +0200
Subject: [PATCH v3 2/4] tests: acpi: add and whitelist *.hmat-noinitiator
 expected blobs
From: Brice Goglin <Brice.Goglin@inria.fr>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Liu Jingqi <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <1e9d4c01-0ce3-4514-1e5b-ffccc6e88f9e@inria.fr>
Message-ID: <eb5f26ae-d079-30ad-c1b0-6f346bfd0e29@inria.fr>
Date: Wed, 29 Jun 2022 11:34:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1e9d4c01-0ce3-4514-1e5b-ffccc6e88f9e@inria.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="M3jacIIbXPNL70eVPs070wGnNI5Jnq579"
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
--M3jacIIbXPNL70eVPs070wGnNI5Jnq579
Content-Type: multipart/mixed; boundary="9OjX9BrpNPiTiZPCo72J4222AjGnKay35";
 protected-headers="v1"
From: Brice Goglin <Brice.Goglin@inria.fr>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Liu Jingqi <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Message-ID: <eb5f26ae-d079-30ad-c1b0-6f346bfd0e29@inria.fr>
Subject: [PATCH v3 2/4] tests: acpi: add and whitelist *.hmat-noinitiator
 expected blobs
References: <1e9d4c01-0ce3-4514-1e5b-ffccc6e88f9e@inria.fr>
In-Reply-To: <1e9d4c01-0ce3-4514-1e5b-ffccc6e88f9e@inria.fr>

--9OjX9BrpNPiTiZPCo72J4222AjGnKay35
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

=2E. which will be used by follow up hmat-noinitiator test-case.

Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
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




--9OjX9BrpNPiTiZPCo72J4222AjGnKay35--

--M3jacIIbXPNL70eVPs070wGnNI5Jnq579
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEelpOgOQAl7r26tY4RJGQ8yNavTsFAmK8HLQFAwAAAAAACgkQRJGQ8yNavTsU
7Q/+PsV9vi9iP4WCqbJbrO0Cm7V7WehEFB6Prtc9fdlIyutQBqMaJsq1Pjl+tdmVTXGbKTEoNbOR
WSoqoNtVhQll8maZTlYBNn2jVOZacbiz9KS9jCNfkBqjbq1CLzBa86owpEJa8Eht6N00pn+v5xDS
d2/mhtZf7MQM8TI4dDlfmYO+3nwjYQJsCKp31V56zNUqPgY5/yMwKkMfPUe7C1VQqfSAL+Z5h+vX
vwoymRIhBbcMi/Vmc739YsOiqCkBGfIVijTzKhr2zcao09P/kGbltgSRwPyfFK+KK4QySkz2UEyA
54wGhejukJaiUncqnWByPCdfRipdSsqL0YGNFl/Zw+fLBvIZgrErLH3s4HK8G5GgRuXrasySTUfK
imeEf29syvcKBESp2Wd6KjDu8gbw5ibIaRPpxvLReWgPWpluHPVS2jrbXaOlCFp0l45jSFIdoosU
oS+XHgeCvA32+6uiNRaA/aj0mnfgQAwQ8+oxz/Ji+ulDB03Wv1JtY85PtPMOp62ntjJ8+EekJTgm
jotUURyY7BhQscCgDkIQs5sH5WkyPadLbpw3b4RRQEVruE5d6WTAl1zXpf2fUK8DjLRD19aJc+5r
nsUI+2BXY4jeuL2wFmBF+ODkWZVtNuXzL+pU9E/bBPGdCTnj0EUglyJdSh292Qi8oauF8/EKMkBu
hrE=
=jsZK
-----END PGP SIGNATURE-----

--M3jacIIbXPNL70eVPs070wGnNI5Jnq579--

