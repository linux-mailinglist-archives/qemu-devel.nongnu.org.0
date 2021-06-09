Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3303A1979
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:27:07 +0200 (CEST)
Received: from localhost ([::1]:49358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr06k-00020Q-Ko
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzg9-0000NT-Sf
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:59:37 -0400
Received: from mail-eopbgr790107.outbound.protection.outlook.com
 ([40.107.79.107]:28496 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzg8-0005jo-0t
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:59:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhnw49qGFcDU9JeYfxp96bC3FEwxn7W6E2OGVrMKG96wv6bWOmtS34CxS9jrq37fNCk+HsKNKDfxnB2JojAP8iw8PArEDy/J2X1LFiD1xSuEJ40o8nkz+YuXFSeOItTnxulaU3OVfbVBNvRRffEcFbVnFxkGtzvzUdBSUbCf/AAILBtMkU+bxk7ZcTdfvtSPgF5m0sJ9Y9+3OaTowKWlsWOeNPQDUqbTDHGEx+dm/hF1p4zoJOBR5icaJcB9RaPbDUUAWeAB+AwK4lFCtAXrnkkHgeTI+S44j9FyKKLLJIEmHY0BgIytVLJbzi5t4MyJYfkUJHQLvkDPNif4JXuufQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/7uf28EAADRQAUZKuXnWeZpW5Jeg7eKoJx5OMqEqXM=;
 b=oXfJ7/7wB6+CwYnWfimeT+phP1tAvs+BqlAAyZK5lS8ui60TxLEE6WCM527PCn9KuqObmujqEkgKlPek4UHSok24dYSAGcgxqs1ltyN8gIrIcceAH6ObGKh+gkckj5/7aeSbN9UtMhSd3n5HhGg39n8jMjp2Ze3BDcL9RQKnPclHOX22zYo2bDsyvUPl9UY4iTRjvSAfQa/PQGC3MP/iqV+CmVz1Xc00m0auzFjk5t8ESt3C7femPJqG+GUGE0ORMgg5Rg9pLpzhmJ8bqouNvI3W2QFs8spHB2v1gVNiygPPIOrCbUxSdF7CE9juFVHcQbXqY4EE/0A3w66BI38o9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/7uf28EAADRQAUZKuXnWeZpW5Jeg7eKoJx5OMqEqXM=;
 b=CSZxiESfyJknx70E+gGS2X6Qaab4RCWSNJKf+zHR7DssZ+EwOiXnocb4nzwX35HP5hSZUJhcRRHvD76rl97nbK2T4fpyO5qjmRtkJ+janroOvLrKm4Sxzo/PCgyIkK6S6Tyn3U4Jt3lVk/BitaLajKZEF9eOGuGVtdskaydxnd0ltuE+yt27s6p3KD77BsiHTkQPVDHu42y1jG/VffkOr1HCwhXf+H+wkH71Rs7hLNlx01remAT4dI89WW4b+zyaBEkBjc2qc5CaOot4lzrl/1elVQWBvhxA07fH7lG/dNsUQNhRGkD0c5jo5FvDPWi84i9Kf1hqDpAPPW5C0NGn5w==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB4372.lamprd80.prod.outlook.com (2603:10d6:102:4a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 14:59:31 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:59:31 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 25/28] tcg: Round the tb_size default from
 qemu_get_host_physmem
Thread-Topic: [PATCH v3 25/28] tcg: Round the tb_size default from
 qemu_get_host_physmem
Thread-Index: AQHXP6uQ1g7rh4MG9kO3zcPjLBwVv6sL/lSA
Date: Wed, 9 Jun 2021 14:59:31 +0000
Message-ID: <CP2PR80MB36687F1756906242EE009045DA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-26-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-26-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07a0903d-63b0-4898-5ad1-08d92b572fdc
x-ms-traffictypediagnostic: CP2PR80MB4372:
x-microsoft-antispam-prvs: <CP2PR80MB4372AA07F34E2C68FEAD3E27DA369@CP2PR80MB4372.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1+pt3dRK8mlea8+RGl+d2cKhFeVXQsGkYWISq7I4VJ6oYiu4qSX4bgLOMF8jfI4JtBkFtosdX9hKaybPIwLUdddj7LliO2ZOhpPKFu8pTyuzLwl7ouzqxb8zl+fT0qA+68Qedw4NLJGU2wBtyUeGsW8f7bffNmBJJRDWF6sW9SnbeekeCCFQS806mcNaMbGa1FnTz5eZti6D4pShZp6B0XZKAceQMyV3pCVqL0b2gCxUVvGD+1wobVufNR8lJavMJp4MTTA+v/Ae8BE1rxa9zPF9oWhxGfCwgGugzcWJKLG0zjvsoLwCrhhfWyopD2N83FFpbUSRb2OS/g7t909Ru6E+64ivm+rwScipgQD8wBsKUZWjLTk9+L4caj/yK8ABMc35NBebokLfeGlY2CBMBvq+P04RO6cAGV3PkJfU9WgOCUv7gR1+0zNpGtcfZdXGZKIfH8JX800v3Ix3mbBvzNcxqYNVKIsxOqfgAtf/K3NLBDvhIgkFUUk/FXrBrBuivqV1BKNyH9eikP7qgThstfJKO40kYrTlXtByrHdnYPt6oBKOMVvk80iqghdwlzJ2G1PP4CZ8hkrTDS7OjCSYps/sVANmoMaQrdQEi3AsGBYEMdnw9pLDJTshk0ltwRBCBtAojXEqK1+JUuXtYGPqM9U3Ka7vcgEOFlweTtxV0LnVMTrW88FnwaUWZRALr3KIYic9M9Sq57NeAfadpJ2ryRB6KR6PszMaqQXSbqBc+8k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(110136005)(498600001)(55016002)(86362001)(71200400001)(33656002)(5660300002)(7696005)(83380400001)(4744005)(186003)(8936002)(38100700002)(6506007)(66476007)(64756008)(122000001)(66556008)(66946007)(66446008)(76116006)(9686003)(52536014)(2906002)(8676002)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?u1jA34I0MO67w0WYHYio8qBbtjXp91Y6V4gYRTF4wp1wBb4TWOguUJw0bpxL?=
 =?us-ascii?Q?SWlWcTOnVOXGgPEIP2cIZoaXY8u3jKd9Kdyigep+Ei/ODQIMydNanEVVhz86?=
 =?us-ascii?Q?5N1bx+1rJPTwQb63+Tixl8WxF76zuMvkJpwYCy0xlb2XJ2rsbpp+lZ8vPweU?=
 =?us-ascii?Q?ND22Fww2H87ajCyflYCUD5DzykrpPZLrLHRpetE22/+ydLIKLM48Wkwx5XAK?=
 =?us-ascii?Q?BpxmKge2nnLe50N+Kkv4z1K1jzQ5H2sVJVN0YdHg13kQZ7C6JJTUjLJS/zcs?=
 =?us-ascii?Q?DiLTx1JVl0vsVrwPgcRMha9hq35thTtxLLk/zBxNVjq2ehHlTFOr9+HkJCHC?=
 =?us-ascii?Q?cwj23CJU4rTaoM8BR6arbwuO4HlxSDVzLpcZMgP6RdHamYBm3+jGWUDSvz8e?=
 =?us-ascii?Q?ECYXXcSmvL76ZAH1y7koyal3Qa7yZ8nxU8NcgBCKOMDQac7xf8iExnqhmSwr?=
 =?us-ascii?Q?+rT9da11z4SWbsuCW2uaIInP54s4BASyZALE94iRSZZTg732wtz7PK9fhnGH?=
 =?us-ascii?Q?AoYGlzvmqbq/vp1IoVP27f2TobGR1Nk5jYVICDGwRZMPQVMT2dz3m9AHm4r8?=
 =?us-ascii?Q?jpwlqQKaWsq/anSDwvnMYi14NHEcLAmxagT8L5WZbhDyN9Jns7ZQbYQmOcc6?=
 =?us-ascii?Q?EaHthHf7Bpy8TG6m4ZpSDF4PJ7eVBCf+piqK84BkJMbeiY9iQDzubzv7Yvjs?=
 =?us-ascii?Q?6t+ymUXRC8hImGFNqltMdGpMrqiheFCXwKSWCIPhdwFharqhfvf94Vc6bvWD?=
 =?us-ascii?Q?Z4ytebJyHV9SfgiNQ16XuTGWwuqrlCw87WhVYOgGdR2YSmB23Sk3q+Oi6IMj?=
 =?us-ascii?Q?+t5gemmL50NKL9DAa/Wi17DXe7QMHrKZTFduNmvuzJQs67SHGzaRFNmiO3ks?=
 =?us-ascii?Q?lBYmwclDSALZ49p30D1ioeAaeH5SldKhPbru6unOqGTQNEDb3TsVqh2H5CVT?=
 =?us-ascii?Q?0wMMdodTojcQ6O7VqX9w+LtOsyV6hL1hFNi9gT09LJ6W/NpDjegQy+L8ZlSF?=
 =?us-ascii?Q?z+XJfoz2rfmwo7q48ZLo943pltuigyhx9IeQT4d9Z9r4NUVi31JKnEz9rFBt?=
 =?us-ascii?Q?7ez+vN3g82JnRTydk24KmFaqppMKmn36knxB1U2I2vj0ylNxe0DcYZLKa8cc?=
 =?us-ascii?Q?mRJigzxTb6rr4vCekBV2xyAJnysQsqq1QegXTGv4Y2rNAeaz23yEcnx5ELVE?=
 =?us-ascii?Q?JeoSHmmTgQEnBZOT8mxCQD/YcxBchvjVNSdFslL7XUOx+naZcRCQaTA8vnL1?=
 =?us-ascii?Q?k11BFfWuvPkwHTELxtYUV5rqdGPtnYmvnDkZgOluD9ZT/9geMFSpn8OJw08D?=
 =?us-ascii?Q?7DRxrPDSwF2yWPnKA2cw3koY?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a0903d-63b0-4898-5ad1-08d92b572fdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:59:31.3296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +tZuS0wGQubvLj+SZExi8eHZh/rUAHWo3nAT7e4AL+wvbOMM86+RMDS9xXXnawL/YY5j9Tj03BhjgXUBVGh24g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4372
Received-SPF: pass client-ip=40.107.79.107;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-CO1-obe.outbound.protection.outlook.com
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
> If qemu_get_host_physmem returns an odd number of pages, then physmem / 8
> will not be a multiple of the page size.
>=20
> The following was observed on a gitlab runner:
>=20
> ERROR qtest-arm/boot-serial-test - Bail out!
> ERROR:../util/osdep.c:80:qemu_mprotect__osdep: \
>   assertion failed: (!(size & ~qemu_real_host_page_mask))
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/region.c | 47 +++++++++++++++++++++--------------------------
>  1 file changed, 21 insertions(+), 26 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

