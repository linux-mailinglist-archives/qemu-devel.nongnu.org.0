Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6FC355C87
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 21:48:59 +0200 (CEST)
Received: from localhost ([::1]:36940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTrh4-0004Wv-D8
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 15:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lTrfK-0003dr-2u
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 15:47:10 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:5723)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lTrfH-0000sW-Gf
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 15:47:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617738427; x=1649274427;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9x1NQmDgEyHmMsx1RNqEx/4aNtc0qrpfoDDtIeAATaI=;
 b=p2jegqk/8TVNalGwFiQTMPEA1rWvvz/ZH1fDHJGY99YcyMdo271AlxRN
 JtA85jpoGSl7z7W7Mm8Yfial3ElJ84PU0be5gMZ5kAtHYgFcZQD/l9AfY
 bHlAB7n8rxtt05Zr7qXKP2R2qfwZOHwvkQ4PTTTwgcJynnVvLj9lZizoi k=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 06 Apr 2021 12:47:05 -0700
X-QCInternal: smtphost
Received: from nasanexm03a.na.qualcomm.com ([10.85.0.103])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 06 Apr 2021 12:47:05 -0700
Received: from nasanexm03c.na.qualcomm.com (10.85.0.106) by
 nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Apr 2021 12:47:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03c.na.qualcomm.com (10.85.0.106) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Tue, 6 Apr 2021 12:47:04 -0700
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB6193.namprd02.prod.outlook.com (2603:10b6:a03:1fd::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Tue, 6 Apr
 2021 19:47:02 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608%6]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 19:47:02 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Subject: RE: dectree.py uses env python3 rather than configured python
Thread-Topic: dectree.py uses env python3 rather than configured python
Thread-Index: AQHXKxXS1KWeNCGF7kCDe5KRqpNGTKqn4qIAgAABeYA=
Date: Tue, 6 Apr 2021 19:47:02 +0000
Message-ID: <BYAPR02MB488607AF20D2E0232C9BC0ACDE769@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <YGys2+lETQO5havV@work-vm>
 <55e804a2-c709-6b2e-699a-ef89f1941250@redhat.com>
