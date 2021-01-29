Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F6D3083FC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 03:59:44 +0100 (CET)
Received: from localhost ([::1]:34352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5K0d-0003hh-Ht
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 21:59:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1l5JzT-0003Fh-AB
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 21:58:32 -0500
Received: from mga17.intel.com ([192.55.52.151]:19210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1l5JzQ-0000jl-25
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 21:58:30 -0500
IronPort-SDR: 0vRb+WGUYYftRQJnElDHOeOMINxfHuPQtTFHY/Oc+OMPbb3yYKtTSrQW/lJ+DuiQZInp3Of8ph
 mTG0X2uKuVLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9878"; a="160125916"
X-IronPort-AV: E=Sophos;i="5.79,384,1602572400"; d="scan'208";a="160125916"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2021 18:58:20 -0800
IronPort-SDR: VvmCbKyQsBypvgu6pf71K2apqYConCbvYGCOZsmnak5he2nlbwRUf0agzlqyLFaWSPplKwPkDI
 5dgtx5aMbRWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,384,1602572400"; d="scan'208";a="573879280"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga005.jf.intel.com with ESMTP; 28 Jan 2021 18:58:19 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 28 Jan 2021 18:58:19 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 28 Jan 2021 18:58:19 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 28 Jan 2021 18:58:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbyy25YlnhrMz0s8C5DI+mv95nMeCcWgDPrYMxowzEfq+Hx8e6PY/StIAqkCjyywYxKdjNGs76jbyIrfNivzkL4GyuidJzL1Sv1Lyyr6tE0SRUhSHxw1HV8y/Vi4cTPEBZpTwVt/sdjZunGcYXYB9TVXPi9AardY0Q9PpfW3AArnNwXDvyPHXilV6OjirlIyU2Ia6VIOPZhUQ+6Lv7NiggjBpKoqp50YqrHfBfy4JrLE+Tmk4tIL68ymcKf2fMjX0Kt6lXTDTSnV6aAUOAvCbsVI9BdettRl7RhGNOekHI9AMsvGTEC22kqpkLZky6dMUEU9o1mhKq0atNkcC2wEwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svu9FC0Asri0pan+VkINduAa1JPxZ97YmhK18iQT2nw=;
 b=cYds47z0FtQN18UJVUlkjIoHE6u8kIHuIqpcj5Iq4z3GG2sB4+1YpzYDzyjiqW583jFvIW7b2H/EZJpmvy6FrQ92zl5+5rvgUyaqjnUINlzgk7YLFXwv/gwIWHrTEQ/efoJzTu5K7Ob6Y6C3kpE/y9xsv46v8Ivgm1Tnd3992bVH+Kte5Nt0dYmi9+MSBFo3pWaWiHqBNJz58V/nbgwa9m0O/rfMvRHLBFpKLyh6iyDSxrfWyUVRYb0iNHNLalqFAo8TvPVdAAe78+VgQQPtuY2oOOiLiMNN00qYaP6BKKu6MPZjBwfN/92imGbf/O9H/2Iq9FMGvIIdpwpKVukxuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svu9FC0Asri0pan+VkINduAa1JPxZ97YmhK18iQT2nw=;
 b=FeC3bri8LGL8oC+VmyPsera56W4OWyRCbFC7qS9OKlLEJx+wgpGii9T1xnd58umMHHBSzpJQOHBvm4pwmfWZY++lpYFbPBOYBV2WbloU5mdgBi78hCj9cpnAZj79HR0o1BmznHtAUWE5h3PigVwTGOPc890lMQz3YYOs0hMSgIM=
Received: from SN6PR11MB3103.namprd11.prod.outlook.com (2603:10b6:805:d7::13)
 by SN6PR11MB2784.namprd11.prod.outlook.com (2603:10b6:805:54::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 29 Jan
 2021 02:57:57 +0000
Received: from SN6PR11MB3103.namprd11.prod.outlook.com
 ([fe80::b579:5968:957a:e399]) by SN6PR11MB3103.namprd11.prod.outlook.com
 ([fe80::b579:5968:957a:e399%3]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 02:57:57 +0000
From: "Rao, Lei" <lei.rao@intel.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: RE: [PATCH 02/10] Fix the qemu crash when guest shutdown during
 checkpoint
Thread-Topic: [PATCH 02/10] Fix the qemu crash when guest shutdown during
 checkpoint
Thread-Index: AQHW6VdJ3NKwgJRyyEG//WUAnY6FhKow7ccAgABrpwCACocgAIACGGag
Date: Fri, 29 Jan 2021 02:57:57 +0000
Message-ID: <SN6PR11MB3103D9E313084D9BDB98E2F0FDB99@SN6PR11MB3103.namprd11.prod.outlook.com>
References: <1610505995-144129-1-git-send-email-lei.rao@intel.com>
 <1610505995-144129-3-git-send-email-lei.rao@intel.com>
 <20210120201244.3e4b30d9@gecko.fritz.box>
 <SN6PR11MB3103DA5673109F5A785EACF2FDA19@SN6PR11MB3103.namprd11.prod.outlook.com>
 <20210127192416.525baaaa@gecko.fritz.box>
In-Reply-To: <20210127192416.525baaaa@gecko.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: web.de; dkim=none (message not signed)
 header.d=none;web.de; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e695df64-0d50-4123-41fb-08d8c401aeba
x-ms-traffictypediagnostic: SN6PR11MB2784:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB27841D3FE0173510D6A5279BFDB99@SN6PR11MB2784.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: to9ghURD83S3e3vBe9pifir3c8hvCYWBwhf0sZ8PhRy+qex7ttshhO9mi1NRzP2l7OXu0rzFcmWUiqWWUv2fyQydQTvJ63X5qfgYxQXFECkKLXbfjUeCyENI0hvZsQbpShJVW9xkAvh8D93eriIO1sZ3i3VkyZWe4TD2NWsm8DAW1sUfHxS9axoWEiN5+GkD6UQpUC6iRIPDO41XOEXsVjP376oTqbGeyu1Vsg0Dev8Vj2WZXJNPZuS9kUmI+zmxpg3z+UODTP/bH+Q9YWAVYPRhHkh7FESaSVT7rfMjH/qZMV2GhAouTfbfLCGD5BIbadM6zTHSweguP/Uux4mlfWYnecbNKsEmvB08fkIWX7W0A2C/KSvwPbTF8uKAwmG3XuotynHt+kewwvO0vCahKjmCgO2UlGEXgVWNzcsiN2CZa6hI6YkqspmpMJ9dfxmZ4ctInAhzR2T4rIKtBs2OYoNLtyTMqKIvqzecpPEaWcyJoGtdFMYEj17fmIKtSIb4VDxA4buVGK1T3B0sQi0wrQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3103.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(6916009)(76116006)(64756008)(5660300002)(66556008)(66476007)(478600001)(2906002)(33656002)(26005)(71200400001)(52536014)(66946007)(86362001)(83380400001)(66446008)(9686003)(186003)(54906003)(4326008)(53546011)(6506007)(55016002)(316002)(7696005)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?K1GXkGgroZGItRzxGy4mWXpcxekKvt0qS8zGpv9+zj15jNl/mK0R8YCUkurQ?=
 =?us-ascii?Q?SSGUOA6UrtbU+YcsH5XhT7ZaGST+oUiDxC+9QnLE2I9UA1/GL8w6k1JOU/C0?=
 =?us-ascii?Q?yXXa1RR15f5YP0aSLXjyM8Yua8gzMR8KtoV1JefmlQ6yHr/xvp0buOFxcGxz?=
 =?us-ascii?Q?ZoBq3DKtxaHSRwXzIzwKFij0jCfKvGDbtNRh8ICe/t/mxR3IxOqFxa6GFHRu?=
 =?us-ascii?Q?9r3PIlsFe1AGFc7Z3Yzk+97rUuBwE8/gyIZj6rvkWvRyjhCg1pGuPaX+PsEl?=
 =?us-ascii?Q?++utrUctiyk6KVj3JbeP/b9rslx/8H8nrMZdZK1grYFxbhdu7sNEwv2ZmQV9?=
 =?us-ascii?Q?THQH/3fZ0oCCGCyhrGNL+i2wjIdTGEHQk60RGOHzGX+yfvmHxXmeJP8I+Ssk?=
 =?us-ascii?Q?1SA4Q+TcL++MtSP4pv7qQcdGrupcUXnb/wjuWXYgpoP+bx+/Vy+ci2Q8O//N?=
 =?us-ascii?Q?4u3YwJMNlfDEHSjv3zd+mrH/OSlgInZcRp26vcRzlLoOWnJc4zMP1wlt9ZDx?=
 =?us-ascii?Q?fRGjmVy9xIgZC/dIZ+toNP0OCI1p8H77TZODefOYRQgd/uVRr3dN4zxy3fBz?=
 =?us-ascii?Q?3X8mWA5RVXJO7465RU9uuYKoMoiIM2BKvzq1kTO1sYyaCiEmC9fCMIjbclxS?=
 =?us-ascii?Q?JKtmjr6HrGBxlKZh3mPOkbQCRXPkLQ+lrto3vmxRjrc7DCNfyUcuu9DIRFfk?=
 =?us-ascii?Q?DT1ZCe0poS6bcoLM5RM2IByozfZsOgUQnfxMw5UmMiTn5ParsZ4yWRJiTZU9?=
 =?us-ascii?Q?RBmjhL/SLTClMLEuLEDqTb4Te1BeKQl7CyJ71XhYrYB9h+nWYX2iXQ28vcvU?=
 =?us-ascii?Q?bThdpmUezm1zSRYyNFiI+/qeUmfozwFMPYKwoWuNvLJ9Lc4l7SnvBlkUXXX3?=
 =?us-ascii?Q?SFHsrR/FboZt8UV8pCIOSlTF9zsaIcMzayYo/+3j4OmtZ8UKNjCyPmRDTdG4?=
 =?us-ascii?Q?7xXXJ4pM3pVgXMuP7ogN0Qe7zXu9gMRukGkOhZ4T/gn+x0XbA5hCGFQmz3HQ?=
 =?us-ascii?Q?GsJk5gbPCtAThlYmC+EddNAufmn+2kDp8CxGX1WDw33j3U4EkUYqJs8NqNqd?=
 =?us-ascii?Q?B1epXLmo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3103.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e695df64-0d50-4123-41fb-08d8c401aeba
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2021 02:57:57.7689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7kbiY+wECy1DZhLZeupZc0T0FpYM5Oge64upgW68ErjvGwyecgHOM5WaL11PIoCWtpJNkNmALEba+AzlrBrv3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2784
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.151; envelope-from=lei.rao@intel.com;
 helo=mga17.intel.com
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

The state will be set RUN_STATE_COLO in colo_do_checkpoint_transaction(). I=
f the guest executes power off or shutdown at this time and the QEMU main t=
hread will call vm_shutdown(), it will set the state to RUN_STATE_SHUTDOWN.
The state switch from RUN_STATE_COLO to RUN_STATE_SHUTDOWN is not defined i=
n runstate_transitions_def. this will cause QEMU crash. Although this is sm=
all probability, it may still happen. By the way. Do you have any comments =
about other patches?

Thanks,
Lei.

-----Original Message-----
From: Lukas Straub <lukasstraub2@web.de>=20
Sent: Thursday, January 28, 2021 2:24 AM
To: Rao, Lei <lei.rao@intel.com>
Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com; jasowang@=
redhat.com; zhang.zhanghailiang@huawei.com; quintela@redhat.com; dgilbert@r=
edhat.com; qemu-devel@nongnu.org
Subject: Re: [PATCH 02/10] Fix the qemu crash when guest shutdown during ch=
eckpoint

On Thu, 21 Jan 2021 01:48:31 +0000
"Rao, Lei" <lei.rao@intel.com> wrote:

> The Primary VM can be shut down when it is in COLO state, which may trigg=
er this bug.

Do you have a backtrace for this bug?

> About 'shutdown' -> 'colo' -> 'running', I think you are right, I did hav=
e the problems you said. For 'shutdown'->'colo', The fixed patch(5647051f43=
2b7c9b57525470b0a79a31339062d2) have been merged.
> Recently, I found another bug as follows in the test.
> 	qemu-system-x86_64: invalid runstate transition: 'shutdown' -> 'running'
>     	Aborted (core dumped)
> The gdb bt as following:
>     #0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/ra=
ise.c:50
>     #1  0x00007faa3d613859 in __GI_abort () at abort.c:79
>     #2  0x000055c5a21268fd in runstate_set (new_state=3DRUN_STATE_RUNNING=
) at vl.c:723
>     #3  0x000055c5a1f8cae4 in vm_prepare_start () at /home/workspace/colo=
-qemu/cpus.c:2206
>     #4  0x000055c5a1f8cb1b in vm_start () at /home/workspace/colo-qemu/cp=
us.c:2213
>     #5  0x000055c5a2332bba in migration_iteration_finish (s=3D0x55c5a4658=
810) at migration/migration.c:3376
>     #6  0x000055c5a2332f3b in migration_thread (opaque=3D0x55c5a4658810) =
at migration/migration.c:3527
>     #7  0x000055c5a251d68a in qemu_thread_start (args=3D0x55c5a5491a70) a=
t util/qemu-thread-posix.c:519
>     #8  0x00007faa3d7e9609 in start_thread (arg=3D<optimized out>) at pth=
read_create.c:477
>     #9  0x00007faa3d710293 in clone () at=20
> ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
>=20
> For the bug, I made the following changes:
> 	@@ -3379,7 +3379,9 @@ static void migration_iteration_finish(MigrationSt=
ate *s)
>      case MIGRATION_STATUS_CANCELLED:
>      case MIGRATION_STATUS_CANCELLING:
>          if (s->vm_was_running) {
> -            vm_start();
> +            if (!runstate_check(RUN_STATE_SHUTDOWN)) {
> +                vm_start();
> +            }
>          } else {
>              if (runstate_check(RUN_STATE_FINISH_MIGRATE)) {
>                  runstate_set(RUN_STATE_POSTMIGRATE);
> 				=20
> I will send the patch to community after more test.
>=20
> Thanks,
> Lei.
>=20
> -----Original Message-----
> From: Lukas Straub <lukasstraub2@web.de>
> Sent: Thursday, January 21, 2021 3:13 AM
> To: Rao, Lei <lei.rao@intel.com>
> Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com;=20
> jasowang@redhat.com; zhang.zhanghailiang@huawei.com;=20
> quintela@redhat.com; dgilbert@redhat.com; qemu-devel@nongnu.org
> Subject: Re: [PATCH 02/10] Fix the qemu crash when guest shutdown=20
> during checkpoint
>=20
> On Wed, 13 Jan 2021 10:46:27 +0800
> leirao <lei.rao@intel.com> wrote:
>=20
> > From: "Rao, Lei" <lei.rao@intel.com>
> >=20
> > This patch fixes the following:
> >     qemu-system-x86_64: invalid runstate transition: 'colo' ->'shutdown=
'
> >     Aborted (core dumped)
> >=20
> > Signed-off-by: Lei Rao <lei.rao@intel.com>
>=20
> I wonder how that is possible, since the VM is stopped during 'colo' stat=
e.
>=20
> Unrelated to this patch, I think this area needs some work since the foll=
owing unintended runstate transition is possible:
> 'shutdown' -> 'colo' -> 'running'.
>=20
> > ---
> >  softmmu/runstate.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/softmmu/runstate.c b/softmmu/runstate.c index=20
> > 636aab0..455ad0d 100644
> > --- a/softmmu/runstate.c
> > +++ b/softmmu/runstate.c
> > @@ -125,6 +125,7 @@ static const RunStateTransition runstate_transition=
s_def[] =3D {
> >      { RUN_STATE_RESTORE_VM, RUN_STATE_PRELAUNCH },
> > =20
> >      { RUN_STATE_COLO, RUN_STATE_RUNNING },
> > +    { RUN_STATE_COLO, RUN_STATE_SHUTDOWN},
> > =20
> >      { RUN_STATE_RUNNING, RUN_STATE_DEBUG },
> >      { RUN_STATE_RUNNING, RUN_STATE_INTERNAL_ERROR },
>=20
>=20
>=20



--=20


