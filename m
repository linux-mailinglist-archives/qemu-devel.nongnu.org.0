Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7873F9AE4
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 16:31:46 +0200 (CEST)
Received: from localhost ([::1]:48280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJctP-0006Ro-GR
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 10:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mJcqR-0005AE-PL; Fri, 27 Aug 2021 10:28:35 -0400
Received: from mail-eopbgr740092.outbound.protection.outlook.com
 ([40.107.74.92]:60462 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mJcqO-0001rT-JJ; Fri, 27 Aug 2021 10:28:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPGfCcrD9Tx0pkhCeTZYIqvg2RKYznIMl6OWnt657Q5Cdynwx8WYHAo6+XUP+tS/poK4U2/HCi0qoNV+919Mo3ivlD4XReh2z2aZOgGUp2yldvzleYAzX1XGynoLfdZdqn3YvT7lXGmSQeZT2cNLkorExnYpz6ltqYIvZo9HULktzK/VWQ8ZTd9rm/XHj0nEZJZSMnv/6Noc4d77Efj+UIsKlNOre+Z2Znr0dlCTADPTyMRi8F3rJOnqAKc0scG2NCT01lD0KW2RRXC2mHYvoL6z6OZkNMCS6ocLDIeFjvAu5IMtkPSbQrHIRwTBSzI5Wyj6xjvLWtv8Inl1iujQQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHqVEZkD9PxyXestPthXAPp8fvGUYE3fDHEKQwluXP4=;
 b=gAPSqSIt3IEo8kzFqgeckQ92gx4p/sHl3BZ0DPNZdClAzlygzM+obuktZMNlNywXEkJzc2K3MCfSOvOAatt66TDpwLWcuXMQejsPEjZp66Se0mIMEW33JFNaVMb2wBCern7/CqQbYANyBHLPqO7ANLtPazyetbbVTWyDm/zIgbMNUMQs3ySoB+sSGxu1DeHjYXKBKs+Z4dKESQ/Fuv/LBYlRasoPbercz/oT+FJwHfD9x4RENk9M7X0msWKIJ7CucTi6faUl5HlwKc9e7uUz4NazKJjIgzmJs8BNygKv3wAP+Pe24EkzFG8IsBzbsARDUfpP6UXA+mue/JQTtc4ihg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHqVEZkD9PxyXestPthXAPp8fvGUYE3fDHEKQwluXP4=;
 b=FIGFQwZMycvmzy5ZV0gIrr1ZORISOwT7dWfc6BK5ghxDh7Y+3IG1UmAKR8wlAtPSzArINvW+PNXu8mrYS0iAWL/e+8446bmHlpQg8LHti3Smo/FI+zstcMynXF2Lq8qdr/JtwCppjkMutwF7LWul2pv9x9XqNo3H01c7xuMaAHWVPN8cL5wcbQXxthXhzlBVRMXFo+1Rqk30JdKqif4kHJla4ClLPDDSumhxjhLAVZDuFHYGYe0/cRQ5BYNhalqmYY37IfHdvrA2p9ANdex0fTClotDjuSLkzrdLTxcSfZUKRWBEh/77HzQF6vuHEOo5da/VdgDG5opJU0uK6N55Ug==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB4321.lamprd80.prod.outlook.com (2603:10d6:102:31::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Fri, 27 Aug
 2021 14:28:27 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::e937:d612:78f7:ac89]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::e937:d612:78f7:ac89%7]) with mapi id 15.20.4415.029; Fri, 27 Aug 2021
 14:28:27 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>
