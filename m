Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174394066BC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 07:29:26 +0200 (CEST)
Received: from localhost ([::1]:52088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOZ6L-0001jh-6t
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 01:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mOZ4p-00012B-39
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 01:27:51 -0400
Received: from esa2.fujitsucc.c3s2.iphmx.com ([68.232.152.246]:64577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mOZ4l-0002iz-OZ
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 01:27:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1631251668; x=1662787668;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=zaLo6hX4rZFScIYmqsVJNQzTeJLggeifXFFCZ+4NYbY=;
 b=BWXM69mThOZZKwVSbnWOHdjtQ2/1Qt0hSy8oW6AF75dVZPZqNQ96TW8y
 HHo3D+rspq37tLljDN7hIZaWaw0lQ79OXVbseBI08gOY8SIip3fCmygVH
 U0mxFJkbG/OaLgzI9gwSWJMEaSUNFlJjX49T+UBoaQCFNsri7q24PojSl
 ndOtqQDsNeL5D12DesmKYy34Gz6kddH+cNBUsZKtECnjtsVCjfWrTttJh
 HoXAUdas+gEIAmZhPMghCH++LjhL6qdMWmmyOvCR8QoUSsXahyUD8sALi
 TJqpluPCRmedG+y2snKmCvYrHNVW/qzA3zVD094aRpqkn+i5H/APJfHmz g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="47108848"
X-IronPort-AV: E=Sophos;i="5.85,282,1624287600"; d="scan'208";a="47108848"
Received: from mail-os2jpn01lp2057.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.57])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 14:27:44 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oW/ofd52/ec/lVV627Hi4oHb8G0hcYny14VhNOwvrdON7osuz1fOOhKlYTf2SImv7N0kbWpsSJNAXcC5cAD/vAtNUzJGkvV/v1gcODHYoRNJAJ5b84fGF1vafhKo9lplrr4c3RN4I+PGDNrLog7QT22NkzDCY0FGi3wUoUR/yca5a/Fx3Lcz+rY8l5Fo6A0SIMkpZBneEgF6pw2klFugjkPLagX3toasjQ2Fau1IbrTCDLUu5ybKxRQggy3PxRCgSa7VDxMJA3pbisluhf4MTqUFwEgiClzH3iVLYcj7cKCzdpxFixYO/MtM5KqJGP+YmhbgYeyZR3h1BI3XPr6hPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=zaLo6hX4rZFScIYmqsVJNQzTeJLggeifXFFCZ+4NYbY=;
 b=mwbN4JTQwPtAdV4YNkXEGT6Eu6Ugce0I5jf8L0IbKiYWS5DOdoPQ7Xm3Eez3vJ5PvsgIsbygddvwHSgJUwO3I4Ol7k+zFwVaBORsGUMmTq7JW2OxSKJdGSbQ2Bfi4FGBPrIg2Cr6pMtBMRVO5UzTvPQZcs+KUNRLpwbnbG+Fm/Hxr3h0XB+Femu973uHYKddGGtgsDhP+pt3jV3UbOQCxKtL3kOAf35D4nsZiOCuISJGpESV/afVeXS+Tj4cbuuSUtwKUiMwn/pY1VH8SZnqGD5oh8s1i5ps8uB8GAQNg+xCwoVMU7T/WQnUnC/4DqqofeJjNYhIeLzMcljhUnB6xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaLo6hX4rZFScIYmqsVJNQzTeJLggeifXFFCZ+4NYbY=;
 b=HHgzvoutSGlsx/RMUmh4e8+X63TaBSW/Iuw6CAfhzhDs9QzV3v1OCKxUlc90hdAg8z11JKN+MOIJBYko7DGT505JItljNsgMZG6bRD9fajaFXsocTDr30ndkmYnyLB6qy8aMiDrL6MLFCssqDHjF7moaQ0f1/2Z5Lm6v90KBbV8=
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com (2603:1096:604:14f::5)
 by OS3PR01MB7359.jpnprd01.prod.outlook.com (2603:1096:604:149::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Fri, 10 Sep
 2021 05:27:41 +0000
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::7407:c85b:2ea4:2ba9]) by OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::7407:c85b:2ea4:2ba9%5]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 05:27:41 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: "quintela@redhat.com" <quintela@redhat.com>, "lizhijian@fujitsu.com"
 <lizhijian@fujitsu.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/7] Migration.next patches
