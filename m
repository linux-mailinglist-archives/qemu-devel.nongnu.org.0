Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 896FC3A1896
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:07:52 +0200 (CEST)
Received: from localhost ([::1]:56864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzo7-0001z9-H6
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzeT-0005GK-NY
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:57:53 -0400
Received: from mail-eopbgr800137.outbound.protection.outlook.com
 ([40.107.80.137]:31454 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzeQ-0004YC-4a
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:57:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAjNDOw670miCljwbI3CW83rviHRoHNGk6iBJPQVU8ag9b1r9pPjLzctWWOQwFkSOIK8weEpE1uccjSHrNNHWDIOfps75Rvk/WKroRGgCMZphufAipmY+21ycYJGW/jYSNT1tqKtBNq/kWAv53WAT+Vv3M7BUqZxIpMKELCBG2EKJ8CLOHcveHFzveLXzLf8Ml/Lf6jeeKYIpFTaXSdwV+piAXE8A6RWSIjsGhcKjK2sbHeLBWS7YdBaLr9dB5BVNFXQMYpoGVwaBrgtWPgc6adKdpi0sqSPAS7Wi1LQOiRtAtwl327JXTjD+5il4l6ylDp25xA0NVCuMSd7ocqCXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rn+GlWEDHHs9zgoHS9iNkRH4P2inRzNLr2iH4gWrAdk=;
 b=bYFg+6XdAZCp8MofsLz/sJmQWtnSebOcoZMyHrNTWnQzXPKT6rtjQHPqksNaHEGIs3KaC4NdvE5VZMwX9kSI0XUGj0qZTX8PAWaf6/4ePwVcd98BoSOpiV6DVf3Pqf6aHSprU6HS+g+ULqUPKk+lyKeboslo3AS77z8IUuy1QIhGGg0+mXhPt6fgSRb81LUAMgW0bMkMbtl9uuLw/Ilc2b7k75n7DN9VPpILiFbYoabj6/bzvCFP7ftqM3nPXLHX0MtZnYHNwJDWpebTTyph2ZRSt9+Ix/1uVYqbN+2GTjdYI/2s8WUxcoS7+PHq4CDP0dfCNK+ry5+oOqrkGSva/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rn+GlWEDHHs9zgoHS9iNkRH4P2inRzNLr2iH4gWrAdk=;
 b=ftVCnWdn0/JI71c/s3pDT7QTFGmZOcQPpUdnKTN+/rEbJc34JPrb14gb3m9Vn3rsMLx7Fe2Zl9WJzoY3Qe6YosoIYMIaCU6YpWLn3jTVf8icbL3TbGr2fBiYB3cLJ6lP4U7n5pM2RVM3uPdPmBVCc363KDNpvwZj2xzjvj/kvV+Zd3AfjAifaGrJTRU6vFCeSnZaaZV+Ygpmtc2vzxUTBVVomInOCUYQtQpqmRJ0IQNl3yaBqlbve0U7h1y4axi/4GCgWmmVzyvXbtwZ1UG1iDGfkjBV+kQIxDT2QyBkW8YYL1Z4P/u90E8/JI6xhWtQBQQWYNR6zy27NYxs2Btylg==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB0017.lamprd80.prod.outlook.com (2603:10d6:102:1d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 14:57:48 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:57:48 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 10/28] accel/tcg: Rename tcg_init to tcg_init_machine
Thread-Topic: [PATCH v3 10/28] accel/tcg: Rename tcg_init to tcg_init_machine
Thread-Index: AQHXP6oSCSReepnxQkOKl3V7wwkUgKsL+v5g
Date: Wed, 9 Jun 2021 14:57:47 +0000
Message-ID: <CP2PR80MB36684594DDDC2325D2C6732BDA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-11-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-11-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e0b64b9-beff-4896-1155-08d92b56f23f
x-ms-traffictypediagnostic: CP2PR80MB0017:
x-microsoft-antispam-prvs: <CP2PR80MB001710B61F9E55FAEE64097CDA369@CP2PR80MB0017.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PoxvAz5hQZM2Iv52r9oMvRSxjOX6OhkfWDcVABfBpi3YrbPXwy6x7CozmoH577gXJs85ec7mHr5XZMQuDv0a1fGynBgJynz4kg44Tic+C+TL7HlDrBnRrL4r6qGgwyY8OMWTZydbcHm+9YgL5psVqGPNZMUjmOCB5DYwvwsMuWsgF57WJI3f05l+NCENsFUhSrk2kCtWWURl41antjECROeWWMOxcYmWwbCg5bsUf5ZqpkQaoTETKeAqhD4D7klongolkI/ojwZ5E0y5CfE96K1sUqCLk5CwCf/pRruTM/qGNGJ2Ymn8JpSr+878FtG2ZZb3uIH4ctLyhqz1V74EBtNifHrBdoTsgITtIlQeIxxdbw80vUj+Kf07paMfuef4QHbz2mOHhmNGYwvAgRzXvDyv7zJQH52fd+bS52FVbmeTJun3YFqZMT4MAn8eFonOB0KsCqsevxRue+iXfCA0k8YT4aXTtJf60SQJ7pH+S3IpCJ1nUOFQPfF/ZHcyi7VFPcuGwd7yRsH77Yd47okbCSV4J5nZKPBLFu6y56SF3PyDjZ7Xl3WslyN7PZ0d8LmgdLJ4Nt8iLnfBLNGDWREEPgtpfe6k5u5QzqnRSmm52Ryhv0qWU/x8rw+PvPLha+K7QEWi87IZ2HqpA+uEYHNfmhB6tM7gK7ISDN+XBjGBTyqa63qrzxZBQd8NE+DQyOBCSnVQpPnLTctsbF8XcatTK5Ens2ts06lafxzxDVur7SA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(396003)(346002)(136003)(376002)(366004)(122000001)(86362001)(2906002)(26005)(8936002)(55016002)(4744005)(5660300002)(7696005)(33656002)(83380400001)(316002)(186003)(66946007)(66446008)(8676002)(110136005)(64756008)(66556008)(76116006)(66476007)(478600001)(52536014)(4326008)(71200400001)(9686003)(6506007)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?YkVMSTduU3ltSFNpMExOU01ZNi9xUzNhVnVlQytxd0hLcGlsdHE1Q01kNXM1?=
 =?utf-8?B?cGlrcEVobGxaOW5tdE1Bc0EwS1UwRlJhZTRoSGx6cDZqYVduNGpsUXdKV2Z5?=
 =?utf-8?B?Slp1VHBTb0FCMWNnWlkrSjZ1clRxRW9PamRabFhEbmlhVHl4dk9yL3pyeW9v?=
 =?utf-8?B?ZHVKREpEWDAvNjFlZWFlWGt0T2h3WWhiOGwwR1ZYYkhrV2xzdzd4S29Wdkxr?=
 =?utf-8?B?YW9zRkFodU1pejdsNGo1d2sxcUUxUEl5NVZydi8yaDJ5K1pNVngrZ2grUHZY?=
 =?utf-8?B?UDhMZEZKeWJSb0dwbEhOVVVoZndZNWE3OEZTcUs0Y2psV1dkbCs5b2svaWZq?=
 =?utf-8?B?Z0hmQjVNVjBEL1RlQ2I3KzM1RzBhZG1HSzJLR21NRERNQXNtRWFpeW5OSnNJ?=
 =?utf-8?B?aGFZNXhKNDF3cVk3OVc4TzZYR1hRSVlZaUdqWk5rdFN3NWRGZ2xHNXRMMzlR?=
 =?utf-8?B?MzFDZXAxR2Fhd0RPK01lWTMyOEdVaTVtazhKc1JGK2YxSklDL2pIT0ZyOHJ1?=
 =?utf-8?B?WGhQWEFaM1NNQXBZZnNrYW9hM0xodWtmQjczZ29OWEVENEdrMSthV0V0S2RO?=
 =?utf-8?B?a2hiVysyYUZTbEVhVUo4djN1cXNPaGl2VmR2cUF2Vm8xclBsU3YvMHRCd2Rv?=
 =?utf-8?B?S0phalR6T1NqcHN4Z1E1eTZLOGxyS3c5ZWIvdWYxS1l6RXNtWmZ5VDBzdW1U?=
 =?utf-8?B?bkJoSnJDVEVBOER1SXNaa3BRK3k4NnVxN1g4bXlxZm9VRmhzd2xpUGN1dDRx?=
 =?utf-8?B?OUpRNXdzY1UreUpIY1JEMVM2VlNsWlpIRDNibEhNUkxQc042ZWtjazdIY3Ju?=
 =?utf-8?B?M3VWUU02b1NVM2p5U2liaTJsLzl2RWlwSGN3b2FudWkxTkNxUThSSmJwbzhp?=
 =?utf-8?B?MDlSTmI3NVdFbDFrc2ZXMHRCRHBNcWxyM3Y0RTg0djJPbjZLM3l1YmFQV1hL?=
 =?utf-8?B?dW5QbjhiU0ZweHFjYmhJRDFmV0gwU0RaMHZTU3Rua0R4ZksrcWxTTzhHaE9B?=
 =?utf-8?B?Nk5CVU85RFNrbFE2aFFJWDB0aFF5TUNnN1lYOUlVYnFOa3BPYTB0UGdSbUlK?=
 =?utf-8?B?MFpXS0JuTUswY05UOFlxd2hqNEd2OXVNYTlxSzVFK2krT1V4S3Q2Uk1nQi9j?=
 =?utf-8?B?c2Z1OGJ2KzJ5WWNhdys3cEdWbzR0MU4rT1B0RWROQjY5MmtVOTNZT2FOeVVF?=
 =?utf-8?B?aldtSXlSZ0ZKbktvTG9XNGluWUhzRmd4Sk8zbGlOZG04ZzA5UGhnRWlTQXpj?=
 =?utf-8?B?RHFqUUZzOFNJV28xakhuWElCcVlSZXNSMDlGSEp1d2FDd0JRcWNySmhoUXFy?=
 =?utf-8?B?QTloQ0ljcVVXdEE3N2lRUnpkdnVDcFVhWXo3ZG5IMjJGT2hnandVR200RXlF?=
 =?utf-8?B?d21qRkVCaEJtNjQrVEFheTNTUDFzdk1SNWliK24wb0loRDlrREwvdytaM1BZ?=
 =?utf-8?B?Z29YallaNEpYZ0s3RVFWc3dSelh0ak16OFM4MzV4bjdrWEF2NWVQSlFBNXhZ?=
 =?utf-8?B?c2g0TitGUGtHdzVDdW1USzdWdm82WGs1cnlsaGVaRldJYTNJZW8wL1dUWDhu?=
 =?utf-8?B?dnpZc01zNXlzL1pwdW80S1RaazVQWFdvNkw4am5FUGZhcGNtdWV1OVlEWVJC?=
 =?utf-8?B?NVFHY294V3AxZUNaNERrYnkwMmptaE9LdHpvVUZrdm1iTkJoVHdZY3lQVUts?=
 =?utf-8?B?UVFHTGF0Z2R5TlJMN0RoOWtwTGNWODRvcUpXSnhhbUFteitoM1BKRG94QU5R?=
 =?utf-8?Q?jb5J2mKlkpyCga48k8baWCsOdb9zb9sJ9nI/lAX?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e0b64b9-beff-4896-1155-08d92b56f23f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:57:47.9478 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1lhnlolq5+Zc9srK8i08dPWEweupcBMYHuMwHEjt28ZMKk+FZI3qq/xY0Rn6sSyKW+W4/BTaLRy2/tZh8fddrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB0017
Received-SPF: pass client-ip=40.107.80.137;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-DM3-obe.outbound.protection.outlook.com
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
IFdlIHNob3J0bHkgd2FudCB0byB1c2UgdGNnX2luaXQgZm9yIHNvbWV0aGluZyBlbHNlLg0KPiBT
aW5jZSB0aGUgaG9vayBpcyBjYWxsZWQgaW5pdF9tYWNoaW5lLCBtYXRjaCB0aGF0Lg0KPiANCj4g
UmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+DQo+
IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5h
cm8ub3JnPg0KPiAtLS0NCj4gIGFjY2VsL3RjZy90Y2ctYWxsLmMgfCA0ICsrLS0NCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNClJldmlld2VkLWJ5
OiBMdWlzIFBpcmVzIDxsdWlzLnBpcmVzQGVsZG9yYWRvLm9yZy5icj4NCg0KLS0NCkx1aXMgUGly
ZXMNCkluc3RpdHV0byBkZSBQZXNxdWlzYXMgRUxET1JBRE8NCkF2aXNvIExlZ2FsIC0gRGlzY2xh
aW1lciA8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJyL2Rpc2NsYWltZXIuaHRtbD4NCg==

