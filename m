Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CD443986B
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 16:22:34 +0200 (CEST)
Received: from localhost ([::1]:57496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf0rx-0008FK-P5
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 10:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mf0nj-0003oJ-Bk
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:18:11 -0400
Received: from mail-eopbgr740112.outbound.protection.outlook.com
 ([40.107.74.112]:50928 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mf0nd-0005Yh-29
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:18:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhI/dn0EWzV5LHgOVD2+kTjpIhpWGIGPHvy2yGYL813bSG4SBHo8KBhivVb9HFPuutBwdfcBY2hlDbL2SGXs1jq1SeiVO8rf2DvVQdYGk631x05paIdX2B5hD+ji17PFYBr2hpDlMOpX9XbS32W6MwD2txJSYURvodOKqzgYJ3owDxtTX2FwbQ+EQ/OYUlA9Rnjvu4kuH/+Nm/JkiHbl+TjXYBjx9ubReTtC/n0KmNpEryvruosjRlEirGPwUg3fTBXLHNZ4Ypo4IPjq+vkEGEnM5mty0t0Ko5f3eil4ZXsU7lE+OpAqT5pL6NuJt0kIJuIXjUJ6jTAjaieSNwCebg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcUWpPblnsLg9hgSX6rD3WCeyQ8agZv3/6AFBuZjfk8=;
 b=j+oUWde6F4ezgAM9jhKioReW5VoaTYQPr1O4Ogw0mxnVNwSNcRP+7S/DE9pYO/kRLMy+wD9soyiOCcog7dIa9PIEy7CdB2bB4MXKWjXJHHhHxCr3OWEDhzlKX9EltUHm/hgjtAtWahASEw77PqAfmll8U6xn9eFsNhMpss+4/ANk6dxYJwHwFCDtZxkSHWcIlKerveXFUj8zrliOEBdZK2OjInpPl9eD/XOpdNXQpA18iPCoX4OxkKAtpQDsHQkzNSwrAerCf02B6NcuKZJfkOfvSpe7CSxuJTG1jcq0udcEwAvxuBbcbP4YLYLbwnh4kGeoYx1NMvEl+nfmOfopBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcUWpPblnsLg9hgSX6rD3WCeyQ8agZv3/6AFBuZjfk8=;
 b=TNohbN8243aiiOomhqGjdwQ6TqfHEo1oIKi3b5CSFIuOGNLrZiwrw+ztdiWQ1vNvUevFFnSNUh9bAUAYBaRlenpi1SQEXdsSWIfzvFFXTLusx86hYTHNlmPA8gUYAoLQlKb+zhPPvLPJPRLFGk12+wRzNFao2eBRGaWvpwHPbw38MEoRqvJCpWjkVG3CPSxEf+86PfA+z2mmHVQpIGKydkPRPX1mLxqPMxaxoTZlV0ryV6DOuhevwdpOEnfeKgMtHr2XlrQkFTnpS/ySOsuf3c8CxcYsFY6LZOstZrRgA0zmMGXKsBeNirXHtwLoqfyaCfL2OjMsuhzUMitAk1KACg==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CPXPR80MB5222.lamprd80.prod.outlook.com (2603:10d6:103:1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 14:18:00 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 14:18:00 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 35/48] tcg/optimize: Split out fold_sub_to_neg
Thread-Topic: [PATCH v3 35/48] tcg/optimize: Split out fold_sub_to_neg
Thread-Index: AQHXxr94jr2aprTMT063zE72xOSBGavjycJA
Date: Mon, 25 Oct 2021 14:17:59 +0000
Message-ID: <CPXPR80MB52249B6C66C499DA72352B87DA839@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-36-richard.henderson@linaro.org>
In-Reply-To: <20211021210539.825582-36-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5bc5fac3-dff4-44bb-13bb-08d997c23fe1
x-ms-traffictypediagnostic: CPXPR80MB5222:
x-microsoft-antispam-prvs: <CPXPR80MB5222AB181A16492503252B83DA839@CPXPR80MB5222.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:546;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +94/UcGHS5SVBp1wFBR7WjonRzdV9uPSsGl02bStwBIzVYir/KjIU/F6Em6Ks6/NmvORvI7X/OESotgeqKHKxP+xyDLT0DYV5em5RQpkMRidYwP8m9WnQQeuTfoBrYsAlOCoQHLwnSLvSB+hkbvloLGN5wIOCPbJe1zsRzh9eHWgegPEUGcsCEN5CIVZiPBO0+qN0tN/Lp1Wtb7T+a123nmY4G2G+iljwYX8Qfjy7PFN65k74tRpF6dpBsckLCOKSpCDdPa7q1cQ9hON2DVO1tBogRl2OC7mzFER27+PY4mKedw1kyG1E3GLMKrAzJxw1OnQ+k1YL90GuWiJqpdll8uS+2sM4riTtt4NO7p4VXYcH6D2z80OtqOi2XSSUnulNdpqzxAVcGBFtlAdfO/xI3E0srOaYoQcsT1t8sVJpNF0Cn6T/sXNGIrBYNjMuA8otTKm41wWPFfVyu0fk79FFoIENcFB+f2p3i+OsJSN/VvICLZtZISRbTu2di6GbWXclubKbdDzQr5q4/Gx4hFWAP7HBy8Bjpo7ApBKOQKigCZgCSGuQm4xE7yLmatd7sy5gm0PetOGE1Vfk9qlT3l2jdinkFXQIIRgbzvjEGIkIn7dB53sZzkxfOsuhMB7Gu0cgDY+NDfmnZCLxKzVtooxCTjMaS+XKUzT/Jjva2ZwWuc+564MJyRXyBNv0tMZ5yCWWFK7X1rIrEUthV7ZJNgIqt4qu9dtt3VBoHW01tjgl7XPioWv6xRnIlhabxjKUIu679uQKOfRv+YOk32LzXNDL/jPyfoyNj3zMEcVXvtlQc0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(8676002)(316002)(5660300002)(110136005)(38100700002)(6506007)(9686003)(86362001)(122000001)(71200400001)(7696005)(55016002)(4326008)(4744005)(66946007)(33656002)(83380400001)(2906002)(64756008)(76116006)(52536014)(186003)(38070700005)(66556008)(66446008)(26005)(66476007)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?odcwLdGNB3rt7DVr4P/iGTcid31lvhRGL7GBKXBU6RgE45mb6nM+A5XDcRHz?=
 =?us-ascii?Q?xwp95F7EnXv1s8Od7Ap21gVLx6Y09xSODAl9SXNk8imUmqmeh3CFp8XwFsju?=
 =?us-ascii?Q?gdVsdD7b5OrK5MfYXhM5nr7YJY10ucrCbW+C59j1NM7mDc4uKNaRy9GvXt9Z?=
 =?us-ascii?Q?VQZj3F0TGdXZwP93cGZsrxZy56Z/1g3D5RazHyqEULS19tBX+Cg9RNnPr6NO?=
 =?us-ascii?Q?My8rX5WPIGD3lttMhq1cxrOSPlSByDpncAoxkf5eD53XJ48TqJSrhqTXhIE2?=
 =?us-ascii?Q?ScfJt6EDKF5Uu7iO3IMXamqcOCj+LlenfdmEY+X/DtaI71L/fdBzrEK+I7Ib?=
 =?us-ascii?Q?uZ9veCvex0x5aMmHeGq8B5J80zWngvkP37cR+vqOWZQoZEZ37afmyv4YRwLV?=
 =?us-ascii?Q?ZCNpXDdp0zsQ4D+DTiKTpx4vczwlVjYZRPJrehosOcGu6CaXeNeDqEG2fZVA?=
 =?us-ascii?Q?MAwkwBiN97WKpJN1eZ1YlMV8DO9Ci4rFuigDtrs+z74+8KbdLCcjdlQhdLSB?=
 =?us-ascii?Q?Ann1cKR+eUy3/PwfTuB0SKyG3EAL+TXMKiQbk47UqI4euwPVIbORctwqYli9?=
 =?us-ascii?Q?q/WpP+nDVP1TX/4pka1/P1/HX4no1CZoVtFZUapXhdh14jxMOdkwRCRD2yBe?=
 =?us-ascii?Q?j9Ka9m1XWEbjNBRnuBJ2hOrwmwjJYdOHqeLiJSLDBMQeJJKXpE4G2/kcUfbl?=
 =?us-ascii?Q?7p39G3RHsIXM3MQvZ63eDMknoDEnvLxRJxl+b/DaZhOSWrEhCAKssTk4Vvhp?=
 =?us-ascii?Q?yLzgZkXdT7r3escowY3nh/gkfEX2XdPDFU2fb5ufO9QZRQYRTKP3ZVUTBh5F?=
 =?us-ascii?Q?NFTIiCoiZjX9fSimg4lXbUANCrDIzN2z/uksEIG2sozKUMoMdoQLAwj4NlA4?=
 =?us-ascii?Q?Q4mlqwl3sQJZB7YB8lU9XYejDcwHEwtZpUpfyTvVoI6wWS/Anm2vA5jNhDFd?=
 =?us-ascii?Q?mtqlQHGhE6Tvq6/sxW1RalA4NzM6kukOKDDMN1IA9UNDtQ8+4Og/xq0sjwLh?=
 =?us-ascii?Q?iC9Z9DgIykmEEwTyuy5VNCIEUamMC6F9Gpc/1Qp+tlsr8UjdEyqciAT6q59M?=
 =?us-ascii?Q?UOsoqJcYA/sIHXDvS21W94xPWUzuMskvYsuN7a0AQMHrVdRvTnXZcukxW3PK?=
 =?us-ascii?Q?gffhZURZc4NFLUCPmAPZ0Aw7qNcWyitI6Uqh3zrvczxzfDCEsgdbIfVBzs5c?=
 =?us-ascii?Q?TFQaNRcgiyAX69cQRH9eyTuigfyjlMP+aKQ3iMLoBBVQky93OtI/fX3O0Joq?=
 =?us-ascii?Q?ALh22214Zi5AGksPk7d+pFWVLwh4X39mgsexXcGjc4SdsWHWx83sQRlzGt3/?=
 =?us-ascii?Q?WG2V6v7cxfPfbSes25RFU7j6mHHjaFERkHZW3wX9sfhrXNS0nOAnYssmSUhL?=
 =?us-ascii?Q?ZQHtRTgf3Q785cwu5PFMOBCQQT+vaKm0i20Qktp/99Cn34XNYoh1plF/mfeK?=
 =?us-ascii?Q?882VIdXreqx4UYnC1dNDWYWFh7iCtCI4xfN3mnsTbO5jTUIrL1K0oh9JaeyD?=
 =?us-ascii?Q?xpTiupXwuW8Jd2pnTxQA2Fyb+QsQGcUqqrY0ikvdC1Bg30YNUFuAqYue7LV+?=
 =?us-ascii?Q?duXBATOJoXgBWgkjY0jDA686LzjtW1Bz3+ij0vnljQcoCgXvAGNmL3wXTt3r?=
 =?us-ascii?Q?TQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc5fac3-dff4-44bb-13bb-08d997c23fe1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2021 14:17:59.8561 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CufcszFPR1tRXkQKI02LimxgwwUWQWn51l3w5Mv6kA6TWkgjMd0FtKjBz/Nl9Zkz3zZ3bgoaXqL4Sj6T72uqWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPXPR80MB5222
Received-SPF: pass client-ip=40.107.74.112;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-BN3-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Even though there is only one user, place this more complex conversion in=
to its
> own helper.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 84 ++++++++++++++++++++++++++++----------------------
>  1 file changed, 47 insertions(+), 37 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

