Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 039403AEABE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 16:05:17 +0200 (CEST)
Received: from localhost ([::1]:56544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvKY7-0000yE-UH
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 10:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lvKTa-0006a3-4J
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:00:34 -0400
Received: from mail-eopbgr790108.outbound.protection.outlook.com
 ([40.107.79.108]:44413 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lvKTX-0005Ka-1d
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:00:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8LSehxuipa9rN+vhBZ2IX47i8rIA7zsZ2sc5PtZc2zuJn4nrffvnbtUxO4Hhb/FiJB5SbURzGZ4wi6DTl2V99M8yOfh+XIUkiAnRgOEki8N1H2x2o3/o3xA10WgELi4heC5h55vpCCNJA04F0j6NDpaoYBn7jAuvMYCKYF588YDBeNAF3YgWHVJAcrQYH28HxthiB0zhr+lZygbczV9nO0kcX1a0HtbjDYaO0SAXwrc1+g4/nnDTisK2RHzzAXevxI90NICUlY5BczJZnji/F6o5u7OFKTbTADFmw+xleHXbiuQMhPlWROTvhKEFe5AWBKdkcz+cRSZKhYUPDmxSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Vb9FR3CwRfvylMbJKFq6gHVflwMJix3FLhQZZihOTs=;
 b=Ti+L1bOpp29y7RfIPdNfBxhUD7FqHT8cwYgO/mFHPk3W37m0dV3nxjtWGUa7mvjBmepW2uopVwsjTlk2zZ22BxjB9PvoPh2NX0LnEJPHKtAkMk4bOjbKvIMq9aixeFAYqXpNew3esNn+3sY2kY5modoU5xmYXFIhXyvKQyKpuzvISjyV9j/A7mXXn5nJff12PLbYMsWBvEhG05q9o/ukaZlEm3JnUAq/4pakZYUMI5fN+yIiwQqjpY9bvJqyXRbtI6dshHaKFX9pKXm7ELpkh22ZHODf4UpPIrM9SF5a/XcI6CJ1ADh+mHc2hlo2NGUVbb6/VZkbZLIC+Iq/i+R1qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Vb9FR3CwRfvylMbJKFq6gHVflwMJix3FLhQZZihOTs=;
 b=huMS6BrKnmnazyMtXjHbTSfIItcSCpjN3Tu8hJZCKByLZGDGjS+ahRUh3BHyNH0P2of2Zm7ogX07RE5DG129UrEJXAvxaQAviLntTNj3DOE5BLbGdtYLcVGPWfQ8kLh3jZvZpfid2a8vLOgNQz0sKYxUUAzMKpjjT3ar06NvXSxBMyDBqI42Z4pUan6LEcpXaozfsTpYrfYDr33/UF62y/OpGOfV4zpwLMWYoAQb5G0Rv0B3Mx6C6fjCHoSVT3qcN52O1HpEioSN2bLdN4KwSz64j6RkN0vN3SfswzuzVRLnl6dDMV/UzmsxO940eikhJ+fAfLQMYKb/zle2WPenow==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB3619.lamprd80.prod.outlook.com (2603:10d6:102:3c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Mon, 21 Jun
 2021 13:45:25 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::45f3:c2d2:5a00:85da]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::45f3:c2d2:5a00:85da%5]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 13:45:25 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 01/26] accel/tcg: Introduce translator_use_goto_tb
Thread-Topic: [PATCH 01/26] accel/tcg: Introduce translator_use_goto_tb
Thread-Index: AQHXZj2nWN89gVBqf0OTOfX2aCxQd6see6Fw
Date: Mon, 21 Jun 2021 13:45:24 +0000
Message-ID: <CP2PR80MB3668E782E6DD7E9F9B1BAD77DA0A9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
 <20210621013439.1791385-2-richard.henderson@linaro.org>
