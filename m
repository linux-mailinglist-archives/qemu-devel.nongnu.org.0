Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B95C324D12
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 10:41:26 +0100 (CET)
Received: from localhost ([::1]:56698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFD9A-00026n-Nd
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 04:41:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lFD8G-0001ae-8f
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:40:28 -0500
Received: from mga18.intel.com ([134.134.136.126]:4447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lFD8D-0003uP-7g
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:40:27 -0500
IronPort-SDR: FcJeQ2pM97a2JzBssB52Q38Ek/siRjNJKwp/AFvIpGxqXu1cfLAi4CT+Za2sXpR7/DKhbDkl8d
 lWeqRd//BUdg==
X-IronPort-AV: E=McAfee;i="6000,8403,9905"; a="173121993"
X-IronPort-AV: E=Sophos;i="5.81,205,1610438400"; d="scan'208";a="173121993"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2021 01:40:20 -0800
IronPort-SDR: IQddkrNQidUgRczY4QuMz5OopXweCEy0oqTyFmMtleA9cRQpwk3lvyAxH5drmPGa+rKqXm1Vnh
 nnHIuuIHuM8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,205,1610438400"; d="scan'208";a="516018693"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga004.jf.intel.com with ESMTP; 25 Feb 2021 01:40:20 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 25 Feb 2021 01:40:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 25 Feb 2021 01:40:19 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 25 Feb 2021 01:40:19 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 25 Feb 2021 01:40:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gggZf2WjRjcGyU72PKv/mWMiYvSR0dZ/N/32p9fKKo6DgYtPe+zYjp1yQ3Z/II2PTzBGSMk4kXrzlv4Nwh9FYirIec+uJgKMn4ilJ9FigWwkEeHl0kOrHJlFJq1Y/ObDctrw+YVGegTZPUWh+hekVlrrXTAnTDAEyLS3sRr3Omiv07FmCRHwuDWHjxq9MtH+zNKLrWkjf0xGPJHma7n4cs3vNLjS4NqVHbF+TkARjCgjN+KeZ67YgnR19dk0jHQokrC+wCtQjmH/6zIPhoSaXSVrMVy2OCAUeLakRYt4LhzR+x7tJz/c9xTzC/ZZRD9CYiVps4K4f7cxG/PPKYCDag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrrtQtI5ETAsoadEEmFDfE56NBTo/2vt6E7LPLrQsw0=;
 b=aTYZBc1AuT/l6UohgX2scQfh6OnHq4ePQrv2Z5orSkQP+OUz1UC9LGixkjnyloWuPZL8ARANfyuHJOfSAgW+IrtLhbJN+B1ofFM40GfhBpmz58hoTgrfx2fKRRfHwDL2xnLKJe2dZ7sB1d6flffuEAazqg2dvVAlGzqzVOh+xmQQ/HmYE2/jxRHq6Lt677mr40XTRdUDOmnY2mrJni41AoMv8v/hQn0TB0QgacjkIp89c+MazXFBBAbXjliXT/R9xW/BiXkMBVrHyg4XpVL3UvJ734tvDQiCarmeCP9pkLx2cVRe7GzH6oVt1JESbdgHcNi27jkghHKk6p8xh1KVaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrrtQtI5ETAsoadEEmFDfE56NBTo/2vt6E7LPLrQsw0=;
 b=xkbW49PgZwHaZVJgDxxZ3va4EaYvMC7LmcF7aqWFOX9Mdr7I/mt6Dtp8R90ZQRlkktr6Eb4JGSl7GOQpVLpNeyu+tE+ww27JwWLDPJmpOQGyHfulfI9x3X3XGVoAbIb6dMjfFC8GSjNclH4E4MuA1Pe0/AW3RQRDtUF+lEjcWUo=
Received: from SN6PR11MB3103.namprd11.prod.outlook.com (2603:10b6:805:d7::13)
 by SA2PR11MB4842.namprd11.prod.outlook.com (2603:10b6:806:f8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.31; Thu, 25 Feb
 2021 09:40:15 +0000
Received: from SN6PR11MB3103.namprd11.prod.outlook.com
 ([fe80::83f:2327:82d6:318b]) by SN6PR11MB3103.namprd11.prod.outlook.com
 ([fe80::83f:2327:82d6:318b%5]) with mapi id 15.20.3868.033; Thu, 25 Feb 2021
 09:40:15 +0000
From: "Rao, Lei" <lei.rao@intel.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: RE: [PATCH 02/10] Fix the qemu crash when guest shutdown during
 checkpoint
Thread-Topic: [PATCH 02/10] Fix the qemu crash when guest shutdown during
 checkpoint
Thread-Index: AQHW6VdJ3NKwgJRyyEG//WUAnY6FhKow7ccAgABrpwCACocgAIACGGaggBnCO4CAESPXYA==
Date: Thu, 25 Feb 2021 09:40:15 +0000
Message-ID: <SN6PR11MB3103C9A4923E841C507E6195FD9E9@SN6PR11MB3103.namprd11.prod.outlook.com>
References: <1610505995-144129-1-git-send-email-lei.rao@intel.com>
 <1610505995-144129-3-git-send-email-lei.rao@intel.com>
 <20210120201244.3e4b30d9@gecko.fritz.box>
 <SN6PR11MB3103DA5673109F5A785EACF2FDA19@SN6PR11MB3103.namprd11.prod.outlook.com>
 <20210127192416.525baaaa@gecko.fritz.box>
 <SN6PR11MB3103D9E313084D9BDB98E2F0FDB99@SN6PR11MB3103.namprd11.prod.outlook.com>
 <20210214124547.6d72e5e9@gecko.fritz.box>
In-Reply-To: <20210214124547.6d72e5e9@gecko.fritz.box>
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
x-ms-office365-filtering-correlation-id: c225d975-5f2e-4262-ed34-08d8d9715b11
x-ms-traffictypediagnostic: SA2PR11MB4842:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB48429F791632421A2C8E55B6FD9E9@SA2PR11MB4842.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eQKFRTRM3Cx64JlYF9g9uitTdxyCscOWtGHsiY0Y3vj4dhJKSAbpMUAtGHQ24yKP6K8UBt3yiMRHoe0QDhrYfQTJDxOWnNhqjQESuFLTjj7vRkQFSNyqQ1Tc9N+FCsKV3autZid5gLiAdtaCFZfY5meXQwfZycn5QHPVgoTAeUib5O+OgjBhRKqdz1oI/YI8QEeSkNnsnRH02tZfRywj2YmyBsdoCRC8x9lFPL8hfswSJ1vxLaW140bRwd/yMDiAZw5RxSpcw3dwLpUkO8N4xaa1xv9Q85LBmCGXqbMrg28pUfAFfho9avwtBmAIfHB41QVYaPhI0fpwCBvJYW7/wmxbmSXPkG3HwMBa50DdSp8O4hbkGufKuOeKiPiycV4CNlneAMiHW7c+3tv3nL2FrCPt99QfHojVy+RDi8CC34lMdJZOevAJct7ll2wMtAyYNFm17vPeQlXfozJsw6jtM78oLSjhIi65F94TOGoIMzz45LdBU7ZFrLH1uUZ2zOSp5kiL+EUMJFG23zQnK8MFOA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3103.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(376002)(366004)(39860400002)(396003)(66476007)(8936002)(66446008)(33656002)(64756008)(2906002)(54906003)(5660300002)(76116006)(66946007)(478600001)(66556008)(316002)(71200400001)(6916009)(52536014)(26005)(186003)(9686003)(55016002)(86362001)(53546011)(83380400001)(4326008)(8676002)(6506007)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?6B+mL84ZhlMiZUP7GY7BphQrRjTOGyCkfxqtsszpqBvJnV5f8rnLYo6+o4fg?=
 =?us-ascii?Q?MUa8XQH/9cZSylQ2br332JdY1yDLuVSZQHTBMOJHRvK6XStljy/9U1nSTepn?=
 =?us-ascii?Q?sbt56OGaA+qkGk1lFJPH3986lycseCTEzih8LLKNEBg8q+tdZDdGDZv9zrUk?=
 =?us-ascii?Q?cAXidKATKn1gte9coHKKEv2oIHE3qYhP703Y7s5EUVz0iOaU79X1YALAiAwM?=
 =?us-ascii?Q?Pms20vs3EOWh+2tWkFuOqFCiYtfvXvDMaE2X8FjUTdm+uqbPNpeYZpgReBH1?=
 =?us-ascii?Q?/jPVuVAd6rxQ/0gugBiyc1/30d/y4D6Wr7Pfyscq109ITKOAMLFax3xaPl/G?=
 =?us-ascii?Q?zvaOQHwIEIvWawtuOENr8DYQcFwbEQtIsf0yicGJjaQByPWHjXV5gqMXWfIx?=
 =?us-ascii?Q?RD/VWcqj2OmQZ39Z4Gt63tKszjBIF5lIkoBg88lJdX1LtfTSDpPaSQUF9H+N?=
 =?us-ascii?Q?fhqxbInAPU0+H4cEs+IYBBYiZC4hrJZAEriVLvJPVV0iYA60aRb3hvIkab+s?=
 =?us-ascii?Q?Mc9SF30NOmRA8nXEV+3p2YFlYASWi55LSUcht0aK6PT/koa6Rgsuw3fn37Hy?=
 =?us-ascii?Q?vLXswnco63FK2DhyFqrCSFnLt4+KVk0Cwds+z0PV25/InA3WWEWmLOyoNOg5?=
 =?us-ascii?Q?pq70Gf4a01NOn4876KdObAtswRKO5cfeXqPz1fNEyRmGW8saQFAvzKfCArgJ?=
 =?us-ascii?Q?dLK6VFL5Wt4707D3QXvRNq4dUCjXTkRS8YX1KP7M/dM3c7DT/ZrCWitjJ8d6?=
 =?us-ascii?Q?YW+meTJcEsLl8qrujSbvnmTReUAij1gB82uQGw5kRBz9nrRINWCeiwr9YECe?=
 =?us-ascii?Q?i16qCtmig5twouPU7ygDeZVAFZnafG98r6unP5GEJJMyKbgPrqNT3b8zGDEE?=
 =?us-ascii?Q?lySZ4+skD9P/STojpPz6cNzh0LuBFrH2Vje8SO0oH7YRIrxoB3c8lww9E4vy?=
 =?us-ascii?Q?MiVdapgGhmt7nCvS+quxeopDlma4FZpLaUyaTBMAw0QchGTMTTyHMGBOt/Fs?=
 =?us-ascii?Q?53h+LqNLZ4I+M90URpNr1hMjUdGPDjO42Nd7u8VXPCth6djxsvckJ3JEAxGI?=
 =?us-ascii?Q?WAqtheMHR9PZyBaO+fkTpwUZxE17qSe7Wh4+DyEKyA3dHzK9b/b2EXwKt+hh?=
 =?us-ascii?Q?glEmG6KjuT0k07KWGodRd4DeoCGHFRCSpBZrXXYo3BQfXIFfcQi78J+u43zy?=
 =?us-ascii?Q?oQwpFxXe4Llkxa6IMgevG1oEZWrtfWEeXniKx+L/zQkiC9IBI37p9M3RRMch?=
 =?us-ascii?Q?dizbguPRPPbU4mthVW/yTYb4sstgIMsvsle5SAvAmhbhyMc9qMd79v+ExjT3?=
 =?us-ascii?Q?BTEhctIFki7AqAKZE1g9pET7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3103.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c225d975-5f2e-4262-ed34-08d8d9715b11
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2021 09:40:15.3509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bPPHHW+j2NAsgrNLIYr2FKfWQFEhb16UCgjUGtGQkkkZemYu9seIFPkFocK3TJxv84b/8yqqxG3i4Q3arLElpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4842
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

If user executes the shutdown normally and QEMU crashes, I think this is un=
acceptable.
Since we can avoid this situation, why not do it?

Thanks,
Lei.

-----Original Message-----
From: Lukas Straub <lukasstraub2@web.de>=20
Sent: Sunday, February 14, 2021 7:46 PM
To: Rao, Lei <lei.rao@intel.com>
Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com; jasowang@=
redhat.com; zhang.zhanghailiang@huawei.com; quintela@redhat.com; dgilbert@r=
edhat.com; qemu-devel@nongnu.org
Subject: Re: [PATCH 02/10] Fix the qemu crash when guest shutdown during ch=
eckpoint

On Fri, 29 Jan 2021 02:57:57 +0000
"Rao, Lei" <lei.rao@intel.com> wrote:

> The state will be set RUN_STATE_COLO in colo_do_checkpoint_transaction().=
 If the guest executes power off or shutdown at this time and the QEMU main=
 thread will call vm_shutdown(), it will set the state to RUN_STATE_SHUTDOW=
N.
> The state switch from RUN_STATE_COLO to RUN_STATE_SHUTDOWN is not defined=
 in runstate_transitions_def. this will cause QEMU crash. Although this is =
small probability, it may still happen.

This patch fixes the 'colo' -> 'shutdown' transition. AFAIK then colo_do_ch=
eckpoint_transaction will call vm_start() again, which does 'shutdown' -> '=
running' and (rightfully) crashes. So I think it is better to crash here to=
o.

>  By the way. Do you have any comments about other patches?
> Thanks,
> Lei.
>=20
> -----Original Message-----
> From: Lukas Straub <lukasstraub2@web.de>
> Sent: Thursday, January 28, 2021 2:24 AM
> To: Rao, Lei <lei.rao@intel.com>
> Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com;=20
> jasowang@redhat.com; zhang.zhanghailiang@huawei.com;=20
> quintela@redhat.com; dgilbert@redhat.com; qemu-devel@nongnu.org
> Subject: Re: [PATCH 02/10] Fix the qemu crash when guest shutdown=20
> during checkpoint
>=20
> On Thu, 21 Jan 2021 01:48:31 +0000
> "Rao, Lei" <lei.rao@intel.com> wrote:
>=20
> > The Primary VM can be shut down when it is in COLO state, which may tri=
gger this bug. =20
>=20
> Do you have a backtrace for this bug?
>=20
> > About 'shutdown' -> 'colo' -> 'running', I think you are right, I did h=
ave the problems you said. For 'shutdown'->'colo', The fixed patch(5647051f=
432b7c9b57525470b0a79a31339062d2) have been merged.
> > Recently, I found another bug as follows in the test.
> > 	qemu-system-x86_64: invalid runstate transition: 'shutdown' -> 'runnin=
g'
> >     	Aborted (core dumped)
> > The gdb bt as following:
> >     #0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/=
raise.c:50
> >     #1  0x00007faa3d613859 in __GI_abort () at abort.c:79
> >     #2  0x000055c5a21268fd in runstate_set (new_state=3DRUN_STATE_RUNNI=
NG) at vl.c:723
> >     #3  0x000055c5a1f8cae4 in vm_prepare_start () at /home/workspace/co=
lo-qemu/cpus.c:2206
> >     #4  0x000055c5a1f8cb1b in vm_start () at /home/workspace/colo-qemu/=
cpus.c:2213
> >     #5  0x000055c5a2332bba in migration_iteration_finish (s=3D0x55c5a46=
58810) at migration/migration.c:3376
> >     #6  0x000055c5a2332f3b in migration_thread (opaque=3D0x55c5a4658810=
) at migration/migration.c:3527
> >     #7  0x000055c5a251d68a in qemu_thread_start (args=3D0x55c5a5491a70)=
 at util/qemu-thread-posix.c:519
