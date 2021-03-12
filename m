Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AA93388B9
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:32:29 +0100 (CET)
Received: from localhost ([::1]:59248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKe9k-0006o1-AY
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lKbQ0-0007gX-I9
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:37:04 -0500
Received: from esa5.fujitsucc.c3s2.iphmx.com ([68.232.159.76]:23313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lKbPy-0001pv-Mn
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:37:04 -0500
IronPort-SDR: b5bhvvgnijyguus9+8MnW5wCLfiUDCLFhRDWF5XIIuWK/vu7+N3wzCLjF4/PzEu4n5dRcLkeOu
 1pR7shCsXczl9rgarTHxzPuMslibBk4Wni4MoKP8bQOXRVK1gHV2FP2xjo48abiH983ES2aD+V
 MMhx6qpH1dQ0PrwrWKOsB3Wd64GIVqfkzHXMy8uSWX5O3NUZCEvytboLH0zSG/7eU7n5xfJPvp
 UpwyJqDEf6hK6FHHZOUpRoQS4i9JmNVQU7dHukgMieslzP1+dRxuCEHgybXiNdTdht/yHSXGq1
 5Vg=
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="27761047"
X-IronPort-AV: E=Sophos;i="5.81,242,1610377200"; d="scan'208";a="27761047"
Received: from mail-sg2apc01lp2053.outbound.protection.outlook.com (HELO
 APC01-SG2-obe.outbound.protection.outlook.com) ([104.47.125.53])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 15:36:59 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXXRA3pNBootb7I/S9GVR6Keps4R/NIH5H0KEONN4UpmboD9loYCYG6cWdd2D/Mmc+HgfLLzd1CpHHmjhZA7jIZHt0Ar4gXfFXkCqMhnyXKYiKNQZ/ArITxsc/cTOLIWKjYPavyaVFj5NW5wNtWsxOGCg3gtOMw2RBvjcWYVs7FJ5NdVlq5rlNfREfliZXR+z/wPDGSybS9qSQmSugvcVchGW+iZVsrxfnxZIfg4NT29+8Q3F2eNtQFiDVaT+NramryTYFfboiUZ3dPDJKvJoSpPsbOc2hiX4d582pF+FsvgmGpG2gi+WDpCAogsfehq7r3tE7Il+l/1VjT3FeSQrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/Ip6dB4A7V48U8SYhm3MIVLNdAr918kSArT5S5G8AI=;
 b=IMowm0s2DIbo8rUVP9t0BbctfSazVweLSeoib6FtxJ80gP/WR+F3NlMIzhrBv8zTHa5QCfzU7K+W+PLZ93Pt1IGJgCTY2YaykMvIZVGj0FjLNfdUs8r8IXDvpp67N6jDP6D5sF9rojfVnlvQxYB/EjWyH3Jr1eazNzcSipEYnsP91lBfQFppgPQ03cuZy4XbYR8zYWT0AA2Dsf3Ie+NVO/IWYOWRvBm5Z9n6KIHTfYtgpwor/jg75yHQiHfIjvS6gHFVIjg0/J4zDlQsvMdIyH12VUDP++Tvpw9YC7DxCn2GltvouOAOweynRB4+uXshESjtwTs51nkSceETSz1teQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/Ip6dB4A7V48U8SYhm3MIVLNdAr918kSArT5S5G8AI=;
 b=ftyQ+PpoFyTRVsgURKoRkXo9/Z1MsYTLaZ/lCgs2vNTupIZuissjH5Dwyt8hQG+FtlkDnVG92NjG1+iGZb5iZJAdcC21YMizoJWsdgIS1hLW2Ob3MDXLEy8rocrOn7paOxBZKeCNSnvT60zPUVEL7pHiU1QUksk3EfqMRVWmw9w=
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com (2603:1096:404:6b::12)
 by TY2PR01MB2330.jpnprd01.prod.outlook.com (2603:1096:404:74::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Fri, 12 Mar
 2021 06:36:56 +0000
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::d9a8:f990:73a0:c21a]) by TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::d9a8:f990:73a0:c21a%3]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 06:36:56 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: leirao <lei.rao@intel.com>, "chen.zhang@intel.com" <chen.zhang@intel.com>, 
 "jasowang@redhat.com" <jasowang@redhat.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "lukasstraub2@web.de"
 <lukasstraub2@web.de>
