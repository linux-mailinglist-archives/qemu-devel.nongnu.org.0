Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 196D9533A78
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 12:11:40 +0200 (CEST)
Received: from localhost ([::1]:42164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntnzM-0001N0-Sl
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 06:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <howard_chiu@aspeedtech.com>)
 id 1ntnoW-0003yQ-NA; Wed, 25 May 2022 06:00:25 -0400
Received: from mail-tyzapc01on2070d.outbound.protection.outlook.com
 ([2a01:111:f403:704b::70d]:49368
 helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <howard_chiu@aspeedtech.com>)
 id 1ntnoP-0003kU-2e; Wed, 25 May 2022 06:00:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Izsf29zLAbKjC0Ji9rBVpIWYbbJW2fF6Nvz2j4k6hdT8M1T3VvbpF4fElxgEqPj8DNPLdHN3xvli3K/U25uxCECxsyOQ+gVXvFUWNxLCv6bHAqHGAdh1WOiJnHTlkB9rIw4yM4CO5jBELIFr8WnII4D9iQYaWFq5YOj76iMVn7D2yh8eTK6zUxlF2ng8Rn5PkNBIJ7ZzP8XdFaIZM3shD79u9b94lBwsbiD26LICJbwPvshp0XaFRCLydksgE7U6bMYDVa2WD0B1XTu+5hcCnXHbxN+rhxyoECx91HhVMzahT+Ahr/hxjg1wqoqKfmbkavNNtyyfdScguWzn3i9GhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVDkqYsaaDQzDadhq95DWVD2+D2RO9bgXap/SYTOL0c=;
 b=lQ8c85XtQXsdFJT5gY4UwXJA6bqY1OtMyzdMTd1jcvYpPQ5sHwWsgzxQbc52qHy234dH1YM6LcsVsetbeCbANFdHMXnb2WuyGfwOwlmBLaRIxnjBH8H5/W/tz/KQVpAhiY8GSU2oa+quu2D53WxhMll9hinjlzzrlkr8AemXuMuukaP655p8PuMr8UyYsrOrVNxxwLoZpUt2NdJwbv1MS3uGnWLJB+pNQaxlBft9wI7LTuF//8cGW1LcISNz7prYU/oxF1dYd0Wcdyq3chBGfUbM6Y+BYenVz+DQjLbLSa241guhKi5PLQeOFDGnYuGH8wDXEdGOzLEUVGAK+7EajQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVDkqYsaaDQzDadhq95DWVD2+D2RO9bgXap/SYTOL0c=;
 b=njXTGS3m+SZZpLbDpWUOxOTNsuHTUt7SEcyQIqEdWemdYUxX9Pv+PLMHzTfof1/3KQa3YdSvJ5qLwCNKyGC0mp20kFiGKK5PTs0IC5q43a1bsO47UkdwmIN7yAA6U7z7uACnqlx560vZFjZVIqENNEh5SnJ17zVT0QnsP7Cc/O2Y44xSOCRsHkaVzCBIkeefQE7l59+nGQVgZzPLTCyPZfnsyj7xfLz0dn4akpwGXedDU35zWnzWf9g2/cRid3NxOw+an0+T+viJy4WMhD6xiCM4aeZWIqKq6y4qPDjcxbdHDEaQ8ELcbvA29B17N61+yU2e/SabZHe/0BNxLWyEMA==
Received: from SG2PR06MB2315.apcprd06.prod.outlook.com (2603:1096:4:b::19) by
 TY2PR06MB2445.apcprd06.prod.outlook.com (2603:1096:404:4a::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.22; Wed, 25 May 2022 10:00:02 +0000
Received: from SG2PR06MB2315.apcprd06.prod.outlook.com
 ([fe80::c5c2:d3e1:f0af:4a19]) by SG2PR06MB2315.apcprd06.prod.outlook.com
 ([fe80::c5c2:d3e1:f0af:4a19%3]) with mapi id 15.20.5273.023; Wed, 25 May 2022
 10:00:02 +0000
From: Howard Chiu <howard_chiu@aspeedtech.com>
To: "clg@kaod.org" <clg@kaod.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Troy Lee <troy_lee@aspeedtech.com>, Steven Lee
 <steven_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH] hw/arm/aspeed: Add i2c devices for AST2600 EVB
