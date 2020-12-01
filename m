Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0733A2C99D8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 09:48:41 +0100 (CET)
Received: from localhost ([::1]:35438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk1Ky-0000NM-32
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 03:48:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kk1Jx-0008NJ-E8
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:47:37 -0500
Received: from mail-bn7nam10on2051.outbound.protection.outlook.com
 ([40.107.92.51]:52064 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kk1Js-0007aL-Rg
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:47:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odLG5ngAtn3pRwyBfiD7RylNoKTcacA81w1AMsRY/9ixi65PVMn20hXlhJLknC3DZfRurLOcoTxub+hsjF6PG9t/1N/byWL4qn5Gkf1VMRBJY1tkJYNhUjgtc2vNsyCPaO5GQLI1xoXJ8rwBZQrXk/gVckL8uEPyU5h9SlKBOCHS6P4vdJCTX4FDpdwuGsllDpPCSsf9X3WugF6flzjJo88ISl0d4NnMjzxCHVAdJJXaQI8ZdQxl2+vhlGbJ1Pz4lLW9Ks0IK7UsT57l6KMpyVHaXYkLTiht6SyGilsYJ0EHx1Fawyw4MFYxUkLqLTCLpKQ26u3FoGZsoToiXjs6Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjFc4/afzlVVJPJMR7LcHjF/F9han5Cf6zVXh51MldQ=;
 b=ia/MObmF52NBsRnMkZoudmLQT4O72KB1EvX2acP4M0SzohTqIOQ5/ORqB1RjAMzgfnCHZ94h8qnajmG3O9zqKdIlOlUywOyjL/8OKqE7FHPBQdpzPfzNbSCXvFEAg5r5vyKn/FJ1U9lFQEoAWeQ/4G2+FH7rtLDAAxwN3XtKJhb699vETLAz5wFqs7WNjO79VNahm6TfXjRzz6sVdYpkBLZJRvDwREzhllVLA5EURhacZWCRwrO68RexD6zz4j6GiI94fpcmDo0+HqcV3DxztR10S8TAB/war9kwUFRFM9GMAV1SfkmANXcq0OnhiEkA/LhftSwu1mQRA+QvbBjs6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjFc4/afzlVVJPJMR7LcHjF/F9han5Cf6zVXh51MldQ=;
 b=MQg+Vd7QKV+agbDtvoHS/rISHSyPKiSGYAsq6Z5/557kdL34IvlC2p9MDzsGHzqPgNhg9kRPVdMmDBGtikZj19wwO6ypR7Ospt99DUaRq+EBUUmoHdoCyXjACptlyuT84/7UuNxTGUIYlNbE5sSSVuM2n5RfB8H8uI4SWLnj8sk=
Received: from BY5PR02MB6772.namprd02.prod.outlook.com (2603:10b6:a03:206::11)
 by BYAPR02MB4997.namprd02.prod.outlook.com (2603:10b6:a03:71::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 1 Dec
 2020 08:32:27 +0000
Received: from BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::75ed:4271:263b:fd15]) by BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::75ed:4271:263b:fd15%3]) with mapi id 15.20.3611.031; Tue, 1 Dec 2020
 08:32:27 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH v13 0/4] Add Versal usb model
