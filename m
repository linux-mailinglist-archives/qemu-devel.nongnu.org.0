Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 716E056135C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 09:38:39 +0200 (CEST)
Received: from localhost ([::1]:43792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6ol2-0003jc-J3
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 03:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o6ojO-00031C-Ou
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 03:36:54 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:37726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o6ojM-0000J6-Lp
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 03:36:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=to:cc:from:subject:message-id:date:mime-version;
 bh=itVXG9e/gyNC3I7fV/wgq4UIg6EK0VSfv4JyfqJ5SKk=;
 b=D2fm6yPGcE7dw+GGWxSjzkh1vMqeLuO84/tQpUXLg6ljgAYHB9bPMsWz
 LsJDp1XkqhlO37qO2u+NGdI6g+w6GXwDlSr30aPWFjgqMUQaCKfTMKUvB
 Cc2N3sYdS+d+6w0R+EwVC0qxm392rKI8NScyP/OEYaORaGg65fxn0z101 4=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Brice.Goglin@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.92,233,1650924000"; d="scan'208";a="18148475"
Received: from clt-128-93-179-171.vpn.inria.fr (HELO [128.93.179.171])
 ([128.93.179.171]) by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 09:36:47 +0200
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Liu Jingqi <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
From: Brice Goglin <Brice.Goglin@inria.fr>
Subject: [PATCH v4 0/4] hmat acpi: Don't require initiator value in -numa
Message-ID: <ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr>
Date: Thu, 30 Jun 2022 09:36:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="B8DkSAQzvbhJ3B3cyZwjNFgmVtKAA1lxr"
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
--B8DkSAQzvbhJ3B3cyZwjNFgmVtKAA1lxr
Content-Type: multipart/mixed; boundary="hJcnjmYCSwbS4uPyYJVOJpQz13ZcFPTJy";
 protected-headers="v1"
From: Brice Goglin <Brice.Goglin@inria.fr>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Liu Jingqi <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Message-ID: <ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr>
Subject: [PATCH v4 0/4] hmat acpi: Don't require initiator value in -numa

--hJcnjmYCSwbS4uPyYJVOJpQz13ZcFPTJy
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Allow -numa without initiator value when hmat=3Don so that we may
build more complex topologies, e.g. NUMA nodes whose best initiators
are not just another single node.

changes v3->v4
* use -numa cpu instead of legacy cpus=3D
changes v2->v3:
* improve messages for patches 0/4 and 3/4
changes v1->v2:
* add q35 acpi test

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
  tests/qtest/bios-tables-test.c                |  49 ++++++++++++++++++
  7 files changed, 50 insertions(+), 3 deletions(-)
  create mode 100644 tests/data/acpi/q35/APIC.acpihmat-noinitiator
  create mode 100644 tests/data/acpi/q35/DSDT.acpihmat-noinitiator
  create mode 100644 tests/data/acpi/q35/FACP.acpihmat-noinitiator
  create mode 100644 tests/data/acpi/q35/HMAT.acpihmat-noinitiator
  create mode 100644 tests/data/acpi/q35/SRAT.acpihmat-noinitiator

--=20
2.30.2




--hJcnjmYCSwbS4uPyYJVOJpQz13ZcFPTJy--

--B8DkSAQzvbhJ3B3cyZwjNFgmVtKAA1lxr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEelpOgOQAl7r26tY4RJGQ8yNavTsFAmK9Uo8FAwAAAAAACgkQRJGQ8yNavTtn
hg//UuWG96B6whgF7CuXi146c72svapjoHhZ8WDlRxLrx04xw5Y11K+sc4pje+txH6Ui2H/t/bjT
jtQy4ePmdRzxlmAsLNYjoIZuDM58gySpAzLBC9aw62UlD075NgFyw8Sg98AfxJLRtcLqOlu27bKM
QHwHrHcf2MnemGbezLrA3ZynSsBurj49xsX5iVBwBLw3+sIuqaMR/LiMEIlU5J/WwZTmEoY68rmS
gHMybCWhaCnzojPV3HhmKJkdojrZ/7481dexsFJpoiwtLuo0lvXGQJLaZ8OKlBmWyAw8g3oPpZka
kUjcUFS4g9uFwgoQHTDSVmiPurO5iqUPsJHRtShGi7XSsiodZQdRpHyXlxH9Co3s+H/J0aY80+KP
xYxf3Bj1rYr6kXd0UUZfSwyVkNQy+t6NvKwv+yw/at/mJp3Bd69YHLMxHd62UXkJYnV/u9FPDnaK
WKUhptr5CbslvFoR8KjnK7dL0Kiosf22847PLF7PZwE7Cwo5C75l2Q4bbPDPDngLOzStwmR3mxXP
8RxcLUxP9sZAXu/CY2hXsrI6yCGiixSlMthK8Wp1d4kSwIs8n/ybe5lNfBrlOxzowIi6qKzJlLjg
OAY916zawZRFFwVHqyS+1RpHYK7sXaYbKHwxu9GQjmA4MbqRwHhUYb8zr/899AJAMOWqUpCWocDB
SuM=
=DFok
-----END PGP SIGNATURE-----

--B8DkSAQzvbhJ3B3cyZwjNFgmVtKAA1lxr--