Subject: Re: [PATCH v2 03/10] Optimize the function of filter_send
Thread-Topic: [PATCH v2 03/10] Optimize the function of filter_send
Thread-Index: AQHXFwAzm5T/OBSlxkOOh2ec4WiWIqp/5ikA
Date: Fri, 12 Mar 2021 06:36:56 +0000
Message-ID: <6bd2cb74-c0c9-8ed5-e059-9b9ea5ec5d04@fujitsu.com>
References: <1615525383-59071-1-git-send-email-lei.rao@intel.com>
 <1615525383-59071-4-git-send-email-lei.rao@intel.com>
In-Reply-To: <1615525383-59071-4-git-send-email-lei.rao@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ddbcc4ee-ad7d-48a3-dc4e-08d8e5213b77
x-ms-traffictypediagnostic: TY2PR01MB2330:
x-microsoft-antispam-prvs: <TY2PR01MB23306CC6B72898660F07935DA56F9@TY2PR01MB2330.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /WwYn2c05Nv/A26QHfQmT1TFmcUSVHFdzuxJVVHwOv0j0seGai3Uv2mc84FVsjF9rw+fjpHHM/bmLgAJ2ZiZgpYQhkAsvlfU7qz+azfh5ojzvJgauQYCSyX9+KgeTZtCDlWd0urF39XsGBhSh5fQf8ol7e/joac71oDhyLsXVB9aaJNMasM2XfemLNuCzXPyhPA1/mhsbscNsVtot0rZ1PoNYDQFh06ZKBNrWR84RST7a2OBTeKL2hLBNFWUZOtB1zx1Vcrj6Px57Bk15YMtYKgxNPnppORQs4W6Sci8w4NKkgoYZ/GHP8fS5NyRbWFSQFyyDlf3CkdovmC3kDAjElQXoLfwYaKtXrBpR6TjNM4ZnzaUCpZWsQ6q8Y9ZLqqQHsx07oNT/jey3nXVqxOiogcsC7yZ+HDdWWETblgiNPViVklbZu3Qa9c7kDeHT2hW1q0nzmrTi7i3jG2X2CvjSP/ju1vL+8jDloT8+U6qMeCJE2MjsV8AANJ87Vs8mHAFgt8/JJ+Mfe/GGdyMndsTz1EcXP/gDusWe3oXeIA6N2gqa881DlnCkWJDpN6yMnCnh217OMRrOFL4q4v2MviNIA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB2571.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(66556008)(316002)(6512007)(8676002)(31686004)(2616005)(478600001)(4326008)(5660300002)(26005)(186003)(110136005)(6506007)(6486002)(86362001)(53546011)(31696002)(76116006)(91956017)(66476007)(71200400001)(66446008)(66946007)(8936002)(36756003)(83380400001)(85182001)(64756008)(2906002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?UUFvNUJRZFRYQWNaVHlTSjNQRGI5NTlpeGh0T3ZzY3FsMVJkdlNXOHh5M25l?=
 =?gb2312?B?OWVrVDNYRXVHbXNoR3hXYWF0bXUyMHpUWXh2WGpvc0k1UmVZaFZ1ck5NaHk4?=
 =?gb2312?B?cFY0K2VBKzJYeDN4SUJLeDJ1QzFvLzZaMWg3VU41T1NRTDVQdjAvL050bkJP?=
 =?gb2312?B?Z0Zpa005eUlCdWkzdFUvNXUza01SNkFaUXJ4UnJOZlp2SEEvSlNPUkMwWDVC?=
 =?gb2312?B?bHl4ZWFBd2dSbmVkYnNLMlEyNk9BWjdsN2tBODVwdUFYNkl5eWp4dVZDREkr?=
 =?gb2312?B?SUpwWWp5Z0g3a0FldXVuUVp0VzVOSlAzbGVjQUtkWFVhcGpqZVRCdTRYL3Ji?=
 =?gb2312?B?TWdOQWQyVC84Rkd0MnZZSXpZWi9nazhEdUZrVHNXVUpTdTBOdjRmdzZiMHUz?=
 =?gb2312?B?eWJ3QXpKRm8xcDFOcVM3bWRXYWJRSjducUlSSllVRk13WEtIOTBnUEkyYitH?=
 =?gb2312?B?d0w5dkZLUWcxWG8xTFdZM3EwenVmVEVwamp5TGM2R0lDL1B4SjlMY0FMcnJD?=
 =?gb2312?B?ZytlRXhuZVNlZWlpcXQyNWhVR2p3RFRHVFZKMVFGWXZQV0Z3WnNRRXVmcTdI?=
 =?gb2312?B?dnk2QVdMWURDVXV2ZUtWYWV4OXUvdFFobXZETE1sWGRMK0NQZS80d0FaZE5F?=
 =?gb2312?B?UmVmc0xMTEdUenEvVWhxekJSK2YvdWREREhVa1E3RFVsMlpEL2k4cWZDcWdu?=
 =?gb2312?B?TmZmU0t6UXg4QlcvVFdYeVd5bUtDajZzSlRPblpYQmQ4YXVVSDNzVTBIalg5?=
 =?gb2312?B?MEcwajljYXJrcFhqd0lUZGZYRXRYbjUvV2FpNHZPVFZEWXh1cW9uRnRBOHRF?=
 =?gb2312?B?UnZ3YUJiWW9vQU40ODZEQ0dqdkluUUVqSWF5UWxrU2lIMVE0OEM5YmQwdFo4?=
 =?gb2312?B?S1ByMS8vejhLSDNqV1ZhVGhpQi9jZldRZWRid1RDUVlwdDN6QTFTdVVuR3B2?=
 =?gb2312?B?SW5nRXVoK2Nra2xvb0V0dDc4Q0NlQ3E2UVNHVkhNL1ZTcHA3amQ1TVhMVkJH?=
 =?gb2312?B?QTdySGQ0NmJoSnBqdFRBalAxVkZUYnZWRThRRGtlclIzRXMyZ2hsYjIwMDkw?=
 =?gb2312?B?OGM2c0E5OXNWSWVCc0JrN0dWV2N1UGwrYTFpWUZUNHNnVDUxd0F0eUlDUElY?=
 =?gb2312?B?NWhvcWI5OVZZaUxhM1VIaHUvWGFvaDhBSnZqU2hRazlxWEtSWjRwOElBV24x?=
 =?gb2312?B?aXJ1c0hhUCtHa01XWVlFbzZlR0xyMGRlMW55cjF3K296WXdmRlpQeFpQUGN0?=
 =?gb2312?B?Z21Tc0hkd1BCWXZwT0J0S3dNdmxYNWl2ME44V1B1d2tzcEpkbGtNYUYrVVVX?=
 =?gb2312?B?L2dvbzBRcFRuNzFoYU81VWtSc0MwYUFRUXJiQ0NvZnQ1Nm1QS3pLWmRDU0h5?=
 =?gb2312?B?ejFtaWRxWlBPOEZlbmJGMTJBa2EzTUtqK0RnaVJrdjlpQWZQWkpJUHFyQ01V?=
 =?gb2312?B?alRMR2ppQk4wajdPQWd5ZHdoeFQ0RTFBSTQwZUlGNlM5dU82bzR6YnVXaHFH?=
 =?gb2312?B?NWNabURQSVhYcVdNVEZVUkdWdjA1QjgrU3BybXZXSlltVldKb2JDZEtRSkxX?=
 =?gb2312?B?TzMvZklzS2hRdDZuVHAvanlici9QRjRpN3JHOGdwazZWbjdBOGhYakNDWEVP?=
 =?gb2312?B?enVOdnFxWmdlRERTYzVIT1NSUzh4RitjdGEvNGpCQXoyd0dvc1lNc24vMDFu?=
 =?gb2312?B?SVNYQUxjUk9EY1hMNGtzR2RtVU5LMGVGWHBWczBNNWpBQmpIUlRpbmRmTzVa?=
 =?gb2312?Q?SESC4GUzlquzEEPmYVMlaE8rQyeG0D5NIQZGgxV?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-ID: <0CEDF2697950C64DAC1A2BAA855B2BA3@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB2571.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddbcc4ee-ad7d-48a3-dc4e-08d8e5213b77
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 06:36:56.6428 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BUIWYik0QCz1CYKJHArngnELIC/mbjS+wclTLMjwcheiEaAjHbT/n8xD4MsqUq5MJf4hAIRHNA7tClbij81Jxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2330
Received-SPF: pass client-ip=68.232.159.76; envelope-from=lizhijian@fujitsu.com;
 helo=esa5.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 12 Mar 2021 04:24:43 -0500
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCk9uIDMvMTIvMjEgMTowMiBQTSwgbGVpcmFvIHdyb3RlOg0KPiBGcm9tOiAiUmFvLCBMZWki
IDxsZWkucmFvQGludGVsLmNvbT4NCj4NCj4gVGhlIGlvdl9zaXplIGhhcyBiZWVuIGNhbGN1bGF0
ZWQgaW4gZmlsdGVyX3NlbmQoKS4gd2UgY2FuIGRpcmVjdGx5DQo+IHJldHVybiB0aGUgc2l6ZS5J
biB0aGlzIHdheSwgdGhpcyBpcyBubyBuZWVkIHRvIHJlcGVhdCBjYWxjdWxhdGlvbnMNCj4gaW4g
ZmlsdGVyX3JlZGlyZWN0b3JfcmVjZWl2ZV9pb3YoKTsNCj4NCj4gU2lnbmVkLW9mZi1ieTogTGVp
IFJhbyA8bGVpLnJhb0BpbnRlbC5jb20+DQpSZXZpZXdlZC1ieTogTGkgWmhpamlhbiA8bGl6aGlq
aWFuQGZ1aml0c3UuY29tPg0KDQo+IC0tLQ0KPiAgIG5ldC9maWx0ZXItbWlycm9yLmMgfCA4ICsr
KystLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkNCj4NCj4gZGlmZiAtLWdpdCBhL25ldC9maWx0ZXItbWlycm9yLmMgYi9uZXQvZmlsdGVyLW1p
cnJvci5jDQo+IGluZGV4IGY4ZTY1MDAuLmYyMDI0MGMgMTAwNjQ0DQo+IC0tLSBhL25ldC9maWx0
ZXItbWlycm9yLmMNCj4gKysrIGIvbmV0L2ZpbHRlci1taXJyb3IuYw0KPiBAQCAtODgsNyArODgs
NyBAQCBzdGF0aWMgaW50IGZpbHRlcl9zZW5kKE1pcnJvclN0YXRlICpzLA0KPiAgICAgICAgICAg
Z290byBlcnI7DQo+ICAgICAgIH0NCj4gICANCj4gLSAgICByZXR1cm4gMDsNCj4gKyAgICByZXR1
cm4gc2l6ZTsNCj4gICANCj4gICBlcnI6DQo+ICAgICAgIHJldHVybiByZXQgPCAwID8gcmV0IDog
LUVJTzsNCj4gQEAgLTE1OSw3ICsxNTksNyBAQCBzdGF0aWMgc3NpemVfdCBmaWx0ZXJfbWlycm9y
X3JlY2VpdmVfaW92KE5ldEZpbHRlclN0YXRlICpuZiwNCj4gICAgICAgaW50IHJldDsNCj4gICAN
Cj4gICAgICAgcmV0ID0gZmlsdGVyX3NlbmQocywgaW92LCBpb3ZjbnQpOw0KPiAtICAgIGlmIChy
ZXQpIHsNCj4gKyAgICBpZiAocmV0IDwgMCkgew0KPiAgICAgICAgICAgZXJyb3JfcmVwb3J0KCJm
aWx0ZXIgbWlycm9yIHNlbmQgZmFpbGVkKCVzKSIsIHN0cmVycm9yKC1yZXQpKTsNCj4gICAgICAg
fQ0KPiAgIA0KPiBAQCAtMTgyLDEwICsxODIsMTAgQEAgc3RhdGljIHNzaXplX3QgZmlsdGVyX3Jl
ZGlyZWN0b3JfcmVjZWl2ZV9pb3YoTmV0RmlsdGVyU3RhdGUgKm5mLA0KPiAgIA0KPiAgICAgICBp
ZiAocWVtdV9jaHJfZmVfYmFja2VuZF9jb25uZWN0ZWQoJnMtPmNocl9vdXQpKSB7DQo+ICAgICAg
ICAgICByZXQgPSBmaWx0ZXJfc2VuZChzLCBpb3YsIGlvdmNudCk7DQo+IC0gICAgICAgIGlmIChy
ZXQpIHsNCj4gKyAgICAgICAgaWYgKHJldCA8IDApIHsNCj4gICAgICAgICAgICAgICBlcnJvcl9y
ZXBvcnQoImZpbHRlciByZWRpcmVjdG9yIHNlbmQgZmFpbGVkKCVzKSIsIHN0cmVycm9yKC1yZXQp
KTsNCj4gICAgICAgICAgIH0NCj4gLSAgICAgICAgcmV0dXJuIGlvdl9zaXplKGlvdiwgaW92Y250
KTsNCj4gKyAgICAgICAgcmV0dXJuIHJldDsNCj4gICAgICAgfSBlbHNlIHsNCj4gICAgICAgICAg
IHJldHVybiAwOw0KPiAgICAgICB9DQo=