Thread-Topic: [PATCH v13 0/4] Add Versal usb model
Thread-Index: AQHWty2HdOp1M5opqUSqk1plzrVo8Kngrw6AgAFbJ6A=
Date: Tue, 1 Dec 2020 08:32:27 +0000
Message-ID: <BY5PR02MB677262009DC0788F5D0F049ECAF40@BY5PR02MB6772.namprd02.prod.outlook.com>
References: <1604991130-12965-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <CAFEAcA_gcuxVuA6pc7F3nWN+5hvznqwB1L_767VqjPg0Kziydw@mail.gmail.com>
In-Reply-To: <CAFEAcA_gcuxVuA6pc7F3nWN+5hvznqwB1L_767VqjPg0Kziydw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [49.205.235.17]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a1148b6d-c65b-4bd6-76df-08d895d3a2b6
x-ms-traffictypediagnostic: BYAPR02MB4997:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB4997B23745909DD2224138CDCAF40@BYAPR02MB4997.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:330;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vm0R9KW5Kq5u7hZNcDFW1x5LTR5iY0JPUbHkbauXOCKfm5MXTUUNBbQsAfH1gv21p7TTnKKxsPb5PiXRG9b2hrJGKP4wrcT73FSl4FHpvWLlsfxS6ZY6EXcWKIYRlRJ1vi1WbA/8DcMqAOYdEJSPTMtv7ZwzAGPq6OJyN9hio8XOstEABQ5Pdm27g8PHvHDkW5eHCT4BkIpn+LvdwtG5Nf1QDtmWm3fbV9/pdQ1/7Gb6uZa82il5Z6TBhziPh8llSqm5RbtXjDYGhcwR9KGLlOF0pMcwqAjrO19u8bWbiloHpUM1AHU9TzqKraKUhLFcf7cU1nn+PML/s9fZSfUjzA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6772.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(4326008)(7416002)(33656002)(2906002)(316002)(86362001)(71200400001)(8676002)(8936002)(54906003)(5660300002)(52536014)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006)(478600001)(7696005)(9686003)(6916009)(26005)(6506007)(55016002)(186003)(53546011)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bk9lREZGeXlFcGltSUYzVkdDdzVwWGwvaW5XYS95ZkZrU1EzUXVCZWUyUlND?=
 =?utf-8?B?WVE0YkszakRiNWJONnhzV05HMmxzWHl3UWxSa1piMys0SU5ldkxUZGhlRElX?=
 =?utf-8?B?M01qaEo5WGdmMW8vNGRDQnlxT1Ivckx2YTJNV3RwWEFyMWdQcXlhMTVKSUVX?=
 =?utf-8?B?SHI0ZXVWRUY3UTI1MERIaHdnQjRCN24ra0tmYTJQTm9yYmNCUUk1dFBQbmpw?=
 =?utf-8?B?UGRZRzdNbmx6SjRLWnRyeG51UE1nanRpMTFzSHhlcjNDdHpWS2xCQ3NiNjBO?=
 =?utf-8?B?MnFBQU5YT1V6enl0NkZIRCtkWjc1aTFCeDBQU2x0SERGTmFCVE9lME0wcmJM?=
 =?utf-8?B?aHNVUHVsSElSS000dzJCc2RmVVQ0aUtjRWxOeEs2dzdXbmIvVUwveVR6a05L?=
 =?utf-8?B?QmRQQWs3d21zSk1QRzV0MzJ5cWtZbVQrRk9xS2w3bDg4aHYvT2xjK2tYTlhv?=
 =?utf-8?B?cWw2SGNaU1BuR1pJNmd5YnN4eTlWSkhWTnVBbCtabmxlSzhYK0VjbTAvZnV4?=
 =?utf-8?B?OHFsSXpaN09EOTZLOTQ2RGlLbzJsdUg1MVF1L0tLcS9lZ2xYN3hhamFOUmwx?=
 =?utf-8?B?bWU0dkd6NG94QjdqTEEvN1ByQ2RvOUpVR1Ard0E4THhrRE1YZUhCZW1yWXgx?=
 =?utf-8?B?cHU0a2pTZHVmUUdrbEd3U2RyQVRPS2VCMzJNNVdMc2JrZWJsWFNUSFJERm9p?=
 =?utf-8?B?bnZZcUtSWVBONktGTDdYV2tFSm1HRHVobGlIUktrcVlpOGJVb3lXNDFSeVcz?=
 =?utf-8?B?aTFpM0JIQ21RcU4yazU4NDMwM2xLekJQRU0wbmdMVlhVUFIzMjVvTTlYR3Uz?=
 =?utf-8?B?ZERPbFZJa0NCKzhsVFV1Vzc3VHo2Y1REN2ZNTnRNZUw4R01MYkZXSWY5bkpK?=
 =?utf-8?B?eklSWnVNbm9ZckJJc0FIM3g5OThna3JQMzRqQlVXTFlZREJaQm9pNDhqdG10?=
 =?utf-8?B?TEIwSTVYWTZlRVN1MkZjRnpuNjB6YjhsbTdsbGtXUDFxbTBUMUJVTkVZbS8z?=
 =?utf-8?B?bVVyaXhIQjJlWkJRYkl6SXhaZDFVL2x0bGhtcXFQbWgwdjRqVkExUE54Mmdl?=
 =?utf-8?B?U0pRdHIzR0RTS240aWNFU2JxM0t5L3JpOXV5T0Z6UFpTdkNFSmZoSmpJcmxO?=
 =?utf-8?B?VzJlOW5WZnJGL3RIUlRnc0Mray9ZV3REU0R4OGdmTDZLUHFkQWdRaDFoMEVm?=
 =?utf-8?B?eXNMTHZ2SDVFSmRLQU50QUw1V1EzdEdwUEFmWitRV0FxTk9YSzRUTExHMWQ4?=
 =?utf-8?B?UnJYbjJrWE5maFI2NW95Z2cyb25ndTRDdG5xK1h5aGhTaVdYb2FLYTRFQlZI?=
 =?utf-8?Q?u/YlRkch4cHqA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6772.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1148b6d-c65b-4bd6-76df-08d895d3a2b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 08:32:27.1757 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ux5Gp5r1cX6sJ39EmN/ZjSuM7dUNkB5sBL8iAbW8fyS0qq9RClNqDOMj3N06JwK2wFlkvjkOzPfIN65jly3A7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4997
