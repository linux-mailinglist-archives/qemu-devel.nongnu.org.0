Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D1743560B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 00:44:37 +0200 (CEST)
Received: from localhost ([::1]:52746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdKK4-0006BI-Og
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 18:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3a-0002Gq-Ub
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:34 -0400
Received: from mail-dm3nam07on2103.outbound.protection.outlook.com
 ([40.107.95.103]:43393 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3Z-0006qt-9N
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyNxN8NlrbZcp4AiqxBakvKvS0Q3ybIas0DmUbtW+aPq8cFu+UUjFwNaWm11Nz24/Bi8rF9i772vWwDwfHRwRP4f3+mNR3N6z7Y1+Zd0m7bX0972QrTrC0RdPKx1w3qCeHxIoSBRVCna2RLuP2kzCNAtJqxBsJjzP4kp1lYINv+6//uB6iHTiAmF2Um4CGBwmA52Aal03sl/cVw2giSqWa7dILbOu0pq8ypYu98MGOHm/3yKgdtdcDRQ5FUDuBXlwemRTYUPCPpl+jPAqe9YxOCGiimmBaXPUUe9GEx7v76UN7iUC/feQ6qyPWSYQmirl4qamj67KbX1bMhMArXaJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOiC0OZsM4FhZw4lZqO2JPKuRrPSgDIXGWYpYisTNUU=;
 b=AOXrNnrF9000s2nAidfscR/p9wtzNs2SpXrEF1Mb8qypGcRkzHvTAgNWQi6zOVDFzegKhkrcwPiFWvarloeX4I1MIz8nvq4ylrTLPPhL5uWQ2lGXDuUtQ5XDiOdaMpHSyxLFUz2kz1RzAQvAPAxuiKSUYzlJ5MeFleX6rcffVQw7jg3KxQni+/jjZwGBkt+zlNv3PVlPCfrmak2AXXCuYjWXaPzARMV7cYXwUAnrRyjyu4BvuE5NTXhUNHjRj8JjFpfvgNI49RczBKDOBwGv3LqBwH8MBZjhhm2aWJwXXEQEooPJt+tfrjdgympSI0QgteiteLFLQ3TKG91guYsXdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOiC0OZsM4FhZw4lZqO2JPKuRrPSgDIXGWYpYisTNUU=;
 b=ZC2F0cEajXcYX3+r0Ec848C1WGNufybuKKBnSPGaEkWYvi+67Oj+aeQuTUna3nH+LtAVIdbCahweSEWrN5xezPVG4AsCJkLXktvM6zHiM4d0UHQliGoHmkuDpIGAOpVMMWjjTR3zvoM8XwH2FeZ75scO4KruqlL9uYevX53YKVJtVE5V44Cn1h9ebOffFiqAU3CCsq9DaCgYTqgjcSjZfD1zpPJu6uZmyFXx0PiwTJQCIQWKPlCmtIJpZI4ZBgH9BSJ1Cs5sbzLKl5c/cJMaAgs7yH9rxbJEqqIpX1k9TzGU+B7ap4BbObCn0vyudxk7bLdgedIMipPzMAhwqBwvJw==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP0PR80MB5315.lamprd80.prod.outlook.com (2603:10d6:103:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Wed, 20 Oct
 2021 22:27:29 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4608.019; Wed, 20 Oct 2021
 22:27:29 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 15/48] tcg/optimize: Split out fold_const{1,2}
Thread-Topic: [PATCH v2 15/48] tcg/optimize: Split out fold_const{1,2}
Thread-Index: AQHXu7iTmU3qb3NMAECxmjW4IqxMgqvch5dQ
Date: Wed, 20 Oct 2021 22:27:29 +0000
Message-ID: <CPXPR80MB52245FCE58FCBDF1D5B80A99DABE9@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-16-richard.henderson@linaro.org>
In-Reply-To: <20211007195456.1168070-16-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aabfad99-26cc-425a-32a9-08d99418cd3a
x-ms-traffictypediagnostic: CP0PR80MB5315:
x-microsoft-antispam-prvs: <CP0PR80MB5315C641C8DD7F9E1E9D7924DABE9@CP0PR80MB5315.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:530;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LFY1Nn4ojUtMkr6sXQf1nschSd10e8GyBDklz19dnkt5HFHogmrXY9K6yOLMzqaOhMPg+Pm2PcX5K6MufKGRqMWBJE9+hhjrlBIyx2FdEkluTDqG0c0NkYhPbdhFF4Jg47VrD1f/CMYTxgMz//yI/CwuUuHS7HI3pNC/fiaEPDK8cei1KmH3NzP+2IgpBLVk+WksXECD4J+GlIXSH2GKRyxf2SUl6IKKXXM5B0Rd4L3h7nw/UhWne4nhMMw0X43HvzwNkHo4bk5n5Epi7d7d+Y3DwyQE/p9hjnsJ+5ZJf6xurgDAn/KV5BOUl4LD07sCFq0ejx81LDQhq36Rot/b8Uofpb6sOK1Nm9/VS8AwvkdZw74aeKRxC6QKxiYI4QRA3lFC6u/2TSJ4j+wpT7sc89wE9Isp/NeaqG9JCv3+ffWkmRbD3DZ20oqxWjlKhsHl4OJSAUmgYhwABpXkxlIxD97mj3xwwRCd9RpW2lN5Ucq0EKq9e1l7e58CQqUxzf81AZpqPbnJK2BG4Udp2rNIYQrI3guTjbSyydnWzEGH1dlOarjl7xSBfJRTLkiWN4r1RtDyBx5A2tIAG4ciQaQZlmpb2pqu2g9QsqgT4IqTtUM7aFhyU/0ZDlYRZS7rN/EwsBaGGsGfsKPc8JgxwfIhy5vg8JzExIzV8tp7dGI+rOYDBtrFyssOsY9ZWW2IFYi2WwXO8CpLHvNbciovsI23WNNv0gdfoil0QZ7uMoyY+FK3s0xiMbJjkHag3PLkJQF3di6GZNZ/OAl65QUPxjxC4B0OFbN0Ak5tB+E3JZuAmFs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(8676002)(86362001)(7696005)(71200400001)(2906002)(5660300002)(8936002)(38070700005)(38100700002)(4744005)(83380400001)(52536014)(26005)(316002)(33656002)(508600001)(186003)(9686003)(66946007)(122000001)(66556008)(55016002)(76116006)(110136005)(66476007)(64756008)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q7ZR/6r4yXK1LJ3suIYXjcMHqi9NwWMn+cguPZWyn6ssQePgMJIxx1wF0y3H?=
 =?us-ascii?Q?paDZ7jgH0ewYm/c2iQfYylH21hmNH4bOOPhqsY8ZxkYTmaHSG+AaVpQ6NEk9?=
 =?us-ascii?Q?FkGbgiw68SuYX6rT/RtMy6B9Zz/cFXFEdW5dZz/7qf9pMvKPzVzMs6NP5im1?=
 =?us-ascii?Q?aywvNg4FDdfyEhgXhqXlM4ywId0YL5Z0jhZvMCpfyUEpM6ilBxeF4WYgPFaO?=
 =?us-ascii?Q?sMenPvW1HHemZdeAFQpQ/NgMuZChZvldmHtMxysJW6JR8rwZk8UpvLUY6dub?=
 =?us-ascii?Q?4pH/W3TWSgD1oZ69S1yLenIijLa3NfPQ45y/oluXmAZWPIqhWw7MdgUiKrQ8?=
 =?us-ascii?Q?FuE8SQaNWIIHnWl7SqIi97Py4Y2fPyDQWq5vWlxYzta+Gzg/8m2a0Ru3YFrs?=
 =?us-ascii?Q?QWBy6ELZRAXkgWN/d5xl6yEuTiNUDnVYwj22guaRDN775MElfOegZtjAcuBZ?=
 =?us-ascii?Q?hRGaVYoJxALRcG6gub6jjB4QrKXr4GZXGpySFfujy4mmRcvIVTD3DEoAyDKf?=
 =?us-ascii?Q?OyUwy1zGsjfrcFV7ebVaWi4sffATLniHQzqVMB+gTyLCTowcokL1NeugZ56W?=
 =?us-ascii?Q?xvuuKPKQ6RI+yCy7J0Xngp9qizfP++CGMujLY9eLiDCxfHfjgjpmHLtUAZGU?=
 =?us-ascii?Q?ZgsG/lsIibneo7gF+I0iiIvI8vZAXBXHQlVMq1nhfBysFEDltbEmL4y0ne+9?=
 =?us-ascii?Q?M3EpUahp1LI6htRLLxYbOb1cnizfSDrr1E6BWZQlUuZOW2f+v/nnYTYp5+O9?=
 =?us-ascii?Q?lF7EEKSoYqsz5YeNh8NceonaRYNHIPXr2RplvXz546WiJvrvLWy3heHDYZi2?=
 =?us-ascii?Q?j13Ek0ALoyOfFeopn2Y50sP+9MXjS4BudNOMPZhwp2GLQWkYp3qzmvm5oaiA?=
 =?us-ascii?Q?kEEmY8FVEz9geovLihGi4F3Le+2aQexA003IurCblJ5isgWTKtt646OiKL5o?=
 =?us-ascii?Q?A3FwhyO/TnZ5rxoZFdOHfLhtJ4SjRtsejcYY3nuF/+aNTa15L5zQB/LHyI/P?=
 =?us-ascii?Q?OiyoDnEUOHyye5j1kL+nccUVaHxcA8EGuN9BLq/P5qpE+5nauHFRF8Ectszt?=
 =?us-ascii?Q?ZCFs9kavoHmyBM4E0a7yXUSC/DM3FXtEhsFu8C5WqYulycF2AoSdDnhIDtla?=
 =?us-ascii?Q?4NzBOZGfP7b6zjyRx32ksn03eXMkwIONNWKSrMAzxLxgq9UjOyNeebjRv7e6?=
 =?us-ascii?Q?I0W1DTU/QzXbgvfKfs4Joy3vAKYktBkqBc5WyJdCmVjZExTGxZjScspzyKtp?=
 =?us-ascii?Q?Z6F9mbTX9YAg8PwE/Pv9u1j/GYLGYyJIaKi48uCy1rIbIBBsonUTZ/wKGasG?=
 =?us-ascii?Q?PaItDR0NwF3zUEA5OsIZiHOI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aabfad99-26cc-425a-32a9-08d99418cd3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 22:27:29.1156 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP0PR80MB5315
Received-SPF: pass client-ip=40.107.95.103;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Split out a whole bunch of placeholder functions, which are currently ide=
ntical.
> That won't last as more code gets moved.
>=20
> Use CASE_32_64_VEC for some logical operators that previously missed the
> addition of vectors.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 254 +++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 202 insertions(+), 52 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