Subject: RE: [PATCH 02/19] host-utils: move abs64() to host-utils
Thread-Topic: [PATCH 02/19] host-utils: move abs64() to host-utils
Thread-Index: AQHXmPRAdENEpSrR8kmmTHTdl92jxauDlL0AgACYYqCAAH/7AIAAAOPAgAANfYCAAALBAIACrtaw
Date: Fri, 27 Aug 2021 14:28:27 +0000
Message-ID: <CP2PR80MB36683AE8B03D7444689165FFDAC89@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210824142730.102421-1-luis.pires@eldorado.org.br>
 <20210824142730.102421-3-luis.pires@eldorado.org.br> <YSW8TigYwJVIrd5w@yekko>
 <CP2PR80MB36683DC7E9BEEA136FD0DD5EDAC69@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <20210825202638.2vtjxcsau2cghbr3@habkost.net>
 <CP2PR80MB3668D3C0F23858EE7D4610F5DAC69@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <20210825211805.cn6iodnnibn2vd6i@habkost.net>
 <d155f139-2ebf-df38-2fbd-432255d696be@redhat.com>
In-Reply-To: <d155f139-2ebf-df38-2fbd-432255d696be@redhat.com>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none; redhat.com; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03d5a0b3-a6d4-4be2-5258-08d96966ef81
x-ms-traffictypediagnostic: CP2PR80MB4321:
x-microsoft-antispam-prvs: <CP2PR80MB43216724655CC8B0E5550DFDDAC89@CP2PR80MB4321.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NXJhjKuPJJDTFGoR6E8JB2GRBMMK8CGhqblW+pFCMgnRWTnfnS5zgYG7I69x44dWJiN642UrcBvVYWhMMWNt2oIYanWzXy1aESSUFEfjBzz2FFXwQjOcZkhVfAx3NeCirWkujMivYsfUUOw4sG6y+yTy60tCUQ5KXiKGiRldpkMsZJiA0+QWhpd6Y5zKLNyIskfycBbq/SVC8lSB0+xysdZ+WwVWKywWqqPxelR5b8wDiT9Q6HDBRU/FAAxbZs3n41SOBNzedYxonPHIftgqS6PZrz6uvVDGXTPrig1n4ihWdqm3Stv/w5AqcTTqP5NMiEtQxSj2iNm6T+EL6rQ4qfqq5zO0Jgic77X0RLcwViYw+0mP3mjkPbLb97qnBll/PMPAo/xKs0AYMeckMSrFeOE62myB6lhWr3YFB9LNQwa/mwYFcrhxItwcSc46PymhGcZ3jbtJ3MRbawRqTTUZ/sK7RTl+sHAaYYfn7IM/75izqBNAJsFK6c4IwzKP4Jhjn8Fekq3zQQRmZfLkq6n6cW2cp1XVEKzJHHIScKsGqZoR8ixb0v62Y4wttrER3OVt51/wGcQsX13uaP5oXh7jJ9yyLLjuQ7mX5qFqwJWUR50nRsyHuHBDjpBSBmCz+bsLv6yCDI6X3u4norDTo8x43Wh4tjkOUjFFFts0Z7egedxkHfpZNvipDra84tcDURjLQjOt+6a8KDtOOX2o94vFGmvNS7Dlc+OGBWagPgJ+aFHD8zwrgMffsjVF81kBNA/ltd9DBXcBGYCnBktUYM4xq/vAihvkKSKco0B6yPms9n8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(55016002)(508600001)(54906003)(55236004)(316002)(5660300002)(4326008)(110136005)(66476007)(66556008)(9686003)(33656002)(66946007)(7696005)(4744005)(76116006)(64756008)(66446008)(8676002)(26005)(6506007)(71200400001)(38100700002)(52536014)(2906002)(86362001)(38070700005)(186003)(8936002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGJGdGdmeHpuMS9BY0h6STJpcHpMSENCYlNoZmdlSlZBaFlvMXVRNlQyMjJ4?=
 =?utf-8?B?U3VESDdKT0N6dHIvMXJtQ1ZmYXNqMmI0U3RlbU9KQ0dQUytBNzZ2emNnQktI?=
 =?utf-8?B?ckx3VGo4YjJzYkliZGlpd3hUa21wTVc1cEJxS0h2K29KQlhzazA5WG5qRngz?=
 =?utf-8?B?Q0xNV0t6a2huUzZ1WWRkVUR5c2FCM3RFRDg2T2FxQldFbEx4aXROOVNnOGRY?=
 =?utf-8?B?R3BMUDdwKzc1Yk5QdVpCRTl4RVlCNTl2NFZ4M2I1YkxGUzBscjh3NkY4TW5m?=
 =?utf-8?B?TjcrQ1lra3AyZkkyNEwrS2pDaUdkcm0xT1FFcDZvdE1YREkrQXpTMzEyOUJj?=
 =?utf-8?B?K3JrUHZueHRNd0N5Mzk2dVFUVndMS3RzN1p3eTJQMjNmTGxTdWw1c0F6d2VV?=
 =?utf-8?B?UUZ2TG44Yzc5QUhlR3hkZkRTOGIzV3Q3bXM1SHdFS2w2MzhpQWNQWnhsSWMr?=
 =?utf-8?B?ekJTUldob3dDMkdYWlNOUGFDZXhyL0RNLzR6d0p3WjFsekdESUJCZnkzeFZS?=
 =?utf-8?B?Tm8walRic3l6M3VzVGxtRENqR3dSbnd4cWF2eUlnMmd4ME9NL0l6MFdxemtG?=
 =?utf-8?B?Tk9OMVBDc2dJWWNaNEl2TkpyeHY1UU1SdGhpWlpMaEpyOWpaVUV3VUtZRmpL?=
 =?utf-8?B?ZFRjQnRiRGc5ZVVsclFYR1FzejBQR3BCaDYwcGtlRkJnYXM4OGJubTliNi8x?=
 =?utf-8?B?S1RLZllhTWxpQjR5VU9naVQrQUtjT3p2amR4aHluSk9RRG0xd1lWSHovZ0Jw?=
 =?utf-8?B?Tmd0WGhuOGszc3Zvd21JVzVDUnpJa1pyZ2xucC9oYmx1VmhIaVhsSFB2UVln?=
 =?utf-8?B?V0VaaEtyaHZnK1llRFhCTEJoTktpUlVsY3lQNnJnRWJEc1RsbDBkMkI3eHUv?=
 =?utf-8?B?UTc4VkxwS3Q5K01TWm95a0RKK3crNVhiSDN4eFVlWmZSRGVJb0UxNWNVRmJz?=
 =?utf-8?B?d2x3QWhVT1U0QjNESENxTElOOWlxc2NnVGxYd2F5a1RaN1NDcEtEZks0djJV?=
 =?utf-8?B?RFRNa01CcG1SbXhHaW45dGE4MWFMZXoxUGJmOUJPZ2J1RTVDZFpPOXJ2SW1h?=
 =?utf-8?B?eWFKejlZMHlpd2tiR3p5ZDVoYmUrVlVvTVZjT2E4cnFuZ21ya2FLZGRQeXdX?=
 =?utf-8?B?ZlNneTJtWWh3MG9VK01DTFk0Z21OMWFTTVgrVVhKNmlDRkN0R3BISlFPTkJH?=
 =?utf-8?B?V0Vub3NYUXdoN0ZNbnkyNDNxUWNFUk85Ti92bUd5VFZHN2hwV0FPRytXVzRZ?=
 =?utf-8?B?b1h2Vkx0amdXRTE3RlJRU0NxK1pHM1lXSEJzN05iTS9CQ0FqWkdQUThnQnJk?=
 =?utf-8?B?Zk1WZlE5dXRLZUIxbGNQejNXVkNjckttclN3UVA4Ny9mbmp0MGJCcm1TMnZX?=
 =?utf-8?B?eTExd2ZxV0JFTmI4a1k0ZkhnYjRRRE1UbW5mZSs3Z0Y2cDJYNkR0RXVZV0tm?=
 =?utf-8?B?MmlKUmc5QURselBhNHRHMVJDM1F0Y2ZSSEdLb0thKzRDN0RzZWpCZnRESTVW?=
 =?utf-8?B?ZUdHc3FZWUkybTlZenV5STY0MG4ra28rL3VDODA0Ujl6ZGVaL2UzUmZqY0sv?=
 =?utf-8?B?emlLQzBCK1MyeUY3RVZNVis3bFVSRTBKODIwd0dlRG5sNW5UcUVXWGxvVkor?=
 =?utf-8?B?bG9ndVJ6WTQwNkU2UEsrYlY0QUJKWVdtY2J0U3ZqK1NIRU9kek1FVUY5OEdU?=
 =?utf-8?B?dU1QNlYzbWJ4bDdHSDY3SXNKZWptNDFadG8rd0h6cDZYVUg3VWQvK250eHY0?=
 =?utf-8?Q?Ni6utRDEe5Vfp6AdwYWJFSvmugq2OJHVkn7SCjL?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d5a0b3-a6d4-4be2-5258-08d96966ef81
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2021 14:28:27.3677 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tqx/q5s4I0Zeu/T76S54G5i2E8z4H5WKYBpSYphkHrKXkyrufvnwbwpAzx+FgGY3sAD8L+5JD/qRwXLhtgV/rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4321
Received-SPF: pass client-ip=40.107.74.92;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-BN3-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 "groug@kaod.org" <groug@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiA+PiBPaCwgSSB3YXNuJ3QgcmVmZXJyaW5nIHRvIGFueSBzcGVjaWZpYyB1c2Vycy4gV2hhdCBJ
IG1lYW50IGlzIHRoYXQsDQo+ID4+IGlmIHdlIG1ha2UgYWJzNjQoKSBnZW5lcmljYWxseSBhdmFp
bGFibGUgZnJvbSBob3N0LXV0aWxzLCBjYWxsZXJzDQo+ID4+IGNvdWxkIGV4cGVjdCBpdCB0byBi
ZWhhdmUgdGhlIHNhbWUgd2F5IGFzIGFicygpIGluIHN0ZGxpYiwgZm9yDQo+ID4+IGV4YW1wbGUu
DQo+ID4NCj4gPiBUaGF0IHdvdWxkIGJlIHN1cnByaXNpbmcsIGJ1dCBkbyB5b3UgdGhpbmsgdGhl
cmUgYXJlIGNhc2VzIHdoZXJlIHRoYXQNCj4gPiB3b3VsZCBiZSBhIGJhZCBzdXJwcmlzZT8NCj4g
Pg0KPiA+IEkgZG9uJ3QgdGhpbmsgYW55Ym9keSB3aG8gaXMgYXdhcmUgb2YgdGhlIGFicyhJTlRf
TUlOKSwNCj4gPiBsYWJzKExPTkdfTUlOKSwgYW5kIGxsYWJzKExMT05HX01JTikgZWRnZSBjYXNl
cyBhY3R1YWxseSBfbGlrZV8gdGhhdA0KPiA+IGJlaGF2aW91ci4NCj4gPg0KPiA+IElmIHlvdSBy
ZWFsbHkgd2FudCB0byBhdm9pZCBzdXJwcmlzZXMsIHByb3ZpZGluZyBhIHNhbmVyIGZ1bmN0aW9u
IHdpdGgNCj4gPiBhIGRpZmZlcmVudCBuYW1lIHNlZW1zIGJldHRlciB0aGFuIHRyeWluZyB0byBl
bXVsYXRlIHRoZSBlZGdlIGNhc2VzIG9mDQo+ID4gYWJzKCkvbGFicygpL2xsYWJzKCkuDQo+IA0K
PiBBZ3JlZWQuIFNlZSBkb19zdHJ0b3N6KCkgZm9yIGV4YW1wbGUuDQoNCkknbGwgbWFrZSB0aGlz
IGNoYW5nZSB3aGVuIEkgc3VibWl0IHRoZSBuZXh0IHZlcnNpb24gb2YgdGhpcyBwYXRjaCBzZXJp
ZXMuDQoNClRoYW5rcyENCg0KLS0NCkx1aXMgUGlyZXMNCkluc3RpdHV0byBkZSBQZXNxdWlzYXMg
RUxET1JBRE8NCkF2aXNvIExlZ2FsIC0gRGlzY2xhaW1lciA8aHR0cHM6Ly93d3cuZWxkb3JhZG8u
b3JnLmJyL2Rpc2NsYWltZXIuaHRtbD4NCg==