Thread-Topic: [PATCH] hw/arm/aspeed: Add i2c devices for AST2600 EVB
Thread-Index: AdhwG4ccA//9oHFRRGKJBFgW1qyFLQ==
Date: Wed, 25 May 2022 10:00:01 +0000
Message-ID: <SG2PR06MB2315A0711B0DC6903A0291BAE6D69@SG2PR06MB2315.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 183cf250-feaa-4c9e-d34a-08da3e3555c6
x-ms-traffictypediagnostic: TY2PR06MB2445:EE_
x-microsoft-antispam-prvs: <TY2PR06MB2445BE4E64757C4B28E866DFE6D69@TY2PR06MB2445.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2l2p8oUNc0xEc1Qo6yfCUzCveUG65L0wM/qMHJTDR/Mfd3RFE/J9sAc9/ht6n/6HObvsraWIoOcq4475WpgAjx2B+OGObHu1XtmtjPMKvuPm7KH06Svkmbvut+QqIowtzx97Q5SMcviLsEXMPp9kI5c/AI/W7gwSEg5spqeFgUrVLAm1TyR2FkA115jsvaQBtmKNuHtZ+oMUDIOxqI9akcgbupupP1nn4YNvunhtE/oQR6+0Ag0Gx4L2/25rmhpcfoBhP5IECR1sY5uxfp9QvbhhkFcM5lx88APtGxNWrGQCugUJ+HrSX6bYPbmvFmnpw9EcsYTRhUSGOz9bimndjHdjsGnxjRU18y8HFppqKIR40Y1oIl5iTLofKU5X3nfMPfZuSEFEJ6BEH6hYzuahFCHmE89FnjpXET5hD+6NrVepwaZrKMB2ffAHBe5IlPOUTEBT0+E0E20weimG/It1cyEyuuvaQkq8w5+88VXRkXmCy6hAWsxXojt+bxxXX8bNMRvuf3oFQ5/m42/rzZcE/bjWAYuhmRNW4criSd5VULYW+BD3KubhX2v8E/UUbGHe6PyQSLrxdkEA8/rsU64l9XSVVQCvYgkWTZ5t8nBBlsj4Nl8Ojut7d6HhR1cGc6U8dyCDLd1deQvg8d17z27C74RniomnafnEwUDTQjGs5jUh9ErNMtdZpj65x9b3PYz4JoKZprAT/I2su4jifAfwNw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB2315.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(7696005)(9686003)(508600001)(110136005)(5660300002)(38070700005)(83380400001)(316002)(54906003)(76116006)(55016003)(71200400001)(4326008)(33656002)(8676002)(26005)(52536014)(64756008)(66476007)(66446008)(66556008)(122000001)(8936002)(86362001)(66946007)(186003)(107886003)(2906002)(4744005)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2uJ2G7s3h8wo8KXd0ioMRVBE3OruM03/4L9vpU+exZywmmYvUBxFM/ahItgf?=
 =?us-ascii?Q?AwozWPPnuW7AckXJNIDJR5vXwKRjZl7JPHT+AiCA/D9Z3gLbwTWPD6YgDwFc?=
 =?us-ascii?Q?8NBUza8pFTO1znN4b39ug2rRFAGXzPe3LbtF7LwBK8AW511MwZ5C51XDLzff?=
 =?us-ascii?Q?ZsmKAdfflTHgslPIfpss8hmUEZXhQ+G9xudY3Fy0f2lcq1IW0eLHdw5QgGyG?=
 =?us-ascii?Q?x68HL+3sMrpydhdiZpg1QNONKpBV+IJfFmDehndGR6xzf69K96XGZ1h3d0q/?=
 =?us-ascii?Q?LZobj/dhYHz6aYPaZpFcKrAHEWalGpQ6pJ0HcS13VZdDSXDj9JOVtLM5e6rB?=
 =?us-ascii?Q?eQtHLJWMbntSoSfPi8eSUw+F5nelTHUkjl1qEZsoqmlHPpj04LI6camgF/2+?=
 =?us-ascii?Q?ajos+5cqZUUbZIYJmOtdumF+7cKEUjPJp0dUrFmCDYCMyUNVxdIp1ZnzEiq6?=
 =?us-ascii?Q?GuzIneUSZ6UXjgzxmCgP0PKC1H2BJwaoZaFy2qn4MHOq4Y6Wki+3F+zSaMVo?=
 =?us-ascii?Q?nI/heU4hFt+g8O8T5K2p2qzsCUoa1R9ekJn8/2I9Akx8UIBvaqf2JRp6CVY8?=
 =?us-ascii?Q?ZizvBXbWJgmZ1syJblgFQ4NcrX+3MxnyS7IsWtdqEVa3nrkAOi8AQlCa936s?=
 =?us-ascii?Q?mhfgDtu+qR8gAaw9JF0aQpom0Gj8NeJ8kmoJ5PYQ5dWWkrxtyRyR7RZWJetb?=
 =?us-ascii?Q?N0IIpfCAPsUaMdTlLeVRf33c1jzEjezZrPkfV8Gg258XTtuG+FjLzV398XLD?=
 =?us-ascii?Q?TudQgu9+ZVX5ggABa/mJXXP35QexqjR9ZyYN5gBK69kAUwL9XFIVfWSoLNcy?=
 =?us-ascii?Q?8eabsdKctutxkoK8kx0w2j+Gs6Hm+XNunLWaQpP8GEWH68eXK0o/WRsVJoDz?=
 =?us-ascii?Q?8UbrpjJVjToIrTxhGApjsBnRUuflHzqUIh7GE8p4ClADOg2+H8bJW3f1zsFb?=
 =?us-ascii?Q?dOBFZjSF2rUOhI+Uh59vPwSAW9k84Ct/JOAx0CGLQ8Rbpjf/wBUJFWTzaZyk?=
 =?us-ascii?Q?rUN38uxJTuBGKQf5b1hZ+O/Fnrdc2dsQsj/Cv9pI6W87SJKIP7qMLd2W3Vt0?=
 =?us-ascii?Q?LdZMltFp8tbai3SiovjlUd4Uo6t5tpPpPBsfz0C21ZfmgEj+Vf0U9rpX6+5d?=
 =?us-ascii?Q?pQr5Iv8Pp+NfmfUQcqvZM8cVNovIMSwmk4aWUMXPCvpU9d75V0I7fZb5fOxE?=
 =?us-ascii?Q?VkCDUc5BfvSrX0c++lwIidYptMZUk2rJMZDdJb2/eNeao9y3UtP3vvWCwR2h?=
 =?us-ascii?Q?C+ARyXhDDfJcTxBdSJpsVVJ9SUP+BPtdBogmK2bIZElgjpmLwbShjyVeng52?=
 =?us-ascii?Q?wYnq7EyOTZDQKPa8arc/+va+CnFCbhMLHIzP1WhA+laUKPJqla5mGj3gSDxU?=
 =?us-ascii?Q?8s0w9YeuN9BbhUKsPMAF0+dWV6joSVb0DKsjI3tve+pgpXsE1uLTBzK/70Ry?=
 =?us-ascii?Q?yxspHgq1Rea1twa+L1mtwqrdwJyBS6kbofhGvuriNyznUEGP9k6jeNkeEE3X?=
 =?us-ascii?Q?cMR4W19Ap9CHKoPeqJCcJcd0II5HPs7gYeBUn+yGSjTulEtMoxOh5fRK2KXD?=
 =?us-ascii?Q?LAxxFKukElarfEloySyOlPFbj8Un+Ax1AlYBTb/V92cSdxPewnB3mHbszC12?=
 =?us-ascii?Q?Zat279SPyHgppqtDg9eIlhp3HhnYW0hVF0DyGX3ic1UYz3h0yKB/7OmdiMi2?=
 =?us-ascii?Q?84KiOpcVxpRCXvxXEyswWT4DwKtqttIXbQyvEM3BHvuEqaMbKBIZUCCRPYb9?=
 =?us-ascii?Q?klpGAVugw0JqThGMSCrx7uk4Qm52LsM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB2315.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 183cf250-feaa-4c9e-d34a-08da3e3555c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2022 10:00:01.9316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 68U5huWzYN72F3z3W9a+wawNq6R+fLu3zc0uRsLfYaczDPs9gnAI4w4uR+nRVnuYEkmYmFbayV3PIo1UG9cJ1uIlj4NmxsZTd1RY4zjCc5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR06MB2445
Received-SPF: pass client-ip=2a01:111:f403:704b::70d;
 envelope-from=howard_chiu@aspeedtech.com;
 helo=APC01-TYZ-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add EEPROM and LM75 temperature sensor according to hardware schematic

Signed-off-by: Howard Chiu <howard_chiu@aspeedtech.com>
---
 hw/arm/aspeed.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a74c13ab0f..df74d3e955 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -526,8 +526,15 @@ static void ast2500_evb_i2c_init(AspeedMachineState *b=
mc)
=20
 static void ast2600_evb_i2c_init(AspeedMachineState *bmc)
 {
-    /* Start with some devices on our I2C busses */
-    ast2500_evb_i2c_init(bmc);
+    AspeedSoCState *soc =3D &bmc->soc;
+    uint8_t *eeprom_buf =3D g_malloc0(8 * 1024);
+
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 7), 0x50,
+                          eeprom_buf);
+
+    /* LM75 is compatible with TMP105 driver */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8),
+                     TYPE_TMP105, 0x4d);
 }
=20
 static void romulus_bmc_i2c_init(AspeedMachineState *bmc)
--=20
2.25.1


