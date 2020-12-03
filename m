Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1CA2CDAE4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 17:12:08 +0100 (CET)
Received: from localhost ([::1]:40858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkrDD-0008NI-LO
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 11:12:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kkrAi-0006YN-Ho
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:09:32 -0500
Received: from mail-bn8nam11on2087.outbound.protection.outlook.com
 ([40.107.236.87]:1376 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kkrAf-0000uU-Eu
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:09:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AsIYZC/ixOd9qId6PjIyVvMMBNzu22wt80poY/BqvDAiDLADBedPL9ShpCzSDMAai2dbbqk+eeYPO3IbtLE5q5F0z2KYiuIfeiw07jYx+yf8DfCjpWWqZKYwCs1G2zJFyRVolgVdoR1Cdpw3xNIzD2umaRqNRxhLAUZeZiI31wYadukv7x0NmXLDdORo8ysXSTdu/9t7f/XQpOSOHCi9ulUWa7VQFvysOr+fSQapKLp4N7pdIL6th+gcTdP90EihJORQxLxZ0GMHkHVZ/70GoMbT3ecnY9XABp6vZm2w8BFcI5CVh/xvVMDPCA3lUjDomcPAdClOvVZZxSdjj8U2YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxNHUdqEDF1uBAb1Vp93gwPrQiwXwHpwTPwBFQ7mN/E=;
 b=A8a+d+3VXhKZXEzuoyNPSVPBHhcQipxBHUsq0Z1c2lA9biWzSbs8t4MSv4peX4+keO25JvT1etHq3O/xcZkuQnv6pbKgKzO6NykmBqk987naTYTyA1fvxvCHDpqucd+r9sV1gsTr1jm5sTWTss/yNxNwQfvnMHEOvfyTxWMf6+wghj93UZCqSwXtHgVBqqQqd9m3EkIckY0vO6mL+AOnXsEG96tTxVtn0EcznANoggAMcx9BLcMO3pBZHk1tNZc4XVuCQk1uVPxZ6xTHLaH+1th0c9Q4monkYCmivBIhiWZxNnWLwjkePOkJj9wTlBkXqcOqE7sBkiKuq1xobUqJLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxNHUdqEDF1uBAb1Vp93gwPrQiwXwHpwTPwBFQ7mN/E=;
 b=UPtHhwwQ4Y8XuX0gJrC2/wtT1pSAS1gU97Cew5H86QlI/KqsRYdsfJyAQhMvn0MUtMBqRgc+/iBY77DfwTqCX+QGOXJNJbHvX6lJLyj0gP5W2UpuF4eGbbVVhvba5yZ1ZjU/ZTmCEXBbNQThR6XcyQabSMhcW3EqiXJxVa2js8Q=
Received: from CH2PR02MB6774.namprd02.prod.outlook.com (2603:10b6:610:a8::18)
 by CH2PR02MB6853.namprd02.prod.outlook.com (2603:10b6:610:ae::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Thu, 3 Dec
 2020 15:54:23 +0000
Received: from CH2PR02MB6774.namprd02.prod.outlook.com
 ([fe80::e9ae:72df:1e0d:6007]) by CH2PR02MB6774.namprd02.prod.outlook.com
 ([fe80::e9ae:72df:1e0d:6007%9]) with mapi id 15.20.3632.018; Thu, 3 Dec 2020
 15:54:22 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH v14 1/4] usb: Add versal-usb2-ctrl-regs module
Thread-Topic: [PATCH v14 1/4] usb: Add versal-usb2-ctrl-regs module
Thread-Index: AQHWx7y/eNXmbTlXD0ewFlXjnC3jYqniGUAAgANwOxA=
Date: Thu, 3 Dec 2020 15:54:22 +0000
Message-ID: <CH2PR02MB677442374777DAAEABF79EE0CAF20@CH2PR02MB6774.namprd02.prod.outlook.com>
References: <1606811915-8492-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1606811915-8492-2-git-send-email-sai.pavan.boddu@xilinx.com>
 <CAFEAcA9JYiv+8Yd9S7wfr=wrZ9TW4H9Fp17-MRJpzs2sKn6F-Q@mail.gmail.com>
In-Reply-To: <CAFEAcA9JYiv+8Yd9S7wfr=wrZ9TW4H9Fp17-MRJpzs2sKn6F-Q@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: c45ef410-bfa5-40ca-378c-08d897a3b419
x-ms-traffictypediagnostic: CH2PR02MB6853:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR02MB6853A4AB4D745B1D901F09B8CAF20@CH2PR02MB6853.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fcBTpjhN2YgVal04fEIy/eF1OqOezDvgQg+5u5UE9WK5Y38K6otQoCJPc2CHNS9UjiKo4PhW8TbE3t3xjc9cnnA/mWFVpa3YRJKuyAi9EP1LPITKrihtvq25vaGdo0ADT3r01a6l7ud1SHnk7LhjP+/uKIMrXW6DcvgrF40QaS6si/xEbGbv0CeSvlL11B3aycbxr1PjYAVCWSFVFSffGi2sYWvX8CvsGEhASVdE9EH44f65udfQFLr6GVhDrsnmr46HkagvDtOb2LK9U+XK2CYUgxKAMBJoJZ3ytFbkmyifY//8faVqFuGtiz6JqOsoiOmIzGEw/nV+S4AawE58xw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR02MB6774.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(52536014)(55016002)(86362001)(9686003)(71200400001)(186003)(83380400001)(33656002)(478600001)(6916009)(5660300002)(316002)(54906003)(26005)(4326008)(7416002)(7696005)(66556008)(66476007)(66446008)(2906002)(53546011)(76116006)(66946007)(6506007)(8676002)(64756008)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bXl2TVFQM3crQ0xYYU9QT2lCYllUbXdaMjArYlBPZXdtZm9DRlI4SEF5Unly?=
 =?utf-8?B?THdnbEVKWjdLZUcwVGZNQkt4cnJIN2dCV0pkV3NOYlB4bXdlME9uTFhmUWQ4?=
 =?utf-8?B?dFBMdHluS0huZlc0aHEyNW83S1N3cVNwWS9zZW43NG14Q0psK01EanBpR21B?=
 =?utf-8?B?djBvWDR4OFZTaExNbHByOVZhUVVROUFJQURXUWhxbnY5cG55OXlKcDM0eGpr?=
 =?utf-8?B?TktCczNPakh0ZDdXdU9pOHJ4Z1dZejNQZWF2YnlaQU4zSkp6anZsSk1qWEs2?=
 =?utf-8?B?dXQ3M2JHR2VrSXM2bnBQWTd5K0I3WE5nL1BqdjZBOUxCNkFuU2JWbmZyekt4?=
 =?utf-8?B?T0ZiellqbHZQaXdrL1pGc0x0NEc0MmpZS21rWXN6bG94S1lJRzNDazMxaVBh?=
 =?utf-8?B?clllR0dlYkpIVGV0LzhSS3BhT3FmUzhPamJpcGZIVlZ4ZnR6R0NoUi9odmxp?=
 =?utf-8?B?RDNFWmpKL1E4TFhNemMwQnVSa2RwdTR6c1ZFUCs4NWYyUVBoSDQ2NFd1V3Ro?=
 =?utf-8?B?V2dhMmxtTElnaVlnS2RjMDFkSzQrU2VmekhBdDJDNDBmNUtxUmF1R3ZFcW82?=
 =?utf-8?B?S0lkZVMzRzUrV2NaN2UwUGk3ckhXQkRqakd6M0lLNnkyWjFBWlRzaVNpYlhk?=
 =?utf-8?B?WGY1UEZLdkhqV0JsZGswTTNIVFJNSXZVNzBGenRtV0RPYTVNeVM0bUdNM1lK?=
 =?utf-8?B?aSt1TG9TMDdZZ0M2S1FpMGJrQ0FocDhWL24ybVZxeW1iRmUxYVpoNGlzaVI2?=
 =?utf-8?B?bHJudTNmRDlpSmx0SGdzV1hodlZSRVFjbXdZZHhBVzBzT3lIWlZqWW9hd1lz?=
 =?utf-8?B?dTdGSkVyalhMNitocncyQVNqMlQrQlp1WFF6TzhxY3piOEMvYUk0MU9Jak9s?=
 =?utf-8?B?VUYrOVJ6UTlmY1ptTzBSSVFHQkZmbFFsMm10bDJFS1R1TTlnUWpQd3A1MlJ2?=
 =?utf-8?B?QU50bi9pVEl5LytTQm8zTjR6L05wTjFkZEM0Zm13K1gzaFA3MjZmZTdqMWdJ?=
 =?utf-8?B?a2dENEU2WXFaanpEdDhqZ3VGUEJxalU2OWxXd0dYaUxTOEpwUGhkNTRjSkhI?=
 =?utf-8?B?L3lQS3RKclhxOGptaVM0VTZ4eTZWTzFuN01RQjZ1WU9IZng4d0Nzb3RZR3pI?=
 =?utf-8?B?ZzZxOGJ4SnloQ2pxZmRIWjhjMFhUY2tOVklENGxEbGJIVnZRL1RNemM0RDh0?=
 =?utf-8?B?NGtDN3NXeDM4ZWZtTE5TWElxdVN5V0tIR0VBZkgvS1JjMVEwUjk2dDZSVStH?=
 =?utf-8?B?UkhGbUN6cGlRbEg4SHdFZXlHeUgxK2UwMkR2WDBCaElMb2dOMXBLdytMT3E0?=
 =?utf-8?Q?JfKZ6+a9jvlg4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR02MB6774.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c45ef410-bfa5-40ca-378c-08d897a3b419
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 15:54:22.9342 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IZdzbcqgrs07v9JOIq9P+6tWKT19TkFe/Iwkvv9bHmqrZv9dCw8UgvQoMt1jdFIML1gF7lg1MnCtkqHnSB9Jqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6853
Received-SPF: pass client-ip=40.107.236.87; envelope-from=saipava@xilinx.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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
eWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4NCj4gU2VudDogVHVlc2RheSwgRGVjZW1i
ZXIgMSwgMjAyMCA0OjUzIFBNDQo+IFRvOiBTYWkgUGF2YW4gQm9kZHUgPHNhaXBhdmFAeGlsaW54
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
cyA8cWVtdS1kZXZlbEBub25nbnUub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxNCAxLzRd
IHVzYjogQWRkIHZlcnNhbC11c2IyLWN0cmwtcmVncyBtb2R1bGUNCj4gDQo+IE9uIFR1ZSwgMSBE
ZWMgMjAyMCBhdCAwODozNCwgU2FpIFBhdmFuIEJvZGR1IDxzYWkucGF2YW4uYm9kZHVAeGlsaW54
LmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPiBUaGlzIG1vZHVsZSBlbXVsYXRlcyBjb250cm9sIHJl
Z2lzdGVycyBvZiB2ZXJzYWwgdXNiMiBjb250cm9sbGVyLCB0aGlzDQo+ID4gaXMgYWRkZWQganVz
dCB0byBtYWtlIGd1ZXN0IGhhcHB5LiBJbiBnZW5lcmFsIHRoaXMgbW9kdWxlIHdvdWxkDQo+ID4g
Y29udHJvbCB0aGUgcGh5LXJlc2V0IHNpZ25hbCBmcm9tIHVzYiBjb250cm9sbGVyLCBkYXRhIGNv
aGVyZW5jeSBvZg0KPiA+IHRoZSB0cmFuc2FjdGlvbnMsIHNpZ25hbHMgdGhlIGhvc3Qgc3lzdGVt
IGVycm9ycyByZWNlaXZlZCBmcm9tIGNvbnRyb2xsZXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBTYWkgUGF2YW4gQm9kZHUgPHNhaS5wYXZhbi5ib2RkdUB4aWxpbnguY29tPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFZpa3JhbSBHYXJod2FsIDxmbnUudmlrcmFtQHhpbGlueC5jb20+DQo+ID4gUmV2
aWV3ZWQtYnk6IEVkZ2FyIEUuIElnbGVzaWFzIDxlZGdhci5pZ2xlc2lhc0B4aWxpbnguY29tPg0K
PiA+IC0tLQ0KPiA+ICBody91c2IvbWVzb24uYnVpbGQgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICAxICsNCj4gPiAgaHcvdXNiL3hsbngtdmVyc2FsLXVzYjItY3RybC1yZWdzLmMgICAgICAg
ICB8IDIyOQ0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIGluY2x1ZGUvaHcv
dXNiL3hsbngtdmVyc2FsLXVzYjItY3RybC1yZWdzLmggfCAgNDUgKysrKysrDQo+ID4gIDMgZmls
ZXMgY2hhbmdlZCwgMjc1IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGh3
L3VzYi94bG54LXZlcnNhbC11c2IyLWN0cmwtcmVncy5jDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBpbmNsdWRlL2h3L3VzYi94bG54LXZlcnNhbC11c2IyLWN0cmwtcmVncy5oDQo+IA0KPiBSZXZp
ZXdlZC1ieTogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KW1NhaSBQ
YXZhbiBCb2RkdV0gVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQpSZWdhcmRzLA0KU2FpIFBhdmFu
DQo+IA0KPiB0aGFua3MNCj4gLS0gUE1NDQo=

