Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 724E92F58DF
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 04:23:36 +0100 (CET)
Received: from localhost ([::1]:44830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kztEU-00027Y-TI
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 22:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1kztDD-0001hE-A1
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 22:22:15 -0500
Received: from mga09.intel.com ([134.134.136.24]:16820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1kztD7-0008Ps-4i
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 22:22:14 -0500
IronPort-SDR: PGKTGYjwZQkbgda5dUfC6FkVaHxQ9YP2jDs0vZFyGBf4Ri1o+708LYDTf5TSb1DznWSjKWWxHS
 khIqnkVknVXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="178447848"
X-IronPort-AV: E=Sophos;i="5.79,346,1602572400"; d="scan'208";a="178447848"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 19:21:57 -0800
IronPort-SDR: Ny2Y2hKWfKVV5WryDI0khRU3s1J+iNs0+cINlgBSF5OrmknJLvqu5xV6+MFcc47V5xwJxrSIPU
 lu+1186XAdkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,346,1602572400"; d="scan'208";a="349029322"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 13 Jan 2021 19:21:57 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 13 Jan 2021 19:21:56 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 13 Jan 2021 19:21:56 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 13 Jan 2021 19:21:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTOESSGvyzFonxY93RulWOsHLkVH91x6u/ewOplQcm6ymm9Q7JDSgtifEOQB2TklTFhUmkk0P4igIJFhpyR7UPl6CsQ6OWmyElxHu2aXRozv0x+LOI/31dujgFGfWb2s0VpStZiuuDIyo+vvd0n3phTUz6Xpe3Ta2ohxl/NiJpFnKTBzlBMK3u9828Y4VEPbsnS2x8BKFWRjcpJcv2uOsziMxWTCWwb1ItLYAugXmBZvckwOwlaeWtPR5yaKJTtkXublRUd5wAdwoKqdujAgrkdZcng1ttTV3WL984mKqTon8cl2tQezo1ICxAZLhXrC13yCoqwkSZKUTO42AaafDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkSpgevrAVnOjCjfSLlGBPOo/Le6hLVe3ncqS0jXQjY=;
 b=ZL9oPUZiSWGq1tko9f9SN9GVwLZIY7BjoGuBJUVsrFR8B9M3alC9RGxmTEk9z+K0QFgKNrOpj0qT0NTx4VO0hnWOzdgXsAKvkiinmBR6hgHfZs91rZrDjtyVQVfaC71s19N82CdBW8i8+R/UhqT/RTGQwm/y5bGSJA9eIeiLsMGpZ6CqEzFJmq0mQy+/SPFjobDYlGzc5NXobmEdnkM55zEDGXwXBRphOwyuT3o4SPcmCGElWNf2IeA3FGE/rmEuHB8EsABctOcboSe7yHXoH6QlwfMoi4wrVGsLMxtyfWSqtOerGopUFnfT1Uqx0iYd3rnE3vAJ7X4SJL90eDuJYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkSpgevrAVnOjCjfSLlGBPOo/Le6hLVe3ncqS0jXQjY=;
 b=Kw+5hOd1y2PPx/BhiQQQA3bRPfuzcqIE9mg0Ix9omFKINube08V9v6z9nyByr9xWiZKqr2rap+fFQZVc5tXuxE+Q9ryp3wF0UQqtq2E7maIHRsvlpKhAMe/9AflwVpDxH8ENmEc5Ok0ZDTKo9tIFRxRwCZQyOTyUKY6BfGOFMEk=
Received: from SN6PR11MB3103.namprd11.prod.outlook.com (52.135.126.205) by
 SN6PR11MB3152.namprd11.prod.outlook.com (52.135.124.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9; Thu, 14 Jan 2021 03:21:52 +0000
Received: from SN6PR11MB3103.namprd11.prod.outlook.com
 ([fe80::b579:5968:957a:e399]) by SN6PR11MB3103.namprd11.prod.outlook.com
 ([fe80::b579:5968:957a:e399%3]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 03:21:52 +0000
From: "Rao, Lei" <lei.rao@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: RE: [PATCH 07/10] Disable auto-coverge before entering COLO mode.
Thread-Topic: [PATCH 07/10] Disable auto-coverge before entering COLO mode.
Thread-Index: AQHW6VdRtmB/U2hNXkicEjUbh9zHg6olbJiAgAEITNA=
Date: Thu, 14 Jan 2021 03:21:51 +0000
Message-ID: <SN6PR11MB31039A044F7094ACBDCCA1A8FDA80@SN6PR11MB3103.namprd11.prod.outlook.com>
References: <1610505995-144129-1-git-send-email-lei.rao@intel.com>
 <1610505995-144129-8-git-send-email-lei.rao@intel.com>
 <20210113113131.GF2938@work-vm>
In-Reply-To: <20210113113131.GF2938@work-vm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.46.39]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8eedcae-6ad9-40b3-f8c7-08d8b83b896e
x-ms-traffictypediagnostic: SN6PR11MB3152:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB31522B1C364A0A9675D0A189FDA80@SN6PR11MB3152.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:820;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1VkUp8WNKg0Ugm0vHNj08R9/GEibW+JauexJc2yTC8YaRCHHYaAkvDhkqLWJocQ6Cv5E9/w74XJNuPT1ryvI0spOtCbBbCgEswW5SKlEDfohfyCOlWbt29Wg6l4CExSC5VM9TxrcLHb3Nvjh2idWyHdKAs5tF6OQTyhy5S/0M04l/D1GJ2VCc9IW9XdqhHZLAftejGsiBI7kwDFOLRnasuIuBa5z1+JkbMZOZHaHvVddxEVkrcXLCowQ8P38x8Qe1BDfFbvLG1kxz4C1igEUfBVtKP+8LNWJxsZ5pHdryvUikZPCFbwczhSm4r5gW3Q6WrmLsG+Cmu0jpkEdiZIdX1ACrvvhRcin6FHLc8XmgsKHaZ2+Y+YCozk7VTl1mZ4n
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3103.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(76116006)(66946007)(52536014)(186003)(66556008)(33656002)(26005)(6916009)(4326008)(66476007)(83380400001)(64756008)(5660300002)(2906002)(53546011)(66446008)(6506007)(9686003)(8936002)(8676002)(7696005)(55016002)(54906003)(478600001)(316002)(86362001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?rR531RhqQJXBZAEt/HTAGy59a6lmAIeuwqHJLrMNTmngpigfVEh+3nF4yVjI?=
 =?us-ascii?Q?kpa83ml3dMJZe+Ja/CkykeOFMitdvLCMoQ2LmRnTmtNHMiLOdl7lBnrXEoE4?=
 =?us-ascii?Q?Bpg7rtRayKbLo14f2FhyxyjNXTIrLPEPJ08FBdMtGYdkpL9WPjTPwhC1t52B?=
 =?us-ascii?Q?SHRABaTvTAAGKZw84ZT47pAGYwQUUen75Xj5DZupsXPVfzV++kKRs6v6vhmi?=
 =?us-ascii?Q?pizvUjw46XFdVAwVXNAl1IOCnvgfeRMMFyBT9U0FdLc7vmCpP2gdTu3atHNE?=
 =?us-ascii?Q?PDcebOk0WXjlmNyS686+XV5nKUOvF+7m1BWIXsGBacMpt53jrhRlA9gpz4XK?=
 =?us-ascii?Q?K++yZ2hd6ZLzlHxKU+j9cg/Ul4uWgNpBSeZfQJwXZ/di6ayP7vHsGEH/OOsf?=
 =?us-ascii?Q?Apl6qcZV4BAPkycZPfbmibwyTvE/cUTbitJAcIf9QEUZaR8Cpn18Z0sUYe+w?=
 =?us-ascii?Q?5UQlwkvQYagaYKQvdfFunv8bQhOqpRXgWoDeNhlTFCghO04rZWY+/Db6CqGU?=
 =?us-ascii?Q?NvBC+4Kh2J+xgotj6F2AW2ADYe3TXykHQq0GzhBFTJ6Bc0IfT4R5lNgQFvjg?=
 =?us-ascii?Q?oQT6n6DDOYS7LYXSOlJ9Amm9uk1cr2N3bxZxbjR3nVZRW9faI0URjadnNh4t?=
 =?us-ascii?Q?UwNkhRmtjsYm4JHOFFGQE3yO9gIcVL3U5IUWw87DN3F3SaXkDo77WrZdtOrv?=
 =?us-ascii?Q?/xtZ744yPlqaihkQua5SviT+nNkH5Jd9psrGMNWl3VAdmpTv1JDWnYu5mbOw?=
 =?us-ascii?Q?cPgaHm+vQpCXeWIUwWyLCWRiGWqSVDICQanorH/RKr0Vg2DXztjOqOjq6VBc?=
 =?us-ascii?Q?dtM/4LqUtCKpP26e6rhr17dpTWSh6CuNdYH/mqcQ7IZIem+L9UDoJHtaPL4V?=
 =?us-ascii?Q?6qcMBy8vRYqaiJCbu/mmaeVuD49dhFxE1/JPQLclYU1LBTYhXbAmFcrC6yfP?=
 =?us-ascii?Q?YXR2dgAJ9aWfR5BpWlhUHH7xV6hLXxRbq6jiqGvWwJA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3103.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8eedcae-6ad9-40b3-f8c7-08d8b83b896e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2021 03:21:52.0118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aJvH9xCyqINPqft+lsah7QJeH3Twco89aXS3AMXwRG6ebOYy4i2zfuM+ojmGgq73sJL/D8QS6XXiVZVNqyghRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3152
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24; envelope-from=lei.rao@intel.com;
 helo=mga09.intel.com
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
Cc: "zhang.zhanghailiang@huawei.com" <zhang.zhanghailiang@huawei.com>,
 "lizhijian@cn.fujitsu.com" <lizhijian@cn.fujitsu.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Zhang,
 Chen" <chen.zhang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think there is a difference between doing checkpoints in COLO and live mi=
gration.
The feature of auto-converge is to ensure the success of live migration eve=
n though the dirty page generation speed is faster than data transfer.
but for COLO, we will force the VM to stop when something is doing a checkp=
oint. This will ensure the success of doing a checkpoint and this has nothi=
ng to do with auto-converge.

Thanks,
Lei.

-----Original Message-----
From: Dr. David Alan Gilbert <dgilbert@redhat.com>=20
Sent: Wednesday, January 13, 2021 7:32 PM
To: Rao, Lei <lei.rao@intel.com>
Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com; jasowang@=
redhat.com; zhang.zhanghailiang@huawei.com; quintela@redhat.com; qemu-devel=
@nongnu.org
Subject: Re: [PATCH 07/10] Disable auto-coverge before entering COLO mode.

* leirao (lei.rao@intel.com) wrote:
> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> If we don't disable the feature of auto-converge for live migration=20
> before entering COLO mode, it will continue to run with COLO running,=20
> and eventually the system will hang due to the CPU throttle reaching=20
> DEFAULT_MIGRATE_MAX_CPU_THROTTLE.
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>

I don't think that's the right answer, because it would seem reasonable to =
use auto-converge to ensure that a COLO snapshot succeeded by limiting gues=
t CPU time.  Is the right fix here to reset the state of the auto-converge =
counters at the start of each colo snapshot?

Dave

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
> --
> 1.8.3.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


