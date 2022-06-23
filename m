Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DCA557E58
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 16:58:43 +0200 (CEST)
Received: from localhost ([::1]:37836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4OI6-000088-47
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 10:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o4OGY-0007sl-64
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 10:57:06 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:25617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o4OGW-0003wL-4d
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 10:57:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=to:cc:from:subject:message-id:date:mime-version;
 bh=ZH7qbLQnZNB08hqr2cyrGc+to4woCr1JN4sSAIb9Zac=;
 b=Me7e7i9v3Ovi91Ly62klqKxcAxhG+018p0BMQjiNQbkhr5QBFBxtpmQk
 Zja4yALON7LTJb2tdNQOaXFfaXwWC2S9VxDrJ/prT4gX4LenRDLpN5AGd
 gXleZ0U/+kCZ9V+uTbe/UUN/8dkPMUOYIUyQ70DcfIJxl6Ac/LkY4oKPg U=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Brice.Goglin@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.92,216,1650924000"; d="scan'208";a="42600227"
Received: from clt-128-93-179-2.vpn.inria.fr (HELO [128.93.179.2])
 ([128.93.179.2]) by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 16:56:59 +0200
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Liu Jingqi <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
From: Brice Goglin <Brice.Goglin@inria.fr>
Subject: [PATCH 0/4] hmat acpi: Don't require initiator value in -numa
Message-ID: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>
Date: Thu, 23 Jun 2022 16:56:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="x8FMhbul8EO2K23pJbshcw6WPxzd7ttMd"
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
--x8FMhbul8EO2K23pJbshcw6WPxzd7ttMd
Content-Type: multipart/mixed; boundary="lrjnKzAvg20ffvS5UwEpWB4Ng3ZgMR7N8";
 protected-headers="v1"
From: Brice Goglin <Brice.Goglin@inria.fr>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Liu Jingqi <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Message-ID: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>
Subject: [PATCH 0/4] hmat acpi: Don't require initiator value in -numa

--lrjnKzAvg20ffvS5UwEpWB4Ng3ZgMR7N8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Brice Goglin (4):
   hmat acpi: Don't require initiator value in -numa
   tests: acpi: add and whitelist *.hmat-noinitiator expected blobs
   tests: acpi: q35: add test for hmat nodes without initiators
   tests: acpi: q35: update expected blobs *.hmat-noinitiators

  hw/core/machine.c                             |   4 +-
  tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 0 -> 144 bytes
  tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 0 -> 8553 bytes
  tests/data/acpi/q35/FACP.acpihmat-noinitiator | Bin 0 -> 244 bytes
  tests/data/acpi/q35/HMAT.acpihmat-noinitiator | Bin 0 -> 288 bytes
  tests/data/acpi/q35/SRAT.acpihmat-noinitiator | Bin 0 -> 312 bytes
  tests/qtest/bios-tables-test.c                |  45 ++++++++++++++++++
  7 files changed, 46 insertions(+), 3 deletions(-)
  create mode 100644 tests/data/acpi/q35/APIC.acpihmat-noinitiator
  create mode 100644 tests/data/acpi/q35/DSDT.acpihmat-noinitiator
  create mode 100644 tests/data/acpi/q35/FACP.acpihmat-noinitiator
  create mode 100644 tests/data/acpi/q35/HMAT.acpihmat-noinitiator
  create mode 100644 tests/data/acpi/q35/SRAT.acpihmat-noinitiator

--=20
2.30.2




--lrjnKzAvg20ffvS5UwEpWB4Ng3ZgMR7N8--

--x8FMhbul8EO2K23pJbshcw6WPxzd7ttMd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEelpOgOQAl7r26tY4RJGQ8yNavTsFAmK0fzoFAwAAAAAACgkQRJGQ8yNavTvG
fA//VuMdFDjIa2YbLrGzT6Le5UjzhJfitWwCLIumgg21n5uMOPrP8zgRvPgoURDu5mu+nBcFkbM0
naVA/SLO/EdSes01eDl408YDr70bfZBY8vqC/sgK8zFLZTAZroFyXHllR1IqFCcHxne7lMdZN/j7
bBLFZ7h9s1o9Geb36hJI1MwSCYOd85uoT9jWMFAQhZK/uYcqxsOMgJePeBaeQG7+NjWFJA+kTWQF
4II3hZITOtrJUOCSL0whF+8SeK0th7Kn5Fnu/dQ8Ai54kQ1psHWLpyijv+6xP2nnzDjE9nkRjmsc
6p05EO7Y1ogDyzlZuxyq7XLfSw7eLVDD/5Z0hVR6h9MLvMFvM8Iu909UQn6vCUEnBvbQsNTC16Jq
illadIo1YJxmO0lC2LW70aZ6BeNaIu+mFWB151PF22ZW3xfdKYPzeqqF7psHiYqqM/MJphNIUvuf
O7iFhhZxnyVYcUoCDd3jZf7yEQTFYLT1g2MtyVLtXUcqULPqdIcMBzEWjkU/auoRP+3+ky3ThVvO
TUBaD13s3VxYK0ORrr1FhHMzS78HDlhIXHjWGlBkU8/Aw/ifoyHN3JKMxRe1fXBIokFqGPEUT1dm
itOrDAeDYlriJKI6+IlLRNLxv/M8VuWsF4ayzulxi6WgjZNVearrJnktQxhNZMGdB00cPyc7luFQ
DIA=
=O0iz
-----END PGP SIGNATURE-----

--x8FMhbul8EO2K23pJbshcw6WPxzd7ttMd--

