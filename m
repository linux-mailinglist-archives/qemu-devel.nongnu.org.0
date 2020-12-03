Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E43612CDCF0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 19:01:09 +0100 (CET)
Received: from localhost ([::1]:53568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kksui-0004wu-Tw
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 13:01:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kksrl-0003n1-HW
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:58:05 -0500
Received: from mail-dm6nam12on2061.outbound.protection.outlook.com
 ([40.107.243.61]:16480 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kksri-0007Bl-DV
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:58:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2VhKxAoR5RT3pbsmr9nJOZAinmJ4U5KnLpcofwGcepw3Hn3ilW6NcCvVDNKdj3tTkBBKW87r4500oDZvQBPXL61PG+zuMGkFkKztRqWXRksdS76nHZb8OEIr+Bjm0+U5Lnko0v+t1E6V8iX/BZzOveQvh2FQ5Tk9pkTykLLeeTZc3YhYquD8Eg6cPlMczVXURt5Y5/nrGByuIDOX2x9OAUWHMy/ZhGrPmGZ6Z3aSFrbMhAO5vfKDj8U7aMGa9N71AoYy2Ywqqtr5sRD79U8mPavcNlVnTUpp1zz/wP9yxxpUP+MqIQATwFam0YarIDTVta0rgkTL0sKUE4SI/x+PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=po2icEY5DR8r2Clf0clQlffhS1t2vI2hoLwlJDPbDsw=;
 b=g/aA1fGxy/tV4LQDSt0WAmIIwknJNCLKwV0RF6yCQIkiTkiF5oNVa1fDLAKzq8BTNd7SvkHl+kZpboJSq4MDtb47MzQEDIpB1YKqiqJzHXu4eg+Xwu+iEojOe6R/NqMNelg9O9+E/JGhvUEY6RHnIAt+qCNTGtCb59W1jDfg9Dn8B6z/K63Vf1FceBDRL6+tcfVm8HfVmg6IN1U49bTTUzANzOhPomMtDjk7oXZwh1RiyXkVYovJCXe8ponMXu9iy4ZDBoO8XVhpm3lSNxtc+12OE9yg6YnyGFWwsECSo5rBRJBVc7iAFJhVcuK43O7Z3zXOK5XO6ML5XpBNkhkjVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=po2icEY5DR8r2Clf0clQlffhS1t2vI2hoLwlJDPbDsw=;
 b=Oq7S2vIK3AnKN7JnOyG53eg58RaDUgTC6MrBkMS02nvTcVlD9mK+/e+ZtaOtACRO4YkTfCfcfRVXl/fhovaRViWtSDzCqijerQzjg/RbJOGknp9RtteYxoIrqvB0B5tqB8/rr2LJzVsJ/g/mywn2GquTo75/1zA2Q9mDP98jEuI=
Received: from CH2PR02MB6774.namprd02.prod.outlook.com (2603:10b6:610:a8::18)
 by CH2PR02MB6232.namprd02.prod.outlook.com (2603:10b6:610:d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.20; Thu, 3 Dec
 2020 17:57:58 +0000
Received: from CH2PR02MB6774.namprd02.prod.outlook.com
 ([fe80::e9ae:72df:1e0d:6007]) by CH2PR02MB6774.namprd02.prod.outlook.com
 ([fe80::e9ae:72df:1e0d:6007%9]) with mapi id 15.20.3632.018; Thu, 3 Dec 2020
 17:57:58 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH v14 2/4] usb: Add DWC3 model
Thread-Topic: [PATCH v14 2/4] usb: Add DWC3 model
Thread-Index: AQHWx7zFUUV1lFQqVEuYlZVxB/RhYqniGfMAgAOSFDA=
Date: Thu, 3 Dec 2020 17:57:58 +0000
Message-ID: <CH2PR02MB677438760D2D38D5CD28CE67CAF20@CH2PR02MB6774.namprd02.prod.outlook.com>
References: <1606811915-8492-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1606811915-8492-3-git-send-email-sai.pavan.boddu@xilinx.com>
 <CAFEAcA_mLWxwXf6wWbLABOVeEz=bgTQhiV4B718Z4=vBGNi-4A@mail.gmail.com>
In-Reply-To: <CAFEAcA_mLWxwXf6wWbLABOVeEz=bgTQhiV4B718Z4=vBGNi-4A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.130]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c5ee8277-7a45-471d-747b-08d897b4f822
x-ms-traffictypediagnostic: CH2PR02MB6232:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR02MB62325D652C946408CDA19D8CCAF20@CH2PR02MB6232.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qrnEnXS4mJwAU/hbg9iH1/l9M6RUXvHdTq86GjJJ842iDki7i7yGo1Y485fvzs9hTbHs9S3yhTl2Rb8+MUsAp5V830aeUM2pRBNS7evDlowWpA9VuJjRTh7yeCaRm6bI6z5Chm+ytcteDuTM/R/Yz6Z0JXA1oTbSVN3s/PwIXOYmZiN9wOYbXNU5DGBe/DjtFuE8lEUzFg9Tm7k35DXzrKLa+4FCWa47FvqBw19TPQlT7232J5o7SBd9YWAzZEgkmhRcjv+QwD3V9oQMxRipHglpMh0WkBln8NwxLlOyE5/QN/7FQMPLOtPrDtDhuNords3imGgvdJ4W1xjXWFtiiQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR02MB6774.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(39860400002)(136003)(346002)(33656002)(9686003)(54906003)(83380400001)(55016002)(71200400001)(316002)(2906002)(86362001)(8936002)(53546011)(76116006)(6506007)(7416002)(5660300002)(66556008)(66476007)(64756008)(66446008)(66946007)(478600001)(52536014)(6916009)(7696005)(186003)(8676002)(26005)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NGpUUlNKRkdwUWVsZXo2Q05BbEpzeWlMSjQ3M29pQ0hKcnp1QVRIM0pNT3N1?=
 =?utf-8?B?TTlpeWF5Q2hLbEN3OVFVZzNqQkdES0ZnSDQ2WElYTDQxVExhMzJ2UGFSeXFa?=
 =?utf-8?B?QVhZeXdaTG0waHRQK2xsNkpDRXNNRXBUd2RzRWZRV29qMWIveFdQUG9yZmJ6?=
 =?utf-8?B?a0FqTnVBbkx6RmNoZDU3aXltZzA0MjZHenFCUnNucUtzN0V4Qm5oVU9OWlBF?=
 =?utf-8?B?N0xEdHI2OTJzejJqV2dPaXlmSVBMaXgrRjJBQ0xXTHpQR3hBcmNGZHBYcUhw?=
 =?utf-8?B?c3paWnpJNy8xTERXNUs4TjRDYzVQYkhiQXR5VHNWb25QTHBUL0pJakJqM2Z0?=
 =?utf-8?B?N20wRzhLVDMvOHFlZHlhYzNRS016aE5USlByR1YxTklzZWl5RTM3ZzlGYXN6?=
 =?utf-8?B?ejlpV09MUS9yNzZnTXFMVzZSdDhsYndwT3VGU0ZDdkI5cTRaMUwrQnAvRks3?=
 =?utf-8?B?L2ZwNUlxOUFUYVVrMmdYc0lGaExWUC83VnJhdmxCNWd5UHpUUUljY0krcjJl?=
 =?utf-8?B?QmJqSFZ3MXk3Sk5KOEYzenZoamdvaHlWcEdPTEl5V3p3Tm9OWGljVFkrWmxZ?=
 =?utf-8?B?WEtFQjBxVTV2eXgzWVF5ZmpXL0tJRWc4L0tYQTlCYi9DU1NGYXpQbUpvUVhk?=
 =?utf-8?B?ZXRkSFJtU2l5a2pRSkpzS1p4QnVScjU3S20rQ3RuK0htUmEwT0YvRGJVNFVG?=
 =?utf-8?B?V3JFYTI3a1NDUmcwM00yTm9wc0RuUDNHRVBjWExad09zODVNamdYQW0xQzUz?=
 =?utf-8?B?UFRVcFR4MGdzcHpDSE5KVTA5d2RJTXNWdytkdG9nK1BudWMrdjRMcVE3akZq?=
 =?utf-8?B?Wi8rY1A4SWhiVnh1Z05NSDVBUWhGM2RwVnZiTkprTitNbHE3cFJKYUcwTlVC?=
 =?utf-8?B?R3dsOEY2NUtJZjRUb1lKaXVUL1lRemtjbGVWUzNwQW5IQll0MFlUVmt3ZDBJ?=
 =?utf-8?B?b28vS0Q5K29Xdkg5VXhqK2FRa2ZtWmVDaUxxSStScXFtMWp3dno1VG93SlQ2?=
 =?utf-8?B?blB6d08yRVEyS21LNkE4TXl0SDRGbTFaVzE3YVprbnFIbUV2ZGtGZlV3Uyto?=
 =?utf-8?B?dXZsZEhJNS9nMUUwQVhpcU91V2pOa0FBRk9KS1dzQUR2UFhybkNVTGg3SElF?=
 =?utf-8?B?Rk1SbGFTVnhFS2ordFRNZk5zei9GZUJ3TlY1aXpHa2JzR3RxbW1rR2VpN2pF?=
 =?utf-8?B?azZBOXZ2aGlTb1hTVjc0aG8veVdjbkNCelY0cGdsOWNMSnh2aTdoMmpuQVZq?=
 =?utf-8?B?T2FTQVZ5QU92UmdVREF0bys1bUhxUFgreU1KcGNtR3VBdENoRkQ3a2NvSmRY?=
 =?utf-8?Q?5iaJtIQOf/Zms=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR02MB6774.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ee8277-7a45-471d-747b-08d897b4f822
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 17:57:58.2295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CbFKvy01kiqmZ+kNsHFqdzWsPBAXZ7FRXoc6wKpKsOotzOKNpGTszzLAWN4UFgcWaK91mjEJ/0DsDSWjdMW1zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6232
Received-SPF: pass client-ip=40.107.243.61; envelope-from=saipava@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Francisco Eduardo Iglesias <figlesia@xilinx.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Vikram Garhwal <fnuv@xilinx.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Paul Zimmerman <pauldzim@gmail.com>, Edgar Iglesias <edgari@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ying Fang <fangying1@huawei.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgUGV0ZXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIg
TWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBEZWNl
bWJlciAxLCAyMDIwIDQ6NTYgUE0NCj4gVG86IFNhaSBQYXZhbiBCb2RkdSA8c2FpcGF2YUB4aWxp
bnguY29tPg0KPiBDYzogTWFya3VzIEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPjsgTWFy
Yy1BbmRyw6kgTHVyZWF1DQo+IDxtYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20+OyBQYW9sbyBC
b256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPjsNCj4gR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJl
ZGhhdC5jb20+OyBFZGdhciBJZ2xlc2lhcyA8ZWRnYXJpQHhpbGlueC5jb20+Ow0KPiBGcmFuY2lz
Y28gRWR1YXJkbyBJZ2xlc2lhcyA8ZmlnbGVzaWFAeGlsaW54LmNvbT47IEFsaXN0YWlyIEZyYW5j
aXMNCj4gPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT47IEVkdWFyZG8gSGFia29zdCA8ZWhhYmtv
c3RAcmVkaGF0LmNvbT47IFlpbmcNCj4gRmFuZyA8ZmFuZ3lpbmcxQGh1YXdlaS5jb20+OyBQaGls
aXBwZSBNYXRoaWV1LURhdWTDqQ0KPiA8cGhpbG1kQHJlZGhhdC5jb20+OyBWaWtyYW0gR2FyaHdh
bCA8Zm51dkB4aWxpbnguY29tPjsgUGF1bCBaaW1tZXJtYW4NCj4gPHBhdWxkemltQGdtYWlsLmNv
bT47IFNhaSBQYXZhbiBCb2RkdSA8c2FpcGF2YUB4aWxpbnguY29tPjsgUUVNVQ0KPiBEZXZlbG9w
ZXJzIDxxZW11LWRldmVsQG5vbmdudS5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjE0IDIv
NF0gdXNiOiBBZGQgRFdDMyBtb2RlbA0KPiANCj4gT24gVHVlLCAxIERlYyAyMDIwIGF0IDA4OjM0
LCBTYWkgUGF2YW4gQm9kZHUgPHNhaS5wYXZhbi5ib2RkdUB4aWxpbnguY29tPg0KPiB3cm90ZToN
Cj4gPg0KPiA+IEZyb206IFZpa3JhbSBHYXJod2FsIDxmbnUudmlrcmFtQHhpbGlueC5jb20+DQo+
ID4NCj4gPiBUaGlzIHBhdGNoIGFkZHMgc2tlbGV0b24gbW9kZWwgb2YgZHdjMyB1c2IgY29udHJv
bGxlciBhdHRhY2hlZCB0bw0KPiA+IHhoY2ktc3lzYnVzIGRldmljZS4gSXQgZGVmaW5lcyBnbG9i
YWwgcmVnaXN0ZXIgc3BhY2Ugb2YgRFdDMw0KPiA+IGNvbnRyb2xsZXIsIGdsb2JhbCByZWdpc3Rl
cnMgY29udHJvbCB0aGUgQVhJL0FIQiBpbnRlcmZhY2VzDQo+ID4gcHJvcGVydGllcywgZXh0ZXJu
YWwgRklGTyBzdXBwb3J0IGFuZCBldmVudCBjb3VudCBzdXBwb3J0LiBBbGwgb2YNCj4gPiB3aGlj
aCBhcmUgdW5pbXBsZW1lbnRlZCBhdCBwcmVzZW50LHdlIGFyZSBvbmx5IHN1cHBvcnRpbmcgY29y
ZSByZXNldCBhbmQNCj4gcmVhZCBvZiBJRCByZWdpc3Rlci4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFZpa3JhbSBHYXJod2FsIDxmbnUudmlrcmFtQHhpbGlueC5jb20+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogU2FpIFBhdmFuIEJvZGR1IDxzYWkucGF2YW4uYm9kZHVAeGlsaW54LmNvbT4NCj4gPiBS
ZXZpZXdlZC1ieTogRWRnYXIgRS4gSWdsZXNpYXMgPGVkZ2FyLmlnbGVzaWFzQHhpbGlueC5jb20+
DQo+ID4gLS0tDQo+IA0KPiANCj4gPiArdHlwZWRlZiBzdHJ1Y3QgVVNCRFdDMyB7DQo+ID4gKyAg
ICBTeXNCdXNEZXZpY2UgcGFyZW50X29iajsNCj4gPiArICAgIE1lbW9yeVJlZ2lvbiBpb21lbTsN
Cj4gPiArICAgIE1lbW9yeVJlZ2lvbiBmaWZvczsNCj4gPiArICAgIFhIQ0lTeXNidXNTdGF0ZSBz
eXNidXNfeGhjaTsNCj4gPiArDQo+ID4gKyAgICB1aW50MzJfdCByZWdzW1VTQl9EV0MzX1JfTUFY
XTsNCj4gPiArICAgIFJlZ2lzdGVySW5mbyByZWdzX2luZm9bVVNCX0RXQzNfUl9NQVhdOw0KPiAN
Cj4gVGhpcyBkZXZpY2UgaGFzIHN0YXRlIGJ1dCBpcyBtaXNzaW5nIHRoZSBWTVN0YXRlIHN0cnVj
dCBzdXBwb3J0IGZvciBtaWdyYXRpb24uDQo+IE90aGVyd2lzZSBpdCBsb29rcyBPSy4NCltTYWkg
UGF2YW4gQm9kZHVdIE9rLCBJIHdpbGwgZml4IHRoaXMgaW4gVjE1DQoNClRoYW5rcywNClNhaSBQ
YXZhbg0KPiANCj4gdGhhbmtzDQo+IC0tIFBNTQ0K