In-Reply-To: <55e804a2-c709-6b2e-699a-ef89f1941250@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [2603:8080:2704:8f00:b0ec:f6d4:b80d:779d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45b3194c-0cbf-483a-5f34-08d8f934bff6
x-ms-traffictypediagnostic: BY5PR02MB6193:
x-microsoft-antispam-prvs: <BY5PR02MB61931EA8C6D4ADCFE3C5C301DE769@BY5PR02MB6193.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vDiP9wGNBrXsC/rNdqBcdbgO6y2Ex7tYRykjgFNSQmkJ/w7Ljc0PB7X2IAKdImLEcZofVSYIWR7JorIM8Qu/yO/ULBombI6xgYQS7zFzVegsww+l9yd8MCUQVO83QAZ/KLDxeiB/kUdcjDxmB3UvY0Ol5jSNKiA0iMTpFUaWjIduohxH9LM+1MihEW51dLUifXIvZppsi/2kChkhnbM15kD2+CY1skEgUJYr6T90KRWHqBJEF7DpMeNr52mADXAxA+SutnFcvC/MnqeJDxBOCz8VS8tD0hY3NPZT5rFg874L5mQG8doM2XPVVL0ywKigcxOYPj5py2nVq+acMkepd8MrnnICv0QIFN1/zxRgtmLrwTbcZDw8dRChoB99on6paHBNGwtDJnDypl0vt+kzn5K5d2L7GmjypRqiWt66LVz6QzyKZ5y9VpviZe8s3i/0ielHUS3FYkILbyPUKiAcH7BBPmH2cC7zsbm7sVU+0z7aQbb5AmmgT8rZMD5aaW6Ws9Lh1AZA18l5kTPvtBsUxxUOyvYZ6PCOrMn6jw2MG4UMaa4ECfeTMqJAA38B0CYOJFdRJWaKaO1cpy3vUn6WEsSV8q1Hmv8yBZsg2Z9Uqz3xcX2xYLicb9qSVrIbHi73sS9O9vF0Zlp8zD0h/EctGP8ZHUDeQZOoq5dwNi4zsnTj4wqx4S2kgI5wYewRiVpgq/mfFZMSQlfGRvceFV6vynx1omTeS4s2jkEsk5IADBeB4HSHgh7K3rzqdMTtxSe/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(366004)(39840400004)(396003)(33656002)(110136005)(86362001)(53546011)(5660300002)(6506007)(55016002)(76116006)(38100700001)(8676002)(9686003)(316002)(52536014)(8936002)(2906002)(966005)(83380400001)(478600001)(71200400001)(7696005)(66446008)(64756008)(66946007)(4326008)(66556008)(66476007)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bXpycE1NRFo3a1A2QzlzV3F3K251K3lvRGJpczl4d2tFOTVLSlZSblBvcVJT?=
 =?utf-8?B?a1pCWnRKbXU3Mm56Y25JaHZFTkxTTnJqaURLaG9VdHN3aXo3cE9ZWGMvZlFX?=
 =?utf-8?B?T05YZ2Q5MDRNUnRGZS92NW1BUmNKbFRub3luYmgwb1Rpb0RTaitsaGRtQzI0?=
 =?utf-8?B?dEY2N1ZSNHhmWGJ3SytmQnVOYjMweEcwODNUbCtnR05vTFJKdWVUQlU0RWR4?=
 =?utf-8?B?ZVQ2UlBNT1pjbUQzaEtObUhxZnQreU53WGZnV0Z5Y09FNmw0WDdtaXR4UWs5?=
 =?utf-8?B?L0d6VWZzT0tNZWZKb1IybUFHZWNHWlE5V0dtWEZlejJmcDJaZXoyMUZEbW5j?=
 =?utf-8?B?bmhGVWdvWjErMG5FZmJ0TEdkSnZIbThZUGJGdlBOSDdDaGtNekFFZnoyM3R2?=
 =?utf-8?B?ckRpaXhCaGpnNklNYmU0YVhoWnM5WmlrS1RTT0JTODR5ZzFLTzVURGhXc3gy?=
 =?utf-8?B?UUk1ZEZLYUd1Z3psRFNUUmhESkgzb0ZpNUQ3K0hFVWl6aGR1QUdXcFd4d0tI?=
 =?utf-8?B?K2hyRm9HZlppaDRvN3J4ZkpMMFBrVzhibzA5VUJBQmE5aWRZL28xR1dWek5O?=
 =?utf-8?B?SWJFYlc4ZnZqQ0JobXJyc0RwbElkaG5TUFJUUnlOZU5VVFpxSWwxWHpSNXBa?=
 =?utf-8?B?SkxsZXpvWUxBOCtrLzhHeTJ2QzRJd0tXeHYyRGJEb3hFdmZxd0FldnFNWXZB?=
 =?utf-8?B?Z1FCa0JaczJwVzdxN0ZaKzFuN0ZwcVhxSFkxRVVLSzlaZ3FlT1QxL3VZemdh?=
 =?utf-8?B?Z2FKemc2SXFWU2hYcTZwcmRTZHoyY1lIN2JWME5aNjF1TjJaZk0rd25UZ1Nv?=
 =?utf-8?B?cmxhQVA5Q0ZmckpHQXhwQks5MWlpL1FNck9JRHhhcGtSNDB4dnVldjMzSkdF?=
 =?utf-8?B?cTNLTUgraVRDUXdySVRERzZ1QWxpQzdmR050K1J2VW1Nb2oxVHRsd2l4dk5I?=
 =?utf-8?B?QmFzK0QxYkgza05UeWFRVUp4NzNTY1hSUlV4SFlIVTVoTEZBaFkvUVVqWVI3?=
 =?utf-8?B?WFFvRk8wRnZFNEVEeWVMQzkwWUVSdWVWWU1tWVYvR3NlN2Z2a2JGakRRM1dO?=
 =?utf-8?B?L254MEZwU3VHVW1BMnVhQ3cwTGEyQnZYN3ZtZHdmUXE5K2dGM1lpNlZOTVAz?=
 =?utf-8?B?T3NBMlZNNlBmaFpEbzQ5ekhSdnk2MmFIUFBpSVM5NDBBL1RDRGc0OWlsYWU3?=
 =?utf-8?B?ODc1THpOY2xweVU5NWd2bmx1cEtVam5tNVlQbU9wak5memFuNDhkN0xPOUxB?=
 =?utf-8?B?TFRUQVdUdEhRczI0d0NmZmt6NjNoSXQzZmZSdzdZRS9PUTBNOFE3L2pPdVhp?=
 =?utf-8?B?djJXNDBzcU9DODNERjlEOUx6azQ4YkJQcDE5R3hFV2FqUW8yYmpKYUhzTGxq?=
 =?utf-8?B?RXJqMm84WGs4eDBXaVN4U2pteERkOTlScWNLTDFuLzYySzFwVGJlM1dtekZV?=
 =?utf-8?B?K2p3elN6ZHJ1UEJXdTBzTjdhVlQ3L1hGVWt1VlFjSFhUcHpqSGhHbkJjOXhC?=
 =?utf-8?B?d05GSHViYXR2WXl5bUMvMi83YVBzLzdISFZ2VUNKMEhER1M1UFZ2azI4UXR6?=
 =?utf-8?B?SEJNMEFxUzFSRVR2SHluR0FYOGg0R0xvWWMyRHZ5aW1HUUp5MGFucHRmclFZ?=
 =?utf-8?B?N1VIOXRhKzZVUUZnVkI5RFRGOGgvZWlmT3ZvZ1BUd1JaalFVWVg3RUQ2U0Zm?=
 =?utf-8?B?RGRIN1FTZGJ4UDMwQzh2c2FKdm03YzZOSGJJZkR2enhmWTRvUFo0Yi9QcWZT?=
 =?utf-8?B?ajh3VGNDS0tHajJCZEsvOTJBQ1VUZFJiY2hJZFdmVG1iK2ZrKzBFckJ1VzFj?=
 =?utf-8?B?ZGthWFR1MzBIN2htbGhHNEdLdWtXcXIza2pGY0dTRkhtOSt4TWFWcGJ5dUE4?=
 =?utf-8?Q?e/L9etXYveESY?=
x-ms-exchange-transport-forked: True
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1aetUT+g75wji7/4GFAC6PXC6ME/mRVtLyYVgSWEvZGQ8N2TlpW5tr+Ra/ocG3zVPH1uJcjKEgBAv6MNaawVJX+WCwUk68LV/Pik4m41P/CdG8iK2UQExgf/xzHlEI6PTDlSgWLQGexJuHBL56sH5VX6AByznrf+wg7eRhiRIAVvVkuIqg6G5acng3G3lxBKnhRwgfm/KGvNexJM7qNBSmsynZ0CXPwJlBtI5GbSWa2A5CiChoILMa5F7KyQ50nCBDB/itdsgLaQIL10Mcr0P1DaXpq7QwHRLrTyG06SMnp5eZ8pXcxmmVjtBEa6nS+W/ZkinmtMa/ySNKEEO34mA==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8brC1IkMj5Lorrz0hJPXfrfA2s0/ZaFPsfm+1v8EhRQ=;
 b=SDVY1+2WyB05TvSpJBs5vohiSUQXqUv8diN1Nx35tSbINeabLCfdZVHsQDOyKZI75H4KtOg2+BGZWDzIlENMh8pkXgSKybULwFLQxQ888Wm3iF/eADKU/76IPG1DbuJUDDl2sJTgI550LZ/l4ItmcgkAq/3Dikn1uWnMlSb/nVthpOfh6xbYm7XXJXshl6WhXJWSEPs47vKV4oH5ZNBZxbTm6l3z1ru7jaW1Xwp/2sbwxO1perp4JX4YWkNriCh3kRsYrqFn9MGy83hwAYdOQq0FukgJDZAoUFRelQlFn46KGiT9HytVikPG4tlSYiCKBgM51isvhuKzdaVjJqQadg==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 45b3194c-0cbf-483a-5f34-08d8f934bff6
x-ms-exchange-crosstenant-originalarrivaltime: 06 Apr 2021 19:47:02.5895 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: gEhwz/4m58znh89uPe/rjD5dyulZ/LIkOhIxRJnYiBsFA6p5oqTomjMcGYI0f+opXwmad/iYMh1MpFkOpUGuOw==
x-ms-exchange-transport-crosstenantheadersstamped: BY5PR02MB6193
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.38; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEpvaG4gU25vdyA8anNub3dA
cmVkaGF0LmNvbT4NCj4gU2VudDogVHVlc2RheSwgQXByaWwgNiwgMjAyMSAyOjM4IFBNDQo+IFRv
OiBEci4gRGF2aWQgQWxhbiBHaWxiZXJ0IDxkZ2lsYmVydEByZWRoYXQuY29tPjsgVGF5bG9yIFNp
bXBzb24NCj4gPHRzaW1wc29uQHF1aWNpbmMuY29tPg0KPiBDYzogcWVtdS1kZXZlbEBub25nbnUu
b3JnDQo+IFN1YmplY3Q6IFJlOiBkZWN0cmVlLnB5IHVzZXMgZW52IHB5dGhvbjMgcmF0aGVyIHRo
YW4gY29uZmlndXJlZCBweXRob24NCj4NCj4gT24gNC82LzIxIDI6NTAgUE0sIERyLiBEYXZpZCBB
bGFuIEdpbGJlcnQgd3JvdGU6DQo+ID4gSGkgVGF5bG9yLA0KPiA+ICAgIEkgdHJpcHBlZCBvdmVy
IGRlY3RyZWUucHkgdXNpbmcgJ2VudiBweXRob24zJzsgdGhlIHFlbXUgY29uZmlndXJlDQo+ID4g
c2NyaXB0IGxldHMgeW91IHNwZWNpZnkgYSBweXRob24gd2l0aCBlLmcuOg0KPiA+ICAgICAgLS13
aXRoLXB5dGhvbj0vdXNyL2xpYmV4ZWMvcGxhdGZvcm0tcHl0aG9uDQo+ID4NCj4gPiBhbmQgSSB0
aGluayBldmVyeXdoZXJlIGVsc2UgaW4gcWVtdSB1c2VzIHRoZSBjb25maWd1cmVkIHB5dGhvbi4N
Cj4gPiAoVGhpcyBob3N0LCBsaWtlIG1vc3Qgc3RhbmRhcmQgcmhlbDgsIGRvZXNuJ3QgaGF2ZSBh
IHB5dGhvbjMgYmluYXJ5IG91dA0KPiA+IG9mIHRoZSBib3gpDQo+ID4NCj4gPiBEYXZlDQo+ID4N
Cj4NCj4gSGksDQo+DQo+IEluc3RlYWQgb2YgYWxsb3dpbmcgbWVzb24gdG8gaW52b2tlIHRoaXMg
c2NyaXB0IGRpcmVjdGx5IChhbmQgaGF2ZSB0aGUNCj4gc2hlYmFuZyBiZSBwcm9jZXNzZWQgYnkg
dGhlIHNoZWxsKSwgbWVzb24gb3VnaHQgdG8gYmUgdGF1Z2h0IHRvIGludm9rZQ0KPiBpdCBkaXJl
Y3RseSB1c2luZyB0aGUgdXNlcidzIGNvbmZpZ3VyZWQgcHl0aG9uIGludGVycHJldGVyLg0KPg0K
PiBUaGUgc2hlYmFuZyAiIyEvdXNyL2Jpbi9lbnYgcHl0aG9uMyIgaXMgb3RoZXJ3aXNlIHRoZSBj
b3JyZWN0IG9uZSB0bw0KPiB1c2UsIGFuZCBzaG91bGQgKHByb2JhYmx5KSBiZSBsZWZ0IGFsb25l
Lg0KPg0KPiAtLWpzDQoNClllcywgSSB0aGluayBtZXNvbi5idWlsZCB3b3VsZCBiZSB0aGUgcmln
aHQgcGxhY2UgdG8gY2hhbmdlIHRoZSBiZWhhdmlvci4NCg0KT24gdGhlIG90aGVyIGhhbmQsIGlz
bid0IHB5dGhvbjMgc3RhbmRhcmQgZm9yIGJ1aWxkaW5nIHFlbXUgbm93PyAgVGhpcyBwYWdlDQpo
dHRwczovL3dpa2kucWVtdS5vcmcvSG9zdHMvTGludXgjUmVxdWlyZWRfYWRkaXRpb25hbF9wYWNr
YWdlcw0KbGlzdHMgcHl0aG9uMyBhcyBhbiBhZGRpdGlvbmFsIHJlcXVpcmVkIHBhY2thZ2UgZm9y
IFJIRUw4Lg0KDQpUaGFua3MsDQpUYXlsb3INCg0K

