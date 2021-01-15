Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4682F87C5
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 22:43:01 +0100 (CET)
Received: from localhost ([::1]:56096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Ws0-0000lZ-6V
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 16:43:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Shahab.Vahedi@synopsys.com>)
 id 1l0Wel-0001fD-PD
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:29:19 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:39794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Shahab.Vahedi@synopsys.com>)
 id 1l0Wec-0003rL-Ss
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:29:17 -0500
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A6756C03C8;
 Fri, 15 Jan 2021 21:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1610746144; bh=VhJ1ecgdHe6TBRAHpVQ52cyjUW/CEHBx+dDoKLrHrt0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=MkRsCSr5hBayipXQaKOyymAHv9ZdBzNdFyQlj/0ttqq1lEAr+/h3Yt3AgyyTvQGvt
 tF0eVcFHZeVeoqcyL2/s5IcqMOuADh+4Bi92idc6YwQOgfocXezeNXfRKfkQ8UgnJ0
 DxIpbOltpbZIKpY7cZ+scXkx8WuCdBaQSavf1SChMtOLb5KF9ZmNNqScBNKJE8Bhp7
 0vJEtsOj/ijgjLle3Fh415jaKl8S3ETp+D0uBpp1X0YoicY6xal9BSBcgZno7LCvh+
 j0DjAj+kuu9oAPyxLVzy4fVQ2zoPkcoRkyDW4RXQ5fsAOFBOcs0m0XFc81q1eP4Jq3
 29eHx5u6XqkDw==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 09382A0083;
 Fri, 15 Jan 2021 21:29:02 +0000 (UTC)
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2053.outbound.protection.outlook.com [104.47.38.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 63B984009D;
 Fri, 15 Jan 2021 21:29:01 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=shahab@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="m0JTNP7I";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0JVzUJj2bjiRoBHeyxX2cG5GQm4BzkPX5A8uQZWWWC1glC/I/GomxcvEnMfAg61rRLOfperPbpZUFgcogBEF2FnS69YUBKoUf4KCX683CdItt0vpg3prcbKPNF53f82m2DDyX7s9lt1hyDr0Mi3RwkYC/lve/A77MK1x1pAoeuyTozlPhd59By0kPgdRPtsN/3nZk9JlvGlX7rAHmrfefC0z58NlNxmcQbv4sTnKxo+flzc0NqQyqSXv9vNXch93Hd4T3z6CD17XdDiWjOon3aM4G+2ZvFH8ZDjmAHuZdynOTyh3DkPxGJPbQVhcQTWCgOvidf51BMPfEdiv7jPYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhJ1ecgdHe6TBRAHpVQ52cyjUW/CEHBx+dDoKLrHrt0=;
 b=aJk9r9uGrHyvwVLJ8d4W9uGIX4u59vQgIt3BY2CkB7IbKVBuFH1fhEnyGLtB3qNblBvTZpPgzxPxoEP9zcnnh9IqRj0qVz8qm3ciwrsx/FZe4kofrwGbLHV7fvMaV1AKE+djtTCo8Wy7ys7TjlyCY6ZNq4I6l3kW51pbm/F1zqUwPBTLugN+CzZqW/cSVcc+ioixdfJuGP+u7TTeeGAfBmPKp1kAc/o+60JGixJ0xVEij6dHk26gWUYesdtsjtU/mOiUfAz2pjKQaQfXttHPKnAILDq2CrqwTjAMEkNLMJ6uGN1uXf/YZpeWE++RxOwxUqnv7/zprpjazAvathIv1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhJ1ecgdHe6TBRAHpVQ52cyjUW/CEHBx+dDoKLrHrt0=;
 b=m0JTNP7I0wdI3vokNMO41XTOSBCo0VYHWSIAyxRFJTnuzwZ9Svt+l8L6IYDYI1gNVZDtL6ZWlDslY2UEWAX1eZgVw9s6UpADgsYbq8lHEFTq1JMp89ce3oMMms1hZX1TyqlqXwadFaTiG0ASJ911tbN3mlISCabIGA3RlLmRquk=
Received: from CY4PR12MB1575.namprd12.prod.outlook.com (2603:10b6:910:f::23)
 by CY4PR12MB1879.namprd12.prod.outlook.com (2603:10b6:903:125::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 15 Jan
 2021 21:28:59 +0000
Received: from CY4PR12MB1575.namprd12.prod.outlook.com
 ([fe80::e91b:5623:997:85ce]) by CY4PR12MB1575.namprd12.prod.outlook.com
 ([fe80::e91b:5623:997:85ce%8]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 21:28:58 +0000
X-SNPS-Relay: synopsys.com
From: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 04/15] arc: TCG and decoder glue code and helpers
Thread-Topic: [PATCH 04/15] arc: TCG and decoder glue code and helpers
Thread-Index: AQHWuEZD0FxPtP+NfEObzHmOxTgva6ni4y6AgEa3PoA=
Date: Fri, 15 Jan 2021 21:28:58 +0000
Message-ID: <c1e9d63a-ee10-5a85-57d2-3c4ad2a86980@synopsys.com>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-5-cupertinomiranda@gmail.com>
 <33ba8432-64c7-db76-459c-5fa6fd7e549a@linaro.org>
In-Reply-To: <33ba8432-64c7-db76-459c-5fa6fd7e549a@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [62.195.180.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64035f50-f3e9-4a7a-5137-08d8b99c9211
x-ms-traffictypediagnostic: CY4PR12MB1879:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB187929C4173C69D5164D3DC3A6A70@CY4PR12MB1879.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qglTaHxhoeQZ4yFWpQ/LED2k5og8HipAQgROFkHld4TWAv+E0Dy7lO7i/tBJxajnG8G9LxT97PdcuX2hyKJWg14N8P5eI1B4ONa/xZe8+m+LbTarIdZYFHJzLB+D3Ux2oKhoUVO/A7MeK9awzXJT2qIDAOR+FmczBTG5uJaLvie5MCAqFhkirnJ3hggmOjWI/Q0vH/0FMVRxqy2FktD7wa5FRP0YAlj4s9l6Uug9RzeYUpSSQt7Ejkms0bXno2pkDe1YU99InfO96P4vJ0i+987tCFfFjzrKt+3+KhAvPCe0O6CRjfZHQjyPpPApy7rrcYR3tIZmcXLA/exmhfzjj8VrBQaXs8+OPNSaOhgAYgHA/UjJUM0ZBRRHd3z+mrJL4qdV9hN+7FX32UYX5qUHUIR/dgOruBNAxXWZfLpavxbEjqXp5+GBjghFBEae5FbqnNZ/iujV0FmpywAt0wqZQOXoVSqFLS7WUGO7nuXzCAIUqaJf8uyQcglUDcFFUeAiaX7cphIoqm/9QFzokqHSJvnZwbi2+Cz0gzMyllTBPkW93Tc4BzPg/V/6RyFfld59hjFXBxwqx58+Az9PZFfUgfXaNISGFa8ks5mOOKpa9VUBC9aj/Cg64ZQDafGpajB4UpLyPU+KCUCwNIkJecDTVN6kfeFw7IBzViUUAKI9PFI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1575.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(346002)(136003)(39860400002)(376002)(8676002)(66446008)(31696002)(6486002)(110136005)(2616005)(8936002)(64756008)(86362001)(107886003)(71200400001)(76116006)(66946007)(31686004)(5660300002)(91956017)(966005)(66556008)(186003)(2906002)(26005)(478600001)(4326008)(6512007)(316002)(36756003)(66476007)(53546011)(6506007)(54906003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Y2I1cnhKTU1TaTVjUXFHMjgzSWF6d0ZYNzNIV0YrdXBnQmI1enlJRGt5Y2FR?=
 =?utf-8?B?V2Y4RUVJaHlwZkRZd04rSERQcFNIR0o0RFFYQzZYK2tsS2U5Q3QrWU1TVnhY?=
 =?utf-8?B?aFNRNlZ1OWVaYWU5b3Q2aVJUbjBFbnAwR1J5amhPamxvWS8zSUdIS01maksy?=
 =?utf-8?B?cTBBUkdrYzZoZFM5bjJVN01GdTUzZkdLUGhYaStIZXhwZUF0NWhjajFadGNC?=
 =?utf-8?B?dnBpT0owYkhSaWo5azl5amtVOFZ1Nm1jUlJnOEppT2gvQ2pjVWZuYzFzZzNY?=
 =?utf-8?B?Q1VuSXphbWcvZ1F6b2U1aHdmeDZWME9tdUhpMDhBeHk0UGVYS0JKSnM5Tm5m?=
 =?utf-8?B?TTFmVVlFSTVaS2FUa29tQkxqV3hMSVJrZmR0dGdwQ2d4dmdrL05VOGFoRkJI?=
 =?utf-8?B?Mk56eEIyU3ZzcjJ1OUc5UEVrSUNicHhGZHBxdFJrRkdYYjd1dkxrK3pFZXpP?=
 =?utf-8?B?NTBLRlhBYyttdHhBeUtMWnQzbVJmTlRUcWQvdWlBZWJsLzZUV3AxWmZTT0JK?=
 =?utf-8?B?S1dFU0RuRWRKdlNRaFdLL1Awa1pPRFl3b0gzRHpDcUJDNlkrcENsakRpNUc2?=
 =?utf-8?B?Qk9OL1ZhTGhoZ05JOHJLV0ttb0lnYlROcVRSb0xTR0cvUnhyeWxYSFMweUZG?=
 =?utf-8?B?dFNpMHNqUmNIWHljWE44Y2JDdXRyYmFuc2o3WUtibktvN04vREczYVNEYTdj?=
 =?utf-8?B?U2RuM3JTNTNYSHpIRENleERBQmpBK25UOTM5K3BtaG84RG5KVUt3UnQvRUNX?=
 =?utf-8?B?UWFPUzd0a25EMlFXUklpSEgybXlHZ211NVRPOUxZdjVMWlFrMUk1WnJXMFZE?=
 =?utf-8?B?dmVmakN4aGs2ZXM0dGJMRDkxU3BuYVNHdk5SbmxHUDh5VkJ5clRuSlZSNGFF?=
 =?utf-8?B?S3MzYzB1blV0b2gxTExrUFhLMEl3KzZuSzBVa1A3amNXbXNYbk1ROXJzdExJ?=
 =?utf-8?B?Z28vZjFUS0ZRbGc4NGV0dzZPeWh2NiswdzN0dklWRm5kRldvUkpQdW4xZXNh?=
 =?utf-8?B?aWNqbFBQTDBsMlRZL0U3TmYyRHowK0tJZFppZXhMbm04VFl6QTRLUWJ1ajU4?=
 =?utf-8?B?VkxJcjUvU1VrVy9HOTlmOG9iaXQ1YXdlb1VybjJaQXdZZ2RsdHREbG5aMFBl?=
 =?utf-8?B?SkJMaXE0S1NyU2RlN3VReW8rSUt1QVBwUnpPYkF3aVJ3ZmQxczRsbE54aGli?=
 =?utf-8?B?WWF2dVF1OVZUL3p3VFdPZjBCLzdhR3N5T0ZYWTJIampGS0FSYXppR1E5d2oz?=
 =?utf-8?B?ZFNnb25ZcXNkSTZ6c0Q3K2Q3cGM3WExTOURhQU9YK2RKSnlQcUJUK2g4RWFl?=
 =?utf-8?Q?lwzOQFZBq6qWY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91B64891FDD7854B94C2E2D5808699A0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1575.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64035f50-f3e9-4a7a-5137-08d8b99c9211
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 21:28:58.8600 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hu5L2JS3jyst3jkGb7JN4npGuNEuYiRio8Wqr9TZonbNlb5tj6IUlmR+BkSjhHBl/LRDcEND/IVGWQJL7jpBXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1879
Received-SPF: pass client-ip=149.117.87.133;
 envelope-from=Shahab.Vahedi@synopsys.com; helo=smtprelay-out1.synopsys.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 15 Jan 2021 16:39:38 -0500
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
Cc: Shahab Vahedi <shahab.vahedi@gmail.com>,
 Cupertino Miranda <Cupertino.Miranda@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Claudiu Zissulescu <claziss@gmail.com>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgUmljaGFyZCwNCg0KT24gMTIvMS8yMCAxMDozNSBQTSwgUmljaGFyZCBIZW5kZXJzb24gd3Jv
dGU6DQo+IE9uIDExLzExLzIwIDEwOjE3IEFNLCBjdXBlcnRpbm9taXJhbmRhQGdtYWlsLmNvbSB3
cm90ZToNCj4+IEZyb206IEN1cGVydGlubyBNaXJhbmRhIDxjbWlyYW5kYUBzeW5vcHN5cy5jb20+
DQo+PiArdm9pZCBoZWxwZXJfZW50ZXIoQ1BVQVJDU3RhdGUgKmVudiwgdWludDMyX3QgdTYpDQo+
PiArew0KPj4gKyAgICAvKiBub3RoaW5nIHRvIGRvPyB0aGVuIGJ5ZS1ieWUhICovDQo+PiArICAg
IGlmICghdTYpIHsNCj4+ICsgICAgICAgIHJldHVybjsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAg
ICB1aW50OF90IHJlZ3MgICAgICAgPSB1NiAmIDB4MGY7IC8qIHVbMzowXSBkZXRlcm1pbmVzIHJl
Z2lzdGVycyB0byBzYXZlICovDQo+PiArICAgIGJvb2wgICAgc2F2ZV9mcCAgICA9IHU2ICYgMHgx
MDsgLyogdVs0XSBpbmRpY2F0ZXMgaWYgZnAgbXVzdCBiZSBzYXZlZCAgKi8NCj4+ICsgICAgYm9v
bCAgICBzYXZlX2JsaW5rID0gdTYgJiAweDIwOyAvKiB1WzVdIGluZGljYXRlcyBzYXZpbmcgb2Yg
YmxpbmsgICAgICAqLw0KPj4gKyAgICB1aW50OF90IHN0YWNrX3NpemUgPSA0ICogKHJlZ3MgKyBz
YXZlX2ZwICsgc2F2ZV9ibGluayk7DQo+PiArDQo+PiArICAgIC8qIG51bWJlciBvZiByZWdzIHRv
IGJlIHNhdmVkIG11c3QgYmUgc2FuZSAqLw0KPj4gKyAgICBjaGVja19lbnRlcl9sZWF2ZV9ucl9y
ZWdzKGVudiwgcmVncywgR0VUUEMoKSk7DQo+IA0KPiBCb3RoIG9mIHRoZXNlIGNoZWNrcyBjb3Vs
ZCBiZSB0cmFuc2xhdGUgdGltZS4NCj4gDQo+PiArICAgIC8qIHRoaXMgY2Fubm90IGJlIGV4ZWN1
dGVkIGluIGEgZGVsYXkvZXhlY3V0aW9uIHNsb3QgKi8NCj4+ICsgICAgY2hlY2tfZGVsYXlfb3Jf
ZXhlY3V0aW9uX3Nsb3QoZW52LCBHRVRQQygpKTsNCj4gDQo+IEFzIGNvdWxkIHRoaXMuDQo+IA0K
Pj4gKyAgICAvKiBzdGFjayBtdXN0IGJlIGEgbXVsdGlwbGUgb2YgNCAoMzIgYml0IGFsaWduZWQp
ICovDQo+PiArICAgIGNoZWNrX2FkZHJfaXNfd29yZF9hbGlnbmVkKGVudiwgQ1BVX1NQKGVudikg
LSBzdGFja19zaXplLCBHRVRQQygpKTsNCj4+ICsNCj4+ICsgICAgdWludDMyX3QgdG1wX3NwID0g
Q1BVX1NQKGVudik7DQo+PiArDQo+PiArICAgIGlmIChzYXZlX2ZwKSB7DQo+PiArICAgICAgICB0
bXBfc3AgLT0gNDsNCj4+ICsgICAgICAgIGNwdV9zdGxfZGF0YShlbnYsIHRtcF9zcCwgQ1BVX0ZQ
KGVudikpOw0KPj4gKyAgICB9DQo+IA0KPiBBbmQgd2hhdCBpZiB0aGVzZSBzdG9yZXMgcmFpc2Ug
YW4gZXhjZXB0aW9uPyAgSSBkb3VidCB5b3UncmUgZ29pbmcgdG8gZ2V0IGFuDQo+IGV4Y2VwdGlv
biBhdCB0aGUgY29ycmVjdCBwYy4NCg0KSSd2ZSBhZGRlZCBhIGZldyBiYWQtd2VhdGhlciB0ZXN0
IGNhc2VzIFsxXSBhbmQgdGhleSB3b3JrIGFzIGV4cGVjdGVkLiBJbmRlZWQsDQpub25lIG9mIHRo
b3NlIHRlc3RzIHRyaWdnZXIgYW4gZXhjZXB0aW9uIGR1cmluZyB0aGUgImNwdV9zdGxfZGF0YSgp
Ii4gQ291bGQgeW91DQplbGFib3JhdGUgd2h5IHlvdSB0aGluayB0aGUgUEMgbWlnaHQgYmUgaW5j
b3JyZWN0PyBUaGVuIEkgY2FuIGFkZCB0aGUgY29ycmVzcG9uZGluZw0KdGVzdHMgYW5kIGZpeCB0
aGUgYmVoYXZpb3IuDQoNClsxXQ0KaHR0cHM6Ly9naXRodWIuY29tL2Zvc3MtZm9yLXN5bm9wc3lz
LWR3Yy1hcmMtcHJvY2Vzc29ycy9xZW11L2Jsb2IvbWFzdGVyL3Rlc3RzL3RjZy9hcmMvY2hlY2tf
ZW50ZXJfbGVhdmUuUyNMMjI3DQoNCj4gNS0xMCB0Y2cgb3Bjb2RlcyBpcyB0aGUgcnVsZSBvZiB0
aHVtYi4gIEEgY29uZGl0aW9uYWwgZXhjZXB0aW9uIChyZXF1aXJpbmcgYQ0KPiBicmFuY2gpIGlz
IGEgZ29vZCByZWFzb24gdG8gcHV0IHRoZSB3aG9sZSB0aGluZyBvdXQgb2YgbGluZS4NCj4gDQo+
IEluIHRoZSBjYXNlIG9mIGVudGVyIG9yIGxlYXZlLCB0aGlzIGlzIG9uZSBsb2FkL3N0b3JlIHBs
dXMgb25lIGFkZGl0aW9uLA0KPiBmb2xsb3dlZCBieSBhIGJyYW5jaC4gIEFsbCBvZiB3aGljaCBp
cyBlbmNvZGVkIGFzIGZpZWxkcyBpbiB0aGUgaW5zdHJ1Y3Rpb24uDQo+IEV4dHJlbWVseSBzaW1w
bGUuDQoNCllvdSdyZSBzdWdnZXN0aW5nIHRoYXQgImVudGVyL2xlYXZlIiBzaG91bGQgdXNlIFRD
RyBvcGNvZGVzIGluc3RlYWQgb2YgaGVscGVycz8gSWYgeWVzLA0KZG8geW91IHJlYWxseSB0aGlu
ayBpdCBpcyBwb3NzaWJsZSB0byBpbXBsZW1lbnQgZWFjaCB3aXRoIH4xMCBvcGNvZGVzPw0KDQot
LSANClNoYWhhYg0K

