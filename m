Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D751A3A194A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:22:57 +0200 (CEST)
Received: from localhost ([::1]:38382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr02i-00037h-Ql
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzfo-0007yt-0z
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:59:16 -0400
Received: from mail-eopbgr800092.outbound.protection.outlook.com
 ([40.107.80.92]:19840 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzfm-0005WL-Bu
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:59:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCWCfW6bDWuFbS2rrpe41dAuikwEhBSSahX70JHcFpr5AiQivt9V5PuZSc1lRk5JeP7FCSCMKxn2Cka5K4ehXL3AeEsKZCoJZ/1Gcq7+/IgwVN5Iseu0sTqJqQYJ7TBLvT1DqjbIV6w8cssYLOCq6RVrPfPgbodcWVY1tQc1dpUrxFegO/AmvEsmN14MWZ8LegugAJiPHsEZrKHE5R2vpZqu2vFLCPRkykFO+mCTSt+d3i2unMpA3tTxKQEP0XvDTLSlY3tV+CureDGxxsfGJCccv6iWuaDGWvO6rR3nBJEm4MwhiwCA9FDiJNDvcHstaZbpQFo+J4ptTT7e4WNGeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNQTrMmF0EVS7d1ADmDLq/Za+1nOmTifOuFHwGWkm+Q=;
 b=VEtuy4XB1Mbw1ikmEpk0v1m1D976bGm75lenaHXX3PAl8VIVvILt/mncWFuTAdzR8x3XrbjGxTGyarQVK+g/f7ANSxKrs/gPaMb7sDzHpg9jeQF3Ul7n9wDkNHVKl3QgGcC0VE1ifg+T27i3V6rO/4yiBQUX3pEzISAGsCR63sGjTA1ymOhseVbt+bJ+Oa6jPAuUio+/uLQweD2SjYlj7nCw8l/7K6J6ylMsFekoRBrr5dyUp48J+n5cl6+dZtLjivOt0EgUfVd+XovARxPPSlzPoNJC4mJvGHs+3VqvqkIzkW63ipGvMPUSV0wF1r11AUmEUVE+3v8qeZ7W5YIX6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNQTrMmF0EVS7d1ADmDLq/Za+1nOmTifOuFHwGWkm+Q=;
 b=0uEV5eRS68/Mg4SrYXk8M941nMSb8XNJRCrVKfLW2ryVdpAA5OqFFDKeT8sMRcM9jLoIqrM+aq2tTMYXtBCBngPmfZeyXGGQX77Lfe0Tmg4epi5vpDyWlw9rFug4b2ZussgFvlczCyJNgercWq36eBmAS7W0FF1Js7gDqhM2OMfpuSKe2lO/QWqCyxYCtFoPmjkRN5yRBQAgkXIxsxQFXPts9azLuR+Fsy8F8+FzalPMBENQ44PJ/ZT4GGieogtfrTgvIk0parb4B0ZABshWK9lXQrxZo27iLuuBVbZGTXOxq8qbOy9DvcOLD6pOkSgC0ebYE8tBH6qHekXWc/YywA==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB4484.lamprd80.prod.outlook.com (2603:10d6:102:48::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.29; Wed, 9 Jun
 2021 14:59:12 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:59:12 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 21/28] tcg: Allocate code_gen_buffer into struct
 tcg_region_state
Thread-Topic: [PATCH v3 21/28] tcg: Allocate code_gen_buffer into struct
 tcg_region_state
Thread-Index: AQHXP6qfavoiWtN2pkyEkPiuCnPb9qsL/b6A
Date: Wed, 9 Jun 2021 14:59:12 +0000
Message-ID: <CP2PR80MB36684A9053BE7CCC15BED6E1DA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-22-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-22-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: edd904e2-017b-4045-4b69-08d92b5724af
x-ms-traffictypediagnostic: CP2PR80MB4484:
x-microsoft-antispam-prvs: <CP2PR80MB4484E3175872E49E411673E1DA369@CP2PR80MB4484.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hv5wRoGKq0Tp/Ic88W3VjFaKacCphOSEkr7KbajUhuIGihN5BXxkI8V7ev/rHUIJN+7tz3MlW0Y0DKUhRj+yiCHudXljKlvKTQO2RUV/XCJ3TcneqQ/9Q1J8nKP93tWOVb4GqZTolPYdUa2MMRRjZlW54cuHgfZ+K22ZgVTtSi7ULgvr1EhzTSTvShdeTbV4b7Z1p4eyDLcG4GltyvfBOdeTZPzDqQp5xI5DnyIzrHPAUoHrwhvjPyA5hj7ec099JHucisepv0K5TJszqag+3Qj+dHS3YaXqr11qhIrI7Skl6eYSn+0CJlRnZvsQWcuuezT+Wz9KyW95bz+4GiXeAUly0dB8uMZNVvunBRvUNhjeAb17i2DiXxmpMxR2iwiI8oy5fL8IUzxWSgZgSmpG1j4/95RhFLFUeXpxyDu5x2zaj3/2WHzGnes5iyIYGrOtA8U734cZZaFUPX8mFh6HNUF5A15g2HKgqNYPyNl2jIMdZ4KKT7otk/02beXhWfbaws9YZYL25g8iuxko6KJ7/bb34ZlRzuOAQYsKPf0rWfEMqZVdZaTlmVxHIiRm3dqSCRI/vPWVMq6CUka7+Jjm0WG5WVkdQjln3lMj8reVNM7m/pxqvKMuXuSDO5j53zJoGUVPzMwJ0C8wMASmkQwGIs0/t/IQ8v55FjOMDR/f+yfxhx6sgICLedrIXNHZSkL/YDOnL/yib6oe1hM55m1bl/1n7OUWGJfRWhCeTgKGR8E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(39850400004)(366004)(136003)(376002)(6506007)(7696005)(110136005)(26005)(2906002)(186003)(316002)(38100700002)(76116006)(478600001)(9686003)(64756008)(66476007)(122000001)(55016002)(66556008)(71200400001)(66946007)(8936002)(8676002)(52536014)(5660300002)(83380400001)(33656002)(66446008)(4744005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Wm0mGuAL6PG5bc19aTGC6WOFciy3LgwY4Y2uzviBMm3V/Ejq+dy6Hzo+VWjs?=
 =?us-ascii?Q?woqyig2ijMn2DnMVrC3/5rdBF/v0oXbKnqMZZgZF/19VpcvnVtLP/9VapW7x?=
 =?us-ascii?Q?3gp3RgDjjyfTHpMocc5Bv8vDnog65iiAqVvG31YViz+ON6ILHmM3cEFnayAc?=
 =?us-ascii?Q?VBk5y5vgdDYkFozjHOOdzdSKbtbRzgU0CkGPKfZJSmCQv4fdyve+PJGQzqxA?=
 =?us-ascii?Q?EWyXEAK2zKMbEeCa4CFDXUwrirqWB2vbAFdspe5r+ZYWMgFcrqN8AZhNaAdR?=
 =?us-ascii?Q?ZGJHCE+j18kdIOES+NN99yanYdCyHPqYn1Jn99kGQ60GYx8Zm63kr7XtuBnV?=
 =?us-ascii?Q?gG7r5TblmoJ0EgFuwB4C/08dR/ZyHj1eFntPKVe7RdGo1E3K19FLqWbrbdqa?=
 =?us-ascii?Q?rKMlfwqVkIrksjKUQhct2MIR1YkMITsI8ZHPhUIoRDVFfcMwY5sy4yl8mJjI?=
 =?us-ascii?Q?tj70L0MF+RhBxgQwc6RGSJQINHfTcf/Lp96WkZ3dc4ASal0H1I4OvNPstU5G?=
 =?us-ascii?Q?FIXuIUyOQoRi9z8CTpeL6XxJVmZq/uQ6iTe72nILQu+PRrh0eHm/onDrcMS5?=
 =?us-ascii?Q?2/+0ncvKIeB0Bo5tWhXTemfc6nHnee0mLhWPGBt4O3gUjUirGrrGl8zBTNa+?=
 =?us-ascii?Q?6DRXk0bkI9W8OevRmKJnsszUYrgTC8gowpbNsapVYDxGnhWsZjTVPpxU35sf?=
 =?us-ascii?Q?F0psWHyKUQau8Kk6sjxS+q1Pn1zEc1G/EkPqWrLIejVoRO8WAP4RnK4z2mVl?=
 =?us-ascii?Q?oCLpDvTSY18kgrrNwSFlBiEc4Dd3vL1aNcvv9uPj7s4mmjdf5k3l+n53Cj14?=
 =?us-ascii?Q?Bw2bJzYkqUP9j0Hd8rmvZj1oO3lv2qPo87lxsP0zVHLyYlQunIWkINLoPqIc?=
 =?us-ascii?Q?TXFGEA1E0rDrctB03kJhMlWilUrioT6FGT0Q2L615menFFEM9FYbG6eSSHTN?=
 =?us-ascii?Q?mW45HSOmk3CVMDU7VTHcsA+gX84Wuq2j5EhjWq2HTlDYBbdH3FkOZKaFfSBf?=
 =?us-ascii?Q?B8173DUSSzK7HeJDcfadhjiE7qTJkzL5g8+9/OBkPU85G5eMEeeqdRho0Pla?=
 =?us-ascii?Q?o7XeW/XUhSagOMsB/Wwm7RbGXfwUKPAGtq6AmM/gUFplNul6x98wB3/mNa0H?=
 =?us-ascii?Q?Qbuz2qXFr4QNjQaikioF376sXaLggEZt2GLgKL1SjJUXat2NjQuCp/aY3Elu?=
 =?us-ascii?Q?550iOfXeWauJab7QFucVQudjAhv+hvnvqiBtTjfbc17nVBG9Hpgl4WD9bdNj?=
 =?us-ascii?Q?HUniFkyK33ANW12wjdMKgnFXpLrfyilp1hXTp61kP7pr7xS2eu2IaktyEBoE?=
 =?us-ascii?Q?8DcHZF2hZFy5XWmeM9Sslzws?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edd904e2-017b-4045-4b69-08d92b5724af
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:59:12.5813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dNSnGw01Wyg/Xv1WND2nMNymmeRkC8E0Wkx8VLYd1QnSJPN78aOktTFC32kKDepIHbl8JbWZGv13Jla2FSJzmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4484
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Do not mess around with setting values within tcg_init_ctx.
> Put the values into 'region' directly, which is where they will live for =
the lifetime
> of the program.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/region.c | 64 ++++++++++++++++++++++------------------------------
>  1 file changed, 27 insertions(+), 37 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

