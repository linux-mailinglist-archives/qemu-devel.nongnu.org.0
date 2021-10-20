Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B35A74355FC
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 00:40:27 +0200 (CEST)
Received: from localhost ([::1]:43180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdKG2-00088r-Pq
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 18:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3x-00032i-ET
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:57 -0400
Received: from mail-eopbgr740135.outbound.protection.outlook.com
 ([40.107.74.135]:53168 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3v-0006qY-Qz
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+NruXuQ5ZgCKNL6uCwDg5iLcxWnmSiF8+OR+8ouXW7luzXQr3DaFpEHbKC/kblbXvDjm44Ad5rCTsYfILhfDCvd0kDrZZC/lJnmuX+sJFQCiE96iolX3KsXngx5fUjlF3g9TsT4iwwnztrHPCs19OcZkb0qmshJf2u5SUKkYUeqxciwzw9bKG/aJ5sPCLOjVG0NjjF6RcRmZ+JQz7IIYwp9mvDXujQYH+34vKJY+iDissK9hMjHVOIXPzNZCeOXT9PkegWBuLQd87iJAkVr5cBMn576AW2wqWaGjPXXJ3ioFDMeQiZH3H7dwugS07Ux+dwyv07mBM0bIWwYKG4Ajg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4N19pldXbthg8lFW+kW81puGwt4PZCpF364D6ifHCo=;
 b=JB+wnNn936S1B6bo7DSlwrt2BWepOouM01eKYArbvbUUHiKsmFS+zfJGPsrPCP7T54tYWyDDcZwADCoC9ny0e7tbu12Ngq90SYq90dSNDzq9JSeU3hm9d2hsPsDJan2/voKq87JmOC5anCgqXE8kMa/uMPD8EwTaOFGLWXsQtn+I0S+0ln0tdAl5PU+JPJDqWHNFNXqaMGfEIjQg5f5SUiASs4Btcp5hNvZ3SjuTNLL3OraVo28rnTVMjef7NtyUjf1ZObPjTniPZ/lpOLIbpg+R9j/iGMptnagki88ty8Y8BKod0CpTi/6uJV1/r69HyS5kpO0YJta6sSGh+Ntvnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4N19pldXbthg8lFW+kW81puGwt4PZCpF364D6ifHCo=;
 b=MQsqD53W2geEteaTc+HI+met8nIcvzkTbYvaDr+E9Tzr5RIPrsRCAnnxPMNiy6cFI4HpGFGkfokMptKxgxRpm5V6apIDDl7whBfsxE6B0/disKIsQztw3ZOvuIRcHibzX6WkvlYWseXB2o4BJOn/0iEyYGv+jmSKI4Cw0E1aRYKlPwHygdLWJj8Gm821k3ZyJK4E1RNUe/0zflxCoiNyuGKyJDiR5ZtwldjsSGXDYzpI8Sq5jGcTHpJqS8EjPJKT3T6CoZdVaIcT5KAArH6tLU9hKyw6ORv/FR4rQ1aEyXeoZH0N7EVeoJfzN5+rOZ/mnZl8GpXFZOvp6teCnpUqOg==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB4482.lamprd80.prod.outlook.com (2603:10d6:102:49::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 22:27:13 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4608.019; Wed, 20 Oct 2021
 22:27:12 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 06/48] tcg/optimize: Split out init_arguments
Thread-Topic: [PATCH v2 06/48] tcg/optimize: Split out init_arguments
Thread-Index: AQHXu7ZGk/IzHcdTPkaQuyhY4ZjQiKvchXLQ
Date: Wed, 20 Oct 2021 22:27:12 +0000
Message-ID: <CPXPR80MB52245FA33386B28F356BFCE4DABE9@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-7-richard.henderson@linaro.org>
In-Reply-To: <20211007195456.1168070-7-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f550a2b7-e511-4610-ed30-08d99418c382
x-ms-traffictypediagnostic: CP2PR80MB4482:
x-microsoft-antispam-prvs: <CP2PR80MB44829D4600EF53057F2BCB9BDABE9@CP2PR80MB4482.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vRthl/xXUgVUJ1if/Aoy9T/lS5wc2KPDqWrPHSnd8grRVlTkaZcz9+WqTQ1UOQcWS9aJFc1yHkp/xLxwUHlD/OS5a7yvNBH6eJNGDWMRnTSPKs8eKZwsZ36SbsCpB4j6+0QZQc+XRWk90rPNZo6Ul2gnaAyCJ9Moj78RqJ/1VaOSOWU56MaVUkExClMjL1IcTLgw67BEyE36/0uTZ60b09su0sVJMPz2JYsN58yBmeZ6UqHV1De6ycTveIpBS/jQf/xgeGUghD9BBFlQ758DuC4I+NpEocOC2xDjOiLSWpvktWb/Z8oU4r2EpNnJZbFX+kSR2U1Y6Cfp2sZuB32XgnWYBcLWVBUUACu4vJI+4QcIPD7i99h5MfBe7Np6ciI9lz3RLJgSudj1GpzEv8l3GvbknxaHWBGeOqa4aBZOorPpn3o/+VvwyWFTjStwNxuFmoUsopjoc9YbFOhQBEFR11H+HWdVyF10+gloEooArGY5iCaEYvMC5FWv15W4PUSvbC2wGymw4zX6fHjt706ZRv4L84xYdt/7lKGjuv3Tp4crflMKnX/OphUlroX5b0IYShG4Nv5I3MPMTrM4eU/9htEcbKVeCEyxj8+x7FVgymtluTyD+3xXPibQuXqrX3cazFSjLzLLqGjhuPQR4FR2IxRNY+hrd1iU+04Wxjazct/BQnEBKqL/iBXNh1D/1/dbaMYzjE2+C7bZkU45Sv5H2z1qv3sCCecwS8ujpa+bQ7N1oRsMm1JGJC86u6So/BtQDmSNCnbl1nHv0es2vVZ5R/d6aAl9ubyYymwicJU+y+Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(66476007)(64756008)(110136005)(52536014)(122000001)(33656002)(316002)(26005)(2906002)(83380400001)(508600001)(76116006)(86362001)(9686003)(55016002)(7696005)(38100700002)(66556008)(66446008)(8676002)(6506007)(4744005)(66946007)(186003)(4326008)(71200400001)(5660300002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3VHajhvaEJ1NkFUZExCck5XRXJNUlp5RUI0MldqTGZSUFNkODZDREF3N1lo?=
 =?utf-8?B?Y3hJblpGNElwNWtKL3oxdUxlejRuc0tldWFoSWk4M2E3a2VlNFNrRHVWU2Rv?=
 =?utf-8?B?emxiYkNGZktkSVh4VGNCWitPbVRFVkc1OGprSktOQXJETVlWNFZkd0FSV0lP?=
 =?utf-8?B?bHQreUhxVFJBYkVFUE4xYmFQSTU5a2doMXFWZlN3bkVOaDVYWURWSGJFVzVl?=
 =?utf-8?B?WFRHUVQ3aEpraXk3OVhia1dZLzUrOTd4VHpRY2hxL1lLb2ZqQVl4RXdTTURJ?=
 =?utf-8?B?aUZzaVJTOGFsQnV3KytpRjIrbjJYd3l0RzIwbU1FLzIwVUYyZ2lwNzhYc1ZE?=
 =?utf-8?B?MFEzWll6d1UwempwRGJUYm9uUlVNMHlwb3JMcW42bDdqaHRBZjB6VHhUMUpr?=
 =?utf-8?B?NVRFR3o4Z0dNVCtjYmhGb0lpWHhwWEttY1FmVzhlbEpGY21qd3BEUnFwaTZo?=
 =?utf-8?B?eEdFWnBIZ1dKUm1IQzdJZExKbkJSQllMQ2krWVp4bjFhUjFiOU1vd0RsOXRN?=
 =?utf-8?B?d050MldSaXFpQUNPQUUxWXNYUDJkNFhxMTFTTXc5b3A0aDNFbTdaNjhJU3Ez?=
 =?utf-8?B?cjZ2NTV3dzZqbXZYWS9vM1R2WU8zR1A2Z2Y2UURxNXV0UlJsODdXdnZvaWE5?=
 =?utf-8?B?NnFUczFQOTFzckUwTkpMbi9aeUo2ZlFIc05malRLaFZiYks2QzRiK3ZEM1ky?=
 =?utf-8?B?SHZtY0ZWeG5YMTVzLytJVDd5K0pFTEpFMUp1RmVjQStJTXF4bit0WmFYa1VQ?=
 =?utf-8?B?bzBWTnMwZ1pZL0VwaGtoeUt1azNaMDRBY29KNFRiN2w2a0xZTUJjSG1jMGJY?=
 =?utf-8?B?aklLb1l4Y3g5MEhWRDJxYVRiK3JJbHl6cEYxdFpxQnk3RXRXaTNoa2ZBM2lq?=
 =?utf-8?B?Wmh4MVVZZnd2dFpxcGE3dlNnaG5wZ0xydlA0MVpXMytHV0gvVFQ4bnFXK29n?=
 =?utf-8?B?NFhHT2Vodmh2Yy9QcmMvVFBUMkJ5cnR5djF4QTArTm84TldwQ2pkbmV4MnpH?=
 =?utf-8?B?L1h0OUZlbnE1T3F3eVBpWUlYaEFvN1RFUEk1WldPTkhkdjh5by84NjM1eVdt?=
 =?utf-8?B?a1FndWhaa2lKWm4xaWJSOWhyMEV2RjdUNkZoelBIeTFWdldyNkg4Vzd4QkZR?=
 =?utf-8?B?MWNzeFNqa1ZXUi9YLzFyZTJZeUJONEZQRWZVakdpYVJrenZpQjhHMU85dUt2?=
 =?utf-8?B?dmZZRCtlb3lSOHI0eE5acnRsT05hT2htcVBNUDl4aGI2U0pkbU1SNm9rTWhJ?=
 =?utf-8?B?YSt5bWZ3eGRLalJzU1VjZ2E5QkpPbGxOUEhVTWIrTHI2bGJwMXhXUW5zVnlo?=
 =?utf-8?B?Q0pyS3l2VUQ3eU5RdGQrNUV1UjlxMGtINm16cVBrYXZPS3BTNFRsU2ZCVmIw?=
 =?utf-8?B?U3BKdW9tcEZZTVFKbkFxZ0oveWxBL2c1MXB4dGloZUVGS25Pdy92UitDRllU?=
 =?utf-8?B?OW5YdGxJSkNEZW1pV0YrUUswbXR1Qzl4UnR1RXlVUmVrREs3ckJLb3gvOVpm?=
 =?utf-8?B?dlNwZkNNNjRxR2J6azFqZlNmblhnUDhOVmhWQ3I5aDMwTlJvcjA1cnR1VXg4?=
 =?utf-8?B?VlNKQkQyMHFiK0lYb2t3aVJ5bFozV1phMmFPZXpPUjE5UllIZ0dSM1dJbVpU?=
 =?utf-8?B?ekdkMnNRYklkQ3NYSFJnSHQrdGM0WFRlNGFlRTZ5SGlURFpvd3pEVFV6dkRH?=
 =?utf-8?B?MktmdlVJMFVJYjdsd3VtSmoxb0w1QjRiYXMzY1d5ZkJMTVlEWmx1a1FyaUxk?=
 =?utf-8?Q?z42tS1wUUjbwO0g9XhNSh284q1uoaylOtC60cmB?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f550a2b7-e511-4610-ed30-08d99418c382
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 22:27:12.8530 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4482
Received-SPF: pass client-ip=40.107.74.135;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-BN3-obe.outbound.protection.outlook.com
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
Cc: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
IFRoZXJlIHdhcyBubyByZWFsIHJlYXNvbiBmb3IgY2FsbHMgdG8gaGF2ZSBzZXBhcmF0ZSBjb2Rl
IGhlcmUuDQo+IFVuaWZ5IGluaXQgZm9yIGNhbGxzIHZzIG5vbi1jYWxscyB1c2luZyB0aGUgY2Fs
bCBwYXRoLCB3aGljaCBoYW5kbGVzDQo+IFRDR19DQUxMX0RVTU1ZX0FSRy4NCj4gDQo+IFJldmll
d2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9y
Zz4NCj4gLS0tDQo+ICB0Y2cvb3B0aW1pemUuYyB8IDI1ICsrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkN
Cg0KUmV2aWV3ZWQtYnk6IEx1aXMgUGlyZXMgPGx1aXMucGlyZXNAZWxkb3JhZG8ub3JnLmJyPg0K
DQotLQ0KTHVpcyBQaXJlcw0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETw0KQXZpc28g
TGVnYWwgLSBEaXNjbGFpbWVyIDxodHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1l
ci5odG1sPg0K

