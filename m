Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2CB557E69
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 17:03:35 +0200 (CEST)
Received: from localhost ([::1]:45570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4OMo-0005b7-5z
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 11:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o4OIT-0001a8-Dl
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 10:59:05 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:25822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o4OIR-00043z-PT
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 10:59:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to;
 bh=wuzwftyM4TW8YAtNsKm0xdxzqKPAmrVkZVw19Ot8w8c=;
 b=UjKsOFUlZPv0r56jWVATSVj7m2EWQi3gR6zUm9vHG7++Ebeu+i7L8Kli
 wjy4P802QoecG9NqJwNU9iY31WxYTNNQAT6ymXxZNvsN8RvOsf0Jvt+L7
 qxkqk5pTyc9cDVie03qol5gDOoBgtW2RPLEZBZ7mCn+uo7CLwfGXeMabZ g=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Brice.Goglin@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.92,216,1650924000"; d="scan'208";a="42600780"
Received: from clt-128-93-179-2.vpn.inria.fr (HELO [128.93.179.2])
 ([128.93.179.2]) by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 16:59:02 +0200
Subject: [PATCH 2/4] tests: acpi: add and whitelist *.hmat-noinitiator
 expected blobs
From: Brice Goglin <Brice.Goglin@inria.fr>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Liu Jingqi <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>
Message-ID: <f76a7763-7c15-045a-acc2-0a7cb939661b@inria.fr>
Date: Thu, 23 Jun 2022 16:59:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="kQgPardyw2rzrjqD1i5rQE6VYSiA4Wkv0"
Received-SPF: pass client-ip=192.134.164.83;
 envelope-from=Brice.Goglin@inria.fr; helo=mail2-relais-roc.national.inria.fr
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
--kQgPardyw2rzrjqD1i5rQE6VYSiA4Wkv0
Content-Type: multipart/mixed; boundary="VxNfFMe3ztpWeATPVbBbqHWNbBuYWO3cC";
 protected-headers="v1"
From: Brice Goglin <Brice.Goglin@inria.fr>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Liu Jingqi <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Message-ID: <f76a7763-7c15-045a-acc2-0a7cb939661b@inria.fr>
Subject: [PATCH 2/4] tests: acpi: add and whitelist *.hmat-noinitiator
 expected blobs
References: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>
In-Reply-To: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>

--VxNfFMe3ztpWeATPVbBbqHWNbBuYWO3cC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

=2E. which will be used by follow up hmat-noinitiator test-case.

Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
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




--VxNfFMe3ztpWeATPVbBbqHWNbBuYWO3cC--

--kQgPardyw2rzrjqD1i5rQE6VYSiA4Wkv0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEelpOgOQAl7r26tY4RJGQ8yNavTsFAmK0f7UFAwAAAAAACgkQRJGQ8yNavTuw
5hAAnH4pYDf4BMRDecnr4Bfi3WJMP7NddIyxGSSC4xUpSTC7E6BZrSXAToqFDNauX3TiTL/w+UII
OB9CrLw9vm8o/LevJLNLzX08EcYhWC4Q2U8St/jEd6OerkL6K45ZYycU5vofHZJq+5/tWNTYDEpW
ReKMC97rm7Lb5iovQgg4odL9VnefjyQvE8KfM/q33/BkgxjnfD+YnJqiz2M1lfhuG2xkQ22mUAwo
uoMTritwkyH9yq6mqI16JUqmfXHcK60niagnfhfxm4wizqkUfJSL2GEkfB0+GZBp49u6gYCSdG3C
dId5ijxxEY1BwUy09igEghAXy6pXlSfPbw2V/E9i6tf9K9AAAR5HLOrWTuydlOiJuW+bbwxTUMS8
iaJrrouCYdI4uyTveKwspT7u423fKmue8dBgkiVHldzf1piaw3FLW+GvNRYWeuW0nvUWvHApNwR/
G7xR+z7L7MHynMxa0RjLKVa4JJkI8x7Az2A4xhh9NW8xONWvOoIo3q9TW2v6SUK5/rEj2uf+hQBT
t9qYWvQjmZSzpMkr+U4wrrE+m5EnJZynKou80JGlx4aGPdKpDL2gI4UlzefPGecqZm5ULXffPVXb
K7T2SK66hxGjGsOajFhszPDm/1LE21Ae8eVfE8kqNo6gQRz3pOX170eoR8GORSLR3Xlb892amJxj
MeQ=
=vbWS
-----END PGP SIGNATURE-----

--kQgPardyw2rzrjqD1i5rQE6VYSiA4Wkv0--

