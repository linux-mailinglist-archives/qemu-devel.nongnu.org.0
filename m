Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCAF349F01
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 02:48:57 +0100 (CET)
Received: from localhost ([::1]:54286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPbaq-000723-2b
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 21:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lPbZ8-0006Jo-Pl
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 21:47:10 -0400
Received: from mga02.intel.com ([134.134.136.20]:29798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lPbZ5-0007pK-60
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 21:47:10 -0400
IronPort-SDR: 9aTRLFYxImULBcMANbqZlm2m1pF3fT3jrhEDY6OFIKKpT0bZjDNj+dbgs7+5rJajBgVueiBrd9
 /ke6u7LWNEeA==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="178178358"
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="178178358"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 18:47:00 -0700
IronPort-SDR: Yadvm//1sAJQscqWdZ4TniDtQ7KEde++Uaf8yGhmti1hSNZb9CqR6jXG2CSW176ef4INPOjvaM
 c1IzNddJCEVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="414380061"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga007.jf.intel.com with ESMTP; 25 Mar 2021 18:46:59 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 25 Mar 2021 18:46:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 25 Mar 2021 18:46:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 25 Mar 2021 18:46:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bML1vIMm7b9EmrLH0ddOKvFG9/+6v6A17nCNQ6RRwfqkGQWXxzhJHvG8JsfBUX7f2KzgKOOwwdZ0G+J1H8mrTdwFNy2rcQv49yItuSjW6qH4BsA4d26v7WesVH5X1dWaQxHQlyNvOhqsMkN36xw/nU5H2pWi0YZRYK2QWwc4/o/CTH42o4gIthUYAABeL//R3+awdlPCdq0Ou96D1w5gsxGhdvmgRBCuWHFcLPAC99XnCNwLPEUyv6V8nOkWySqYcFno7TwwsGgqBv8O0eUqwG8hggQgk4jOLp1XzghoQ0niHBOEqnNcYLAn+DDA8fJi/AUZIXHVJYpjTKc/mSDKMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuuTLNwvcuMvwR8sqc1sPbggskqxhqgvyIQAzDrg9qs=;
 b=NweqCcLr/vUYCwoS3dX9ovTD2BVFKWKrJwEsUEo5rtd0vcdVutZmJ7uQb5Mg4hkAU6DLRx/7ZJBuh7YcRgppouL87vBmYEtK8gDuqflmZ5mBcbzYND+k1UexvpWz952hlLohw564NxQhUTeBE79IMhI1fLY6sg+B+Rf/08s+5fJBDV8QZWHKC6HtrfIGQZbj6q73ZSp2iriuKY4aJDYCMVBK5mM6Hle4hOE2digq1hTLegiR7BOT9pwpHisG1oxshjrUhafR3aNUzPsrZJR++FLr85u3Mnx1YCnNMFYYL6ni0pQgNJet6sU4LHuxjnlw7TJ5+SD7RKzE072OEiP7Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuuTLNwvcuMvwR8sqc1sPbggskqxhqgvyIQAzDrg9qs=;
 b=uo4MgTtzFIR7SYtE9kId0VAHscQn+FCa/DBfyk/IH8K59qAJ/RdSLm2XYfDHE0Ed9AY3lGqhQqd91o8fHoNdrrKe+I1lzL5QO7yB0Y/T8o6qfCpGiWKjE0ZE3GRCMbCgMzwTRpyJAhv1czgl12onxGDRyOBpUyAlYu0zubMl21I=
Received: from SN6PR11MB3103.namprd11.prod.outlook.com (2603:10b6:805:d7::13)
 by SA2PR11MB4937.namprd11.prod.outlook.com (2603:10b6:806:118::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Fri, 26 Mar
 2021 01:45:34 +0000
Received: from SN6PR11MB3103.namprd11.prod.outlook.com
 ([fe80::c9c2:8157:5bef:9b2]) by SN6PR11MB3103.namprd11.prod.outlook.com
 ([fe80::c9c2:8157:5bef:9b2%6]) with mapi id 15.20.3955.027; Fri, 26 Mar 2021
 01:45:34 +0000
From: "Rao, Lei" <lei.rao@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: RE: [PATCH v4 09/10] Add the function of colo_bitmap_clear_diry.
Thread-Topic: [PATCH v4 09/10] Add the function of colo_bitmap_clear_diry.
Thread-Index: AQHXISFlKhXI+bGGokSSPmGHItt8EqqVATwAgAB0/YA=
Date: Fri, 26 Mar 2021 01:45:34 +0000
Message-ID: <SN6PR11MB31038ED3C97A8B7B681543ADFD619@SN6PR11MB3103.namprd11.prod.outlook.com>
References: <1616639091-28279-1-git-send-email-lei.rao@intel.com>
 <1616639091-28279-10-git-send-email-lei.rao@intel.com>
 <YFzRbpcUyLOOYlj8@work-vm>
In-Reply-To: <YFzRbpcUyLOOYlj8@work-vm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.102.204.51]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 900a4097-6a1f-439e-f465-08d8eff8d947
x-ms-traffictypediagnostic: SA2PR11MB4937:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB49370167BB3BACE5528B3015FD619@SA2PR11MB4937.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:972;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jWbK9pLAkGNkQBNJvr1c4HW3jeIaRVVt33i7ikm6sQLUsjsDhEv8vwsd6Zkwrg5EWrF+Rt6rAxEAfyoJuziBcpwHS1xq8kjZOm5iJovxeOnJX4Pjr902oIMgmqVeA7gurdwUyaiNVMhfE2eg9RRcZpF7uXK1UkWMm6ArpPRs08HXatmOXNCMcagpGTRum/SccG+vB37yeHZchqfB3JNilZRFaaeMkuwvCEUxdNM3onmt/+tDdUwsmZKx82DsOfo1pyM9lX0LdgjPFoM3RqsT2qF+SUUH24cYQ4ZY81kE5QFV7cbDQCPsuJzo2wu+51Km7Ci/eeSTkqUDY6KXd02iq63mM7pIqMfVXLFklkR8noAoBU3Jn5xQzKNS1JktM/apn4jKQ5pmYVgOXLLsbziFLoBzQ3iDSXUYV6nE8PCg+kR+LY6bAzdh71zZNDJrD/5ocle1G9ut4p8aQS4ZngHs3+mPVJFUnIEuLTctgdcidTvbyugZaPkybE/BFzHaCRX+iz72j8Y6MpsoY+fen1hpTYOkw6G9lW9A86+vK0Jx538aVCb3pvjr0Ycvf5XVuYLRqO8Lnovru/5e7rb3CA4jKABsXg7n2rb45sOLa7FxSItiD5AbMvoC14CysIp1zN6Hs/goo4PoR809fWKiNlaBl0uZjMaeDYfwD+zG3XWhlVY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3103.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(39860400002)(136003)(396003)(376002)(53546011)(52536014)(6506007)(7696005)(5660300002)(8936002)(66946007)(71200400001)(64756008)(66476007)(38100700001)(66446008)(33656002)(8676002)(66556008)(76116006)(2906002)(316002)(6916009)(4326008)(86362001)(478600001)(55016002)(186003)(26005)(9686003)(83380400001)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?RKgySE/kva7W/Jhv4MyTVEp9stF7ViQbL11kAD/C7bxKu/QYCGlhE2JhB+1v?=
 =?us-ascii?Q?/OS+jeN7thMVjj/VBZ7lqJSdNKEyjEqiVjd4tvrokGUiwHbus91JsYRYVaEc?=
 =?us-ascii?Q?M0zIppSbK2+pqByD7RfTjGwT6w/yFwXQbW2QDr6zBij0UWaJv2xhvvayuFok?=
 =?us-ascii?Q?UYWupQ0LvtjwuAKXj3B0swjlQmXC4ONdU7ksPMfLLFCFh/8jKRKI3Epy+9+B?=
 =?us-ascii?Q?aHHGPPV26VQk+DBRk5nI/nIDkN1sLIMezfocTH1o+wnQj7PC7oVEPZ3zMOjC?=
 =?us-ascii?Q?QgpnalkJrK46llV+qJbt9Ud792uq7O0/2DWkCUz4HPnBLSRI9fKGeHvCGEEq?=
 =?us-ascii?Q?A8018uIfXuVA1ES0F/WUy6KYDyS5xIvIIonpMkq7coQrCbf3gg6SS6yr73s+?=
 =?us-ascii?Q?XyzfkT+/wwafjDUGnGoQlXCMkuzcP4uA0d+f60CBu1dpqB8GWOaw+BmdPRmF?=
 =?us-ascii?Q?WU6BtKShhzVS94AO55WfQ2JrDZLq9czk972urwf4GrDFAeZs/9IwmLvnK3m9?=
 =?us-ascii?Q?7Aud4i2FfsGtbmGIdTEou3ptHDSTnFGlrv5zP+5+ldhdpLmof7JVeH1l2Vev?=
 =?us-ascii?Q?5kkNcZzH60kptOZIFkFk/S/EEAlbbH5ma0fFuFzZYdvu+nESr6V04DmleYFT?=
 =?us-ascii?Q?EUHaRjD+tvmBS/zS2fKNT5gxnvU2ynuoMc6WzT83Lc7C/oa3uqHqdTBcZLsG?=
 =?us-ascii?Q?NBvNYZnCFEuyi9ZsA2sBd7AAsilYthXzipy73UMSB/ur2RYdJYQBr4hIP+q3?=
 =?us-ascii?Q?xyXAAvHMUtCLDl0+nTojfo4egWski7SMNkkHtkWyjJVJdj3HUGNSynT2xkoJ?=
 =?us-ascii?Q?ubAV/7BLAFADNBh8Mbi5VDesieEk+dVlgIMQqsAX7/LzlmHoi9PgSCaaNXls?=
 =?us-ascii?Q?7HM7AZIrolsYMH/EAehUaW7cZxKOb+POWSVvZ7BD0io/LviplQAwR6Ie2V56?=
 =?us-ascii?Q?z9nXIZD4ivGM4KJOGF6yzUA6EgaHlypyErfMZ2pJm52OcCh/CovRKeqM0jNP?=
 =?us-ascii?Q?K/kmz19J2ygpoNTXS+acTedqN2I+O9QMumBSruZmSOFYYeET9PVPkHTd0kZn?=
 =?us-ascii?Q?GegVf1bjhLxhtxVBXDlexhMEUciInQDe2OFU3WyIxyzmKol/E4Y4ujlSOez0?=
 =?us-ascii?Q?RKzjxeFLv0WLKHZdsTKZXz9PI2dQ6aZWYASybecTNTZxX5xEf7qfG+b93pjz?=
 =?us-ascii?Q?1h6a2FCBLv4qSfOoZg0dRfsvPwiOMb26Wm/72VAzOJn5M6W50wL5vaLiCqc4?=
 =?us-ascii?Q?IAcej4Sc6CXZVqcFWMhq/SGKoAJHwX5H1aC6pp2lwUXvrCSMjNyDa4S6iV3C?=
 =?us-ascii?Q?1LM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3103.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 900a4097-6a1f-439e-f465-08d8eff8d947
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2021 01:45:34.8295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iFgctrG3ZpCBItHI0jhcklp7+9N+4MZZDTuRwuhN9+LNcsRXWCLPezZ3Xu/lCarIvj3jzLAHoJpAlHYVk/REqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4937
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.20; envelope-from=lei.rao@intel.com;
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
Cc: "lukasstraub2@web.de" <lukasstraub2@web.de>,
 "lizhijian@cn.fujitsu.com" <lizhijian@cn.fujitsu.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Zhang,
 Chen" <chen.zhang@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


-----Original Message-----
From: Dr. David Alan Gilbert <dgilbert@redhat.com>=20
Sent: Friday, March 26, 2021 2:08 AM
To: Rao, Lei <lei.rao@intel.com>
Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com; jasowang@=
redhat.com; quintela@redhat.com; pbonzini@redhat.com; lukasstraub2@web.de; =
qemu-devel@nongnu.org
Subject: Re: [PATCH v4 09/10] Add the function of colo_bitmap_clear_diry.

* leirao (lei.rao@intel.com) wrote:
> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> When we use continuous dirty memory copy for flushing ram cache on=20
> secondary VM, we can also clean up the bitmap of contiguous dirty page=20
> memory. This also can reduce the VM stop time during checkpoint.
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> ---
>  migration/ram.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
>=20
> diff --git a/migration/ram.c b/migration/ram.c index a258466..ae1e659=20
> 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -855,6 +855,30 @@ unsigned long colo_bitmap_find_dirty(RAMState *rs, R=
AMBlock *rb,
>      return first;
>  }
> =20
> +/**
> + * colo_bitmap_clear_dirty:when we flush ram cache to ram, we will=20
> +use
> + * continuous memory copy, so we can also clean up the bitmap of=20
> +contiguous
> + * dirty memory.
> + */
> +static inline bool colo_bitmap_clear_dirty(RAMState *rs,
> +                                           RAMBlock *rb,
> +                                           unsigned long start,
> +                                           unsigned long num) {
> +    bool ret;
> +    unsigned long i =3D 0;
> +
> +    qemu_mutex_lock(&rs->bitmap_mutex);

Please use QEMU_LOCK_GUARD(&rs->bitmap_mutex);

Will be changed in V5. Thanks.

> +    for (i =3D 0; i < num; i++) {
> +        ret =3D test_and_clear_bit(start + i, rb->bmap);
> +        if (ret) {
> +            rs->migration_dirty_pages--;
> +        }
> +    }
> +    qemu_mutex_unlock(&rs->bitmap_mutex);
> +    return ret;

This implementation is missing the clear_bmap code that migration_bitmap_cl=
ear_dirty has.
I think that's necessary now.

Are we sure there's any benefit in this?

Dave

There is such a note about clear_bmap in struct RAMBlock:
"On destination side, this should always be NULL, and the variable `clear_b=
map_shift' is meaningless."
This means that clear_bmap is always NULL on secondary VM. And for the beha=
vior of flush ram cache to ram, we will always only happen on secondary VM.
So, I think the clear_bmap code is unnecessary for COLO.
As for the benefits, When the number of dirty pages from flush ram cache to=
 ram is too much. it will reduce the number of locks acquired.

Lei

> +}
> +
>  static inline bool migration_bitmap_clear_dirty(RAMState *rs,
>                                                  RAMBlock *rb,
>                                                  unsigned long page)=20
> @@ -3700,7 +3724,6 @@ void colo_flush_ram_cache(void)
>      void *src_host;
>      unsigned long offset =3D 0;
>      unsigned long num =3D 0;
> -    unsigned long i =3D 0;
> =20
>      memory_global_dirty_log_sync();
>      WITH_RCU_READ_LOCK_GUARD() {
> @@ -3722,9 +3745,7 @@ void colo_flush_ram_cache(void)
>                  num =3D 0;
>                  block =3D QLIST_NEXT_RCU(block, next);
>              } else {
> -                for (i =3D 0; i < num; i++) {
> -                    migration_bitmap_clear_dirty(ram_state, block, offse=
t + i);
> -                }
> +                colo_bitmap_clear_dirty(ram_state, block, offset,=20
> + num);
>                  dst_host =3D block->host
>                           + (((ram_addr_t)offset) << TARGET_PAGE_BITS);
>                  src_host =3D block->colo_cache
> --
> 1.8.3.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