Thread-Topic: [PULL 0/7] Migration.next patches
Thread-Index: AQHXpWZwLalhDfi+t0aNkcxSWvLZMaubtioAgAASgQCAABdGboAA3FgAgAACAoA=
Date: Fri, 10 Sep 2021 05:27:41 +0000
Message-ID: <dc771570-e47d-9926-6a10-11ad3bfa69ae@fujitsu.com>
References: <20210909103346.1990-1-quintela@redhat.com>
 <CAFEAcA-LSVj3B-xgPFMTz49D=KoRx1W7_HKjFf1bHEYdBGVgPA@mail.gmail.com>
 <f02237fb-852d-8449-e90d-97a59bcf51e8@cn.fujitsu.com>
 <87fsudn30g.fsf@secure.mitica>
 <14fbe8b5-0212-c0fd-e0fd-4198ab5d217b@fujitsu.com>
In-Reply-To: <14fbe8b5-0212-c0fd-e0fd-4198ab5d217b@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7695446a-69cd-4700-7356-08d9741bb601
x-ms-traffictypediagnostic: OS3PR01MB7359:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB735964C1272E39AB945CC718A5D69@OS3PR01MB7359.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:356;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fdqrQt5M3dLKzL7wvMiqZFbBUmKMX18fywAsnuoDruOJfZRv5XI4q3ui2a4vGy9KuMMoSz6czu+w/1cHeJrHz4RQYiJQ+Eg7JlR7oP8jW4RJRg9F+KvljqGPcORlRTFEQSz9xT1194lqS6jBDHH1QxNTrp54UIR5ws3uUUn7dTl9Ak891Nibwsf+xGUjSRk5nSAGaI+q/5NOswWnNwcDl79n1lf4o4NXYEvjTkM0pHwjQSNhHQAF0EHdFpnj6VD8LaHEsGoSrUcakcO/k9Q6UdguI5bcjIXsoxzYynEmEQKncORztK6HdUtrM3i75b+htF3qzarMuEJp4VnvW1/UXXhcH4kNYluuFsnF5nMzv+su3oqyE0W9KOqZSGHEcsTOFCYjXnDXEYgc2OVo/vlJYxpkfq6wNtLkqDGKxPc6R8ROypiYEcnnPWRd9Gs39FXg5BwB1NLyjwEKyriTKOOLNxtCIgTZe8Clk9sTzGWKWsiwY8dIc9ibRJ3n1OzgKsXQ3QPTSCY6fPkwEEmfqAiaREzghQ8Re4AgOOiE1TcCYHU5w54Q9FGgTzEiZg09dREjUxce9ujTnRtuDLSrHuS1go1Ao6/d+HsFUteW9hjzsr/gAVjmQyN7RF5XTbNLb+CP0snzh4zSzbZxaOlxCW2nL/8BMdP0jwRH1dwC46x2iRihu0cc7ErCpKhqkQ/goCvqbsX3gFzsKEeDZulgBbR8gp6EegbFOOY/lnB2ufemG9O0dxEDMaso9hI3JXorjv3f6iS4hRekqqzdkL1gkWiXIw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB7650.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(83380400001)(6512007)(122000001)(8676002)(8936002)(66446008)(186003)(64756008)(38100700002)(91956017)(66556008)(66476007)(6486002)(26005)(31686004)(2906002)(76116006)(86362001)(6506007)(85182001)(53546011)(31696002)(71200400001)(4326008)(316002)(5660300002)(38070700005)(966005)(54906003)(478600001)(66946007)(110136005)(36756003)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEU3UU5xRlVmc1BtZXc1WkZ4eStwU3h3QTNGTGUzbzRqRXI5QjVvS0I5TC9I?=
 =?utf-8?B?Mm9xZW9DSTB0RmVZNGFWUEtzWk54SER1dis3UzQwYUtnVW5VUkFCWDVDa2lq?=
 =?utf-8?B?Wmh5NXBLUC9iQXd0ejlPUElBdGFXNWZBbGxLekhCQW44TENQSUVZR2ZJYWgz?=
 =?utf-8?B?Vm5qSnpyVWFxdWY1SitjcFdONEFIQ3JiRHZ1d0hVSTN2M0xZeW5WQUZ3TEl2?=
 =?utf-8?B?azh4UDBqRVN0T2lHNUxsSFdIWG92aWZRVklZM29CczRGeGNlMWtEdHFxTjRu?=
 =?utf-8?B?Y0VIckNQT0ZQRCtVcGE3Zm03UlJXYU9sem5GbW5ENVM5U01USERkV1E4Q3hZ?=
 =?utf-8?B?dzJsaHZUQ2FyNmliQVh1R0pZRTRqYUdvYU16Zng0SDNuNU5ESUFMSVQwZTgr?=
 =?utf-8?B?ZFRweGgvekE0R1Rua1BoM255NVZpWkh5RkpwYzYveXpZajRucC9hWUFGM3dC?=
 =?utf-8?B?Tmw2aUJJbE52bHNGSVYyb0lrK2lSaTFkQWxDdi9CRllDby9UbXVCVHV0Umkz?=
 =?utf-8?B?YlVLNHozbmtOSG94K1EzdjhlRXhvRXlMRnN1Y255WExIMElVTUd3UjhYRVdL?=
 =?utf-8?B?emx2a0dRakhoa0xvOHR4MnJWdndFeDVHeTB5dTc4VVNIcU1jM0Y0YU8rTDND?=
 =?utf-8?B?bkp4UWpvSTlFRmd6MEdkd29tNldySElzZDhFSFJTdXJFR1NJMXY2SWVkRkd2?=
 =?utf-8?B?OWlCWFdzaWJMVHY2V1NJbzFPNERLR2ZoSEhKYnhEU0I2Y1lFcEJYM093TUtp?=
 =?utf-8?B?cldESmNrTUlKNVc5cDQrYkxqRlpoNHhJYUhQM0gxaGRHSy8yZ0dMdWp4dHR5?=
 =?utf-8?B?WEhkd3hWWkFRNnFPRkNTQURwNXJ6UVdlRytzQVcrWjNJbS9yS2pvd3NDTnJY?=
 =?utf-8?B?SXU3NUhWQWcvNDlRTmtjclBiQXFFTlhGQVFRV0M3NnRwQmh6Zmo4WVRES2VT?=
 =?utf-8?B?U2laeDBDUHVIb0RET1lFWWFqNVVodDBsNWVpeXdBa1pqeGtQdFZLTkROTGND?=
 =?utf-8?B?TllWNFdUR1NUVm1SSytXQ05iUUFMUTJYMkZjQTJGdkx2SWRrWXB0YXUxdTRn?=
 =?utf-8?B?Vjk4UHJXdXh6RzNoanpoNm5wMU12eWozcER5VU44ZmVYNVQ3U3BFbU5OYUZ5?=
 =?utf-8?B?RWQvV25jNGpRbEIwTklHN1pJbk5VTzErTExRLzNQY29PZ3RFN1ZVRWdhN0Vh?=
 =?utf-8?B?UXRkK0lSUDFuZFU5YTh1SENuT3pSOENkdGlmckRpbXgrbXNPRmVkTVJjaUFz?=
 =?utf-8?B?NEdmRVNCQ1d1WmpEeEpYeVFHMFVjWXFxQ3BUUUFoUXJ5YXQ4TksreHVHaVFE?=
 =?utf-8?B?ZjRIMDBLYWtnOG5JYmNoNFlha2h1Si9RV2hGeUNhT1NkVm9TUjM1b1ZiV2V4?=
 =?utf-8?B?NHVlNnNxN0hGODRJQUVXTjFLaStuTWRMTHhPWHVMOSttMFFoaUsxUS9scmVz?=
 =?utf-8?B?dkZRaU9PbDIyam42bitzcTMrYnpiVXRKT0h0TEdnVHhKVlduQnJFR1c0YVpP?=
 =?utf-8?B?ejBUUnZ5UzZ6Mm1qZEExUEFMa2dPci9mSVJLTm0vT21KUjVqWkFlRURuY0V0?=
 =?utf-8?B?UHIzeUx4YzNNWWZxdUc5alA1T2ZBcmRCaWxORFdVamxRUEZZVTFzUDhPN3p0?=
 =?utf-8?B?ZFYwUDlVUlJYOGp3R2NUVm04WVlab3Fha3kwTUlMK25VcWhyRTNLWjViR3hN?=
 =?utf-8?B?K2F6dUk3dzVYTElHakg5NzFUeTFNOUJHYzBwamtxRmpWTmxJdVBERFl3MFJi?=
 =?utf-8?B?bGcrbXlIVlZPMXNLVnpOSUZ2aEUrbUljWHl3VVBONUVqNEh2WHBVKzJpSEMx?=
 =?utf-8?B?cHhHVnczdzd3WWFyVXJaQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AE4BF4CE04B0B41B1AE72202619FECC@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB7650.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7695446a-69cd-4700-7356-08d9741bb601
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 05:27:41.5436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bbOIe12zafAKTDTBcVz1cplgWXjyPRIQvtVXefubAxAPL8URJAnEbBdmfWcm6AyuyuGYCOb+If7ajywugZzeeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7359
Received-SPF: pass client-ip=68.232.152.246;
 envelope-from=lizhijian@fujitsu.com; helo=esa2.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.975,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCk9uIDEwLzA5LzIwMjEgMTM6MjAsIExpIFpoaWppYW4gd3JvdGU6DQo+DQo+DQo+IE9uIDEw
