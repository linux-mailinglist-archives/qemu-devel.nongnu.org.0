Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E86134016F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:06:27 +0100 (CET)
Received: from localhost ([::1]:58964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMobq-00073g-29
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1lMoaM-00069O-GA
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:04:55 -0400
Received: from mga17.intel.com ([192.55.52.151]:18745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1lMoaB-0005Xk-Hi
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:04:54 -0400
IronPort-SDR: 9gaJmF9Dm98vSMdunu8v5PogFEeRYDD8Vs6XslYgQyoSQJnEiI/K+9a/oH++HJ8nfnNDMYjvb+
 dwgLCiItlDMQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="169558316"
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="169558316"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 02:04:38 -0700
IronPort-SDR: 0P4PXR0ms2XtIYb2rBoAl+fMz/INWZ4NcZY9SK77aY350ZjMk8oRUv5VAG4iyql59St8CQzlYn
 OcF2iTFbMwvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="379672926"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga007.fm.intel.com with ESMTP; 18 Mar 2021 02:04:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Mar 2021 02:04:36 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Mar 2021 02:04:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 18 Mar 2021 02:04:36 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (104.47.44.50) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 18 Mar 2021 02:04:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkUqSYT3KF3mmgSbZqVE0hmLDwgwpZUrPKcXjYH7fyi1+qFwnS8xd88fiUrwOv5UsBajQQk92N1rRpWoTvJW6JX6FlxfvVId+47axL7mUGYHhG046TEPV0pbRSrPXuMHn9/s4ntXICEuKEJR1ZVhrTt4Su9gWNOsnIJvXFRA/ZvmCQJ5vtC5+xRH7oOJekbCm2ec/GJdfng1lTuz/O65o+o8opoIK+6zO7fj49D0lXl2snOb8fh1zn9Xm9VRCkAfvvvnYw1hilXyD6jMvmvSFZm3g3bBXkM1PtdcpeiW9zTjte2qZwi3RnadL+E+nHEzpxGeVk3qXyurTrgzt5z4rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bsl/zlZsdMGFLGm7SVSGRYOvyr4gEtdGeNuOehVukh0=;
 b=UnOzDFSvxGd42I0uuSWJ4AfSlGd3Njd2vvyxVjIS8vnU+S4+tyTCCRdWQ6X2LSuP+uVgqUpnKMCBFvclCn8GjMNOC9cg7ORPnzebHCCiuD56RQuyD4EAhNh9xtPu7pZb5V7NfV1TFuiZYENTiUV9P9/LRNPE6ODMH1iwTAB1aafMqmyTsX6h1Uc6WAkOstwOZij2l9Iry/YqcGdbe3lIC+ZhTEHt2g8xRJheI1IiKjqmL9H7cgviSbfiVffeGcFKC/IDFJB46UBTzXNnSR5HH3uMvIfIF0cEH9Lf/oXSReLkDf1tmRUkcXU/6zu22gPq2/PTCPqeT+Unx2ygQ5EKHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bsl/zlZsdMGFLGm7SVSGRYOvyr4gEtdGeNuOehVukh0=;
 b=Nc7nKD7rx5C+XsArsmbsWBF9wBQY77pw5DJg0w+0oqb0cLTS006/12ec6Y7slF6qRmF4tkUZ0AtW4cq9mZI8Sf7iE8zcQ4fIpRqo/Lnr2dJrWc5y/jrmrcynYmsLbnvkMTGKZTsxczMolkUEVjYBGN8AkKlewkndp782UuvjV4Y=
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MW3PR11MB4572.namprd11.prod.outlook.com (2603:10b6:303:5e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 09:04:34 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29%9]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 09:04:34 +0000
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
Thread-Index: AQHXFZHd9gMMyJ85yEilSjdZld3496qJVEGwgAAZ0ICAABBsgA==
Date: Thu, 18 Mar 2021 09:04:34 +0000
Message-ID: <MWHPR11MB1886BC40825E4FADA1BFB93F8C699@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <20210310094106.2191-1-jiangkunkun@huawei.com>
 <MWHPR11MB188608DDA524E353866268AE8C699@MWHPR11MB1886.namprd11.prod.outlook.com>
 <ba20233b-c5c0-cf3f-e4fa-ecb1e054ff54@huawei.com>
In-Reply-To: <ba20233b-c5c0-cf3f-e4fa-ecb1e054ff54@huawei.com>
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
x-ms-office365-filtering-correlation-id: 8804dccc-9b84-40f2-c9e9-08d8e9ecd9ce
x-ms-traffictypediagnostic: MW3PR11MB4572:
x-microsoft-antispam-prvs: <MW3PR11MB4572E2523309204A0C298D4E8C699@MW3PR11MB4572.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yzlB+ZZv6BAdMRZ04NOrSiFRMHu9QL+g2540dk2hTZCXVk5ZGJdVdpwaWdHVLUeQvEdMDvwKt2Q8Bz1gaawINo63wUvNwxZweFJGtwmbdS/4CfSvN1XZJY8PrQUL1FSjHJ5nnVZDfHf39uiap4rAeCotrJBN1txhcTUYhwqhA+1hr6RBenNn5OHQK8UD0fJ4fWPmxx2Io1KkCgDA9faN+8h43lPCqKlJm/I9w17+6YwC/T279PCumkLVnxOjgJHRlP/PRKCeqHcEKztlgW77eY4zmSPEzWpVJ/NijpWa7FGgOXmDk/UJ79fVEDp+JWiB7eupMfYyIBVitS9btpotQhxpVyJLejioHbkNAu177By++1qsIHVRNjOg7kbFSH5F4n/1f8lT3l4e/zjMTe5UNJk83ugtSNvl/wL+rsBK7aP12N0uxkryL+yB/slHHcQAZgAubBDn/hDWdhh5MuYOtLZSLHDkJjhoSCC60gP5GjPkiYarB0nZfIkiqdwG5rUPUXjMQNBz4jCAXESpmq+XZxDSwK4MTbzfFZUMKxGnZ0HD4byYQCOCoPloq0XnDcaD0IUj8tBw8JLvr+yqjArVLeiTx63CjITpT2pIgP5WgrPSWDdEsjuoaJ9GX7lQNs4iwiF2kh8WJRDvdLSRKgek1MDVdAJUc4iFhN4KUSXYg8UA6/cV8xP5KXgEJb2ja4HVGNoTpZtauusJRsGgWZwHuZj9Qe35k7y67jGuhD0VS+U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1886.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(366004)(346002)(136003)(39860400002)(186003)(5660300002)(4326008)(2906002)(8936002)(38100700001)(7696005)(7416002)(110136005)(66946007)(54906003)(52536014)(316002)(478600001)(55016002)(71200400001)(966005)(6506007)(66446008)(8676002)(53546011)(64756008)(26005)(86362001)(9686003)(33656002)(66556008)(66476007)(83380400001)(76116006)(14143004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VjBuMTRGNFg1Nm5HSFNLQU9Dci93WEliZlllRUVrQVRUT08wUndXZGhYWjho?=
 =?utf-8?B?MUZuRXZwZHYySVREbFIwOTRJcGtMajJzUUZVM2piSm1MY3ZSWEtWZmJha2FX?=
 =?utf-8?B?VWJSQm90QXQzeEdoVnA0Z2xUTDVzaW5DdkZNdE1YRGw5SGZ1RldRbU9XNkE1?=
 =?utf-8?B?NHphWXV1d2RPbU53Sm5pUGtoRWNtQnJXdHVpV1BXSlpnUk1ROUF0MUVtT1ov?=
 =?utf-8?B?WUYzM1lxQTFlVkhhL3M4STdwdENYK0JhdmxKNFp1VkhYZGVOWEVpK3NnVVpk?=
 =?utf-8?B?SkZIcis1UWFsM2V5VExnYkRGTzMxT2xBd0JoQVJhTExPMldIRFNob2VPaFhE?=
 =?utf-8?B?YjFGeEVVZGNjVFFQQllKelZ6ZUlGeFVQSVR1dEg5ajVvSnJVblZyL1N5d1ZB?=
 =?utf-8?B?cVczd0J2U29PREtSakdacWZWWnlkVW1xNnpEbTZUamhjeHBDQUQzZ2QwNkdr?=
 =?utf-8?B?cCsyU01VeFB0dVBmL3VBT0JIbmpMUGRQZjRqRWdja2hkNUpFSDFtMkIxNmRZ?=
 =?utf-8?B?WklteHA1alpGM1Jvd1RSSTFkRUQ3QjRENEwvRTJnL2VSSU01VU9TT3UrVkhu?=
 =?utf-8?B?OGJFbE4rcUc3dmFreXVGbmc1aUZVVHlGZnl5VDE4QW02dzgxb0dEd0RadEVS?=
 =?utf-8?B?dVpPNlAyeHlaTzE4aXdGZnFUM0RmTmRKREs3VTEyMy9DaFFUQVpodjVSZHpL?=
 =?utf-8?B?eWRyMVcrU1l4MFlZNTVZRysrdEFIbVd3TnJRQk5QQTN4RENyRTdjWnZqamhj?=
 =?utf-8?B?aTZWMi9IRkVqUjZHR1REelFrWnpOaXFRaXNienMxak5SWGsybVZTZ3o3SnRQ?=
 =?utf-8?B?Ymx0UUc1UXFydHBIYnhxVUNwQXFoNU9admQrN21GVU4wcHVITkJabi9obFpv?=
 =?utf-8?B?WWpWN0g1SUpVYXNxemh3cDdNQTl6U0x3WXIrTGs4TXBjUjdIMkJpaEUrUVZv?=
 =?utf-8?B?aXhrcUdGeFhOaUR6Nk50VGJVT3prTTRsa1hJaFZJVS9PcVB0citWeTZPRlVx?=
 =?utf-8?B?VDh5R2t4TDUzTUxuMWpoRHZPN0VOeGhPYUp2MHkwczNYd0FjdDV6WExWalBG?=
 =?utf-8?B?VEdlbzdoVGxNRTN2Ky9OM1dUQXJZdXFlYkdFeEVSZGNkOW9yVDZudGlQY0I5?=
 =?utf-8?B?dkxCK2pFeGQwT3hvbHhQcHRFbFR3M1NSaHlqN2tHWHE3NXEvRVk5NVJqT0VQ?=
 =?utf-8?B?YkNMclBwUitxYVUzTjVUS2lZQWlkcGZjcUEzbnNnK1lVWUdvR2VEQndwSUtS?=
 =?utf-8?B?SURjNjRQNFcycm1SNGFocy9yU25DelJsZm9EYnJlMUJ0bDNjcWd4MHR5YVM3?=
 =?utf-8?B?c08rejdtVWVsdDZrZU84RzlkVk5aVEVzcFBGSFNqTStHRjkxajZRQnhYTTh4?=
 =?utf-8?B?Z2xNZ2p4TUliUTlUa00wRjEzTlRDeUxlZkNIUWVhMDhsSTVUSyt3ODlUclo0?=
 =?utf-8?B?a0RCRTlXS0xFQm5yWHJuRUxUSzZWZU1nMTB1U3JnQkhsbEMxU0dUWmJidVdG?=
 =?utf-8?B?ZTF0YndLZ2hseWVnWVpjZlo5QUl3S0tYR3Q1ZE1RY09hVEJXQ2t5eHF1SUs1?=
 =?utf-8?B?K01MNThnUmRSMmU0RmY3eTFZQkpTZjhjUzVPbXNOZHdkMW15SFhpNy84Z1R2?=
 =?utf-8?B?M296NXVkWUNocG1LUlJCbU1IV1RtRXA3dFc0WGRLVC9SY3NVdUJFTUtOak02?=
 =?utf-8?B?anl2U0FldXhUam5ONU1iekJ3YVZjYjJpSGpXYmEzN0FVTU9IYmFNbkFnUkFo?=
 =?utf-8?Q?MaqzrTcpN7MnfqUJCJf9cJp308roGsUwCJzgtSP?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8804dccc-9b84-40f2-c9e9-08d8e9ecd9ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2021 09:04:34.6987 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hk9SmKIzjRoa9kaZANx3yhjZdDTfZauq8jYpgvwDaPmRW/9mVNtRKrtWTJRiHKEqavbrUUqZNtHfqZynKwoyyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4572
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.151; envelope-from=kevin.tian@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: "shameerali.kolothum.thodi@huawei.com"
 <shameerali.kolothum.thodi@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 Peter Xu <peterx@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>,
 "wanghaibin.wang@huawei.com" <wanghaibin.wang@huawei.com>,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBGcm9tOiBLdW5rdW4gSmlhbmcgPGppYW5na3Vua3VuQGh1YXdlaS5jb20+DQo+IFNlbnQ6IFRo
dXJzZGF5LCBNYXJjaCAxOCwgMjAyMSAzOjU5IFBNDQo+IA0KPiBIaSBLZXZpbiwNCj4gDQo+IE9u
IDIwMjEvMy8xOCAxNDoyOCwgVGlhbiwgS2V2aW4gd3JvdGU6DQo+ID4+IEZyb206IEt1bmt1biBK
aWFuZw0KPiA+PiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDEwLCAyMDIxIDU6NDEgUE0NCj4gPj4N
Cj4gPj4gSGkgYWxsLA0KPiA+Pg0KPiA+PiBJbiB0aGUgcGFzdCwgd2UgY2xlYXIgZGlydHkgbG9n
IGltbWVkaWF0ZWx5IGFmdGVyIHN5bmMgZGlydHkgbG9nIHRvDQo+ID4+IHVzZXJzcGFjZS4gVGhp
cyBtYXkgY2F1c2UgcmVkdW5kYW50IGRpcnR5IGhhbmRsaW5nIGlmIHVzZXJzcGFjZQ0KPiA+PiBo
YW5kbGVzIGRpcnR5IGxvZyBpdGVyYXRpdmVseToNCj4gPj4NCj4gPj4gQWZ0ZXIgdmZpbyBjbGVh
cnMgZGlydHkgbG9nLCBuZXcgZGlydHkgbG9nIHN0YXJ0cyB0byBnZW5lcmF0ZS4gVGhlc2UNCj4g
Pj4gbmV3IGRpcnR5IGxvZyB3aWxsIGJlIHJlcG9ydGVkIHRvIHVzZXJzcGFjZSBldmVuIGlmIHRo
ZXkgYXJlIGdlbmVyYXRlZA0KPiA+PiBiZWZvcmUgdXNlcnNwYWNlIGhhbmRsZXMgdGhlIHNhbWUg
ZGlydHkgcGFnZS4NCj4gPj4NCj4gPj4gU2luY2UgYSBuZXcgZGlydHkgbG9nIHRyYWNraW5nIG1l
dGhvZCBmb3IgdmZpbyBiYXNlZCBvbiBpb21tdSBod2RibVsxXQ0KPiA+PiBoYXMgYmVlbiBpbnRy
b2R1Y2VkIGluIHRoZSBrZXJuZWwgYW5kIGFkZGVkIGEgbmV3IGNhcGFiaWxpdHkgbmFtZWQNCj4g
Pj4gVkZJT19ESVJUWV9MT0dfTUFOVUFMX0NMRUFSLCB3ZSBjYW4gZWxpbWluYXRlIHNvbWUgcmVk
dW5kYW50DQo+IGRpcnR5DQo+ID4+IGhhbmRsaW5nIGJ5IHN1cHBvcnRpbmcgaXQuDQo+ID4gSXMg
dGhlcmUgYW55IHBlcmZvcm1hbmNlIGRhdGEgc2hvd2luZyB0aGUgYmVuZWZpdCBvZiB0aGlzIG5l
dyBtZXRob2Q/DQo+ID4NCj4gQ3VycmVudCBkaXJ0eSBsb2cgdHJhY2tpbmcgbWV0aG9kIGZvciBW
RklPOg0KPiBbMV0gQWxsIHBhZ2VzIG1hcmtlZCBkaXJ0eSBpZiBub3QgYWxsIGlvbW11X2dyb3Vw
cyBoYXZlIHBpbm5lZF9zY29wZQ0KPiBbMl0gcGlubmVkIHBhZ2VzIGJ5IHZhcmlvdXMgdmVuZG9y
IGRyaXZlcnMgaWYgYWxsIGlvbW11X2dyb3VwcyBoYXZlDQo+IHBpbm5lZCBzY29wZQ0KPiANCj4g
Qm90aCBtZXRob2RzIGFyZSBjb2Fyc2UtZ3JhaW5lZCBhbmQgY2FuIG5vdCBkZXRlcm1pbmUgd2hp
Y2ggcGFnZXMgYXJlDQo+IHJlYWxseSBkaXJ0eS4gRWFjaCByb3VuZCBtYXkgbWFyayB0aGUgcGFn
ZXMgdGhhdCBhcmUgbm90IHJlYWxseSBkaXJ0eSBhcw0KPiBkaXJ0eQ0KPiBhbmQgc2VuZCB0aGVt
IHRvIHRoZSBkZXN0aW5hdGlvbi4gKCBJdCBtaWdodCBiZSBiZXR0ZXIgaWYgdGhlIHJhbmdlIG9m
IHRoZQ0KPiBwaW5uZWRfc2NvcGUgd2FzIHNtYWxsZXIuICkgVGhpcyB3aWxsIHJlc3VsdCBpbiBh
IHdhc3RlIG9mIHJlc291cmNlcy4NCj4gDQo+IEhXREJNIGlzIHNob3J0IGZvciBIYXJkd2FyZSBE
aXJ0eSBCaXQgTWFuYWdlbWVudC4NCj4gKGUuZy4gc21tdXYzIEhUVFUsIEhhcmR3YXJlIFRyYW5z
bGF0aW9uIFRhYmxlIFVwZGF0ZSkNCj4gDQo+IEFib3V0IFNNTVUgSFRUVToNCj4gSFRUVSBpcyBh
IGZlYXR1cmUgb2YgQVJNIFNNTVV2MywgaXQgY2FuIHVwZGF0ZSBhY2Nlc3MgZmxhZyBvci9hbmQg
ZGlydHkNCj4gc3RhdGUgb2YgdGhlIFRURCAoVHJhbnNsYXRpb24gVGFibGUgRGVzY3JpcHRvcikg
YnkgaGFyZHdhcmUuDQo+IA0KPiBXaXRoIEhUVFUsIHN0YWdlMSBUVEQgaXMgY2xhc3NpZmllZCBp
bnRvIDMgdHlwZXM6DQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCDCoMKgIMKgwqDCoCBEQk0gYml0IEFQWzJdKHJlYWRvbmx5IGJpdCkNCj4gMS4g
d3JpdGFibGVfY2xlYW7CoMKgwqDCoMKgwqDCoMKgwqAgMcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxDQo+IDIuIHdyaXRhYmxlX2RpcnR5wqDC
oMKgwqDCoMKgwqDCoMKgwqAgMcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAwDQo+IDMuIHJlYWRvbmx5wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAxDQo+IA0KPiBJZiBIVFRVX0hEIChtYW5hZ2UgZGlydHkgc3RhdGUpIGlzIGVu
YWJsZWQsIHNtbXUgY2FuIGNoYW5nZSBUVEQgZnJvbQ0KPiB3cml0YWJsZV9jbGVhbiB0byB3cml0
YWJsZV9kaXJ0eS4gVGhlbiBzb2Z0d2FyZSBjYW4gc2NhbiBUVEQgdG8gc3luYyBkaXJ0eQ0KPiBz
dGF0ZSBpbnRvIGRpcnR5IGJpdG1hcC4gV2l0aCB0aGlzIGZlYXR1cmUsIHdlIGNhbiB0cmFjayB0
aGUgZGlydHkgbG9nIG9mDQo+IERNQSBjb250aW51b3VzbHkgYW5kIHByZWNpc2VseS4NCj4gDQo+
IFRoZSBjYXBhYmlsaXR5IG9mIFZGSU9fRElSVFlfTE9HX01BTlVBTF9DTEVBUiBpcyBzaW1pbGFy
IHRvIHRoYXQgb24NCj4gdGhlIEtWTSBzaWRlLiBXZSBhZGQgdGhpcyBuZXcgbG9nX2NsZWFyKCkg
aW50ZXJmYWNlIG9ubHkgdG8gc3BsaXQgdGhlIG9sZA0KPiBsb2dfc3luYygpIGludG8gdHdvIHNl
cGFyYXRlZCBwcm9jZWR1cmVzOg0KPiANCj4gLSB1c2UgbG9nX3N5bmMoKSB0byBjb2xsZWN0IHRo
ZSBjb2xsZWN0aW9uIG9ubHksIGFuZCwNCj4gLSB1c2UgbG9nX2NsZWFyKCkgdG8gY2xlYXIgdGhl
IGRpcnR5IGJpdG1hcC4NCj4gDQo+IElmIHlvdSdyZSBpbnRlcmVzdGVkIGluIHRoaXMgbmV3IG1l
dGhvZCwgeW91IGNhbiB0YWtlIGEgbG9vayBhdCBvdXIgc2V0IG9mDQo+IHBhdGNoZXMuDQo+IFsx
XQ0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1pb21tdS8yMDIxMDMxMDA5MDYxNC4y
NjY2OC0xLQ0KPiB6aHVrZXFpYW4xQGh1YXdlaS5jb20vDQo+IA0KDQpJIGtub3cgd2hhdCB5b3Ug
YXJlIGRvaW5nLiBJbnRlbCBpcyBhbHNvIHdvcmtpbmcgb24gVlQtZCBkaXJ0eSBiaXQgc3VwcG9y
dA0KYmFzZWQgb24gYWJvdmUgbGluay4gV2hhdCBJJ20gY3VyaW91cyBpcyB0aGUgYWN0dWFsIHBl
cmZvcm1hbmNlIGdhaW4gDQp3aXRoIHRoaXMgb3B0aW1pemF0aW9uLiBLVk0gZG9pbmcgdGhhdCBp
cyBvbmUgZ29vZCByZWZlcmVuY2UsIGJ1dCBJT01NVQ0KaGFzIGRpZmZlcmVudCBjaGFyYWN0ZXJp
c3RpY3MgKGUuZy4gbG9uZ2VyIGludmFsaWRhdGlvbiBsYXRlbmN5KSBjb21wYXJlZCB0byANCkNQ
VSBNTVUuIEl0J3MgYWx3YXlzIGdvb2QgdG8gdW5kZXJzdGFuZCB3aGF0IGEgc28tY2FsbGVkIG9w
dGltaXphdGlvbg0KY2FuIGFjdHVhbGx5IG9wdGltaXplIGluIGEgY29udGV4dCBkaWZmZXJlbnQg
ZnJvbSB3aGVyZSBpdCdzIG9yaWdpbmFsbHkgcHJvdmVkLvCfmIoNCg0KVGhhbmtzDQpLZXZpbg0K

