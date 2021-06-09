Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56AD3A1882
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:05:28 +0200 (CEST)
Received: from localhost ([::1]:50780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzln-0006EC-VM
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:05:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzf2-00069T-KI
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:58:29 -0400
Received: from mail-eopbgr800113.outbound.protection.outlook.com
 ([40.107.80.113]:11313 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzf0-00052S-ND
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:58:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IaOQJTlcaUVPMC3BELc/cc0mbYI3YGg2rJFFjdrHMwBSznq8GvUz7tAwqNOVS2DFITQduCNwKfZG1wpxNClCYlwFkdsgk+B7rfZwYpN/WRdo7H4fHlpjo/wMhrsx5841chRZ5DISkpePf5ycqPohFRtWzdBvSzs1KiwfOJsPb7X/PaCvI2nQE33LkOftXoZWq6tmspbWm4gOWrqCILuGn71UtbXYyiZvHfRiASkihJTNOknTawEgHAl/WTZZiZjcyLOzoUsjV9IOsEe76yb2iU4y+wywsH7sBfznFucyAnamam4Rz78QBGrND6J+3Fh5no68G1w2d1rpJFZNLYcgUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q72rJiQCzAeuDYFKLle7wXSmoFysIDSrqvguEUtlul4=;
 b=OEOUV3n/c2QxQiIRvzXTDb4+K8cOAYFwikFn/xRkwAtwG18o3eZT08MpstK3NoRtkftoQaETDxxJ4Y7UntwOQsYGpjxqCPkFq1x2Y7KVC/7dM2QTtBxXW+H0sqa1/WCjku5DdrY/MFc3ZD5DqcItQgRRF/noAGdmMYZVS9q5BHvcAas2Jlm9rUdtsC6TMxBJ2JvrZ49rTvaN1tCs3PGooAD8BRIShNQnvLPIN/1vBRfPwBc7cYrU9qTF+8mrlxH6qCAEMncTa5130xgDQC3UchmIQ0q8QEpX2n+MxdH/41L/PLC7AJ9yuGObbyF0WVZJKt6t2jJFmljHhWJBZ/YxcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q72rJiQCzAeuDYFKLle7wXSmoFysIDSrqvguEUtlul4=;
 b=zOh2qngTd4fEqHYiA9ihnCdyRHEyAWUUfUkrPumxmUxwTwTH6bbNiOnw1JcK3M/GD3fbky3IHxhC2quunOftCdUxTwDZG70bDL+BCN/wC+ES9lDAOE/fcwoY43nCNBH09KYCwxMr/IL1PMd6AlLUK53SVhMNctvzIC2ZQHEYNHrzL/f+VhQl5BoHfe9qLYJQAaIWzgyqOGwHPHmi1arUUiYjUq7Ms95zvGGPNCV9NynpNVh8WG8RRTvnaqhIxO9ayaiAr48Ft8lXqKcblx0SfSR/pcXGYIBS+k9BPowkVOBgi/Qg/8fIhXFeU6eqzIH7Po3wrWkyRMgVAjBUxPLaUw==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB4484.lamprd80.prod.outlook.com (2603:10d6:102:48::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.29; Wed, 9 Jun
 2021 14:58:23 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:58:23 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 15/28] tcg: Move MAX_CODE_GEN_BUFFER_SIZE to
 tcg-target.h
Thread-Topic: [PATCH v3 15/28] tcg: Move MAX_CODE_GEN_BUFFER_SIZE to
 tcg-target.h
Thread-Index: AQHXP6mzFt4OGC12s0q6eEu7Yr4OW6sL/BaQ
Date: Wed, 9 Jun 2021 14:58:22 +0000
Message-ID: <CP2PR80MB3668F7B28627CC1ED0C75B7DDA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-16-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-16-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9145c66d-825d-447e-485f-08d92b57072a
x-ms-traffictypediagnostic: CP2PR80MB4484:
x-microsoft-antispam-prvs: <CP2PR80MB4484F6D41811285361C13BF5DA369@CP2PR80MB4484.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:962;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TZCb58zWnsPQ+EdYIf+yZy9bVWOla7TsVfA3BL+6KW87uTbnWULSHbU5roUQkMevu+Zc5Kb/xHZZ9hM46ux+xJ0RxRjqU/5TCHs6pnKrbu7EUT4vP7RcGGAbs5XiooNzqcV+S1apL8/4C7bqdrhfTcEQagWxOpM9hqudpn1luo2r9rdlwHglj61oFER5LLQ0qWsl/a2Tl7PTZvziqIFPOOLKH1LlffSzLwf2y402I2zp9dPKp2maSWlwWFf93cSSaKdAN3w/wCwEiv2mVf5ld5xRIoAwrCrD2/WewUzBGGzNKg/X6UT4huhxDIP9Ly3NS8YZLafjQW05F63rlXfGPOZHki2nWSYV02dQNH2tNvABimeUcJGUR9PCOVPc1K3BT47TcBNbd6PLF0whU+uY+FMw4Fq6ScA1bJBh0dunonhF5sAQZjY6xu8Z57KbSqkF50E21cgULr3RDBjOOri4sjhWTpzCxLvMvia7p9F5mLxMh4vIQmCbyvin7d99XeqbGGnJBh4HEb8j5vHc22E9cbQSDQIiokEp7fOePjBzejpKbdqJ0izisMFRWk+OtADQ37Y/Fw5GVRiJ0snuxci5sKoBJEC36voUBCyeBsE7dpyGP19mEP/BTuv3uqC8wKVj0ZDs/ko9gmpQsKZcrLouxuDTOjvHIx1agM7wZpdpfOHI1lM0O29YD861ERdWKoGXCt6gvs7kg4yXKV8bvJLgGREj1Z6jXefE4inB0y0R9IjPEZebVHRKFQqHYIglzYgaXUQ5x1XaC471IAekHtKLtA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(366004)(136003)(376002)(39840400004)(6506007)(7696005)(110136005)(26005)(2906002)(186003)(316002)(38100700002)(76116006)(478600001)(9686003)(64756008)(66476007)(122000001)(55016002)(66556008)(71200400001)(66946007)(8936002)(8676002)(52536014)(5660300002)(83380400001)(33656002)(66446008)(4744005)(86362001)(352734003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?gC5ekx0UCk4oaYlQn0Jnf88YBepVOZe4gFtfAdj/4Ek8AdMqI8qMxZRHvmLW?=
 =?us-ascii?Q?iq+GJ2oV+OlS8eUR/B+xr+yOTz9M7ERaYjDOAV8DPOOcVnHhR6PougEaxLrI?=
 =?us-ascii?Q?rUBE/7NdTYUaubU8cy8fIxTBzk2y2KhT9QVTQ0HBuiab63JnpCkgYdMalRwZ?=
 =?us-ascii?Q?lCDOf+njbqCogeCp5wHSJpzeqMV/P9V4sxcNLn+50czMX2LRqc5SmTbWlaSs?=
 =?us-ascii?Q?imFi8/Ut6Lr/OQe2qYYLeCpCT6LbsBjloS8qtKE19F8/25z66fhbZ3WUiCls?=
 =?us-ascii?Q?22pQPhHs2uzB4+b5Tznw5YGjilH1b7GZFILdf98YPPHOOmW9mBgp3OA1rsjn?=
 =?us-ascii?Q?/NuzowdTYyPUxNgt5dowUMzf5GFgWxA7cv4R+SHW4eH2VrfJPabBXO8SuDVa?=
 =?us-ascii?Q?1XMp+WGvNHrpXOZ6+xjYCJeHd/vY8TGOVg8XHA1kUWIuXF9ayJAp42rnkR0x?=
 =?us-ascii?Q?l2fcZRVwnuFsZ1qXI+g+DkGXPr8jmgMRCEZ8S6HHPL3OCDzcgApxAtUdRxqr?=
 =?us-ascii?Q?pE2AM0QWQYNooO/nwHVUfA8Go9hqL0Eews084Rb7jHFlfFvtzAez/JIl0FuR?=
 =?us-ascii?Q?3FDWf85M0LUrC5wlzzVCIvS3gMfTE/7Bz005m6d0k8p2nS5vfaxE9hGA920Q?=
 =?us-ascii?Q?iCjDzrMVEb2uQADL3UPMgGPqZwBMQBnmfknWH7ssBn86sb4cXgge41Q8ZrUP?=
 =?us-ascii?Q?v7NlKiK4V7jB1vV8gvulhZVWZqKVuzsfV3nV47Ma2dxuDe1Vu7ODSTaQ4W1H?=
 =?us-ascii?Q?rvLWpfT20Un7e9y4q1lSK1UFEu4RD6k4lUiHACCfCuyUOaRHCpWyZ187DfZB?=
 =?us-ascii?Q?UMLDBidjG9EDRjcpi9FvZSHipMc3mumSHxVVDzLTls1i7M9TQs5TZRmPzSMu?=
 =?us-ascii?Q?KjzPrWVo3Ktm684AKFCf8Kt37UlH2upMYA/NJ1IdVmyGTXIRE9dAuD/M1/Og?=
 =?us-ascii?Q?Nt5Y6HP6k6PfffYU/y/oG5Q+kX6s0qCviWFGn9HVKKXY7K7vKL4OOaDOWaeD?=
 =?us-ascii?Q?JnwheESWc23E1h6l3iMoDUSzQYpQvTaiYPOhpNTHpNgNF0WxKF/yFkO7zDaj?=
 =?us-ascii?Q?1wRjS14EUKVT29HU7Q29z35I+uk5KFZoGwrqmJWcWfH/27eIvkv/sUqQRN2F?=
 =?us-ascii?Q?niiam6tsvbLKPZkkrBwzVcd3eoUmPknLHd5hNpAYH1WqoWoHfQXkoFkhDfzV?=
 =?us-ascii?Q?qp1xh0mu/8LhrZMloFOE1pdJnc8VpemIEvBBbWviCygltHDEH67S0hppol9w?=
 =?us-ascii?Q?0QmHlCZwZW0KP/jlWKkx11yYjScNwhl/ojDln1O+TtILnvcEg1+7VsT3X2Sg?=
 =?us-ascii?Q?IN27buBIZ2paVvgFqv2PWPmb?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9145c66d-825d-447e-485f-08d92b57072a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:58:22.9727 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7fhG/ONRnKkmbCmNG0513IVGAqZQLDJHGN4hPLLz7RKYogaIYjGaasVJbZehqCUwwbjIKePNLEk9tqpPMU963Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4484
Received-SPF: pass client-ip=40.107.80.113;
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
> Remove the ifdef ladder and move each define into the appropriate header =
file.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Retain comment about M_C_G_B_S constraint (balaton)
> ---
>  tcg/aarch64/tcg-target.h |  1 +
>  tcg/arm/tcg-target.h     |  1 +
>  tcg/i386/tcg-target.h    |  2 ++
>  tcg/mips/tcg-target.h    |  6 ++++++
>  tcg/ppc/tcg-target.h     |  2 ++
>  tcg/riscv/tcg-target.h   |  1 +
>  tcg/s390/tcg-target.h    |  3 +++
>  tcg/sparc/tcg-target.h   |  1 +
>  tcg/tci/tcg-target.h     |  1 +
>  tcg/region.c             | 35 +++++++++--------------------------
>  10 files changed, 27 insertions(+), 26 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

