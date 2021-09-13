Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70FB409BD8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 20:09:37 +0200 (CEST)
Received: from localhost ([::1]:37604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPqOe-0001iD-3o
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 14:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mPqL9-000083-PT; Mon, 13 Sep 2021 14:05:59 -0400
Received: from mail-bn1nam07on2109.outbound.protection.outlook.com
 ([40.107.212.109]:19587 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mPqKx-0004JY-2v; Mon, 13 Sep 2021 14:05:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmjFal/tAqiafpZ4kT9379n3mzn9v8LAW2rshYX3+E6Iipj4V63rPHMACE2ZMHVMgmEn2RsIXyhetbORQg3G9iIb5La3RaDnpmcVNJj/XiE/DfQImR7h+gTkP6zSpQhN/BShF3v0t7wq8Y5WLrL9q9lRiN1VY2hABn/9ghs15ttdBESWRaS9+AK6X/dJzyOw8N80KpYIhDttJU6u7Cpb6vexbvY99dx0hXI1k51JPeeiTV2o85LSp766zq+//MIc+Er3udJYNmz5Vzw8g8vVcFee4CyNh+AdPwB780vBYikDwnhNrpjDmBo2veRPhU/VE6HHssXyO4+oWPUtF6CqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=7hgEvryBr4ClN6rWnxH7WgSJw3NCU2HQ6E/Qy+Yi3cg=;
 b=BDDWM6aXJCqpzzSr0ylOkOf58IW7lhNtWoM1fBtiUEEOZdGgSxLDXJPL7bXJKmCOsk2rwOCmxCjfZZQ7FciCKkZxw674bYwQhRCTb213zkm8N48YhXphMydJodP1I9wsGBVpsoZ8RKAu2m2uTPYXZOsCUyJrfAvifi4+gmG8Umh/Q97UmlmI8YxIb/jER5hz6NrNO7v4uUEbYYMhZoixDEWr1XihAJwhMzwvL1mh2mbR0hjR2VaRomjgwCJ+6GbeBkcMzwZpRaYje17lrY9ZeiQIBo4EbVu5NFREEQvy6AHV/+Svs1yQGVaE9ClVkVz0MKVAqcEHZ0ffvQIdpZcFxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hgEvryBr4ClN6rWnxH7WgSJw3NCU2HQ6E/Qy+Yi3cg=;
 b=IpMYn8pKq91zkRnIm1XxdqC+s6Dpp4u3skT7kgO2eZwZx2Z6fOD+0TRlLUA4wikufT3n56aTx6gO5dASk3nPEhGHsNRlhXOCGoDon4bqWK18FghM3LFX87JCW8jruJoRFbHIrgxOULRhEwVIm4AxMzMlRVLK/bxjpubs8Xn84kV2VSr6Ayn4UPBxgSwusb9YD5UUNGoRapSefoe4j/xZLqYvdZmzPzPZD91wxSnU7gG/DoIAnont5yi2ZIje/fyfFB+Np9SbWMpFttM7VwEYPVy5+rr0SkOP/e6hQdBlKST3asauRCNbHdVF6IEj8FY6GSvu3cG1Rx476RyUjkT24A==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP0PR80MB5300.lamprd80.prod.outlook.com (2603:10d6:103:2a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Mon, 13 Sep
 2021 18:05:42 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::506a:7080:4ca3:6c91]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::506a:7080:4ca3:6c91%5]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 18:05:42 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: RE: [PATCH] target/ppc: Fix 64-bit decrementer
Thread-Topic: [PATCH] target/ppc: Fix 64-bit decrementer
Thread-Index: AQHXqL/IrKhTikHh6UKSrVNP5YfTCKuiMi+AgAADiLCAAAGXkIAACgkQ
Date: Mon, 13 Sep 2021 18:05:42 +0000
Message-ID: <CP2PR80MB3668B15986C856C4BF48DFC9DAD99@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210913162758.3806730-1-clg@kaod.org>
 <1a8d9768-7763-91b6-5faa-8e984370adef@amsat.org>
 <CP2PR80MB3668E1FEBAC42ECE29175B94DAD99@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <CP2PR80MB3668565CE360D6FB1E098461DAD99@CP2PR80MB3668.lamprd80.prod.outlook.com>
In-Reply-To: <CP2PR80MB3668565CE360D6FB1E098461DAD99@CP2PR80MB3668.lamprd80.prod.outlook.com>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=eldorado.org.br;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27bec268-01ea-4340-247b-08d976e119f3
x-ms-traffictypediagnostic: CP0PR80MB5300:
x-microsoft-antispam-prvs: <CP0PR80MB53002D35A0A52995ED44C63EDAD99@CP0PR80MB5300.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JGH+QFejbU0CXK7P0yspprsQg0KJU+T16nfuMzQZAHQcQmiXLz6fA6xysPc5shiXsix7zRxDGfkKMM2+JpPbsHnkWf2C2DQGmRe3o3X4Y6NpppBuPY2BX/phxHUIfORrh9mLczkqYOpDOGPvGBDEhJa07RX3iDXhuZBlbDD/ti65WQmRlfzlxdjSA7wg5aJ4hQWGdRvSseXL0Lq3eaijofGNEBYDLSfzHNbok6N5suaQADztV3Q2WgTaFL+bLXg1By2OqaiAA6oQtyiQmm3roRDiWrA11j+TmY9CpGs1OrPPQfsWh8uDwROH1qdBN4MwLzhcXs+BmMirFx1o5x5idyYq6wpwtyTV8Er9nT7dpz1Jxmgk95ZahrGbCX/6xV+a2vNFa2TSOwys3Ov+4y+SNHeLm6aSXz7Ml/KaRuCsI3MYzTjCrv0VXEgMSvNunI3+eabcXGg2Ttoxj3R5hYy/1kmESLNhV6eSGxMxyGcV4N67nRZSDjPnelmwCZm1mZ4lMsHJSFHpW8J9LNawq/ZJ8lc43ooMv5K1VxkS4f7moMsOIAQWCpUJHZecfP4yiBpK1KG4+8CncWc7g7RrcyewNFKSQ4CQpxVPBZSI2zj/EkOtK+zBMoavV3qJWshU31atKMx6Qm7HfSoZSkDF2dDUXNucWDy5fcEJ9JeiG1kVG8XOYObX9y4Y/pxRoEQLAW7wGauBW6mbmH2g/toxa3BINE8LzbRlQgSTuEG2t93btlIhJCUa+ue2Vxlii8wgnud4TVMIw0T+yPVZ5IMfEss+XotcPRQokT3CRM39GfmGImY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(346002)(39850400004)(136003)(366004)(316002)(54906003)(86362001)(33656002)(38070700005)(55236004)(2906002)(4326008)(71200400001)(6506007)(478600001)(122000001)(52536014)(66476007)(66946007)(76116006)(66446008)(8676002)(26005)(38100700002)(4744005)(55016002)(110136005)(8936002)(5660300002)(66556008)(9686003)(64756008)(186003)(7696005)(2940100002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkdsajB3UW4rdXEwQ1U5dEtDYXZDd1dQV1ZrT29BZ3BoLzlvSi9oQkR1ampF?=
 =?utf-8?B?M3hkemNBeHFrVVN3Qi80dkkwaDR2a0x6cXgvTDc0MHkrVXZwT0lUZm5EbmRG?=
 =?utf-8?B?cmRHSnRZSEM1UWh0Z3E5V2Fscms3VmhzWmNTOXU1VHYvK0o1QmxGc2h5Rnd6?=
 =?utf-8?B?RGpIZXAvNWduTXZ1WDhvZDRXbzVvcDVyanVWUkU5SXVmZHZVK1JaRkp6YndG?=
 =?utf-8?B?dk9tTUdaKzVYL1g2ZE5DcVhLNEZFZzhPZzFDeHoveDBvSFBhOVYvdUFuVXlh?=
 =?utf-8?B?UVhlM2xYbDB4QTB1UUVZNXVYSDZDYStqMVVTbGR2RDh6aUJHSVA1SVFSdmFh?=
 =?utf-8?B?RHpmemVzQjhJMVRZV1FjNjE1SVlTMDUzSmFjQ2h6dXZCc2JrckJrMm9MbUlZ?=
 =?utf-8?B?MENML3U5YlRGa2laenVCSEgyekZOci9IUVlsUzFETktaQ3czOCt1eDNwbkFZ?=
 =?utf-8?B?WEtmNUNSWng5TTNXL0o2bW5RVWJNdjB2Ynphd0tNUlU0RnFXb3h2a0tKNElE?=
 =?utf-8?B?ZnB5cHFJVFNjemNQQkpkQ0EycGloc1ZVNDJwSE4rR1J6eWZ3WnRrMmJtSHE1?=
 =?utf-8?B?OThORW5hSm5YS21ad0VQSFNSSm51eHh1N0lHM0FsNUZ2LzY0VHZWVDhCbVFU?=
 =?utf-8?B?SkdNZVdTZnVWVUJubzhKOEM2ZE4zY29GMU9rUjcxMXIxTncwcS82K3JjcHpO?=
 =?utf-8?B?b0IzVHRYbzBJSDRwVWZLaCtJV2hybDFTZ3hZVFV6MDRBNzcyTEFLeHRXbzYv?=
 =?utf-8?B?cVBNb3V6M3YwUWhQK3E4K0J4RCt4ZWY1L0VDbGExSlpIcTFlVCtkSEloaXg4?=
 =?utf-8?B?RkhHWXEyMzQyV2xxSzB3YSt0QkVWZjZGNmhaZGwrbXd4bnVCZmxMMTY1V2I5?=
 =?utf-8?B?SHI0ckIrNGRsc29jVHNuVWt3KzVFbXN1ZmM5MWx6UVJpSzNhTXlDdjhtd1hK?=
 =?utf-8?B?T01zOStDTU5CZzNpZ3V5S2sySnUrNDRnb3pOeENGWlFWRWlPelRhYUova1FQ?=
 =?utf-8?B?M1R2Z05qQWpIaW9xYVZHOGNMWUVnZEVUaWg0Tk1SaFJpV0F6OWtqNHhUNU5P?=
 =?utf-8?B?OUhTbVFNeWl2ZFBBSXBJbGk0WngxWTRpMjJoNlU4d3B2TmlyWnZBNUphYlVU?=
 =?utf-8?B?UzlHM2dVTFJyb1p2RmZaVGJGNGlLQ01oUWFZdjQ0N2o2Wk8yU2IzNzZMQ0Ew?=
 =?utf-8?B?L0lzQzVZalNwaitDL3VqSjFuRHh0SzFoNUpCc20xYmN1N3JVMFV5U2tRNmgz?=
 =?utf-8?B?MENKbVNOVWFSMlIzc1F5ZjNKTlFzbWJqNXlOR3JHL1R3OXJVelg3TU9uVmMr?=
 =?utf-8?B?RVZ0cEVDNzVLWTYrN0VpOU1iT2diRWFUS01MTGppS2F1ckhZeXlpd1hVOGVV?=
 =?utf-8?B?bjFJQWxoSzIxL0RMTzMxbWk5aXpDMWk0UXc3Y3B3L2FZWm9oaU5QalZFUnYr?=
 =?utf-8?B?c3d2UEFzZ3Z6M0dJTC90ZkRCM281OTJXWEJva3VNb2RvVTFkdVc2cUsyeWVM?=
 =?utf-8?B?Y21abEVPNis2bmZiNFpGUjJ5ZUlJZDBJUTRoQ0VKY29oNCtOUnlmTVhMQWxT?=
 =?utf-8?B?NXVJbTZ0VVVxVTNqUjhHL2ZIZ20yUEViRXFBa2RrMHdJWS84d1VlQmQ3MDdF?=
 =?utf-8?B?RnFPK3pEcHVVSVMwQTNqSHdpWklsQ3BXT0JBQ1FXLzRRSzdSNGpqWk5LMXZP?=
 =?utf-8?B?QmwwSVdvOGN6TmNuaVVWK2JJdGtCMWNPR1BTTGdNMGU1aWhiNENLeWhqUzJI?=
 =?utf-8?Q?dAEtGQfi79oUdcJ/2Y=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27bec268-01ea-4340-247b-08d976e119f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2021 18:05:42.3060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AiQDFzA7wnbEkXyklm93P0TAfrMN/w8L0XJp3bDXDiFXpNE+r5jyCc6hx4I+b0r6A3sHhYiyNwE0xGZzm3Ylvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP0PR80MB5300
Received-SPF: pass client-ip=40.107.212.109;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiA+ICAgICB2YWx1ZSA9IGV4dHJhY3Q2NCh2YWx1ZSwgMCwgbnJfYml0cyk7DQo+ID4gICAgIHZh
bHVlID0gKCh0YXJnZXRfbG9uZyl2YWx1ZSA8PCAoNjQgLSBucl9iaXRzKSkgPj4gKDY0IC0gbnJf
Yml0cyk7DQo+IA0KPiBPb3BzLCBzb3JyeS4gNjQgbWlnaHQgbm90IGJlIGNvcnJlY3QgaGVyZS4g
SXQgd291bGQgZGVwZW5kIG9uIHRoZSB0YXJnZXQgYmVpbmcNCj4gZWl0aGVyIDMyIG9yIDY0Lg0K
DQpJbiBmYWN0LCBzZXh0cmFjdCBhbHJlYWR5IGRvZXMgdGhlIHNpZ24gZXh0ZW5zaW9uLCBzbyB0
aGlzIHNob3VsZCBiZSBhbGwgdGhhdCdzIG5lZWRlZCwgcmlnaHQ/DQogICAgdmFsdWUgPSBzZXh0
cmFjdDwzMiw2ND4odmFsdWUsIDAsIG5yX2JpdHMpOw0KDQotLQ0KTHVpcyBQaXJlcw0KSW5zdGl0
dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETw0KQXZpc28gTGVnYWwgLSBEaXNjbGFpbWVyIDxodHRw
czovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1sPg0K

