Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA33F3BB9E1
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:08:37 +0200 (CEST)
Received: from localhost ([::1]:53380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Kai-0005fJ-R1
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1m0KZC-0004MN-GI
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:07:02 -0400
Received: from mga01.intel.com ([192.55.52.88]:17958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1m0KZ8-0000sJ-Vr
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:07:02 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10035"; a="230668497"
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; d="scan'208";a="230668497"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2021 02:06:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; d="scan'208";a="409918873"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga006.jf.intel.com with ESMTP; 05 Jul 2021 02:06:53 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 5 Jul 2021 02:06:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Mon, 5 Jul 2021 02:06:52 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Mon, 5 Jul 2021 02:06:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxScUoAKxDKRuy9daaGYAoYnNAgHEOnATNx/VrmtxNnsKYzjZESmwP0vBuag6Koq5q9gdDjGwIzBkJBbcOY/YgLbhTu5x/kUWQy0/HxtlD+AJL9R3zPFL8W8sK1nTlrVOH4WWvQiZJBItdmhC9z4hvWmYljDsV5AZoo/gft+mcxsEoksmFmlxtBDsdeITsVa4qCw6CbrQMvhnaFVf71guKE4tqWxIik8zIOEUn6Zy4z4Doq3BZNHbpHnF16J8dM0xmV/VYWLpvjcr770ZYCN3R3LVxAR1+O+D1jBEjcUE0SNeLEVb+d9RvgteteA7ciRRP+usTK0LqAnaygPA1qiEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfKGOXnPblKcjB+3/aBPmMJJmny2wBH7ovj2vv1bPtc=;
 b=UkHw6r/k3dnKfPaY1sJJc5R4JsD6uuoNFemS0400xQ/62tvGr5dzPMkl6aNWnNI+seRDD94sXRAJF3s8iTKaxJ/nOAVYH4YBj5CF5pGxY2L+FazTbpyOfA8o4OG/w199+jj3jQwdDo7Shdgc0T/tZgOz/u6Wfn9sdZTN8irQq7GKbhljm8hsSwhAybODJ9V05fg+8VVZgusrrMkOvP4tGotBKl+/2gLpHcEzZWhNLKPSkdL4MJCnonYwfdTIsRd2lDizQYkDfskDMK/RJuxVh1iIXSz91khaBWZLYOc0hWqpN9Lk5ZH8VRCXnV8L3dF4RaGMjmZ0YwTeq/9V+0XPbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfKGOXnPblKcjB+3/aBPmMJJmny2wBH7ovj2vv1bPtc=;
 b=ZV+b4f2PPQEvuxPK2NXCamhDBSr8Z3t9x0Ny4zN2THl+otYvptfItMp9XBGtoPbEQilnDj3OoKNRDXRnhmJVPatwJkipjkeLVh35jcgIuMrvFR34t/Da7bRdxuds/NRJeQralOpknX23xnbtRVGLL+WaFWDHDgH6mb6QeIRI8v4=
Received: from DM8PR11MB5640.namprd11.prod.outlook.com (2603:10b6:8:3f::14) by
 DM8PR11MB5605.namprd11.prod.outlook.com (2603:10b6:8:26::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.21; Mon, 5 Jul 2021 09:06:48 +0000
Received: from DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::1d1e:4556:7093:9b9e]) by DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::1d1e:4556:7093:9b9e%2]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 09:06:48 +0000
From: "Rao, Lei" <lei.rao@intel.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: RE: [PATCH 4/7] colo: fixed 'Segmentation fault' when the simplex
 mode PVM poweroff
Thread-Topic: [PATCH 4/7] colo: fixed 'Segmentation fault' when the simplex
 mode PVM poweroff
Thread-Index: AQHXYyQS1d3Erw6LBEWuv3jfLItpk6sxz+AAgAH5IRCAAF5gAA==
Date: Mon, 5 Jul 2021 09:06:48 +0000
Message-ID: <DM8PR11MB56403BD37A485511DA434638FD1C9@DM8PR11MB5640.namprd11.prod.outlook.com>
References: <1623898035-18533-1-git-send-email-lei.rao@intel.com>
 <1623898035-18533-5-git-send-email-lei.rao@intel.com>
 <20210703223620.7dbf323a@gecko.fritz.box>
 <DM8PR11MB5640086C7DA374B5E17985E3FD1C9@DM8PR11MB5640.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB5640086C7DA374B5E17985E3FD1C9@DM8PR11MB5640.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: web.de; dkim=none (message not signed)
 header.d=none;web.de; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.46.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ab755d7-017f-4588-91d0-08d93f9438af
