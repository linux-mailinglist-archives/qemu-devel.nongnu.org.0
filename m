Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D735405A51
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 17:43:34 +0200 (CEST)
Received: from localhost ([::1]:45516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOMD7-0004YD-Je
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 11:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mOMAZ-0002wz-VP
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:40:58 -0400
Received: from mga01.intel.com ([192.55.52.88]:35621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mOMAJ-0002B9-WD
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:40:55 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="243135962"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="243135962"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 08:40:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="479696333"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga008.jf.intel.com with ESMTP; 09 Sep 2021 08:40:36 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 08:40:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 9 Sep 2021 08:40:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 9 Sep 2021 08:40:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDXphM+HRdMZPVkRelKrc3eF59KR64r1ZDsbkV5EKate6xCnzJJEHgLRTzU38tCQtMtBi6zfUaD1NOFmRlEG8oAEP0n88j571w44EyLCRma0iVkVT1d5qydp9zMrK/gECBYKq6aXg4FCNKBYXK7NcOXv+ZEaubQuM1/Mk9uwnD4hViheWu+6wwfKEWjO1nd8Pim9fCQWqWTgQBaZGnYim4IuEaIQdBQq2as4iDhHBmshQ5X9oNiWJQ6qtb21jDQoHG+NyFt7PRFDNxGrP5HvyVksC8i3NnyuC7/KoUNnas2cYD9nItOV8cwEzTRoXKotO7x8xxxJGBT0HlWA9MZAew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Nmf8exIdKKLRbbuQj4X3N1HoB1UNevvLleKhOGucw/A=;
 b=U/YQ+kabkcLDshTQb9l3Fi8DPztckXeQfti7/70mYGBbTViYiBh6rUCvykDEWtrhMXIAUqITC9j5NYnhMQ/zzVPJj7kXuMsN4DsqynMI6/BFb4iuMz22vCaqsrcHgj4HCh9bLGa70/zq4cF96A53B7E/IASg5+5K/MH1tYSF/OyZAsx1O5myROGw2bn+clSA7/7lBcD8ZxMLCpgBKRugP62+xFjn8OWlSj786KnU4J8EgZk+EXg0/uB5UgEmLEmqRZJXxxVb+9G4tKeLh8yGItZ63iwBe2V7kKAYrPb7QSFmOkaIQ/0h8zeTMxmH4mwKH+X48/uY6WJOADLxdYI5wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nmf8exIdKKLRbbuQj4X3N1HoB1UNevvLleKhOGucw/A=;
 b=Xn1MMMnMu41voeIUUQ+MUlqtFMb1CbqWdXWIBBmQ7VWDpIcAjz7u1qHktKccgi8k+FffVRTADYMd0o++h7WhREq5WvxviE1jQumA5cIikSwG/q4J8suAM2wrV8eOUa4c+u/QPuaw7ms473caKErQbWe6ZqGOhYqdG/S+jOZGY/w=
Received: from BN0PR11MB5757.namprd11.prod.outlook.com (2603:10b6:408:165::23)
 by BN7PR11MB2563.namprd11.prod.outlook.com (2603:10b6:406:b0::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Thu, 9 Sep
 2021 15:40:32 +0000
Received: from BN0PR11MB5757.namprd11.prod.outlook.com
 ([fe80::bde7:7f0a:e0bd:9945]) by BN0PR11MB5757.namprd11.prod.outlook.com
 ([fe80::bde7:7f0a:e0bd:9945%4]) with mapi id 15.20.4500.014; Thu, 9 Sep 2021
 15:40:32 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH V3 00/10] vhost-vDPA multiqueue
Thread-Topic: [PATCH V3 00/10] vhost-vDPA multiqueue
Thread-Index: AQHXo8fW/AYy7p6t70S43PKHjl96Zqub1tUg
Date: Thu, 9 Sep 2021 15:40:32 +0000
Message-ID: <BN0PR11MB57572086C11BCCA72B8306019BD59@BN0PR11MB5757.namprd11.prod.outlook.com>
References: <20210907090322.1756-1-jasowang@redhat.com>
In-Reply-To: <20210907090322.1756-1-jasowang@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 030b649b-b968-400c-5553-08d973a828ed
x-ms-traffictypediagnostic: BN7PR11MB2563:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR11MB2563EBD18B567EFBEEBE50169BD59@BN7PR11MB2563.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: imd4YrZ/WaevskmyQWObvaoe6Mpbs65670KGg+ZpNvQkmglxZrTL1erDsT+0OznuozMl4fXHCuuAjKamrnHjUSae8FwwkXLSjNeS6oimDLoDIY3zdh2ISES0XUmzzvb2uzJnvc7Z5GUhR6txqfJohzdVdV7T4uKGmrUynrDPkaY04194Oo1DBn7OY1qRXra/L2dwh+Llv5ndhK4la3vJMJJ+xYrXYsHlamfDdmF1rc+52FPAlKZL7cUjL7nUSQGxbeHefHX37t955P3BLamP5jgc0ldPKFsblxvpBU/V8lOtfQ418bmLhuavhcKxkW9vU4qcXzsVv5aD7nlenSh+zrNbrEF+VAzgDqPe4JYO83NTcr6iQYvwf3wEoOPTDziHIsgjL5ctkdFUgW9kz0rD0KXuuVuAWqzmRnHZYX2y0/R7S+Q29xj1Wy4sypLnAZ51hQdCpmI5GCaxazkCIOIo49MUrvXS3w0pHZJU1aFXq9I1XZvou2D6w2XkWT0CMUleDAEAkpKOg2m9+rBYExwW2Oo816KjFoJ5coqy9UdPTJKOPG6GLD9K8RdpS8FtWjmdwXBPy24j9ZcI/V5QsYxuLMNPJXal4o+H+/OBYVC5ktM5Ivb+g1ud+zFCcuxQnLbr6vN2cULo2WXNAfzSuvqx0Oy28vp/P02Y+JNA0OigPIlxOVhcKs5S0jZUj7dwbJlCTuZTugP31sNLR1qI2BhwmQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(396003)(346002)(136003)(6506007)(316002)(54906003)(7696005)(66446008)(38070700005)(26005)(122000001)(52536014)(186003)(2906002)(53546011)(71200400001)(5660300002)(110136005)(38100700002)(55016002)(33656002)(4326008)(83380400001)(8936002)(9686003)(66946007)(76116006)(66556008)(478600001)(66476007)(8676002)(86362001)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?N8ts4Ld95yV4yF4utsYy70ukJRJzJGLcoN5wvLmU/K+UyiMshsLiPuqv6fWq?=
 =?us-ascii?Q?8cDQpQQr8wxqB1GxPK5FtbE2dUPSWwu6Ra+dkfQ7sg320sp6SD+tcF3blyd2?=
 =?us-ascii?Q?yRoF9oufNkBcNZF4u2WZ6yHTFq2yMw2IL/u81J2wtWaGueYVDDEojJc3h5We?=
 =?us-ascii?Q?WORJbxEpYdYbRRZbyhsBmxn7UPoASx7JpwK83zYQiDSdsJZ2sV+3YcIHrY9B?=
 =?us-ascii?Q?b2hlA2DplAFH8kJz795QoNXtxfZdEVmAzLfweQPoEtr4IrTJGM+pnoEOMtr0?=
 =?us-ascii?Q?T8Ojb1v3926YLapBeDPa1MHBEVa6ODlC6epVY7T5MXwhFcCHqZn83jYwxOuj?=
 =?us-ascii?Q?ka/FZc4PisdOlKLx6UV+sp97+lu0/9+G6jvtv4ZLVG7dS3FmWSE0IH4W6hnO?=
 =?us-ascii?Q?+8JYZJaiTGn1VaAuj4nHKHKmo2bkq56tJZiV739fvKBpVFQHzbIFfMlB4nne?=
 =?us-ascii?Q?B7D2dVi2TgVfWGy0OQcrtxrG+ld1ZQG/5KReRKnZHvsConGwAHAHw51MPWAm?=
 =?us-ascii?Q?vdqjoloBUos/XzqB8dof6SzU7fsCKm5KDvqjaICFTuWtSji+Y4EWj+ZPfwFR?=
 =?us-ascii?Q?iE6sEHwy8MCl9NThEdDbzx4VDtrHIUwLuTYxZldn+w3A22OJKqVluEm7jeLB?=
 =?us-ascii?Q?HH+IVvm1KuW8S+xdF/ndAAjaEohqn1GgiW9hNFuLkNPHAri0LXuQ2rQTkTBV?=
 =?us-ascii?Q?vGAr4dFzyrOKNcl8ZpW4TlSGWX6A+nJuPPlXEdUqE9esiOdVimP15Ucf1vyD?=
 =?us-ascii?Q?fHFUPS4uV0rRyYkyu0GuLpflBbeZJj/TCMZsz6yt63e9sC4YcE0u9DYfSCGp?=
 =?us-ascii?Q?NmopglhltekCLVHLWZryvEuvWT0MtJGHMVoukCCWRfooEaa4o5O0+1ESFFTO?=
 =?us-ascii?Q?IWl25W7XZmtPUayU5L1V5jCoLB73MgUlIISALp0cX2XynhYg2NfpfJFxYjo3?=
 =?us-ascii?Q?poaK3WaJ5i6ifYeHRAaO2zH56pjJCw6hjYfdszQSeGYm1oPOolN9YKjoE9Ia?=
 =?us-ascii?Q?ZWb88M0Qq929fie6zRig7MXRIQ8WvrHoZMp/4BDgjLzj/lHC+H409ur9qC+H?=
 =?us-ascii?Q?22JDl3q3XQrEaSlRLTcQjhCOYVR5ws02ZJN5nqh5iXEWH+j8nztnnS+++h7S?=
 =?us-ascii?Q?Q25E4zcAcDAvqSsRu29O76e2I12ZKiVcltZDl4YE19WKaNx1gBqhs5FLihAb?=
 =?us-ascii?Q?DzKb8ULJIswDJxlga9OPjVugsaJE3FbRbe5WFSzGY3H4n/LYgItdrexK2J6Q?=
 =?us-ascii?Q?M+6XRFuXXe6fSF5A6xFAvhRRS8tWjbdxCWVlAPKxogbwi5SfuD34DwxP7Klu?=
 =?us-ascii?Q?3yLUExMpqEq82aoqVco5oLvG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 030b649b-b968-400c-5553-08d973a828ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 15:40:32.6455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pVqZvMOSwDRR4GdUbPUK7/Wf0j1eFGweL7qx/KDiLOOM1KApMA5jfzNfhAbt95yHVVTnqccVScnTP7X9gxVN+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2563
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.88; envelope-from=chen.zhang@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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
Cc: "eperezma@redhat.com" <eperezma@redhat.com>,
 "elic@nvidia.com" <elic@nvidia.com>, "lulu@redhat.com" <lulu@redhat.com>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>, "gdawar@xilinx.com" <gdawar@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Qemu-devel <qemu-devel-
> bounces+chen.zhang=3Dintel.com@nongnu.org> On Behalf Of Jason Wang
> Sent: Tuesday, September 7, 2021 5:03 PM
> To: mst@redhat.com; jasowang@redhat.com; qemu-devel@nongnu.org
> Cc: eperezma@redhat.com; elic@nvidia.com; gdawar@xilinx.com; Zhu,
> Lingshan <lingshan.zhu@intel.com>; lulu@redhat.com
> Subject: [PATCH V3 00/10] vhost-vDPA multiqueue
>=20
> Hi All:
>=20
> This patch implements the multiqueue support for vhost-vDPA. The most
> important requirement si the control virtqueue support. The virtio-net an=
d

Typo:
 S/si/is


> vhost-net core are tweak to support control virtqueue as if what data que=
ue
> pairs are done: a dedicated vhost_net device which is coupled with the
> NetClientState is intrdouced so most of the existing vhost codes could be
> reused with minor changes. This means the control virtqueue will bypass t=
he
> Qemu. With the control virtqueue, vhost-vDPA are extend to support
> creating and destroying multiqueue queue pairs plus the control virtqueue=
.
>=20
> For the future, if we want to support live migration, we can either do sh=
adow
> cvq on top or introduce new interfaces for reporting device states.
>=20
> Tests are done via the vp_vdpa driver in L1 guest.
>=20
> Changes since V2:
>=20
> - rebase to qemu master
> - use "queue_pairs" instead of "qps"
> - typo fixes
>=20
> Changes since V1:
>=20
> - start and stop vhost devices when all queues were setup
> - fix the case when driver doesn't support MQ but device support
> - correctly set the batching capability to avoid a map/unmap storm
> - various other tweaks
>=20
> Jason Wang (10):
>   vhost-vdpa: open device fd in net_init_vhost_vdpa()
>   vhost-vdpa: classify one time request
>   vhost-vdpa: prepare for the multiqueue support
>   vhost-vdpa: let net_vhost_vdpa_init() returns NetClientState *
>   net: introduce control client
>   vhost-net: control virtqueue support
>   virtio-net: use "queue_pairs" instead of "queues" when possible
>   vhost: record the last virtqueue index for the virtio device
>   virtio-net: vhost control virtqueue support
>   vhost-vdpa: multiqueue support
>=20
>  hw/net/vhost_net.c             |  55 ++++++++---
>  hw/net/virtio-net.c            | 165 ++++++++++++++++++---------------
>  hw/virtio/vhost-vdpa.c         |  56 +++++++++--
>  include/hw/virtio/vhost-vdpa.h |   1 +
>  include/hw/virtio/vhost.h      |   2 +
>  include/hw/virtio/virtio-net.h |   5 +-
>  include/net/net.h              |   5 +
>  include/net/vhost_net.h        |   6 +-
>  net/net.c                      |  24 ++++-
>  net/vhost-vdpa.c               | 127 ++++++++++++++++++++++---
>  10 files changed, 328 insertions(+), 118 deletions(-)
>=20
> --
> 2.25.1
>=20


