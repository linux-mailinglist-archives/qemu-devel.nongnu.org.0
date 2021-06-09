Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D52063A18BA
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:11:10 +0200 (CEST)
Received: from localhost ([::1]:36804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzrJ-0007UH-SU
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzfe-0007br-OC
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:59:06 -0400
Received: from mail-eopbgr800129.outbound.protection.outlook.com
 ([40.107.80.129]:6076 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzfc-0005Qf-SN
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:59:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmJ1mQjp6qoI/i+K7QohLDaY9XEXxbEKBiNhho6BU8r/ynBRLbH/vu15/BeX9JIw5NEZdSb6tg5SPuWJWT2FP/K2bGmUmOVa4NM5/KfD1DA4447kPjw/ALWpcSwFsYmC/t/ppfsEYK5uwtxF1xv+EuOXyKfV+oDJsIab0SnDKHKqE7fPMv56fx3VwTtGuaNXm2nwBYpJtwv/lBmhhhd+YZZZRU1gRQgYGFdscg23B4b86upffviSaUlVWgf16XOtmPgQg3IJKnBl3AVcBuCXGGuztiIcnf7izplN3tX5D6btFzvH/beOaUpLooSZEpgSDko1sdL9+wo5r8z5W29Fig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piWpDEgB5eb3zYxUg5inzLXr3kBOvoH8gUG5zBw0CJw=;
 b=M89/jlKxr2VKSYJRB46T3Mic2Hxriz77zWksd6hmp7doOZD/7h9Gago7doMAhqrAvqazLrrQf/sbohpTD4GiNgVHkxCVILDZ2ZDA/6Q/DoG9Rhrvz3kg79AT5AsP31+7lHiODyMq/LsA2PNxBlLr0RcvgvY9e1figf+JBgaRstCLxc0qBR2LmGni+5bE7K0bUXai/sJEVXxqX0bCNcxoITl213i44H3ednMCM2uJeKP6xMaAcITdJjQpBgZT4QxX+o2VfmSwWR90l2ELVNdFCrihw+B2G8+LEoR7uE6u+PIu+E+Qdd5s3iDoGzuMJBzSDmSQzKKFKQD7w01nMYnVGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piWpDEgB5eb3zYxUg5inzLXr3kBOvoH8gUG5zBw0CJw=;
 b=cUtUx/RwZQAQmJWyaKm7Kv6PyQ6q7lBQDSRK1p7jrp5Nl7OuczyJ8h4Ip8aUWCoZqZEi3WWZQ96SVVXvEOwZXL3EsZXikWPI3KXyN2bVP+KQpusisR/x/9N4py9rBo1LiLQRNa1Iu/UlkqOvb5wESPuTJZs/3WTVIiRi+38g60w5yX505qzz/hQ5x/cFJAKnveCvQyTtWx3vwC2mrHAhBfjlYJdq/xwVoXyfPVFRDXin44T5mMpdJ/dDz+ksmOV13sBn4NFJshkOUT0/LfuXaih1lfNmUIAMp/nhWa+dv+1629mC37iaA7XH4Zvtdszgj7HWqdt5YeTGAl7zGqVUGQ==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB4484.lamprd80.prod.outlook.com (2603:10d6:102:48::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.29; Wed, 9 Jun
 2021 14:59:02 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:59:02 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 19/28] tcg: Tidy split_cross_256mb
Thread-Topic: [PATCH v3 19/28] tcg: Tidy split_cross_256mb
Thread-Index: AQHXP6vgsFMEyvPdy0abgIJ1ZzVEvKsL/IjQ
Date: Wed, 9 Jun 2021 14:59:02 +0000
Message-ID: <CP2PR80MB366803188DBDFF88FDFB6BABDA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-20-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-20-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ff35e87-a2c6-4f87-4d68-08d92b571eca
x-ms-traffictypediagnostic: CP2PR80MB4484:
x-microsoft-antispam-prvs: <CP2PR80MB44848500BA80414A21FD5054DA369@CP2PR80MB4484.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4dFsN+cvnBltUgEu5GFbhSJnau/H4KEW/BRP8yJ29LEROM1ZQ8VQWvabAVziE4DB8toG77zbssP5PPg8C54AQMvPGMLK0/PPkpHJGhG/vkUyvg0gY8jYYdo0Nc7W479o0heHDQ51o98C/izo38OuSnqbHCFgXek+1a/lGRo9T96r5aMlLEMKfmCu7I8W1ptIey+eAxndJrCk1qjmEdMoV5Yek1Y4h0XQCf9LdmmHYJXDePrBTMhPaVdlOiV24JWhQaqSkbDz2uH0Kn445xqTxMt6n4BPwtwa13ztyoDtFdk7tauoE5in0tw5ub4FzQ/jn+PygeBXHyukpvzeOta83TsvTpE4//30/ZVhXoImjMprqNzdsFRZ2LBwcqCjHiSf++GxT0pnuksnUlKHwDcVwZVm9993VwlCZX1Ij0751abR2oMsSweF2MW1qSHGKL8k8drs9WVqPxM4CH+V7eyJDc602To7jxLlI6TRKKYyVae4jqNTieSRjvvaO48BlBicWpwUGIytv/LZZAFgHOB/D1cz+gc0Rurm8lgWCoKBGkbSIzT7+lzZzguhYUu8tQtCMeCp/G7ngFR4eFGKQ0FG3GEz9tnJ/W2e+BbrrCz22RagxEaRH9AxftI7+RENaevU5PAQKDn9TajkmL52YDogyFeIh6K+N6G4j8E25F1hCYjuGgKUOY5HpxG1p0YA+aY6Xa35jt/XGvZYqIdqUAX2fb+bkmgWOPcfkwbLpXEQWQw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(39850400004)(366004)(136003)(376002)(6506007)(7696005)(110136005)(26005)(2906002)(186003)(316002)(38100700002)(76116006)(478600001)(9686003)(64756008)(66476007)(122000001)(55016002)(66556008)(71200400001)(66946007)(8936002)(8676002)(52536014)(5660300002)(83380400001)(33656002)(66446008)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?RuhqCip3pcP1miCGXAi4sX/TtG7Iq3F1jXPm4YCds6/3Um1MOluQCUUyz8SL?=
 =?us-ascii?Q?BZV/EKqi/+nQlQKyxKsJTwN7lhOH2R1Vgax2/4cjirjHG99kC8w7o8a85AAY?=
 =?us-ascii?Q?kS0ZEMkeP2kTq0xw0m1UjUpgwGwR3500bCO3KDcI7bsRjcZ/5sxiArGw32wd?=
 =?us-ascii?Q?WqM7xpCL4dyltZ1IOQdk6YPjcdCj6BTa3vdKIazi2q3ilMAF0yU3Zmjgjinm?=
 =?us-ascii?Q?z/JYBY5fiS4fGMaBnOPeshFI/EjVe4B7RDbAZUfQAcw565gZMDBu3Qo4W2jc?=
 =?us-ascii?Q?VzweYEQMjLMeeaebVFHTZ6Qk2fhUS/+0Hgoy3+CSRYURkM++C5aEliSuNVw9?=
 =?us-ascii?Q?XNn6AEZbk7d4icmZCXiwQgtvhKYlUnkgMORclgB9XB8nGSI3T8iNtWJ4Z3dJ?=
 =?us-ascii?Q?QHnriw9mnafk4uduAiABlaF7MYRrgSTRsz7hxjFtZ/VGHq6V+lX1jiP8GFED?=
 =?us-ascii?Q?GdSqIYAK7OqC2xrgUqXInOlw+Btgt4kJDowMBhyV3Ft/IE9BokE1ioADVTWZ?=
 =?us-ascii?Q?PWtQfXe1JshbjlVifmoTDIRLFnL/k17g7x0lzBsN6jw3g9uF7mksUindZn/Q?=
 =?us-ascii?Q?67jks7u3QgMA+i1SU2+2I+QEWu0xhBwqz9K/4wgmyPn3QeAJwP+Cyc2Z2ITJ?=
 =?us-ascii?Q?PBuVNMotGe62pVkC5T42GZlDeEtmR0xpWC2prnO8b/8kzTvo5ZgznecpqGwc?=
 =?us-ascii?Q?kz/ZXCZghEh8ifUs8NPr8sInEjSAd6YbNOsb+0EQuNjDKFw458xx0OtJdYtA?=
 =?us-ascii?Q?F1qUc9SVzyDGygLns9JjUyBzY8dPJ7UxqolOUjn9HON+8OLfn22bfC/3dDn2?=
 =?us-ascii?Q?lCRNNcC3vEBqqT2pyQlzrnmUcfi1CzlA2/pVu7EaeE/5P7gku8S8ovAvrexs?=
 =?us-ascii?Q?RnRn8FHTRZsn8T2Wn5BBPQOtpS4LxItIJ4n8crmoNyulZ30DCiJ/LUuNagW8?=
 =?us-ascii?Q?qUx59Acx0HYk/JgRvLWkbX6lYgvWm7S6Gm6lwMe2CUc7bMLLv4AgVQ064KyH?=
 =?us-ascii?Q?pEovUWNGZo4tUYpjnh0oz2u/E6SzjSXCOUeiPKVoMQK7knOtNZd8X2K6R2fH?=
 =?us-ascii?Q?U5tIpZWMhlydBu8rGwGThRa0O8sj8iJy2AReOJfIzi+AQDoueb5L7FxCIz+y?=
 =?us-ascii?Q?pCHU70eWY/M+lIYKziq2blkY6YWbkaaJj2s7zdyH9JevDmIkJ9dlDj1OXLxC?=
 =?us-ascii?Q?XzGljSVQULHZvqUYc518hEbHPiicU7NNBnTUs1kfcDjPhlx3VlRmM9Oks4QZ?=
 =?us-ascii?Q?/SkVp6YvIF/tvfoK2mYVJtNa1QnPU/qI/4Yb/9GRBs8JPUPeF8nrsRqRNk+s?=
 =?us-ascii?Q?5XFph87HaChI4IVxz+Ib7/dJ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff35e87-a2c6-4f87-4d68-08d92b571eca
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:59:02.6270 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cKGOC+Hm3gmIR8NWoA/DUnMdJoZXU2zt6oj9dw+PzenEGOmCqvn+G6bicyHhLsNDTKYYiW5Z//+BkHfsrUt6UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4484
Received-SPF: pass client-ip=40.107.80.129;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Return output buffer and size via output pointer arguments, rather than
> returning size via tcg_ctx->code_gen_buffer_size.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/region.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>=20
> diff --git a/tcg/region.c b/tcg/region.c index b44246e1aa..652f328d2c 100=
644
> --- a/tcg/region.c
> +++ b/tcg/region.c
> @@ -467,7 +467,8 @@ static inline bool cross_256mb(void *addr, size_t siz=
e)
>  /* We weren't able to allocate a buffer without crossing that boundary,
>     so make do with the larger portion of the buffer that doesn't cross.
>     Returns the new base of the buffer, and adjusts code_gen_buffer_size.=
  */ -
> static inline void *split_cross_256mb(void *buf1, size_t size1)
> +static inline void split_cross_256mb(void **obuf, size_t *osize,
> +                                     void *buf1, size_t size1)

Need to adjust the comment, now that we're no longer adjusting code_gen_buf=
fer_size in here.


> @@ -583,8 +583,7 @@ static bool alloc_code_gen_buffer_anon(size_t size, i=
nt
> prot,
>              /* fallthru */
>          default:
>              /* Split the original buffer.  Free the smaller half.  */
> -            buf2 =3D split_cross_256mb(buf, size);
> -            size2 =3D tcg_ctx->code_gen_buffer_size;
> +            split_cross_256mb(&buf2, &size2, buf, size);

This will be fixed by patch 21 (tcg: Allocate code_gen_buffer into struct t=
cg_region_state), but shouldn't we update tcg_ctx->code_gen_buffer_size her=
e?

Other than that,

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