In-Reply-To: <20210621013439.1791385-2-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.9.76.249]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 952756a3-5a22-4ea1-238b-08d934bad287
x-ms-traffictypediagnostic: CP2PR80MB3619:
x-microsoft-antispam-prvs: <CP2PR80MB3619D1D7658C66A90E1F59F5DA0A9@CP2PR80MB3619.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:669;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5Y6Tz7F9Do8Sd8CYXc3+DQAqpBcgi1hFj+O4CGwNHn0GAA6U/gMLRcFy29Eu9LTl340iipEMXg40Q5OPxS3Zt+8Ks1jD4rdROb5Xtm30QqnfvNQ2OvBS+pXGdF3MkPIQSQO3nezs/bFB9EsbG465Szfx1VHVYWxB/83eGZxajkbYDaCuFM2sbvy0nULP+bls+oIdCw7gRUcI9jDvJdDQixFMPlqbGffWrTEmXkNxUt4/NO5utD+nLvUYMINvZUrF7iJEUSp8QabYv8o7w7Kee9jbB26u72qkCDsNp0T7V3w4iDyWbyGYhNXRIZ7/OQYjlSl08Lr9ud6G23Uxvc0rDXzWcNwkCmBOewLmUOAjFx0hzYzTQZwspmloOWhRTttmqG3hzYAo6louoBByxA2GNsqg6Ko63Ahq22QJWKPvrkNhtsa71SCGij0bE5mbRD2Ti6MomKZcs1N/o3R88VjQDslKsclza2ZMoN08xijw0oU+iZejDcxb8Py31QjOz0bXFmleqZgN5+j39GhucfCM5/BXQg/Uj+nAb5ni5tCMgfIVcKksBhH992fzBT+YjQjnyl1Nw3ipqibMcuR49xgdW1FW4CaMqlbI3MRh7AXRbZEqzpdzjG002/JNFxxQN/Ny+Rdna2cuwaGIpeMNdkpbks2JkmYKU/J94VWygCDimVGc5/M+y7P4zAH85UmNKIa9LqEzEnK6gwEj5VMprkshKifEwdTbU41gHIErXxLWgwY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(366004)(136003)(346002)(39840400004)(4744005)(8676002)(316002)(55016002)(6506007)(9686003)(7696005)(71200400001)(8936002)(33656002)(86362001)(52536014)(186003)(2906002)(38100700002)(66476007)(110136005)(5660300002)(66946007)(76116006)(478600001)(122000001)(66446008)(66556008)(26005)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hb3V2/l9Hs+b4C8bGr3Pogg5s+LNJzUHyYExDmK05VnPn59eR7Jx6kyH+NaZ?=
 =?us-ascii?Q?UVgeNHutD1dcTslB9HTEbX9a/afg5bGm/oKYc2A04eRdqkJZ2el9MctiEKEh?=
 =?us-ascii?Q?66+jxEggxrOnZUFdAbWXq2BUinqDf+CWmbyF/usC30frbAPIPEmtUMH6z+C3?=
 =?us-ascii?Q?GJg0THGeOUDWSbAUNPhM2ecDGw8OUrSUVDpRUSt2un/ck2ktulCxglJm6yGO?=
 =?us-ascii?Q?ansXUf/4pboLIfhvoMjHLncQ1hQcLgv8uXEIV470PGZ4BugJnoevImrHMhFs?=
 =?us-ascii?Q?W01UsV7bB/Dz1MnWRHFxaD7N+zkZwV/wH44RWAj0PZLm4TiMIUnCNdTH0Gu0?=
 =?us-ascii?Q?yl2dYceRRxRIqs1shtxMQIt4UzPD1QZYpHNPNvuNftoAcDAatwomNR69k0UO?=
 =?us-ascii?Q?9Ze/TMqmK9Ck+rA53PXTRiPQlm64boyGded6dUp2iXAUsyrVCQ/MECsWgatE?=
 =?us-ascii?Q?1pxLDGytgc/Ymlaf3Gn3ZEfrp/NW5V7ScmU/+a6jg+r6oYV72OpkZHTYvkBh?=
 =?us-ascii?Q?xoDTimecPTyUlTfPvJFdSVmWyKlDyEjDYgXd1JEiePTGGsDsx72BqMbomCNi?=
 =?us-ascii?Q?+7SpBwGSccWcNFb8MJoPAYBjor8zZkSHMotIYd7TpLRs2tWYJY5huTEMejfq?=
 =?us-ascii?Q?nmkRSVKk/wXu9eLNSbpg6d6SNju+dUneJ5A/IGR9yOb3I7hxrRdHN7QjlILK?=
 =?us-ascii?Q?sVf4baquJXcjuUaSD6yeaJXwQMfHpw0shFiIN++Tz23W9hLYUAXA/b9oF63T?=
 =?us-ascii?Q?99k5DfK/rcxXCWC4GsdUwhLcR0vBTFwZFw5ZptHzrE8zjFUWz6+GHOd3oYTE?=
 =?us-ascii?Q?qaGreQm3tyrkyd7VJhlJI0gGG12VmKUMk8TmG0IRIQ3efvmxv8/Z+Y/90vlv?=
 =?us-ascii?Q?+tMvARVY3cUrSQp5xMCq0KPtAnla/armz8JSkSpTt+5LLGldYXuoKz/1smBW?=
 =?us-ascii?Q?tLI1KIsMf7ryf732WwKldfiNsOKsb4Ez4cJc2UvskuIOvA/CYMdw75RQZUPt?=
 =?us-ascii?Q?x5gSVbKjNBOl+cXdEFAHCfmlN5m1LC49pUs6AWY7id5R1gsMxgT0+twNj/hy?=
 =?us-ascii?Q?3cfAWzPDmLGK64VwHIxQuMiJNWaxalPEkFXa63iloiMrKdPBlB0zN0dBJqPV?=
 =?us-ascii?Q?vvCTjm2PgsrXbVqaV56iLeVX0EddbgtWJ17sjV3uqxnLtJtlEyS1Ywl+Pbmu?=
 =?us-ascii?Q?jG5ANvoD9sZys6A8tNrKVPAjVY000YRrPluePzJCFzNYIkRmpxryiNAVDn0c?=
 =?us-ascii?Q?vNPlJO7QTeMOw0zydwvLKxfatcgIjoR+iyHRHHyExbjst/fTF1vMfs7tWuJ9?=
 =?us-ascii?Q?i9Q=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 952756a3-5a22-4ea1-238b-08d934bad287
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2021 13:45:24.9759 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZP5/lpy0zil1hj9pN2dfaPPjZ0y6arQ/Z/9Dl1W7c9ZRoStmhUnjCF7ejgZiQiR2w7qk2MApqCe5bh+KJURkIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3619
Received-SPF: pass client-ip=40.107.79.108;
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
> Add a generic version of the common use_goto_tb test.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/translator.h | 10 ++++++++++
>  accel/tcg/translator.c    | 11 +++++++++++
>  2 files changed, 21 insertions(+)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

