Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7436C3389FB
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:23:42 +0100 (CET)
Received: from localhost ([::1]:60058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKexJ-000389-Dt
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:23:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lKemY-0005wq-Un
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:12:34 -0500
Received: from mga07.intel.com ([134.134.136.100]:1916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lKemU-0000G1-OQ
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:12:34 -0500
IronPort-SDR: DXYA6D6BDuIbAQx2TUtk7riX8Fc8ykCRoqouAwkk9ZoJUwq+ZOTo809T3BuO8tOQIhem0Hr1A/
 d5Xj/XcdKtVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="252828950"
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; d="scan'208";a="252828950"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 02:12:22 -0800
IronPort-SDR: H2DpsZSx3dkWpzBTXQrTVSA1ueE6WZWU6giBPZRHLjhXCO5hQN9KLtSeR/9HpPTXfZJr59hJcz
 3Ll4DMILFYwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; d="scan'208";a="448582054"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga001.jf.intel.com with ESMTP; 12 Mar 2021 02:12:22 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 12 Mar 2021 02:12:21 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Fri, 12 Mar 2021 02:12:21 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Fri, 12 Mar 2021 02:12:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6RnWNhIySUQG+ELsmmcUpHf/QqFPxAUQy747w2g4XiD1EygoWUd32ehPrF/zDhLt9sQr9u08pXdlzF03fUhneEVbsJxucpXMxpbpeBEbozzl8G80yo8LoxzU367Feeenc+8cKgf2gq4DRrqw5Zy013V/x5ovfWpHY/qdtONgTxcUDeHkuiCku4YCv3zY7zOsNLhREPy8lbtTHGL33VPecD9gLxuGpCctfDHBs28Un56LqPVPvMgFnPjJ1zPdbMAPIQTnugJ0/z+6ceJuZ5BBzDkmeHvvfiZwL0YilDCA4u2QJFPIUrPaYT0CdYFXq7ypSy+5Ebjbb+yGULmKoeQhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCkrJl4fhr4gUeTgHp1Ed6SrMM0nEUldOu/uxPzyv1c=;
 b=Yac5fkJ2plBtb9sHTzLJuYbHVO0pVab0SqpiwZymZ0vR4ch660KrCjq/3mxkRa9ossp/OGyYKvEkQbGvbzFPqeV6SVIIK8mpGknLH4SSsELFT4pvnxqqSeLCLtglYLMjeOCMRI9VeONpcWQ4H7iNynABwZ6LDi3A2biOzhrVrhiQFhTOLEtkKdGOQqLLGIw/R/zB1yBOQSwmDKD2BpdE0JKYX+qmtayUYAcZWnS4J2hsh5p5gndZSr3ZTAW/3l1XqJh+1/0OLSw/r+aOKAxrYnW7XaZGBXA7WVGmV0+qB6SygsbfJJ6QSxn4KiE6zC4QgLNeKM+5EgFMnL1/NZ7YNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCkrJl4fhr4gUeTgHp1Ed6SrMM0nEUldOu/uxPzyv1c=;
 b=AA6PfZy0mzW2cnSe/pnNuOsdt32Fbu75gAA9wmtdJoTjL4+OiKFOyN30mre3xhN4fvQg9ua7B8lPpzJ769XXb/DKm+TnzDNENtkUJk3ZMr6ki+TYFf0ZqkDC1YfyE8ZOUJ2cF+B53++Hhchw+9R3sMEEuh+dOi8138e8luDTB1w=
Received: from SN6PR11MB3103.namprd11.prod.outlook.com (2603:10b6:805:d7::13)
 by SN6PR11MB2831.namprd11.prod.outlook.com (2603:10b6:805:56::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.30; Fri, 12 Mar
 2021 10:12:13 +0000
Received: from SN6PR11MB3103.namprd11.prod.outlook.com
 ([fe80::c9c2:8157:5bef:9b2]) by SN6PR11MB3103.namprd11.prod.outlook.com
 ([fe80::c9c2:8157:5bef:9b2%6]) with mapi id 15.20.3912.030; Fri, 12 Mar 2021
 10:12:13 +0000
From: "Rao, Lei" <lei.rao@intel.com>
To: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>, "Zhang, Chen"
 <chen.zhang@intel.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>, "dgilbert@redhat.com"
 <dgilbert@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "lukasstraub2@web.de" <lukasstraub2@web.de>
Subject: RE: [PATCH v2 08/10] Reduce the PVM stop time during Checkpoint
Thread-Topic: [PATCH v2 08/10] Reduce the PVM stop time during Checkpoint
Thread-Index: AQHXFwAt39LtZ3Qgo0+NHBTlJ8r8Jqp/+8AAgAAiLoA=
Date: Fri, 12 Mar 2021 10:12:13 +0000
Message-ID: <SN6PR11MB3103AFBA3589DE71590E6D3CFD6F9@SN6PR11MB3103.namprd11.prod.outlook.com>
References: <1615525383-59071-1-git-send-email-lei.rao@intel.com>
 <1615525383-59071-9-git-send-email-lei.rao@intel.com>
 <fdcd27dd-3a11-8584-e7da-5d703de0dceb@fujitsu.com>
In-Reply-To: <fdcd27dd-3a11-8584-e7da-5d703de0dceb@fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: fujitsu.com; dkim=none (message not signed)
 header.d=none;fujitsu.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.46.39]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 511a0175-10be-431b-1385-08d8e53f4e7a
x-ms-traffictypediagnostic: SN6PR11MB2831:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2831DB46B2C676FA8A66D983FD6F9@SN6PR11MB2831.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5u5GuS/eIlbUZCDDcIxz1dFaJt+jni1209O5niiwqwpechu+/WIkYJv+or0zcPx8XdhWp/rcefACu6WYtyld0UHVDuQKT5F+4Q1YvC4QP7nMeicxOn28A2Or86wd6gmBklA4N+mgxd2IySJlCNNKBELQQAXVPQFrmb7nMQoEtWcHM0ib1pb984CQclVeH3+Axk8C/4MgMw/53PxoJ4/JvaGOolGnk17Bdwm/ngxcEHx25ID1hh3PxpHm6a2PFb0HGDXWgjK4nhyVfTb/5S+enwaMY3bF9TvB5B0Z1XvyDgEon0n5Ia0k5qeen0cS4WtXsGNynsugOWReX9cDkmyxDPVXXZrVNNSbHU8kId+r/GzZAMS4rvFJNo52UzOCCRnC5nRH6ECvZGBcG/cqGpJTuTHBBQ0M0G7p8QP4h0SL7gWGstyeA9zZ/Vok159cBet8gOdjPo+vrh4qO49U92cBq99MXe9lM8sTtKYDR/cSRJSvXpgWFHyIip2/7lLr4uoxxjwWSfZNpoj/oGYwWuCQpA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3103.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(376002)(136003)(366004)(39860400002)(110136005)(186003)(53546011)(86362001)(76116006)(4326008)(8676002)(6506007)(26005)(8936002)(316002)(2906002)(5660300002)(66556008)(55016002)(33656002)(52536014)(66946007)(66476007)(83380400001)(64756008)(7696005)(71200400001)(66446008)(478600001)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?0IVylHmQpHo7VoVdLLNUVllpSTRMUeM73dvLNd9PESz5b4L4TFyL56BusjNu?=
 =?us-ascii?Q?ilMP6BxhvdgVi+RuX86mTB4Tkv37NaVYDtb91GYWdNkTSuPZRu7SiQzWr8yZ?=
 =?us-ascii?Q?knce6zvIur2Y3GDFgqwzT+0HVtrzXkUoP9BZkJfSrUQsQR4hca6BtIRPoqBK?=
 =?us-ascii?Q?oFmJOEpigDXhb/CwEwqGP52yaPeOtGjMRqlwxyr3mnuKNOzf2sZ3Z590hYQJ?=
 =?us-ascii?Q?Re+jEs+CeRTO6Tyqt9I0FV54noyvjpa/0M87vw3boWYr8eI/PSEUvtrmDBo3?=
 =?us-ascii?Q?e66FH6gOpfYopETwMOHV27jbdPq908sfhkpEUNv7+oEqn9c/Gtd1yRiuYaJH?=
 =?us-ascii?Q?6NrhlSQCixz5okL3IXO3amKJtksmvJ10hCN3ShcbK1w9VfYJNAQ/KIh0M+rU?=
 =?us-ascii?Q?ozo4V2vrTyrSkc3cMDmceIOYWpNgIjQhUZ34Az3dV6xGV1oWtRyrqbnc739Q?=
 =?us-ascii?Q?mEprEFaUu0npy9pcVfcsCe/g1nV3fiWTl3+xKnbI5T41Mj1ZCFVdAXxS3Dk7?=
 =?us-ascii?Q?HDnIRbfwX9+sipwoDStjT9him8nnmqbg7nxIpNN5aCDOQY1W3PEpkW5HrdKv?=
 =?us-ascii?Q?IRSNx+cnADVRdQfgttFY6Wr/Pny29wL9AfvdwPsa00xburc3PJoGeaz9Xmcj?=
 =?us-ascii?Q?tFP+INJFNJFWu5zKsGkDub6vmTIaoakt2UzSxSx9E3NuvxJzpISsQa5LwjlF?=
 =?us-ascii?Q?vr0vYD7RdvKzKYZQEIP/J4whPjSthA7tisEWaOvS74T4QPWXuMMTH1QMBHO+?=
 =?us-ascii?Q?gb4VonoBD+rh8jYCIACZQPX9KBRFfFuawIr3ftnQNiNW+U1QBgsMbKM62JTU?=
 =?us-ascii?Q?xjZltQtTr1Yu/xDk1w9da6am7857GnuUyqm2gdpH1aC3SPfq2tHv7LOWosKu?=
 =?us-ascii?Q?V9Jyf5Uv9xJWcCFKqwflJ4cLUALRs/1FkFQVn1LNik+liTVX+6DFDcdAXe2Z?=
 =?us-ascii?Q?InvKcpaqHZe0K1LmQ9Ss0NJV+ofSA6jD4WiUkQPycrCre/+Imbeeq4xQbYw6?=
 =?us-ascii?Q?3bsy6fZkPMjgWNMqZ0r+i3r1V+5mjvwFZ+RWnCYR4LbU+1NZg4kxXF533Af4?=
 =?us-ascii?Q?WgFKU6K6AT+nZG7SJmEaEm5cvMNzUdpyHlw1rfXvkGBNI4uqQH/tmnTOYmoU?=
 =?us-ascii?Q?wSkW37FkipzTau1dlpPLFZ/HK56qfWzjS6D6uFdR4ThsskosajcBUIlCbyUL?=
 =?us-ascii?Q?myh4CAxkmZ3fIy9gChfVQ/do1ajf+Jhf4UZl4DsEwUNz8Ki47Dp0sIa0NEpc?=
 =?us-ascii?Q?W/s+VY44cbUwJ95BRV5dSyfpZPvuakCf2nNGQhBzjbxXjIdPdv+d8b6tecUV?=
 =?us-ascii?Q?roc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3103.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 511a0175-10be-431b-1385-08d8e53f4e7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 10:12:13.3729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fuU1WIEQYbfuo4/YTma7N7BXkXFWxIkSOnQ7dBHRgizp15p8VIGQz5bfEnEBK+cR9Zlp04QYpRU8vOVpXqjR4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2831
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100; envelope-from=lei.rao@intel.com;
 helo=mga07.intel.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think it's enough to know the start and the number of dirty pages in the =
bitmap.
Because the size of consecutive dirty pages can be calculated. By the way, =
no problems were found in our automated testing.

Thanks,
Lei.

-----Original Message-----
From: lizhijian@fujitsu.com <lizhijian@fujitsu.com>=20
Sent: Friday, March 12, 2021 3:54 PM
To: Rao, Lei <lei.rao@intel.com>; Zhang, Chen <chen.zhang@intel.com>; jasow=
ang@redhat.com; quintela@redhat.com; dgilbert@redhat.com; pbonzini@redhat.c=
om; lukasstraub2@web.de
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 08/10] Reduce the PVM stop time during Checkpoint



On 3/12/21 1:03 PM, leirao wrote:
> From: "Rao, Lei" <lei.rao@intel.com>
>
> When flushing memory from ram cache to ram during every checkpoint on=20
> secondary VM, we can copy continuous chunks of memory instead of
> 4096 bytes per time to reduce the time of VM stop during checkpoint.
>
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> ---
>   migration/ram.c | 44 +++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 41 insertions(+), 3 deletions(-)
>
> diff --git a/migration/ram.c b/migration/ram.c index e795a8d..b269637=20
> 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -823,6 +823,39 @@ unsigned long migration_bitmap_find_dirty(RAMState *=
rs, RAMBlock *rb,
>       return next;
>   }
>  =20
> +/*
> + * colo_bitmap_find_diry:find contiguous dirty pages from start
> + *
> + * Returns the page offset within memory region of the start of the=20
> +contiguout
> + * dirty page
> + *
> + * @rs: current RAM state
> + * @rb: RAMBlock where to search for dirty pages
> + * @start: page where we start the search
> + * @num: the number of contiguous dirty pages  */ static inline=20
> +unsigned long colo_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
> +                                     unsigned long start, unsigned=20
> +long *num) {
> +    unsigned long size =3D rb->used_length >> TARGET_PAGE_BITS;
> +    unsigned long *bitmap =3D rb->bmap;
> +    unsigned long first, next;
> +
> +    if (ramblock_is_ignored(rb)) {
> +        return size;
> +    }
> +
> +    first =3D find_next_bit(bitmap, size, start);
> +    if (first >=3D size) {
> +        return first;
> +    }
> +    next =3D find_next_zero_bit(bitmap, size, first + 1);
> +    assert(next >=3D first);
> +    *num =3D next - first;
> +    return first;

The idea is outstanding

i wonder it should return (next - 1) ?

Thanks
Zhijian


> +}
> +
>   static inline bool migration_bitmap_clear_dirty(RAMState *rs,
>                                                   RAMBlock *rb,
>                                                   unsigned long page)=20
> @@ -3669,6 +3702,8 @@ void colo_flush_ram_cache(void)
>       void *dst_host;
>       void *src_host;
>       unsigned long offset =3D 0;
> +    unsigned long num =3D 0;
> +    unsigned long i =3D 0;
>  =20
>       memory_global_dirty_log_sync();
>       WITH_RCU_READ_LOCK_GUARD() {
> @@ -3682,19 +3717,22 @@ void colo_flush_ram_cache(void)
>           block =3D QLIST_FIRST_RCU(&ram_list.blocks);
>  =20
>           while (block) {
> -            offset =3D migration_bitmap_find_dirty(ram_state, block, off=
set);
> +            offset =3D colo_bitmap_find_dirty(ram_state, block, offset,=
=20
> + &num);
>  =20
>               if (((ram_addr_t)offset) << TARGET_PAGE_BITS
>                   >=3D block->used_length) {
>                   offset =3D 0;
> +                num =3D 0;
>                   block =3D QLIST_NEXT_RCU(block, next);
>               } else {
> -                migration_bitmap_clear_dirty(ram_state, block, offset);
> +                for (i =3D 0; i < num; i++) {
> +                    migration_bitmap_clear_dirty(ram_state, block, offse=
t + i);
> +                }
>                   dst_host =3D block->host
>                            + (((ram_addr_t)offset) << TARGET_PAGE_BITS);
>                   src_host =3D block->colo_cache
>                            + (((ram_addr_t)offset) << TARGET_PAGE_BITS);
> -                memcpy(dst_host, src_host, TARGET_PAGE_SIZE);
> +                memcpy(dst_host, src_host, TARGET_PAGE_SIZE * num);
>               }
>           }
>       }

