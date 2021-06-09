Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2F53A1895
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:07:43 +0200 (CEST)
Received: from localhost ([::1]:56340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzny-0001dA-UU
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzeG-0004sb-20
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:57:40 -0400
Received: from mail-sn1anam02on2096.outbound.protection.outlook.com
 ([40.107.96.96]:16654 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzeB-0004L3-Vr
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:57:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjE4ShloTQR6RQ6agugYfw1VoXZl5nTk6sV8fkHyZfXMnvuoVc2crtkJPXwOVYNs2Jo5WlSgPsHs75hE41zTE14ZQtzLz8inBMHEQ8Ey8HzeL1BjjCtHGXFFem9fhoEta7AQlhu6NkkkuUAsB/c7DXIYqof4rWvspH8JsbbTLMrw6YvlkUL5W4qwcFqoCicng7DtKtI7JPktKqenNTDVXyjUm6GokbvRW1ubCpPpusiMvVt6PQ60FS1LBzzC1qG0MVezgoQgnxdSLZKz6czpt+I7/V7ubewBckq+ffSb4QEmAaYdJ7tdnibx3/7E80hk7pp7dv6ALqS9lDhw4UsArA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voS3rPekujFg2BVnpyfNFGl4jIzJ1g7j7HXgvih4ous=;
 b=Xvfr+tCbeAflDJxKfdw3v/Bkop6gAzqCZMGyC6vuSMVRMFr69kzcnOi2fXEx80Hse+4cikusfo3mJW0bVkTsezoTbAHzgWxqR6Sh4mJCSwkDxnsk6IVRgIW0F487Iy+gh+asF4Lz/qwbp9lxI27SkzNwWHhcsmu3tJVLzrW2H0AcjOWzBKB3L37LE2zCuErEXjee85KOyQiYX/uxKSZyQp4k4ArrTrCNWfU3gJ7krAFIcvqX4lWo9qsVF4DgOR1H183Y/PX9Wxepx+tDGSWaDkD7YD9ov4iH3US5pVPFn+WwxWJsOaBWDApIDz3Mm4+Tm0d0HtfdrgEjrVmg9TRU1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voS3rPekujFg2BVnpyfNFGl4jIzJ1g7j7HXgvih4ous=;
 b=SOJMmQW5R6AahBIabCBefp5lDvdkrS7ATReSnGQFSHXfpGIWZ0oGpPmOiLrA+wWHeq9day9t0falofViADdyXkh+cWR4/OlYXUBEpnWAMnvOVLB+OLYz6k3A/6EY7dnc1Fnc0cOj6/wQN3n8aYqwgDRxo9iOnh65vveKo/Vsz42SnQDCI7A55WOkkOkyX9YrmktWFgjqFJTFv1euONNIWjz4ZEayGTpWFcR9AMTtC6BctRBMyuZhNAml6/8OtJvxjk9Cbr3IlDJo40w0tjmBSJryrzXC8VugiiqgiSwVzYn1SCifgRLMSBBPJuplMbxUSH+nTzFJI4whe6nS3XsvOw==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB0017.lamprd80.prod.outlook.com (2603:10d6:102:1d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 14:57:34 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:57:34 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 07/28] tcg: Split out region.c
Thread-Topic: [PATCH v3 07/28] tcg: Split out region.c
Thread-Index: AQHXP6s/NHzGj1TWtUmc7uUQ3GDF6KsL+pnA
Date: Wed, 9 Jun 2021 14:57:34 +0000
Message-ID: <CP2PR80MB36682EDBD2F7E27D738E6799DA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-8-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-8-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13b3252c-76d8-4e20-6061-08d92b56ea2c
x-ms-traffictypediagnostic: CP2PR80MB0017:
x-microsoft-antispam-prvs: <CP2PR80MB0017234EAD3D4BED10D28B62DA369@CP2PR80MB0017.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RC7KnaSJ7RNGkAtBMlNPrgNlDFLnDpsnSPmb7S3I/pamR+acMFUjVTm/CIa1W4ap8M90giGDqYXudOLDOflmW97K/7lZXtUw0ZxRvKos6xiDYQeoAQdiRcvakwFQp9OMecaF0hC2ddL2vqLONec4LAxcqcErvs0PbczjRBtVHWchWal/aKHghCy95sVXHE5KoU83Xdsi2C9OUBoLxRNOKwRjzQmXOdb7OOr+79qelEz6xObva5W07A3rUd6VvyExxqQ1N8j+8irDpDy++/5SNcNOGtp48LyQ9liRJCpp925Fjbg7ksnNOnA2bSM+FhTbgOZQrVf9/nxbn82jYluqfHq2WutCmVmR1rjGb+ihFpxNK6UxLZku6HxcZuVao2imbvoLKqLnlkVDi+qSBnwoMzT8Au3eEEET6YFUJQjAHyyDfK3Pha+TRpTFJg2UioTQDSL2VR/w2E7hd0BHZyvQut3LdmcgMrfBDfbEdUn7YqEkFrSJMVdU2VJAPGIx+FjIStxhBo95txHiiB8vjWoUDPyyMWvw0/lgEl23aJ8McOwIUfkwqwBP+VRpkIToUgnf2FlzKmgG+YhQT7/K5cMW6rJIQF63DzGQ+VPtWS+0v8znhlR64Kx+5lY5hspuLrZW2uydaYkHW2E2oXqMzNpGSFtiKt4+VHLbCjald1UIdTShxC7PIy2fzqVBunLhHMNh0BOyFZf0zAVyfLtWTa9W3VXAEHskcUUre8FTclRxx7k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(396003)(346002)(136003)(376002)(366004)(122000001)(86362001)(2906002)(26005)(8936002)(55016002)(4744005)(5660300002)(7696005)(33656002)(83380400001)(316002)(186003)(66946007)(66446008)(8676002)(110136005)(64756008)(66556008)(76116006)(66476007)(478600001)(52536014)(71200400001)(9686003)(6506007)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?hvxj4R4xekaN3EWP0S7zg8tGQhukFWOyl8L4H5OzYBUvpCLRAMR6RIfDb230?=
 =?us-ascii?Q?DMMgPBztsOFRcC2IkgrEk6utIynOHtTcDaAsNa4ecO0Y1XPgXrO8Om0dTgAT?=
 =?us-ascii?Q?xVAttZIrpDgudkcW72UuZ1qN7vpapq0coKrpWB6XkxJfRMYTXRF8K69Bxjez?=
 =?us-ascii?Q?ggRGSp1CN29y2ri4KBSWLCOBLwBy0vzzFoz04ALW2WVZaXyg2jDeRGrFiUAU?=
 =?us-ascii?Q?ZNS98Yn2q6dYQU8J//NX5vbq3QvaHihUiqf7N68Xf1a5+no5M41mRZWRdbVr?=
 =?us-ascii?Q?Tp3kbqTXKyTfXE1IOSSwZ5J3M62Rr5Q2aVpZraov34dF73DFE42qcVJhp+w+?=
 =?us-ascii?Q?XhUhj57H+aIKCHo6cBGRrQ9dshUKaFzepfrdqmsDaCgHmor5UhGaquy6XxPz?=
 =?us-ascii?Q?yLDB/NQeOn6pGIMUcPuGcqoecJHFf6H7acBx9QQnqdRQ+Y7WqmIB8A5+De45?=
 =?us-ascii?Q?IYvufIoGLRfRt8J9SJRNyEeZ9C+woMq882pLAPdK/7pkUkAfmDcQEnsbxmCz?=
 =?us-ascii?Q?n+9kKBECy68lMUTMJxDgbCGOdq458tIu4QDOWvpUeyvnM1+cpalL6FiO7fCT?=
 =?us-ascii?Q?JfGQB0dOkAT9nfXlSNUcI1QFhwt4IeUeZ6gU8CVRgkbn8W3+blR4ztutCk3O?=
 =?us-ascii?Q?vc6Dy2tdPCHdpTmLSLiYkYhdHODZ4Bili+/iXWQCa8VsQ8b6FHyX0ZKP/wDJ?=
 =?us-ascii?Q?fDbK3T+6S4YukwOBzt1dfZgvvfzXJQxzv9CiEsCu7Lnu43ynfckqkDbaUbek?=
 =?us-ascii?Q?B7Ljnp0T+cMf46z4NxjARmTlnYrMKyp9Rn63/sCW/8lXdyfx8XBCbJ/44nio?=
 =?us-ascii?Q?XdQGsYME7qrowmgJEZnVCmI22EjTKqxHpyJ3MvMq+0lCfa5S4x2DswxXcl5U?=
 =?us-ascii?Q?+e2lDDg/62DasUKnlSSC+61/kBuQcXFEDrkTa6Fgjt983ADx3STDuv5h22CT?=
 =?us-ascii?Q?/C+6Rh6Nuo2qstvBB7dUE7Fzs/+LZqo7d3IOzzylHFpJXJBg4ma6v5FbHWtn?=
 =?us-ascii?Q?eYlCt0cghGxqFfXEZO5GqjVqs9lyzyrGzd8eQujqYnVZl69G/3gXHbeS82Zm?=
 =?us-ascii?Q?nqrsE+vc4qbpH75a3Je/Wv+2vmoDj1ZhInVOrGCtyODQ1rl1e13zyxf9MFLP?=
 =?us-ascii?Q?wlOojpxqF4KhSqlPkiG3ehEs2kSty/UmGOJuH8osTJs7GU+qwRMnd7sAL5jY?=
 =?us-ascii?Q?SKL6Vq6ythWS/WFBuOkIVUenjliEE2jIr4X+PiRYHzkUY5iqyJXvW3heHRGM?=
 =?us-ascii?Q?GLMQtlhyegC4j1zey+NrYsiX4q8vSO2OYKE609cwGTJJNemuTvusG20DJjGi?=
 =?us-ascii?Q?GW3JRCRZcxOvRS4dkD+Bz+bi?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b3252c-76d8-4e20-6061-08d92b56ea2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:57:34.4365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZaQyQ/kKrKu0DQESVCqwM1l1tHN+cTgbeGMa6/3EEgX08N4UDBWc7Cq9tKhkTACEIhuv3QjvFQOxmYQDt5Mpcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB0017
Received-SPF: pass client-ip=40.107.96.96;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/internal.h  |  37 ++++
>  tcg/region.c    | 572 ++++++++++++++++++++++++++++++++++++++++++++++++
>  tcg/tcg.c       | 547 +--------------------------------------------
>  tcg/meson.build |   1 +
>  4 files changed, 613 insertions(+), 544 deletions(-)  create mode 100644
> tcg/internal.h  create mode 100644 tcg/region.c

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

