Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C9C42F01C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 13:59:55 +0200 (CEST)
Received: from localhost ([::1]:49410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbLsQ-0008MA-N3
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 07:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mbLpt-0006t9-UZ; Fri, 15 Oct 2021 07:57:18 -0400
Received: from mail-sn1anam02on20710.outbound.protection.outlook.com
 ([2a01:111:f400:7ea9::710]:64478
 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mbLpp-0005nX-3k; Fri, 15 Oct 2021 07:57:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KaENyHuJtFCwWN4OO9PDGUvmawvZZbtYdxUPoifPF1JDC2DFVtpvYihgb4lfUamjreewygqj8wi3b+7325jjOSD3+A0y7f5If0oOhGvP+PcpyQTKgunRey2N+RGBOIaJULAPYbFxgie1K2MN6tpMNJQhs9c5PI37vWX9czrfT8JsbyOxyP0w494fIft9xdwXasKn94wqKZXnY1Zf6eB6/TzGEGC1HsHO864SebyzXiViGwCm69b0glNRyIQVhaJcroCy+iXNySh0XFRR970uLGhEPbKO2Wk5XlIpgYplRs5OGieJ4hYxcVSIlLrQPe5ZjYruC4wCsOX8b33Hd5Mw8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5BoOTvefa29oHhe/Cmy1M5hbJ1oc+mwclWctK6WOpc=;
 b=bsopXL5ranT95KNFSfmZwL2T5VS+IeR1YHsCZuzVgpTi92zAPpVxDNwQn0BlDTLasPJwrjw4CK80FG37wpNjsJvcgqdpT49V/srF5iRwJYE1uRkrvrqfzcr2WN2ZkLdmcYweU9Q5lwRtlOyjuVymAOcpwOTDb5IMAAtA+UJDxRgpa4xGDSwwxbt8Rm0EVwMuLzabkUkUnb4SkhAHH25KeHLuCi1HQquDjUL4FCTKTrDONSVlvwEST/Yc3ycs5a5j5Eq39zuLFIJGl30TIThbRTQ+nv51uxl5Qtg+VjIZvQjIKdrqQguD/aBCqrubfL4ptrSD05ddgInqdhPzsgZ7IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5BoOTvefa29oHhe/Cmy1M5hbJ1oc+mwclWctK6WOpc=;
 b=TA2YHtpimeluEHqVa+zmr7e1yuYWweX/aGyHobiClnSmBnRlUGeLTj6/QbIQE0nbqOuXYZGORdGpQ42lHzejUAjrrQHN2sz6Eu+DQuqXz8qhclrI6D+fQ9TmXIy3Ce6Ki8hwdKA21pUvdLtcMvb5Ly7BZjnJ4oyBrw57v+23WPp0lNbotwlng9DUmv37R5dyCiudzWg5JyTKQMidT6pi0+NUPjuGQ+Qa6rjdL2LCnvBylLv39f0aHFaSpVGmTMBtiLgjlr3mG5Hx5Z9JcBor4461cYp+nwkV/liXw2RwieYbSj+S5Py9p3syAu/kSBmztgr5U8UXv4OtuntSSGtuRQ==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP0PR80MB5250.lamprd80.prod.outlook.com (2603:10d6:103:20::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Fri, 15 Oct
 2021 11:52:06 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 11:52:06 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Subject: RE: [PATCH v3 00/22] target/ppc: DFP instructions using decodetree
Thread-Topic: [PATCH v3 00/22] target/ppc: DFP instructions using decodetree
Thread-Index: AQHXpja4IvIjEbc2t0SH+LWMV6tdGKutUqyAgCWaIyCAAKyBAIAAkGjg
Date: Fri, 15 Oct 2021 11:52:06 +0000
Message-ID: <CPXPR80MB522493E24C3A267E9E1B31EADAB99@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
 <CP2PR80MB36685955837B010A35386926DAA09@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <CPXPR80MB52243FC0D088E4ED5037CA7CDAB89@CPXPR80MB5224.lamprd80.prod.outlook.com>
 <YWjyQlmz6yarA7s4@yekko>
In-Reply-To: <YWjyQlmz6yarA7s4@yekko>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gibson.dropbear.id.au; dkim=none (message not signed)
 header.d=none; gibson.dropbear.id.au;
 dmarc=none action=none header.from=eldorado.org.br;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5abac401-d02a-474d-c022-08d98fd2360c
x-ms-traffictypediagnostic: CP0PR80MB5250:
x-microsoft-antispam-prvs: <CP0PR80MB5250D2842AF2BDFDA3180F6FDAB99@CP0PR80MB5250.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KqwgOGvMGUCCHTB4sGNXD9LAsf6YyiRAuf4Zi4v+eu1xOhdA3tklwb/2/QAk6x/SZ3L9GmlUH0e07MjzzMFCGlCRD3f3IUS9pyQi9Pz4k+rKzXxlrMddCvJLFsvsXw3KCYwbvFpWMbLaeahenYlykd2Fn+gjxzj067jTiAHGVaWUDHPxd9mTVoonMDQMvZ/goqFpBHcVw1ZWTzT4MAa7OVm432qJHBvE5iRt81z/i4SxBuXKngQ7MYM0oKrRMKGfxrT08OkPjI5FXJbWr4otnpLUajUaQihmPRZJd5OQCPGbIklpE+fXtKxFhE0c0ccASbI64Xiv5uZFGcIcTkTGPFLHtQZT0Prc2Nk5lHH7Qdi24zqdymiTqYClmcCX1TnNpdqhXZl2LR6jAJgF0zG+ViSM6uLXiyeS2pcEtnLcjt79sUfxTb5Ha6Exv+zqnSWt4IpPfuyXMmwmMnqEvcwPpVFtsrqd1VJBQrTD37oouqUtynwIn0Fx3hiiLXNVsLrTphcea5ztYn3CbtObkiHcUKCEm/QqHVgDBiAom76b5UVq3X9BFytt3ajYeT4zj+Z5WF5Pv7GFSogVsDQ2MyUMgJTrqVQA+6eTOkkWG0UCTbAZdCOA3WXDGnVYhII061WDGIJJsAacnIAUVPebcEpUdjva9/4R0sldP0rVAoajB7vcuNLRHH38D2IUSR7D7sx66rXintSUZMGhu5xbXt4O0otkmprN86PE0gLPGAyxAYfUT4pMzHiVRJ5n2cwEn8Ag9fVM5f8IrgBSAnRSJoFPmlVU4RQSPZiZFhUUHO6AjDU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(122000001)(316002)(71200400001)(54906003)(83380400001)(38070700005)(64756008)(966005)(66476007)(66556008)(66946007)(33656002)(8676002)(66446008)(5660300002)(38100700002)(7696005)(52536014)(86362001)(6506007)(76116006)(55016002)(2906002)(26005)(508600001)(8936002)(186003)(6916009)(53546011)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zPBlfZU0z9GtYoAxTvdjbFqMMTEpDirajB/HrtlAnmrQHFXJQIEBaCsreSfL?=
 =?us-ascii?Q?Mi0iQlGQEQcz+4f9sDYpfQJN5YEGdNwU6sYRR6bIribH/gQUdznQuUQtyvj/?=
 =?us-ascii?Q?wZoM6099RvAXFBthL9FO1M5TC65MZ2A0wi19cTl4bHrI7Ose0aa6spW1camk?=
 =?us-ascii?Q?2Vrn3vHwWu1nJFF6+QTK8pIzU8fjE1nawDcDBOams+7Iq+mK1UBFia3uFM/y?=
 =?us-ascii?Q?5PyxrHFyvVuqfqbMrGmPxwnCYUhNza7YM2CjR8NiWe+P3XV+qnE0YdBMixmT?=
 =?us-ascii?Q?ZonDEQmYKjxKZbiu2+AZ1GmOca6Y0pU84AB91PFX9fdq04Ct/OoUwLqRXFYQ?=
 =?us-ascii?Q?Ih/nasb3IrUzm+zpQf+tE7YtEXIFiF/NWUv2rQCGxej1ykI92lDkn3n7QLPl?=
 =?us-ascii?Q?jwLCAjGPgHnqB/fJRkfRMiy/o16TnGdqEQj8cAh+nTT1T5rq6PG3zKM8jTBm?=
 =?us-ascii?Q?wDIQpaL4agQYq6wTVaXgR2R0W+C2Zeej37QJfnaCbtFiB36Ko2fk/ElggzuX?=
 =?us-ascii?Q?hWkFIx0WCObYhysZWXjFtEjC1PfvQfop3d/sMLLdlfSZV33FqnzwkAplidRv?=
 =?us-ascii?Q?OWMUswwxl8s4G5/UUug4qLyIbVSbmd5GbaN9J5l4bJhpxYPY8oNEEUlRVOBS?=
 =?us-ascii?Q?HBttmBcF2ErMJgExNFgLqRIEdFvjRpFkhgyfLBIsU610Sr4g2VbTKKcksJuu?=
 =?us-ascii?Q?dIyfgzyGnxddbVraDDi+dZVYkHIis4bNqaqLY1HiaVP9KJIldnRSpj+lt3O2?=
 =?us-ascii?Q?rdrsP6vSgyNrZayjRr0fGkUirexmvOy4nPYfLXJ7jKu2OEvzB2NFfDYrNpRj?=
 =?us-ascii?Q?wv74nwBLW2Agp6GPPsYe+HZ7Izgrx+nA3QTzEanPmOYV8FJZBJ7OAVSaQg9q?=
 =?us-ascii?Q?fROegCQikIxDECudzB0D1ulkPR6ugLw0Mf+RTIPa+QagHMGsau430QuJff7/?=
 =?us-ascii?Q?cbsb2Q1iVFvFRLTYyZ4bdBJ5jBGsQYlWw0dnTmpnyCzf/x87govn1PzaeRrx?=
 =?us-ascii?Q?9ghF5xBG4ebKW9dlsWkXVDFJsGudO53Ui425Xtk75ynp+gpVViMFFMw/UQVC?=
 =?us-ascii?Q?/YB/C+Wpuh1ySDItvz0GrYODi4hRNNorN1dW9cr8QfJTkHlzZzms6tkNKO4n?=
 =?us-ascii?Q?z3ThHtl9pgkaQmf1jpkkzpJiKLpnaix7miHjCcZPMF63uvOrObb9G/jIGSfZ?=
 =?us-ascii?Q?huGtsCZTdBs5ikaXfSg43fOr2F1gOnvWo0D1fxJeqbwmYADlCWaP22QYW6tu?=
 =?us-ascii?Q?u1F3Q7wy4+w36Or/VeXi0LJj0uIScNl065SrkJ1iwBEa9hEWMCQWEa/nOaWE?=
 =?us-ascii?Q?nDnQScRcEE5bIQw6jLAoMUL8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5abac401-d02a-474d-c022-08d98fd2360c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2021 11:52:06.0896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RcRn1wcLEqn18pcX7OvDTsKe60TCdX/e8sKwpkWebfkfVjwzxFvhb2p3i1ztpTwLsOgGBg9S7vLRXHeajWPbpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP0PR80MB5250
Received-SPF: pass client-ip=2a01:111:f400:7ea9::710;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "groug@kaod.org" <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry, that was in the e-mail I replied to. I'm asking for reviews on patch=
es 5, 6, 7, 8, 12, 15 and 18:

5:  host-utils: move checks out of divu128/divs128
6:  host-utils: move udiv_qrnnd() to host-utils
7:  host-utils: add 128-bit quotient support to divu128/divs128
8:  host-utils: add unit tests for divu128/divs128
12:  target/ppc: Implement DCFFIXQQ
15:  target/ppc: Implement DCTFIXQQ
18:  target/ppc: Move dcmp{u,o}[q],dts{tex,tsf,tsfi}[q] to decodetree

> > > Patches 1-4 were already applied, and patches 5-8, 12, 15, 18 are
> > > missing reviews.

Thanks,

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

> -----Original Message-----
> From: david@gibson.dropbear.id.au <david@gibson.dropbear.id.au>
> Sent: sexta-feira, 15 de outubro de 2021 00:15
> To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
> Cc: qemu-devel@nongnu.org; qemu-ppc@nongnu.org; groug@kaod.org;
> richard.henderson@linaro.org
> Subject: Re: [PATCH v3 00/22] target/ppc: DFP instructions using decodetr=
ee
>=20
> On Thu, Oct 14, 2021 at 05:02:59PM +0000, Luis Fernando Fujita Pires wrot=
e:
> > Ping?
>=20
> I'm not sure who you're asking for what.  From my PoV, I'm waiting for re=
views.
>=20
> >
> > > -----Original Message-----
> > > From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
> > > Sent: segunda-feira, 20 de setembro de 2021 15:51
> > > To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>; qemu-
> > > devel@nongnu.org; qemu-ppc@nongnu.org
> > > Cc: david@gibson.dropbear.id.au; groug@kaod.org;
> > > richard.henderson@linaro.org
> > > Subject: RE: [PATCH v3 00/22] target/ppc: DFP instructions using
> > > decodetree
> > >
> > > Ping.
> > >
> > > Patches 1-4 were already applied, and patches 5-8, 12, 15, 18 are
> > > missing reviews.
> > >
> > > Thanks,
> > >
> >
>=20
> --
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other=
_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson

