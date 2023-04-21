Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B896D6EA197
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 04:24:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppgQ6-00027e-Vx; Thu, 20 Apr 2023 22:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ppgQ5-00027N-Fx; Thu, 20 Apr 2023 22:22:41 -0400
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ppgQ2-0000QY-M0; Thu, 20 Apr 2023 22:22:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682043758; x=1713579758;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S/El+bOEkN5AxYzy/RkU2cu24/E3kzzvkIa5knybC0Y=;
 b=G/doetFbc+e0/hkan3kAmZpkebONl2SBqRq/rcpduJook3iSogRUyt3h
 jBR64UNZZB++0buifNQYjiLX84qOJhd9sr+R68b+yLclhl6b12G+a9q+l
 +066+Yc3Yj8hB5Ry8mH6nuG6RN3amibxLnpz21v3r/WibaqibYHePcCqT
 nEmAyOa8cIVbgIleFzeij/GLuUCrfJ8gdnaqtX8bg1Mdf1GDEOFgn9jT2
 ygxYrhCt+MkJbUF3hT7foWzdJ89oeKWqECluvYuoQYxrTVfjbDbtCpiag
 7eXNewJo3/dely04KFYFKUALuDHzeJ0jgfwCGVOc+ZEQBOrXsXrrFs9Yj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="408835879"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="408835879"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 19:22:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="756749625"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="756749625"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 20 Apr 2023 19:22:29 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 19:22:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 19:22:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 19:22:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gkw6dFEqJG/D8AKDKozcz43/zyArMEy8TiONbMsbjekgv149eXpuSjN6GecZTqTJCK8TnLIsmU8JUPs8krkScKtGPSREcCqlLl6269kHcz5Qqsy7AL2sQXMOMslfNLLE1OafnSPOOGYScpq7wzcVMg0rd0XVTmI4YmSbb1iraksfoOEE9uwO7EtzugMUP2h1qBKnVldjas4ippXsdBi18D6I4KaCSyzncD6Gd4VcMRIzTBgTJcAzSOP0tT9Sur+nuDbvtqwgJ1qR8Rqbqh6m5F3sGflrWGGTj7VRVyMJhBkPa2Pfot3uDXHPjhEyEpbyuk9Tub16D3ibyxDx5Aimjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/El+bOEkN5AxYzy/RkU2cu24/E3kzzvkIa5knybC0Y=;
 b=QEd4HsQgKIv+P8krb6c2XStBE+rACe49667HBaQZxjFJ1rAme2X6aPnQ9MAcUlQgJVL9Af8Sewku9sTaYGV1stIYIQ3wAD1MSMyS4MEjV6XWn78wfxHIXG4h12WOgNNuieeSMeFjDD7uo5JM1XWaD7nZHvUewgkVoe25I+jpsoaavRIa87YTpKnVr2q6eSrEl/oqwkXQ5PzF2toiU5gmFulNjYKCTCzuOlvZX+2r4EcU/lHix98KqgyDSZVe7ptsUppFgETxe0JEV7ii4j4ynBcEMLKI42OZpYoUR0d0sAM2Ol4uMds7FrRtReyeAbgL1J0QYOTVzo0ySnqs7Kjaig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by SA2PR11MB4793.namprd11.prod.outlook.com (2603:10b6:806:fa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Fri, 21 Apr
 2023 02:22:27 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::a689:d32a:4e3:de7e]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::a689:d32a:4e3:de7e%4]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 02:22:27 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "michael.roth@amd.com"
 <michael.roth@amd.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>, "quintela@redhat.com" <quintela@redhat.com>, "Zhang,
 Hailiang" <zhanghailiang@xfusion.com>, "philmd@linaro.org"
 <philmd@linaro.org>, "thuth@redhat.com" <thuth@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "dave@treblig.org" <dave@treblig.org>, "hreitz@redhat.com"
 <hreitz@redhat.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
