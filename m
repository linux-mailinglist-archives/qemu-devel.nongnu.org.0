Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C63F2FDF00
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 02:50:00 +0100 (CET)
Received: from localhost ([::1]:33728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2P6l-0000lK-6Z
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 20:49:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1l2P5Z-0000KV-7p
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 20:48:46 -0500
Received: from mga06.intel.com ([134.134.136.31]:9056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1l2P5U-0004Gs-6J
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 20:48:44 -0500
IronPort-SDR: lSuACAB1DAMb9WrUMhGjY5dQVolhrNbzvVSnXjQJLYb129BJQAfk5w2goOjUYKT/nFOTkf65L0
 gHXqyRx7VfDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="240745046"
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; d="scan'208";a="240745046"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 17:48:36 -0800
IronPort-SDR: l0qvybQLYlmth0xF/+Q/A0m97/c3ipeDQf2yGoXx5CIrnXjzGAQst7N1pj8JBTqSJbZ2At0/2Z
 73fWBohHOJ4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; d="scan'208";a="467281221"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga001.fm.intel.com with ESMTP; 20 Jan 2021 17:48:35 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 20 Jan 2021 17:48:35 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 20 Jan 2021 17:48:34 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 20 Jan 2021 17:48:34 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 20 Jan 2021 17:48:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTxw/1xroYf8fte/QQ4LlJcenVLclW2MMkjglI9zGBFuZzsHxqVhmO3HN2U2TduWgmX0w9R2ZdnjwooESHKt3CPz4ImunZWLVn+knDG3pO2a0wIYSGeTBSzqJk2zqJrWDrT5r4eXTY0IHV2Mbb5AvENE3k6IMkBC6MwreMzgTXrgtvxoYN1V4EQDlkg5bHbflMGOs4KTpCwplyvW46CMMHie2b+ZBiiO2lZRGp8qTMz3goNRHzGL4WN7QkBtsmEY97pqQk4ANCBspspYlhdUSu+C2iapKwwzTa+sQV5JwrzaxlYazeKPLs/DybpwpPByQPAf1d34zqkyG3qa1VFtig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CflFBazUdOXe2KmwRzJlLv06nEKrSP8WeEgoHpxKOwQ=;
 b=kcf69v1RDvAxDv5ln5c0cvBi6gj0nB3r9roz3mwUJ/b08LI4sWCbnU0iDDn2ODiBtpoUZjcHq7keJQZeMxs9cFM64EBQEQFLVt8a4FKR3Htw6rY6QBAMqbk5sAG0DCqzl9CIMWh15A4g1FHkdWe+ctqXwU/+kFFRtAMaOEBmggeFPQzatJCXWJ+o7cm19feY/4lyX4xfEEzLV5rIoARea8w6UstUq/6BTLW3TJ0/XgRZWzrFvwyyEbHx+xs6pSPt5n9qwvojh/zTxt2gruaO1sVjmMvwVFN8AUiwVXzBaUwV0OTGh3Hql3GwC3FGh3/FAYmahv0RJG2ZcMPnvrNqhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CflFBazUdOXe2KmwRzJlLv06nEKrSP8WeEgoHpxKOwQ=;
 b=YfeSuY4vFz/s9D85oWd6qncJonCdrzJYzx4ZZqdnLd9fyWf5wFhnxpwuWZXmOnGCdPjk81kzCGFtJJQIB4Tf5T0TonJZhA+XVpgXoGVA/eDNBu+YPMmz72KC8ADC80IN2jrkgZS1QxiXcl0pDL7s05kemVzqqpr6BFbFkVzSsFY=
Received: from SN6PR11MB3103.namprd11.prod.outlook.com (2603:10b6:805:d7::13)
 by SN6PR11MB3104.namprd11.prod.outlook.com (2603:10b6:805:cc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.13; Thu, 21 Jan
 2021 01:48:31 +0000
Received: from SN6PR11MB3103.namprd11.prod.outlook.com
 ([fe80::b579:5968:957a:e399]) by SN6PR11MB3103.namprd11.prod.outlook.com
 ([fe80::b579:5968:957a:e399%3]) with mapi id 15.20.3784.013; Thu, 21 Jan 2021
 01:48:31 +0000
From: "Rao, Lei" <lei.rao@intel.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: RE: [PATCH 02/10] Fix the qemu crash when guest shutdown during
 checkpoint
Thread-Topic: [PATCH 02/10] Fix the qemu crash when guest shutdown during
 checkpoint
Thread-Index: AQHW6VdJ3NKwgJRyyEG//WUAnY6FhKow7ccAgABrpwA=
Date: Thu, 21 Jan 2021 01:48:31 +0000
Message-ID: <SN6PR11MB3103DA5673109F5A785EACF2FDA19@SN6PR11MB3103.namprd11.prod.outlook.com>
References: <1610505995-144129-1-git-send-email-lei.rao@intel.com>
 <1610505995-144129-3-git-send-email-lei.rao@intel.com>
 <20210120201244.3e4b30d9@gecko.fritz.box>
In-Reply-To: <20210120201244.3e4b30d9@gecko.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: web.de; dkim=none (message not signed)
 header.d=none;web.de; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.215]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8d0302d-c176-4130-dd07-08d8bdaea7e4
x-ms-traffictypediagnostic: SN6PR11MB3104:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB310431E37A5A119C64424D5BFDA10@SN6PR11MB3104.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zoISAhx+Yy+zn3318EfH50nFODTUXyf7o4rH/5ePL/FAJ0Jvxl+GgtQNpVODXSrPCY5w5JvdRrzVYXd9QJAaRsLBQeeNLimCz86GvMNO1y9x+/PrW7Mx36xObgx6GMF3yRSIuWCMp/BDBq8S5Y8N2oJgQpzYuLQLLEH46Q6nxfoUwmU4i60zRf8W+YrcrG5Dqc8q9loawgTxINFUTh/BP/Q3wnTyvPWTolK7+jVFTlNm+N0RTfrQa4LA3+53tz9NNxNv0Q60TcWtHTEXz9TXi1G6JrA4tBetIU564gRyF22NRm7RAz6CGFlMJclqAfboREVlvaM1ZFCUTDLqGaZ2VRt5G87yo4+buF/OZEbzpzznu4sx08Usr4wJ794dAtD87JQqAIr8vun5aFg18TxYKw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3103.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(64756008)(66946007)(54906003)(9686003)(26005)(66556008)(316002)(83380400001)(52536014)(8936002)(5660300002)(6506007)(4326008)(8676002)(7696005)(71200400001)(86362001)(33656002)(478600001)(186003)(66446008)(66476007)(76116006)(6916009)(53546011)(2906002)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Cg3zeYC8E3D/Q7NgYQoogLZCL/9p+/arnkovntUtF8eIDortUDiZfG0D5gH9?=
 =?us-ascii?Q?/OiA+3FHTCV+3cVrRe71S4zHmsCWdrZetusTgPE1OIUIggQOxucPZBmnFwlg?=
 =?us-ascii?Q?8F9OdRe5+DwbdPR7BJtIcYzpgDsz7lCWgAwv759mEMa2kB/G+ErtemCqXLaX?=
 =?us-ascii?Q?qBsT6B2vgqw1RLoOp4QNKTmrIVs7l7X8AHpa6qv8Ndj0etojQcmP7F5aAj6b?=
 =?us-ascii?Q?3ADejm3gaIH26TBLRM9wgep54yEN/dj5QVqOBCKmX95S5p5XSPyQp7xQQpJx?=
 =?us-ascii?Q?WZ60eXVLMti0yYoxEqTsp4b4h9d1jw162oLCHNa4Y7Ci3VHjMU0YBrhE1MiR?=
 =?us-ascii?Q?9ZRrprm3PMjNG+eVhjx2bzZOkMJHQpy80QyyMADQecBYZUVlqczdpeXB2j+O?=
 =?us-ascii?Q?OA1yqeumudPTnruKg+uzbFN4InhaXkaOK7YRHsBSOyqfTzCQxu/feblv4vFq?=
 =?us-ascii?Q?cnDTzAuNXBlfgiNueEpxzbs9p2KPF4NpVgc78FonsH4ZlBeEBbvfjgoKEDmX?=
 =?us-ascii?Q?q/bc0zKj5CGEzsoOKlGd93qSsHBwdEU8zy6jNvInMew2o+ZT2RmgOsG4klgA?=
 =?us-ascii?Q?itFM5daGTLBoPrTVTTn5Vg93YXxLlpx/xnOqVihExWxYMVgZ5aFKGFWqL1DE?=
 =?us-ascii?Q?95SMvnhvOySEmIFeRfeC31hsYH/63eEO0HmzJ2JpparE712OGaE4MZWczqbg?=
 =?us-ascii?Q?ZGn9l6Sqq5IKm2RwFgPkobJ8zjWri0GR3VB7y0wJANgszew/V6jtD0+z0v+U?=
 =?us-ascii?Q?O3vT2J5GBqCOoFukLR/TViyi/mU5nXO10PYbukICvUdhSZ5jxMJxctWRpW5V?=
 =?us-ascii?Q?RsArlwEHDalj2wMThwfgFkyV5cxig0i/nZNoFpJaKUv+ugAYEqxlqJ8S29Jw?=
 =?us-ascii?Q?Zgz+NJpwkPexaQb/Csk8ClELqshGOlb9OI188ln9surMhAeiQ7o10kQRMtge?=
 =?us-ascii?Q?/ArGTr1al7f07xzFqqDW4ujigssud4MdifQQ9inBUu8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3103.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d0302d-c176-4130-dd07-08d8bdaea7e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2021 01:48:31.0678 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Gvl25Wev/pExMmWkWyZKC1L6URsdmigpqOKbGRaQUj8BD91qfJjVrK1wtLpyG1YMQ6Qfc0v0zGFgRaeGrIqNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3104
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31; envelope-from=lei.rao@intel.com;
 helo=mga06.intel.com
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

The Primary VM can be shut down when it is in COLO state, which may trigger=
 this bug.
About 'shutdown' -> 'colo' -> 'running', I think you are right, I did have =
the problems you said. For 'shutdown'->'colo', The fixed patch(5647051f432b=
7c9b57525470b0a79a31339062d2) have been merged.
Recently, I found another bug as follows in the test.
	qemu-system-x86_64: invalid runstate transition: 'shutdown' -> 'running'
    	Aborted (core dumped)
The gdb bt as following:
    #0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/rais=
e.c:50
    #1  0x00007faa3d613859 in __GI_abort () at abort.c:79
    #2  0x000055c5a21268fd in runstate_set (new_state=3DRUN_STATE_RUNNING) =
at vl.c:723
    #3  0x000055c5a1f8cae4 in vm_prepare_start () at /home/workspace/colo-q=
emu/cpus.c:2206
    #4  0x000055c5a1f8cb1b in vm_start () at /home/workspace/colo-qemu/cpus=
.c:2213
    #5  0x000055c5a2332bba in migration_iteration_finish (s=3D0x55c5a465881=
0) at migration/migration.c:3376
    #6  0x000055c5a2332f3b in migration_thread (opaque=3D0x55c5a4658810) at=
 migration/migration.c:3527
    #7  0x000055c5a251d68a in qemu_thread_start (args=3D0x55c5a5491a70) at =
util/qemu-thread-posix.c:519
    #8  0x00007faa3d7e9609 in start_thread (arg=3D<optimized out>) at pthre=
ad_create.c:477
    #9  0x00007faa3d710293 in clone () at ../sysdeps/unix/sysv/linux/x86_64=
/clone.S:95

For the bug, I made the following changes:
	@@ -3379,7 +3379,9 @@ static void migration_iteration_finish(MigrationStat=
e *s)
     case MIGRATION_STATUS_CANCELLED:
     case MIGRATION_STATUS_CANCELLING:
         if (s->vm_was_running) {
-            vm_start();
+            if (!runstate_check(RUN_STATE_SHUTDOWN)) {
+                vm_start();
+            }
         } else {
             if (runstate_check(RUN_STATE_FINISH_MIGRATE)) {
                 runstate_set(RUN_STATE_POSTMIGRATE);
				=20
I will send the patch to community after more test.

Thanks,
Lei.

-----Original Message-----
From: Lukas Straub <lukasstraub2@web.de>=20
Sent: Thursday, January 21, 2021 3:13 AM
To: Rao, Lei <lei.rao@intel.com>
Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com; jasowang@=
redhat.com; zhang.zhanghailiang@huawei.com; quintela@redhat.com; dgilbert@r=
edhat.com; qemu-devel@nongnu.org
Subject: Re: [PATCH 02/10] Fix the qemu crash when guest shutdown during ch=
eckpoint

On Wed, 13 Jan 2021 10:46:27 +0800
leirao <lei.rao@intel.com> wrote:

> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> This patch fixes the following:
>     qemu-system-x86_64: invalid runstate transition: 'colo' ->'shutdown'
>     Aborted (core dumped)
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>

I wonder how that is possible, since the VM is stopped during 'colo' state.

Unrelated to this patch, I think this area needs some work since the follow=
ing unintended runstate transition is possible:
'shutdown' -> 'colo' -> 'running'.

> ---
>  softmmu/runstate.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/softmmu/runstate.c b/softmmu/runstate.c index=20
> 636aab0..455ad0d 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -125,6 +125,7 @@ static const RunStateTransition runstate_transitions_=
def[] =3D {
>      { RUN_STATE_RESTORE_VM, RUN_STATE_PRELAUNCH },
> =20
>      { RUN_STATE_COLO, RUN_STATE_RUNNING },
> +    { RUN_STATE_COLO, RUN_STATE_SHUTDOWN},
> =20
>      { RUN_STATE_RUNNING, RUN_STATE_DEBUG },
>      { RUN_STATE_RUNNING, RUN_STATE_INTERNAL_ERROR },



--=20