> >     #8  0x00007faa3d7e9609 in start_thread (arg=3D<optimized out>) at p=
thread_create.c:477
> >     #9  0x00007faa3d710293 in clone () at
> > ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
> >=20
> > For the bug, I made the following changes:
> > 	@@ -3379,7 +3379,9 @@ static void migration_iteration_finish(Migration=
State *s)
> >      case MIGRATION_STATUS_CANCELLED:
> >      case MIGRATION_STATUS_CANCELLING:
> >          if (s->vm_was_running) {
> > -            vm_start();
> > +            if (!runstate_check(RUN_STATE_SHUTDOWN)) {
> > +                vm_start();
> > +            }
> >          } else {
> >              if (runstate_check(RUN_STATE_FINISH_MIGRATE)) {
> >                  runstate_set(RUN_STATE_POSTMIGRATE);
> > 				=20
> > I will send the patch to community after more test.
> >=20
> > Thanks,
> > Lei.
> >=20
> > -----Original Message-----
> > From: Lukas Straub <lukasstraub2@web.de>
> > Sent: Thursday, January 21, 2021 3:13 AM
> > To: Rao, Lei <lei.rao@intel.com>
> > Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com;=20
> > jasowang@redhat.com; zhang.zhanghailiang@huawei.com;=20
> > quintela@redhat.com; dgilbert@redhat.com; qemu-devel@nongnu.org
> > Subject: Re: [PATCH 02/10] Fix the qemu crash when guest shutdown=20
> > during checkpoint
> >=20
> > On Wed, 13 Jan 2021 10:46:27 +0800
> > leirao <lei.rao@intel.com> wrote:
> >  =20
> > > From: "Rao, Lei" <lei.rao@intel.com>
> > >=20
> > > This patch fixes the following:
> > >     qemu-system-x86_64: invalid runstate transition: 'colo' ->'shutdo=
wn'
> > >     Aborted (core dumped)
> > >=20
> > > Signed-off-by: Lei Rao <lei.rao@intel.com>
> >=20
> > I wonder how that is possible, since the VM is stopped during 'colo' st=
ate.
> >=20
> > Unrelated to this patch, I think this area needs some work since the fo=
llowing unintended runstate transition is possible:
> > 'shutdown' -> 'colo' -> 'running'.
> >  =20
> > > ---
> > >  softmmu/runstate.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/softmmu/runstate.c b/softmmu/runstate.c index=20
> > > 636aab0..455ad0d 100644
> > > --- a/softmmu/runstate.c
> > > +++ b/softmmu/runstate.c
> > > @@ -125,6 +125,7 @@ static const RunStateTransition runstate_transiti=
ons_def[] =3D {
> > >      { RUN_STATE_RESTORE_VM, RUN_STATE_PRELAUNCH },
> > > =20
> > >      { RUN_STATE_COLO, RUN_STATE_RUNNING },
> > > +    { RUN_STATE_COLO, RUN_STATE_SHUTDOWN},
> > > =20
> > >      { RUN_STATE_RUNNING, RUN_STATE_DEBUG },
> > >      { RUN_STATE_RUNNING, RUN_STATE_INTERNAL_ERROR },
> >=20
> >=20
> >  =20
>=20
>=20
>=20



--=20


