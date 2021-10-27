Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE5743D34B
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 22:54:37 +0200 (CEST)
Received: from localhost ([::1]:57990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfpwR-0007Rn-Si
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 16:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfpmU-0007Sv-Ix
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:44:18 -0400
Received: from mail-bn1nam07on2094.outbound.protection.outlook.com
 ([40.107.212.94]:2318 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfpmT-0000m9-0b
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:44:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zcd+Iq8hsR8f0FDE1hy9ccfIIV+bsYcTj2ljACCH4SCQO5SJ+gPFFSEjo37HFvstEhVWeScz3RZ+5c5fPyMx5mIIE/1F73noZzxn6H9dJ1847kjIiYZRt5U8hwC9C14z0zL54O+ymfVcwNI/PGRpz4B96ScGOsp4Wxtcuy+gde/h8pU/R10wfynNS2teGrQFN/JgQtkJI5YP0Rgc31xtG7ZlNIRXFvDoimnWKu1r7VB4aMGIvp0H17ZCg0+G7E1KRtGpOLqcR5gtxnUgXbqh/DWs0tBt7WnNH/OMYEwznWV9f4keFc4AjHLfvXD7Nha3mN0ix2p1lJIH4htzMIj0CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z75yBUIyIE6nZLcLXBgDFENhgdDFxDbUvAVFFGfyoA4=;
 b=oOHv/TlDyOfTNWR8jNFMCskbFviabtLSiQ1S9pmQn5QO7/HKhgrvnCe3J6gljxbrtRUIzIdXZZLEHfKhns47m+sM7V5DkeRcjZeEHXl/TxAyxDSREniyieEcgUFDU/Kb51IWW/GeyJpomezUe1rXK8fVKRjFg6n2utbC2sin2A/Nmyd9YltPV0+FzDF8rl+YcMUoURfqqYUgvOrlfbGh72V/2dewkXFetjZfvWQ18e1fhjekJ1E9u4U1lmHIlL2zPqSC/GV9jR9RYMp21yBp8RpSsjgkKl2DiBQ5rsL/CQmX6+Sm80FAcPbt1dYFfyPLgGu/ZtzM+d6E9/tojpP9iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z75yBUIyIE6nZLcLXBgDFENhgdDFxDbUvAVFFGfyoA4=;
 b=MqaiIQ2A50hRhJqbc/0Wug06BT3C+VQ+nxKjA5wTD5iy7WabugA3y1wlWDVaMB5iacFNC+keEg9gMLlPd7aHJwfL/KMVE75nfHGfm2bClsTkAfB/Hfb3sjvMpEpEpT3Dw/t5cbG5DvWxsu5OfMujU3Cr2QJwPZdzK76i9OjkwuZbzkDGaTpfaBHan7OdiavTnP9MRci3ViJ6i7ivcKyv7NC289RSiwMDQF+nhjBoGAGAGhVDrl6OxHUx2urvrH+fQ4xSzT1O8T4RbK7OAxK1S1BJnAE9UJ9L6qkFnR/rfkJ7q0jCCM6VpmI8yjZdqSEeNeKpjFdA6+eIz66Ayo5lnQ==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB5538.lamprd80.prod.outlook.com (2603:10d6:102:10::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 20:44:15 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 20:44:15 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4 51/51] tcg/optimize: Propagate sign info for shifting
Thread-Topic: [PATCH v4 51/51] tcg/optimize: Propagate sign info for shifting
Thread-Index: AQHXyr8auqSZ85ZwF0W0rvCTOyUb8qvnUTJw
Date: Wed, 27 Oct 2021 20:44:14 +0000
Message-ID: <CPXPR80MB52249CC2D4BC33332F111299DA859@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
 <20211026230943.1225890-52-richard.henderson@linaro.org>
In-Reply-To: <20211026230943.1225890-52-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ec7be6c-b9e0-45ea-0283-08d9998a8a1a
x-ms-traffictypediagnostic: CP2PR80MB5538:
x-microsoft-antispam-prvs: <CP2PR80MB5538111CE0D02F5A15CAA802DA859@CP2PR80MB5538.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kMcA9MvdG0iDFpykOI3mLIAZuuowwhynh/HU3JrgI/a27k1GjEJ3y44KF4kHCVP5oCzQHMvw5D3aIO6SJXrHHsf790Krbd9vcPLi3Q+P5d5OHlefyiGziK+BbGjxarzkAPh7ZSgAgcIEDbElVAIKggsDujCziY4rNaRansq4aUFszD0rL1lM3N8sn7efF1vPl7dbfA/i482YaJBGPAQfo2najfV6cltjUYe8gMsYmbUW8ldVpqa7niFj5akyrB9y5VhwbCGXye6b0lraSutMUhK45O1zbFnB+HVEqXT6MlhI5Zeqg9KzjmXQxkAVyjd8GzzsPadFYfQO5H0CRWkIfYpXCXQHw+sa8UhFD/I6LL3Hr5LawwxOEq1dJWyfaZh2RntR7SCpH8hA0gNKp+/djS7sSWWOqkhOO+gnRRwPVuSkYkv2uH7KQ8c6eUSI5D4juYuVeKO5cKzfCRJOwhcuHsq3xQeUKhKbVVqpI4eHnqaSsK1WfK5R070pefKQq+JGR7wflAlFgmKOVETDasXH9VIke78xsEVdgL3Evjavu7lL+0IqzXs83gdNtaI4/iWXpOvexKY+cMmVAt8B+9UOi2RstwiUoy0dGnQhjyh3PuKVysnlMuB/AEXfD0KY8U0TzA+P8sVvrhsAjzZtSPkRjGhRlGwqPzG5PWFAlfmP6yzTH0dqXXAod1Yb25+yx+jP7iZTkFyXmTYBZLkVcXMLUA0kpgRxHz0h9bz9pn1keXzSUCvJMFdyJS/iiE8H2RQ5m2aYa+r+NGar53TtyXX2dtXB8GupyaYFFm9qq14OzFo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(55016002)(7696005)(6506007)(8676002)(54906003)(9686003)(5660300002)(8936002)(316002)(26005)(110136005)(4744005)(71200400001)(186003)(4326008)(83380400001)(2906002)(76116006)(66946007)(66476007)(66556008)(64756008)(66446008)(52536014)(508600001)(38070700005)(38100700002)(122000001)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVVEWVhaYk5PRGRKTndCRklvaHh4alBDd3RGcEkzNGduenpDaVZzUStiRmdm?=
 =?utf-8?B?TlZhUUNuckZHdnpUZHVQcU53MjlhbjVmZkpqdS96aytGa0JXWmlGcXZmU2E3?=
 =?utf-8?B?Ymc3NGtnQTNmZ3BQSndQM2RlRVhnbnZFMGN2Z3dCSDJpdmFJeGM4UjN4WHFB?=
 =?utf-8?B?c3hNaFRsUEtmSVNJMXdnbWN5eFNGVktXQmtMUy9paXYrVkh3cFVyZmNaZ1ZN?=
 =?utf-8?B?Si9kLzVqRVo4Z0g4VWtDM3FXaUdVeiswRjcwN3p5ckxuWVFTczJZU3JqRlhC?=
 =?utf-8?B?RTBZOVppSC9Hb0pUNHY0ZWlOVXdwanprdkQ1TUl1bnU0VjVJdTlCWFVoRCtJ?=
 =?utf-8?B?MXhkME1wRVlxR1c2eDJDSGpXSE9NRVFIaHg5NnkrT052WERiUC9TaUpRbEUx?=
 =?utf-8?B?Y0pWdnFISzYxRXFDQWtOaGlSL0lhb0lvWG1lL3pNVFo4T1BCdnh5UVVjOWRW?=
 =?utf-8?B?R2ZyNmluSmRBbVBydWRjKzUyaTlTejQ1U3RmQ3kxREhIaWZpZlYrMkRVVll3?=
 =?utf-8?B?d2JBNE1XQUJLb3RwRURyVDgzUGpsOWZqSGZNczdCUUJZc2tURlhPK1pwYk9k?=
 =?utf-8?B?emI3RVdhb3dYR2Y1RitRbjFmeS9pS1h6c1IxckFsK0VacUZPRFRPNG5ycmY2?=
 =?utf-8?B?UENFS2x3TVVOWW9rblBQTFMrUngvMEJ5MWhNSUNBY1lLeXErMDErMHJsK1VU?=
 =?utf-8?B?MjdvWEZiSlMzaXpDS1dtakZMOE5EaXRiNDFJeVRMaHJYZEljVFNpdzZIOGxX?=
 =?utf-8?B?NFZkdEc5anFNQzNHMWdXS21sdWtrZloxRkZYU1Z5Q0FiYkd6aXdtcWtFL3BK?=
 =?utf-8?B?QUNWRjl5dVJaRGk1RU5yZE5icXdkU1lsdEQrOHljYXgzeTJoOHVyL1Z4dFJu?=
 =?utf-8?B?ejZCSlFQYlRYQWZ4YklBTHJVRUFMUGZLM0I4cW5kZ3pJK2ZZcmM0UFFPdHJT?=
 =?utf-8?B?T1RMRVVOSjB5c3U0VFhrMWpON001ZFdSSk14QlVWWVd4QlJJdnFUNndoQmdi?=
 =?utf-8?B?RHdLVG8vWTVyOG14U0NjS1VTQ0sveDdMdWgxQ055UXBhOWo3eG5pZS9pVy8y?=
 =?utf-8?B?bDIvNEJFNVZmMUsyVkE0Y2FGNDZpMTVpUEVVbjhTa0VFbXZ2NmU1YmQvSnZx?=
 =?utf-8?B?bVM3VFV2VFhXSXVqejhEa0FVK0kwM2xpODAyeFhyYUIxVWVybFNHbEdJQUpK?=
 =?utf-8?B?YjQ1Wi85MmNBdnNhQm9XYUJDUDFiS2dLa2NObzJBckVFSGZHcXZjSjV6UnlX?=
 =?utf-8?B?K0dsc3B0MEJwREhkV2JLZ3RkbGs5WkVkd3pqQnFkWHkybDAzWmQ4cVl6bmtO?=
 =?utf-8?B?UXBUbkd2eUxJRnkvNW1TN1NESzl0YmxZcHRNdUdlY25HMlQzRGprUzl5UGpT?=
 =?utf-8?B?QU1KWnl4OGFNU0xOWFZvWnBVbGJiQ3M5WUozMlNhU251YWlzN2ZtQk5NMTlM?=
 =?utf-8?B?cG5CMHkxbmJDYVpRR25paFN6TXRwZFhTMk9kY1dTQ2NEb3hSQ3cyWHBldkgy?=
 =?utf-8?B?bmdMZ2ZJK2VrTm5HUFZFOGJzVStDSUl2aDQ3YmI4ZlpJZS8rd3hFZEVBTWE3?=
 =?utf-8?B?Y3dCK2JuU0ZPU2dJdCs5eVZRa2dqRHZVU3JuK1FjWXAvMDIyejFNNFg5TFA4?=
 =?utf-8?B?R0FHMG55RDF6S2dLdjNoSmlIaTU5MjBlR1JMUkxJTHFRU3dsYkZQdkRhT1Jr?=
 =?utf-8?B?K2w3ek9jT2M1WER3clNNK0FVSSs2My9nQjhzUHhsdlpqcGs3R1NZc3FPQmpB?=
 =?utf-8?B?L2kwZ1hWYlZGWXFaNURzd1p3b1dqNm9mOUY5U1B4NVYwMm5aeUczaitMZk9W?=
 =?utf-8?B?Z1l3UmI3N0prQmpRSzhtWkRnNXlMNVRKcWxaaVR1Q1hLc0IvbzJEeWFHb2l2?=
 =?utf-8?B?TVhncG9ZTDFJOFpXYWFCT1FHQ2ZjNzhIM3BUSXZ5L1lJY0RzL016Zit3V2xn?=
 =?utf-8?B?NmxuNVp2YnQ2L0MwbmxRQ0JJUG91MEZjRU1pdlNwSUNEelB5RFFFM2xEVDVB?=
 =?utf-8?B?THo1dlA2SzNReGdIUmxmMVBKNVh2ZTNvU3VYK3FTN05FcVJzdTJMT0lVeWdV?=
 =?utf-8?B?cGNYaXFjZTBiYmFDUUIzL0dnWjExQmYrTVZaejVjMDNyL2lsNHpBSlFwLzZq?=
 =?utf-8?B?WG9yMnVFMkdhbGROaFlvT3hENzJmRmZQdTNZTjNCamZTNThGdyt1YXZGUzN0?=
 =?utf-8?Q?HVxbZ/rFXHAaZtGlde1AKaw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec7be6c-b9e0-45ea-0283-08d9998a8a1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 20:44:14.9333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d971d2/zHI+IeTDiaOb8ihyYlWale7rGrEn44y9srB5stKtTW54eLZwLJgqsXgtv+8ZDZCjsRW0wXUhY1ew2yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB5538
Received-SPF: pass client-ip=40.107.212.94;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
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
IEZvciBjb25zdGFudCBzaGlmdHMsIHdlIGNhbiBzaW1wbHkgc2hpZnQgdGhlIHNfbWFzay4NCj4g
DQo+IEZvciB2YXJpYWJsZSBzaGlmdHMsIHdlIGtub3cgdGhhdCBzYXIgZG9lcyBub3QgcmVkdWNl
IHRoZSBzX21hc2ssIHdoaWNoIGhlbHBzDQo+IGZvciBzZXF1ZW5jZXMgbGlrZQ0KPiANCj4gICAg
IGV4dDMyc19pNjQgIHQsIGluDQo+ICAgICBzYXJfaTY0ICAgICB0LCB0LCB2DQo+ICAgICBleHQz
MnNfaTY0ICBvdXQsIHQNCj4gDQo+IGFsbG93aW5nIHRoZSBmaW5hbCBleHRlbmQgdG8gYmUgZWxp
bWluYXRlZC4NCj4gDQo+IFJldmlld2VkLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxp
bmFyby5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhl
bmRlcnNvbkBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gIHRjZy9vcHRpbWl6ZS5jIHwgNTAgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQ0KPiAtDQo+ICAxIGZp
bGUgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCg0KUmV2aWV3ZWQt
Ynk6IEx1aXMgUGlyZXMgPGx1aXMucGlyZXNAZWxkb3JhZG8ub3JnLmJyPg0KDQotLQ0KTHVpcyBQ
aXJlcw0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETw0KQXZpc28gTGVnYWwgLSBEaXNj
bGFpbWVyIDxodHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1sPg0K

