Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B8234059E
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 13:37:35 +0100 (CET)
Received: from localhost ([::1]:35206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMruA-0001cE-I7
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 08:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1lMrsu-0000jh-69
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 08:36:16 -0400
Received: from mga14.intel.com ([192.55.52.115]:5956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1lMrsq-0005vM-5v
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 08:36:15 -0400
IronPort-SDR: fjBi2T+UPU1Gk2+fzAEmTAwX1mGUSEMklFpNVz4HO4juAM5cv17KXDu5QtHXOvYYyKu3YZLVeo
 6JrwW5mr/h8A==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="189040282"
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="189040282"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 05:36:07 -0700
IronPort-SDR: lqaXDAja7GDZ4gImuVI641sIGdleANtEa9VoIWJ9Fa+iue9CA/ojle/c95VUjfEdFywcbj/FkY
 ICOezhLxxV8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="411875933"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 18 Mar 2021 05:36:07 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Mar 2021 05:36:06 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Mar 2021 05:36:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 18 Mar 2021 05:36:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 18 Mar 2021 05:36:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YcCcAdER4B8QGsdh7YwI4xQ2JJbPSlgFctCkAO9hz6Lj62uGv3niluBHm/U9Qz5J+TlnlOu4EgkECJpUnLTtQhI8/uS3jLz8j1Wq0A8eVH/hv5h8NT87ny1A4YECX4kmtUCvnbXm77jj3XolTvJFWQfvY+0AuiOLMla0gN1qCQ3AF9uglgkIgrVK1skw1jNKUT08yOdwsRjDZZEFd6U2tN0gfFCP3byVBArjx0+Y9AAufpPcRg+OeD12YHZdVXFHV62uuB5ow0TVvRLpKA1IMhtaV3TwFd5aPkTd8wWqXYLfuZr/z3fWS8XFCfBRsd1f3GK6mre7XpfyKaA+nlr3cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LKuYQuTRkbLTGkBN0SPYHybYvwxhQpbCjARrKKd8hho=;
 b=N4nUn5jCLcKuy5VaWG5BVtVUizy/w8AC9/4ZZzZcvdegOzU+hmeY7XKC+3Q9j5l54oB1lIuAwAfFxYK96SvLG9Ko7oenNuXUst6FP2MdNh6nSeUyfCiuV6SdSqu1mJEfEhpmRB0SEz3WJ8XX1uOUElM4nkL/X+zjuN0S7t0aMdxuu7BnmsmSnbWIDJfdfSafbQcSGoyKbU78I5oGWHw0cocy1UQph60fy4ORpb9LVJ0cfxwfN0a77+OB1Bf9Bu3zTHP7Yf/uR5nJdE+1dWD4kLiSG0ltDlXQ89Iv2j3raSe9ldSgxPD9uas9mjaKBTm8hEj9I/FC19UNlZLGibwnmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LKuYQuTRkbLTGkBN0SPYHybYvwxhQpbCjARrKKd8hho=;
 b=ZGS6tvEIL9NH9pcjE9EvtwPu6dshs4J5pF5XisMrZshCL5GG6m/2EeV0LOwr3pgCAY95S6X9ndpnB9N2XEr5LwjA1za1aB4ldG+wHJVWVH6QUO8bauJjCHCctn9v3uDiQhrSsruiaxhGyaK9VCWdv1IhtpowXbcPHdAY+C4kr+0=
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MWHPR11MB1694.namprd11.prod.outlook.com (2603:10b6:300:21::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Thu, 18 Mar
 2021 12:36:02 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29%9]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 12:36:02 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Kunkun Jiang <jiangkunkun@huawei.com>, Alex Williamson
 <alex.williamson@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Kirti Wankhede" <kwankhede@nvidia.com>,
 =?utf-8?B?RGFuaWVsIFAgLiBCZXJyYW5nw6k=?= <berrange@redhat.com>, Tarun Gupta
 <targupta@nvidia.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: RE: [RFC PATCH 0/3] vfio/migration: Support manual clear vfio dirty
 log
Thread-Topic: [RFC PATCH 0/3] vfio/migration: Support manual clear vfio dirty
 log
Thread-Index: AQHXFZHd9gMMyJ85yEilSjdZld3496qJVEGwgAAZ0ICAABBsgIAAOsqAgAABkrA=
Date: Thu, 18 Mar 2021 12:36:02 +0000
Message-ID: <MWHPR11MB18868922447227A48272039F8C699@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <20210310094106.2191-1-jiangkunkun@huawei.com>
 <MWHPR11MB188608DDA524E353866268AE8C699@MWHPR11MB1886.namprd11.prod.outlook.com>
 <ba20233b-c5c0-cf3f-e4fa-ecb1e054ff54@huawei.com>
 <MWHPR11MB1886BC40825E4FADA1BFB93F8C699@MWHPR11MB1886.namprd11.prod.outlook.com>
 <fa31ed64-1c6e-f7db-7650-656a22223501@huawei.com>
In-Reply-To: <fa31ed64-1c6e-f7db-7650-656a22223501@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [101.88.226.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b318ca5a-f876-4770-1f17-08d8ea0a6431
x-ms-traffictypediagnostic: MWHPR11MB1694:
x-microsoft-antispam-prvs: <MWHPR11MB1694F74F0A912DE905E805728C699@MWHPR11MB1694.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WvE6I4R/vOCznaemwsmGQfM3/nWX35r15H2S9FGGXtJL6VDnxZiQygzfxDQiIDPC/mHd3Fqa1wYKSJoMfPA/DzOwAUjtnC5llpSED0aNt9K695UjkWLxKGfhm1Tu419wuHhI2qbgz+6ZP5I/f402AuDYEA4zdwPiIq3LIB/locHTY12LdXYv1cdHno5B26uPpgYtaUZE52/PUjxPenIW0hTWKVlFRKdfbsvUCwkKFOtZALEgxzSQExaXgx/U6cntb/UHM5qJAoR4YtvAP1O9iZ45GUibWvT6tnLEfAcfOM+cbJqTkwpJxkKo3BQcSYtk9f8Tz2tSg9fgy9rq59nxKaU9eZ9DtfydLpvmID2q3T+/Xl/Gdd49fEYbW0WT3e3Fmy3PV5YzYCvDxy4ZEKRGAQrtJJJKmsDcWgr4c5Ne0H8UxyRCEEGhfQyjMGzF2SCtdH1J08H5qfjroer6orj/WKcDUvmCRF0TIuk1324YoAxxB39xfVlAycHAfcLFev/+HuppMC/2eKwoWF4DMRipvDa0RYi/iM24IoINEZhAE+2TceYNIN5UgW52u17In9s5j8JSX9I0EU93Ju6SVTmSoPjl/9dO49MmWmJkyTi9btNyAK/pVodxaC44esefzyzCdMURZuajTR0Hy/rVS/DTwDZ6QVa4x4gEbtSSf4MM7lIj3z3vEpnbS8tjUQt9R7yyILDzBpvjKSwEpSBbNebFFzpySoEvQHMrAPeaGcUDMno=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1886.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(136003)(396003)(376002)(39860400002)(478600001)(5660300002)(316002)(110136005)(54906003)(966005)(2906002)(9686003)(7416002)(186003)(4326008)(86362001)(6506007)(53546011)(8936002)(55016002)(66446008)(64756008)(7696005)(33656002)(66946007)(71200400001)(8676002)(83380400001)(66556008)(76116006)(26005)(38100700001)(66476007)(52536014)(14143004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NnRxSDJEUlVxM0pIWnRmQjBWS00xa0JTcDMwVnlMM043ZVg5Y3RIQWdIR0RF?=
 =?utf-8?B?dVNPMldQZmlmVzVPV2NGQzZKQlJCekxYaGR6VXFZV3VNcEdtNGhyRDM3NEt4?=
 =?utf-8?B?U05xamxLWXdOQ1ltQWFpT3FiWStSWE9KLzRIUUVDMEx2ajNxaUdEOTFETGtW?=
 =?utf-8?B?eStTNDc1UVJMMC9vRnlSdnRKV3c2L2ZLOFdvaEk4VlZyZ2s2eDBRRnlGS2NN?=
 =?utf-8?B?VjE5Tk96WHhkcnNiaEw2NldsTU8rZ0xoWlF0eGhQN01ZS2g5M0RxZE9ERU5J?=
 =?utf-8?B?cTBQU1oxcld5Y3MwYnNXRm8xY3VDSjlxcE1tZzdnQlJwUzZSck41eHVJY2hm?=
 =?utf-8?B?cHRORVpxanRyM0hjU3RMemUxTFZxc2FVeGVTaktjKzBMdTRicm5ZalJzeUNn?=
 =?utf-8?B?NGpXT2VtM2R3eURmYTVoT3R6dThYSHhHRE9PaDczVnM2V0hvZUtReXZJMkpJ?=
 =?utf-8?B?K3I5djJDM0VUNzh0eFd0aXQzNVNSMkhvS0JtcCtIMHp0bHY2R1ZDdGNobXZ6?=
 =?utf-8?B?dFZ2YmVxM1VZK2lmUHMzVVlySGhyeTBqYjlTcnNVaUNMWHhvR0ZtbWlYM3dk?=
 =?utf-8?B?dm4vNCs2Tjl2S045cHNxRGpNZEo4d3JwRU03S21FV250bVc0cFkxNGhLYjI3?=
 =?utf-8?B?Rmk3S2VrWk9Bd3JBZEtHMDJzYU9RTU9OVFBoZFRvS1d5cWc4TlN5QUZZdVJQ?=
 =?utf-8?B?NEdMSHFZc05sdTk4YXpoZWdIdk44V0RTKzJiaDRhTWdqVitxUWVFeXJ3bWZB?=
 =?utf-8?B?ZU1GRkhCdmVMS0txcGQ3MnRxdGlicExvQ2FYZ3ZKTUM0NEsrMTArakp0TjFl?=
 =?utf-8?B?M3VZVEpIS0ExUithaGdCVTNtbWFEUFpRNk5DZkNJS29NUVRCdVRsOEJxdHhF?=
 =?utf-8?B?MDFkMmxYSnRPZnNxV2k4K3hBM3NxNi9DRm9Yazl4ZW0vMTFBTHpMSlJGams1?=
 =?utf-8?B?QjVHSzd3dXZ4aUQ3WC9pWjBabjVZR1h3T083RjNCMGlkWjlNbU1Na2k1ZGpT?=
 =?utf-8?B?V3RGTld0Y2VIMW9FaEpWVGlZaGdqWUV5WDRuaG9GUnZCVU9MZTUya1NucEM5?=
 =?utf-8?B?akFjRU5nRlNLRUxxOGZiYlRraHl2MC9jd3ZDM2Q2UjhBeXNvQTFzSkpWUFMr?=
 =?utf-8?B?TjJLeUtGZ083ejM1dDVDY2lXNS9seGVxSC8zT0JGbk1kMURKUStPLzhwTDZE?=
 =?utf-8?B?di9EcGw0a1I3b28yd3QxeVBzcG4wSW81cDE1QXJrb1duVFg0SldNUHlvR20w?=
 =?utf-8?B?d2I5L0RuNnoyYWFNcFhjWDhmc0RWeEFkVno4YUpnMGd3M2hiZk8vMkRxOXl4?=
 =?utf-8?B?SzJlNG5IMFphZENNcU81dFZhUkZFRUxHVzE0QklZbnE3NysxbVZ2WlVVaGhI?=
 =?utf-8?B?anhlT3lkaFhndU9UcHowSWJ4dDlGbTJVNTVQVTFnUkp6U2dtdUpsMVh1akpV?=
 =?utf-8?B?ZUEvVkt6YkV4WHk1aWFsaForZFdvQkF3YzFQSVIzM3N2cnFzTEl3bmI1SDUz?=
 =?utf-8?B?ZXpuc245UjVWckc5akYwSCt4Z29aTnp0MThQMkw2Q083RmNDZUNJY1ZGQVhi?=
 =?utf-8?B?d0xWKzNMUUV0R3J5eU9wbGw5ZUJOdkhYYW13MEtYUWFZb0lmSE1IaXBVUkdM?=
 =?utf-8?B?VzIyTkJ6eWFocGR1TUdlbW51NmpJZGdyaThManN4TDE2WG94TlRuVVhvcjlq?=
 =?utf-8?B?aFo4TjY3UGlHN0M3QTRPaElidnd1RFpIdktMOVc5aDR2K1JZdXkyTnd1Z1Fh?=
 =?utf-8?Q?4x+4lsb/g6534ZQu1P7z/KmmQNys2T5cX0dPD6p?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b318ca5a-f876-4770-1f17-08d8ea0a6431
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2021 12:36:02.3838 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gAdNYYZBDavzONgKcb79Abb5KajVLHhmzjwWuSjIopwHnF/7R/saJYcWZzQsrDQIEXwxnR5xNFPHrb4IleIgSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1694
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115; envelope-from=kevin.tian@intel.com;
 helo=mga14.intel.com
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
Cc: "shameerali.kolothum.thodi@huawei.com"
 <shameerali.kolothum.thodi@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 Peter Xu <peterx@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>,
 "wanghaibin.wang@huawei.com" <wanghaibin.wang@huawei.com>,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBGcm9tOiBLdW5rdW4gSmlhbmcgPGppYW5na3Vua3VuQGh1YXdlaS5jb20+DQo+IFNlbnQ6IFRo
dXJzZGF5LCBNYXJjaCAxOCwgMjAyMSA4OjI5IFBNDQo+IA0KPiBIaSBLZXZpbiwNCj4gDQo+IE9u
IDIwMjEvMy8xOCAxNzowNCwgVGlhbiwgS2V2aW4gd3JvdGU6DQo+ID4+IEZyb206IEt1bmt1biBK
aWFuZyA8amlhbmdrdW5rdW5AaHVhd2VpLmNvbT4NCj4gPj4gU2VudDogVGh1cnNkYXksIE1hcmNo
IDE4LCAyMDIxIDM6NTkgUE0NCj4gPj4NCj4gPj4gSGkgS2V2aW4sDQo+ID4+DQo+ID4+IE9uIDIw
MjEvMy8xOCAxNDoyOCwgVGlhbiwgS2V2aW4gd3JvdGU6DQo+ID4+Pj4gRnJvbTogS3Vua3VuIEpp
YW5nDQo+ID4+Pj4gU2VudDogV2VkbmVzZGF5LCBNYXJjaCAxMCwgMjAyMSA1OjQxIFBNDQo+ID4+
Pj4NCj4gPj4+PiBIaSBhbGwsDQo+ID4+Pj4NCj4gPj4+PiBJbiB0aGUgcGFzdCwgd2UgY2xlYXIg
ZGlydHkgbG9nIGltbWVkaWF0ZWx5IGFmdGVyIHN5bmMgZGlydHkgbG9nIHRvDQo+ID4+Pj4gdXNl
cnNwYWNlLiBUaGlzIG1heSBjYXVzZSByZWR1bmRhbnQgZGlydHkgaGFuZGxpbmcgaWYgdXNlcnNw
YWNlDQo+ID4+Pj4gaGFuZGxlcyBkaXJ0eSBsb2cgaXRlcmF0aXZlbHk6DQo+ID4+Pj4NCj4gPj4+
PiBBZnRlciB2ZmlvIGNsZWFycyBkaXJ0eSBsb2csIG5ldyBkaXJ0eSBsb2cgc3RhcnRzIHRvIGdl
bmVyYXRlLiBUaGVzZQ0KPiA+Pj4+IG5ldyBkaXJ0eSBsb2cgd2lsbCBiZSByZXBvcnRlZCB0byB1
c2Vyc3BhY2UgZXZlbiBpZiB0aGV5IGFyZSBnZW5lcmF0ZWQNCj4gPj4+PiBiZWZvcmUgdXNlcnNw
YWNlIGhhbmRsZXMgdGhlIHNhbWUgZGlydHkgcGFnZS4NCj4gPj4+Pg0KPiA+Pj4+IFNpbmNlIGEg
bmV3IGRpcnR5IGxvZyB0cmFja2luZyBtZXRob2QgZm9yIHZmaW8gYmFzZWQgb24gaW9tbXUNCj4g
aHdkYm1bMV0NCj4gPj4+PiBoYXMgYmVlbiBpbnRyb2R1Y2VkIGluIHRoZSBrZXJuZWwgYW5kIGFk
ZGVkIGEgbmV3IGNhcGFiaWxpdHkgbmFtZWQNCj4gPj4+PiBWRklPX0RJUlRZX0xPR19NQU5VQUxf
Q0xFQVIsIHdlIGNhbiBlbGltaW5hdGUgc29tZSByZWR1bmRhbnQNCj4gPj4gZGlydHkNCj4gPj4+
PiBoYW5kbGluZyBieSBzdXBwb3J0aW5nIGl0Lg0KPiA+Pj4gSXMgdGhlcmUgYW55IHBlcmZvcm1h
bmNlIGRhdGEgc2hvd2luZyB0aGUgYmVuZWZpdCBvZiB0aGlzIG5ldyBtZXRob2Q/DQo+ID4+Pg0K
PiA+PiBDdXJyZW50IGRpcnR5IGxvZyB0cmFja2luZyBtZXRob2QgZm9yIFZGSU86DQo+ID4+IFsx
XSBBbGwgcGFnZXMgbWFya2VkIGRpcnR5IGlmIG5vdCBhbGwgaW9tbXVfZ3JvdXBzIGhhdmUgcGlu
bmVkX3Njb3BlDQo+ID4+IFsyXSBwaW5uZWQgcGFnZXMgYnkgdmFyaW91cyB2ZW5kb3IgZHJpdmVy
cyBpZiBhbGwgaW9tbXVfZ3JvdXBzIGhhdmUNCj4gPj4gcGlubmVkIHNjb3BlDQo+ID4+DQo+ID4+
IEJvdGggbWV0aG9kcyBhcmUgY29hcnNlLWdyYWluZWQgYW5kIGNhbiBub3QgZGV0ZXJtaW5lIHdo
aWNoIHBhZ2VzIGFyZQ0KPiA+PiByZWFsbHkgZGlydHkuIEVhY2ggcm91bmQgbWF5IG1hcmsgdGhl
IHBhZ2VzIHRoYXQgYXJlIG5vdCByZWFsbHkgZGlydHkgYXMNCj4gPj4gZGlydHkNCj4gPj4gYW5k
IHNlbmQgdGhlbSB0byB0aGUgZGVzdGluYXRpb24uICggSXQgbWlnaHQgYmUgYmV0dGVyIGlmIHRo
ZSByYW5nZSBvZiB0aGUNCj4gPj4gcGlubmVkX3Njb3BlIHdhcyBzbWFsbGVyLiApIFRoaXMgd2ls
bCByZXN1bHQgaW4gYSB3YXN0ZSBvZiByZXNvdXJjZXMuDQo+ID4+DQo+ID4+IEhXREJNIGlzIHNo
b3J0IGZvciBIYXJkd2FyZSBEaXJ0eSBCaXQgTWFuYWdlbWVudC4NCj4gPj4gKGUuZy4gc21tdXYz
IEhUVFUsIEhhcmR3YXJlIFRyYW5zbGF0aW9uIFRhYmxlIFVwZGF0ZSkNCj4gPj4NCj4gPj4gQWJv
dXQgU01NVSBIVFRVOg0KPiA+PiBIVFRVIGlzIGEgZmVhdHVyZSBvZiBBUk0gU01NVXYzLCBpdCBj
YW4gdXBkYXRlIGFjY2VzcyBmbGFnIG9yL2FuZCBkaXJ0eQ0KPiA+PiBzdGF0ZSBvZiB0aGUgVFRE
IChUcmFuc2xhdGlvbiBUYWJsZSBEZXNjcmlwdG9yKSBieSBoYXJkd2FyZS4NCj4gPj4NCj4gPj4g
V2l0aCBIVFRVLCBzdGFnZTEgVFREIGlzIGNsYXNzaWZpZWQgaW50byAzIHR5cGVzOg0KPiA+PiAg
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKgwqAg
wqDCoMKgIERCTSBiaXQgQVBbMl0ocmVhZG9ubHkgYml0KQ0KPiA+PiAxLiB3cml0YWJsZV9jbGVh
bsKgwqDCoMKgwqDCoMKgwqDCoCAxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDENCj4gPj4gMi4gd3JpdGFibGVfZGlydHnCoMKgwqDCoMKgwqDC
oMKgwqDCoCAxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDANCj4gPj4gMy4gcmVhZG9ubHnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgMCDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDENCj4gPj4NCj4gPj4gSWYgSFRUVV9IRCAobWFuYWdlIGRpcnR5IHN0YXRlKSBpcyBlbmFi
bGVkLCBzbW11IGNhbiBjaGFuZ2UgVFREIGZyb20NCj4gPj4gd3JpdGFibGVfY2xlYW4gdG8gd3Jp
dGFibGVfZGlydHkuIFRoZW4gc29mdHdhcmUgY2FuIHNjYW4gVFREIHRvIHN5bmMgZGlydHkNCj4g
Pj4gc3RhdGUgaW50byBkaXJ0eSBiaXRtYXAuIFdpdGggdGhpcyBmZWF0dXJlLCB3ZSBjYW4gdHJh
Y2sgdGhlIGRpcnR5IGxvZyBvZg0KPiA+PiBETUEgY29udGludW91c2x5IGFuZCBwcmVjaXNlbHku
DQo+ID4+DQo+ID4+IFRoZSBjYXBhYmlsaXR5IG9mIFZGSU9fRElSVFlfTE9HX01BTlVBTF9DTEVB
UiBpcyBzaW1pbGFyIHRvIHRoYXQgb24NCj4gPj4gdGhlIEtWTSBzaWRlLiBXZSBhZGQgdGhpcyBu
ZXcgbG9nX2NsZWFyKCkgaW50ZXJmYWNlIG9ubHkgdG8gc3BsaXQgdGhlIG9sZA0KPiA+PiBsb2df
c3luYygpIGludG8gdHdvIHNlcGFyYXRlZCBwcm9jZWR1cmVzOg0KPiA+Pg0KPiA+PiAtIHVzZSBs
b2dfc3luYygpIHRvIGNvbGxlY3QgdGhlIGNvbGxlY3Rpb24gb25seSwgYW5kLA0KPiA+PiAtIHVz
ZSBsb2dfY2xlYXIoKSB0byBjbGVhciB0aGUgZGlydHkgYml0bWFwLg0KPiA+Pg0KPiA+PiBJZiB5
b3UncmUgaW50ZXJlc3RlZCBpbiB0aGlzIG5ldyBtZXRob2QsIHlvdSBjYW4gdGFrZSBhIGxvb2sg
YXQgb3VyIHNldCBvZg0KPiA+PiBwYXRjaGVzLg0KPiA+PiBbMV0NCj4gPj4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtaW9tbXUvMjAyMTAzMTAwOTA2MTQuMjY2NjgtMS0NCj4gPj4gemh1
a2VxaWFuMUBodWF3ZWkuY29tLw0KPiA+Pg0KPiA+IEkga25vdyB3aGF0IHlvdSBhcmUgZG9pbmcu
IEludGVsIGlzIGFsc28gd29ya2luZyBvbiBWVC1kIGRpcnR5IGJpdCBzdXBwb3J0DQo+ID4gYmFz
ZWQgb24gYWJvdmUgbGluay4gV2hhdCBJJ20gY3VyaW91cyBpcyB0aGUgYWN0dWFsIHBlcmZvcm1h
bmNlIGdhaW4NCj4gPiB3aXRoIHRoaXMgb3B0aW1pemF0aW9uLiBLVk0gZG9pbmcgdGhhdCBpcyBv
bmUgZ29vZCByZWZlcmVuY2UsIGJ1dCBJT01NVQ0KPiA+IGhhcyBkaWZmZXJlbnQgY2hhcmFjdGVy
aXN0aWNzIChlLmcuIGxvbmdlciBpbnZhbGlkYXRpb24gbGF0ZW5jeSkgY29tcGFyZWQgdG8NCj4g
PiBDUFUgTU1VLiBJdCdzIGFsd2F5cyBnb29kIHRvIHVuZGVyc3RhbmQgd2hhdCBhIHNvLWNhbGxl
ZCBvcHRpbWl6YXRpb24NCj4gPiBjYW4gYWN0dWFsbHkgb3B0aW1pemUgaW4gYSBjb250ZXh0IGRp
ZmZlcmVudCBmcm9tIHdoZXJlIGl0J3Mgb3JpZ2luYWxseQ0KPiBwcm92ZWQu8J+Yig0KPiA+DQo+
ID4gVGhhbmtzDQo+ID4gS2V2aW4NCj4gDQo+IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGlz
IGlzIGEgbmV3IG1ldGhvZCwgd2hpY2ggaXMgcXVpdGUgZGlmZmVyZW50DQo+IGZyb20gdGhlDQo+
IHByZXZpb3VzIHR3by4gU28gY2FuIHlvdSBleHBsYWluIGluIG1vcmUgZGV0YWlsIHdoYXQgcGVy
Zm9ybWFuY2UgZGF0YQ0KPiB5b3Ugd2FudD/wn5iBDQo+IA0KPiBUaGFua3MsDQo+IEt1bmt1biBK
aWFuZw0KDQpXaGVuIHlvdSBoYXZlIEhUVFUgZW5hYmxlZCwgY29tcGFyZSB0aGUgbWlncmF0aW9u
IGVmZmljaWVuY3kgd2l0aCBhbmQgDQp3aXRob3V0IHRoaXMgbWFudWFsIGNsZWFyIGludGVyZmFj
ZS4NCg0KVGhhbmtzDQpLZXZpbg0K

