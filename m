Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CEA3CD5EB
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 15:42:02 +0200 (CEST)
Received: from localhost ([::1]:51512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5TWz-0004xA-3H
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 09:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1m5TUm-0003aO-RT
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 09:39:47 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:62612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1m5TUk-0001P4-2T
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 09:39:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1626701981; x=1627306781;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=5y2ZEO09XKeORNZ+HNAB61l8zAwMuCYqYeUdDwImZNc=;
 b=08ZIKC9N2q2fExNjoK3sSEVmWQfNSzUkdr65klZ+TrQWI+pmwRaPA7we
 mJxy9RCP/Sea13Qfk5sF09Rtca5/q4J0XJRjLnwOiVe/FE3z/o2EQo6R3
 Yykb9j1D15cZD5pOJy39nJ3EnYj4gHYhfUVJjT9kQ8+ZBf5ZHzRxoTbRP E=;
Subject: RE: [PATCH 01/20] Hexagon HVX (target/hexagon) README
Thread-Topic: Re: [PATCH 01/20] Hexagon HVX (target/hexagon) README
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 13:39:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQ+1HI27D/4MCFzYyB+sF7gb+90A6kQAAFKBvNA983lPWcuSfw5I+L/fFnxzLn/r5NRc/gWsPzs4xgBahRJLn2mmcziDQh0IWJmS35L6zH7p8dI7q1m/EgV4Y8ll7luE1yDiVDlctGjLMlsrtxPcR/Cuvffc/cbD+btc9aSGOdQ+mP1dtPBaKR1wqBPmkZzMY9NNud52foM53E1MfV+Opa8FP3GFtjWns7VKICWtn01TO8Wonh/C4en6BL8fCGlgPV4g6NbNv0DUs7Sa486m8K0Nzx6O4chU5XzltVQuUwk13K9TBxwamk/kvDd70SfuddytKFD8n/UkA+WZZfNKlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5y2ZEO09XKeORNZ+HNAB61l8zAwMuCYqYeUdDwImZNc=;
 b=b9oqBb/2DipSevBCOFZCU6HysR4/P/2+EIH+GNovLZR6Sl4HmoAcO/xTNzi3c/6Bpu2aiHCVO3f3CBZMcNfS60+QBybjGa7Da6+sDxlmMdKAEWiXyWF6ulZCM4ykJjCuPkzau/9rH+w2MCqYktsTcniXEAZUY90cbqeivS8w2hAoyUFt4i5Y3TwpX8iE/ZqpfH43mkBaXHJCrX2AJ/5MUilaETMGzrwGh0IAbxl4nswN23hWioQ5KfMVcwYrEwlH0i7swSUUBySqfBPWvLDfpabaWq0MBkoZRSknKd6HR3NT6IuQFVkZ+DN+m7hmvduLhJ0WHZ4+aoSKaSNisXSLXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BN7PR02MB4194.namprd02.prod.outlook.com (2603:10b6:406:f8::18)
 by BN7PR02MB5331.namprd02.prod.outlook.com (2603:10b6:408:2b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Mon, 19 Jul
 2021 13:39:35 +0000
Received: from BN7PR02MB4194.namprd02.prod.outlook.com
 ([fe80::b5c6:f4a3:9366:41d1]) by BN7PR02MB4194.namprd02.prod.outlook.com
 ([fe80::b5c6:f4a3:9366:41d1%7]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 13:39:35 +0000
From: Brian Cain <bcain@quicinc.com>
To: Rob Landley <rob@landley.net>, Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Sid Manning
 <sidneym@quicinc.com>
Thread-Index: AQHXcfZVkb0B/5pb+Eqj5OkTVloPfqs/CH+AgABZW3CACi/4gIAAzkxw
Date: Mon, 19 Jul 2021 13:39:35 +0000
Message-ID: <BN7PR02MB4194007550E66EBE877625A6B8E19@BN7PR02MB4194.namprd02.prod.outlook.com>
References: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
 <1625528074-19440-2-git-send-email-tsimpson@quicinc.com>
 <1b632e88-43d4-3034-cf7b-d42be056d842@landley.net>
 <SN6PR02MB42054B50C60ABA378256492DB8159@SN6PR02MB4205.namprd02.prod.outlook.com>
 <553c32e8-188c-5b2c-2f4a-a8cfd7b903a9@landley.net>
In-Reply-To: <553c32e8-188c-5b2c-2f4a-a8cfd7b903a9@landley.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: landley.net; dkim=none (message not signed)
 header.d=none;landley.net; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 533f34fc-75d5-409c-47c0-08d94abaa5eb
x-ms-traffictypediagnostic: BN7PR02MB5331:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR02MB5331FAFC3D8AA285F2E513AAB8E19@BN7PR02MB5331.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xKvjUcNroOM0TUKIg/xUoSFMjp5gmoZkiVIt7q/XntJdHvdS6jr8UdCU3NrkD/IzsKT0eu5GURoHjKajVTZrJNcOMBRCXvw1Ybho20Bcu7E1PPNwq9AhxjF8FoGls6f+I48SFdG3ZgJ+eFVYrhqe0oQAcdFJQ4rCxi82GXJGK8DCCCk8KuWX+ujRWT/Ja9kUPyWy4UyboWNQwp30T/E50emWUBhL9yGc5jZx9L4huKjRAyfe0UsMyoVME12rJsCARobn7KUe1feRcjohE2w5GnVNFlR/xKtIg6KeyXkH3DKQp41G9O6MEfUCyhR7uKNYtH9y/yfiBbQINfD5bAYWuNwFkT4isKw0lDNetzwicajm03czjj5opIFbMaUfWGZgqVVQvPeZlP4FvAFyP0rzWt+dJFBcBuK6xYdQxhILzakmIp23VUZT7W6JUJc08Gs008Adu2UZtQW4bNaq/6hSUh0yPKfWlcn3Bo5Aw2Gy+CYK0pUcF2HMOgn4psTGg/FB8cHIxRSPRBLA+TC9JB8tZ1jBzXQp3nJMSTSi4C43BGX3rlASkZmguvLzBXifH8sc6ITYLDkVjpG9kYhh+g7436w0wrB/DUIJsAm/PgAc4evrG2wXVG7D4SPV4Xs434chjRj7r5sCihoxeuPGMv2cXyEUuOvcGxsG6vWIRpee76Ual0MKI54j6bkzAfHB1O9UN82EFfOJOSJALV9cUY/61DC0j/4/Rf00ZWFUzeiKnCWFRM3O8iMUvBq8e575xNnAhLSN9D44Ets6sivf64Dc2kuZFNAg7qzF0+GgWUWOuGqHGpbuaoNZ4zmsFWRVqUSv+YBbw4CH8O9SX1qMX9uSKw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4194.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(83380400001)(26005)(186003)(5660300002)(2906002)(316002)(6636002)(7696005)(6506007)(53546011)(110136005)(54906003)(86362001)(8936002)(76116006)(478600001)(71200400001)(8676002)(966005)(52536014)(4326008)(55016002)(33656002)(9686003)(66446008)(64756008)(66556008)(66476007)(66946007)(122000001)(38100700002)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVJrcFphRlZYUjVwU2JLTVhPNGJnQUNUeXc3NmNXOE84ak1DR21XYTBjVisr?=
 =?utf-8?B?Qk1XSm9Rc2lIWGRybWdUNGRaZ0JvZHF2U1V5TWZJOFhOcTRreUtOT3RmaFdC?=
 =?utf-8?B?ZGhuc255SmFCaVpkNXFGRGEyQUNnYUdzbVlLdGZjVkpIVHUxUUx1WlZFckxy?=
 =?utf-8?B?ekx4OXMrL01SUHdkbWJmSmdyZ2xpS0F4ZjlzaWJZTlJlK3ZlcWVOMDJod3FB?=
 =?utf-8?B?QWdVbDRVS2JGVFExbnFvdnN5NmpJNkNjVEVud21zSVpab0QrL25KL3hhNVZw?=
 =?utf-8?B?ajhwelNNTjh2dTBiQnVDYzNPZmN0bXR0RzIraXJ2RXlwN09ISGJXSUt1bm1n?=
 =?utf-8?B?V2ZMVCtoNWl1dWlJSUF1VlFUUklLdDNIWUU0SzU4MmZCNWRHMjhyQ0hmRzRq?=
 =?utf-8?B?QjdkV3B2R004WldiV1ZubE40QVpwWEswSnNOa0VQYU1zY3cwd0tyU0RQNmFx?=
 =?utf-8?B?MDN5MXBhMEMrS3VZSDY5VUpNN0dyVWE5OFNaZGtid3o3aGNxUWhaM283UU1E?=
 =?utf-8?B?aTlhYzY0U3NWSnVad0dkWGc0L0ZIVEVhOXpudlBGYTI3bFcwOXdsYjkrWUt5?=
 =?utf-8?B?UGJUZTdIYVRGUWNmenp3UWpPdnJBalZWK1JlTmU3UjF1NkI3YmNieFA3bjhM?=
 =?utf-8?B?OTZKaXptRnpJSjdzZnJyaWJEYjM0bjQrSEZBRkZ4THpBQ3NQVmo3d3ovV200?=
 =?utf-8?B?aUJ6Vy8zTVFRMTZCTm0xcW1kUmNYT2lOeGdpVUlISVZIRkcrbEJITlAvNnFO?=
 =?utf-8?B?ZitLUUw0bjNCdHN0MEluUDNHSmlNVDZId2lPWjBJWnRQRThlbVlubVk4cm84?=
 =?utf-8?B?N29LQWhyVStGY0FxeXRIdEdPSTRDSVpuRS9PbFkrK21wV1NQcnZkSzA1eUgz?=
 =?utf-8?B?TWtxQ3ZFVks3WSsySkF3SFdyYVlMRnFXaCtLQ0ZkR1VuYStHVm1SOVA2dUlO?=
 =?utf-8?B?Zm1uRlg3Q01tRUIyR2lIYWhreEJwM1lDUTU2U0ozbUU2N01QZ1R1U1pjV2Nm?=
 =?utf-8?B?Tm12RE9UUEQwOVBHbTY4UmRLNHdrYktFYVJxNDJicWowb09nSjdMc2hVNlhQ?=
 =?utf-8?B?K0NweWdLZ3d4OGdtREw0eU4yT0hRb2NkQ21tTmppLzkwS2F2eXJQOHRIbXEv?=
 =?utf-8?B?dlpVY2FGNUU4WHRLazlERVFlbjdaVzJqaTZINjMycmE0Sjk3cDNPYitieEE3?=
 =?utf-8?B?aU9pbGRaNkhwL09BMlJzdUFHdWlXNFFleWRNNWE3a1pvblpFTzRpWlhTL0l6?=
 =?utf-8?B?bDlSWjAvcE9pSHcyc0s2Y01WN3I1NnpIMExJdk9WUWNkYTR3T3dGc3BxNDl3?=
 =?utf-8?B?T1VsVWl5eTRTWHJpSjQ5SkIyTTluK0hrTjhKcFZlMEFkSVJrczB1ckd6RHZ0?=
 =?utf-8?B?NnNvZEdEeS9hYjZpRmE0QzBSSE9ZNGVMUW13T25NQW1BOXV2S0kxWUNCaU1o?=
 =?utf-8?B?OU14MFNNRGkzUTIrem9QRlFVZzVac2VuVUZLS08zbzZtbXM0azFTVlpXVzM3?=
 =?utf-8?B?OHpxSE9URGlaY2NzU2RpZ3dLbXZ3QnhJaW50amdZcFFKbUZJenN0NXZQVzc1?=
 =?utf-8?B?UzF4dU1MNGJFcHlEaEp3VUNmQ1ZOTDg4N3VuK01sTkpHdDJvVFZ3WklhS3Js?=
 =?utf-8?B?SlNPcUtsZ2R6WlRpR0VlMWZPQ1FoU3cvV3JRUHpPWWdPZTdITXFnVHZlNXMx?=
 =?utf-8?B?SG1Rc1ZwQXovQjV5bEhjeSs5RFV3VnNCZlFqZmgyTlJKZ2NGV1FZMzdZeU9D?=
 =?utf-8?Q?SVTI7NGSwiQ6fEefQT1FbX1fCsbxn7yjp3tP18p?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4194.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 533f34fc-75d5-409c-47c0-08d94abaa5eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2021 13:39:35.6498 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qqUNpq3wc01Ae/sGRmdPXywyovFVgsADku1ZpduQQNw91azB00JbsesmzNnJ5HhlvTPTEg3LjsFY3YvY+BGqnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5331
Received-SPF: pass client-ip=216.71.140.77; envelope-from=bcain@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: "ale@rev.ng" <ale@rev.ng>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iIExhbmRsZXkgPHJv
YkBsYW5kbGV5Lm5ldD4NCi4uLg0KPiBPbiA3LzEyLzIxIDg6NDIgQU0sIEJyaWFuIENhaW4gd3Jv
dGU6DQouLi4NCj4gPiBhbmQgdGhlcmUncyBhbHNvIGEgYmluYXJ5IGhleGFnb24tbGludXggY3Jv
c3MgdG9vbGNoYWluIHRoYXQNCj4gPiB3ZSBzaGFyZWQgZm9yIHVzZSBieSBrZXJuZWwgZGV2ZWxv
cGVycy4gIFRoZSBoZXhhZ29uIGxpbnV4DQo+ID4gdG9vbGNoYWluIGlzIGJ1aWx0IG9uIFVidW50
dSAxNi4wNC4NCj4gDQo+IFdoZXJlJ3MgdGhhdCBvbmU/DQoNCmh0dHBzOi8vY29kZWxpbmFyby5q
ZnJvZy5pby9hcnRpZmFjdG9yeS9jb2RlbGluYXJvLXFlbXUvMjAyMS0wNS0xMi9jbGFuZytsbHZt
LTEyLjAuMC1jcm9zcy1oZXhhZ29uLXVua25vd24tbGludXgtbXVzbC50YXIueHogLSANCgktIEJ1
aWx0IG9uIFVidW50dSAxNi4wNCwgc2ltaWxhciBkeW5hbWljIGRlcGVuZGVuY2llcyBhcyByZWxl
YXNlcy5sbHZtLm9yZyBiaW5hcmllcw0KCS0gTWFuaWZlc3Q6DQoJCS0gbGx2bStjbGFuZyAxMi4w
LjAgdGFnDQoJCS0gTGludXggNS42LjE4DQoJCS0gZ2l0aHViLmNvbS9xZW11L3FlbXUgMTUxMDZm
N2RjMzI5MGZmMzI1NDYxMWYyNjU4NDlhMzE0YTkzZWIwZQ0KCQktIGdpdGh1Yi5jb20vcXVpYy9t
dXNsIGFmZjc0YjM5NWZiZjU5Y2Q3ZTkzYjM2OTE5MDVhYTFhZjZjMDc3OGMNCg0KDQo+ID4gQnV0
IHdoZW4gYnVpbGRpbmcgeW91ciB0b29sY2hhaW4sIG9taXR0aW5nIExMVk1fRU5BQkxFX0xMRCBz
aG91bGQgd29yaw0KPiBqdXN0IGZpbmUuDQo+IA0KPiBJdCBkaWQsIHRoYW5rcy4NCj4gDQo+IE5v
dyBJJ20gdHJ5aW5nIHRvIGZpZ3VyZSBvdXQgd2hhdCBhbGwgdGhlIGV4dHJhIENGTEFHUyBhcmUg
Zm9yLg0KDQorU2lkIGZvciBzb21lIHBlcnNwZWN0aXZlIG9uIHRoZSByYXRpb25hbGUgb2YgdGhl
c2UgZmxhZ3MuICBTb21lIG9mIHRoZXNlIGZsYWdzIG1heSBiZSB3b3JrYXJvdW5kcyBmb3IgdG9v
bGNoYWluIGlzc3Vlcy4NCg0KPiBUaGUgY2xhbmdfcnQgYnVpbGQgaGFzIENNQUtFX0FTTV9GTEFH
Uz0iLUcwIC1tbG9uZy1jYWxscyAtZm5vLXBpYw0KPiAtLXRhcmdldD1oZXhhZ29uLXVua25vd24t
bGludXgtbXVzbCIgd2hpY2gNCj4gaHR0cHM6Ly9jbGFuZy5sbHZtLm9yZy9kb2NzL0NsYW5nQ29t
bWFuZExpbmVSZWZlcmVuY2UuaHRtbCBkZWZpbmVzIGFzOg0KPiANCj4gLUc8c2l6ZT4NCj4gICBQ
dXQgb2JqZWN0cyBvZiBhdCBtb3N0IDxzaXplPiBieXRlcyBpbnRvIHNtYWxsIGRhdGEgc2VjdGlv
biAoTUlQUyAvIEhleGFnb24pDQo+IA0KPiAtbWxvbmctY2FsbHMNCj4gICBHZW5lcmF0ZSBicmFu
Y2hlcyB3aXRoIGV4dGVuZGVkIGFkZHJlc3NhYmlsaXR5LCB1c3VhbGx5IHZpYSBpbmRpcmVjdCBq
dW1wcy4NCj4gDQo+IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgeW91ciBsaWJjYyBidWlsZCBuZWVk
cyBuby1waWM/IChBcmUgd2Ugb25seSBidWlsZGluZw0KPiBhIHN0YXRpYyBsaWJnY2MuYSBpbnN0
ZWFkIG9mIGEgZHluYW1pYyBvbmU/IEknbSBmaW5lIHdpdGggdGhhdCBpZiBzbywgYnV0DQo+IHRo
aXMgbmVlZHMgdG8gYmUgc3BlY2lmaWVkIGluIHRoZSBNQUtFX0FTTV9GTEFHUyB3aHk/KQ0KPiAN
Cj4gV2h5IGlzIGl0IHNheWluZyAtLXRhcmdldD1oZXhhZ29uLXJhbmRvbS1ub25zZW5zZS1tdXNs
IHRvIGEgdG9vbGNoYWluDQo+IHdlIGJ1aWx0IHdpdGggZXhhY3RseSBvbmUgdGFyZ2V0IHR5cGU/
IEhvdyBkb2VzIGl0IE5PVCBkZWZhdWx0IHRvIGhleGFnb24/DQo+IChJcyB0aGlzIHJlbGF0ZWQg
dG8gdGhlIGJ1aWxkIHdyaXRpbmcgYSBoZXhhZ29uLXBvdGF0by1iYW5hbmEtbXVzbC5jZmcgZmls
ZQ0KPiBpbiB0aGUgYmluIGRpcmVjdG9yeSwgbWVhbmluZyB0aGUgY29uZmlnIGZpbGUgaXMgaW4g
dGhlICRQQVRIPyBEb2VzIGNsYW5nIG9ubHkNCj4gbG9vayBmb3IgaXQgaW4gdGhlIHNhbWUgZGly
ZWN0b3J5IHRoZSBjbGFuZyBleGVjdXRhYmxlIGxpdmVzIGluPykNCj4gDQo+IEFuZCB3aGlsZSB3
ZSdyZSBhdCBpdCwgdGhlIENPTlRFTlRTIG9mIGhleGFnb24tZ3JhdHVpdG91cy1nbnUtZm9ybWF0
LmNmZyBpczoNCj4gDQo+IGNhdCA8PEVPRiA+IGhleGFnb24tdW5rbm93bi1saW51eC1tdXNsLmNm
Zw0KPiAtRzAgLS1zeXNyb290PSR7SEVYX1NZU1JPT1R9DQo+IEVPRg0KPiANCj4gV2hpY2ggaXMg
QUxSRUFEWSBzYXlpbmcgLUcwPyAoV2h5IGRvZXMgaXQgd2FudCB0byBkbyB0aGF0IGdsb2JhbGx5
PyBTb21lDQo+IHNvcnQgb2YNCj4gYnVnIHdvcmthcm91bmQ/KSBTbyB3aHkgZG8gd2Ugc3BlY2lm
eSBpdCBhZ2FpbiBoZXJlPw0KPiANCj4gTmV4dCB1cCBidWlsZF9tdXNsX2hlYWRlcnMgZG9lcyBD
Uk9TU19DRkxBR1M9Ii1HMCAtTzAgLW12NjUgLWZuby1idWlsdGluDQo+IC1mbm8tcm91bmRpbmct
bWF0aCAtLXRhcmdldD1oZXhhZ29uLXVua25vd24tbGludXgtbXVzbCIgd2hpY2g6DQo+IA0KPiAt
TzANCj4gICBkaXNhYmxlIG1vc3Qgb2YgdGhlIG9wdGltaXplcg0KPiANCj4gLW12NjUNCj4gICAt
bXR1bmUgZm9yIGEgc3BlY2lmaWMgaGV4YWdvbiBnZW5lcmF0aW9uLg0KPiAgIChXaHk/IERvZXMg
cWVtdSBvbmx5IHN1cHBvcnQgdGhhdCBidXQgbm90IG5ld2VyPykNCj4gDQo+IC1mbm8tYnVpbHRp
bg0KPiAgIG11c2wncyAuL2NvbmZpZ3VyZSBhbHJlYWR5IHByb2JlcyBmb3IgdGhpcyBhbmQgd2ls
bCBhZGQgaXQgaWYNCj4gICB0aGUgY29tcGlsZXIgc3VwcG9ydHMgaXQuDQo+IA0KPiAtZm5vLXJv
dW5kaW5nLW1hdGgNCj4gICB0aGUgZG9jcyBNRU5USU9OIHRoaXMsIGJ1dCBkbyBub3QgZXhwbGFp
biBpdC4NCj4gDQo+IEFuZCBhZ2FpbiB3aXRoIHRoZSAtRzAuDQo+IA0KPiBUaGVzZSBmbGFncyBw
cm9iYWJseSBhcmVuJ3QgbmVlZGVkIF9oZXJlXyBiZWNhdXNlIHRoaXMgaXMganVzdCB0aGUgaGVh
ZGVycw0KPiBpbnN0YWxsICh3aGljaCBpcyBiYXNpY2FsbHkgYSBjcCAtYSBpc24ndCBpdD8pLiBU
aGlzIGxvb2tzIGxpa2UgaXQncyBjb3BpZWQNCj4gdmVyYmF0aW0gZnJvbSB0aGUgbXVzbCBsaWJy
YXJ5IGJ1aWxkLiBCdXQgdGhhdCBsaWJyYXJ5IGJ1aWxkIGhhcHBlbnMgaW4gYSBiaXQsDQo+IHNv
IHJlbGV2YW50LWlzaCBJIGd1ZXNzLi4uDQo+IA0KPiAoQWxzbywgd2h5IGRvZXMgYnVpbGRpbmcg
bGlicnQtYnV0LW5vdC1yZWFsbHkgbmVlZCB0aGUgbGliYyBoZWFkZXJzPw0KPiBUaGUgbGliZ2Nj
IGJ1aWxkIEVYUExJQ0lUTFkgZG9lcyBub3QgcmVxdWlyZSB0aGF0LCBiZWNhdXNlIG90aGVyd2lz
ZSB5b3UNCj4gaGF2ZSB0aGlzIGtpbmQgb2YgQlMgY2lyY3VsYXIgZGVwZW5kZW5jeS4gQWxzbywg
aG93IGRvIHlvdSBFVkVSIGJ1aWxkIGENCj4gYmFyZSBtZXRhbCBFTEYgdG9vbGNoYWluIHdpdGgg
dGhhdCBkZXBlbmRlbmN5IGluIHRoZXJlPykNCj4gDQo+IE5leHQgdXAgYnVpbGRfa2VybmVsX2hl
YWRlcnMgaGFzIEtCVUlMRF9DRkxBR1NfS0VSTkVMPSItbWxvbmctY2FsbHMiDQo+IHdoaWNoDQo+
IGFnYWluLCBBKSB3aHkgZG9lcyB0aGUgY29tcGlsZXIgbm90IGRvIGJ5IGRlZmF1bHQsIEIpIGNh
bid0IGJlIG5lZWRlZCBoZXJlDQo+IGJlY2F1c2UgeW91IGRvbid0IGV2ZW4gaGF2ZSB0byBzcGVj
aWZ5IGEgY3Jvc3MgY29tcGlsZXIgd2hlbiBkb2luZw0KPiBoZWFkZXJzX2luc3RhbGwuIChJIGp1
c3QgY29uZmlybWVkIHRoaXMgYnkgZGlmZmluZyBpbnN0YWxscyB3aXRoIGFuIHdpdGhvdXQgYQ0K
PiBjcm9zcyBjb21waWxlciBzcGVjaWZpZWQ6IHRoZXkgd2VyZSBpZGVudGljYWwuIEkgcmVtZW1i
ZXJlZCB0aGlzIGZyb20NCj4gaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2NvbW1p
dC9lMGUyZmE0YjUxNWMgYnV0IGNoZWNrZWQgYWdhaW4gdG8NCj4gYmUNCj4gc3VyZS4pIFByZXN1
bWFibHkgdGhpcyBpcyBtb3JlICJzaGFyZWQgd2l0aCBmdWxsIGtlcm5lbCBidWlsZCIuDQo+IA0K
PiBBbmQgdGhlbiBidWlsZF9tdXNsLCBjb3ZlcmVkIGFib3ZlIHVuZGVyIHRoZSBoZWFkZXJzIGJ1
aWxkOiBsb3RzYSBmbGFncywgbm90DQo+IHN1cmUgd2h5Lg0KPiANCj4gPiAtQnJpYW4NCj4gPg0K
PiANCj4gUm9iDQo+IA0KPiBQLlMuIEl0IHRvb2sgbWUgYSB3aGlsZSB0byBmaWd1cmUgb3V0IHRo
YXQgY2xhbmdfcnQgaXMgTk9UIGxpYnJ0LmEsIEkgdGhpbmsgaXQncw0KPiB0aGVpciBsaWJnY2M/
IEVzcGVjaWFsbHkgY29uZnVzaW5nIHNpbmNlIGxpYnJ0LmEgaGFzIGV4aXN0ZWQgZm9yIGRlY2Fk
ZXMgYW5kDQo+IHdhcyBvbiBzb2xhcmlzIGJlZm9yZSBpdCB3YXMgb24gbGludXgsIGFuZCB0aGUg
T0JWSU9VUyBuYW1lIGlzIGxpYmNjDQo+IHRoZSBzYW1lIHdheSAiY2MiIGlzIHRoZSBnZW5lcmlj
IGNvbXBpbGVyIG5hbWUgaW5zdGVhZCBvZiAiZ2NjIi4NCj4gKEluIGZhY3QgdGhhdCB3YXMgdGhl
IHBvc2l4IGNvbXBpbGVyIG5hbWUgdW50aWwgdGhleSBkZWNpZGVkIHRvIHJlcGxhY2UNCj4gaXQg
d2l0aCAiYzk5IiBhbmQgZXZlcnlib2R5IGlnbm9yZWQgdGhlbSB0aGUgd2F5IHRhci0+cGF4IHdh
cyBpZ25vcmVkLA0KPiBsYXJnZWx5IGJlY2F1c2UgbWFrZSdzICRDQyBkZWZhdWx0cyB0byAiY2Mi
IHNvIGl0IEp1c3QgV29ya3MsIGFuZCB5ZXMNCj4gdGhlIGNyb3NzIGNvbXBpbGVyIHNob3VsZCBo
YXZlIHRoYXQgbmFtZSBidXQgdGhlIHByZXBhY2thZ2VkIGNsYW5nIHRhcmJhbGwNCj4gYWJvdmUg
ZG9lcyBub3QuICpzaHJ1ZyogSSBmaXggdGhhdCB1cCB3aGVuIG1ha2luZyBteSBwcmVmaXggc3lt
bGlua3MuIFRoZQ0KPiBhbmRyb2lkIE5ESyBndXlzIGF0IGxlYXN0IGhhdmUgdGhlIGV4Y3VzZSBv
ZiBzaGlwcGluZyBOSU5FIGRpZmZlcmVudA0KPiB4ODZfNjQtbGludXgtYW5kcm9pZCotY2xhbmcg
d2l0aCBBUEkgdmVyc2lvbiBudW1iZXJzIGFuZCB0aHVzIG5vdCB3YW50aW5nIHRvDQo+IHBpY2sg
YSBkZWZhdWx0IHRvIHNpbmdsZSBvdXQsIHNvIGxlYXZlIG1ha2luZyB0aGUgLWNjIGxpbmsgYXMg
YW4gZXhlcmNpc2UgZm9yDQo+IHRoZSByZWFkZXIuIEkgZ2l2ZSBpbnN0cnVjdGlvbnMgZm9yIGRv
aW5nIHNvIG9uIHRoZSB0b3lib3ggY3Jvc3MgY29tcGlsaW5nIHBhZ2UNCj4gSSBsaW5rZWQgYWJv
dmUuIDopDQo=