x-ms-traffictypediagnostic: DM8PR11MB5605:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM8PR11MB5605DBF595B6BD7A91F3035AFD1C9@DM8PR11MB5605.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1002;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HKhAjgnG+Ogg5Zt9PIS6dGzrkxqUC5x+KzNRWuOj01eG/8pmmzFFoGH7OHy8hXwfWBs87HE9cGhN5llsrilJsDCRkyNCaYbWyVwtap9p3RUaenz5ETLJYY8sN29jIVE1SFHa0q8ERtWwE1ESStaXHNaa296m5sHtdA9W7a8z3dzR1UCzOzdWQtUFprr6Q7Ge+iBySs+LFMBfe1R2+w0TiYGdBwBSmugnj+ebHt9uYoHCKySuzDjWz5o8ngB+syl8ffp21eckHZQmyqilQxUe58e3zN/vTTZH8MZX8SQVjwtE0f3hRl8odOxes0gY2bDMPYp7xSdJ192KwmWa5a8LAeIdcRH3wdaIS2PFWBq+Zz17zi1nTtLWi7jvJb0mX/ROf1BQQorEsXnA71UPOyX2wpN+rB6bw1dtdSTkkJJ5rEmKlVv3UCrudzqFm/8vTWJhDr5eCnf8zoOndpr2jRgssCgcgLFd6+2d0WbTczICJbTvJ0mut1FIkqhZ975bTZlA/SeLptyA5YHyR3mdy9b4Fky1T6dZmuPFum6wGC0SDiwsAifkb5p0p866avWeSc3YDKKXnXXqNYLGu5ighTeFF8MpBhkL9B+J/0IYHmXpdmj3N6ntK4Amw56L3xEiQ3aO4qkgztfHK0aLVDGC953EWg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5640.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(136003)(346002)(396003)(366004)(478600001)(76116006)(71200400001)(122000001)(52536014)(38100700002)(66556008)(54906003)(66476007)(66946007)(66446008)(64756008)(53546011)(26005)(8676002)(8936002)(7696005)(186003)(86362001)(5660300002)(6506007)(55016002)(9686003)(6916009)(4326008)(33656002)(83380400001)(2906002)(2940100002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?toWU/LpOW1GtNdAmojze3mtRsGzcVnYokJFouZbETxMS9eSK0cy8LQVyZqgW?=
 =?us-ascii?Q?pqUUbFIMD+Iysu3TKZjaCs9iHnOyXUpvQFTT7WehYvyFvjXG6R/NR9EqftS7?=
 =?us-ascii?Q?hj7WsHvAh+m26dztTm3XeAXKw03YjPaxNanlrvB5riLni7pE7/yR6gjFAxNA?=
 =?us-ascii?Q?Edp0Acda7o2fPhPOoyVbkhIOw2mDrWHZxkgNOmJcehaTTDpBBtCcnkG+pVLF?=
 =?us-ascii?Q?LkBwlaDv/fymNpZpzWuzn59+doMcYqcbdYXUkDKViqMQwaGW7Mc+jkbLTH9G?=
 =?us-ascii?Q?4LSfcvVETJt6jI4NPwrqj2RN3enRShBwTJVSwbkJLXAv0KJ/XKsGZXjg4ajS?=
 =?us-ascii?Q?Ozm6DzJ1IJMK/hGxks/7o7xXshSfAckRO3SOT6O4TjjPclks4mzTA79jBer1?=
 =?us-ascii?Q?pTL73VuFoOFNf/bNhwEEuD/6pgIyAZ2QDae12cJwRFU54W1cH1C/3cT23NLL?=
 =?us-ascii?Q?3y998SxFb/2V1/952xqyHXtfL2s2WCaynjg6ilkPcHgAngYanCOEzCtjEN8k?=
 =?us-ascii?Q?uGpp1py+OJ9iu0z0BwUW50dMSMCikae4hQCO8xGkLCcC8L5B4zimDuKqXZ4J?=
 =?us-ascii?Q?g0oGGQN1HHcZL/L0eYpn1lU/n1VYNXghGy2Hs+3HhmWbkv8laWej1kMYZ/3v?=
 =?us-ascii?Q?tSazrr1X5PG5at/v0L9koKlNj6ayQhXIQzHbh8YG5vl8b85V4HYPRQiyebS/?=
 =?us-ascii?Q?PseIF822Nm3cPt+AO/DuFfDJNSsKVsAZ/f0uRCZW2baARJyZkgx60eb8j6zK?=
 =?us-ascii?Q?jx75Cpi+RVBABsR+VligSbt4T2nAixo/sEWuTXeW7QQOLI5kTRhtpJCNZ51R?=
 =?us-ascii?Q?SD7LM+7UOdizkWbZylWHMOX6kMHiFemuvnwLMipHq3dLKLSMylfkRt8pJcRz?=
 =?us-ascii?Q?nlefIrMbu3Ax0/oZJBcP04uFWaAHf7tbKGcvGYg4M8WKHCWHdvK3WrBnvXio?=
 =?us-ascii?Q?Yjcxtt5rJmfazR50ShqXSPtUOVTWAjny1UK7E2bggmzVzvaoQ0b1/hG3L803?=
 =?us-ascii?Q?TSz9vFlFMuj4BxKmGa49m7YseFGQWCz2u+Lfk2Pc/5ElI3Wvemr/OJDG5r8n?=
 =?us-ascii?Q?qy2QUMOt96WBJ4XCR5+7ymFZGB0TrZ9uVw8yum+/KgoJn/WUP0IPvdGq/y7e?=
 =?us-ascii?Q?bZfrKcDMYYlNcOab3Y9H4LjRFaDodrnYX55FfjwxjuB8/KkFUnjrD75EglNe?=
 =?us-ascii?Q?W0UeLdkob2EbCOT4o5pFaENl8YCQViEd3cyHdsKqnRVHa4kr1CpjCRHVwgak?=
 =?us-ascii?Q?34qt4Cx27e/U887Jf5goPS7iHpZjcY8cxhkOyAa/9/gqciir7ET9tqRIRjfM?=
 =?us-ascii?Q?Rqk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5640.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab755d7-017f-4588-91d0-08d93f9438af
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2021 09:06:48.6822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1URCXJdo9vw8+U1gDJKPynojjtTtT3fsVKQgHmcnT6HSUeLAFFijz77r7Pxy0lGshkdoD26rc5+S8spQoavhIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5605
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.88; envelope-from=lei.rao@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: "like.xu.linux@gmail.com" <like.xu.linux@gmail.com>,
 "zhang.zhanghailiang@huawei.com" <zhang.zhanghailiang@huawei.com>,
 "lizhijian@cn.fujitsu.com" <lizhijian@cn.fujitsu.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, Like Xu <like.xu@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Zhang,
 Chen" <chen.zhang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I can reproduce this bug successfully and the GDB stack is as follows:
Program terminated with signal SIGSEGV, Segmentation fault.
#0  object_class_dynamic_cast (class=3D0x55c8f5d2bf50, typename=3D0x55c8f2f=
7379e "qio-channel") at qom/object.c:832
832         if (type->class->interfaces &&
[Current thread is 1 (Thread 0x7f756e97eb00 (LWP 1811577))]
(gdb) bt
#0  object_class_dynamic_cast (class=3D0x55c8f5d2bf50, typename=3D0x55c8f2f=
7379e "qio-channel") at qom/object.c:832
#1  0x000055c8f2c3dd14 in object_dynamic_cast (obj=3D0x55c8f543ac00, typena=
me=3D0x55c8f2f7379e "qio-channel") at qom/object.c:763
#2  0x000055c8f2c3ddce in object_dynamic_cast_assert (obj=3D0x55c8f543ac00,=
 typename=3D0x55c8f2f7379e "qio-channel",
    file=3D0x55c8f2f73780 "migration/qemu-file-channel.c", line=3D117, func=