LzA5LzIwMjEgMDA6MTAsIEp1YW4gUXVpbnRlbGEgd3JvdGU6DQo+PiAiTGksIFpoaWppYW4iIDxs
aXpoaWppYW5AY24uZnVqaXRzdS5jb20+IHdyb3RlOg0KPj4+IG9uIDIwMjEvOS85IDIxOjQyLCBQ
ZXRlciBNYXlkZWxsIHdyb3RlOg0KPj4+PiBPbiBUaHUsIDkgU2VwdCAyMDIxIGF0IDExOjM2LCBK
dWFuIFF1aW50ZWxhIDxxdWludGVsYUByZWRoYXQuY29tPiB3cm90ZToNCj4+Pj4gRmFpbHMgdG8g
YnVpbGQsIEZyZWVCU0Q6DQo+Pj4+DQo+Pj4+IC4uL3NyYy9taWdyYXRpb24vcmRtYS5jOjExNDY6
MjM6IGVycm9yOiB1c2Ugb2YgdW5kZWNsYXJlZCBpZGVudGlmaWVyDQo+Pj4+ICdJQlZfQURWSVNF
X01SX0FEVklDRV9QUkVGRVRDSF9XUklURScNCj4+Pj4gwqDCoMKgwqDCoCBpbnQgYWR2aWNlID0g
d3IgPyBJQlZfQURWSVNFX01SX0FEVklDRV9QUkVGRVRDSF9XUklURSA6DQo+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXg0KPj4+PiAuLi9zcmMvbWln
cmF0aW9uL3JkbWEuYzoxMTQ3OjE4OiBlcnJvcjogdXNlIG9mIHVuZGVjbGFyZWQgaWRlbnRpZmll
cg0KPj4+PiAnSUJWX0FEVklTRV9NUl9BRFZJQ0VfUFJFRkVUQ0gnDQo+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBJQlZfQURWSVNFX01SX0FEVklDRV9QUkVGRVRDSDsN
Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF4NCj4+Pj4gLi4vc3Jj
L21pZ3JhdGlvbi9yZG1hLmM6MTE1MDoxMTogd2FybmluZzogaW1wbGljaXQgZGVjbGFyYXRpb24g
b2YNCj4+Pj4gZnVuY3Rpb24gJ2lidl9hZHZpc2VfbXInIGlzIGludmFsaWQgaW4gQzk5DQo+Pj4+
IFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0KPj4+PiDCoMKgwqDCoMKgIHJldCA9
IGlidl9hZHZpc2VfbXIocGQsIGFkdmljZSwNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBe
DQo+Pj4+IC4uL3NyYy9taWdyYXRpb24vcmRtYS5jOjExNTE6MjU6IGVycm9yOiB1c2Ugb2YgdW5k
ZWNsYXJlZCBpZGVudGlmaWVyDQo+Pj4+ICdJQlZfQURWSVNFX01SX0ZMQUdfRkxVU0gnDQo+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIElCVl9B
RFZJU0VfTVJfRkxBR19GTFVTSCwgJnNnX2xpc3QsIDEpOw0KPj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBeDQo+Pj4+DQo+Pj4gaXQncyBpbnRy
b2R1Y2VkIGJ5IFtQVUxMIDQvN10gbWlncmF0aW9uL3JkbWE6IGFkdmlzZSBwcmVmZXRjaCB3cml0
ZSBmb3IgT0RQIHJlZ2lvbg0KPj4+IHdoZXJlIGl0IGNhbGxzIGEgaWJ2X2FkdmlzZV9tcigpLiBp
IGhhdmUgY2hlY2tlZCB0aGUgbGF0ZXN0IEZyZWVCU0QsIGl0IGRpZG4ndCBzaGlwIHdpdGggdGhp
cyBBUEkNCj4+PiBNYXkgaSBrbm93IGlmIGp1c3QgRnJlc3NCU0QgcmVwb3J0cyB0aGlzIGZhaWx1
cmU/IGlmIHNvLCBpIGp1c3QgbmVlZCBmaWx0ZXJpbmcgb3V0IEZyZWVCU0Qgb25seQ0KPj4gU2Vj
b25kIHRyeS7CoCBJIGNhbid0IHNlZSBhbiBleGFtcGxlIHdoZXJlIHRoZXkgc2VhcmNoIGZvcjoN
Cj4+IGEgc3ltYm9sIG9uIHRoZSBoZWFkZXIgZmlsZQ0KPj4gwqDCoCBhbmQNCj4+IGEgZnVuY3Rp
b24gaW4gYSBsaWJyYXJ5DQo+Pg0KPj4gc28gSSBhc3N1bWUgdGhhdCBpZiB5b3UgaGF2ZSB0aGUg
c3ltYm9scywgeW91IGhhdmUgdGhlIGZ1bmN0aW9uLg0KPj4NCj4+IEhvdyBkbyB5b3Ugc2VlIGl0
Pw0KPj4NCj4+IFRyeWluZyB0byBjb21waWxlIGl0IG9uIHZtLWJ1aWxkLWZyZWVic2QsIGJ1dCBu
b3QgYmVpbmcgdmVyeSBzdWNlc3NmdWxsDQo+PiBzbyBmYXIuDQoNCkJUVzogRG9lcyBRRU1VIHBy
b3ZpZGUgYW55IG1lYW4gdG8gc2V0IGh0dHAocylfcHJveHkgdG8gYnVpbGRpbmcgdm0gPyBDdXJy
ZW50bHksIGkgaGF2ZSB0bw0KaGFjayB0aGUgY29kZSBsaWtlOg0KDQotICAgICAgICBzZWxmLnNz
aF9yb290X2NoZWNrKCJwa2cgaW5zdGFsbCAteSAlc1xuIiAlICIgIi5qb2luKHNlbGYucGtncykp
DQorICAgICAgICBzZWxmLnNzaF9yb290X2NoZWNrKCJzZXRlbnYgSFRUUF9QUk9YWSBodHRwOi8v
bXlwcm94eTsgc2V0ZW52IEhUVFBTX1BST1hZIGh0dHA6Ly9teXByb3h5OyBwa2cgaW5zdGFsbCAt
eSAlc1xuIiAlICIgIi5qb2luKHNlbGYucGtncykpDQoNCg0KVGhhbmtzDQpaaGlqaWFuDQoNCg0K
Pg0KPiBZb3VyIHBhdGNoIGRvZXMgd29yayEgQnV0IGkgc3RpbGwgZm9sbG93ZWQgUE1NJ3Mgc3Vn
Z2VzdGlvbiwgY29udmVydGVkIGl0IHRvIGhhc19mdW5jdGlvbg0KPiBhcyBhbm90aGVyIG9wdGlv
bi4NCj4gSSBoYXZlIHZlcmlmaWVkIGl0IG9uIEZyZWVCU0QgYW5kIExpbnV4Lg0KPg0KPiBGcm9t
IDY3ZjM4NmFjYzIwOTJlY2Y2ZTcxYjg5NTFiNmFmNWQ1YjgzNjZmODAgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxDQo+IEZyb206IEp1YW4gUXVpbnRlbGEgPHF1aW50ZWxhQHJlZGhhdC5jb20+DQo+
IERhdGU6IFRodSwgOSBTZXAgMjAyMSAxNzowNzoxNyArMDIwMA0KPiBTdWJqZWN0OiBbUEFUQ0hd
IHJkbWE6IHRlc3QgZm9yIGlidl9hZHZpc2VfbXIgQVBJDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEp1
YW4gUXVpbnRlbGEgPHF1aW50ZWxhQHJlZGhhdC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IExpIFpo
aWppYW4gPGxpemhpamlhbkBjbi5mdWppdHN1LmNvbT4NCj4gLS0tDQo+IMKgbWVzb24uYnVpbGTC
oMKgwqDCoMKgIHwgNiArKysrKysNCj4gwqBtaWdyYXRpb24vcmRtYS5jIHwgMiArKw0KPiDCoDIg
ZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9tZXNvbi5i
dWlsZCBiL21lc29uLmJ1aWxkDQo+IGluZGV4IDZlNGQyZDgwMzQzLi45NzQwNmQxYjc5YiAxMDA2
NDQNCj4gLS0tIGEvbWVzb24uYnVpbGQNCj4gKysrIGIvbWVzb24uYnVpbGQNCj4gQEAgLTEzMjgs
NiArMTMyOCwxMiBAQCBjb25maWdfaG9zdF9kYXRhLnNldCgnSEFWRV9DT1BZX0ZJTEVfUkFOR0Un
LCBjYy5oYXNfZnVuY3Rpb24oJ2NvcHlfZmlsZV9yYW5nZScpKQ0KPiDCoGNvbmZpZ19ob3N0X2Rh
dGEuc2V0KCdIQVZFX09QRU5QVFknLCBjYy5oYXNfZnVuY3Rpb24oJ29wZW5wdHknLCBkZXBlbmRl
bmNpZXM6IHV0aWwpKQ0KPiDCoGNvbmZpZ19ob3N0X2RhdGEuc2V0KCdIQVZFX1NUUkNIUk5VTCcs
IGNjLmhhc19mdW5jdGlvbignc3RyY2hybnVsJykpDQo+IMKgY29uZmlnX2hvc3RfZGF0YS5zZXQo
J0hBVkVfU1lTVEVNX0ZVTkNUSU9OJywgY2MuaGFzX2Z1bmN0aW9uKCdzeXN0ZW0nLCBwcmVmaXg6
ICcjaW5jbHVkZSA8c3RkbGliLmg+JykpDQo+ICtpZiByZG1hLmZvdW5kKCkNCj4gK8KgIGNvbmZp
Z19ob3N0X2RhdGEuc2V0KCdIQVZFX0lCVl9BRFZJU0VfTVInLA0KPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2MuaGFzX2Z1bmN0aW9uKCdpYnZfYWR2aXNl
X21yJywNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXJnczogY29uZmlnX2hvc3RbJ1JETUFfTElC
UyddLnNwbGl0KCksDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByZWZpeDogJyNpbmNsdWRlIDxp
bmZpbmliYW5kL3ZlcmJzLmg+JykpDQo+ICtlbmRpZg0KPg0KPiDCoCMgaGFzX2hlYWRlcl9zeW1i
b2wNCj4gwqBjb25maWdfaG9zdF9kYXRhLnNldCgnQ09ORklHX0JZVEVTV0FQX0gnLA0KPiBkaWZm
IC0tZ2l0IGEvbWlncmF0aW9uL3JkbWEuYyBiL21pZ3JhdGlvbi9yZG1hLmMNCj4gaW5kZXggNmMy
Y2MzZjYxN2MuLjJhM2M3ODg5YjlmIDEwMDY0NA0KPiAtLS0gYS9taWdyYXRpb24vcmRtYS5jDQo+
ICsrKyBiL21pZ3JhdGlvbi9yZG1hLmMNCj4gQEAgLTExNDIsNiArMTE0Miw3IEBAIHN0YXRpYyB2
b2lkIHFlbXVfcmRtYV9hZHZpc2VfcHJlZmV0Y2hfbXIoc3RydWN0IGlidl9wZCAqcGQsIHVpbnQ2
NF90IGFkZHIsDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDMyX3QgbGVuLMKgIHVp
bnQzMl90IGxrZXksDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3QgY2hhciAqbmFt
ZSwgYm9vbCB3cikNCj4gwqB7DQo+ICsjaWZkZWYgSEFWRV9JQlZfQURWSVNFX01SDQo+IMKgwqDC
oMKgIGludCByZXQ7DQo+IMKgwqDCoMKgIGludCBhZHZpY2UgPSB3ciA/IElCVl9BRFZJU0VfTVJf
QURWSUNFX1BSRUZFVENIX1dSSVRFIDoNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBJQlZfQURWSVNFX01SX0FEVklDRV9QUkVGRVRDSDsNCj4gQEAgLTExNTUsNiArMTE1Niw3
IEBAIHN0YXRpYyB2b2lkIHFlbXVfcmRtYV9hZHZpc2VfcHJlZmV0Y2hfbXIoc3RydWN0IGlidl9w
ZCAqcGQsIHVpbnQ2NF90IGFkZHIsDQo+IMKgwqDCoMKgIH0gZWxzZSB7DQo+IMKgwqDCoMKgwqDC
oMKgwqAgdHJhY2VfcWVtdV9yZG1hX2FkdmlzZV9tcihuYW1lLCBsZW4sIGFkZHIsICJzdWNjZXNz
ZWQiKTsNCj4gwqDCoMKgwqAgfQ0KPiArI2VuZGlmDQo+IMKgfQ0KPg0KPiDCoHN0YXRpYyBpbnQg
cWVtdV9yZG1hX3JlZ193aG9sZV9yYW1fYmxvY2tzKFJETUFDb250ZXh0ICpyZG1hKQ0K

