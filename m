Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39381324CC6
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 10:27:03 +0100 (CET)
Received: from localhost ([::1]:50342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFCvG-0006nZ-8y
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 04:27:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lFCrG-0003Pa-IP
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:22:56 -0500
Received: from mga18.intel.com ([134.134.136.126]:3244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lFCrB-0002GJ-EE
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:22:53 -0500
IronPort-SDR: +0KVbr9c6l/nek02ivBktGyL/Lu8JbVsRobkj8YXjrD5CIE0eRB+ePoL0Y05vzPAiwo8solK4G
 OLNf2gElWVOA==
X-IronPort-AV: E=McAfee;i="6000,8403,9905"; a="173118462"
X-IronPort-AV: E=Sophos;i="5.81,205,1610438400"; d="scan'208";a="173118462"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2021 01:22:44 -0800
IronPort-SDR: RdOxWkHUafXFXYJEZmSGxf3p7XYuDZmH3BW/MTcAgBuYK/+vPAVWn+0uSERGsAqYxOEmHU+H53
 dhnnYRRyotkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,205,1610438400"; d="scan'208";a="500019944"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2021 01:22:44 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 25 Feb 2021 01:22:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 25 Feb 2021 01:22:44 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 25 Feb 2021 01:22:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jlPEQ0CgcrG+lUK0c0EfTdPJpVctjyOctZfO5Tl+B51Bi4BfynulTgVNifnOUdtWANmpE0IVIwV16gzxDqnzROYr7gLKYJS4ytGfjeyCgBGLvMZSVsYzh5p+MRzjrNjBSbd0Tq+mkTgxRBtoHpIlK1oxIlH+P8SGaEIAy4AIDhNoNM34xdBfZ49IjGPFgd1VAv/P0ijg6m7AqeVl9QeKsXzjFGTA1Hco5gCqxB2aYL87YU18Fl/iemK/4PnIn6j2fFQb8DaG/f/SYK2spGeUkHyMx6vPRKamNm4ZU3g8aOBAHAIu+7oWoO52npJTFiZx4ZDKB7Ig6Gv/z+UPlcpxZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIB99v1lEHKuRUlW0ifglLNtQL+tJweVz20dyibxXa0=;
 b=meKDZKf/TGtxjgKNSfbDJkTlAyVVxombLo1S3DbGw0A5DcXOXVN/M6H01dZcx0KcXY9tx6H7ElnfsqkE36Hkvscqg1Pq5Q86j2RNmVRAB9boqBbvF6rjYjsH1DSvJ2JLnDDnhB8kQfQ8yvwfnRT6lH9XYW1ZJqtAu5Rffku9ZYn+WEXNGm+3XUh+MvNGLWGWpdzWiYMRzd0649B+8KxPb2z8pNCH3lj6cgxVmDW7KgNvGm5pOiwePl6jI728gDORoLa81L+z8LHVYzRlCjmzoRy1yMAwFTYCf+P2ZuS+asiBi4q3Bg1PkmdFiccLmOnVrAyhUyzzoIDrbF7CLlG3BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIB99v1lEHKuRUlW0ifglLNtQL+tJweVz20dyibxXa0=;
 b=NRUgMsOAaWZHfmefQm0LK8jzauVzKajuhejI11H+/zoBTzPCoYiAqDfHoj25HP6uAUyvZVzjr3PrTIBx7R/SxfTeW7z03hBxwucN1GxTKV4DqpMJIc7dx7++eHA1fNYTGqjJiFgTUNtdzBU6H5H/CVv5HGlJqJoeeq/9KihwnGw=
Received: from SN6PR11MB3103.namprd11.prod.outlook.com (2603:10b6:805:d7::13)
 by SN6PR11MB2734.namprd11.prod.outlook.com (2603:10b6:805:59::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Thu, 25 Feb
 2021 09:22:40 +0000
Received: from SN6PR11MB3103.namprd11.prod.outlook.com
 ([fe80::83f:2327:82d6:318b]) by SN6PR11MB3103.namprd11.prod.outlook.com
 ([fe80::83f:2327:82d6:318b%5]) with mapi id 15.20.3868.033; Thu, 25 Feb 2021
 09:22:40 +0000
From: "Rao, Lei" <lei.rao@intel.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: RE: [PATCH 07/10] Disable auto-coverge before entering COLO mode.
Thread-Topic: [PATCH 07/10] Disable auto-coverge before entering COLO mode.
Thread-Index: AQHW6VdRtmB/U2hNXkicEjUbh9zHg6pXrC8AgBErHEA=
Date: Thu, 25 Feb 2021 09:22:40 +0000
Message-ID: <SN6PR11MB310308B3A5FB7E5F615FB189FD9E9@SN6PR11MB3103.namprd11.prod.outlook.com>
References: <1610505995-144129-1-git-send-email-lei.rao@intel.com>
 <1610505995-144129-8-git-send-email-lei.rao@intel.com>
 <20210214115206.7d851b22@gecko.fritz.box>
In-Reply-To: <20210214115206.7d851b22@gecko.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: web.de; dkim=none (message not signed)
 header.d=none;web.de; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.102.204.37]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01790aeb-20de-4369-d976-08d8d96ee623
x-ms-traffictypediagnostic: SN6PR11MB2734:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2734A299BAEC32D4F203D88BFD9E9@SN6PR11MB2734.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:510;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UBPCi19NQFOrNF73fsosvqQKFE39c4JZPcckH0lab/JEpfdMlJtBYYJvWbjwBOAuQiSiwfA53UlYwn3qeAlQrtvOw4PhR24PGdLwb1EZoqMogl4PhChsk0AwG1o6Deq7kYQeCtR2YaOCc+a7SlmaA63drzntAHPTuUEmdF+o/tMgSqbm2yX+xHnWwXiUWLM9ONepujbU0Oq9Yew9eALZdrLWjIIoJQ8kEZE0ln6MyAHhwWjlCaO4wZHKa6ggAhzukFCgdDooB53Jo/a6uidui5sto4wGlIwXtTR8DKvGtwCg+EXmHAE0XUXaFUGgc6si939C/JtJn0eWACGXFqV8cb5ZvW6ocBM5e/VfvAVHtV0MXOC0TLBZ4DHZtm/K+xuO/3uZPW+YwtUx1mcqqUz3lN8/Y9089KuYwHSgPY5DEHD+fOmxDfuqBHyeclihsaw9Y+5nxOPVPcDQfmlPnTMof6cM7R4sg020F0znCXhwaMg8jzK4K5W+V+ON4+P9Gpfyifhy/OVFnhacNvTk1G4ljg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3103.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(136003)(376002)(346002)(396003)(186003)(76116006)(316002)(5660300002)(9686003)(26005)(8936002)(4326008)(7696005)(478600001)(66446008)(86362001)(83380400001)(71200400001)(66946007)(66476007)(66556008)(55016002)(52536014)(8676002)(33656002)(64756008)(2906002)(6916009)(54906003)(53546011)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?GxM5MYfTXXJsAneaETY74OftzSUV5LV2sT67s7npzDZw4qk/JBVlQi5LL+IM?=
 =?us-ascii?Q?nFZ9fJnlWM5AaHHe0aGQFAdyIy870cNOaOXs0vsAj0rue2Ge55h1O+YlAf3M?=
 =?us-ascii?Q?yytWrx7p04GTOVXjWsemsqUyvvfGhIDkzqvQU2G32Ww6FTvd+27Spbp3CzAq?=
 =?us-ascii?Q?s3pLueKDBx1Sci2uk86K5gZIZHnP0Hve1GeETFHYuNaSN9yGgCGZMtN4ymP+?=
 =?us-ascii?Q?U0pRbCR8opqgh28x5ocBLa4g1CRbuNKTYFfLa28hA+Ni+jTFpmz3WvJIciOV?=
 =?us-ascii?Q?SLizKbKzg3+kWv3y4idDPxHo8hmnJCLpuJIBYNaZ7k1itDgVI/VpBoUDyE6e?=
 =?us-ascii?Q?KGD+TO465UU1gViyTyoascYujU1RBf0P/3jmNV2nrNXulFt5dDUwJ+Od4wKd?=
 =?us-ascii?Q?Kl0OynA8Z8ik0P0ApKpx/sNDALYPGotU8ucLxDvzmuVy8afh+IkMpli0mXls?=
 =?us-ascii?Q?gnGQj2WQTWu7WdnhTswMhcxd1pHgormI8tV3XCyCf3boKizDX4RzKoGa+o1N?=
 =?us-ascii?Q?PbCaiWLX8/WOKPkiFX6R2iFitY4NCmK/hVubdVajNGi3vD5OKA/cqiaImW1/?=
 =?us-ascii?Q?l4PUEbingJMAcqkwlszfTQMJPBNzGS3TUn0QKC8KzjIT3zhzpverNlxG8JsU?=
 =?us-ascii?Q?kpgybbBXYlSCSzEN28sHTGHFF4W1Eodrf0xGWsq31sTGkwGUVLZUe4Y9ZLLH?=
 =?us-ascii?Q?gDvJNks4hzFV/RwQRmLyeh+8xVdb2BAkmQE/lcuLn5bGTctt+HOwpP3jc3vM?=
 =?us-ascii?Q?kc68lvWYOPrZHcJ1ohK2Hr4zJOEq65ixTMmqVsvCNTxO4vw7jp0mLTcwq8Bw?=
 =?us-ascii?Q?hdxPIjuwMbt6YYn/W/x+4fnrCELZErJvpTTncbThc7ku0l9qXPQjaqSq4g1s?=
 =?us-ascii?Q?q3Y4zI6Kiz7ojs1fapLkWs6cUNkMAZsnJIGzMKRGEhZE/KGcV2Gvua4xVHRu?=
 =?us-ascii?Q?yiDm7utb/WZqdrL3AAHQTGrXaeNuN3+QDOU0Az/GPGkVgvG7O4eFzBf7O7Ed?=
 =?us-ascii?Q?4XKZtpoW9ji/pabkgBvhDXKj6mUSaiJFx/lHeEDRTV+ySNkksT0cGAoRuKjn?=
 =?us-ascii?Q?tU8khsmju0cGmNASq2lq+MBrOy5e4+rVClsTCgJ8/W2TqqGAvshTZtcP7huT?=
 =?us-ascii?Q?gpMSnTN3//V6CwBWr/lmu33wuDFXGkdLY/xZPL0LubvhaZSuoBm8HsMcvGIe?=
 =?us-ascii?Q?qG5JuQBcrLk6VX3MT6gvhOeGfbT1JpbL4yfPLDr+LiXhUfsdjDnebqzURcNV?=
 =?us-ascii?Q?+OH3iXp6LyFdGcuqk+FNvanEEnPGihCT8BSUrDAPee435/gallDswW8dMt4Z?=
 =?us-ascii?Q?/b72KUXSeC4AwP4xEIgVFCoF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3103.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01790aeb-20de-4369-d976-08d8d96ee623
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2021 09:22:40.2384 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Du0+O3CF/nCsqCsPUz4DgYPLEjugFujee1UWTExTm5g7VRANwJyXYAlYPwPpiFLwJtbiUKu2dcr9o+u84SQcJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2734
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.126; envelope-from=lei.rao@intel.com;
 helo=mga18.intel.com
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
Cc: "zhang.zhanghailiang@huawei.com" <zhang.zhanghailiang@huawei.com>,
 "lizhijian@cn.fujitsu.com" <lizhijian@cn.fujitsu.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Zhang,
 Chen" <chen.zhang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry for the late reply due to CNY.
Auto-converge ensure that live migration can be completed smoothly when the=
re are too many dirty pages.
COLO may encounter the same situation when rebuild a new secondary VM.=20
So, I think it is necessary to enable COLO and auto-converge at the same ti=
me.

Thanks,
Lei.

-----Original Message-----
From: Lukas Straub <lukasstraub2@web.de>=20
Sent: Sunday, February 14, 2021 6:52 PM
To: Rao, Lei <lei.rao@intel.com>
Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com; jasowang@=
redhat.com; zhang.zhanghailiang@huawei.com; quintela@redhat.com; dgilbert@r=
edhat.com; qemu-devel@nongnu.org
Subject: Re: [PATCH 07/10] Disable auto-coverge before entering COLO mode.

On Wed, 13 Jan 2021 10:46:32 +0800
leirao <lei.rao@intel.com> wrote:

> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> If we don't disable the feature of auto-converge for live migration=20
> before entering COLO mode, it will continue to run with COLO running,=20
> and eventually the system will hang due to the CPU throttle reaching=20
> DEFAULT_MIGRATE_MAX_CPU_THROTTLE.
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> ---
>  migration/migration.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/migration/migration.c b/migration/migration.c index=20
> 31417ce..6ab37e5 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1673,6 +1673,20 @@ void migrate_set_block_enabled(bool value, Error *=
*errp)
>      qapi_free_MigrationCapabilityStatusList(cap);
>  }
> =20
> +static void colo_auto_converge_enabled(bool value, Error **errp) {
> +    MigrationCapabilityStatusList *cap =3D NULL;
> +
> +    if (migrate_colo_enabled() && migrate_auto_converge()) {
> +        QAPI_LIST_PREPEND(cap,
> +                          migrate_cap_add(MIGRATION_CAPABILITY_AUTO_CONV=
ERGE,
> +                                          value));
> +        qmp_migrate_set_capabilities(cap, errp);
> +        qapi_free_MigrationCapabilityStatusList(cap);
> +    }
> +    cpu_throttle_stop();
> +}
> +

I think it's better to error out in migration_prepare or migrate_caps_check=
 if both colo and auto-converge is enabled.

>  static void migrate_set_block_incremental(MigrationState *s, bool=20
> value)  {
>      s->parameters.block_incremental =3D value; @@ -3401,7 +3415,7 @@=20
> static MigIterateState migration_iteration_run(MigrationState *s) =20
> static void migration_iteration_finish(MigrationState *s)  {
>      /* If we enabled cpu throttling for auto-converge, turn it off. */
> -    cpu_throttle_stop();
> +    colo_auto_converge_enabled(false, &error_abort);
> =20
>      qemu_mutex_lock_iothread();
>      switch (s->state) {



--=20


