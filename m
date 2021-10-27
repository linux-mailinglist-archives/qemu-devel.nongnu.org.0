Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A2D43D32D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 22:50:36 +0200 (CEST)
Received: from localhost ([::1]:52352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfpsZ-0003VV-NP
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 16:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfpl6-0004uJ-KM
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:42:52 -0400
Received: from mail-bn1nam07on2128.outbound.protection.outlook.com
 ([40.107.212.128]:27664 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfpl4-0000Ly-ON
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:42:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhLx7STq3CS1v64WsdjoNOrlplaAhU8skbzPDFubS+LVoV87+B/S/94kaMciKcX55XVnGr9jgDKoQfd0zs/o3q7U7Ka0PIbcxzmJfIqCRCxwI2+MbqguVM5FAt+Fe8YOItewUGOV5F4+mtvUTDH10pvbderDywS3Y/io3okKzSxrmNTPtUFmthcebiCLtMKb2kKBZ49jp6FSlil/iF3WzV1BF6wBpE/2+31ohLGBjyExy4RefYA96AITAqqHzYf2m6pWvv/ybLzFWHj+nRfkx9rpQtqFJSYTxa022j/ExnW7I7oaJrdNJEwhnNBRERkVJFrXKXwbG5tf1h3jp95+FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uq2BrOMEVezy3wlestaw4VmYqrShhjvDDeTYLP2iCIk=;
 b=E+sRbRWDKc8xANUerQ+pfBlMqMZmFpAsS+4Tf71ofVRNU/AFTIIG2zqWpMPyAdYO2sat8SlSc4PIQXRegZ0Wukpxteeiixn+hf1CIPGe4MSCqOG1Y5g5vGS6PkZCxqnwVz3oyJMThElpgo/CUAkkHFVW2FdToLXn0vGWAEZvYx54WiSsEDdap4Hy7PKX7uZiopI2lqUywtgN1GzZMWDDbvtm5IF3dOfMRxEigktXzlmx2yCxgtzZ4DY3FrEoFm16Zx6YHDy1IrKKKNT55KMgqM/OCDqfY2vAytWNPSw9PnH9yS3GwLZRZTe36GgiwJdkIGxJgXEcP92q66I6J88fMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uq2BrOMEVezy3wlestaw4VmYqrShhjvDDeTYLP2iCIk=;
 b=TpSD0UmRDvvHicqmBsjL8VV8z15h3d0wNc5P62tz2CFM1Kgpy5IDRIFDk73fxKKdax3vgC39O99OCVfD0+H5GWqEJIzccnPhaR39C9Tu0FfWHBNQI3JO+0l1pvVSD4txaeJRSMw6UsfHzWs6xubvu8krwZDvYgQqESUtsleLsP6N072qCW1miptUxNHi+iv8bJNDFLG44hgpTJBN8cyhlv67z+n0zA/L7JpnbTnQPmI3MxcS0FbdHiEKef3REf7ospzOd6ZLDeBoQMOJhqpbDf/fSXiCWln3T6Qk19B/WW5b9mzz6yc5odkxTbhIDNWS6sppb9stkqw7VfG3WymQLw==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB5538.lamprd80.prod.outlook.com (2603:10d6:102:10::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 20:42:48 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 20:42:48 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4 47/51] tcg/optimize: Optimize sign extensions
Thread-Topic: [PATCH v4 47/51] tcg/optimize: Optimize sign extensions
Thread-Index: AQHXyr8YpcRHhqIsbUKI/dXUf+ZJQavnUNHA
Date: Wed, 27 Oct 2021 20:42:48 +0000
Message-ID: <CPXPR80MB5224CCF220278BE2A2F07207DA859@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
 <20211026230943.1225890-48-richard.henderson@linaro.org>
In-Reply-To: <20211026230943.1225890-48-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38520180-9f81-40e7-c394-08d9998a568b
x-ms-traffictypediagnostic: CP2PR80MB5538:
x-microsoft-antispam-prvs: <CP2PR80MB5538A61D83B2C4D5F15AF072DA859@CP2PR80MB5538.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yil7f56JQDT/c1jEAv4ylX/PMpv6+RKGWsM3MX/R/FmhOsLEvH3fZIcYzF3XE2qNu1u06R5HNWSzLoUObLxyqBPseYDHCl8VjFIroGcg8VwMj0OOIdzFaTstdXEy6OAQaNwB99RdE1mr8627Rod160/X/iGTA0qlGF3bKyXOTz3yvFmE5vvTzC4ClfEyTLnpSj+4AbTdDwdeZXVg/4QaVkI9pUii13jxECc4YhUj/PxEhObYmHxQH3vHdjjRLJZH215xDMqJtnxZhvEqqaj4lu3j9Ctv/lC0AG+n0GLwUBBhtcf5AgqocD9Yoxj8kl0PWsokSm+lkUItLU+anSSbch3A8XdTIDBp+6jiX2qsang7IynxJm1vRO3tJ1uefA/roVEWY6LvjcWSg9SU3RwDt8JptqQvzY4yBVOF9XaejKHA0vdK/9+Glu0SSC/KSz942qCcwWk6f6KhGlWSCEmsodPEjtj6KlFJkX8NlzJ4IS2nWt9qoouQYyGI8TDv1NAlj9J6CHVZM7apU7kZyDHwumVzIBTzRS99iHjNyW9Ta7XZyQSawphOyHVTX2dQmcA5kg8XGFnEhKcpXHAhNScUp2bMihcgL7qb4lJBy+Suaf9OIYz/8o0wK2iEoM/5o80ZBIkls8txAg2qlIAxUbFMNmK14ZHOu77e5FDVyRIu6gJmqybY1W+LEUtbgDZJl8BL2e/kY288JSkZ521z1ebbCVBpBWWvYXzfu+LWeChd8OHXHj5K2WNyT2KUVQ4wwCTiC51d7NVvRY9i2uRnJ0/cZe034977lvliIwEK6DUk5io=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(55016002)(7696005)(6506007)(8676002)(54906003)(9686003)(5660300002)(8936002)(316002)(26005)(110136005)(4744005)(71200400001)(186003)(4326008)(83380400001)(2906002)(76116006)(66946007)(66476007)(66556008)(64756008)(66446008)(52536014)(508600001)(38070700005)(38100700002)(122000001)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUhyMEw0YXJLRWQwTlQ4RkJMSWZkQS8wMXNmcUd6NjJLQXB6ZVpGUnBiMWtj?=
 =?utf-8?B?cFZZREFQTVAwN1hyWGV2Skd2cHBEV2U1ZFBTMERzY3BJT2hwUGt0bXdNSkJL?=
 =?utf-8?B?ZTF1WmZwTjlVUWFNNk5xczRPMDZhMHhnMGtid1RZZHRQNE5wTjlheHE3ZlRx?=
 =?utf-8?B?anhDakpjZzhUUitZNXBjK3VteUVScU1iNk4vMGsvR1pwTXFxWXMzWHVPVTN2?=
 =?utf-8?B?QWs2WmJRR3lobWdaUWpmSGMxRlkrNmJCTThxdTEvSGFONXlMWVU1U1paajE2?=
 =?utf-8?B?N3l3TFZ2ejkwV3lCSndFMTh4UTRFN1JGVmMvU1BlSHkwQzdUT2NUODMzVFNx?=
 =?utf-8?B?RHRVcFRPSHY3VlVVNWhkakY1RUJyNEExVGxZNWZEVzFQRnZUeElPYmhNYTMx?=
 =?utf-8?B?ZmFJbXliQy9tbFNqdGRHaElWWmVHbTk5d05wOGN6d2FUaW1NK0t5Yk9IdkFN?=
 =?utf-8?B?MHFLdWwwZEViS3UxK0tkZlFOTU5iVUV0UWdVNDBlUmJENTlnR05URVNGSmdj?=
 =?utf-8?B?UUFlUGlrRENENk5UMmpyYWxYNzh5Q2s5NXVPei9HbENoVGpJWmhreUZEejZh?=
 =?utf-8?B?d0NhY1JMc05nMEtKR29ZelErQ3ZBVmxFZUVQbmVBUnpCMXJNdXNGN2tKQnZv?=
 =?utf-8?B?d0NaS2pndVV1bVJsWUYzRUcxRmsyVkFYc0wrU0xQUEF6aVZuZ3lVdmpCSDNv?=
 =?utf-8?B?RnJsa1Q4Tk50RFpRZm41b0RPRkVlUzIwaGpZemJPWTNzUGhRaG1CaWhSMU13?=
 =?utf-8?B?WWVuUUluNjRvdzRXUk9FcjVDeHZRWnY5UzdZUFdsK2s2RG1SWU9lTXBFZStK?=
 =?utf-8?B?YkE4Y29ZVHgwNEdUUVVna1NieTdVUFljaWNCSEd6bTQwMTVTY21vM1ZrcGMr?=
 =?utf-8?B?UEZhelJyNjVwR0ZxOWJKeE5KajNmcFNaOHdkbVJ0VzBQQmpITGlrWVltRGc0?=
 =?utf-8?B?WlVPS2I0YkNwSmxueTJpM25IMUd3dldHdzlQcllQemMyTkxGVHJoVm5ybHR1?=
 =?utf-8?B?bWtIa1lMdkwzMnU0dHNveU1NYU1QeU96OUN2SWIrZkwvV0FJa0JjeHo0aWN5?=
 =?utf-8?B?SHNhRUNUQjBFMmROUnhySTcwaUxJcHgrUnhBOG16MG1GS1dtZ2ZpS2FVbGE0?=
 =?utf-8?B?amRmNDR4Y1dmMG0xbzJVYkZ3eWRqNFRLd0huWkZxUkNRREtRRmtTcklaQjh0?=
 =?utf-8?B?TG1YRkU4eWlQbGM3RHJjRnF0NUhwVjVQT2Qwd0dxd0pQa1dOTWplVFpBaU9H?=
 =?utf-8?B?U2w2T2pwZjFPTExLVTNHamhJcnRjazNCTTVSUlk4N3h1elRiajk3Q2F3a1NH?=
 =?utf-8?B?Y3FvTjFsK3NyeXI0OUxVZXhZbXl4cWZNWmY2czFaVXNJRkluY0YwNDRrWmdw?=
 =?utf-8?B?VDY2R21iQTlYLzd6dUZlS2hYYmVVa3MyOGYxUWY1T09Sd0VVNTVQZy84ZDJh?=
 =?utf-8?B?UStkeSs4SE53SWdmUW9heFgvSVRwM3BSTEJGcE1IOGw1WlhQNmNVRUZzRE1M?=
 =?utf-8?B?YW5OU0hVQkhxMlF4dlJubC9jemZ4eC9JcUhvQlV4Z3NkR2lET3lxdEpZMElC?=
 =?utf-8?B?dnJsSGE2T09EQ0ZvRFhTRTVaN01TTFE3aktTd1Q4YmRla2RhcFZyakY0eW1I?=
 =?utf-8?B?OEJ5YjlGdFh2ZHN3OEdGVHVFakN5Q2xCQjNhSmR6NGx2UnExdG96T0VtQ0Rk?=
 =?utf-8?B?cG1MMXlUZFJ1WlJseHBKNTZIM2kyVTR2NGtPOStWSWFKelRqVXM4NW5mYzY4?=
 =?utf-8?B?Z0tzeElZYlR6ZnNRTkJaeExQV3JlQmpyU0tCcjBhdkRHNUNxZ1dlck5qZUFU?=
 =?utf-8?B?MnVpT1RVUC95c2loSFpweVpRM2ozanJZQUF3VmxXMzZKR2JZVWl6SFpwRDlu?=
 =?utf-8?B?Mms5bTI1OVBoNEhScndLUUVZZmx4Z1dVRm96QVl6SzJseFFZY2NodERSK2FW?=
 =?utf-8?B?U2VDNFdpandpaDZMRmp2T3ZNR01UVVczUjhMKzQ5d0VkbXNqeHg1U2lRWXRP?=
 =?utf-8?B?Vy9neXVPbUFITy9NNFMvMFp1UzY4Z0RFbno1N0pSeHZQVlQvOEJ0bnlMZXBE?=
 =?utf-8?B?MzlmTXZaZmpzZUszN05XbDFrUGxscm9wT1lTVFRSb2FNb3JpSG1PM3lNYTU2?=
 =?utf-8?B?N2REYm5WTEU0RXFRN0E5NWgzaVVDV3A0bkgwMk84bzc1cm9uaW43dTNVZFA3?=
 =?utf-8?Q?n6VnX3JFbyU/am5oJOdRg1o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38520180-9f81-40e7-c394-08d9998a568b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 20:42:48.4183 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WJ1IQ7kqO4EkYq2698fXEo01h1KhlIBRBlpbabriqL3GQpR9uwHFDn3GrVQCymaUoQAfciavfA7b+yc2kJqEWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB5538
Received-SPF: pass client-ip=40.107.212.128;
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
IENlcnRhaW4gdGFyZ2V0cywgbGlrZSByaXNjdiwgcHJvZHVjZSBzaWduZWQgMzItYml0IHJlc3Vs
dHMuDQo+IFRoaXMgY2FuIGxlYWQgdG8gbG90cyBvZiByZWR1bmRhbnQgZXh0ZW5zaW9ucyBhcyB2
YWx1ZXMgYXJlIG1hbmlwdWxhdGVkLg0KPiANCj4gQmVnaW4gYnkgdHJhY2tpbmcgb25seSB0aGUg
b2J2aW91cyBzaWduLWV4dGVuc2lvbnMsIGFuZCBjb252ZXJ0aW5nIHRoZW0gdG8NCj4gc2ltcGxl
IGNvcGllcyB3aGVuIHBvc3NpYmxlLg0KPiANCj4gUmV2aWV3ZWQtYnk6IEFsZXggQmVubsOpZSA8
YWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCj4gU2lnbmVkLW9mZi1ieTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgdGNnL29wdGltaXpl
LmMgfCAxMjMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwMiBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkN
Cg0KUmV2aWV3ZWQtYnk6IEx1aXMgUGlyZXMgPGx1aXMucGlyZXNAZWxkb3JhZG8ub3JnLmJyPg0K
DQotLQ0KTHVpcyBQaXJlcw0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETw0KQXZpc28g
TGVnYWwgLSBEaXNjbGFpbWVyIDxodHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1l
ci5odG1sPg0K

