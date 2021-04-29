Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7117036F01D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 21:07:41 +0200 (CEST)
Received: from localhost ([::1]:45968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcC0i-0000RB-2H
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 15:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <james.r.harris@intel.com>)
 id 1lcByx-0008M0-KE
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 15:05:53 -0400
Received: from mga11.intel.com ([192.55.52.93]:28769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <james.r.harris@intel.com>)
 id 1lcByu-0003V9-53
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 15:05:51 -0400
IronPort-SDR: lavIWkn8p6KJv+dFBgFdEC1KaGAf7Apd60QGfNXnDubCnzFeaUjnFkziL/nyKHDxTNg9hSu+8F
 bD4JRptl1BMQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="193905468"
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="193905468"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 12:05:40 -0700
IronPort-SDR: StQXz/3GKIcw2jKp9UQAFuwOpYMPT6f2yf5xhtwjtgQ5LY07UTOFi03Ukt8nmPHZKoC30yjJCX
 X3o93JVPUsfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="404265376"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga002.jf.intel.com with ESMTP; 29 Apr 2021 12:05:40 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 29 Apr 2021 12:05:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 29 Apr 2021 12:05:39 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (104.47.38.52) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 29 Apr 2021 12:05:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gcgIxF4Oq76bSDXJYXH2Hb1bpy/vlb/7ryRjljC55vdiGEFqwOgdBX9ff3vE43f+MQ2uTKPrp7nxBkG4XDkL9wQdP61zxjbKEcBcyRSsgLv9EVWgqWUqQy6EGwe5ggMlhiTRajWtTlO/pSyK57Ux+1mr6oMLIDljkb5mkXi20n1O3BiCbd0VPLXVyZzzOCf6JmLjRKhCJbBJS8bes2EO3xkJTsTs8mKLytNLj8Iey0QL7QPZ+h0pxpxLWhv3kIZF7kI+pqRUYO2y7CGDe2m9HNo+iehlSGiMx7ds7GlEkY6Pa7hzf1Gk8Ot/PSlF0wMAy2L1pDWwkMW7+nt1pSWnjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRzRXkxIVmMdiVEalpSuQ162sRV/gf/0iXSJQOVHG3o=;
 b=hmx+UgcTlqueHSPIGBsVrg/ufFkOPUPLMOpLmXEBXnU8/A4O7Xha53HRdDOvRb0c0ILPipHJf6haxFA4H7nHSCeChmLh9QuowQoivyOyr0HY40LjWEe+2up2/vM9o7/nNx1MVlpGcGZUU4csO63EIIbwfD2JeS7xVbsEJ1rkTC3/j5Rl7XTX99TYTxLAOqLj8uVhY0N78Yby9rpaTbsIlBEBOTdpo0CrvRx26IUBlIQiqh2hCRkRSQpE4YPeCichRO7GJKxvjWxgPgnPv+y2ZMH6KZl9YSpZviQL72sQTqMRpj9xWJCRwHXVHvmsNpSMvicXS0BH0+OpjnkOa9MNrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRzRXkxIVmMdiVEalpSuQ162sRV/gf/0iXSJQOVHG3o=;
 b=L8jS7NdldIr8OEngrOXhSSnBu2n323j9BmyyBkZ5CpkMOgEJRqhQMGkqIqxCJ0auduRm0TZIuHXJmBCIILPkmlcbhd1+ItN5ZRmuKXmHtSZZxr68RZ/0rV1SZaOyAJYEnIFc0AaBlnCDXRiq2gLGJfXBM1copaKjb+YH27eQpMs=
