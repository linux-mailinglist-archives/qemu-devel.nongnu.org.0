Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7973439730D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 14:15:39 +0200 (CEST)
Received: from localhost ([::1]:57628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo3J3-0000H3-PL
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 08:15:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lo3Fr-00078m-Nx
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 08:12:19 -0400
Received: from mail-eopbgr790125.outbound.protection.outlook.com
 ([40.107.79.125]:9920 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lo3Fn-0003K7-TQ
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 08:12:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsaA9Dimyp5YNiLkkUgh94CClGkt2WyMkfnVQIrKZ6s1gHjefVBxXc4xsO7F4CI8bbxB69OGj3HanenaK1QQkBPJw+elBPW62l8nHt3i0F4gpuLvQbhyo/pA3Polq/qJi3kbwlhyQteZU3ibZRLY9jTCbtg6ocpBbA3tgYGsWO5sV4C/xX8DZq3H0GhH3yp/fmmqk+Hy2dVRGrvBaF/f3Zytxh6VaBTPeawWKmN6T5RJhNxqivl/mm+L6Dsc3P2AVrSAZNCWHyW8RmS5Npoq08DzG2iIqio8XPyxE+A7nuoLPQuwhTnfe+LLRQLw7nIypsUVVYjd1pB/nnVxSn+/ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAswrsCS67i1GTNWNdc45JXkDTKuUFB+RPmeBkVTM5E=;
 b=KBpTqwM9IXgJ6FwuIiZQQs3jQ/Lwh1Bnmf1FInKnIn2Z204oWWdAjjMCEWIjhFTfQd+iuN1qSfHzbnr3uyl/nilgZY3ya4srOrgWhzZWd4TXcCs7ycpdFqbQUH4j2NQN1ijxAOBiKu4niyXgChBsiayHLZMwxChr49Y271AOUGTHNfHMG6bfguXHyidM0b39U7/d5rCKxhGBV+R+wzWb8gMlGsSv1xj5c2eDXd5E7KUC7LsbFAnPM0DaudbUWGP6zH/ykK+0EwnApJ99k3yhjPOfkPk3RRLSxn9BCuep0sbLF3ScAMrf/hDv0A4mA/xyQla6EwSWO5P1oS3qVcxOYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAswrsCS67i1GTNWNdc45JXkDTKuUFB+RPmeBkVTM5E=;
 b=w4qS+etwdsQ6DqfGVmpk51TbbCn2jLx8lcCt9gMChOnIL/Ht8MXqhpauAASgJ7zPugkggvQHDwRvay/c12XfgS1w3r75O01Uhk3Rxw6al4erksz9PjPO6/vLGkKMTBv68TyjH/O7kocF1zqgz9SirHyznLPcZqk95zT9NJSrINVMbQroX6XMcC6IUJCI4hdgGQDkHKzhgDT3GLGLUmF5UteYH+bWeK3Ix2E6uNG4dat7NlVxB6AA3keGkUrTc2fkU6Emz7kQtB10h3aqL4SyLRMN/NmOwAFGxE8BgTd0JliMSn4550MAintS27odDBGAjRiDeCHdXx5Vo0I990+FoA==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP0PR80MB5027.lamprd80.prod.outlook.com (2603:10d6:103:24::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Tue, 1 Jun
 2021 12:12:10 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 12:12:09 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2] docs/devel: Explain in more detail the TB chaining
 mechanisms
Thread-Topic: [PATCH v2] docs/devel: Explain in more detail the TB chaining
 mechanisms
Thread-Index: AQHXVmHwQAi4DLI3W0aHUjSxYgZ256r/C0wAgAAETTA=
Date: Tue, 1 Jun 2021 12:12:09 +0000
Message-ID: <CP2PR80MB366812BEB6E772382828BF2DDA3E9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210531211411.173895-1-luis.pires@eldorado.org.br>
 <aa6cfbda-9f95-17c0-a4a8-fef39a90f4fa@eldorado.org.br>
In-Reply-To: <aa6cfbda-9f95-17c0-a4a8-fef39a90f4fa@eldorado.org.br>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: eldorado.org.br; dkim=none (message not signed)
 header.d=none;eldorado.org.br; dmarc=none action=none
 header.from=eldorado.org.br;
x-originating-ip: [177.9.76.249]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6efa5af6-5949-4a8c-d9ff-08d924f67af7
x-ms-traffictypediagnostic: CP0PR80MB5027:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP0PR80MB50276249F9335F93A51A6546DA3E9@CP0PR80MB5027.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fbwiS4Lg6kx+mAWD5MArsUXNAZwJcccNDcvU2TcDZiEXlEu0japQFBFYdVfMJAdIi1T9/P8BBmmzcDfKEXXCZAwxMAXonziWQWJkHOi/ewCsnqAXd6I/kbFoQ25LyDM1ZxC58ThatAEGIykma8XcxH3/UBdLFDBLd2cPcjt5Uev3qbNcVIXhB4TJlAY3Y9c+xXQ38npYh8qq3vjC3nm4PhFtnwPxjNH4ospU3FaNi2ifq9fRq8vhC5FOXnVDfXuSR7EtfATU9FHcp+803Uy3J7Kzgi4nqGeHM/iLF/enhFcSUWzkww1IkUK7fESiddfFZNwCICshn22r/r3FfDPGX7y2JmY0NuR4jg0pP4gK1frdA6y7IJIgR+wZv+bt70/eU+TzYPoSsqyRKNVLtmNjarBG9QiHplukvP4VgqfOLF8gT0Dt0UvRa59kOJhCo4lOcvzkCSqjK4Y8qXoqIaHlQYPsQjCkiXY9+RZu7m+hW1+K3olB+coNCIhEsy9UR+0Vk9xNXmA+vr4JAkDqESL7V9sUY6bUOOWSuHUNLPxjfnbUaBQNpzWgf1miDa3RGE62kCQZcDcqTXfRF+KhOvTQuv+oJvBpeHIu3py859M7lI2C+wq3G+OzLAY3RDdAeAUiux5vN5tS1kimeFeTY4ZvbbDH9/+6yPSkwII87VhpYkG9NtTk4H+vgz726daLPeJBFYTIW6MkpVBasENAnfQF1aDDz5Xy8FpQsUPKt8RvTeI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39830400003)(346002)(136003)(376002)(396003)(366004)(52536014)(83380400001)(5660300002)(2906002)(122000001)(66946007)(76116006)(66476007)(66556008)(186003)(66446008)(64756008)(8936002)(33656002)(86362001)(55016002)(26005)(316002)(110136005)(54906003)(6506007)(7696005)(71200400001)(9686003)(38100700002)(478600001)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Vnp2MFU0NmMwaklrdGJDcTRZZ3MyK3NxeGhDT1ZiNCtvMUhhZ1Y5NS9oaVMr?=
 =?utf-8?B?c0dRSU1YNjViL0E5UTdEc2ZkdW95anRqOC9BMTR4Q0F6R0JqMW8ycFdLZ3JN?=
 =?utf-8?B?NlJZZ1J5TmxIVjdVek5zNk1veXpPV1VoZU9NL2FkYkNSZXgzS0p6Y01kb0ow?=
 =?utf-8?B?R2FLcVh3M0RHMHdIdVU0V1FPcENvNnVGdE5MSzZ0UHlUUytIQWMxa3c3cXBI?=
 =?utf-8?B?K1h5dFU5UWJWVVdLTWVrL1B5REYvZk5UTU9SUVplcHlKb2Jnc0hRNGd5clFX?=
 =?utf-8?B?OUZtUVVqSWtkNDRFQ2dGb1YxY2ZGL1JHM1oybUx5UUJrN04wQzQ4RFhPTlda?=
 =?utf-8?B?RzA5UHBJTkN1ZGtsbURtMXF6cXQ1WXU1dDhXdlZGSWxtMXZTQ1pxOVNLVlRo?=
 =?utf-8?B?T3RkUndwdWNhV0NjWVhoYUNxVmtVWklvQzhXbmVTalg5N05NZ29JVUEyUUVL?=
 =?utf-8?B?RjJpY1BxWG9IY2dmV1R2Q1ZVUDdCc1hDZzlwL2pUU09NYml4SXdaRVFvbEdZ?=
 =?utf-8?B?c3N6UnJ3c1hCbkIzbTRjWHVEQkVTaW41aE1ZamU3eW1UcXVTZy9Vb1E5Wnpn?=
 =?utf-8?B?M3R1R2V2RkJmRWRGUjZFOWV6Wkg4eTFCT0l5elR4TGZndnpRc1ZhUnNuVlR6?=
 =?utf-8?B?R3RYT3hYdUZ3WnF6RnpYSmsvWDdoNkR4U0JzbE13dWtSZEZ3WHFCT0IrSGhV?=
 =?utf-8?B?d0FoMWxlQWwzbWQrZXZKQjNydmd2eXBSaUY1YU5nUmJpQ3JXZjdldlRnMDJv?=
 =?utf-8?B?OUlRWEJJWURKQjR1S3YwV0J3QVZzclJKclIwWTRCSDZpZjIyRnI5T1Z1Tng2?=
 =?utf-8?B?ZkQzWnQvSW5abmJqWXd0ZHlTMUdieVJkWVFvQmJOcnhpMXlGV0xhd2tpeE9L?=
 =?utf-8?B?NlMyZjlGYWNRbm1reE5MVTNINjlQNWtyaGlpQWZuM2Z5aityb2d0TTIvbzlX?=
 =?utf-8?B?a1lRZUtUeit0WTFyRG5xQ2c0UURVWnFTdXNXZGcwdnV6OXZuRnZQVmMvekVT?=
 =?utf-8?B?Tzl6dUxwMVpoeGdzc0RCNngrUXlwRFJIRTZDc3BvYWh6cmE4RUpkZTljbnFD?=
 =?utf-8?B?YTBKaHBIZHBWT1RySWJtTkZPOXYxU2NqQW1iNDdaYVBqQUpwV3JtY0o5eXda?=
 =?utf-8?B?UUxPVSs4WjhqOHFjU2FoaUtPQ3lZWWVCK0lkSDJiTFZqU2dyMGdhNWxUZXRU?=
 =?utf-8?B?S2lVbjg2bGE1ZktGR2FvTVc1V216RlY0ZXVqaXF1YnBLN3JPQXJSQzBYSUd2?=
 =?utf-8?B?MFJDdC92WDNmUVV6TTRFMzFzWUlNaU9LWmZQTHlrSlQwRStKSU5aRzRwbVBQ?=
 =?utf-8?B?VGVyemM5N0lOUmpZc3hvbDZwMXRWakxydU9RUnVQakFCU3JDSVlnL041d3dL?=
 =?utf-8?B?WmxWZEVrQ0NwYWxEM29HUm4rS3M4dGdZSzk1Q1MwMGdpckJtYVlackNmUlNz?=
 =?utf-8?B?UVpHbkhMdjJVVFpYZlA4ZE9JRFNTK1JVRlhiRlYxVWZ0QXc0dDZTMlpSK2Zm?=
 =?utf-8?B?VDNXTVdocDJ3M09BM2Qzb0kxTTFEVHVVR3dlWFVvMUprZnRXbzc0UkI1UlA1?=
 =?utf-8?B?ZXc1cktld1pnU1g3ZzdIeFFnR1ZxQk81V0NRSFlrQlVTbjhpVGQxZDMwV0xJ?=
 =?utf-8?B?RGVySWpWMzFRemc3S0VZbStlTS9xWnVkYzBBbWNkSGZCaksveHI5Sk5rVU83?=
 =?utf-8?B?MERFcjZFaHJBZ1ZxVUNLOERKRkdzTGRUNHFLVlliWENQTlFHdTVqaFdacnZo?=
 =?utf-8?Q?09tcExEpS7f88mpkuQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6efa5af6-5949-4a8c-d9ff-08d924f67af7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2021 12:12:09.0525 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tS1FRnumb7I/3WAp035Jxsku9w7SwvG9N2VaS0eBKSvW0jOy+7M7+gMhuBuuuQQr2MwP5TCNWbsG/yYIV2mtrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP0PR80MB5027
Received-SPF: pass client-ip=40.107.79.125;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-CO1-obe.outbound.protection.outlook.com
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogQnJ1bm8gUGlhemVyYSBMYXJzZW4gPGJydW5vLmxhcnNlbkBlbGRvcmFkby5vcmcuYnI+
IA0KPiBJIGZlZWwgbGlrZSB0aGVyZSBpcyBlaXRoZXIgYSBjb21tYSBtaXNzaW5nIG9yIHRoZSBw
YXJhZ3JhcGggY2FuIGJlIHJlb3JkZXJlZCBhIGJpdCBoZXJlLiBUaGUgd2F5IGl0IGlzIHdyaXR0
ZW4gbWVhbnMgdGhhdCB0aGVyZSBhcmUgbWFueSBjYXNlcyB3aGVyZSB0aGUgVEIgaXMgYWxyZWFk
eSBhdmFpbGFibGUgYW5kIHlvdSdsbCBiZSBleHBsYWluaW5nIGhvdyB0aGUgaGFuZGxlIHRoZSBt
b3N0IGNvbW1vbiBvZiBzdWNoIGNhc2VzLCBidXQgYnkgY2hhbmdpbmcgdGhlIGZpcnN0IGxpbmUg
dG8NCj4gLUluIG9yZGVyIHRvIGFjY2VsZXJhdGUgdGhlIG1vc3QgY29tbW9uIGNhc2VzIHdoZXJl
IHRoZSBUQiBmb3IgdGhlIG5ldw0KPiArSW4gb3JkZXIgdG8gYWNjZWxlcmF0ZSB0aGUgbW9zdCBj
b21tb24gY2FzZXMsIHdoZXJlIHRoZSBUQiBmb3IgdGhlIG5ldw0KPiBZb3UgZ2V0IG1hbnkgY2Fz
ZXMsIHRoZSBtb3N0IGNvbW1vbiBvZiB3aGljaCBpcyB0aGUgVEIgYmVpbmcgYWxyZWFkeSBpbiBt
ZW1vcnkuIFRoaXMgc291bmRzIHRvIG1lIGxpa2UgdGhlIG1vcmUgcmVhc29uYWJsZSwgYnV0IGlu
Y29ycmVjdCwgcmVhZCBvZiB0aGUgcGFyYWdyYXBoLiBJZiBJIGFtIG1pc3Rha2VuIGFuZCB0aGVy
ZSBhcmUgaW5kZWVkIG1hbnkgY2FzZXMgd2hlcmUgdGhlIFRCIGlzIGFscmVhZHkgaW4gbWVtb3J5
LCBJIHRoaW5rIG1heWJlIGl0IGNhbiBiZSByZW9yZGVyZWQgdG8gbWFrZSB0aGlzIHJlYWQgbGVz
cyBsaWtlbHkgdG8gaGFwcGVuLCBieSBzYXlpbmcgc29tZXRoaW5nIGxpa2U6DQo+IFFFTVUgaGFz
IG1lY2hhbmlzbXMgdGhhdCBhbGxvdyBtdWx0aXBsZSBUQnMgdG8gYmUgY2hhaW5lZCBkaXJlY3Rs
eSAod2l0aG91dCBoYXZpbmcgdG8gZ28gYmFjayB0byB0aGUgbWFpbiBsb29wIGRlc2NyaWJlZCBh
Ym92ZSkgdGhhdCBjYW4gYWNjZWxlcmF0ZSB0aGUgbW9zdCBjb21tb24gY2FzZXMgb2YgdGhlIFRC
IGZvciB0aGUgbmV3IHNpbXVsYXRlZCBQQyBhbHJlYWR5IGJlaW5nIGF2YWlsYWJsZS4NCg0KSSds
bCBqdXN0IGRyb3AgdGhlIGJpdCBhYm91dCBiZWluZyB0aGUgbW9zdCBjb21tb24gY2FzZSwgYXMg
aXQncyBpcnJlbGV2YW50Lg0KDQo+IFRoaXMgbGFzdCBwYXJhZ3JhcGggaXMgYSBiaXQgdG91Z2gg
dG8gcmVhZCwgYnV0IEkgZG9uJ3Qga25vdyBhIGJldHRlciB3YXkgdG8gd3JpdGUgaXQsIHNvIGl0
IG1heSBqdXN0IGJlIHRoYXQgdGhpcyAzcmQgc3RlcCBpcyBhIGJpdCBjb25mdXNpbmcgYXQgZmly
c3QuIE1heWJlIHNvbWV0aGluZyBsaWtlOg0KPiAtVGhpcyBpcyBpbXBvcnRhbnQgYmVjYXVzZSB0
aGF0J3MgdGhlIFRCIHRoYXQgd2lsbCBoYXZlIHRvIGJlIHBhdGNoZWQNCj4gLWJ5IHRoZSBtYWlu
IGxvb3AsIGFuZCBub3QgbmVjZXNzYXJpbHkgdGhlIG9uZSB0aGF0IHdhcyBkaXJlY3RseQ0KPiAt
ZXhlY3V0ZWQgZnJvbSBpdC4gVGhpcyBpcyBkdWUgdG8gdGhlIGZhY3QgdGhhdCB0aGUgb3JpZ2lu
YWwgVEIgbWlnaHQNCj4gLWhhdmUgYWxyZWFkeSBiZWVuIGNoYWluZWQgdG8gYWRkaXRpb25hbCBU
QnMsIHdoaWNoIGVuZGVkIHVwIGJlaW5nDQo+IC1leGVjdXRlZCB3aXRob3V0IHRoZSBtYWluIGxv
b3AncyBrbm93bGVkZ2UuDQo+ICtUaGlzIGFkZHJlc3MgY29ycmVzcG9uZHMgdG8gdGhlIFRCIHRo
YXQgd2lsbCBiZSBwYXRjaGVkOyBpdCBtYXkgYmUNCj4gK2RpZmZlcmVudCB0aGFuIHRoZSBvbmUg
dGhhdCB3YXMganVzdCBleGVjdXRlZCBpZiB0aGUgbGF0dGVyIGhhcyBhbHJlYWR5DQo+ICtiZWVu
IGNoYWluZWQgdG8gb3RoZXIgVEJzLg0KDQpUaGF0IHdvdWxkbid0IGJlIGFjY3VyYXRlLiBUaGUg
cmV0dXJuZWQgYWRkcmVzcyBJUyB0aGUgYWRkcmVzcyBvZiB0aGUgVEIgdGhhdCB3YXMganVzdCBl
eGVjdXRlZC4gQnV0IHRoZSB3YXkgeW91IHdyb3RlIGlzIG1vcmUgZGlyZWN0LiBJJ2xsIHNlbmQg
YSBuZXcgdmVyc2lvbiBvZiB0aGUgcGF0Y2ggdGhhdCBpbmNvcnBvcmF0ZXMgaXQgd2l0aCBhIGZl
dyBhZGp1c3RtZW50cy4NCg0KLS0NCkx1aXMgUGlyZXMNCkluc3RpdHV0byBkZSBQZXNxdWlzYXMg
RUxET1JBRE8NCkF2aXNvIExlZ2FsIC0gRGlzY2xhaW1lciA8aHR0cHM6Ly93d3cuZWxkb3JhZG8u
b3JnLmJyL2Rpc2NsYWltZXIuaHRtbD4NCg0K

