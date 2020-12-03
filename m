Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31F32CDCF3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 19:03:12 +0100 (CET)
Received: from localhost ([::1]:55006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkswi-0005g0-0v
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 13:03:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kkssL-0004M8-JW
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:58:41 -0500
Received: from mail-dm6nam12on2042.outbound.protection.outlook.com
 ([40.107.243.42]:5875 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kkssJ-0007Ma-AR
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:58:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gz4M1c7V1StA9Mm9zGqmwFxQI9kPITfxFlgWagnfDEqVyfP97C+7sfdU1DOdJW+Hph0DVfRAsCJGXjhmBjompou9tKhOgdpxjI2tCNrsO22eM/MX8kM05pvGDJK1vI8fabb7eNQPBrCze2iAhCYWemxf7bpb6BbGCKGc5lnzs3bktaYiSsaiuEPEJsIUmNhG1kp5mvb5KrSofxO3ccTFRXGOT0v6sW5p3a2avNUaLPeN0Uwwx8kPNWCsKhgc2PzKVS1uejqCceG7MFJGDJMQ5jL3HEk9IT8OVvtqzL46NmaFuAavO6ZQBX3Fjq99HxAYHoV9VZ5BAFrOJ5HlzCbZFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tb7fHCssbolSerTYbtFaaEIXHXlOK+48l9y3zHUaZCg=;
 b=fgwBh2wertGDHDnOYlOYDn6JGcjpLw1l/txhesUeI48q3aVkXCGdNYxSyBY0wJX5ETQcJ2FnoKXnScs5EKapjG5+u67yVTDf9NnHUnmCh0HjPXpbzs09XcAaWBnjC3BalGaF45dZYXSd1LUv1duHMBW5DniIxID0rt4eRjRIZcToquHsp6ZkAyZDVNADuCWPMpIuiJ6MyFAoUTEJ0DioDXwre3CVWB8HcaEoNj6HqJbUhkrZ4TnIq+rgcJRaVLCyk2lwKvLSMcvSgW3mJgdyDEGjA1CYSC76HiCqVz3ZkFOxc5f/gcChVWvtcJIm+I0nG4O1lEyhMOxOoIAuakebhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tb7fHCssbolSerTYbtFaaEIXHXlOK+48l9y3zHUaZCg=;
 b=Ft60MUtyioZCCNr17P0LtwvectotLEGOKbpuxTPaKca6BlWbU6oPW4YlrNKTb8ZWTUfUYH6gJcx5IMF8Ih1SO0zHIuucvSX4vTM0UWbSlqLhNjDn0fhXQqzHy4jH9K7LlkDMQFoRGNcNOzveeT4xStRR7LspOTf/AdgtfbRitas=
Received: from CH2PR02MB6774.namprd02.prod.outlook.com (2603:10b6:610:a8::18)
 by CH2PR02MB6232.namprd02.prod.outlook.com (2603:10b6:610:d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.20; Thu, 3 Dec
 2020 17:58:37 +0000
Received: from CH2PR02MB6774.namprd02.prod.outlook.com
 ([fe80::e9ae:72df:1e0d:6007]) by CH2PR02MB6774.namprd02.prod.outlook.com
 ([fe80::e9ae:72df:1e0d:6007%9]) with mapi id 15.20.3632.018; Thu, 3 Dec 2020
 17:58:37 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH v14 3/4] usb: xlnx-usb-subsystem: Add xilinx usb subsystem
Thread-Topic: [PATCH v14 3/4] usb: xlnx-usb-subsystem: Add xilinx usb subsystem
Thread-Index: AQHWx7zDS8lQrgrw60CwN43f6/YxQaniGlQAgAOR51A=
Date: Thu, 3 Dec 2020 17:58:37 +0000
Message-ID: <CH2PR02MB6774C60EDFBC5768B982DD8ACAF20@CH2PR02MB6774.namprd02.prod.outlook.com>
References: <1606811915-8492-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1606811915-8492-4-git-send-email-sai.pavan.boddu@xilinx.com>
 <CAFEAcA9_W3EbVdRXL118-hHqTxjkDnSJgXmMqctJdAXRf+Tb2g@mail.gmail.com>
In-Reply-To: <CAFEAcA9_W3EbVdRXL118-hHqTxjkDnSJgXmMqctJdAXRf+Tb2g@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: cfa82b55-cee2-4536-c027-08d897b50f37
x-ms-traffictypediagnostic: CH2PR02MB6232:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR02MB62326DD176163F2E869CDAA8CAF20@CH2PR02MB6232.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LjdSF9HZfz6XTJItbIG2pOGa7ynRiCjK2/JAIE/8aCGfen0ziiliZc3EP24r0xm1CSAaTpgjcjv8AiuIWuCinJ8xWsAC0NFYYEnO9rIHsZyK4B5Wt8zmxhyxKMFbMOWL3/qJzL4fk8ZtqAVSiOtIc3lDiB/X/jGSKtg8LTaK4vm33Iu9B34pW19D+Gojtr23MM0wgnz0XtlCM+FSFy38THxvvU6Pua/CBh+smBylFbmu8ylpmzu4DT51Xcy2vm6NV/PXjOIe6J8cv4nB6WGNW6Mg0jCFo9s/8weok0hSqa82oP5DDalKrDwMiZk6b30t
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR02MB6774.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(39860400002)(136003)(346002)(33656002)(9686003)(54906003)(83380400001)(55016002)(71200400001)(316002)(2906002)(86362001)(8936002)(4744005)(53546011)(76116006)(6506007)(7416002)(5660300002)(66556008)(66476007)(64756008)(66446008)(66946007)(478600001)(52536014)(6916009)(7696005)(186003)(8676002)(26005)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NXdpVXVtb1o0MWtaNzVlSGFDTDFKdFMxYXYwV2xUKzFSSGwyMWlkempneWt3?=
 =?utf-8?B?ZFQ1b3hDR3FuVDZXTmxDalhmek0zeEIxK0VWMWI3VVVGTkFlcUNudFhKWlhj?=
 =?utf-8?B?aXFzMHR3dHcvenNDRG9CemVNQ3Z3YUVrSWVJazUvbTFtWXVlaEVmOFg1aEk0?=
 =?utf-8?B?blNzZWY4K3VtRDU3RXI2ci9oMDhQdDJWSmcya3NvL3FMNHRnU0taNjMvNkNi?=
 =?utf-8?B?S3YxYjdrbVhLTU1YTllESVZOUlIyZWUvUkc4Z2RXMXNwNHp2dEtRVHR0YjN4?=
 =?utf-8?B?R3k3aVpyaU9peWJIQlUyazVuRFN6Z2lxeUdnR3ZlYjNaR3cxQWtqTllzeUJo?=
 =?utf-8?B?Ukl3UDkyeGtnWW91bGRncDFmT1ZDUlVWV0RWb09ucyszMStkSkVjZkQ1enRr?=
 =?utf-8?B?enNYdmVCUUlVdFJFZFQ1RHlmRzNnUjdHWmt0ZW5xOW5Gb25SdmdoS092dTJ4?=
 =?utf-8?B?aDZDcTJxcmorR3ZZdU53VnZSdDQ0dmRNZTBXcDcxaEgrK2lVaUM3akY1NXl3?=
 =?utf-8?B?a1VQcWVvQjhDVHRtRDdWOE03REhXNHlyMjhlanlKdXZzc3ppY1Bpc2Q0QUJ3?=
 =?utf-8?B?Mkh1ZEhCVFlhZDNxS0htZ3U0VzF4bjZJY1RoUSs3MW92bmt6NTIvK0U5eDlC?=
 =?utf-8?B?MjJsSy9maGhKK0E0bms5WWRUWCtURUl4RjFyOGd2a3ZnVno3UlFLYUxMM3Jm?=
 =?utf-8?B?eUUrTlQ2SlNGZDhVR0dBZlkvclhuTjF6SFlvNWFxc0d4eHpQTnpuQzdtdDhD?=
 =?utf-8?B?T2dLaWJHeFBPWm94Rm85NzhoN2dManlvVUxkZTBIbVVWQnlseTdpbGcwNHJo?=
 =?utf-8?B?b0JwbTVjN3h6eFZaVE9MT1lVcVF2NFd3cmwreUZMUnVFeU1SbWVmUGFrZEVN?=
 =?utf-8?B?NWFCaWIwdU9oUjVSUisrSjNqS3FpbFJPZnMveGMvTG8zbE9MbUVnVTRjbC9C?=
 =?utf-8?B?eGw0WFE0Z3NERStHVUU4b3RyOEJ4L2RjZlVaSXpqQVZZYmRjN2Q3clBLRDNR?=
 =?utf-8?B?YnlhR3QwbDV1Uld0MDZ3bHdtVHhUMTdVU1V6cmxrR0NOWXQyWHNOdnlncDJW?=
 =?utf-8?B?bitXKzNia0JDUFlkYWVCZ0xSQTFodWtEMk82VkNVSDJVdEhEWWpUS0V3eDdZ?=
 =?utf-8?B?QnBBNzlkRHZRbXpaelE2U0RIN0dpZUg0SDJDdjI1TnBFdEozQkFpcGdTUGQr?=
 =?utf-8?B?REpSYnVxcGFBdVVRV0JZdTcwSFgrWG5sVGw3UGpGSml1amNjS3VHK0NHYTda?=
 =?utf-8?B?SjFObTlFRW5BWFdEajVIZ2lwVndESGx2N1NHSmpLR0haVHZZVzMyMUNnck1i?=
 =?utf-8?Q?mFnercRit5O2g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR02MB6774.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa82b55-cee2-4536-c027-08d897b50f37
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 17:58:37.2653 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rNyaTFhM/9eiDQknZ1fkn0GWci6nQ+3WS0iuaNwr55z6zdAyWos2gexOWdDhZ6t/aheD2N2AuUpjboZ9xvJ5Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6232
Received-SPF: pass client-ip=40.107.243.42; envelope-from=saipava@xilinx.com;
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

SGkgUGV0ZXIsDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBldGVyIE1h
eWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4NCj4gU2VudDogVHVlc2RheSwgRGVjZW1i
ZXIgMSwgMjAyMCA0OjU3IFBNDQo+IFRvOiBTYWkgUGF2YW4gQm9kZHUgPHNhaXBhdmFAeGlsaW54
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
cyA8cWVtdS1kZXZlbEBub25nbnUub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxNCAzLzRd
IHVzYjogeGxueC11c2Itc3Vic3lzdGVtOiBBZGQgeGlsaW54IHVzYg0KPiBzdWJzeXN0ZW0NCj4g
DQo+IE9uIFR1ZSwgMSBEZWMgMjAyMCBhdCAwODozNCwgU2FpIFBhdmFuIEJvZGR1IDxzYWkucGF2
YW4uYm9kZHVAeGlsaW54LmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPiBUaGlzIG1vZGVsIGlzIGEg
dG9wIGxldmVsIGludGVncmF0aW9uIHdyYXBwZXIgZm9yIGhjZC1kd2MzIGFuZA0KPiA+IHZlcnNh
bC11c2IyLWN0cmwtcmVncyBtb2R1bGVzLCB0aGlzIGlzIHVzZWQgYnkgeGlsaW54IHZlcnNhbCBz
b2MncyBhbmQNCj4gPiBmdXR1cmUgeGlsaW54IHVzYiBzdWJzeXN0ZW1zIHdvdWxkIGFsc28gYmUg
cGFydCBvZiBpdC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNhaSBQYXZhbiBCb2RkdSA8c2Fp
LnBhdmFuLmJvZGR1QHhpbGlueC5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogUGV0ZXIgTWF5ZGVs
bCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KW1NhaSBQYXZhbiBCb2RkdV0gVGhhbmtzIGZv
ciB0aGUgcmV2aWV3Lg0KDQpSZWdhcmRzLA0KU2FpIFBhdmFuDQo+IA0KPiB0aGFua3MNCj4gLS0g
UE1NDQo=

