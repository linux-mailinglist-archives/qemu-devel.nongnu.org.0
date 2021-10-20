Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD2D43561C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 00:49:24 +0200 (CEST)
Received: from localhost ([::1]:59790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdKOh-0002iW-50
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 18:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3w-0002zU-3o
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:56 -0400
Received: from mail-dm3nam07on2096.outbound.protection.outlook.com
 ([40.107.95.96]:15009 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3t-0006yZ-Eo
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OmuuiYy32oBkR0Thq0HyKgiNkmYJtBtcGNRpGanaRuCnQwx5kHCj+6Ue+GZmmYmeOPnt/kJUGWZ6NyijwZGJKKRnLd0avitMTkn9+Jfn0zzeeJumEhI9xZis29Hnf1jWe4nYfjEXc+zGXrOssDpskasX+htaMtD39RV7EhgWWFfoj/cIe95ibQ3z06LDfZ56uZIfeCPO+IAeb93KB8CmeoRthTcG/ZyJHZUbjs6YtDoc+bh14kTvJNzyYxxTq4FJYH7Qu5oLENcRf9ClQ178U76Oh6nkXHfhoLmy3u4iOSdDf/BvbqSWGHiGkzxpoYEP0mhp3pyNmzjc2nMfuQa3qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pj1CMbIoNINDVccSPl0822DaT7soWp04lX0Imppvk8A=;
 b=kdgQThcpSWS5+OMFjZQWdaUIj8Tj4lCA8vBD8qJH8jFWJrOyLNCGUfo7PbNyEr/5yp0KnR1OLXGEWEc43ZvQDrM5GZRzZSQjNRvUZmoh2QIdzoTwiuPMHla2Zko6r1D5Nn9b7GzAjbxLTqXZ5ypLs73IslP5GiUyBjqFygrGI2OapkZ83q3+EbbPTkBkHL0EeLOJ/XTT9l2fWc4EA9x5QQxJP7IqHXW5XQZYwmDRF5tv0ScKLSP1DMp/gtgoi9GU5gWLzUPA2hy+F8S7iW0GiwYBRTxISm0dr+eSstoyw2JhNYoETVwi0+AW4HJlHUHqOHmlBaRUkd+1y2q3N2j0nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pj1CMbIoNINDVccSPl0822DaT7soWp04lX0Imppvk8A=;
 b=cPxN2akG+axOv9RauZiGOqx4zGXr8qCvKhmSKofwMUisN15yM5Kzjk8mpEeMSG1YbalrPyaHyltwwA/FHvWSrKKLpu2cC1ZG1vyngqloYGnV29ra0Ge6b8IkLmGL6xD/DFGG7a37z81xtJx2pYNkrMMLrfzOj7aixuBX5Pj4XCItN+iz0Wrjk6KhhMQj+drzxwmgdI81KArqZwg4Mot1LpLUkkBTXrgR0jBaQacNHPE5TjOesoYpgJUWkN7Bw+Cq2fzeuxFrjf7zXYuwXD+mr49KuwejjwfDa1xpP454wJrWHOhQLK7blNFZYwlSaieW2HeMl6y6M+P2Q97es7CD8A==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP0PR80MB5315.lamprd80.prod.outlook.com (2603:10d6:103:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Wed, 20 Oct
 2021 22:27:46 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4608.019; Wed, 20 Oct 2021
 22:27:46 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 19/48] tcg/optimize: Split out fold_setcond
Thread-Topic: [PATCH v2 19/48] tcg/optimize: Split out fold_setcond
Thread-Index: AQHXu7XFeUCjKYsIXUKuNo9UyFqN+KvcipVg
Date: Wed, 20 Oct 2021 22:27:45 +0000
Message-ID: <CPXPR80MB5224AC743792848249166C7CDABE9@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-20-richard.henderson@linaro.org>
In-Reply-To: <20211007195456.1168070-20-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5cf55a41-0d1d-4d7c-ce83-08d99418d733
x-ms-traffictypediagnostic: CP0PR80MB5315:
x-microsoft-antispam-prvs: <CP0PR80MB5315AA5693F01A4E28270128DABE9@CP0PR80MB5315.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OzT+Ica7x2VnUG2PMvOTuLhoN1X55NYS+rkXVMpGOQVwtG/H+wj94IpPpEPEyCGa+Q4S3PDuIqye9YAmV/2n81gV7fdqnXBSPF8KpDQrDokgqbHANdeEQK39feZiAdqkmLMOTNYcUN5RWm7RvEJFgwrMpnK93TYn9dNWlUS8o+PkEurcR4yeRD8gwDsJ36Jw0RqC/63WJUaxfMUPEk7A12HOtJQc7SF51OUXxSekBCCEU3DUKxC5Rn8pZO1d6DKSqzBTPDoQGXpVe5bC8Yjl47DQp72mEvu4q7blrCzrpW4jqT1cjwyYfUIrQNIJ0AdQG2F9juG3X8Pp8tXk2aaNfSIeTGcla23lNvi1xeqKQfu1UlbfwUj9VsxPyOngowK9s0PScTVzm1j7ZV2SOju6eb34MMIuBcgazBiUU9hHprzGvQLrQ+PcpNngL2CPCzLUosuWCK3ThLii+BFhwwc0Eid6hzF4D+9eyf0UdbkQ0PWqCEBmOk5FlzeYoe2fGpScHBIYbS0TaKsTALin0CylWueAI8HWasEiflDuUrv1WUtB/2awEZjgUPQ3SxarM72MqNtM5laO0gbtV7omXRAczNCweYYAV7rgaANZDkiZUoDSf5xLMXBbQVcG4VerA73wtz1vGDMoBN7TPe1m/eKsQeUpmm00HxY2kkCfCEV9w0X5FwDmeelfsIpj11dfuZSFuahEf69q35P6s0H3+jDTa3I1ZTfCwAwCaam4i5FDJ/Hd0qwUPgE6F9IAAbTXi+VWMoDzWbnces/zcqEWA1M8JxkpFtPW8c7zB0SIS9jDiok=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(8676002)(86362001)(7696005)(71200400001)(2906002)(5660300002)(8936002)(38070700005)(38100700002)(83380400001)(52536014)(26005)(316002)(33656002)(508600001)(186003)(9686003)(66946007)(122000001)(66556008)(55016002)(558084003)(76116006)(110136005)(66476007)(64756008)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4X285I1x8F3UpGYyjWS8W00rmOkjB97YgNKP2GXrCv85bvdW1U+a/zh9oiX+?=
 =?us-ascii?Q?Jf+aTms9klr0+Jhs5NBn4lQ8qVucMsOrPKH+LOwEGPIo8G/ALwMxpxNO4rPQ?=
 =?us-ascii?Q?/qwgbrQFprveW5L42wrcajOE39mB0osVYTLnyT1Q0w4SjB2MJrxw7Ul+HXJe?=
 =?us-ascii?Q?iPkTzfctYhXfkzX6s3GN56P8k+UtoTx/pxWls11dIFZWJdnbtMJw4PtPrxJw?=
 =?us-ascii?Q?MoCT+sDBv+wauTHw34HiBZ+m8wzxBJUsPy1g6nBV66b9EB49OiJ0a6dts5Vr?=
 =?us-ascii?Q?dEiKTx4xedGMyfw+Vs6DGIHpMA12yvR3sb24gakt7DiWd1GfxEsyGCw2H080?=
 =?us-ascii?Q?NKieAa21g/CSUa67gEi9p2Ll9BUQ3pYV3LChqq4eOlN51yS1/ZqOMaMmvg2C?=
 =?us-ascii?Q?OpBxQOVDeBvXL/B3lMoKrbvxQfg2ToF3QDKLEGhqP9t5/VRxDHU+uww0FUBM?=
 =?us-ascii?Q?+Rc1zRWNlCRnVFPr6ZcSgCvenEYH9B6+NxzdUusCziaY4R+bHQ0Xf+5h+SpA?=
 =?us-ascii?Q?RKq6dhkHIxXUIbMMKyu7GragopbDkCF9eodZLeC1VA1iesM1Jzf1Jhr2AkUz?=
 =?us-ascii?Q?02YDPFXaPM4wJsZQPcchGjSiM/iexy6Xihe+jiI7o9lOLnvkJf+lEZSLya2s?=
 =?us-ascii?Q?SxoK0ZAMEDUBPa4gdnZYJ7Ja9yA8rLYHRnw2HsY9d01nxVQm+Sxqs/FB+QyK?=
 =?us-ascii?Q?KlRfEKDZ049uFIToQLawiIvVROnze5Hmf8IIv+AwxgSFTSEarEH3WihkzI2n?=
 =?us-ascii?Q?/oNTwrHno0MC2tkVQifdjJ/c+ObyXJ2v01TFInIkGlQfqRaRDcx7TAweCfFC?=
 =?us-ascii?Q?v88vs42wfkyX0PInkW/QgX12Y5gjidmXAyB1aeSGTBVmWNI4DwWr1Hiyj7om?=
 =?us-ascii?Q?SgkyCdOBAkhFuwq87jVdiC0LHF1Sx+vP5Qc5tMBoSVDBRor1ACuOwjWqsDxH?=
 =?us-ascii?Q?EVKu/cXTcAQHlhb+FDB0IU0R3g0aJyvUajgZQobO4MKNJdfA21fdz2Jle06l?=
 =?us-ascii?Q?HhVZGrKjWvWP+eeVAYRw0ypQSqFdlQfCMilqWx5vp+wvGY2WviDyp3dnP9Mx?=
 =?us-ascii?Q?SMEoZxObLG/25fTsNCqbYlZO9nOC8MFKCaGpDnyfOASUtVExA47wlAkuE1HR?=
 =?us-ascii?Q?1o4QP/uE5706ZnWpd2rJ2qh1IS4h1MLbSZ5wJ2Ah1oRWgCoTiL8plBILKQHh?=
 =?us-ascii?Q?48SASSOwQDr+WS498cZcz/bJQM7wMJotx7xBQMZL3iQCMRra1NhYlPO5BLhn?=
 =?us-ascii?Q?VwEG+1k9asOAFpSYegnaaK+5SeAIZu4ZJQEvRy3nqNoepcMF0icOzLedubVJ?=
 =?us-ascii?Q?imy+eD/tGnNSXddon66SHAU7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf55a41-0d1d-4d7c-ce83-08d99418d733
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 22:27:45.8389 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP0PR80MB5315
Received-SPF: pass client-ip=40.107.95.96;
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

