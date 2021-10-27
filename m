Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB2543D306
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 22:41:30 +0200 (CEST)
Received: from localhost ([::1]:37908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfpjk-0001nm-IH
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 16:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfpfa-0007hC-3A
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:37:11 -0400
Received: from mail-bn1nam07on2126.outbound.protection.outlook.com
 ([40.107.212.126]:2692 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfpfY-0007cq-8f
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:37:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kv/CgoM9IcvKQzxh20SycGGsVKNRZtZ7OLqywjVGBR8HPzhjKmJGUh5E65gGHil37vivwPqPGtwjKieqt0dG8OO7bpVJfDo+x1V8rmwaPVT6GxonHgp3VbI+s+psTsUfrGLTerybvOCDN02gcYzq3kL//UtB09vx7hvkAF1yJLDcYAYvmf4yqwOUqqqFjcCiZ37gL47wf//sXIpWoUVxjOoMjIsJlmTzKm/APqtrzMctOeDjr2+34cs6iZ9XKxOwQfiekVjyRkyZYrl2PDGNsIIvVUZw/GOFPOAXqLwdSNyjOsaM68q74t14KacxeCBAdJSPz1X3M61lWqeyBO+1XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1vji6UQtEoBpELOP/xHfxaFGpRF+chdu/nsOZ+tVnI=;
 b=Jt5BL+efPpRKz9vA5fSRC6Lt7kzS+3r1upwgqLuxfcAOWJkGxZC6/wd6U2XWDG3QzoNMut3s1YSUVdQHSPX89j92yf3jlL8KGxI5+dGB0M+43HKczk/lzzJQuYSgDr6isMPaQbRhjOfSKi5WL/0NYhCKseJW6Qx3djD2Xu0leNPdoi0jZj3GvG6kBuSz8v7xV8Ujvl61g8m7CdketdZVKsKGEb/MnEuYEUWEgcaxZgQgcYvcEX6BxfBXWaZ46PQUY4A0+M3CHCLcou3QEIhjXH/AkU5vmEVlfAF9mCsuNyvLhoW94T5xxXv18KWsDNSInHGw4n+LMZbw7ZPo2WV5ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1vji6UQtEoBpELOP/xHfxaFGpRF+chdu/nsOZ+tVnI=;
 b=cGaF9B5mmmk0nw1ZJSBTvVuLVTaIfKTbnVvIryPFVHaCLWbz/jO97Bi92oo0R+QhfJPcpizhDKBsXzsLtmbYukCOHmcTTJUe/YdEZU1+WA3K0WkFsZU6MNlnN6UMCWLEiRMkdeOMA1XF1Pf3EtJvfUdY7SvZ7ExP3+5eKcKaQUWYqDWcQ0Bzad1StwDtss8NgoI+O6FAEGZoP+Px6PdGbETk5aFrTMIVw5OFIhNFOoKFkQPnk7YIbyD/sosxo+mXHrsoOVXnqJij6dzYjTBwi54XlMwJ8ilITZMRTri4hLtav/Lqk3+A6e0VrO+iPV7bwNFwhs14sNsWyxNEwJVosg==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB3572.lamprd80.prod.outlook.com (2603:10d6:102:36::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 20:37:03 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 20:37:03 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4 44/51] tcg/optimize: Use fold_xi_to_x for mul
Thread-Topic: [PATCH v4 44/51] tcg/optimize: Use fold_xi_to_x for mul
Thread-Index: AQHXyr8Y5R4VN8UBQUOpWqzhWH87QqvnTzlg
Date: Wed, 27 Oct 2021 20:37:03 +0000
Message-ID: <CPXPR80MB52249222E24533B6BD6EFC91DA859@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
 <20211026230943.1225890-45-richard.henderson@linaro.org>
In-Reply-To: <20211026230943.1225890-45-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8d2facd-d135-4395-ad9a-08d99989890c
x-ms-traffictypediagnostic: CP2PR80MB3572:
x-microsoft-antispam-prvs: <CP2PR80MB35721A5DC91948E70B7ECC5EDA859@CP2PR80MB3572.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LGAHybXCwi9YSyS+EJL2Sil7bE/vz+JLvuxfpiNz6O0hiCqSkaELV0mrZrPZsf7Ivs9AkBIhoEM1ur3cVlCVGt+Rrrsr7ShkAqSf16iKyt++U6fk7Pchy84V0/RlEE+CBQ+JQK77Cht4jFQYpDqp/ZcxUlTo0hDPZk1RPrJ0Y1buEKLnettXO3n4r9rQJ7Jq2HLSx0ik76AnXBK2tIeyVEidBHFXLAbzFgfJcbT0qzeY2/U7lnLLaFnO5e65+vgsR5XIkQE+8dSrK75gwtZx3FO5mdrlqbteCMXAZwHlWRqxe6L7YlnOAvCal0yr4TVZFlUUajYNplui3bni/WDyaJ45SKpnVURRBZm6jI1gcOB5jjegTmzMikxxxdj2rGdQy/wfQEJylQ+R+KO2Fk0h+pbXg9u5opNA+v2bsqLfzvwgARRohqH2RZ39QFPKdl+V4fbwxSvuqrPSnyLqcPwDBA95jJs9NQFfDeu8Rxe4RhCptyr3/TnYd2/dAKNAYziQTH3kNT4pVbgHQbUl9+6KRjYbJ27LKRHrt7/nNWzru0+SbO5S9caR8YIWyx2ATos5pGFi6Gddt4LMhYhx4KoTh1AH7HYTLt/Mf7WJ0MOaK5mHkFc8AtpSREBwhRYh70BJ1i5BgpzrUygtKoCFpA/CrcUMH+PbZbINqWe73Nm09jQJqh1Nh7XdawWQXpxGpfmpfVRjGVgQSAOdNS2LoPh/hNr/J+s6BaLS55RjcJRWYOHLOcbi9vhc7ZhCgSDxNi0vZmIIYGnEa6HXuIaxXwHsp48dJQtSNcXd2QjFdPF4Bb8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(7696005)(316002)(52536014)(110136005)(186003)(54906003)(5660300002)(33656002)(26005)(86362001)(2906002)(9686003)(55016002)(508600001)(83380400001)(4744005)(71200400001)(64756008)(76116006)(8936002)(4326008)(66946007)(122000001)(6506007)(38100700002)(66476007)(8676002)(38070700005)(66556008)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Sk2TaQO1C0FFeGbrO+4ffimofN4fRh9HtXHtSd3+DHR71WT/mwg9mVleY/oI?=
 =?us-ascii?Q?sMCs6zA8rEbus7vD7M+nybFm1Tc8HZBlmo51BXhbZLsygyls6gsmtfjmKdo8?=
 =?us-ascii?Q?3B92GKiWIV8dyzwrshAE6dn5J7ThoOBzgceLwbZk2gCVqd1Ian4T7nGrzQ3w?=
 =?us-ascii?Q?/5BdEUbQV2Tq5hEZ/fAD09BlmFQmCJSIdSy2h+5EyHRWD27wZs9hNdWWz4rB?=
 =?us-ascii?Q?pdHAFTT12JGGUWi689R19uHCyeSegSb2pKgtht4djhiMSY6OnR4HonE/Dw5N?=
 =?us-ascii?Q?Cnp0ZEU1m6I+hJlADhx+0lKxROMMo0DjReb/qzW3QPOe7FIvzQTr1Y8k+C1E?=
 =?us-ascii?Q?7IX4zC2IibmsYc3MA5xK5sTx2tNHZbj1Jrv97MiaMc0/iZFAl1I1Aq0P8TAj?=
 =?us-ascii?Q?VvcHwvjuVs0Yr+6RfC5ZoV54bIH5YBTQfKk+PnysClgrehAGJ7HPuMQtkwyV?=
 =?us-ascii?Q?4xgc5Us42Z/zM6Pa/5LJ5jPJAR7hsNOkeVkdJZjS9L/7VOhErfrJzOIN1mkC?=
 =?us-ascii?Q?Lk/5MSdxl/eKtVyrD9h4dx98UPmR+Cm+oB6gb+RyGob4BlTaZQFoXe4PkzhK?=
 =?us-ascii?Q?jEyJhyPypcXEL9YjXwgTBw5xjFBA3aA1nc/+rAfjlnWLvXGhpP0Nvlyhnu0n?=
 =?us-ascii?Q?dbh4pLPK5MbmfYh9vlTdNewIgc8nDja9uqcvEl2Im5uC0d6vxPKIC0Fi5qSY?=
 =?us-ascii?Q?xqeu4VB5yc/N/TJs5l8LTk8avAcp4Zhr6ez+jH/MDk9BdmLH7akf1bZU/jkm?=
 =?us-ascii?Q?OWKE6Q6yo6X20TqBJDy8pyPiFSz/Kped0x+iOjOrQ2luIeFcCGnbpZfoJ0sw?=
 =?us-ascii?Q?Mvqd5gIc3kmU4Yv2VTfASHwwdFurLI9gMNzOkEOfOsSM3l0qHYZw4RGBDSfz?=
 =?us-ascii?Q?Aq/hhArcTrnFRISTZPKHPazSBQDgRVxF17igJKlhspT2qB35fa/aXoosEIeD?=
 =?us-ascii?Q?FL4v0F1lt/7w16+orJq+3PphRBqcmk70Hz11sQ5QI42ra1EKEqVfL26vlI1K?=
 =?us-ascii?Q?plJdLUmR5fQ+QlPirJVfJGcldtfrpPPgrquqXd5ieI/L2I2da2Y7TE/o1X1X?=
 =?us-ascii?Q?2IgBrjj2bp76go+b6LO3JoJttknLFQDkv01Ib3XeqKsLotHAktEYGmsK3q0w?=
 =?us-ascii?Q?aXVxE1FK80SJI26HhWztC/Fu2zaF5XF89hxa6jtVrhQHqswUkJvtySgG1aU4?=
 =?us-ascii?Q?nvh6j1DLnf8ITIm9BMTZBxM23cG/j/UrG860DL24ifakLGpPvWvyEolRlZj1?=
 =?us-ascii?Q?gCOfSOwKh0KY0Q6Tv0ln3oG4CbxWidgAsmnX/HCMBOT5Rqac98MYvCSsEE4J?=
 =?us-ascii?Q?pfL5ZBg9Nx9RsbV5rfJqSjLBef73LGn7h1GxYf877mv4Ly7HcDXmzD8MR9Pj?=
 =?us-ascii?Q?WESZhaHQc4A8IOKTOrYF8lBJNip+WNxETLUUCqsjpKG+w60Gmv4NPGIa5Iv1?=
 =?us-ascii?Q?FHLeIY9VxzlHJzo+14zYbN10Lo9xrYKM84MsBMLW1rNE/5OJrRG6mvzPJ/Qp?=
 =?us-ascii?Q?qbFHf/uBmUfwyc8PekqbEjaZLAcmeP1Z/zuJdY+z8D0qc1wZXn3EMIQzK29e?=
 =?us-ascii?Q?z3A8jNl75uJQr1Az14t+Nf8Qwr7yq/jRfyJ5wf6bCy2l3Fybp+me9dRp6dlG?=
 =?us-ascii?Q?1w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d2facd-d135-4395-ad9a-08d99989890c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 20:37:03.7305 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Js/iFDrKu23z/S3J3JhGbaiwI9uwAYY9AyRtKlyXggh1KocMjaMnNvrG6MvDMOfYu+pcDX0HN42X9V3g7i5nXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3572
Received-SPF: pass client-ip=40.107.212.126;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Recognize the identity function for low-part multiply.
>=20
> Suggested-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

