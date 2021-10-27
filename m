Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6013943D2E1
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 22:33:09 +0200 (CEST)
Received: from localhost ([::1]:56634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfpbf-0003Wc-TZ
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 16:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfpXL-0001qd-F5
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:28:40 -0400
Received: from mail-eopbgr740129.outbound.protection.outlook.com
 ([40.107.74.129]:3258 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfpXI-0006Ut-UB
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:28:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxTr9n9KYIKajvmqLLSOMOsep7190EGc2rb0aYnOYVf/Nz5vk5uW7Op9zyrOAa0hGCqrJwJoo+8rK8/kMf7d3/oiRvbCCDDd4lkUy4SPBzoHsBiobcfTFusAt3fN5GE+2oesVBI+qup/+X1cRCJA5iuTKb1tu+PdU/R+33qoT0+OceWyUKgYum6QvSIoXP+g+7O4L1YIqN67MvHV5TE3JWyClMudw9pV9mgbW/BhXyLusrVydF02hvoRwTUTapV+XZshE1+Phk7fx5eNgnb2Rxj9AUVPH/xTvH7MaJTSkJtybPToyJM2lcCCB9QGqA//w5NYeANFyQzQCbGJHxspIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXeGR4CUAudKGwmjpuFomIcBzOjNOuUjq1X3UgY9zn0=;
 b=XqjXuejtX/6mFJitaQEB14IZu6hilUcMmSFBWlHtfrZs5YtbjVyrgzXt5Ms1X2Xj6b86GHLINc/GC9E2r3F6SIisIp/f3HtgtBSenw6WZNr+lbjxTJtDYRst3qh1LQ+8qFbgZnL4g0vzblkfVv//M6pII1cSSj055Cng9h4hMCVJc3FAUz6o4TTPtgdfBNgVuRApfyjthEgR7kAovoAd3lXRu8O6gEzFslfXlrA3L5qd+FXfXIU7ISCiARaBA0jz9WKjRMkCRaQsO2/d9vY2sbP+HzoykqzClJ6rmhMgbcItU0IrJ1bAm4eyUbf2B74M0nIxj47VbJl6l8x5HQPmzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXeGR4CUAudKGwmjpuFomIcBzOjNOuUjq1X3UgY9zn0=;
 b=k9ajy6smpvEkxwYa1q0ZlJygUw8141vOY6UYu2BkTGN35hs5hmUOa1LMbTWxsA9qr9GDgcDkEqKOB/zSyT9+ZT686FI7VHXHZyqyeJV7vu1lEPw5gAwvw1ZYKD+nSM/LCpZ55d20KLZZdKVUayIHoOgAtqB9/787YLystZVlldVfm2sors7isRY4Dh34HMz3N+DkRMcqlkhPS39ehoLWzY4lph1LwEr6YIRR+2D10+NjTro4IzNriX1ol9mrnoKQJ4tXCO3t5+I820tn4UX+wujNQ8tt/mN3AqPjsdCGimM0tpCSo7Lf9t6d1V5uAPW/KRohpn2G9VCCZ/f+T/cdwg==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB3841.lamprd80.prod.outlook.com (2603:10d6:102:36::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 20:28:32 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 20:28:31 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4 39/51] tcg/optimize: Expand fold_mulu2_i32 to all 4-arg
 multiplies
Thread-Topic: [PATCH v4 39/51] tcg/optimize: Expand fold_mulu2_i32 to all
 4-arg multiplies
Thread-Index: AQHXyr6nr2/O4GnC5ECzuyVgYSSXbKvnTMMw
Date: Wed, 27 Oct 2021 20:28:30 +0000
Message-ID: <CPXPR80MB5224F9CF3CA25F7240AD3C1ADA859@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
 <20211026230943.1225890-40-richard.henderson@linaro.org>
In-Reply-To: <20211026230943.1225890-40-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6bbf469-526f-418c-564f-08d999885789
x-ms-traffictypediagnostic: CP2PR80MB3841:
x-microsoft-antispam-prvs: <CP2PR80MB38417935E962241C291473A5DA859@CP2PR80MB3841.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:506;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OgcnGzypjlxhf5jRFonHVM7O59fSsu/AzWWxoEN2YJ5lFjV8PbfQfKGqxcL2s4Rx31ZeJ8t32I1Hiruo0jd7CdOF5NBoFauMU0LrYBsfrfcvHahZO9zq+xEu9+Ss7nwXmi8m/R/+KY3FagpdkkEHOlio0ptKGweMZwFi/Ggg8Gxj0CfKHEdtf3GM7KuqAVY56rX9GXLuXb0srqtqSsutmCLtC/Z2sA+OyHlp7txkzWCOHjt2pp8s/5rjaYYj3/RVZk1xkIHMECi8NhB25aqbGXeBacOG5X8FTxMfEFBIwKOtwXJ6n80mWKCnxwWvhV4oilqPXRSl36homzBURX0KsF9K+6kkV4eAS68gYWDzSfghjpqJH4Ob5gs3j2UcGRYu9RBXGGRxme7iqvebmkqgFDDtiHnBBv22Rq6XUvsOp+LPY2ePoQB/Z7M5+tNzoWW5wgbfloLOHHF+3w82NC+Rai2Et9EyUc2rfZ9Wtovb9uY/p+0IjUJxIdE3iNwu9fXHITkLPDL+7FtYBcUEHt6Ubit3PtACq+Qk2+Hq6/5BDbOnfSuhdE/i87mHysAwrMkMpQ1/ARhkndc4wc+jNHkNPlrtracnLs5bjCgc4TECf9wwKJjmYVVuUEGE6J3/yaSTSb58D0TdKL1r2snAg/b1vmCMI1AaPNziz6nMacVFm5sqhBF3pmI+NpVUrCP7iI41eDbdVgplCjgPXkcSxMDyovHqWWLuHh3pb8+f44OOUPH4AXNWgf05c05vXkJgjfyzr3UWvDeZ2aSEdgY8Q4yeUfFrnQzHG81gOXakQZ7Y0aY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4744005)(64756008)(186003)(66446008)(83380400001)(9686003)(86362001)(55016002)(54906003)(71200400001)(508600001)(26005)(316002)(110136005)(66946007)(4326008)(66556008)(5660300002)(2906002)(38070700005)(7696005)(38100700002)(52536014)(33656002)(122000001)(8676002)(6506007)(76116006)(8936002)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXUvSTRuQ0pHdlB2WW1xc3hkMmhySHA5UWtRZitlQlM5SG5rZUZLUExZdXNi?=
 =?utf-8?B?S29CYVdqcDkxbDlQSEI5eHpTQ0xpeXoxd0RhZnFob0s0NkJWTTlFZSt2UlBt?=
 =?utf-8?B?SzN1WGxVdVJudDBIbzUzRFVsc0x0cFRVakc5UEQvZGtWa3F6MkJGeUgxT2ZW?=
 =?utf-8?B?OTJzNXQ0dEloMVl6c2hLTFRQMVd1eURXNmxWS3BWSU5mU3JlK0V5TE9kM2M3?=
 =?utf-8?B?bitQKzFKcEFBUkJycXRlRDc1cU9XKzdOOG0wb2h5cm5Rem5vdW1VZVJxWHhH?=
 =?utf-8?B?NS85RmhoS1VQM3NEa3lKNmMya2UrSXNRRVVnSnhKbUVSejJuZkJzSmg1ZGQw?=
 =?utf-8?B?VGhzbGxCS1huMjRFT0l5UjJXaERZa215WnhqRGxJRTFRYXAwTHFjeXFpU2Yr?=
 =?utf-8?B?eVczVU5lOGl1U0ppTkcySlBtN3VVWm5xZkw4bWF2MWd6V0M2dkluWW9rSkRI?=
 =?utf-8?B?c3Q5N1pBWi81VzY0N0ZFbG1kdzJLNS9VZ3JxN3hwelIvMnBQeVVjK0pUc3pY?=
 =?utf-8?B?eWIwb25LaFdtUTQzSU0rS0JTc1d3MHZjbE1aZmdJZ3NscXlncEhNS0g5b0dh?=
 =?utf-8?B?R3pZTmx3cUdEanZ2elFqbm94dXFKTUtISjkwQXlLcEtlZVVRdTlWVnIvUkxL?=
 =?utf-8?B?MWNJWGN5NGQremZZVTlselV1RTJ0Mk40bkIySDF1c2V5RWNsdk1lUnJrTWc4?=
 =?utf-8?B?Z2MzTHhWSWd6UHZndTRiNWx1ZmJ5VWpibjRuR3ZERGNJYmUvMmpDRkc3TUhZ?=
 =?utf-8?B?THFmeTV3eGVITzB0S0pzSW4zVDVRU0NMSnVJMG5yTUVqVmdQTzh2MXhHUW45?=
 =?utf-8?B?c2tDZTBjS2tMQndmU0lOTG10ZDBSNDJobTg2RWs4eFU0djdETzYzbExqaW1W?=
 =?utf-8?B?ZXNtVUpMT1BXV3dNWVZVS2lYM0NWSFQzN051M0JrcVJOSHE3aEhwSkFzV3lJ?=
 =?utf-8?B?TWk0bFlVSkJTcUIvRktOMzFxRW51MXBURCtPakRiU00zZWVVTG9VUjdrbWIv?=
 =?utf-8?B?MU04TTN0bkpTUnlNcnBsYkJzUmltdlAyNGxNUEhLa2Yyd0tZQVhRSWZmNW15?=
 =?utf-8?B?WGVucTExTzBoZFlTcmg0VGkzRVBqY3FMNGk2b1JHalhCU2R0M1RIV0Vka1l2?=
 =?utf-8?B?ZlhlV1JvVkVoTkF3THQ3ZFFTQWV0aVhKWkFVWlo2YVVUeXg2NWR4V1lSYU1L?=
 =?utf-8?B?OXd1eExlQWFLL3JNZnBpUUVneDEvRSt0TG5NSEJKNVVJV3lwNGJVWDJ4eEh3?=
 =?utf-8?B?S2x5ZWZzcUZ1dnZuOVd4SUtQR2VrSVc1am5RbFR0UEN2K3pFaTNBL3MyclpV?=
 =?utf-8?B?SGZJbUtHaUMwc3ZsK0xob3d6R01SR0VQNnduOWlLY3VCUnhGbXNvZzNKRXZM?=
 =?utf-8?B?dWNycGNTWVZzcnhLVHhHNzBUa0NZeGtGdWxITXJmQ3J2TnY2WWVmeldIK3pQ?=
 =?utf-8?B?LzhpNTl2SnNrWldwZytOeTNvOEk1dnFRZUI2NUhVYWU5cVVBejRQUUNpT1Fl?=
 =?utf-8?B?cWJnQi9EdXFqQUIyUkRkSEZCRFJLQ1BYenRwUnVKUjBxOTdnYjJxQVduc21T?=
 =?utf-8?B?dVYvbGRnY1F3bkFBZEJXYmQ0MnpmSzV5UWlXRSs2Y2M1SE5xREkvbE1Ib00v?=
 =?utf-8?B?WFBaK1g1eXBZWldqei9FeDhaVnBDYVpGcUQ3VUNOejg5WkxlZXJRa2VKM1Ja?=
 =?utf-8?B?NTh3SGJSKzdzR29VNkxKcURnamFYenZ0QURLYVVNR3gwVjBwRHI0ZjI1MmdL?=
 =?utf-8?B?eVF5TnZaU0dsVW5KRWRqZmk2TGVINkR4MEx5Z3BwWGFKU0NITmF6bmpqeUhu?=
 =?utf-8?B?VXY3RDFMejVHekhrbE9BVDgreENMMVVWcFJJVWZDaldQSmtHMS9aTzJGUlBi?=
 =?utf-8?B?bXQrekFsMVZRZnB6RloyeERPaGQvOTVVeXdrMk90Vi9ValVveDlMWGttU3Bh?=
 =?utf-8?B?MEpmT1k2ZUt1Vjk0clNYb1I4bHdmTnF4MXhjenVhdENhRm02cGtGQVBvSmNm?=
 =?utf-8?B?YWFISC9JT1c4WkE4VUN0bnI0bzQ5WVpCVnhCNHlxMGRablFSUElDUDl3djhS?=
 =?utf-8?B?cUozVkxhTUQ0Rng5bTVYM20wcldWb1U2bjFLdU0za3lQL3pXdXBHSWZHTkJ6?=
 =?utf-8?B?dkFXWG5aR0sxc0pnNmU0Qno0aVdlK0hRbWZpc2tEbUl0RHJtNWlQOTRQTkdk?=
 =?utf-8?B?Nmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6bbf469-526f-418c-564f-08d999885789
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 20:28:31.0467 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SPQfu2t5r3Gq+eDDmFFc25yLUFuEq/ZRZraZUzWyakdtk6eq3rBlQEP3kIpwB2Q+twa9Xh4fIljH6MzuV1oEkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3841
Received-SPF: pass client-ip=40.107.74.129;
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
IFJlbmFtZSB0byBmb2xkX211bHRpcGx5MiwgYW5kIGhhbmRsZSBtdWxzMl9pMzIsIG11bHUyX2k2
NCwgYW5kIG11bHMyX2k2NC4NCj4gDQo+IFJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURh
dWTDqSA8ZjRidWdAYW1zYXQub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIEhlbmRlcnNv
biA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NCj4gLS0tDQo+ICB0Y2cvb3B0aW1pemUu
YyB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCg0KUmV2aWV3
ZWQtYnk6IEx1aXMgUGlyZXMgPGx1aXMucGlyZXNAZWxkb3JhZG8ub3JnLmJyPg0KDQotLQ0KTHVp
cyBQaXJlcw0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETw0KQXZpc28gTGVnYWwgLSBE
aXNjbGFpbWVyIDxodHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1sPg0K

