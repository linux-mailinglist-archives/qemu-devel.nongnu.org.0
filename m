Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33103646CA
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:11:41 +0200 (CEST)
Received: from localhost ([::1]:40110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVYq-00076j-Rk
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lYVO3-0002U2-5q
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:00:31 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:64520)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lYVNw-0001bc-7n
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:00:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1618844424; x=1650380424;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tElUTiSU3jpSYS1Y/I/iYMbTxXshyoDLKLjaMeSJXGM=;
 b=qgtFcTjS5PlS3sOdoTz7C7rJrJg+zNB/XgD2Rnf2ThEixqgVtrTuLxDQ
 qq3zIJswImwunTDWbkG905nXbt/LvWTYUCerc82OOUoR8LcKdvqPxUmKB
 3CNd9RKKAA5aUxUzfQ04X08gwrDQDUtu8+y+bVwSThJBd2OGcSE/pRQ6R o=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 19 Apr 2021 08:00:20 -0700
X-QCInternal: smtphost
Received: from nasanexm03g.na.qualcomm.com ([10.85.0.49])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 19 Apr 2021 08:00:19 -0700
Received: from nasanexm03g.na.qualcomm.com (10.85.0.49) by
 nasanexm03g.na.qualcomm.com (10.85.0.49) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 08:00:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03g.na.qualcomm.com (10.85.0.49) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Mon, 19 Apr 2021 08:00:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPgkXxik8q1EmN4eW94S2MNZ+FTr7VMcEaSLMPajpJkV5X8Ie0UjRdFgJUnY8TUyn0/7Tea2VOo0HtXO5wb3hqkURfnyf83dfsesy0EhOzzclRP8ZwktHfwiGYFAnSl/2JdjbSXrQzzGfylV4gYZCfKsAVH2ubFUZxfs77LU6MuoT6dcgZjWfGbQg4a1A/tJ3qQ+3qE0lmvkMI4Bnu/94V8+kBQRKlXUbR536tdio5oOL2XIAN/wn88DF/GcZ+63Fo62QjXbogYCf7dYQmJOWz40nMCN6hDf/kyReXj4p5Sj2k1ePzb9RggJ4uKtrU/pz5aGAH+gNN+e1d0IRS+XWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tElUTiSU3jpSYS1Y/I/iYMbTxXshyoDLKLjaMeSJXGM=;
 b=a8/lgj92KET4LujZ20eQSnCuuoocqEw1q6RwK8NGaRvaKZX6i3uVsW0efyjlqNP2bGtwtb4SwKyr0CAJavqLQWWpK+0u+GubdkRklGefRMfcel7qUu/fGN1Bj3x4mLzrmaI2pdfKpJrx6GRlPn3LJYr/4Ith+1mjKIKlnwiM3RsGfNkJ0NLz40+UjIZqgOSmuzMePSGM+s03TlVnDvzJQkG2EeZtfJIYnSs9/kt2V5Dm+Y0Rldc9POYt6i8brTQFiyHCKUhWjx38HVX6xku2/fJ/NEZsjX9K0YRuBZjOW1Mgnktz4y229wynlobGxLsel3KAFQWQGWmlpOvd5UO6og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by SJ0PR02MB7231.namprd02.prod.outlook.com (2603:10b6:a03:299::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Mon, 19 Apr
 2021 15:00:18 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608%6]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 15:00:18 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, Alessandro Di Federico
 <ale.qemu@rev.ng>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4 06/12] target/hexagon: introduce new helper functions
Thread-Topic: [PATCH v4 06/12] target/hexagon: introduce new helper functions
Thread-Index: AQHXMhVTo/ftwusZ+kCP2eKANneSJaq60CYAgAEgsoA=
Date: Mon, 19 Apr 2021 15:00:17 +0000
Message-ID: <BYAPR02MB4886545B4B093744B7B4885DDE499@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210415163455.3839169-1-ale.qemu@rev.ng>
 <20210415163455.3839169-7-ale.qemu@rev.ng>
 <b36337c6-f6d0-45b1-be11-b998d8579c4c@linaro.org>
