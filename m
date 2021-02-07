Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB9D3122F9
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 10:08:16 +0100 (CET)
Received: from localhost ([::1]:57678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8g3D-0006ml-24
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 04:08:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1l8g0W-0006Fz-Vj
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 04:05:33 -0500
Received: from mga06.intel.com ([134.134.136.31]:48790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1l8g0T-0008Vh-Uk
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 04:05:28 -0500
IronPort-SDR: bxyLpmu+vCPBgF5xy7wr0JLmlh9ljZZQ9gBohOlu7yB8yElPOLuS+AkC+ns0EYcsriTyOETRb/
 oQSURCqO1nig==
X-IronPort-AV: E=McAfee;i="6000,8403,9887"; a="243094836"
X-IronPort-AV: E=Sophos;i="5.81,159,1610438400"; d="scan'208";a="243094836"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 01:05:16 -0800
IronPort-SDR: QhOg3EZDQShNvPcBe0sT9/WkB4UkQzrl7AF4sZoct/x2p/stimxeYOCeq6cSimODRyEncihDqI
 PLjpMcRGwNXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,159,1610438400"; d="scan'208";a="398045648"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 07 Feb 2021 01:05:16 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 7 Feb 2021 01:05:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 7 Feb 2021 01:05:16 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Sun, 7 Feb 2021 01:05:16 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 7 Feb 2021 01:04:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAX6l9GRSrNp9wUQ8bBX6kCK7LIH47Ac29XOVL2+EeRZe1umRVg1mDB0hDc91w+E0D3PfO0OJ7PPvsDYgKBh7C120spgXPB8VSp8U1cu6mbOTBlSndNpkAGr7CcBx2ST4AfXDjcqEtRszUpZ68Q5aFtckWeQepNG167xe1hPSwnElKhmrw49g8qUopFEXqdePFY5t4F2KzJ07BP0RKzOiZw2oQ3Y3lr0gX7V/SaDsWbNCSvk/zoNEY+PIlSweoRdj9OT8WW1axC+iQuSbhSelMYHoXdG3AY4JY20cW9VdFzirkOlPPc0jZEDLnqcdzlNTjUXiDPtRo7TrPDrmQa0yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpmjmHZnr+id3GDTPmjQytQ8yxoM5irsOdO9secj/ws=;
 b=JdupANdp44Oba56rILDh8IwsTM5Z9IEJdTXxtac4GhKu/pRbbmbBXa8Fa+yEoePkgaWEpLURZ6D39wEq2CbsviRf4uN/J0BKA/Gcb+HEcR+3enAN8XJO8ivDVfW9qI2VooKwMn66LYRBMmBj10yRMXZcuibfdwX+Exg795cZ61T+wxAmqaS8Oz6Tr6Ep0R/38O189rxpbzSZx3SXG0tqgBLAqEZ0BA3OqO3VftGKK4pxtLkJG5rFW/zoLJrByhDdWAwiYNUXCffcL/FYVTvTPBO2UZguimDcJxBz66n/HGIQBpjqo1sd4M9CZArjNmCj74JDtWyheC6Pj4zM8Bnw0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpmjmHZnr+id3GDTPmjQytQ8yxoM5irsOdO9secj/ws=;
 b=fNAVWIikTGotWJyX3azYoJKv7A6GTr232Mzq0hB454tbz0qcLMYdTI70mBJtJ8eKlE7W4Z+y189sOLhTz+UM44KNfgg7tup7U4GgF2oFngfj5B9RmqDbHECWMZfAFnilxEO5BXJOeuEiFab2DhnmTPWJfdqDPQV0igFWiXb72hs=
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MWHPR11MB1935.namprd11.prod.outlook.com (2603:10b6:300:10c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Sun, 7 Feb
 2021 09:04:55 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46%6]) with mapi id 15.20.3825.029; Sun, 7 Feb 2021
 09:04:55 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Peter Xu <peterx@redhat.com>, Auger Eric <eric.auger@redhat.com>
Subject: RE: [PATCH] vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support
Thread-Topic: [PATCH] vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support
Thread-Index: AQHW+y09pBuC5UAtHkqkqUwosYfN/KpI5EiAgABYhoCAAHSvgIACskUA
Date: Sun, 7 Feb 2021 09:04:55 +0000
Message-ID: <MWHPR11MB1886DACA066190C94FD2C27F8CB09@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <20210204191228.187550-1-peterx@redhat.com>
 <2382a93d-41c1-24fd-144f-87ee18171bc9@redhat.com>
 <213acf9a-d1c0-3a1d-4846-877d90fadc03@redhat.com>
 <20210205153107.GX6468@xz-x1>
In-Reply-To: <20210205153107.GX6468@xz-x1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.202]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a109bb99-31ad-4322-f1a0-08d8cb476fe8
x-ms-traffictypediagnostic: MWHPR11MB1935:
x-microsoft-antispam-prvs: <MWHPR11MB1935D15D072FC36AB8C2B7928CB09@MWHPR11MB1935.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RT1FaoRMpCvF6HBffBW8nZGs6z840LrFGA2B14UTAeS2SwkZaMO7DkHtaZniWd2BTLbcLHt01fsh8jOvfLCwZgrdcGQYFoSNbqCRDgkVPhM05Ko9oLoEopeltiXBKsYoJvidg78e5Ssle1vKCUNIZN8oHXyhXsZlc35ZWXPQYtQaYILZvrj6E1S2t6WCNrwo7/qLMlmK6X5n+SQqm+uEIuX0P3DqUkXke4zZ8jrIjYqCzh7PZITZI6F/T+xUsADt0RnQztAbGYeBic1CCG2Qutb0Vwp4Z+EHIskGKVK6Jwtrjq5TZLyxA81ayRZ0W+68wX7pUJWJ7+6/EgMry0Znj07kBSkhQTFnJOTqQ96q583RuIqKlaHP2KLn6k7hxMwD5ErQ9w7wC/VBXl2r1+Cy5gDctKARXX1tle0zxELGd/j8oICOiIv/eF2DbCkIcbAYJnMx1WL2FQcVqJr6/KcOXtUIoXaopSALpAaS5qSqtdMg7hxLWPuXlUMWto2kTTg6c3I03EspKTWlfdujMupEXw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1886.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(136003)(39860400002)(376002)(366004)(316002)(186003)(52536014)(54906003)(86362001)(6506007)(5660300002)(110136005)(33656002)(71200400001)(66946007)(478600001)(8676002)(9686003)(55016002)(66446008)(64756008)(66556008)(26005)(66476007)(83380400001)(7696005)(4326008)(2906002)(76116006)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?V3o0azlzT1Q1SzZndjVCb2RyNGs1VitmYnRlNmptZW02UXhYeFdLNTZ2NWs3?=
 =?utf-8?B?a3F5cEhLNFNyZWYyV2hYMDY5OXE4aURMeXFORnBFMlRLazdsaDNyMjVib3Yw?=
 =?utf-8?B?YjV0eGp2cHlYNXBUT00ycEk0RnB6Q3JVUEZ4NWhzVkYwRGhWVVRzVWVaNFAv?=
 =?utf-8?B?ME9JL21XQTNjTVVzL1MzVFJCWVg1dE91NDJMTENSTk0vN1BCWnBzVGlVckR3?=
 =?utf-8?B?WXhKNjd1RklHR1dBSExFV1FKWktsQlZTVnArZmdYNXVxSGZ5OHhPeFV2M2VK?=
 =?utf-8?B?V0k2NnorRVFNakdYeXFKZ0FUdmR1bE56TkJ4RXd0K1pvSVlmQkxKNU9HRTBG?=
 =?utf-8?B?R0R0TGtWZ3BnSmc3ZTVwZ1R5amZudkFtOERpVkhGQ0s0U0xaV2E5ZzhiYnBS?=
 =?utf-8?B?Yi9uZzdMMDhURW5yZmxhMVJHeW5qZk9OZXEvZ2h3Q1JlRHVjMFdHbkpxMWQ0?=
 =?utf-8?B?QndrUTVCMU05b2FoTWVzR2ZEUWZtaGpta2dnYUhGY2dtQlVzU0VlSkYxYVcw?=
 =?utf-8?B?eTNnbFp0ZDVvMXE1aStMaWtVS1ZtTWE0a0lMWUVlZ2xGYUthcVlqeWdVeThs?=
 =?utf-8?B?UGIzTHZCOFIzMU5RaS93WDlXLzViMWRoeVlXWCthdmlYWWJWVk1uVFFGSjRL?=
 =?utf-8?B?TndEV1JMakZvN0NrWjQ5bGQzZ2FRR29xOVBMSW42VnBpMVRzclpxUENTR0k3?=
 =?utf-8?B?akRzbjFnb1I5Rm1YMlptQjFDazJCMFI3Q0JYRzh1Y3NHWktDZnQwVFBkdWZP?=
 =?utf-8?B?Z2VVSTI3cWJNRStnKzhhNDU3cWZTRzBkc3duL2tsSGtBTzhaaGVOVkhGSldO?=
 =?utf-8?B?RG9Yck1VclcxRlR1M0FhcTRzZFdZbEkzZmhpd2c2YlpqRFVaZXR2TWM0QVZD?=
 =?utf-8?B?bkRyV2FsWjZBV3VDL01CY2tnR3Z4Q2drdnBnckxzOHlzRWVQaUVjbUhuK3lI?=
 =?utf-8?B?QTZaQjByV1Q1NFF2UXB2TnFMS0VwL3IxZVU1ZjZpNXhZd3pNTTJFeHZ4MGxh?=
 =?utf-8?B?TmJtWEJzZ0pET3o0TzZrd0hic0VSQ1d6VzUrV2tHbVRuRGV1UDNxL2RDK3hw?=
 =?utf-8?B?YjE1ZElqY0Yzc0VnMnp5bmRmejFEZnM0QmUxMDZMbkVMQTZYdzFlRDZpYkt4?=
 =?utf-8?B?R2RNOHFab0JNK01RWDBmMWxaVWdhWVA4RThySmlxY0xEQmVOUncyMFNiVFdK?=
 =?utf-8?B?Z0RCZ3BCdWxPaCtEZTRIQmdyZ3BzWVhyVHpWWUhmN2NheXNReUFKWDVrNWg1?=
 =?utf-8?B?QXNCYTFFcjZRTlNyNFFwT0dkYTdiZjZMaXFYRGdwZnQ1SGJoRTlEM3hPYjJ1?=
 =?utf-8?B?Z1lhcFd4b0U1ZVV5cE9kVWFWOHorL2ZwRzBKc1UvU0ZTdnpHZW5iamtYcDBp?=
 =?utf-8?B?Y0RXdWRzRkZQQVNuQTRIVjRsUnd0OEllbHVOcklsc0MwYTArV3o2a2FCaGs4?=
 =?utf-8?B?WHhVbXFDb1ZmUzFBUDBzV1VmSjFFOUMvbFVVWkdGQklMTzJhMUt2QzdLZGFn?=
 =?utf-8?B?UFkxajNKUGFvYjFaOFEzbU9WSGdsRWdlbzVBOWhweWJKNEhSSEk1RnEwYStN?=
 =?utf-8?B?SUdtQmtmYmsrMVJMQmx5S2E3d3lIV3d0TG1NcUU5RUkzalllQmFmODJGTmlV?=
 =?utf-8?B?KyswNU9IclhNRmlQVTlxQXNpcVNpQzRPWGVUalIyN0tyY25nUS95RldzdUVv?=
 =?utf-8?B?UlVjTGdma2JnQm9UWDVKb1pySnZ3SzVuelVtUlduTkZCVndUcTVQQ0pCTER2?=
 =?utf-8?Q?wPVhyFpZDMCA3FT4Betk4ugXZR9/+r6JaiR4QVO?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a109bb99-31ad-4322-f1a0-08d8cb476fe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2021 09:04:55.1389 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1elN2PmbF4R5iiwL+w70oKqhKWLkI8kPUtCE6BJSrAWJ6h19TIxE2GNXM5MlalWkdOrYtbr4M+kzQPxsf1FoFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1935
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31; envelope-from=kevin.tian@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Jean-Philippe Brucker <Jean-Philippe.Brucker@arm.com>, Eugenio Perez
 Martin <eperezma@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBGcm9tOiBQZXRlciBYdQ0KPiBTZW50OiBGcmlkYXksIEZlYnJ1YXJ5IDUsIDIwMjEgMTE6MzEg