=3D0x55c8f2f73800 <__func__.18724> "channel_shutdown") at qom/object.c:786
#3  0x000055c8f2bbc6ac in channel_shutdown (opaque=3D0x55c8f543ac00, rd=3Dt=
rue, wr=3Dtrue, errp=3D0x0) at migration/qemu-file-channel.c:117
#4  0x000055c8f2bba56e in qemu_file_shutdown (f=3D0x7f7558070f50) at migrat=
ion/qemu-file.c:67
#5  0x000055c8f2ba5373 in migrate_fd_cancel (s=3D0x55c8f4ccf3f0) at migrati=
on/migration.c:1699
#6  0x000055c8f2ba1992 in migration_shutdown () at migration/migration.c:18=
7
#7  0x000055c8f29a5b77 in main (argc=3D69, argv=3D0x7fff3e9e8c08, envp=3D0x=
7fff3e9e8e38) at vl.c:4512

From the call trace we can see that the reason for core dump is due to QIOC=
hannel *ioc =3D QIO_CHANNEL(opaque) in the channel_shutdown();
After analysis, I think what you said is right, Shutting down a file multip=
le times is safe and not a bug in it self. The reason for the segmentation =
fault=20
Is that after doing failover, the COLO thread will qemu_fclose(s->rp_state.=
from_dst_file) in colo_process_checkpoint();
if we power off the guest at the same time. This will cause qemu_file_shutd=
own after qemu_close(from_dst_file). As a result, the qemu will crash.
So, I think the better way is as follows:
  /*
     * Must be called after failover BH is completed,
     * Or the failover BH may shutdown the wrong fd that
     * re-used by other threads after we release here.
     */
     if (s->rp_state.from_dst_file) {
            qemu_fclose(s->rp_state.from_dst_file);
+          s->rp_state.from_dst_file =3D NULL;
      }
