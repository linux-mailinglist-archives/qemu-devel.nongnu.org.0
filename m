Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB48F43D312
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 22:43:19 +0200 (CEST)
Received: from localhost ([::1]:40308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfplW-0003Rs-QE
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 16:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfpfB-0007LW-7z
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:36:45 -0400
Received: from mail-eopbgr800127.outbound.protection.outlook.com
 ([40.107.80.127]:64872 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfpf9-0007bZ-7Q
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:36:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzGoPURUg9iaRvmf2NkZRfBp+hUAjf+mYi/67IQdjq6Qg6NW12Pt/0L0A7bEiBdKqpOJofvszr6ZJfIV7mWTmp5PoPQa5xRfFBfGerXcxTcI7qeeLzyYeB3n52XIBlYZYG4GJQX2GWV9SIl5A3+aVjdI0ZypHb8Ehpah02kkQV6VkLCgNgiCQklVDCHCfGgh6cWbb4UnORSzKedFqTO0EwZifnuyxW7DbLQ6B/GBrpzD2VaL6nb+aWOxsuzmSgiVLFNNVlyfZGeSRix9++sp/vKJXiAwxqa9h7uNyxHjAegDE5ZR5+GcIcGiMwbFCtjaY/rdBgJloLnNs+tegvVlAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/kghxwjaDa1U4Dfwqr/k+lvzfSvP6I4JBc1MMD/97yQ=;
 b=WO3tEnN9njdFLKdnbS2BC/aoDAlqgMGT4dycUyt3/R0uQjlzwRbLGObuV/i4BpYC0pzWKF7pZ8UY+OoyTXHuGBqsRc8Wzvk4D3gblLOJfjoK4EgTVCZsKQr3WDsgtiH7/FePN2FMK+7whn6Ma4cz48jlxED5YCZ0cWcprKT+zh+8aj91CrAmc8vophs43N4tSrjBHqIbygFpccHPAYqxMALCN2HBnpYqAzOrzMg/V5d68yKVOPxOJg5CQdeh+atQyH4w23HGV7JiZpWJCXMakJk8BDd5J9SdR4VsGE0GrZ6E8r/Z5xbRoTbeWGcDerkNned8mwfKTdCRuI6/Ba6bmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kghxwjaDa1U4Dfwqr/k+lvzfSvP6I4JBc1MMD/97yQ=;
 b=dKwT5zFTJmy3oMOMsMoGCBVFJE1rgK+Ub3dIUT+aza4dOsWi76q3Q35kKN9kSWG6MLuu0Lj4WocaULHpnYjiWd9SiXaxj6W1y5KRvlhVusLcBVvcYJibMX/sJFWs+m6YUo87z+9L8b2DzO2blP3SCM48HXb5RNq2AsTJ0GKqHO1UOE+4REfZ8gCaqRQjb0Aedd5N0+5tDrt+6jFK7HBV38Fu+x19PtJAv+1PUFtwW7pjQCwTOiW1ns3WI3gB73CyR/YMkquVlZtZmrWAPoLz8fKsPgAXZ+Sv43hMsBQ3V9HujX1q3hHeLdwlpQdhIsOg/2nEiGqJZKiE+my38Vkdpw==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB3572.lamprd80.prod.outlook.com (2603:10d6:102:36::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 20:36:39 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 20:36:39 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4 43/51] tcg/optimize: Use fold_xx_to_i for orc
Thread-Topic: [PATCH v4 43/51] tcg/optimize: Use fold_xx_to_i for orc
Thread-Index: AQHXyr8ZYFzStDD04kyjru6eubQV8qvnTuDg
Date: Wed, 27 Oct 2021 20:36:39 +0000
Message-ID: <CPXPR80MB5224C679D96EF98704A52716DA859@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
 <20211026230943.1225890-44-richard.henderson@linaro.org>
In-Reply-To: <20211026230943.1225890-44-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58bc553e-d1da-4e74-7d1c-08d999897a65
x-ms-traffictypediagnostic: CP2PR80MB3572:
x-microsoft-antispam-prvs: <CP2PR80MB35725DF7DE2511EA19F104C6DA859@CP2PR80MB3572.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wCiR3WvGovvPdZCGD2a6NwToCvgV3U5dHZ1Vu8FS3qbC0LCd03ZBWWFqyi1cylI2j4CI2LYvtF0YR9fd83haz+V/mWnpbrdeXxgTWdJ7R1viqaGkknoq20rE0Z/l6HCVRvb4ur8wniznuDffcqSZ1xA0irnfm0gmuXB86W2OFWdGRJdCmCbvQ7Gp1a3drJZr8Mrqzeo2hoCnUrPDkmSLctlkGP3S/AyjfRXiWDG6p/XA+cqRAHGMzqJUTrgRCIHxaR9V9dGDonQKl5kKSkSDeZijar8tUYTfNfuEc7c7m5t8eNArLdXXg9p6vNYoa75NYS8IPlF6KQASyUoHBTrkGpauvd5zswhqhMlfyXHvsVju04c878eYhnT0NHy/2fydPS74RWSvqu/7AWk2Z4S4ivpPOHLdeTbHt6K2Y2qkzz8g0oB93DQ3yFQq6RdKKnFcu//Hcy9JPhpp9t3tG7tq8koha+rFCSTeMSBUSFAOGyP3YIBC7o8OotEr6B51mmYDjMRkFroV7r3qGymU8YxfEmqDsXQijKeHFI2cmAsezsMjE8PwWxgdmT5+In1Z+FZ1yWZU7HJwg6ll8KbWgh2JQ7T49DvUQxTnGievbJ3ZY46RsATkRQWDJLeo5dfwMsE0ztwEZd4aGInKbRbf7pB2XzCyaVRaIRsP82Ng85E3lH5cv0dicrDS8yn241fEdbfDgZh5AisvVFO6Iow+1QXdEVyLmof+ytjnI0CNct3RqCMgOR0GWLmqtck2PAsYu76ClMo9FkjJhjcK7uo/CZ7Jx2ojX9bK3Bpd8jugrDhbt88=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(7696005)(316002)(52536014)(110136005)(186003)(54906003)(5660300002)(33656002)(26005)(86362001)(2906002)(9686003)(55016002)(508600001)(71200400001)(64756008)(76116006)(8936002)(4326008)(66946007)(122000001)(558084003)(6506007)(38100700002)(66476007)(8676002)(38070700005)(66556008)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3FDNWZZOEwxSWhvVkVhaDJtOUxGWlFTZGxiM2ZiWXArRTY3a0xHcDd0OXNw?=
 =?utf-8?B?SVVpQmlkZ3VhNEUyaXZzTWttdmg2c2U2Y0pydzQwcDY5SThZN0pVWTA0WStV?=
 =?utf-8?B?NnhpUFNqTDcvSktGd0JIa0VtYjJScUdHUUl5Vmh0T3RkQSt1ZnR5N2RCVDhx?=
 =?utf-8?B?by95cTA4RnZUV2E4N21QU2JwMkNvMnZydHA1emoxbWZDTmJlUVNDd3M0Tm9W?=
 =?utf-8?B?b2ZON1lydFJubEpZckozTzBXSFB5U01rWEFHcVZ1R1RDNGRWZ1ZZWDFVZkN2?=
 =?utf-8?B?ajFYQlBoVlN1VnFPSWVRT09ZTHlVWFZUNFFrMlpldXNxM0xJUVNnTHZLM2xp?=
 =?utf-8?B?L3lSSkxGc0MvL3VnNzl6WFRHM3RldWpIVkJTeFNVVTAydWJrSGhXNmd3dGhK?=
 =?utf-8?B?QVh0OFNRNEZpRmdHb0IxR0Q0U3NjMUxoblBsd1VPcUNtUmw2UE13RmZzMFBM?=
 =?utf-8?B?R2Q2bHNGRnZabTlxQWVvTlpDUURJMUMvcHN6bi9BanhzUUtoUXhBU2o5TXFk?=
 =?utf-8?B?b255emhYLzY4d0VWUlo1Yzh6Ty9EWXM4RU9IcUNMZ3QwZyt0Si9qRFh5NGdL?=
 =?utf-8?B?dlo3Y0xZbDQrM0RhQnhNUHZiNVhScjlMSC9TbTA5RC8rOHFFYnNhbi9wYzlN?=
 =?utf-8?B?dkQ3TVYwMkhJUnl6ZUtEbTJ0b2Q2ZE13eXV2MUo4Snc2bmRYb0NlUU55TVF2?=
 =?utf-8?B?V1F5L0tMMUQvSE55ZlZxcHVtdktZYkZSZ0UxK2VWcUI3U0t2SG5wS0dwdysr?=
 =?utf-8?B?SzRlckFobU5icU5MOXA1UzQweENEakRtb2tMaEZiOGdTVmt5bWFoYXhPQ1FW?=
 =?utf-8?B?TGhoNm5PL00ra3lPdFpKT2srYmJobkMrd3djS0ttQlFDeFBpcEoyS2ttUzRY?=
 =?utf-8?B?VGtsaUpJZ3BlN2doR1hKTmlzZXBmdGdSR3VYNG5PMllVbW9uRmlETzQ3alZz?=
 =?utf-8?B?SmQ0ZUtNR013QTFTUitISDVvbFM0M0liQVpiWFhwc1lvMXcza2hRTElBNklo?=
 =?utf-8?B?OUZvNmdhM2lFV1BCUDVyZlZZdWRwSG9ieVpEN3o1Z0JZZFBoYmlxN2Iya3Zl?=
 =?utf-8?B?SXRJUHZ2ZTJCbnVJY1dCcWxJdEVaVkRLd01tcEhVVUhMNnV6a2JOS2ppMFRs?=
 =?utf-8?B?R1ZXMEVHWDhIS3lvM1dMVTNoR0J1SEIxMjBxMkRtZVNFUy9wREU4emRvWkpm?=
 =?utf-8?B?MkdCZXJ4RjY2VDRJNG16ZUpabmE0enZObFMvNUl2eC8xWVByaERJUUxyYVZV?=
 =?utf-8?B?eVVCR3lJbkdleHJkZWhpK09xZDVJYUxtemwxczNDWTVSUzNhK3doWXBhZGE5?=
 =?utf-8?B?UURLczJZSXg1d3RPRUdiZlBTZE4yZUxFcHJXaGVKb2FvM1owWTJ2YlpwYkZn?=
 =?utf-8?B?S0o1elZ5eUJtTEllbmxiUDRXS2ZsZUxlU2JJOVNHTWJpeURoWlJMVUdGbkhu?=
 =?utf-8?B?Q3BXZ0FjWmd3ZXFBSE91ZWRiVy8rdU00YWxNcG9WK1hoYzRpeHNqY0lQNGlZ?=
 =?utf-8?B?SGFSKzI3U1ZPVnYyMUtRZDhaRG5SVGY4YW5jNXJuTU9ISExhZkE0NW1rUUJz?=
 =?utf-8?B?bGdpRC81S2ZBV1VtNWhCN2lCblJSeXg2VXpOQklia2doZ1FWMFpSOGdxd29Q?=
 =?utf-8?B?WTAra2tMSHJiQWhQbzZhWWdJV1FPeHlwZ1BPUWxLRURQd2taOGVTRmRDbCtV?=
 =?utf-8?B?aDg5VWRKMjlibHJqUmFVVEdXZklTRWhsc21RYWxuS3U1MktnM3FWWG1GcVIw?=
 =?utf-8?B?YjNQR29SeXJQbDBoOW40WlpwMnV5YTB5T1AyVVNEMHZFNzYycmM1MzU5NGEw?=
 =?utf-8?B?MlplWTRFRmphQlkyWkdHN2hJNEJNZWs4ZkJaTEwyenpzTDVIRlNXU1d1QmVL?=
 =?utf-8?B?emM0Y3c1N2dOQWlLc2gyMlFoZW1KTmpPbWpBWG1kTDFYWlI5Vkh3cEUrU3Jz?=
 =?utf-8?B?UHNVUXdMeUJvSGR5MXB1UXc0WHNXN3FRS0ZVd2VJSHJhbkJHclo5WStSbzUz?=
 =?utf-8?B?akVYRkxLckIxamx5MmpOckdpWXR3eGxDdkxHQnBCV0QyRUhwVVFHSHR5Z2Vk?=
 =?utf-8?B?dGdWRWNkWVA0enE2d3BqRGhmVm9veERsd3VzbFZkMUNNUldTYXc5Wkh0Wmlz?=
 =?utf-8?B?d0Nwa3BRakZUSGZ6ajI0QlRYQjRncGFibC9lY2VrQmtaUExwNmh4OUVrMTFE?=
 =?utf-8?B?ZFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58bc553e-d1da-4e74-7d1c-08d999897a65
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 20:36:39.0757 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pR/quQhMIwrbjfGVeo/fduLEP6Ft3vwy6xMiNBeT5w2IdvkesP616DuZOgvcPzcLEXvMzsruo5MDCzpJosrQYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3572
Received-SPF: pass client-ip=40.107.80.127;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
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
IFJlY29nbml6ZSB0aGUgY29uc3RhbnQgZnVuY3Rpb24gZm9yIG9yLWNvbXBsaW1lbnQuDQoNCk1p
bm9yIHR5cG86IG9yLWNvbXBsZW1lbnQuDQoNClJldmlld2VkLWJ5OiBMdWlzIFBpcmVzIDxsdWlz
LnBpcmVzQGVsZG9yYWRvLm9yZy5icj4NCg0KLS0NCkx1aXMgUGlyZXMNCkluc3RpdHV0byBkZSBQ
ZXNxdWlzYXMgRUxET1JBRE8NCkF2aXNvIExlZ2FsIC0gRGlzY2xhaW1lciA8aHR0cHM6Ly93d3cu
ZWxkb3JhZG8ub3JnLmJyL2Rpc2NsYWltZXIuaHRtbD4NCg==

