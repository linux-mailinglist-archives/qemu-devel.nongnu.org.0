Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303B5393593
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 20:48:38 +0200 (CEST)
Received: from localhost ([::1]:54198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmL3d-00041s-93
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 14:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lmKzN-00022e-3X; Thu, 27 May 2021 14:44:13 -0400
Received: from mail-eopbgr800092.outbound.protection.outlook.com
 ([40.107.80.92]:29126 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lmKzK-0008R4-MZ; Thu, 27 May 2021 14:44:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZDblp/N6Wd66ynnZkNMfIu2YEfbJ8A+G1Lho5vX8KtctOvld6p8ZsOLnoWu4voFCoFnycjXIA19N0Uq1q88LP5ydG5woXCOFucl+r7H2O6M4Tc2+d32tNaJ3fC5yogQ0MjcRcU84+Kpjzfbi+CW2H06jYIdQZrGsLjqz8vLrihOLHBcv8lFliS/3dwWcqbE/1TxIO5RgwajUbWofsxPkeh3haKyYhTDR4qfUTq3ycmBigdGVWU6/zYloKk9rKiAGttjy4ppwN11mA+CBvw2i8S3LInLgUulKm18IheOsSJrDavu8M3nWgs8OdOw5jTnj3cXurTIXCUExenG9bTm8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5EY0F8s0dV+GgFhMb8JBcYkv2iw96vrsj79plwCPcy8=;
 b=U6slWWv1DWuz1BUur+BhA58ts2pnXX334Gk3FFkX5l4e62YhV/LkfuguD3YZ0kRlznA3oUS1lWRLAg6pd5e6IRU19U7n6erkGDs7kOUoFlZ1LsVZlsIdLHcc7mX9DMAdWXo4wgpWMAcbUZvcjRGgrcYlEr366GJEkEfRxspNvyjHDrv6afCtCtoG+qlkdS2a2z7PMPMjQrDoQBkUK3G7DO4CU6/27/35lp97VxM7pTqisj/Sq0OJC3Gp6715hiESaKgfl9sDbTsj68M9xum2HpgaFRudt+7Are2Sr/dMhsPfPsWoyLfEDkdt1TdsWw8BCgUNZd5/mkjjplPhYsPdnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5EY0F8s0dV+GgFhMb8JBcYkv2iw96vrsj79plwCPcy8=;
 b=q3peaGDRmEO/Jb5PTD8hg/l6qdcSVjNL9pY8oTFiXY/G+XfVstBTIcyq27Mck7ubpL4UThSAD/IjBfz3SOATPg+fYyGK7wu13wgoqddih0olnQxzmQfeR+wqyNByN/dF3mLeAPRJQJxzF8xSnIMABNWsvS3UvlPIbXHGT7zR0+dFe/AfiuAY6uyds9eeObSL1duHwTY2sMpy8MEzUOlxhw/NUxAPM4D8qUE/q3FxeFAnO3C8HeeRx1w3frNwCrftDwWVFPmBmTbUyMzREDRPTevpAwyrQvtMzVN1YyjvSNaaqzXleuPbtNhPaIcQ2Bc3ZrX7Hu/OyPppP7TLfvqmLQ==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB5924.lamprd80.prod.outlook.com (2603:10d6:102:d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Thu, 27 May
 2021 18:44:07 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4173.024; Thu, 27 May 2021
 18:44:07 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2] HMP: added info cpustats to removed_features.rst
Thread-Topic: [PATCH v2] HMP: added info cpustats to removed_features.rst
Thread-Index: AQHXUyGtEfjy8OhdgkqVBFMpwJ6ZTqr3qd/A
Date: Thu, 27 May 2021 18:44:06 +0000
Message-ID: <CP2PR80MB36680195A46D838491264CDDDA239@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210527175602.40163-1-bruno.larsen@eldorado.org.br>
In-Reply-To: <20210527175602.40163-1-bruno.larsen@eldorado.org.br>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: eldorado.org.br; dkim=none (message not signed)
 header.d=none;eldorado.org.br; dmarc=none action=none
 header.from=eldorado.org.br;
x-originating-ip: [177.9.76.236]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0a7153d-63bc-4f30-de02-08d9213f6888
x-ms-traffictypediagnostic: CP2PR80MB5924:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB5924E01F067516A2331CD495DA239@CP2PR80MB5924.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1060;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SwL2gahugqDNjiipkZrRN03by1kNYn2ux50qcYXFe7gHCJJ6f1WpEnEFjIYEqLRqFChLtKhaq/e3G8ceC0+oMG4nxdVvrg/QSs3ZDCpFyeLuSsOs0G7b56s+xl/z00WnbwIRW96UtI44ks6IX9JNHrfP09TWWLLHjRY8ncaXeiHNusWXbqQqD/H/ctmSfqJiyfCaVgU8Lv4b9fMVmz3CRuXaIbNomYo7LUSdkqTAq9plXmQFZaL0M2CpscPrGqepbaMYtrdi7MEIf+KDYkI0huY9frYDBbUGq9+7MLrbMSCp1ARKDJJwpYDJl6hR1/SHs36lCjkiZL5q/V6y46R5Y0QbFODutQMjeTsYdOqiQXInVF4AY7L8muKb7HUSvZ4Tml1yjpbxSmYHRXyevG35GwVIX5SDFY3YM7xVI8e/ryBM+jNaC/ocDYEsN7xtton2bn9Tigh8EZoKq6nvfAskQ5ogzccyfpBqBP9pDzopFbOifCr+5ZwbTpN+8ioEv8CAnGTwWuYqUgViks48TBd4WLlpjHNfag8NnmT+escYtWKOVe2yhvrNHspg9SjPbRA3WTu78FpmmD/eHjjr6RXISKykAdxwVsJVu/y6Nd3lrtLTUM1ROskpDtzN0lDCjcscMu3N5CJO4W/PfzUVb1HpdXQ7RC3BHoaoDVfEPvF9NsABrrpagmcj64rdKKWW5qkFDeNfQgrOVrWws10jof9oQrF9nj5xbhW8UDhaB0Hk5VA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(376002)(366004)(346002)(136003)(396003)(26005)(7696005)(478600001)(86362001)(6506007)(55016002)(186003)(2906002)(71200400001)(9686003)(33656002)(54906003)(110136005)(316002)(4326008)(8676002)(8936002)(4744005)(5660300002)(52536014)(122000001)(66946007)(38100700002)(76116006)(64756008)(66476007)(66556008)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?L7wSb73Cg6+rzTd+6SNtGoWxJH8r/s3J7n02egIA0ZsXDMB80JY4Xa2RnEAB?=
 =?us-ascii?Q?E0n5jr9lGTSTF6r2vdsgmeu2vBTDSIV4eSbTLncqDdvuleUVIxOudS7CzNjo?=
 =?us-ascii?Q?E8hMkXksO7nGV5Cuk4UE2YhlzktOj9qzRbZFaHNM0XZ/VUnqiyrvqVb17WXG?=
 =?us-ascii?Q?X70z2IryDltTBdkS2ma4906RqJX9TPC3cQDim5zMadPtcBOybAh5N728sg0E?=
 =?us-ascii?Q?smIpi1B43KFIlkYIVVQfBfqouZMrjvfkb2cWr73HXaeDvKZSWsXnTtkfAAWn?=
 =?us-ascii?Q?3itXsAJ4dDSpnrb5ARsw0aQCUxScR4cszH7R3KpRDMDQj1UhFVUrM4YRdq6u?=
 =?us-ascii?Q?I9UsnkEPvnYdkXIXAVtXPjVDWaqWl3RvPesFtdjSgYyPT1EC3T+MLpXQJf7l?=
 =?us-ascii?Q?imi4kfzLvwjXPVErcdLBOiXzbVG7w1ON0jT51GZa7RtRIPLjHg3xroQKwSlF?=
 =?us-ascii?Q?qowNCRQbdKel0H045Q9KfHbZwnOwZs64Euw6pvOwHFk0Qy/wUg+bgfnEgrTp?=
 =?us-ascii?Q?lX5gXct7UnAsr4hz7ig2znSE/4Hnd1bVW67O+TS44rBJ7LyNRU3/D2XEX53x?=
 =?us-ascii?Q?COZ5LEq6Tji240mT44/eRvkAozdI84vMJcjpLtWgaTOLulP/GFA9JXrt6nFi?=
 =?us-ascii?Q?I/jvPesWeFMXYxlFl8oTC+IEXVAXxLHhirgKrrB25OozlVvnQAZSghaUD+8c?=
 =?us-ascii?Q?PuUG5qEyS+exStJqFia72ZjfGlj6WzJoplx6qpdmmzIALRag8Haf5ISHXD73?=
 =?us-ascii?Q?0926Dko/VjZBXLJ0ZCnj8SH6VuURcVwgiXVOY7v0MVpgM1A9g5lPM6I6aTwt?=
 =?us-ascii?Q?jlAyzXQMFYdHHztreOo9IcOxh3qYdpmAw4dw8K+HHyb4IRlyU00SphEp//rA?=
 =?us-ascii?Q?OrvUjr2Xf/6MQxiAGT+2EZysYz1ID5LBvCz9oKryZFAbegL8SoZyKM7+/wm3?=
 =?us-ascii?Q?fZoLz/BIWXQnShebXNqvUXAjIPo4hkK9m8U08B6LOXDb9m/TSFo014WlCb1T?=
 =?us-ascii?Q?Zuc45BO3A0CXbTM3xAmy7AQWgELexYRVzwoACtYYfeEtwI3j7xmvTvrCdt/e?=
 =?us-ascii?Q?VnJFFk7wGgovG6aICniXB96Jew/+OSOeOOz0PRRCd0RbK4wosCjO2862ZYgP?=
 =?us-ascii?Q?X1R85LkwFuA8smuiqq8kJAhyJ8wL8kXu7t6UKMuwZCOFy1pvt4LgggsOrWHE?=
 =?us-ascii?Q?sB7KnzH56VLmPljqOtQGgr0bwywLVLQFT0YnnQ/tjntZM/mRW6zF6R1uj1qc?=
 =?us-ascii?Q?LumryfbVtn1i+Qj6naj3us6MMH7qsJcj8nAs1iynPlYqjkXpfDT5bKoXvnMZ?=
 =?us-ascii?Q?6CWa4lX6n+Y4DlSQASbiAXaT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a7153d-63bc-4f30-de02-08d9213f6888
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2021 18:44:06.8553 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +QMAGaysQ/FPHkIAAr2HZPCqy4oGc/4tKzovXto+tLLMSAlzUFlaY+aPuvvIWYYyyAHsLNSDl+YL1bwOpAgquQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB5924
Received-SPF: pass client-ip=40.107.80.92;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-DM3-obe.outbound.protection.outlook.com
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
Cc: "farosas@linux.ibm.com" <farosas@linux.ibm.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "groug@kaod.org" <groug@kaod.org>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> Documented the removal of the HMP command info cpustats
>=20
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  docs/system/removed-features.rst | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO=20
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>=20

