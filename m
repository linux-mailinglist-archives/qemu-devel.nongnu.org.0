Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 734323A18C3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:12:47 +0200 (CEST)
Received: from localhost ([::1]:41344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzss-00028S-GJ
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzfu-0008EC-5x
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:59:22 -0400
Received: from mail-sn1anam02on2094.outbound.protection.outlook.com
 ([40.107.96.94]:15619 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzfs-0005Zr-H4
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:59:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FaMGLB308wlmSuQOE+In2BVvvVYAaDwf4jCjrMABLY9UGBNAjDK7M6gxu2aphjwJkpEMC0AORWKNPFZseMUkLg95Ri0k7B3PVaz6TU9I2xqrhCCmPxfIvWFJVGW2l1i8+L4VDpsG/XHTv+v1IbbhoguYPY2oAbQb3ygW7yDVpeSNrZxd3l1Iw/OU76muLq6sXQSL3rXx9KRS/1grddZsF5BPOE+5mCrbwPhVAIpYzrEgU/vud+WqWimJpX6KtO4m2mPjAHvA3rZMvXhpPmG+8E/rco+PCutLjvcarMADOpZ08klvoqe5htUj6sAE+JlG68S76YCofD/pKi+6r1a71A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBnY/2/o/ImCNa0Qe/MGlffDxa/a5mhl5Dr67y22IyQ=;
 b=inR6VU9n5MCnKGhYIcuV78SoG3Y2RGlWx4MqNzGFAutWYkRxomHdo5R2G9K56VtFhkH+H3vk9YLYm4gPFkohOecygoELnVHGK+eeVHY0bJFpJRdGSjh9vNbgnWy1SbDjcbvBxSFB+nOLKJ2wLBCAtwAjs4z09tKliNHTsyU8QWmv9xqQrHknuBBLUca7rdN2xxGKQXnAS9Oi54SdGUeXMfnj6UrZd7UWXzil/rYVygCUWP49/ebFm4QZgyuQ5R9cDbZyKZ4iCQmocEzZlk1lSigs4aUeBYDr22stMvDNNmT1SXj0lLyUH+yyQC/1BIb/LvyzbAw1M+xHLcDG/Cltxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBnY/2/o/ImCNa0Qe/MGlffDxa/a5mhl5Dr67y22IyQ=;
 b=C2y4Fnoq4p/ADh+Qb7zflSAObrXujjs8P0e87ONukNkRXPMk3rmw4xkhVrRx968k9UiRy3B42vEAHg9n6JJsJaWh9fJ8Kwb2IOF/8UjtanX5tpxLQsbHPy0E9TPyiEfwHhZ7iOwGOIwW0d6HItpU34GzGeaaDDpYm16uVIhgzgkfiFMq0NrR3QWqKY/DlR13ZBtpSkwG6Gv7NU6AdWC/zX9bz+M5PK0BBH3RnSH3ynWTREm3L0i7nR4SDkszpx/bb2zvGN8z67nD15jd5DrgaaHCxiSLvjFYeJ6DlJ5zXlplQUVJ9Pm4cyK1Jn5LvolOX2ZkCmxCQojmebIcPNEIGA==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB0017.lamprd80.prod.outlook.com (2603:10d6:102:1d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 14:59:17 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:59:17 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 22/28] tcg: Return the map protection from
 alloc_code_gen_buffer
Thread-Topic: [PATCH v3 22/28] tcg: Return the map protection from
 alloc_code_gen_buffer
Thread-Index: AQHXP6sO8HFOus2+F0O71eK/AZ+/M6sL/eJQ
Date: Wed, 9 Jun 2021 14:59:17 +0000
Message-ID: <CP2PR80MB3668B720E6BDA15DAD28B9EFDA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-23-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-23-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 371da8eb-1f61-494d-2811-08d92b57275e
x-ms-traffictypediagnostic: CP2PR80MB0017:
x-microsoft-antispam-prvs: <CP2PR80MB0017DDF39F5B30B24EBBEC7FDA369@CP2PR80MB0017.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PLea7IYpOauzBA687xC+GLZF3zuE3ENv/PndtAVorZLbCVytFzUDBfiMWBur1H0Ax8egYAzSyn6ouG99GxQmeH694ByjdUgfZuCScvVAf2N1JvrDrbmPj5LTQUySzRKIJOuj3e5X1fDNPwxVtUiXkB3FnuIfqjiMkoxCs+t13kt4lkVL23mSUtjcmGy4pJB0kV+5Mmti3KHzTg8VcIRQPGNQ9mkO/8+vZ+aP/jbvS3e5xtL510Uj28ERl/K2UZlYKny1RZTxQHobG1LwdqkXPgbUlAS4eTRcqhut9nCcSK8rfdeWikuXXmiNI34R/xIszUNT9dnrMXgFisGjZBRtLYGOUx3rN1e0yfUOcW0MpWZhMyTgGnuBbiAZzZLQw7hv6IkCj/fRSsNSaCupdBz4wg2Jin8xtZcOFBuz4yJfG5NAZIAKBeWEYdIV1lp/B3jwxbpaxEDx/9lNv4Z8bGje4m+wxdgUBzcpruuTbKW8mtwu+AOVgBXphIwfdTzn6MzOj5r/rPE2yrGtOBOSKNDk2Z5LdeHk4RMR54LDDPMJ1M5zGv7FmQJwlwHWVzTaVR1AV4TbSkmSDeRkLwmAmZGzSEeWpCAB2IwDJU8QIb3650PCAIGH3ThdNK1crCPXbw4157LfGv3n5NfBf24nCmNKw+J9Z4WJVqHVWxUhWg9P4bbWVouEH61L1m2549S8BHw3+Mwkw1riC2GQcX4ASy5LDiochkPXqVmxn20YmUMq39Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(396003)(346002)(136003)(376002)(366004)(122000001)(86362001)(2906002)(26005)(8936002)(55016002)(4744005)(5660300002)(7696005)(33656002)(83380400001)(316002)(186003)(66946007)(66446008)(8676002)(110136005)(64756008)(66556008)(76116006)(66476007)(478600001)(52536014)(71200400001)(9686003)(6506007)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?+wyyDnYWGsDI8iL2NDi/gfRytprW4lYmHfREZAUO6Hc8XTikOaWTPMW1O3jm?=
 =?us-ascii?Q?+IgJVb5ztiR3eh4cO+DMDkpM7nCXE0E8UwB6FOOE/xfeXBA8C349JA4XifXa?=
 =?us-ascii?Q?4WG4xuR2P0V+7UYQ35ZnjLIbu1SWhdlwz3YuuSWu5EuDAqyYrKlkeo4Lz9P1?=
 =?us-ascii?Q?iUAlj3RxwYrgfe3pPL6xn1i/rQNa6fTuUAI/Tp6Fcc05ApOB+FonfT0vsidf?=
 =?us-ascii?Q?mdIrvqM45IwatfTKdnbo8pipYUUG/YgFjHEXJGONnqQfw35m26/s6uQ76abe?=
 =?us-ascii?Q?2iM28hcb4XeyVT60J48j5AD/bJUKfIy48V17FeyhZXzULJYt+jbPHczDB35I?=
 =?us-ascii?Q?evZSBjdqc0Y7KVdQUL6BDFGZtp+hGy7kFOoGs71wPaNDrMX7O9SCp0Gf8afx?=
 =?us-ascii?Q?W4I2eT0x3NQa1yA57RhDfL0Zi/S0cq/r+t8xhChsXQV8G75ZT4j4CX+jxhM1?=
 =?us-ascii?Q?NRPh+RoioT4xxOSDslWpZTemndux6vR1r6ih9mLi01IJi5zjKALro7hirh+B?=
 =?us-ascii?Q?yrALnzjWcj6KMyo8FfMh8KhcGXwTPq2owZkASvGQVTPD/KX39FCXdjSqXNM8?=
 =?us-ascii?Q?AbssA8ph7LqINS7xjLCFLvxRzq7d+zVeXKhSVGHV/+qdAxKSfUGAH/W7Vmvp?=
 =?us-ascii?Q?4BJlD9y1hAoQ75TeV9KO4FTZFEigdiEjVz/udsudU2CcGIR79Gff3o8eqfT5?=
 =?us-ascii?Q?x7pbfQKsQqVUqsWdds8zP+H0/zfxcQEEWQKfk/mnD5VBk0Dd76mpVM21n3s8?=
 =?us-ascii?Q?hnNnNlBLpIu5JiW+qn50Sidmx4VljPZ3z9SWPI4/L+6va1FNftpHFMmpyVNy?=
 =?us-ascii?Q?dikJyQhEo4lzlmN06My7+yxk0BMHiA/BAfXC1zN15CB+b4mB1cDA0JB5ZI1p?=
 =?us-ascii?Q?NLk/pF2bPZh2L9m5iJxx/sTqbBF61BezOLzbd/i4rg/8ssJK6ice2/Kq1t4v?=
 =?us-ascii?Q?/mDQkUdtUFDkGDHszAbjvA/FswoDSkdwcSVGet8bKJcohRBPevpTztqxD8S5?=
 =?us-ascii?Q?8LMPnmfSCCG0LB7uv4RWXNo4DK476vNaz7N63XJeGeBqJfjvWCgQ5o21WLXy?=
 =?us-ascii?Q?PVDeg9Kw6IRZlFASROeM6HD3c2sA8owzpfH1A5gS34GkNcZL++iz4jI66zOU?=
 =?us-ascii?Q?4MI+uPWzTfvocLjzORoFC9w/E21IK0UjTdC3wAv8C/rUTl4yLULXVYLY1bYo?=
 =?us-ascii?Q?cMgiBCCYz3Q36N2u0dYfjcUTTTISNIKmUMLa55FakCw4OFGEQbUU8Y2P9fT3?=
 =?us-ascii?Q?ot0lKL4X5acjPlJyNgRwTnkUy4KAyPbbi7goYB8HA8PaA5W0BwPuMuvwx0/8?=
 =?us-ascii?Q?FutcMwhSJIPZP2+KNfInfyVp?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 371da8eb-1f61-494d-2811-08d92b57275e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:59:17.0597 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A8xve1dQerhoQJN+HH/q91sp4gtIVfVLUtGp0tUxQOAbh7WHh0nFjT2307Sy7bOi97OmUWaarDvLFw+ZFYkU+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB0017
Received-SPF: pass client-ip=40.107.96.94;
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
> Change the interface from a boolean error indication to a negative error =
vs a
> non-negative protection.  For the moment this is only interface change, n=
ot
> making use of the new data.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/region.c | 63 +++++++++++++++++++++++++++-------------------------
>  1 file changed, 33 insertions(+), 30 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

