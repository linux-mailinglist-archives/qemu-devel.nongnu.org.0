Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FB0393297
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 17:42:17 +0200 (CEST)
Received: from localhost ([::1]:51112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmI9G-0007QK-Ix
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 11:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lmI6R-0006Bl-Jj; Thu, 27 May 2021 11:39:19 -0400
Received: from mail-eopbgr740090.outbound.protection.outlook.com
 ([40.107.74.90]:43472 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lmI6N-0005Ja-Fe; Thu, 27 May 2021 11:39:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgXBPE18ogyhmtujB6/oT6uLDwjUWL3e8iJfV4JGNzrom2ZWCryhm4zZrwhGAnqeq0DLQ5u0m5ofZqW/74RDM1BBL7X/GS/GR0Tzt+IsbiMaAQWONVpHGQtLtWAJ08ch/eZLISyemcT5atuRdsSeg1Be3thmReQuRTqFs9X/VC57HpX+F6DrIyzbi0ymKHRZcSzhHPDOr5BPGxKNtTjEiDUhsx7MG4ASOLDfuyCnITiAqexedLXgGKJUuliT1sw5qBarTvfZA65/jSzilgZxtUBzQB3NDiRtJImpT6iDeNUG1A70FKukhkxyjSzHif0rXKo8GHXDPKj2garQ9VbFWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOVGPaY3wbFR9I4ujzC2qlMjK8HNLdnocgqGeJuHG/Q=;
 b=npmD2oj11zNhqPFuYPvI81eqlB9Kb2Z960f7G4aJoA5PBB+c8vNDutrz2K0/yfTKU7p/qBwTsoRlklGnidXpTAFtGGTdnjw4A3mIaEigCvFP8PASRwaTqMAxDtmxmF4HkTmvBYzZ32o1zRe58ypgK/ppKx4pTZH4G/aOX2DX8KgcXxIia3h9vChH/+PAlK90CgQ15r1kehHMixp78jl7n2EXeI88fbK2Fdd8HbJ9TvJSkubQCUS9ZF1zxkLErNXqHwhHLw+xrWofzsGjiQj4738hD/ojnNT4l5Dqh/PJLSxg+IDEdgnsmbsYrzpjVUpqqRJ31OI3x8GyAYApgy+6+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOVGPaY3wbFR9I4ujzC2qlMjK8HNLdnocgqGeJuHG/Q=;
 b=sFAx3U+6bmOd2PMvrsFPBCrPuxCQNiDO31PWSTPFVYm9pvmVvehgWhbJSFkUH270rZBLGYca8e3yaBr7qEl6x1RPhPdJG/7vi+r45xb5sZiQL7VFbbXSOEige+QjV4PkqXhyr3/ofp1jFsV0dgf4xneKv0AGB26ZjzYyyV7bPAKTn0Xu2Nk4ntub7aKkF9PfJNl1WM9+rhNmk5oqoa+7RCVzLkouOkfk2n8r1QgDHFYHcnE4H2M+EFIT23JEdrx1Nl8MmjDt/s6QnzPQZsMxpHE3oiLqHdA9LoiE+F3zC3ioMlp6t8kqCjflm+11FhtvGZi7pmvIg6blFbIh8da1BQ==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CPXPR80MB5253.lamprd80.prod.outlook.com (2603:10d6:103:5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Thu, 27 May
 2021 15:39:11 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4173.024; Thu, 27 May 2021
 15:39:11 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Subject: RE: [PATCH 0/5] stop collection of instruction usage statistics
Thread-Topic: [PATCH 0/5] stop collection of instruction usage statistics
Thread-Index: AQHXUmzV0FK+xanQ8U2anCsT0YoL16r3W7eAgAAE3fCAAAtkAIAABE6g
Date: Thu, 27 May 2021 15:39:10 +0000
Message-ID: <CP2PR80MB36681173A97224276E62283ADA239@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <87v9741djt.fsf@linaro.org>
 <CP2PR80MB36689194A6DF4B3848702C7FDA239@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <87sg281axu.fsf@linaro.org>
In-Reply-To: <87sg281axu.fsf@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.9.76.236]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58a85e77-e550-4841-bd83-08d9212592d5
x-ms-traffictypediagnostic: CPXPR80MB5253:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CPXPR80MB5253531BCE6B0FB662201FE4DA239@CPXPR80MB5253.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6xCSH11C6eOSy6MgJHb9nnSWpGbFEyw/eLfr3rkXuJ+IHa7H5tpfztwpcnx114yOfN3g6jEsNd+taUsEgXieSOD34gTtjk0r3YDdxIyBm2MM9EMU7vjuFShSagKm9GGLQhCm/sWX87Fyq6GjZTKM2g49pkNYdXLbm3IxOcgvK0Ascvg0m4kJL3xI/TaeuurRK1v8HCzrNZ4TaaabHsck3Ez5fCNO5VKml+dMTenV7mdKw26R8WOrZgRLyDM9NucPvjsjRevoR9D33QucNWB7/q7Oa7mrwPudZF5aebAy2hFjK0MSskC2l5/TJMBgzc0tRb2T/lk+Qok1kbmfWUTucrV+5RwzlPWAogeOFwlS3ir3qi5+bLndrKgfezx/e/ttvH48KoC8pk64ufAfqaVyzyAyoDmwcqDV9nN5M2v1efYk4pcaT6umhlBTd2R5P1jvwObKukULasT2V98/se3PT2iSt6lydOOfEJ075NxtI8jt7bHXpDV94iYQv7dvngzHJnppNRTRoJn7nYTbf1tliW5gnNFDByGJ4IsMigIPWk1HRjL6GTanwYhPrjYRz1XHIXKNV25qiS5OlOiBnOAfgUd5ieJJOQOowspAnEsSBiGNgFU9aSdonoFsrm74brqDrPv1rfGg5q4Ah5Dy81yKDR+7rU7vsaUvZsmPOtLf6q0F8jO4lruQ5qzFseCb9aP/KS19x2DNb9/REgNMtUDg/Lu5skZftdjgN75YaZtzzW8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(396003)(346002)(136003)(39840400004)(26005)(478600001)(6506007)(4326008)(2906002)(76116006)(55016002)(186003)(54906003)(7696005)(4744005)(5660300002)(9686003)(122000001)(38100700002)(8936002)(66556008)(316002)(8676002)(66476007)(66446008)(33656002)(86362001)(6916009)(71200400001)(64756008)(52536014)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Q1l3amtNd3V6TzlsU2NwTVRFdWpNVmdtLy9PVVBCR1U0U3Vic3Q1RHRZQ2M0?=
 =?utf-8?B?ZURaTThHK3d0dmJuREpUS21YaXkyY2tEQ0p4Q0JobTdvRXpiTXh6VnJOT0NW?=
 =?utf-8?B?c1FYMjBSaXFmaEtVWEFPeUlUVmkyLzZvVUNXeVI2RFdaZmE3emd4QXVPeUEy?=
 =?utf-8?B?RGM5UVBEdlZqc0ZkWnJ3UDlUam5LbVVVYURSL29lQ2FnK0ZIVGdoamFqUEEz?=
 =?utf-8?B?bldYZ09EcjhLM3A1eHYvUUQ0SGl0T01vTm5aVjU0elIrVkNyTmRWWEQ1UGxm?=
 =?utf-8?B?QTVjMGdNaVFLM1NWNktMdVhmU2ZEcUlPbXBLeWl5NTNzQVdFQWMzVmpXVUtv?=
 =?utf-8?B?Q3NrTVlsd2dvSmFaN2ZBUUthOEIyOURwUlZtN3dESWZiWXp5d25oV2RkeGFF?=
 =?utf-8?B?MFdqU2NLRkNydnBzMk8rM2tZNDBjWDBsQ3VjdHpOdVJyWE1GN0pSQkhZbXdN?=
 =?utf-8?B?UEFPbUR3dzRCNk9zUExTQnRUL3pPdUMzUGhhb3JCRmlaVGFGRW5ueHZzRm44?=
 =?utf-8?B?THN3a1V4WG0xQlV1OVhDY29tNTgremhWY3kzQXY0V2ZjSVJvb3VYa256TFJS?=
 =?utf-8?B?UXVZQUtlNUM1aUtYU3c3QWVLcEVtOXNEc21ZWG92TGp3d1VHWjhhQ1ExRnhr?=
 =?utf-8?B?VUFHN0NOQldITlJYZVUyOTBhMnAyaWFNanBXUm85UVFzd2RReWVVT3hZekds?=
 =?utf-8?B?ZHRKaFlKbml1NUp6RHhOdnprZ0JkWERUcEdzTFJJZWpzbm4xN1orSmVqTkd1?=
 =?utf-8?B?NStpMDcxKzA3cXlTTkFvTFNJOTNrSVNtdmlrL0xWNlFXaHhiMVFqekhpOXRa?=
 =?utf-8?B?cFVrcVhXcHNReWpNaElMNHQyNTNJRkVoTnJCcnRZMUFubnRyOXFIOUZ6aDdo?=
 =?utf-8?B?eXZuR2FwaHhyWmd6S0N1aWNBcFNXNnRxd1QxOU5mdUVZa1k0Z1pCTG0yWWpL?=
 =?utf-8?B?QThXZ2dRVUJVQ093bnJwdDgyM2MwLzhTSXNxNi8xSDQyOEpGRmJTUExDdjJm?=
 =?utf-8?B?aGtMZEloWlRhZG45WGFUNFZ4QVE2QXl5OWVhbWN1RGhtNkJTdm9GMlF2WEdQ?=
 =?utf-8?B?eUZ1ekZxZ3NiTDFCOWk4V3FTd0tQNUV3ZWpEMjNDbFhlS0tnellCZStkcmhw?=
 =?utf-8?B?ek85bGlJKzRHeEd3UWxaSmlYZE9jRDJNZGVZTVVnMENqc3NpVDAyVGgyb291?=
 =?utf-8?B?UTRtOWo4ZTluT3JIaEh3QUoweStTVFdWV2lnMjJzM0dacVJYd25FTmlmOEdM?=
 =?utf-8?B?VHBPQksvS1FMb3g4K0w4N2pMOWpCU3l1UWN3VEpqTDY0K2x0eVlTclZIWlll?=
 =?utf-8?B?NmZFWHBqY3RNN2JKUjcxZytTN1VNYnlmTk5RVitVbGswTjVCUEJ4dSsvSzFB?=
 =?utf-8?B?VGFQL3IzSjRDTkpWVmFxQ2hDSlJuNS9nWSswUmtldnVpNkhlT3ZvaW1BRlVa?=
 =?utf-8?B?Qm9vaXdzeTJHbDV6VGpXQ0p3ZUJvK1h0RUFaL0tmRUZldSt2cUJvQTBIUzhu?=
 =?utf-8?B?WER4MWFzdXFSK0UzUmtSRk9EUW4vT212SGZ2ZEdZRmw0YmtBeUMycDc4dTJU?=
 =?utf-8?B?NmxxSDBqYnlzUzc2Y2ZYWC8wWXpFaUtac2ZjTmRveERaaTNQT2FxLzdUc0ZK?=
 =?utf-8?B?b0ROT21pOVh3bzhpQVdMbk1SRExqcHNDTm9xQ3J4VW5lSzBFd0REY2dqdGQ4?=
 =?utf-8?B?NDh0TCtXeVdXeGprYWNsbjhnME5vc1M2Vm5FcFdBSnRIQ0Vua3o4WnFJd3ht?=
 =?utf-8?Q?QFNJAb1+u9T1wMbBgA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a85e77-e550-4841-bd83-08d9212592d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2021 15:39:10.8544 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Toqj7PW2zRMPh1MqXtQudOivecaf+bBlffmPzwQ3L6wOKT8D8KOw/Hl7AzzdvEDKY6WKZKYG/4kl9gVt9Ba+Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPXPR80MB5253
Received-SPF: pass client-ip=40.107.74.90;
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
Cc: "farosas@linux.ibm.com" <farosas@linux.ibm.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiBBaGggT0suIElm
IHlvdSB3YW50ZWQgdG8geW91IGNvdWxkIHByb2JhYmx5IHJlLWNyZWF0ZSB0aGF0IGluZm9ybWF0
aW9uIHVzaW5nDQo+IHRoZSBob3d2ZWMgcGx1Z2luIChzZWUgY29udHJpYi9wbHVnaW5zL2hvd3Zl
YykgaWYgdGhlIGRlY29kZSB0YWJsZXMgd2hlcmUNCj4gYWRkZWQgZm9yIFBQQy4NCg0KSW50ZXJl
c3RpbmcuIEkgaGFkbid0IGxvb2tlZCBhdCB0aGUgcGx1Z2luIG1lY2hhbmlzbSBiZWZvcmUuIElu
IHRoaXMgaHlwb3RoZXRpY2FsIGNhc2UsIGlmIHdlIHdhbnRlZCB0byBnZXQgdGhlIGV4ZWN1dGlv
biBjb3VudCBmb3IgZWFjaCBpbnN0cnVjdGlvbiwgd2UgY291bGQgYWxzbyBhdXRvbWF0aWNhbGx5
IGdlbmVyYXRlIHRoZSBpbnN0cnVjdGlvbiBkZWNvZGluZyBjb2RlIGJhc2VkIG9uIGRlY29kZXRy
ZWUuIFRoZW4gaXQgd291bGQgd29yayBmb3IgYW55IGFyY2hpdGVjdHVyZSB0aGF0IHVzZXMgZGVj
b2RldHJlZS4NCg0KSSBqdXN0IHJlYWxpemVkIHRoYXQgdGhlIHBwYyBjb2RlIHdhc24ndCBjb3Vu
dGluZyBpbnN0cnVjdGlvbiBleGVjdXRpb25zLCBidXQgdHJhbnNsYXRpb25zLiBBIHNsaWdodGx5
IG1vZGlmaWVkIHZlcnNpb24gb2YgaG93dmVjIHdvdWxkIGFsc28gdGFrZSBjYXJlIG9mIHRoYXQg
YnkgY291bnRpbmcgdGhlIGluc3RydWN0aW9ucyBkaXJlY3RseSBpbiB2Y3B1X3RiX3RyYW5zKCks
IHdpdGhvdXQgZXZlbiByZWdpc3RlcmluZyBleGVjdXRpb24gY2FsbGJhY2tzLiBBZ2FpbiwgYWxs
IGh5cG90aGV0aWNhbCAtIGJ1dCBuZWF0LiA6KQ0KDQotLQ0KTHVpcyBQaXJlcw0KSW5zdGl0dXRv
IGRlIFBlc3F1aXNhcyBFTERPUkFETyA8aHR0cDovL3d3dy5lbGRvcmFkby5vcmcuYnI+DQpBdmlz
byBMZWdhbCAtIERpc2NsYWltZXIgPGh0dHBzOi8vd3d3LmVsZG9yYWRvLm9yZy5ici9kaXNjbGFp
bWVyLmh0bWw+DQoNCg==

