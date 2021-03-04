Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5783332CE00
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 09:02:26 +0100 (CET)
Received: from localhost ([::1]:38194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHiwD-0004BK-EW
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 03:02:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1lHiu9-0003Ul-5k
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 03:00:17 -0500
Received: from mga02.intel.com ([134.134.136.20]:60377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1lHiu0-0005s9-LD
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 03:00:16 -0500
IronPort-SDR: KUvNjisSgaGZen5cTnDkFBZiWF20fJY+is3StjshoQ3y7Jtlcc73jEcTPVj7E8jnTxdt4y7DkT
 IZ0zcs9llmCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="174480469"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; d="scan'208";a="174480469"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 00:00:02 -0800
IronPort-SDR: B3pNn5qMrtKjJPEbd7G6T2k8N0RCG1FeBRYZRGI3U+JYBTXn2UW0DM355uq31DOJ+41VcRuKl0
 InU8kBGmRzRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; d="scan'208";a="384349445"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 04 Mar 2021 00:00:02 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 4 Mar 2021 00:00:02 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 4 Mar 2021 00:00:02 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 4 Mar 2021 00:00:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PdC0i6Ex7ngPuTi7pJkgLxJua8njpUTleGeM/oBLN7nTxdCIXgcqbq9Y4MfH3aQJtwa8BlMEPo0CsMviO2OCyHe8ADhHmSTo7ieZVc2fBBvsiYSuIBthvvgomxxUtISdx9sY1vKK26o3pQSbJqW6z9MNVF4Cbi0HYi38bVghidvEogGMaeOCceJ8MCm8N2ta3SO+7Enl70u4oRmPMJTJj9FnMDOOdCL9uhfuwBHYiRcMfWNjRe3VbDUSDeH40mj3DBzZGW6Mg6GplSxmQXuYlmZqWy2x/E6mVc2KFNYw/h6l5HxK4j1BfDcCp36A09/IJPeVQeOq1qyh7tW2Pw42YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwXebrHljoGzjgYyipV32QDJ5efh1u2q8XvoZqnW66E=;
 b=UWHL6vXgcptYz1eWye78ldyVgT7zbhnRGy08/EB1Wcp97DG30yVEMl0pE56IW7sMdA+BNnCrbG405cYYk0mBMKPeMBLH5vIz2ztTUop7mLdoROSjBLaMdS/2hypbO5aZRySGB0EpzlwTi9hiFWCKqGRQeXAiHn3ZMRadw94TMI+Kov1hduTfpLls14l9Rp0UUGFi5lQ5hw/7cqN6pyirYoXBw1cy2yTB7YNdeV9rerzoVk8zCDQ789yE6aIo9Qf7XNbYoDz0cy4pYyl7NHR56pcSjhA6u807JSmCJBr1zhj4ESRJGhizNe8gg0PF9lLJt4tj9pTdR2kqBycQNOkoTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwXebrHljoGzjgYyipV32QDJ5efh1u2q8XvoZqnW66E=;
 b=yJJU7sbeHtWkbFmBlgkDqg/P5MXO7P9BsK1yoOt0RBB6ErCP3tje3pKwG9SADfKlcj0DGPrTyZNM0aRTZ455Hx1KMvFm2VhRRPSbgNg4VWoZTtA4ve6x8mdwUjlSncSC0ijS1e+GXU8wpza3+AE/I9TsTl2AxbtXCOj4KmGe0LI=
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MWHPR1101MB2173.namprd11.prod.outlook.com (2603:10b6:301:5a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 4 Mar
 2021 07:59:59 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46%6]) with mapi id 15.20.3890.031; Thu, 4 Mar 2021
 07:59:59 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: RE: [PATCH] virtio-iommu: Default to bypass during boot
Thread-Topic: [PATCH] virtio-iommu: Default to bypass during boot
Thread-Index: AQHXBeaUxWke9mdNCkS9tX2R5NO2MqpigkAAgAak/wCAAPcM4IAAVLMAgAkZrsA=
Date: Thu, 4 Mar 2021 07:59:59 +0000
Message-ID: <MWHPR11MB1886A27F398E03030C12E8758C979@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <20210218105929.1433230-1-jean-philippe@linaro.org>
 <20210221064211-mutt-send-email-mst@kernel.org> <YDfatCDUZ3FISPJI@myrica>
 <MWHPR11MB18862C07D1473445DBC42C928C9D9@MWHPR11MB1886.namprd11.prod.outlook.com>
 <YDjw/s+PuZ012GhX@myrica>
In-Reply-To: <YDjw/s+PuZ012GhX@myrica>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a087255-8245-4e9e-0650-08d8dee38219
x-ms-traffictypediagnostic: MWHPR1101MB2173:
x-microsoft-antispam-prvs: <MWHPR1101MB2173E87B74D40D883D6CF09C8C979@MWHPR1101MB2173.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5auBZ5KXXWBkkEpA9LrghonulmlnxaYNOz+llFYTtmqq6fAQGC/m07Kysqvh8NGAeV9IUsza6rk45JWlK/1NI0xJVJjwh5QOsSFMy8Aui0XNSi60+bUPdOsHv2ylZI6tc0+d1WAKxBGFCmgviTFLe6fRfgiPCG2Kux+1S0tGsQb3DMpEJ70MgPWrowfabPBOZcWfHQxFovOYT5XKeIj5+r6vFIbqfWWaLSfhByy/FhOmpXGXnVRWLoENfvz1A/0uLsLTiRXF4sB/Lil2aH2y7Mv/a72kM9yqj5ZfgyrgL8sFQAWEcZRoom98aEDXgGJfDjWmw9/lzhWK/zge/WNuqJN4U68XmhbvuBo0xm4Psy7UKO+yual5X82rMgTPMfqr/HOf0xXDUeP4y4MF6DyktuIjeZWKM6y3YF8u/fOC/EDw7gW4LE+/ukxbOSTdjLwjtsdOM9YD5K9weuAkW2sMgXP0kevpLzu9g2ORmthvg2dKEod2ZZM/+dkJLfjwtX24+NZtFRVV52iHHLEC5/N5hjd/DkgRU6Z2O0f/IfkVqdvf6TcE7zqyHxuAGlmSvU9EqIfTKyT1b5tmBjTgjI9mh0xbN2hT/579nT06Unyr/YE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1886.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(396003)(136003)(346002)(376002)(54906003)(86362001)(6916009)(316002)(4326008)(5660300002)(52536014)(2906002)(33656002)(66946007)(76116006)(64756008)(6506007)(7696005)(66556008)(66446008)(66476007)(966005)(83380400001)(55016002)(9686003)(8676002)(186003)(478600001)(71200400001)(26005)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UDJuVWlNZzM4R0FjemtjZEQ1ZDNqTiswMEtVdmptdjNVZzZqVDUvVEhkNmQv?=
 =?utf-8?B?RjFTQnpHSzNSUmxndU03ZzVncFI5Q2ViM29udnJMVlBWL29FWjUwR0xiejl5?=
 =?utf-8?B?MDhyMG9ZTm9aWUJtODRLTkdzT2E5QjhjMG1QL1hQZlhXY282ZXV4c3lYUklt?=
 =?utf-8?B?c1lPdnhvZHQvRVBCSkF2YngzTERrNHM3Q1pDdXFmS2o0bXJrVkZrdFgyT1R3?=
 =?utf-8?B?WUFDL0NRV1dwMlN4TjZpZnJES1Z2OFczTy9vd044OHZybVJkYy85L0cwejA1?=
 =?utf-8?B?Y3h6SlVVNEQyZVFldXdvSnF6dGR4MXlHMEtWTlVmNFk5NmxkZjV1dFRqL0NQ?=
 =?utf-8?B?bUQ0MVNDSUxFRFVJQjJob2xMbWdQVXZ3cFp0TnBGOStIWHd0Wm9taSs3V3BP?=
 =?utf-8?B?ZVFjVkhrSXNraUhPeTE1T3hPRXpvWi8wdS93Kzd1RzR0WS82eVg2UmVtZnNW?=
 =?utf-8?B?aVV6VkVRQ2ZOSHlJZlBxNDczN2hzaGpZdzlqS1BvNmEvYjF2MGpHK1QvVDNI?=
 =?utf-8?B?UWhUdHNrYUdNZlJhS3k0a1QvVGI3K2Nmc0NGYktFRUtGUDZ4K29mRGVPQ1do?=
 =?utf-8?B?dnRmVmwxQWtEd3EzVjdsL1BxN1Y0clF5aElYd1FqNlpnSWpyeS9hSWNtWjRw?=
 =?utf-8?B?M1ZnQjk3VmNYZ25KR2RSZnJpUjE3L2hXVHdXd3pKR21LZld2UjhUNXQ0cWlO?=
 =?utf-8?B?QS9Zd1RZc2w2QnVRaklXdm9tZ1pmd2xjOGptaERuV0NSZ1RkZHQxV3NjMFZ6?=
 =?utf-8?B?aEMwbzA2NmZobGxXaU54Zlc2NUlhRU82TUZLcGNDMVM4L0J0czVEVnhuZmxU?=
 =?utf-8?B?aGI5K3ltcjB1T1dSbVp1Z2VCK2xreml0TE9yYm5LcElIWm9vbmMvQXhEQzJN?=
 =?utf-8?B?eXFpY1JEUmVrYm1kV3Nja3RGM1dOMm9DZ1JTY01OYytncHdxUTErTktLTWhz?=
 =?utf-8?B?K0MrcGNScENXaTg5ZkhyUnFjdjF3T0p5RXI4a0xYWmk3b1hDZGwzdHE3cml2?=
 =?utf-8?B?UEJYVzNEWE1KbzVPL21qZnJncGN0bEVUN2R2Ymh3UnFScXloczNMc0xUVWVa?=
 =?utf-8?B?RWo2OFFIbEdQZ1lEdEY0SmJiMjdLL0lHUlhWaWdWVUE4RUFRMjFTY3YxcmVr?=
 =?utf-8?B?YS9LL2dtN09HSTMyZ2pXVmg2a0xkUUl5UDF1L29RbkVKb2s1OUpsTkxGQ0Nj?=
 =?utf-8?B?T1c1K1E4Z1RidDZsdEcyajZjQXhyVlc2SVcxMm9xK3ZtV2ZHQ2xYa0FIbFBx?=
 =?utf-8?B?emMrTVY1WDQ0TWs4Q3ZrdTJwWVZWRWUxVlo0U2pyZ3ZFVnUrdUZuSDZCYy9J?=
 =?utf-8?B?UXk0aDhBTW9SOEMxbFdMeFp3MVNVTXlGL2ZPKzhMb2xWRW9wOVhZUEwxbkt1?=
 =?utf-8?B?TkZyTnRzSU9RUGs0aVpxanY0TndQcVFlZmlybDVQcExUNU5OQm1FR2ZYQmlu?=
 =?utf-8?B?MFBIeUxha0VhalR3dnNEVlFtSkgzbFlTamVybVRvckRRVzVNMGY2QXZYaFp5?=
 =?utf-8?B?N3hFQXNac3Z4S3VoS0VRZW4zNm9qeTRFYzNiSkxvSEkxWUtuNlBxSFZBSmFu?=
 =?utf-8?B?a1FSdVNUVWhHQVlsbjFyZHkxRHE5bUtiQ0RJbkpBR0xGTG5ZNTN1Njd6eTY0?=
 =?utf-8?B?alBacDBhWjVPTUxwMGpRZnNBViswZTBaK3d4NVBhSFowYWZHcjJOQnJMRlRG?=
 =?utf-8?B?dGRyU0lac3RjYkUzbU8vOWtHVXZMLzdFUy93dERUSS9kdUVHWEJ6Wit5U0hP?=
 =?utf-8?Q?9PkzuBWsfqlplE+kHRJCU+33JpYFzUSw3xeRfSr?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a087255-8245-4e9e-0650-08d8dee38219
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2021 07:59:59.3476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O0mDlhOxMdigt/worPaU1titEe1J5M3diZ7Yu008jeYbQexKxrvOnOLF2VooQqZbH9iePXuoSX8A8KSP5s8hPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2173
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.20; envelope-from=kevin.tian@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBGcm9tOiBKZWFuLVBoaWxpcHBlIEJydWNrZXIgPGplYW4tcGhpbGlwcGVAbGluYXJvLm9yZz4N
Cj4gU2VudDogRnJpZGF5LCBGZWJydWFyeSAyNiwgMjAyMSA5OjAxIFBNDQo+IA0KPiBPbiBGcmks
IEZlYiAyNiwgMjAyMSBhdCAwODoxMTo0MUFNICswMDAwLCBUaWFuLCBLZXZpbiB3cm90ZToNCj4g
PiA+IEZyb206IFFlbXUtZGV2ZWwgPHFlbXUtZGV2ZWwtDQo+IGJvdW5jZXMra2V2aW4udGlhbj1p
bnRlbC5jb21Abm9uZ251Lm9yZz4NCj4gPiA+IE9uIEJlaGFsZiBPZiBKZWFuLVBoaWxpcHBlIEJy
dWNrZXINCj4gPiA+DQo+ID4gPiBPbiBTdW4sIEZlYiAyMSwgMjAyMSBhdCAwNjo0NToxOEFNIC0w
NTAwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6DQo+ID4gPiA+IE9uIFRodSwgRmViIDE4LCAy
MDIxIGF0IDExOjU5OjMwQU0gKzAxMDAsIEplYW4tUGhpbGlwcGUgQnJ1Y2tlciB3cm90ZToNCj4g
PiA+ID4gPiBDdXJyZW50bHkgdGhlIHZpcnRpby1pb21tdSBkZXZpY2UgbXVzdCBiZSBwcm9ncmFt
bWVkIGJlZm9yZSBpdA0KPiBhbGxvd3MNCj4gPiA+ID4gPiBETUEgZnJvbSBhbnkgUENJIGRldmlj
ZS4gVGhpcyBjYW4gbWFrZSB0aGUgVk0gZW50aXJlbHkgdW51c2FibGUNCj4gd2hlbg0KPiA+ID4g
YQ0KPiA+ID4gPiA+IHZpcnRpby1pb21tdSBkcml2ZXIgaXNuJ3QgcHJlc2VudCwgZm9yIGV4YW1w
bGUgaW4gYSBib290bG9hZGVyIHRoYXQNCj4gPiA+ID4gPiBsb2FkcyB0aGUgT1MgZnJvbSBzdG9y
YWdlLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gU2ltaWxhcmx5IHRvIHRoZSBvdGhlciB2SU9NTVUg
aW1wbGVtZW50YXRpb25zLCBkZWZhdWx0IHRvIERNQQ0KPiA+ID4gYnlwYXNzaW5nDQo+ID4gPiA+
ID4gdGhlIElPTU1VIGR1cmluZyBib290LiBBZGQgYSAiYm9vdC1ieXBhc3MiIG9wdGlvbiB0aGF0
IGxldHMgdXNlcnMNCj4gPiA+IGNoYW5nZQ0KPiA+ID4gPiA+IHRoaXMgYmVoYXZpb3IuDQo+ID4g
PiA+ID4NCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKZWFuLVBoaWxpcHBlIEJydWNrZXIgPGpl
YW4tcGhpbGlwcGVAbGluYXJvLm9yZz4NCj4gPiA+ID4NCj4gPiA+ID4gd291bGRuJ3QgdGhpcyBi
ZSBhIHNwZWMgdmlvbGF0aW9uPw0KPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBXaGVuIHRoZSBk
ZXZpY2UgaXMgcmVzZXQsIGVuZHBvaW50cyBhcmUgbm90IGF0dGFjaGVkIHRvIGFueSBkb21haW4u
DQo+ID4gPiA+DQo+ID4gPiA+IElmIHRoZSBWSVJUSU9fSU9NTVVfRl9CWVBBU1MgZmVhdHVyZSBp
cyBuZWdvdGlhdGVkLCBhbGwgYWNjZXNzZXMNCj4gZnJvbQ0KPiA+ID4gPiB1bmF0dGFjaGVkIGVu
ZHBvaW50cyBhcmUgYWxsb3dlZCBhbmQgdHJhbnNsYXRlZCBieSB0aGUgSU9NTVUgdXNpbmcNCj4g
dGhlDQo+ID4gPiA+IGlkZW50aXR5IGZ1bmN0aW9uLiBJZiB0aGUgZmVhdHVyZSBpcyBub3QgbmVn
b3RpYXRlZCwgYW55IG1lbW9yeSBhY2Nlc3MNCj4gPiA+ID4gZnJvbSBhbiB1bmF0dGFjaGVkIGVu
ZHBvaW50IGZhaWxzLiBVcG9uIGF0dGFjaGluZyBhbiBlbmRwb2ludCBpbg0KPiA+ID4gPiBieXBh
c3MgbW9kZSB0byBhIG5ldyBkb21haW4sIGFueSBtZW1vcnkgYWNjZXNzIGZyb20gdGhlIGVuZHBv
aW50DQo+IGZhaWxzLA0KPiA+ID4gPiBzaW5jZSB0aGUgZG9tYWluIGRvZXMgbm90IGNvbnRhaW4g
YW55IG1hcHBpbmcuDQo+ID4gPg0KPiA+ID4gUmlnaHQsIGJ1dCB0aGUgZGV2aWNlIGJlaGF2aW9y
IHJlZ2FyZGluZyBCWVBBU1MgaXMgc3BlY2lmaWVkIGFzOg0KPiA+ID4NCj4gPiA+ICAgSWYgdGhl
IGRyaXZlciBkb2VzIG5vdCBhY2NlcHQgdGhlIFZJUlRJT19JT01NVV9GX0JZUEFTUyBmZWF0dXJl
LCB0aGUNCj4gPiA+ICAgZGV2aWNlIFNIT1VMRCBOT1QgbGV0IGVuZHBvaW50cyBhY2Nlc3MgdGhl
IGd1ZXN0LXBoeXNpY2FsIGFkZHJlc3MNCj4gc3BhY2UuDQo+ID4gPg0KPiA+ID4gU28gSSBmaWd1
cmVkIHRoYXQgdGhlIHNwZWMgY291bGQgYmUgcmVhZCBhcyAiYmVmb3JlIGZlYXR1cmUgbmVnb3Rp
YXRpb24NCj4gPiA+IGl0J3MgdW5kZWZpbmVkIHdoZXRoZXIgdGhlIElPTU1VIGlzIGJ5cGFzc2Vk
IG9yIG5vdCIgYW5kIHNvIGEgZGV2aWNlDQo+ID4gPiBpbXBsZW1lbnRhdGlvbiBjYW4gY2hvb3Nl
IGVpdGhlciAocHJldmlvdXNseSBkaXNjdXNzZWQgYXQgWzFdKS4gQnV0IGl0J3MgYQ0KPiA+ID4g
c3RyZXRjaCwgd2Ugc2hvdWxkIGNsYXJpZnkgdGhpcy4NCj4gPiA+DQo+ID4gPiBBbHNvLCB0aGUg
T1MgbWlnaHQgd2FudCB0byBrbm93IHdoZXRoZXIgRE1BIHdhcyBieXBhc3NpbmcgdGhlDQo+IElP
TU1VDQo+ID4gPiBiZWZvcmUNCj4gPiA+IHRoZSBkZXZpY2UgaXMgaW5pdGlhbGl6ZWQuIElmIHRo
ZXJlIGFyZSBzdHJvbmcgc2VjdXJpdHkgcmVxdWlyZW1lbnRzLCB0aGVuDQo+ID4gPiBib290LWJ5
cGFzcyBtZWFucyB0aGUgc3lzdGVtIHdhcyB2dWxuZXJhYmxlIHRvIERNQSBhdHRhY2tzIGR1cmlu
Zw0KPiBib290Lg0KPiA+ID4NCj4gPiA+IFNvIEknZCBsaWtlIHRvIGFkZCBhIG5ldyBmZWF0dXJl
IGJpdCBmb3IgdGhpcywNCj4gVklSVElPX0lPTU1VX0ZfQk9PVF9CWVBBU1MsDQo+ID4gPiB0aGF0
IHRlbGxzIHdoZXRoZXIgRE1BIGJ5cGFzc2VzIHRoZSBJT01NVSBiZWZvcmUgZmVhdHVyZSBuZWdv
dGlhdGlvbi4NCj4gSXQncw0KPiA+ID4gb25seSBhbiBpbmRpY2F0b3IsIGFjY2VwdGluZyB0aGUg
ZmVhdHVyZSBkb2Vzbid0IGNoYW5nZSBhbnl0aGluZy4gSSdsbA0KPiA+ID4gc2VuZCB0aGUgc3Bl
YyBjaGFuZ2Ugc2hvcnRseS4NCj4gPiA+DQo+ID4gPiBUaGFua3MsDQo+ID4gPiBKZWFuDQo+ID4g
Pg0KPiA+ID4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3FlbXUtDQo+ID4gPiBkZXZlbC8y
MDIwMDEwOTEwNDAzMi5HQTkzNzEyM0BteXJpY2EvDQo+ID4gPg0KPiA+DQo+ID4gSSB3b25kZXIg
d2h5IHdlIGRpZG4ndCBkZWZpbmUgdGhlIGRlZmF1bHQgYmVoYXZpb3IgdG8gYnlwYXNzICh0byBh
bGlnbiB3aXRoDQo+ID4gb3RoZXIgdklPTU1VcykgaW4gdGhlIGZpcnN0IHBsYWNlIGFuZCB0aGVu
IGhhdmUgYW4gb3B0aW9uIChlLmcuDQo+ID4gVklSVElPX0lPTU1VX0ZfTk9CWVBBU1MpIHRvIG92
ZXJyaWRlIGluIGNhc2UgYSBzdHJpY3RlciBwb2xpY3kgaXMNCj4gcmVxdWlyZWQuDQo+IA0KPiBZ
ZXMgaW4gaGluZHNpZ2h0IHRoZSBwb2xhcml0eSBzaG91bGQgcHJvYmFibHkgaGF2ZSBiZWVuIHJl
dmVyc2VkLiBDbGVhcmx5DQo+IEkgY291bGQgaGF2ZSBwdXQgbW9yZSB0aG91Z2h0cyBpbnRvIHRo
aXMuIFdoZW4gd3JpdGluZyB0aGUgc3BlYyBpdCBzZWVtZWQNCj4gbmF0dXJhbCBpbiB0ZXJtcyBv
ZiBzZWN1cml0eSB0byBkaXNhbGxvdyBhY2Nlc3NlcyB1bnRpbCBzb2Z0d2FyZQ0KPiBleHBsaWNp
dGx5IGVuYWJsZXMgYnlwYXNzLg0KPiANCj4gSW4gdGhlIGxpbmtlZCBkaXNjdXNzaW9uLCB3aGlj
aCBoYXBwZW5lZCBhZnRlciB0aGUgaW5pdGlhbCBzcGVjIHdhcw0KPiBhY2NlcHRlZCwgd2UgY29u
Y2x1ZGVkIHRoYXQgUUVNVSBzaG91bGQgYmUgYm9vdC1ieXBhc3MgYnkgZGVmYXVsdCBhbmQNCj4g
dGhlDQo+IHNwZWMgb3VnaHQgdG8gYmUgY2xhcmlmaWVkIHRvIGV4cGxpY2l0bHkgYWxsb3cgdGhp
cywgSSBqdXN0IGRpZG4ndCB0YWtlDQo+IHRpbWUgdG8gd29yayBvbiBpdCB1bnRpbCBub3cuDQo+
IA0KPiA+IEluIGNvbmNlcHQgd2hlbiBhIElPTU1VIGRldmljZSBpcyB1bmluaXRpYWxpemVkIG9y
IHJlc2V0LCBpdCBlc3NlbnRpYWxseQ0KPiBtZWFucw0KPiA+IG5vIHByb3RlY3Rpb24gaW4gcGxh
Y2UgdGh1cyBhIGJ5cGFzcyBiZWhhdmlvci4NCj4gDQo+IE5vdCBuZWNlc3NhcmlseSwgdGhlIFNN
TVUgbGVhdmVzIHRoYXQgY2hvaWNlIHRvIHRoZSBpbXBsZW1lbnRhdGlvbiAoYnV0IGl0DQo+IGRv
ZXMgaGF2ZSB0aGUgcmlnaHQgcG9sYXJpdHkgMCA9PSBieXBhc3MpLiBUaGUgU01NVV9HQlBBIHJl
Z2lzdGVyIGRlZmluZXMNCj4gdGhlIGJ5cGFzcyBiZWhhdmlvci4gSW1wbGVtZW50YXRpb25zIGNh
biB0aWUgaXQgdG8gMCBvciAxIHRvIGRlZmluZSB0aGUNCj4gZGVmYXVsdCBiZWhhdmlvciBvZiBh
Ym9ydCBvciBieXBhc3MuIFRoZW4gc29mdHdhcmUgc2V0cyBpdCB0byAwIG9yIDEgdG8NCj4gc2Vs
ZWN0IHRoZSBydW50aW1lIHBvbGljeS4gSWRlYWxseSBJJ2QgbGlrZSBhIHNpbWlsYXIgbWVjaGFu
aXNtIGZvcg0KPiB2aXJ0aW8taW9tbXUsIGJlY2F1c2UgaXQncyBzdGlja3kgYWNyb3NzIHJlc2V0
IC0gbm8gdnVsbmVyYWJpbGl0eSB3aW5kb3cNCj4gd2hlbiBmaXJtd2FyZSBoYW5kcyBvdmVyIHRo
ZSBJT01NVSB0byB0aGUgT1MuDQo+IA0KDQpUaGFua3MuIE5vdyBJIHNlZSB0aGUgYmFja2dyb3Vu
ZCBvZiB0aGlzIHBhdGNoLiDwn5iKDQo=

