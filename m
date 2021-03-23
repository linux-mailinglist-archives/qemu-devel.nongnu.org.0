Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A65B1345CAB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 12:21:29 +0100 (CET)
Received: from localhost ([::1]:41278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOf6G-0000il-Nc
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 07:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=709fc0b28=Niklas.Cassel@wdc.com>)
 id 1lOf3S-0007GK-Az; Tue, 23 Mar 2021 07:18:35 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=709fc0b28=Niklas.Cassel@wdc.com>)
 id 1lOf3O-00010h-5H; Tue, 23 Mar 2021 07:18:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616498311; x=1648034311;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=eGP1xnbzNv5cs3O/DzC5QuVgLUCWI/f3NC+Uwe/AJsw=;
 b=dTp2VklQ03Z05eTynipNVJfIQ4pZ6uRAV2KRTbTBspenS6pM2cEVNXRF
 yviEEisy+fDnTgB6IeGGYRuleJGMaQqOba0r0vZSx3LdMwPib6q9VvupN
 L7dXyZOdXVYJdC2AFr9ADXzNlo+rKWJZ6qNe5XwaoavEGjk3qIORft+7o
 OLK8gRyeZG4IAkixfWpGQaYn0p5HoaDw+JG1++3kaRB9tqLSZetTqjTpM
 +cBMC6p7v/lTsRSEoNGKBviBIIAit5xs6G1ifLez+eMWwS40mSjQMklQS
 +kU6HkjtNeYyQuZTir6oXQKDBhn0Sc7z9gITYGd/Bo0dUornb8kdQrswE A==;
IronPort-SDR: oy8ouRbluECBVbvkPfJ4FiEGa53015NNnM8VinlvJvZFtHxH4lPw6MwFE4u3QpUQcq77OzVDrL
 0eAcTCJxZz0jwvYTlhFC2KEY6+/fAZtZjwfl7pYzrq2dLAmhWUEogUYyEjV44GySCXKaCnhWV/
 snc82RYbZfJj95vg5Q2922acPiMaQZ+awCytV0Oy/nqvTqy2NhEbUveKf7BsHiPTjCRYaptzxB
 exTcT+mr8WDLH7oiKTGsYL+o8GQObZyqAzxo8YsB4dQi5/BxGD8waOD4maLRGXLt6i5a+qnlYh
 myE=
X-IronPort-AV: E=Sophos;i="5.81,271,1610380800"; d="scan'208";a="163908611"
Received: from mail-dm6nam08lp2048.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.48])
 by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2021 19:18:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6N1dV/lFxgtMVnAi7jmM7KsZWZ8gcvmpCeSyJRrUwlfk3lh5UqtutuHrqHG19zaT0dS+osk3bbW3ukMrgE6+Y87hDXS0TEBd09/iwst8OGzLvsNSlaigFukuO0p98SI+tlSC6QUOFF/fhgzzg5CpaSrhOXuMhBD4YvyNXPBg49F9wNZtKoPoq4hoR40J51U4FT0Icp8Kuw0CCcw6WKpzkoGe/4rSeIqO64u17vd7OilzQQ+B0MuW7gbkkkwGrxkoZ6EjaVDq3Xlklgxph2sKwJc+y7LFQbU/HP6VbYazZOBn9bXjVSlrtByAqDC7dD+VlP8gasSN+n/gimVk76WSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aMRIKj2199WaB7x+FqV9FEasSYZcj1Hojnu2aoH6oU=;
 b=kR5yNWh/XAvgzYlj6L1X9gRD8r86Mcdw/xmN/zqEjXBFKlRX2/M6JbDq5CRUp1JHSiYjQeOYZ0+I9Jd0skfgD3H4kQTrN4wRFuvsEdZNRQ+eZ0mky89OZPNOAuUMS0bQcLyHQr+DDS0U7cRYiRmqJJHOPME45GZxCsUHmqtZLIbkBuwibV/vzL/my76SFmsSTKAtkFKN8Ta2ovEerz2bvkbs8/eTJozFirK4yu9Lw40LNL3k3qY3kmbtvh6ism7kzYZCZO7/9O7h8PUo93MtWmKW6k1XJPAF6OYdB7VT7K9iQuHb+24m7/VT3MJuKhT0jHei67xJEzVImGjmmXYEOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aMRIKj2199WaB7x+FqV9FEasSYZcj1Hojnu2aoH6oU=;
 b=TQf2eDtejAqAXBTZKJAGgBEXMtsKn18NWKML39lXBy8//X1BnVIJzBJTUr2RH6vKZv6CtIxIBC96DGZSbR+F6DSFQV6q6L1v7Tr6PJu3P4x/lqI9+KHCMYKt20/q1+2/glNMsjWerG5AB4CclMnANOBnXEdPbZWBN6cxFUVTqcg=