In-Reply-To: <b36337c6-f6d0-45b1-be11-b998d8579c4c@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34fdcb2a-d3ad-4574-9211-08d90343d8a7
x-ms-traffictypediagnostic: SJ0PR02MB7231:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR02MB72310901A567559735CE1E36DE499@SJ0PR02MB7231.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G0Z736KO/2rAfAgbYdNjGwvccL70ooyrQezS4CTT2B13cx9xiRfAd0jlOQM9D+taBvU1zB4Ka8+OlWFnknxwY6S0MoX2cC1aw4HQqFZKS7JzfulI0kMHqFikejCOw4dpcH+rv2b1e/2FOb2NiZKYdGAdvIiBaPzA3VmBF9c2UfkfwX9hHNG53mhUPyNxdI2wt+rddfHZmflRj08wGnLkTh7FajrpvzfRS0oEUkEKsUsJCqWXdeDhFNmgJvU5T8sB7U4nFo+6hCBeFvLUEWY/G+Gco/a8ad+nwZxvAPZLOGpVHF1V4eZTiyJUfc0lvk+jdd7KLKe0keJk73PdXTDcwkMhWPF4RD6Li2jMAqWCLsa5RQuKg+d6tUSjENeoQS7K5i+lNTwSM/CLwvFse09ESGgU+b28DPXxp4xu3/3i24JsKF59C6YX9XeYtQ7vOPNLMeWrpwkbOBZ6ynv0nNNnsWGH4JJJom7EjipimfQuW2SJVSsIw5TLMKQMQ5vMfbSki+Uu/4ljf4kG0+GGsKiKFvZUxxDtIrtV9IzjGhCLM5vDxspAnCZvp1e5vCZmHoG+K/byvD+mTOxgYfNnX3HRIrKiLv7JhVgn5oJ0JZonQrc0ET8pEy3LSLeIoDpqdrQNUydrTE46mLOQO9f28f9F9l1zOoKkHjLX7mlFmysnXsDJ4KhtJf4vm7WFZ4TXUqnp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(2906002)(966005)(26005)(122000001)(6506007)(8936002)(55016002)(86362001)(5660300002)(33656002)(71200400001)(186003)(9686003)(110136005)(8676002)(52536014)(66946007)(7696005)(64756008)(316002)(54906003)(4326008)(76116006)(66556008)(53546011)(66446008)(83380400001)(66476007)(38100700002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?R1NoNjVwcFY5Ym9nK3ZVTDVaWGgvaHQycjZIcXNCM0JERXhQbEVySzFabHNV?=
 =?utf-8?B?S0d6VGtzU0FUakpCV3IrczIveU1ZZlRPVFEzemxQSldOK2hkVUh0TTBWZTNF?=
 =?utf-8?B?NW80OHVuclNzTG5ORFhncWptVXordGw1dDNEaVp4Q2hWb0tXRjRJV2UrRkZG?=
 =?utf-8?B?SkxrSTdhQ00yRXJ4bmdydUIwS2U1M203VlQzWEc3ZlJLUFJUekVOeUxoVkVF?=
 =?utf-8?B?WCthN0E1ZmREcTNLbmJSVzVmVjNES3FlaGtpUnNjamh4aGppMzhkUjUyNFF2?=
 =?utf-8?B?YUVPSXN0ZC8wbnRFT3dhc2w0KzBWdkdmRmExRHJoYUk5cUkyTEQ5bTV6NUpB?=
 =?utf-8?B?RFM2bTRocUcvMVFMc0tkWldGY1NUVTVlZCtsK3hrVzRvQW1rWkhtQjUvalZy?=
 =?utf-8?B?MDFDeW54eDhxY0VJNXRIVTYweUc2blhrVDlKblY4VnRDbHlXcnBSWFIyenJr?=
 =?utf-8?B?UFArbTMvb0tQRWVxeFhVV3FHSHZvNE1LQWRNOXNxS1Jzb0g1cDFtZXhXR2Mr?=
 =?utf-8?B?c2paNzQ0ZTE1MzdRSHEzU0djWkpwYjZaZCs0UG9uQldqOE4zdzExMnhtQ0FP?=
 =?utf-8?B?OVl3WlZpN1JBRjNqcUJaOUlOaGphRXVJWkFjbUlEZmFDUlVyeHNsQWlVM3Bh?=
 =?utf-8?B?RTV3L1ZpSDZ1OVpzMXZYUm5KS2JtZ3JUNFZQcUp1MTBSN1I1MnRTT01wMzdy?=
 =?utf-8?B?TWdpTjI4a2hlRTlZZTczYTM2UkMrRXpHWDBmMExiQ2JmRXUwTmpldm1WTis0?=
 =?utf-8?B?UE5IcWFBcHlIMU1GdW1RMHhBazhHbDhBaTU3Q29xWVgxNDB2cm1scjdJMUZF?=
 =?utf-8?B?bzBudU9xbmIrMjFMbS8yZmJWUi91Z1ovbzQvME1kTk5od2hXTHpCTWdpRUJZ?=
 =?utf-8?B?c2l6WnZsTXFibUNMVkFvNkdjMUZ4QlhoSHM0emhUamcyR053S2dUak1ORnhY?=
 =?utf-8?B?SXNOdHExVFRRRXNyZE1GN1M2M2hDZDZqQVRXd1d3ckZRaHFZbmM0SE1NQlg5?=
 =?utf-8?B?N21mVHlUV0JQaWpYZ0FHYndmZmR5OXU3eGJXYVJ5amtWZmwxS0swbmRIaUpy?=
 =?utf-8?B?ZmhGaEZDTlM1Z2k4OE40UkNBTDBOL25pVW1VYitFSW0xd0xaUkg1cDk1OUdH?=
 =?utf-8?B?TU9uNFBySkd0alZidW4xQ0lJR0hsYkhKVkpkTHFCZ2RXZjhBa2taTlc5bENk?=
 =?utf-8?B?N3UrRmlkWnljZmdOSXU5a0VXZGlTa1FsZ2FXQktKR0szS0N6eUdIT0RGQ2s5?=
 =?utf-8?B?UkttbC9qNXNPazE4L0hETEJSeU00WE1xdUFoaFJwNTZmNXBiNmZTZjlSdGR2?=
 =?utf-8?B?WmhSbFVJTWZEcnZvdUVweEJJZE9Ya2xwZE55U0dqVFlIVC85QVlLOGJZRlpN?=
 =?utf-8?B?ajh5d1Bib1ViejVwODZtRHFUQUltSW1LRHpVaWZjYUFaYWJPdzlyZXcvVlU2?=
 =?utf-8?B?VU9mWjdSSkQ5bXdxZFhraC9PdHdDd3NmcGZIZllmVEtSOU1OY0c2YjJBYndu?=
 =?utf-8?B?RHAxdVl3RVppSVg2Z2dac1JhZi94b3p5MkF6SlVqNDRMdUwyaWNUdWFRaUhy?=
 =?utf-8?B?b2U1NWpsdmZaNjhuNmw3NkJ4aXVla1NqSjQ0aDRwdWR3eTdsVmNmT29VQjRN?=
 =?utf-8?B?WlkvS1RNT3BQRE1JTm45c1ZiVVVTVTI4c3I4UERjaTg3MVp0blN2TWJ2ZGxm?=
 =?utf-8?B?eU12WWZYTGYrMHQ5TS9uU1ZqcUNxRmVOYlV4UVlKS0ttSE1OYXMraXVrR096?=
 =?utf-8?Q?FoopkwJ+73rQLuz01PazqRyh+KqT0vlUYjdhpdU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34fdcb2a-d3ad-4574-9211-08d90343d8a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2021 15:00:18.0419 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SMstVmr9GTEtVWG/UNi7dllFisZb8fjBdbBTVz06U477n3PZm3bbG2METPC7L5PwC6D3K02eAc2Ts+sSWrv1xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7231
X-OriginatorOrg: quicinc.com
Received-SPF: pass client-ip=199.106.114.39; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-02.qualcomm.com
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
Cc: "babush@rev.ng" <babush@rev.ng>, Brian Cain <bcain@quicinc.com>,
 Alessandro Di Federico <ale@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFN1bmRheSwgQXByaWwg
MTgsIDIwMjEgNDozMSBQTQ0KPiBUbzogQWxlc3NhbmRybyBEaSBGZWRlcmljbyA8YWxlLnFlbXVA
cmV2Lm5nPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBUYXlsb3IgU2ltcHNvbiA8dHNp
bXBzb25AcXVpY2luYy5jb20+OyBCcmlhbiBDYWluDQo+IDxiY2FpbkBxdWljaW5jLmNvbT47IGJh
YnVzaEByZXYubmc7IG5penpvQHJldi5uZzsgcGhpbG1kQHJlZGhhdC5jb207DQo+IEFsZXNzYW5k
cm8gRGkgRmVkZXJpY28gPGFsZUByZXYubmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMDYv
MTJdIHRhcmdldC9oZXhhZ29uOiBpbnRyb2R1Y2UgbmV3IGhlbHBlcg0KPiBmdW5jdGlvbnMNCj4g
DQo+IE9uIDQvMTUvMjEgOTozNCBBTSwgQWxlc3NhbmRybyBEaSBGZWRlcmljbyB3cm90ZToNCj4g
PiArdm9pZCBnZW5fc3RvcmUzMihUQ0d2IHZhZGRyLCBUQ0d2IHNyYywgdGNnX3RhcmdldF9sb25n
IHdpZHRoLCB1bnNpZ25lZA0KPiBzbG90KQ0KPiA+ICt7DQo+ID4gKyAgICB0Y2dfZ2VuX21vdl90
bChoZXhfc3RvcmVfYWRkcltzbG90XSwgdmFkZHIpOw0KPiA+ICsgICAgdGNnX2dlbl9tb3ZpX3Rs
KGhleF9zdG9yZV93aWR0aFtzbG90XSwgd2lkdGgpOw0KPiA+ICsgICAgdGNnX2dlbl9tb3ZfdGwo
aGV4X3N0b3JlX3ZhbDMyW3Nsb3RdLCBzcmMpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICt2b2lkIGdl
bl9zdG9yZTEoVENHdl9lbnYgY3B1X2VudiwgVENHdiB2YWRkciwgVENHdiBzcmMsIERpc2FzQ29u
dGV4dA0KPiAqY3R4LA0KPiA+ICsgICAgICAgICAgICAgICAgdW5zaWduZWQgc2xvdCkNCj4gPiAr
ew0KPiA+ICsgICAgZ2VuX3N0b3JlMzIodmFkZHIsIHNyYywgMSwgc2xvdCk7DQo+ID4gKyAgICBj
dHgtPnN0b3JlX3dpZHRoW3Nsb3RdID0gMTsNCj4gPiArfQ0KPiANCj4gV2h5IGlzIHN0b3JlX3dp
ZHRoIGhlcmUgYW5kIG5vdCBpbiBnZW5fc3RvcmUzMj8NCj4gRG8geW91IHJlYWxseSBuZWVkIHNv
IG1hbnkgaGVscGVycyBoZXJlLCBhcyBvcHBvc2VkIHRvIG1ha2luZyB1c2Ugb2YNCj4gTWVtT3A/
DQoNClRoZXNlIGFyZSBpbmNsdWRlZCBpbiB0aGlzIHBhdGNoDQpodHRwczovL2xpc3RzLmdudS5v
cmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAyMS0wNC9tc2cwMTM1NS5odG1sDQp3aGljaCBo
YXNuJ3QgYmVlbiBtZXJnZWQgeWV0Lg0KDQo+IA0KPiA+ICt2b2lkIGdlbl9zYXRfaTMyX2V4dChU
Q0d2IG92ZmwsIFRDR3YgZGVzdCwgVENHdiBzb3VyY2UsIGludCB3aWR0aCkNCj4gPiArew0KPiA+
ICsgICAgZ2VuX3NhdF9pMzIoZGVzdCwgc291cmNlLCB3aWR0aCk7DQo+ID4gKyAgICBUQ0d2IHpl
cm8gPSB0Y2dfY29uc3RfaTMyKDApOw0KPiA+ICsgICAgVENHdiBvbmUgPSB0Y2dfY29uc3RfaTMy
KDEpOw0KPiA+ICsgICAgdGNnX2dlbl9tb3Zjb25kX2kzMihUQ0dfQ09ORF9ORSwgb3ZmbCwgc291
cmNlLCBkZXN0LCBvbmUsIHplcm8pOw0KPiANCj4gKHNvdXJjZSAhPSBkZXN0ID8gMSA6IDApIC0+
IChzb3VyY2UgIT0gZGVzdCkuDQo+IA0KPiBUaGVyZWZvcmUsIHRjZ19nZW5fc2V0Y29uZF9pMzIu
DQo+IA0KPiBPciBkaWQgeW91IGludGVuZA0KPiANCj4gb3ZmbCA9IChzb3VyY2UgIT0gZGVzdCA/
IDEgOiBvdmZsKT8NCj4gDQo+IHdoaWNoIGlzIHByb2JhYmx5IHN0aWxsIGJldHRlciBhcw0KPiAN
Cj4gICAgdGNnX2dlbl9zZXRjb25kX3RsKFRDR19DT05EX05FLCB0bXAsIHNvdXJjZSxkZXN0KTsN
Cj4gICAgdGNnX2dlbl9vcl90bChvdmZsLCBvdmZsLCB0bXApOw0KPiANCj4gPiArdm9pZCBnZW5f
ZmJyZXYoVENHdiByZXN1bHQsIFRDR3Ygc3JjKQ0KPiA+ICt7DQo+ID4gKyAgICBUQ0d2IGxvID0g
dGNnX3RlbXBfbmV3KCk7DQo+ID4gKyAgICBUQ0d2IHRtcDEgPSB0Y2dfdGVtcF9uZXcoKTsNCj4g
PiArICAgIFRDR3YgdG1wMiA9IHRjZ190ZW1wX25ldygpOw0KPiA+ICsNCj4gPiArICAgIC8qIEJp
dCByZXZlcnNhbCBvZiBsb3cgMTYgYml0cyAqLw0KPiA+ICsgICAgdGNnX2dlbl9leHRyYWN0X3Rs
KGxvLCBzcmMsIDAsIDE2KTsNCj4gPiArICAgIHRjZ19nZW5fYW5kaV90bCh0bXAxLCBsbywgMHhh
YWFhKTsNCj4gPiArICAgIHRjZ19nZW5fc2hyaV90bCh0bXAxLCB0bXAxLCAxKTsNCj4gPiArICAg
IHRjZ19nZW5fYW5kaV90bCh0bXAyLCBsbywgMHg1NTU1KTsNCj4gPiArICAgIHRjZ19nZW5fc2hs
aV90bCh0bXAyLCB0bXAyLCAxKTsNCj4gPiArICAgIHRjZ19nZW5fb3JfdGwobG8sIHRtcDEsIHRt
cDIpOw0KPiA+ICsgICAgdGNnX2dlbl9hbmRpX3RsKHRtcDEsIGxvLCAweGNjY2MpOw0KPiA+ICsg
ICAgdGNnX2dlbl9zaHJpX3RsKHRtcDEsIHRtcDEsIDIpOw0KPiA+ICsgICAgdGNnX2dlbl9hbmRp
X3RsKHRtcDIsIGxvLCAweDMzMzMpOw0KPiA+ICsgICAgdGNnX2dlbl9zaGxpX3RsKHRtcDIsIHRt
cDIsIDIpOw0KPiA+ICsgICAgdGNnX2dlbl9vcl90bChsbywgdG1wMSwgdG1wMik7DQo+ID4gKyAg
ICB0Y2dfZ2VuX2FuZGlfdGwodG1wMSwgbG8sIDB4ZjBmMCk7DQo+ID4gKyAgICB0Y2dfZ2VuX3No
cmlfdGwodG1wMSwgdG1wMSwgNCk7DQo+ID4gKyAgICB0Y2dfZ2VuX2FuZGlfdGwodG1wMiwgbG8s
IDB4MGYwZik7DQo+ID4gKyAgICB0Y2dfZ2VuX3NobGlfdGwodG1wMiwgdG1wMiwgNCk7DQo+ID4g
KyAgICB0Y2dfZ2VuX29yX3RsKGxvLCB0bXAxLCB0bXAyKTsNCj4gPiArICAgIHRjZ19nZW5fYnN3
YXAxNl90bChsbywgbG8pOw0KPiA+ICsNCj4gPiArICAgIC8qIEZpbmFsIHR3ZWFrcyAqLw0KPiA+
ICsgICAgdGNnX2dlbl9kZXBvc2l0X3RsKHJlc3VsdCwgc3JjLCBsbywgMCwgMTYpOw0KPiA+ICsg
ICAgdGNnX2dlbl9vcl90bChyZXN1bHQsIHJlc3VsdCwgbG8pOw0KPiA+ICsNCj4gPiArICAgIHRj
Z190ZW1wX2ZyZWUobG8pOw0KPiA+ICsgICAgdGNnX3RlbXBfZnJlZSh0bXAxKTsNCj4gPiArICAg
IHRjZ190ZW1wX2ZyZWUodG1wMik7DQo+ID4gK30NCj4gDQo+IENvb3JkaW5hdGUgd2l0aCBUYXls
b3IuDQo+IGh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1kZXZlbC8yMDIx
LTAzL21zZzEwMDA3Lmh0bWwNCg0KT25jZSB0aGlzIHBhdGNoIHNlcmllcyBpcyBtZXJnZWQsIG1h
bnkgbG9hZC9zdG9yZSBpbnN0cnVjdGlvbnMgd2lsbCBoYXZlIG1hbnVhbCBvdmVycmlkZXMuICBJ
IGNhbiBlYXNpbHkgcHJvdmlkZSBvdmVycmlkZXMgZm9yIHRoZSByZW1haW5kZXIuICBUaGVuLCB3
ZSBjb3VsZCBza2lwIHRoZW0gaW4gdGhlIGlkZWYtcGFyc2VyLiAgQXQgYSBtaW5pbXVtLCB5b3Ug
c2hvdWxkIHNraXAgdGhlIG9uZXMgdGhhdCBhcmUgcGFydCBvZiB0aGF0IHNlcmllcw0KLSBjaXJj
dWxhciBhZGRyZXNzaW5nCQkJCQlodHRwczovL2xpc3RzLmdudS5vcmcvYXJjaGl2ZS9odG1sL3Fl
bXUtZGV2ZWwvMjAyMS0wNC9tc2cwMTM1NS5odG1sDQotIGJpdCByZXZlcnNlIGFkZHJlc3NpbmcJ
CQkJCWh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1kZXZlbC8yMDIxLTA0
L21zZzAxMzU0Lmh0bWwNCi0gbG9hZCBhbmQgdW5wYWNrIGJ5dGVzCQkJCQlodHRwczovL2xpc3Rz
LmdudS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAyMS0wNC9tc2cwMTM1My5odG1sCQkJ
CQ0KLSBsb2FkIGludG8gc2hpZnRlZCByZWdpc3RlcgkJCQlodHRwczovL2xpc3RzLmdudS5vcmcv
YXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAyMS0wNC9tc2cwMTM1OS5odG1sDQoNCkFsZXNzYW5k
cm8sIHdoYXQgZG8geW91IHRoaW5rPw0KDQpUaGFua3MsDQpUYXlsb3INCg0K