Subject: RE: [PATCH v2 4/4] configure: add --disable-colo-filters option
Thread-Topic: [PATCH v2 4/4] configure: add --disable-colo-filters option
Thread-Index: AQHZcxHF8JmBz3Zr1EC3tnLXcpte268z5aQggAAp6wCAAPO0cA==
Date: Fri, 21 Apr 2023 02:22:27 +0000
Message-ID: <MWHPR11MB00315E99ED447760E8DF6A1E9B609@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20230419225232.508121-1-vsementsov@yandex-team.ru>
 <20230419225232.508121-5-vsementsov@yandex-team.ru>
 <MWHPR11MB0031567319A3C4CE499F3CF99B639@MWHPR11MB0031.namprd11.prod.outlook.com>
 <3c5aa49f-ca2a-5c73-befc-81377cc331b0@yandex-team.ru>
In-Reply-To: <3c5aa49f-ca2a-5c73-befc-81377cc331b0@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|SA2PR11MB4793:EE_
x-ms-office365-filtering-correlation-id: 80aabc46-bb97-48d0-1edb-08db420f4026
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XKq+43bN5NGDIAK/PCAuWEeDjr5RTp7SPXbfd2xt6SuSYWsRxjMTR8H90gH+BnaghizpkhN7CFepkXuhDtxTuN5oSS6TXEFLxKh6M/AegrAN/vr/RoKE6ALralxftSkIYxS25GgSMcEQiqa4abJBPGSWn3kzlOJa7GHhm4gxu+wp0tQymAEKAQDHGTyuKzclUAZ7vzYhGTelo8RifyOB60VfLDsg96ERqpgeApuNJxo6OBhaez9b92YGXkS8JJ34s1ef2wOW55N27/zsJkVTuYGRhtUGI4X7D5JMOVnAop8rtbBdeMQAbOI/E85fLZZ2qGsUWVvYmyNHKlkgj6bpiFqp67yaE8PyZjbH14RG4b/8O9XASYwujacKxXRCKN0AVFDilpgVEcLKqxtUQQj0htMvJa9ygkFckJJiCrYKe/1iMNeLhGv5EQz1FB8fEip1JrEbxWf9SFUT1cFknciMw1I1vzDOHQ0hhfY6luwWwEWKbeJxPEcJlRiwi6dRB2I0he7t2SEbaEDyQx+NQlnX04TTLIYwZmmBfnsjFG/B8OgKbsV9PXkJxFfZe0WZkgfmt4ETuiQ3mcAzNJvI1f2aPsbxq6OCxQ305jVxWEA7hWHnUKC5/a1PaWkDlTp8AUfz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(346002)(376002)(39860400002)(136003)(451199021)(38070700005)(83380400001)(2906002)(186003)(52536014)(5660300002)(9686003)(8676002)(8936002)(6506007)(53546011)(26005)(38100700002)(122000001)(7696005)(41300700001)(33656002)(71200400001)(82960400001)(316002)(66946007)(76116006)(66556008)(7416002)(66446008)(478600001)(55016003)(66476007)(86362001)(64756008)(4326008)(54906003)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VlRTMEFkdkxNREtST0hrckt5bi8yaUZjbFNhc1l1YlNkeERqRHdTSnNDb1lO?=
 =?utf-8?B?SGdkb1g2UUNpSjhzSDVVQ3plcXJuUGZwR0VVbTJvRUZFNjRPa3dwdndlTG0r?=
 =?utf-8?B?K1ZueTBuTnBkY3R6aE1uWThoNGcyeXFYcVJuTGw3MGlrTDIvRTVlTERjYmlP?=
 =?utf-8?B?RDJpZitPaFY1a1pwZ3RXdmJtZkRCUGxiV2tQN0dYeWk4ZzhuVm9KeS9kQ3Y3?=
 =?utf-8?B?YjZXdjFwSktNSFBKWWViL3hVR0M3QW1nckhTL0IzRGMxOUhuSWMrT3M2WGRE?=
 =?utf-8?B?U2V1eWJzdVp2d0toVmdrdUE2MUNZRzJKMld0WXRIcE9udWluVmhNN3hCYTZM?=
 =?utf-8?B?NUNRc0FuMExadURQMWs0Zk1DL2NhUWlqaGYwT05BTE9NUHNZUFNBdnJXV3cr?=
 =?utf-8?B?c1lCNCsyOEt2SXduVW1LVG5TeExIaWNGNHR5bGVlVVJBOERQWUJjOFp2OUlW?=
 =?utf-8?B?a1cydXlibFpCaEJQblNUQ3FLelAxOEdVYUdrV1JLMWRhSnN1U2RES0pWbm52?=
 =?utf-8?B?SjBobnlCRWNHZmRNeXBqMXlMRm5ocVVLVUJUQXBLWlNCWDZnZjhKNCswQUdt?=
 =?utf-8?B?OFROalVGQ2Jnd1Jla0g0VjhYTTMzd01rMTA1S2xjSk9zTWlSQjY5WWROWG9L?=
 =?utf-8?B?SXhZbFNZc3VIb2J4Y2NkbVJBckczdmNINWxydzdndk05Y0V6VU90M2pPa0hv?=
 =?utf-8?B?SVhpSFZCT1pXV0krK3dWYzAyQ1VMc1dhNnF6cUd0MEFuRmhWdTVWUFZVd2gz?=
 =?utf-8?B?YXUrNzN4M3AyREV0eXVSbkdINXBlS1lrZnAvaTQ3MlAzZysvLzBpZmQ1TktT?=
 =?utf-8?B?K3JCVkdrdzlraHc3aWhJUjNFUnhpM1hhcTBOaG5VRzFrak1ZYzhHSjArZm45?=
 =?utf-8?B?NlFRV05MaHVzV3V1NkhDaDJrcm1hQU4rNDA1ai8xU25yMlBJZ3BySlFCN0xX?=
 =?utf-8?B?K0hFVnRMZmV3SFFmQzE5WFR5WEtGTXNCS0xRUHZaZlRMSm13N094NVNzWG9h?=
 =?utf-8?B?cHAyL2RiWTc0ckh0cTAyOTJpU3pqckZhNlp3clZIQ3ZVV1UzQkJaczNNeVlM?=
 =?utf-8?B?WXRsZGROV0xZL3pwc3gva3NXNUw5Nkx6Y0VyUnZNVFkwZmgzTVVhRWJ6UENO?=
 =?utf-8?B?R0ppMVFKRUhPTG5RanlyWWVyZTM0OHJXSWtxYXlmZnNwblN6Ty9nbmdMMnhU?=
 =?utf-8?B?VGlCVmtENU81L2dYR01Ma2NVT25yWk13M1pIZzhsTnFwbTg1UGlxQVpJTGdC?=
 =?utf-8?B?V3dWMVR5K0h2WDlNUUNDZ3ovSU1MYkoxTi9TdTQxRUJYTGdDNkh6Q0ZKVXNl?=
 =?utf-8?B?SHBwZFJJSjcvci9FNndMRWJzbW9adXVCMmZ5b3VZS2YzMVBtci8wajR0WWoy?=
 =?utf-8?B?OC9BbGlZeVZYSW5DZU9GUGpTTDJLNnhncXpiT0k4Q1Q3cEMyN3M3cDNsWWk3?=
 =?utf-8?B?aTR5YzBlNFNDZWpBTWF5aE9WbTJKRUNvY3JrN1gwd1VmV2s5TjBkZWt2T2s3?=
 =?utf-8?B?azQ5SjBHd0VFV1VqY3FSaWhveFptNnp3bC9IeHJ1c2ZxZWtZSElCYjV0R25a?=
 =?utf-8?B?VWlWSWoybTl2bEhteXZyNkNpSUNQcE1MNy9iL0dYZHI5aFZ1MVdCaDBFNTlx?=
 =?utf-8?B?N1F1YTJsa3Z0azcza3U4Um9yM2hjSkV0YWRFK3ZDTkNWSzkxVHY2eTUzMDlz?=
 =?utf-8?B?S2xERThPcVlNYXQ5N05oUGx1dGJPQnRVMkh3TG1vTVY4ZTg4dmxuS1E4NGhG?=
 =?utf-8?B?STEzd2ZiVFZuNTQvNktwUEtoemVtK2IvVUhjK2VSYkFmVjhSVm5sdE03MGJh?=
 =?utf-8?B?SjNxT2UrR2NCMS9Xck5xQ3BRT3NqRll3YlpCTEY4UHBPRnVNV2NtMitML2xT?=
 =?utf-8?B?K2hIYmgxbmRPQzUxSW1iaDFhNGJNVlFyOWFDT0RqMU1pV2tzV0NJUWMzUEcz?=
 =?utf-8?B?Y2RWdjRaM3R0OE9Cd0F1UUVGb2MvRzZEVnB5Z1ZoL0NzZkpFWmlqT2d3WmJI?=
 =?utf-8?B?Z3Awa3E3UDgxN2JDaUhtdC95Z1BabE9lajYwRUFRV1JOVUFRVlRaYjdpaEZJ?=
 =?utf-8?B?dU9lc1JCK3BLcXFJaVg1T3JJbTY0RFJPQ3dCazhqd0JhZ0pzdm40MmhKbWRq?=
 =?utf-8?Q?lKLE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80aabc46-bb97-48d0-1edb-08db420f4026
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2023 02:22:27.1197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agFEXvPl4n8jFDgJ20eV4gcGbnzf3QGid6zhqxiQjMaMK/whRrwkPhulLBEeSStxcw38y19vLMHJUJ/z8hMiRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4793
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVmxhZGltaXIgU2VtZW50
c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB5YW5kZXgtdGVhbS5ydT4NCj4gU2VudDogVGh1cnNk
YXksIEFwcmlsIDIwLCAyMDIzIDc6MjYgUE0NCj4gVG86IFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5n
QGludGVsLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogcWVtdS1ibG9ja0Bub25n
bnUub3JnOyBtaWNoYWVsLnJvdGhAYW1kLmNvbTsgYXJtYnJ1QHJlZGhhdC5jb207DQo+IGVibGFr
ZUByZWRoYXQuY29tOyBqYXNvd2FuZ0ByZWRoYXQuY29tOyBxdWludGVsYUByZWRoYXQuY29tOyBa
aGFuZywNCj4gSGFpbGlhbmcgPHpoYW5naGFpbGlhbmdAeGZ1c2lvbi5jb20+OyBwaGlsbWRAbGlu
YXJvLm9yZzsNCj4gdGh1dGhAcmVkaGF0LmNvbTsgYmVycmFuZ2VAcmVkaGF0LmNvbTsgbWFyY2Fu
ZHJlLmx1cmVhdUByZWRoYXQuY29tOw0KPiBwYm9uemluaUByZWRoYXQuY29tOyBkYXZlQHRyZWJs
aWcub3JnOyBocmVpdHpAcmVkaGF0LmNvbTsNCj4ga3dvbGZAcmVkaGF0LmNvbTsgbGl6aGlqaWFu
QGZ1aml0c3UuY29tDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgNC80XSBjb25maWd1cmU6IGFk
ZCAtLWRpc2FibGUtY29sby1maWx0ZXJzIG9wdGlvbg0KPiANCj4gT24gMjAuMDQuMjMgMTI6MDks
IFpoYW5nLCBDaGVuIHdyb3RlOg0KPiA+DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPj4gRnJvbTogVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNv
dkB5YW5kZXgtdGVhbS5ydT4NCj4gPj4gU2VudDogVGh1cnNkYXksIEFwcmlsIDIwLCAyMDIzIDY6
NTMgQU0NCj4gPj4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiA+PiBDYzogcWVtdS1ibG9j
a0Bub25nbnUub3JnOyBtaWNoYWVsLnJvdGhAYW1kLmNvbTsNCj4gYXJtYnJ1QHJlZGhhdC5jb207
DQo+ID4+IGVibGFrZUByZWRoYXQuY29tOyBqYXNvd2FuZ0ByZWRoYXQuY29tOyBxdWludGVsYUBy
ZWRoYXQuY29tOw0KPiBaaGFuZywNCj4gPj4gSGFpbGlhbmcgPHpoYW5naGFpbGlhbmdAeGZ1c2lv
bi5jb20+OyBwaGlsbWRAbGluYXJvLm9yZzsNCj4gPj4gdGh1dGhAcmVkaGF0LmNvbTsgYmVycmFu
Z2VAcmVkaGF0LmNvbTsNCj4gbWFyY2FuZHJlLmx1cmVhdUByZWRoYXQuY29tOw0KPiA+PiBwYm9u
emluaUByZWRoYXQuY29tOyBkYXZlQHRyZWJsaWcub3JnOyBocmVpdHpAcmVkaGF0LmNvbTsNCj4g
Pj4ga3dvbGZAcmVkaGF0LmNvbTsgWmhhbmcsIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPjsN
Cj4gPj4gbGl6aGlqaWFuQGZ1aml0c3UuY29tOyBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5
DQo+ID4+IDx2c2VtZW50c292QHlhbmRleC0gdGVhbS5ydT4NCj4gPj4gU3ViamVjdDogW1BBVENI
IHYyIDQvNF0gY29uZmlndXJlOiBhZGQgLS1kaXNhYmxlLWNvbG8tZmlsdGVycyBvcHRpb24NCj4g
Pj4NCj4gPj4gQWRkIG9wdGlvbiB0byBub3QgYnVpbGQgQ09MTyBQcm94eSBzdWJzeXN0ZW0gaWYg
aXQgaXMgbm90IG5lZWRlZC4NCj4gPg0KPiA+IEkgdGhpbmsgbm8gbmVlZCB0byBhZGQgdGhlIC0t
ZGlzYWJsZS1jb2xvLWZpbHRlciBvcHRpb24uDQo+ID4gTmV0LWZpbHRlcnMganVzdCBnZW5lcmFs
IGluZnJhc3RydWN0dXJlLiBBbm90aGVyIGV4YW1wbGUgaXMgQ09MTyBhbHNvDQo+ID4gdXNlIHRo
ZSAtY2hhcmRldiBzb2NrZXQgdG8gY29ubmVjdCBlYWNoIGZpbHRlcnMuIE5vIG5lZWQgdG8gYWRk
IHRoZSAtLQ0KPiBkaXNhYmxlLWNvbG8tY2hhcmRldi4uLi4NCj4gPiBQbGVhc2UgZHJvcCB0aGlz
IHBhdGNoLg0KPiANCj4gSSBkb24ndCBmb2xsb3cgeW91ciByZWFzb25pbmcuIE9mIGNvdXJzZSwg
d2UgZG9uJ3QgbmVlZCBhbnkgb3B0aW9uIGxpa2UgdGhpcywNCj4gYW5kIGNhbiBzaW1wbHkgaW5j
bHVkZSB0byBidWlsZCBhbGwgdGhlIGNvbXBvbmVudHMgd2UgZG9uJ3QgdXNlLiBTbyAibm8NCj4g
bmVlZCIgaXMgY29ycmVjdCBmb3IgYW55IC0tZGlzYWJsZS0qIG9wdGlvbi4NCj4gU3RpbGwsIEkg
dGhpbmssIGl0J3MgZ29vZCwgd2hlbiB5b3UgY2FuIGV4Y2x1ZGUgZnJvbSBidWlsZCB0aGUgc3Vi
c3lzdGVtcyB0aGF0DQo+IHlvdSBkb24ndCBuZWVkIC8gZG9uJ3Qgd2FudCB0byBtYWludGFpbiBv
ciBzaGlwIHRvIHlvdXIgZW5kIHVzZXJzLg0KDQpZZXMsIEkgYWdyZWUgd2l0aCB5b3VyIGlkZWEu
DQoNCj4gDQo+IEluIE1BSU5UQUlORVJTIHRoZXNlIHR3byBmaWx0ZXJzIGFyZSBpbiAiQ09MTyBQ
cm94eSIgc3VzYnN5c3RlbS4gSXMgaXQNCj4gY29ycmVjdD8gV2hhdCdzIHdyb25nIHdpdGggYWRk
aW5nIGFuIG9wdGlvbiB0byBub3QgYnVpbGQgdGhpcyBzdWJzeXN0ZW0/IEkNCj4gY2FuIHJlbmFt
ZSBpdCB0byAtLWRpc2FibGUtY29sby1wcm94eS4NCg0KVGhlIGhpc3RvcnkgaXMgQ09MTyBwcm9q
ZWN0IGNvbnRyaWJ1dGVkIFFFTVUgZmlsdGVyIGZyYW1ld29yayBhbmQgZmlsdGVyLW1pcnJvci9y
ZWRpcmVjdG9yLi4uZXRjLi4NCkFuZCB0aGUgIkNPTE8gUHJveHkiIHN1c2JzeXN0ZW0gY292ZXJl
ZCB0aGUgZmlsdGVycyBkbyBub3QgbWVhbnMgaXQgYmVsb25nIHRvIENPTE8uDQpTbywgSXQgaXMg
dW5yZWFzb25hYmxlIHRvIHRlbGwgdXNlcnMgdGhhdCB5b3UgY2Fubm90IHVzZSBmaWx0ZXItbWly
cm9yL3JlZGlyZXRvciBmb3IgbmV0d29yayBkZWJ1Z2dpbmcNCk9yIG90aGVyIHB1cnBvc2UgYmVj
YXVzZSB5b3UgaGF2ZSBub3QgZW5hYmxlZCBDT0xPIHByb3h5Lg0KDQo+IA0KPiA+IEJ1dCBmb3Ig
Q09MTyBuZXR3b3JrIHBhcnQsIHN0aWxsIHNvbWV0aGluZyBuZWVkIHRvIGRvOg0KPiA+IFlvdSBj
YW4gYWRkIC0tZGlzYWJsZS1jb2xvLXByb3h5IG5vdCB0byBidWlsZCB0aGUgbmV0L2NvbG8tY29t
cGFyZS5jICBpZiBpdCBpcw0KPiBub3QgbmVlZGVkLg0KPiA+IFRoaXMgZmlsZSBqdXN0IGZvciBD
T0xPIGFuZCBub3QgYmVsb25nIHRvIG5ldHdvcmsgZmlsdGVycy4NCj4gDQo+IG5ldC9jb2xvLWNv
bXBhcmUuYyBpcyB1c2VkIG9ubHkgb25seSBmb3IgQ09MTywgd2hpY2ggaW4gdHVybiB1c2VkIG9u
bHkgd2l0aA0KPiBDT05GSUdfUkVQTElDQVRJT04gZW5hYmxlZCwgc2VlIHBhdGNoIDMuIFNvLCBu
byByZWFzb24gdG8gYWRkIHNlcGFyYXRlDQo+IG9wdGlvbiBmb3IgaXQsIGl0IHNob3VsZCBiZSBk
aXNhYmxlZCB3aXRoIC0tZGlzYWJsZS1yZXBsaWNhdGlvbi4NCg0KWWVzLCBhbmQgYXMgTHVrYXMg
c2FpZCwgQ09MTyBpcyB0aGUgb25seSB1c2VyIGZvciB0aGUgZmlsdGVyLXJld3JpdGVyIGN1cnJl
bnRseS4NCkl0IGlzIG1vcmUgYXBwcm9wcmlhdGUgdG8gYWRkIGZpbHRlci1yZXdyaXRlciByZXBs
YWNlIHRoZSBmaWx0ZXItbWlycm9yIGhlcmUuDQpJIHNhdyB0aGUgcGF0Y2ggMywgaXQgaXMgYmV0
dGVyIHRvIG1vdmUgaXQgdG8gdGhpcyBwYXRjaC4NCg0KVGhhbmtzDQpDaGVuDQoNCj4gDQo+IC0t
DQo+IEJlc3QgcmVnYXJkcywNCj4gVmxhZGltaXINCg0K