After qemu_close(s->rp_state.from_dst_file), we set the from_dst_file =3D N=
ULL;

Ways to reproduce bugs:
You can kill SVM, after executing the failover QMP command, immediately exe=
cute the power off command in the guest, which will have a high probability=
 to reproduce this bug.

Thanks,
Lei.


-----Original Message-----
From: Rao, Lei=20
Sent: Monday, July 5, 2021 10:54 AM
To: Lukas Straub <lukasstraub2@web.de>
Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com; jasowang@=
redhat.com; zhang.zhanghailiang@huawei.com; quintela@redhat.com; dgilbert@r=
edhat.com; like.xu.linux@gmail.com; qemu-devel@nongnu.org; Like Xu <like.xu=
@linux.intel.com>
Subject: RE: [PATCH 4/7] colo: fixed 'Segmentation fault' when the simplex =
mode PVM poweroff

It's been a long time since this bug, I will reproduce it to get the GDB st=
ack, but it may take some time.

Thanks,
Lei.

-----Original Message-----
From: Lukas Straub <lukasstraub2@web.de>
Sent: Sunday, July 4, 2021 4:36 AM
To: Rao, Lei <lei.rao@intel.com>
Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com; jasowang@=
redhat.com; zhang.zhanghailiang@huawei.com; quintela@redhat.com; dgilbert@r=
edhat.com; like.xu.linux@gmail.com; qemu-devel@nongnu.org; Like Xu <like.xu=
@linux.intel.com>
Subject: Re: [PATCH 4/7] colo: fixed 'Segmentation fault' when the simplex =
mode PVM poweroff

On Thu, 17 Jun 2021 10:47:12 +0800
Lei Rao <lei.rao@intel.com> wrote:

> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> When a PVM completed its SVM failover steps and begins to run in the=20
> simplex mode, QEMU would encounter a 'Segmentation fault' if the guest=20
> poweroff with the following calltrace:
>=20
> Program received signal SIGSEGV, Segmentation fault.
>=20
> This is because primary_vm_do_failover() would call=20
> "qemu_file_shutdown (s->rp_state.from_dst_file);" and later the
> migration_shutdown() would do it again. So, we should set the s->rp_state=
.from_dst_file to NULL.

Hello,
Please provide a backtrace to such bugfixes. It helps the reviewers to bett=
er understand the bug and the fix and it helps yourself to check if it is a=
ctually correct. I suggest you to enable coredumps in your test (or even pr=
oduction) system, so for every crash you definitely have a backtrace.

> Signed-off-by: Like Xu <like.xu@linux.intel.com>
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> ---
>  migration/colo.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/migration/colo.c b/migration/colo.c index
> 616dc00..c25e488 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -156,14 +156,15 @@ static void primary_vm_do_failover(void)
> =20
>      /*
>       * Wake up COLO thread which may blocked in recv() or send(),
> -     * The s->rp_state.from_dst_file and s->to_dst_file may use the
> -     * same fd, but we still shutdown the fd for twice, it is harmless.
> +     * The s->to_dst_file may use the same fd, but we still shutdown
> +     * the fd for twice, it is harmless.
>       */

This change to the comment is incorrect. Shutting down a file multiple time=
s is safe and not a bug in it self. If it leads to a crash anyway, that poi=
nts to a bug in the qemu_file_shutdown() function or similar.

>      if (s->to_dst_file) {
>          qemu_file_shutdown(s->to_dst_file);
>      }
>      if (s->rp_state.from_dst_file) {
>          qemu_file_shutdown(s->rp_state.from_dst_file);
> +        s->rp_state.from_dst_file =3D NULL;
>      }

This is incorrect, as the file won't be closed after this and is leaked. An=
d indeed, when applying the patch to master, qemu crashes when triggering f=
ailover on the primary, due to the leak:

qemu-system-x86_64: ../util/yank.c:107: yank_unregister_instance: Assertion=
 `QLIST_EMPTY(&entry->yankfns)' failed.

>      old_state =3D failover_set_state(FAILOVER_STATUS_ACTIVE,



--=20