Received: from DM5PR04MB0684.namprd04.prod.outlook.com (2603:10b6:3:f3::20) by
 DM6PR04MB4809.namprd04.prod.outlook.com (2603:10b6:5:1e::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18; Tue, 23 Mar 2021 11:18:25 +0000
Received: from DM5PR04MB0684.namprd04.prod.outlook.com
 ([fe80::f0ed:1983:98c8:3046]) by DM5PR04MB0684.namprd04.prod.outlook.com
 ([fe80::f0ed:1983:98c8:3046%12]) with mapi id 15.20.3955.027; Tue, 23 Mar
 2021 11:18:25 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: "kbusch@kernel.org" <kbusch@kernel.org>, "its@irrelevant.dk"
 <its@irrelevant.dk>
Subject: [PATCH] hw/block/nvme: remove description for zoned.append_size_limit
Thread-Topic: [PATCH] hw/block/nvme: remove description for
 zoned.append_size_limit
Thread-Index: AQHXH9Y9DJiNPD4JsUmuGSBN3p/7PA==
Date: Tue, 23 Mar 2021 11:18:25 +0000
Message-ID: <20210323111817.115837-1-Niklas.Cassel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.30.2
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [85.226.244.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f5cf0dd8-1b62-4147-5e27-08d8eded6073
x-ms-traffictypediagnostic: DM6PR04MB4809:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR04MB4809120DD07C89D17875D4A1F2649@DM6PR04MB4809.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:962;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Nu0NJnOKnnlegCFKNle/4sF4D5kbIArAqiWP90V0g6DmKf8Oeuk5XnbMZsyRQWg2WW9NJhob7RuD10ZO/Ppka2fvQPjFv2I0nQAkIGxMheZz6cnndi7OSI3aPr5UZ4g2H1myJyOSqSgHqxyJXjtUFXfeNxL63n4ZHJHSZ6nQRiZPNtR4mjEY65/Haan6v34pYCPm/kB/VZ/vtjkhK6Fo4A1yUKUU206ja7O3q23uAF8LgrrEeKLO8E+6z76OjURRbHUhYyNy8wWqTpaqThR8Tfcvgplm1EQRlaRVpDwxA3ZKMQpO1jNHMXFIVMqGAiGh7GxwEHEHC+v1HMkM+Xr3DsbxkTelT53Mf7yFRc1DP48j/taRJILUSobwhbGQv62hiu0swwFDkJLFE065fYuFiNDs5QYkjupvs0juoj72Uek9mpEuO/FKx+/ZQ6o7xTnuqqUihMPogR90erEmzLLPsz8WISx0Cv8kSUVfZh7g5dU8Q2rfPBTh2Mkgek97HCYE9ZXTJPB/VfiMaKEJ+woOXRovwZGtGy0DFwdcuu2V8xTHIKRSAnLWzh09ffjpAeJghA2z8ujwI4xEna68t6j4su143f0/vVbyvKGeW5wyfis6YkCjfiyCJQ5RkE5+nka5vlIi8A+Tnm0sdfphc5hP32wyJwWlrZW2zT4AQIUzzvs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0684.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(110136005)(498600001)(8676002)(36756003)(54906003)(8936002)(91956017)(83380400001)(6506007)(66556008)(66946007)(64756008)(4326008)(1076003)(66446008)(26005)(2616005)(5660300002)(6486002)(71200400001)(186003)(66476007)(2906002)(6512007)(38100700001)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?mNspozyIzzB1DsdGQIIUVtr5Zy2sfx22cNPCkuw0P6MW4efsbP54hnTGHi?=
 =?iso-8859-1?Q?EN1r9lYwa9Ak/tEn83nnhbEmSMfhb8cNHJVHsm4E2thl2rbNgBvnRQRxGh?=
 =?iso-8859-1?Q?v6wg/vF0bUrbJc3+NVQ7XDTJdgULbxTJLslhVBU1ddcXm0WLO8SAOUrZ3U?=
 =?iso-8859-1?Q?DO4e5ClKvilPHQbNYd9CA2bzSzFDNUxVpSV/61sdFuvsXYDVO2U3j8va8P?=
 =?iso-8859-1?Q?s99h5sLcecVpR3xze6AgF0KghUX7fRdRlS04Tc3IfmPcf9zZv0VYdRG65m?=
 =?iso-8859-1?Q?kAaeuryIwjuw+OPhZ7nnkwXMFSDLVLxLgC8yLMg1/uDJHtvZsEkqr16zyT?=
 =?iso-8859-1?Q?q1BubP5yX2s/ZgS/4WIqc0j2LfN7dkeV41uWQ0Iha0+gYTdozqOQy5RQTu?=
 =?iso-8859-1?Q?/OEXDqMj0gWlGv5qL2QSofO1oELHDDRV3O2VS5NN+F6AYwLZUS4Dn/iMVx?=
 =?iso-8859-1?Q?Tu5eOXJaT2BEklRCtX7EEbTd1ZHKLvJN3RR+xTIKKR8M2jzlsBkXdiJB1i?=
 =?iso-8859-1?Q?NagvoGvuREyF3woz6u+nBcE/1PbnebAwOCbHZtQJROQ5ERL+Ufs9rdUGZy?=
 =?iso-8859-1?Q?ElTShsUuRo3NIR0kcS19hzO49QEMx9WV4B5/DsakpxmVD9ScasDNuc4Qnl?=
 =?iso-8859-1?Q?kScAaA7nGoBvnjZA4TfAs0rXFXoIYTTK19fhgn+Gyf98B7VgFxrOQneLyp?=
 =?iso-8859-1?Q?53XIJ9IK0ub7RAGBmNiqFo/i7o4qqf4qNIZR2fdAR0lM6mmDAvfx2Nw1qd?=
 =?iso-8859-1?Q?+7qNcaT+ry0ZmqmhbIDTEuMX4DlmfhJm4upfDQdEgzBlt5grDYhM8KnNii?=
 =?iso-8859-1?Q?T1dYqGBCFD4ZO9BBWyWsGtcnjEsW5dEdb9tdWp7fdhRnFfBruO9n5QosB8?=
 =?iso-8859-1?Q?qkniUXLqOF5ZNLb1qf8C7kTuJSe49muRSqjqGBh4Uy4aPEP2mcRhnvszim?=
 =?iso-8859-1?Q?adShlm88oposP2zCQ8PJfAOduReJ1G9HZ8zkodDavywgTsA54xpkFG6WBC?=
 =?iso-8859-1?Q?kVHoDrdEwbLtDyiynUU7v5X4kqTcd2vNC9KjX5CLopTsUqkujwvvcOq0Mj?=
 =?iso-8859-1?Q?Z3nVErTn4eKOYpvhJGcNfyCYCO+6G5qKzaGy2qnvYyzWaIrc0mkwxjWeBZ?=
 =?iso-8859-1?Q?AjeoJcPRvB7Ryi8frEr+fpDlEiDnE5Rzc8RZa6y3qrRvPfaS2pwjOUQyNT?=
 =?iso-8859-1?Q?bpjwzcY/NSFsZCCFjI4m3z3k/rAEQyEbwa9CLH36+f832BBYJganSxodnF?=
 =?iso-8859-1?Q?snG9g/8y/I9lY0YCNzJJgK7YKgGtcKwOZY6DBM++20fWbJjrO9IZR8//p2?=
 =?iso-8859-1?Q?5e25V5cxLPKA6dl2WRjb5+vqxVx3OP9/lndUiHLff/SD15+pOkWhY1lVjS?=
 =?iso-8859-1?Q?r2K0GcxnbI?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0684.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5cf0dd8-1b62-4147-5e27-08d8eded6073
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2021 11:18:25.2611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rhbBlivK96lA5Pdn7mqFHbP/1zq/sFpAnUjCPC7hXZP9b0bvFSXxfls1xNjPZirGrH+FnZ09CM2vX8qcFM1qew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4809
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=709fc0b28=Niklas.Cassel@wdc.com; helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Niklas Cassel <niklas.cassel@wdc.com>

The description was originally removed in commit 578d914b263c
("hw/block/nvme: align zoned.zasl with mdts") together with the removal
of the zoned.append_size_limit parameter itself.

However, it was (most likely accidentally), re-added in commit
f7dcd31885cb ("hw/block/nvme: add non-mdts command size limit for verify").

Remove the description again, since the parameter it describes,
zoned.append_size_limit, no longer exists.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 hw/block/nvme.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 6842b01ab5..205d3ec944 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -91,14 +91,6 @@
  *   the minimum memory page size (CAP.MPSMIN). The default value is 0 (i.=
e.
  *   defaulting to the value of `mdts`).
  *
- * - `zoned.append_size_limit`
- *   The maximum I/O size in bytes that is allowed in Zone Append command.
- *   The default is 128KiB. Since internally this this value is maintained=
 as
- *   ZASL =3D log2(<maximum append size> / <page size>), some values assig=
ned
- *   to this property may be rounded down and result in a lower maximum ZA
- *   data size being in effect. By setting this property to 0, users can m=
ake
- *   ZASL to be equal to MDTS. This property only affects zoned namespaces=
.
- *
  * nvme namespace device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  * - `subsys`
--=20
2.30.2