Received-SPF: pass client-ip=40.107.92.51; envelope-from=saipava@xilinx.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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

SGkgUGV0ZXIsDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBldGVyIE1h
eWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4NCj4gU2VudDogTW9uZGF5LCBOb3ZlbWJl
ciAzMCwgMjAyMCA1OjE4IFBNDQo+IFRvOiBTYWkgUGF2YW4gQm9kZHUgPHNhaXBhdmFAeGlsaW54
LmNvbT4NCj4gQ2M6IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNvbT47IE1hcmMt
QW5kcsOpIEx1cmVhdQ0KPiA8bWFyY2FuZHJlLmx1cmVhdUByZWRoYXQuY29tPjsgUGFvbG8gQm9u
emluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT47DQo+IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRo
YXQuY29tPjsgRWRnYXIgSWdsZXNpYXMgPGVkZ2FyaUB4aWxpbnguY29tPjsNCj4gRnJhbmNpc2Nv
IEVkdWFyZG8gSWdsZXNpYXMgPGZpZ2xlc2lhQHhpbGlueC5jb20+OyBBbGlzdGFpciBGcmFuY2lz
DQo+IDxhbGlzdGFpci5mcmFuY2lzQHdkYy5jb20+OyBFZHVhcmRvIEhhYmtvc3QgPGVoYWJrb3N0
QHJlZGhhdC5jb20+OyBZaW5nDQo+IEZhbmcgPGZhbmd5aW5nMUBodWF3ZWkuY29tPjsgUGhpbGlw
cGUgTWF0aGlldS1EYXVkw6kNCj4gPHBoaWxtZEByZWRoYXQuY29tPjsgVmlrcmFtIEdhcmh3YWwg
PGZudXZAeGlsaW54LmNvbT47IFBhdWwgWmltbWVybWFuDQo+IDxwYXVsZHppbUBnbWFpbC5jb20+
OyBTYWkgUGF2YW4gQm9kZHUgPHNhaXBhdmFAeGlsaW54LmNvbT47IFFFTVUNCj4gRGV2ZWxvcGVy
cyA8cWVtdS1kZXZlbEBub25nbnUub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMyAwLzRd
IEFkZCBWZXJzYWwgdXNiIG1vZGVsDQo+IA0KPiBPbiBUdWUsIDEwIE5vdiAyMDIwIGF0IDA2OjQ4
LCBTYWkgUGF2YW4gQm9kZHUgPHNhaS5wYXZhbi5ib2RkdUB4aWxpbnguY29tPg0KPiB3cm90ZToN
Cj4gPg0KPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGF0dGVtcHRzIHRvIG1ha2UgJ2hjZC14aGNpJyBh
biBpbmRlcGVuZGVudCBtb2RlbCBzbyBpdCBjYW4NCj4gYmUgdXNlZCBieSBib3RoIHBjaSBhbmQg
c3lzdGVtLWJ1cyBpbnRlcmZhY2UuDQo+IA0KPiBUaGlzIGZhaWxzICJtYWtlIGNoZWNrIjoNCltT
YWkgUGF2YW4gQm9kZHVdIEkgYWxzbyBvYnNlcnZlIHRoaXMgYWZ0ZXIgcmViYXNlLiBXaWxsIGJl
IHNlbmRpbmcgb3V0IHYxNCB3aXRoIGEgZml4Lg0KDQpSZWdhcmRzLA0KU2FpIFBhdmFuDQo+IA0K
PiBbLi4uXQ0KPiBNQUxMT0NfUEVSVFVSQl89JHtNQUxMT0NfUEVSVFVSQl86LSQoKCAke1JBTkRP
TTotMH0gJSAyNTUgKyAxKSl9DQo+IFFURVNUX1FFTVVfSU1HPS4vcWVtdS1pbWcNCj4gR19URVNU
X0RCVVNfREFFTU9OPS9ob21lL3BldG1heTAxL2xpbmFyby9xZW11LWZyb20tDQo+IGxhcHRvcC9x
ZW11L3Rlc3RzL2RidXMtdm1zdGF0ZS1kYWVtb24uc2gNCj4gUVRFU1RfUUVNVV9CSU5BUlk9Li9x
ZW11LXN5c3RlbS1hYXJjaDY0DQo+IHRlc3RzL3F0ZXN0L2RldmljZS1pbnRyb3NwZWN0LXRlc3Qg
LS10YXAgLWsgUEFTUyAxIHF0ZXN0LWFhcmNoNjQvZGV2aWNlLQ0KPiBpbnRyb3NwZWN0LXRlc3Qg
L2FhcmNoNjQvZGV2aWNlL2ludHJvc3BlY3QvbGlzdCBQQVNTIDIgcXRlc3QtYWFyY2g2NC9kZXZp
Y2UtDQo+IGludHJvc3BlY3QtdGVzdA0KPiAvYWFyY2g2NC9kZXZpY2UvaW50cm9zcGVjdC9saXN0
LWZpZWxkcw0KPiBQQVNTIDMgcXRlc3QtYWFyY2g2NC9kZXZpY2UtaW50cm9zcGVjdC10ZXN0IC9h
YXJjaDY0L2RldmljZS9pbnRyb3NwZWN0L25vbmUNCj4gUEFTUyA0IHF0ZXN0LWFhcmNoNjQvZGV2
aWNlLWludHJvc3BlY3QtdGVzdA0KPiAvYWFyY2g2NC9kZXZpY2UvaW50cm9zcGVjdC9hYnN0cmFj
dA0KPiBQQVNTIDUgcXRlc3QtYWFyY2g2NC9kZXZpY2UtaW50cm9zcGVjdC10ZXN0DQo+IC9hYXJj
aDY0L2RldmljZS9pbnRyb3NwZWN0L2Fic3RyYWN0LWludGVyZmFjZXMNCj4gbWlzc2luZyBvYmpl
Y3QgdHlwZSAndXNiX2R3YzMnDQo+IEJyb2tlbiBwaXBlDQo+IC4uLy4uL3Rlc3RzL3F0ZXN0L2xp
YnF0ZXN0LmM6MTgxOiBraWxsX3FlbXUoKSBkZXRlY3RlZCBRRU1VIGRlYXRoIGZyb20gc2lnbmFs
IDYNCj4gKEFib3J0ZWQpIChjb3JlIGR1bXBlZCkgRVJST1IgcXRlc3QtYWFyY2g2NC9kZXZpY2Ut
aW50cm9zcGVjdC10ZXN0IC0gdG9vDQo+IGZldyB0ZXN0cyBydW4gKGV4cGVjdGVkIDYsIGdvdCA1
KQ0KPiANCj4gUHJvYmFibHkgYW4gZXJyb3IgaW4gbWVzb24uYnVpbGQgb3IgS2NvbmZpZyBoYW5k
bGluZyBvZiB0aGF0IG5ldyBkZXZpY2UuDQo+IA0KPiB0aGFua3MNCj4gLS0gUE1NDQo=