Received: from BYAPR11MB3303.namprd11.prod.outlook.com (2603:10b6:a03:18::15)
 by BY5PR11MB3894.namprd11.prod.outlook.com (2603:10b6:a03:18c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Thu, 29 Apr
 2021 19:05:38 +0000
Received: from BYAPR11MB3303.namprd11.prod.outlook.com
 ([fe80::40d0:4886:b425:de80]) by BYAPR11MB3303.namprd11.prod.outlook.com
 ([fe80::40d0:4886:b425:de80%4]) with mapi id 15.20.4042.018; Thu, 29 Apr 2021
 19:05:38 +0000
From: "Harris, James R" <james.r.harris@intel.com>
To: Klaus Jensen <k.jensen@samsung.com>
Subject: Re: Incorrect NVMe DLFEAT?
Thread-Topic: Incorrect NVMe DLFEAT?
Thread-Index: AQHXPRfmMiwgBtVU9USLKoXiSKZQ26rLvjsA//+ng4A=
Date: Thu, 29 Apr 2021 19:05:38 +0000
Message-ID: <A3291F4C-E959-4CC2-8E5C-0087BFF8E82C@intel.com>
References: <CGME20210429165141eucas1p267855d81741ff7a775f1345c02703b09@eucas1p2.samsung.com>
 <F676026A-C861-410E-934F-1BBAC20CDCE2@intel.com>
 <YIrrTIrbOM9ReDp5@apples.localdomain>
In-Reply-To: <YIrrTIrbOM9ReDp5@apples.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.48.21041102
authentication-results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [70.163.214.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3738dc07-ebc3-4edc-e7b4-08d90b41c6ad
x-ms-traffictypediagnostic: BY5PR11MB3894:
x-microsoft-antispam-prvs: <BY5PR11MB38943B0A55073843BFDD0CC4DE5F9@BY5PR11MB3894.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6tb3U2zv0i6AFibpOkDfb1dzbDkfOX85X75n1rQviCgue8uOaekxsRJ5ET4w1JWCNpa/TY7ixmA9/nBXSE7Xdqp5TwQRLv0YfX4pgk+2QkONVBwcWiMuzfhfGwR/0PtemSBEGfzB5QkLG8sd2LHFKlG4bG1hSxrQvI9DByyl/Mq4trn0CBiwoWTITjL1PX9JmEBau92rJTDi9I67XLir5a9LlAhak8Hks6M/E2WNfmUgmkGgXo80en5N7WDMXmENWMNjvrFR052Pn+kWLm7gs6KD6kXBcjVi4InNcqiIJVUQNKoY/mVvanSfYM+pUbwX/NnScI8wrXLt9l9GO5cVzPn7q2f4EKvPSNvZ0ySnb2XazTmq0/ovvdpHi3LR83d/5qYy4rIbjayuKCX51UfXFav5W1rML0tH9a7EmI1QoAVr9aTe/DOYXJiXo/nuTfRTfxtRNwjSOB2boqJmEpRKv23L1KGdl/J48sv8jU0hPKUyazTYiMGvcWQxA+3CUwrCZ5YhvldrcEtr58XqOWdosWFDpNOdV/EQ+kaBJkVLdXuICzVOiXPbQrRSIkBwrhAzuWrJ4j4Me2CkfMdXHMaDxBgX5ZlBkqdpOHAseiBeb3FGDN8sGKHHUJ5nzCKkxkKwuxh2t+1crwpt1aiFjimOxHyuUYhipe8xKoCE8RHvYRs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3303.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(346002)(396003)(366004)(376002)(186003)(122000001)(6512007)(86362001)(8676002)(36756003)(26005)(33656002)(66476007)(2616005)(316002)(5660300002)(64756008)(38100700002)(478600001)(8936002)(66446008)(7116003)(2906002)(71200400001)(66556008)(83380400001)(6506007)(76116006)(6486002)(66946007)(3480700007)(6916009)(4326008)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Y3M4ckJ0MkhNa2VOdy9SU3kxaE9WNGxweWFsNEJaVWFUTzJWbFBCTm94cEpM?=
 =?utf-8?B?ZlI4VzRlL3ZvUTBHR1BGdjhRVDlLa2V4dEllRGFidGt4RWZBQi9wVm1Za0w3?=
 =?utf-8?B?VmFwQ3Z4aFRvcVBIVmJLMDFYanR5MVV2aHNmcmlJQk81QkkyVWw2TzdTNkh0?=
 =?utf-8?B?UkV4S0JWZnVhRGxoZTJXeEYxVURtdkFpVHlCa2FqUmpHTDBBUFVGZ2l0Qklx?=
 =?utf-8?B?WVFTZm9EbjNSajJKMVVkcFpnSFd6NE1vQkFOS0E2RUlKM0JycFYzaGtSc0Nn?=
 =?utf-8?B?UWpTOHNubHJmOHo1ZE5ZWGhqcU52OFpGMys3MEJuU005WVVDWWU0YU9Ha05V?=
 =?utf-8?B?YTdLbHFjMWt3VWZCSFhXMHRkK1VabVB3bU5PRTZBeG4zejVESzBveXVNOEVs?=
 =?utf-8?B?RXVnYkRqRE1jQ2FuSEZIalUxSktUZVBibXFUTFFRSXZBU1FPTldxY2lEZDlJ?=
 =?utf-8?B?QVVRUE9NNStXbTJ2U1ZPQ2xScWhJakl5Z1RPZmxsRzRYbHVWOVdVb1paOUdj?=
 =?utf-8?B?RlZMUFp1YWc5QUFqSjVTcVF3Y3EyNEZJa2FYamE2ZUt5UW9tTElLbnoyWC9U?=
 =?utf-8?B?Ti9BcU1ETzhiT0JPMXM3b0FLQTdvR21XbnI0NjNZSkJKdGtCeUdhL2JUZFB2?=
 =?utf-8?B?cmpGOHhVSWxFb0QwSEVaSHdlYXhoWFMyQjZlR3RvQUliWjBrYUMybGxuSUdz?=
 =?utf-8?B?THJ4OUpPa2ZvRmdEM2hMM3U3NGlNSlBrOTBPMzFwWHlhRHJ4bWdVTGZCb3Fa?=
 =?utf-8?B?aEFxZmEyRFp2WTRHSG1DUUd4WVkvY1gyZXh3bEp5VmVLVUp0cmttRS9HZ0dO?=
 =?utf-8?B?cGc3dVkrbC8zbU1YRkw1djVzcm82L2tiMjBGWXNPa0JybC9PSGlLNlNpOXQ0?=
 =?utf-8?B?MTZ2U2NneDFBY2pKaVcxOEhPNkRQV3grdzVYVXoyQlZ4RVM2bmk2MVQrNUtI?=
 =?utf-8?B?NHhqMzFQZDVWWk04c2lSOFR2SzVaSmo2Mm5vanEwSk5MeWU0QlQvNTNaMXBo?=
 =?utf-8?B?U1hkUUhONUNNbkZRL3V2TkJYbnNZUklSQTNUQnU2Mi9wTFM2TlRTWnJmc0Np?=
 =?utf-8?B?MnRSRDZBT0swZEpmQVF4TDM0RnllMmVtb2NTNXBqQkdrbVBNNzZla1pCUk9a?=
 =?utf-8?B?aGE1YUsxUzFBK0pyRTlScUMyeFlUZ3pjMVJURVNPVEF4VVBsVnJySmRqZTdn?=
 =?utf-8?B?M2V5SDJrSHRwZEdDa1hEWnlCN0k4ejVxWGJXak03OHVDbk5uY2RVN0NQN1p1?=
 =?utf-8?B?Tjc5bUMxMHpSN1hGOWVaV0ZKL2tCV0dQRWtlaHJ0YmI4K3huVktuOUhEaTE1?=
 =?utf-8?B?SndMcnM4cW45TjFMT0xyWXk1b05IUXhUbnVnV2wvc0RSV0s5UUtlOXcvUkRD?=
 =?utf-8?B?UytoRkUvSVNad1dHVWFKTDhUSWRQZDBxeUFRMTR3UzBsWXNPOXorT1VNZVFo?=
 =?utf-8?B?UGtQT1dBcE40M0pVNk8zV3N1b2h4V0pxREd1OVZqUHRqWCtVT2k1UXdJUXRB?=
 =?utf-8?B?ZzB6N01TL1RoUUlDeTIvejBaT1JDS2JuMjRuVHZ4bmUrdGZvVER4NXUrNWtk?=
 =?utf-8?B?Q08xOEdwcDFLMkNHcWtBaHQzWFFJY0NZMXNTYjEvb0pMSE85SmxKWEFFbDR1?=
 =?utf-8?B?a2dpZjd5cm10TXE4SkFKTnppMEZwUUNrVzl2SkFKbnNqdm1sejZRRUtBWDJK?=
 =?utf-8?B?UXVGZzJFVmFaejk5RzV4Y2RnNmxTblhUVmkzRGhGK0RTcGkrZVJJT0pwMHQ3?=
 =?utf-8?B?ZHRFbHFpdUo2V0UzV2pXM2xUMnVPWnFaeWJxdUkzR05OYWNpRGZ4a0IrSllY?=
 =?utf-8?B?TnFzK3A1bTN3QmVHa011Zz09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D009B27865EEBC4E89C9431DEFDA632E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3303.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3738dc07-ebc3-4edc-e7b4-08d90b41c6ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2021 19:05:38.2172 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3UTsCDrfwlLTZesy1+qXtKe6AD7Sj95xTC3DZSozCBKJug0U92C1nbE542wSgGiDClX0/FrsreQ8syq4N1T1eL6JqrEuB1e/L99nL6F7+tU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3894
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.93;
 envelope-from=james.r.harris@intel.com; helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCu+7v09uIDQvMjkvMjEsIDEwOjIyIEFNLCAiS2xhdXMgSmVuc2VuIiA8ay5qZW5zZW5Ac2Ft
c3VuZy5jb20+IHdyb3RlOg0KDQogICAgT24gQXByIDI5IDE2OjUxLCBIYXJyaXMsIEphbWVzIFIg
d3JvdGU6DQogICAgPkhpLA0KICAgID4NCg0KICAgIEhpIEppbSwNCg0KICAgID5J4oCZbSBzZWVp
bmcgU1BESyB0ZXN0IGZhaWx1cmVzIHdpdGggUUVNVSBOVk1lIGNvbnRyb2xsZXJzIHRoYXQgSeKA
mXZlIA0KICAgID5iaXNlY3RlZCB0byBRRU1VIGNvbW1pdCAyNjA1MjU3YTI2ICjigJxody9ibG9j
ay9udm1lOiBhZGQgdGhlIGRhdGFzZXQgDQogICAgPm1hbmFnZW1lbnQgY29tbWFuZOKAnSkuDQog
ICAgPg0KICAgID5UaGUgZmFpbGluZyB0ZXN0cyBhcmUgcmVsYXRlZCB0byB3cml0ZSB6ZXJvZXMg
aGFuZGxpbmcuICBJZiBhbiBOVk1lIA0KICAgID5jb250cm9sbGVyIHN1cHBvcnRzIERTTSwgYW5k
IERMRkVBVCBpbmRpY2F0ZXMgdGhhdCBkZWFsbG9jYXRlZCBibG9ja3MgDQogICAgPndpbGwgcmVh
ZCBiYWNrIGFzIHplcm9lcywgdGhlbiBTUERLIHVzZXMgREVBTExPQ0FURSB0byBpbXBsZW1lbnQg
dGhlIA0KICAgID53cml0ZSB6ZXJvZXMgb3BlcmF0aW9uLiAgKE5vdGU6IFNQREsgcHJlZmVycyB0
aGlzIG1ldGhvZCB0byB1c2luZyBOVk1lIA0KICAgID5XUklURV9aRVJPRVMsIHNpbmNlIHRoZSBs
YXR0ZXIgaXMgbGltaXRlZCB0byBhIDE2LWJpdCBibG9jayBjb3VudC4pDQogICAgPg0KDQogICAg
VGhlIERhdGFzZXQgTWFuYWdlbWVudCBjb21tYW5kIGlzIGFkdmlzb3J5LCB0aGUgY29udHJvbGxl
ciBnaXZlcyBubyANCiAgICBndWFyYW50ZWUgdGhhdCBpdCB3aWxsIGFjdHVhbGx5IGRlYWxsb2Nh
dGUgYW55dGhpbmcuIFlvdSBjYW5ub3QgdXNlIERTTSANCiAgICBhcyBhIHJlYWxpYWJsZSBhbHRl
cm5hdGl2ZSB0byBXcml0ZSBaZXJvZXMuIFRoZSBRRU1VIGVtdWxhdGVkIG52bWUgDQogICAgZGV2
aWNlIGV4cGxvaXRzIHRoaXMgYW5kIGluIG1hbnkgY2FzZXMgd29udCBkZWFsbG9jYXRlIGFueXRo
aW5nIGlmIGl0IA0KICAgIGRvZXMgbm90IGZpdCBuaWNlbHkgd2l0aCB0aGUgdW5kZXJseWluZyBi
bG9jayBkZXZpY2Ugc2V0dXAuDQoNCltKSF0gSG1tbSwgbG9va3MgbGlrZSB3ZSBtYXkgbmVlZCBz
b21lIFNQREsgY2hhbmdlcyBmb3IgdGhpcyBjYXNlLg0KDQogICAgPlFFTVUgc2V0cyBETEZFQVQg
PSAweDkg4oCTIGFuZCBhY3R1YWxseSBzZXQgaXQgdG8gMHg5IGV2ZW4gYmVmb3JlIHRoaXMgDQog
ICAgPmNvbW1pdC4gIFNpbmNlIHRoZSBsb3dlciAzIGJpdHMgYXJlIDBiMDAxLCBpdCBpcyByZXBv
cnRpbmcgdGhhdCANCiAgICA+ZGVhbGxvY2F0ZWQgYmxvY2tzIHdpbGwgcmVhZCBiYWNrIGxhdGVy
IGFzIDAuICBUaGlzIGRvZXMgbm90IGFjdHVhbGx5IA0KICAgID5zZWVtIHRvIGJlIHRoZSBjYXNl
IGhvd2V2ZXIg4oCTIHJlYWRpbmcgcHJldmlvdXNseSBkZWFsbG9jYXRlZCBibG9ja3MgZG8gDQog
ICAgPm5vdCBhY3R1YWxseSByZXR1cm4gMHMuDQogICAgPg0KDQogICAgQ2FuIHlvdSBzaGFyZSB0
aGUgY29uZmlndXJhdGlvbiB5b3UgdXNlIGZvciBRRU1VPyBEU00gd29ya3MgYmVzdCB3aXRoIA0K
ICAgIDQwOTYgYnl0ZSBMQkFzIChsb2dpY2FsX2Jsb2NrX3NpemU9NDA5NikgYW5kIHRoZSByYXcg
Zm9ybWF0IGRyaXZlci4NCg0KICAgIEFsc28sIHBsZWFzZSB0ZXN0IHdpdGggdGhlIEVycm9yIFJl
Y292ZXJ5IGZlYXR1cmUgKGFuZCBzZXQgRFVMQkUpIHRvIA0KICAgIHRlc3QgaWYgdGhlIGRldmlj
ZSByZXBvcnRzIHRoYXQgdGhlIGJsb2NrIGlzIGFjdHVhbGx5IGRlYWxsb2NhdGVkLg0KDQpbSkhd
IEkndmUgdGVzdGVkIGJvdGggNTEyIGFuZCA0MDk2IExCQXMgYW5kIGhhY2tlZCBzb21ldGhpbmcg
dXAgdG8gZW5hYmxlDQpEVUxCRS4gIEkgYW0gbm90IHNlZWluZyBhbnkgZXJyb3JzIHJlYWRpbmcg
YmxvY2tzIHRoYXQgd2VyZSBwYXJ0IG9mIGENCnByZXZpb3VzIERTTSBjb21tYW5kLiAgU28gYXQg
bGVhc3QgZm9yIHRoZSBjYXNlcyBpbiB0aGUgU1BESyB0ZXN0LCB0aGVzZQ0KYmxvY2tzIGFyZSBu
b3QgYWN0dWFsbHkgYmVpbmcgZGVhbGxvY2F0ZWQuDQoNCiAgICA+SXQgc2VlbXMgRExGRUFUIGlz
IGJlaW5nIHNldCBpbmNvcnJlY3RseSBoZXJlIOKAkyBzaG91bGQgcHJvYmFibHkgYmUgMHg4IA0K
ICAgID5pbnN0ZWFkPw0KICAgID4NCiAgICA+VGhhbmtzLA0KICAgID4NCiAgICA+SmltDQogICAg
Pg0KICAgID4NCiAgICA+DQoNCiAgICAtLSANCiAgICBrDQoNCg==