UE0NCj4gDQo+ID4gPg0KPiA+ID4NCj4gPiA+PiBvciB2aXJ0aW8taW9tbXUNCj4gPiA+PiBzaW5j
ZSBkZXYtaW90bGIgKG9yIFBDSWUgQVRTKQ0KPiA+ID4NCj4gPiA+DQo+ID4gPiBXZSBtYXkgbmVl
ZCB0byBhZGQgdGhpcyBpbiB0aGUgZnV0dXJlLg0KPiA+IGFkZGVkIEplYW4tUGhpbGlwcGUgaW4g
Q0MNCj4gDQo+IFNvIHRoYXQncyB0aGUgcGFydCBJJ20gdW5zdXJlIGFib3V0Li4gIFNpbmNlIGV2
ZXJ5Ym9keSBpcyBjY2VkIHNvIG1heWJlIGdvb2QNCj4gdGltZSB0byBhc2suIDopDQo+IA0KPiBU
aGUgdGhpbmcgaXMgSSdtIHN0aWxsIG5vdCBjbGVhciBvbiB3aGV0aGVyIGRldi1pb3RsYiBpcyB1
c2VmdWwgZm9yIGEgZnVsbA0KPiBlbXVsYXRpb24gZW52aXJvbm1lbnQgYW5kIGhvdyB0aGF0IHNo
b3VsZCBkaWZmZXIgZnJvbSBhIG5vcm1hbCBpb3RsYiwgc2luY2UNCj4gYWZ0ZXIgYWxsIG5vcm1h
bCBpb3RsYiB3aWxsIGJlIGF0dGFjaGVkIHdpdGggZGV2aWNlIGluZm9ybWF0aW9uIHRvby4NCg0K
ZGV2LWlvdGxiIGlzIHVzZWZ1bCBpbiB0d28gbWFubmVycy4gRmlyc3QsIGl0J3MgYSBmdW5jdGlv
bmFsIHByZXJlcXVpc2l0ZSBmb3INCnN1cHBvcnRpbmcgSS9PIHBhZ2UgZmF1bHRzLiBTZWNvbmQs
IGl0IGhhcyBwZXJmb3JtYW5jZSBiZW5lZml0IGFzIHlvdSBkb24ndA0KbmVlZCB0byBjb250ZW5k
IHRoZSBsb2NrIG9mIGdsb2JhbCBpb3RsYi4NCg0KPiANCj4gRm9yIHJlYWwgaGFyZHdhcmVzLCB0
aGV5IG1ha2Ugc2Vuc2UgYmVjYXVzZSB0aGV5IGFzayBmb3IgdHdvIHRoaW5nczogaW90bGIgaXMN
Cj4gZm9yIElPTU1VLCBidXQgZGV2LWlvdGxiIGlzIGZvciB0aGUgZGV2aWNlIGNhY2hlLiAgRm9y
IGVtdWxhdGlvbg0KPiBlbnZpcm9ubWVudA0KPiAodmlydGlvLWlvbW11IGlzIHRoZSBjYXNlKSBk
byB3ZSByZWFsbHkgbmVlZCB0aGF0IGNvbXBsZXhpdHk/DQo+IA0KPiBOb3RlIHRoYXQgZXZlbiBp
ZiB0aGVyZSdyZSBhc3NpZ25lZCBkZXZpY2VzIHVuZGVyIHZpcnRpby1pb21tdSBpbiB0aGUgZnV0
dXJlLA0KPiB3ZSBjYW4gc3RpbGwgaXNvbGF0ZSB0aGF0IGFuZCBpaXVjIHdlIGNhbiBlYXNpbHkg
Y29udmVydCBhbiBpb3RsYiAoZnJvbQ0KPiB2aXJ0aW8taW9tbXUpIGludG8gYSBoYXJkd2FyZSBJ
T01NVSBkZXYtaW90bGIgbm8gbWF0dGVyIHdoYXQgdHlwZSBvZg0KPiBJT01NVSBpcw0KPiB1bmRl
cm5lYXRoIHRoZSB2SU9NTVUuDQo+IA0KDQpEaWRuJ3QgZ2V0IHRoaXMgcG9pbnQuIEhhcmR3YXJl
IGRldi1pb3RsYiBpcyB1cGRhdGVkIGJ5IGhhcmR3YXJlIChiZXR3ZWVuDQp0aGUgZGV2aWNlIGFu
ZCB0aGUgSU9NTVUpLiBIb3cgY291bGQgc29mdHdhcmUgY29udmVydCBhIHZpcnR1YWwgaW90bGIN
CmVudHJ5IGludG8gaGFyZHdhcmUgZGV2LWlvdGxiPw0KDQpUaGFua3MNCktldmluDQo=

