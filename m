Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328983A3267
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 19:43:07 +0200 (CEST)
Received: from localhost ([::1]:32962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrOhu-0002KF-7w
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 13:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lrOfH-0000Bf-LH
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 13:40:23 -0400
Received: from mail-eopbgr790104.outbound.protection.outlook.com
 ([40.107.79.104]:6172 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lrOfF-0001sD-Ic
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 13:40:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/gFDibThJZam28b+aFn15awYaneUiph2dh/9aTlDwVBMThnGDavoA2jf4kVCY0Nuua4X+3j2i+y/SmZRCvaPuI9bO5MVGX6+iUT0/eVk2sd/z6C/w2uQMc2GYkL7ryBiBbbB3wZ9OzlrPAVQZk2WEylLdlv6gewp7vS2gEdN62ADj+Chb7uExa9/hU77Tt/X2LOjlyTnSL3M1HYL7MX2G+RVBL1COtywyAlog+dNRn0Yu6HjdVbuJAERVVlTjgvhGPMI45/DgUxKuXVho7arfxHIMvK1D3FsojNn4s48feZpGQGu5peHSiXasnWGbDVTU6UnEGQpa/8ZSKcVV+9Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RJHPY1h6aCh/CXqKwTrSmb0BzsbbdYfTdYGwBTsv7g=;
 b=Lm9YiMlyfYVsiZNg/p+s/YxKtgIWOzmSgHsgm6pWuL40Y8GZy5QhzEZ462kSW89CGIrWfLyG937zTahY9j745PTW0ydIP9lEj3f+RcS6qeOCQ4Nz/zoTSv89se9muzvh8tiolA9wONQ7cUTidcFuaS4O9htvYHN/Z3Ydga/VoyDfvUcBOwgFMN5H77DepHxCstx/7k7l/ghlG5A1YWAVIalk7y1PffxZ5FxZE4d/n7vLcd1rF04l9g+K7/4NpRH7O+Zovn8l5LPX8ED2g8v2oa3nGz+2Q8njuHVpOS4cf0H6bN3L/S469KCRfHhWdKrYlAdwbwIrQZtIZHxs/uiiJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RJHPY1h6aCh/CXqKwTrSmb0BzsbbdYfTdYGwBTsv7g=;
 b=H1BqSwCtKPpl0hXZvtQLQVD9/CYRQYxPXFM0vbtZ5egC8ZjzT7C1fzddVe+KxoNzbGmqNRZ2M4GygEf1cQXhmMnHaeUlDSZLI6FQcDzCTL2Rh3vVfJ4yRGt6cHqCQuyl4rxlgrbV7V5yA6j/T4MwLeCi35tbY2usdGsItq0/Rn1So5H7HCv4Dy6Kyrxx30uCfcJKANSe9P42ZdpyYQpA/Eyg3V6u+CegD2R/WjI9C4md1g0KqCS+Pww12HQkRmkdbPcGkPNYlh3ge7CVTypuHXOGAUwzH4temIjf7yNUKCiTj0NHnGZblEzxBW4QpTv9tNCZTcXo3QxzlITSy170qA==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB4050.lamprd80.prod.outlook.com (2603:10d6:102:3d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 10 Jun
 2021 17:25:16 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 17:25:15 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH] tcg: Fix documentation for tcg_constant_* vs
 tcg_temp_free_*
Thread-Topic: [PATCH] tcg: Fix documentation for tcg_constant_* vs
 tcg_temp_free_*
Thread-Index: AQHXXheZo28qNygMb0SLN29eVR/jVqsNfqMQ
Date: Thu, 10 Jun 2021 17:25:15 +0000
Message-ID: <CP2PR80MB36686528373E6EDD221FB09DDA359@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210610164111.233902-1-richard.henderson@linaro.org>
In-Reply-To: <20210610164111.233902-1-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f1ef876-5d6c-4cb3-f9d1-08d92c34b64c
x-ms-traffictypediagnostic: CP2PR80MB4050:
x-microsoft-antispam-prvs: <CP2PR80MB4050237BF413E0B934511F4FDA359@CP2PR80MB4050.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jp8n1BozI443VkVc/R0gk90N52jHP7gZBTddNK/O+OQIU6GTrkDof0810CUHODiFbrWBYVloJSulbWtBjxDRq0de0IchMWcFCvfxloQ6FT58EAZoTmcR69Sl+3Rn119exMgyu8+v3iKHh5a9mNDq2ezAiw2Ngb1zjEzJeisdApWsivAamcLdNcv9racamFtmSdwLdFe8f3rGkvXztt5BdRGiyRgiZz5dqFymzP+WFxFJxNcl+vfoNOfIzz7Y7oVn/vOVmeRPDVHB0dDcdatdmjm1KuInuVIpzRqfCco0kl4Q/VW6ht3vYoNne1xOkwVSQMpt43QZ8+Ap9YhaGrIamSVqZyysqULsvFJ2XnZudrjByr2217AMKJiLyyJUtLTHJ2gJwwMV5jgNPKqgEiEU3VtZp5V6uG+/91AcxtMu3s+Z0lOA4Ls1Kr9S/e3S2VSlTHc6mXWxkQi67HCo4859CbZZHFKOzE+0GTfmEIaWVasEPKdHsJQTuTssPNxhdA+H2sUN5qdwFDr6B37J7rfItLxLB/T4XIxzDxcTmACQjw19gOpFfWwR030+CTvum4MAdKqWjp4ZoJ2yuC3lpzq2ZsH5USoIKfk/uOj8FfdH0/m7rd4jbGG46Ke5NYpBweTVo+DZdtLeCm/+NkTWTSVTM76HbCVEX4WcPsgRhi6mQU+6LMiT1PN1wQMD6/dxCPNlVxbW7kqGM+VglPUl4NIv251szX6hn6NxYP/dEtOHwcg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(396003)(346002)(366004)(39850400004)(8676002)(4326008)(8936002)(7696005)(478600001)(66946007)(66556008)(66476007)(64756008)(66446008)(110136005)(316002)(4744005)(122000001)(71200400001)(38100700002)(52536014)(76116006)(86362001)(5660300002)(33656002)(9686003)(83380400001)(55016002)(6506007)(26005)(186003)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?GRceLiLzAWjFFkHjjoPGglUtBmSh4NS72+QMYNOKeQHATCrdXl3mGRTdpPYY?=
 =?us-ascii?Q?5Umy8fthLAg383vqaRQYbnLwDyOr3D8AQ6EdulN+lVss00yFjqmwK1zSNpTU?=
 =?us-ascii?Q?nTLcDF7a1TjMJWbOaj2R9pzin/LCajoK2eMh4maCxxkpqY3L8vOKh4ARlN4U?=
 =?us-ascii?Q?k7V9ZzA6ekQMpWkzpWdXCJD1nBhYjFH2qPIUE/fddMZ/R5inTY242Fw8xoX7?=
 =?us-ascii?Q?n5dKZOluDpwxDnaIp+oK5nE/GtNrZSpC2IBSXoxUXEnvbz0UNHLtnSYsHmOC?=
 =?us-ascii?Q?foTt6IZI+qnXAiShT/XsSb9xjsaY7nNq64bCHIZR6H1IoKwcqTN1Vyc6aqhU?=
 =?us-ascii?Q?88IBXEUVvMFosBzRv8xZejJ31BBMnvjk11gScEKJlO+QsH8GEN531HDN2gUY?=
 =?us-ascii?Q?FK16VrqTFim7lIUQIAvqVsQLXFnWcs8avZ1UBeSsYQo2AXDbAjeHHBxA430s?=
 =?us-ascii?Q?vHRYE2M3GjOHsM/AuqIUYXu58mPe1Msb0YFlk7bj/iync0tujxu5Ah+H9vP6?=
 =?us-ascii?Q?MP9z7IuW+v2+reIhPwYI5o2sbpbBcPjtLeKIjGnxapx1qravJtfoxSrOnJeM?=
 =?us-ascii?Q?MFKI4+IhdgQUMTs0l1PdXspMPHJXPD6++H4DSqbAhATeaN2/Hvz24vqlMz1y?=
 =?us-ascii?Q?RSzIdn4VtzH2N2pPCFVv79KklmI1cqD96Id0okovohpIX+P4+oVRaqZH8bfx?=
 =?us-ascii?Q?UUOQavqc7PdoaWXjuRFOE65tJX+WLycIV2pMHFO/v2uKGQw1ZZhipKPP2JfI?=
 =?us-ascii?Q?Gs0JHGZn2q1wLP56sY32IQuIOGg/aj8TIrFGORpbKkcnAK45skxkaUiUCvFJ?=
 =?us-ascii?Q?nNV75PesEDztiN+RxohROINTCsaYxtE6bkfpMw2XcGknNkuHq6DkDythcuqG?=
 =?us-ascii?Q?TVkAd7328f3o7wDfUQCZUnYJaU+I99g4uiwDbbylzzgEBaTlLD8l+IRdxHis?=
 =?us-ascii?Q?J2g0czSrdX78D44WHUKS/o3oeRUTEkNHMZExuDhSU3zuFNJCRGxxhtxNLJPe?=
 =?us-ascii?Q?QskeuJhdO51NBG1xkeozKq0fcf9ySkdNwS4xVYQNepSqha8OC9u2SR6N7Gi1?=
 =?us-ascii?Q?qfdOJJBdfYUQOY/Hk3udOhVJia+8Ph6uysR8U6KIc9Sqm7B/S9vfkRNTS2Cs?=
 =?us-ascii?Q?KqAiUCq/welPkMcXJsxa1gGaAnO3v/gVZj5Pi2xEryEwVR/nZe91HmiQdGGd?=
 =?us-ascii?Q?oDlqgZG25jEzEA2yBpPpNoY93OdmJNgdcqcAibfVnp8LpVQRYs8ItCbxx/yB?=
 =?us-ascii?Q?PmslFoRiVy4+GOt/XOaWZbk6yexN+XoGNjtDKenq6vDXrjG2IWQ7gvjCbKk3?=
 =?us-ascii?Q?7NuUPOZnbNIACNcLdTxnI+fF?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f1ef876-5d6c-4cb3-f9d1-08d92c34b64c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2021 17:25:15.4887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QteA37D3X1wPkb82SdHO2T93+QEXKa9yvXUTvI1AJeHAUYydV7uCo8r5PoTN6jr/vaYIRoNfBf7Vq+bmBEAMnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4050
Received-SPF: pass client-ip=40.107.79.104;
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> At some point during the development of tcg_constant_*, I changed my mind
> about whether such temps should be able to be passed to tcg_temp_free_*.
> The final version committed allows this, but the commentary was not updat=
ed
> to match.
>=20
> Fixes: c0522136adf
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

