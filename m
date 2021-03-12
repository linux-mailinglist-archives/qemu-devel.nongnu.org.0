Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1506933836C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 03:15:04 +0100 (CET)
Received: from localhost ([::1]:33536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKXKQ-00071j-Kh
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 21:15:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1lKXJX-0006YI-1B
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 21:14:07 -0500
Received: from mga18.intel.com ([134.134.136.126]:59563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1lKXJT-0007pj-2z
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 21:14:06 -0500
IronPort-SDR: E8w2L2AxZyKkHEZcRaMXjDaS943xVINFyskHO7KRDm4lR/PyqHh1rex5zhfoP2eHJYA2CZDBzE
 /YbYdTiNP6Pw==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="176363091"
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; d="scan'208";a="176363091"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 18:13:55 -0800
IronPort-SDR: Auuw7EoeII+6GtC/1pmH/sQ+ELrvZzN6mxpFsy6VBuXSGT/PvvviuVv9br3YJ20IEj52KxvGDn
 lH2A9U9Cv/vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; d="scan'208";a="600440661"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 11 Mar 2021 18:13:54 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 11 Mar 2021 18:13:53 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 11 Mar 2021 18:13:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 11 Mar 2021 18:13:53 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 11 Mar 2021 18:13:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4XMp7G4/FRSvPoBXs0d80cgchOReq1UjmgBub7uQlZFn6WVTcvz/1XLTW2cA1gm6RqLJi2jZWqZynstMNWCqV65/VGEcs4zrAa4kdI1KHdfXZ1UNW0FEL2pnsYFpp5rrSAiXiFV67BkCc7eOE+Hbn0/bPYYriBTH8Q9jZh8HfmVZI4dHYWxns3WMByFCqBnpmkr1EzwWfQvwRoETnwkRoDLE+pUou3XJJpLnmqxA+KfgzLJRApZshWDD9UaulMR/hC2vUrZmWgTZn32qz8FNEgdAY81EDnWepD6po68RKn7DvsdDiqIQP4snFkltkxXlP3qe4zcfu2GDL+x79odyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyiJ32ZjBNVrJq+anWlmQgVhGtf+FGruDrwsbmljtA4=;
 b=ZbbjV7+81Lw8KJ+CUxgRf+KF9WBjwDyFNWw0mk5q3scfuPrGwiop2QG7BITm/e0TpAQxIDC0ilbFXKf3Kmcp/O7QPcxorBPeMpajRfiayhG3yA8LvbXUkMPhfmob4PfnnkqKA6uwqn6kEhC2Ahjm5IgmruhMxDspNC9mwukj2dk9U6bIFgWN2h+T4ULdCC1qdAuAazJYcOPnfPc1uTgJUIu04AI0iFJfOoqSWvdedn7fUu2nG8qoJY7l4Zz1ojIaeHukIEPsFKYY9u88jjD5NKUskKjHf5nT6yk62Gr1ZdWz0kJhaM/LwK4JKikk2XO87QN6UkfRoqifmr0/ytluKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyiJ32ZjBNVrJq+anWlmQgVhGtf+FGruDrwsbmljtA4=;
 b=xWQhC0JGoB3t2q48Io6IxyEr3TMZ/afr/OX9qy98ovgvenIXWEePzEvAHFxYAWQfzF1YO/8pMBQ9eDMJA7ZaBueVOrGsWha0BiiBBWFV/hfpH4pNXBIZq3kK9t5UTOrf+VYbKZmPjnGXQ9NwEskPTWqTNv4Xz5mT7viE4eHWcyM=
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MWHPR11MB1997.namprd11.prod.outlook.com (2603:10b6:300:2a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 02:12:59 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46%6]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 02:12:59 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Tarun Gupta
 <targupta@nvidia.com>
Subject: RE: [PATCH v1 1/1] vfio: Make migration support non experimental by
 default.
Thread-Topic: [PATCH v1 1/1] vfio: Make migration support non experimental by
 default.
Thread-Index: AQHXFDfQQc1jqKQfv0utSgmb5IPvEKp6sqmAgATnl2A=
Date: Fri, 12 Mar 2021 02:12:59 +0000
Message-ID: <MWHPR11MB188641C8032684B1BF57AD5C8C6F9@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <20210308160949.4290-1-targupta@nvidia.com>
 <20210308155117.035c1408@omen.home.shazbot.org>
In-Reply-To: <20210308155117.035c1408@omen.home.shazbot.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06a1dab5-8304-4bcf-b4ea-08d8e4fc5bd1
x-ms-traffictypediagnostic: MWHPR11MB1997:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB199771088F741831597531DC8C6F9@MWHPR11MB1997.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GPwi8QRjmrJatidxLZkob2FtLDebuT10zRp1y0Mr5Tw3zbS4Hkoa+RtzYzMKopLneZjikMR5wi5V6XFqwtQ+clyBhRj/fC3FakAFR3PNifdbKAY/QEfW67tkFlwdzUT6CM95/CvP2CzdS5cBY4+MSmXOwZTfj9Dl403q86x5f/3sGSaISQhXdxXwad1fec79ZfUtJ4ua4cqun50GeRH/UX2JSddi+tXMmvppRCSM7HZysNbkQE59hkxcFUcf3tSus6mggcaBxNxc8IXx7xjZf1kGJHkLqe8GrquEGVPpIPLNy5K0CHewxAu/751feDXXylNKN5kg+WTW3I6P5m8P9icYfqPFUN1QtV9RnsEfwefTquW+4sMwlnx70eZ76x5vxExa/FrbYbGQW4MmBfjbiyOHLXkabo32EDT5ooJS86NhaFoGSvZk15cSxD1C21oZQYOoTjwNDFElZc5/XXglBDa3FAzabQKgokxA/z0L4JS87ovIlMWASxXaq3XVSQyH0UIS1LI/b6IJ1nD2LarKJ1XveaCDl1cLljqX2kSD3mzMdmlcEmCFXSahw5ILPMQBk7gUBpzpLXf5l/bc8Lwq9dWOiBN8t+lbuwKijT+frU2BjgTtCtWDpKYptgox30k+FVbCqtLlJlUo6CgWkNR1aQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1886.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(376002)(39860400002)(346002)(136003)(110136005)(2906002)(54906003)(478600001)(71200400001)(966005)(86362001)(8936002)(52536014)(5660300002)(4326008)(66446008)(64756008)(33656002)(26005)(9686003)(55016002)(107886003)(66476007)(66556008)(7416002)(316002)(8676002)(186003)(76116006)(66946007)(83380400001)(6506007)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ncAySQMsEI4ujotSJzp7bA1ItzBLy3U0gdqtFPOldXoRh1XbxaqMHrFuZE38?=
 =?us-ascii?Q?fB8aIL/zcOgNlndxmAXfkqUKRPx5V+1NVU2mkuT81gNYKO1UXfWH0QlD+lRD?=
 =?us-ascii?Q?2Gr88SqeVlpMquP+UcjnbVC4kjtsndUwwrf9aIt3sWMwmKmX7QeO6YDJdqGG?=
 =?us-ascii?Q?HOb7TbNhSap4XMub40aEIxU49F2CWzfHI+i9NIZbdfHwLDPU6DROlsf+78sy?=
 =?us-ascii?Q?flQhaZeA9rXH/10TcKB5pLleRQHny6kbylRNte550oPiig43ZU3V5UE1v67L?=
 =?us-ascii?Q?YVeCBIAkIv9VNy9Yqf5PW2Kb5BrDf9dK7oa42+inEEJoqHXdSbUKfb5fTPxi?=
 =?us-ascii?Q?ovcWC0HYxNuZ1/WDZ3ivFlXFnqiUZBnQ5G08xmk6pUIwvaK1LZzbfXUiHilh?=
 =?us-ascii?Q?pxYdD3541GhQhmm7/UUNnch/A//WmHI/2iimuveNpGbzC2mFZsFnYXQSdxcg?=
 =?us-ascii?Q?bPpwNPANHuYyVycKyNGQGwMvcMx4T48xiu9dzggXLuQE1Fe+DQguw+6z1xQJ?=
 =?us-ascii?Q?FqT9ERNsv0ZnTtTseSCHNRMrK/O5t5Qo3E5MmnhCEo4EsHVMPm/jODIi1hOb?=
 =?us-ascii?Q?9SHmveY3ML6estSXoTIwltIHQTIcLEf3a568KNFhrIe7dDRxEe069llLp7vk?=
 =?us-ascii?Q?HCyez9Khsb9ci2tph7W/zvkuR/zTVi90ogcI+eepifUXBWTe7efPxJoSuNTo?=
 =?us-ascii?Q?aytazY9YwZP0jaPYka+QW7Wz+U1s2Go3yLf3Xx8YAVRMuX9/TysmjhUXZPlt?=
 =?us-ascii?Q?0UrwYXX42Tn+Ew4GyUWtY8YjMWim28Hb8zxhJyHh+WpkUq8XFbqlA8RIHs2m?=
 =?us-ascii?Q?T+teKU1vse1Nen9OWE3bFd0JweHF/SVQg8c71GF5c/+eL2nLJx7MoY0+hz0X?=
 =?us-ascii?Q?MFmAYmyAXS5VQobhiJHQfUfDa/vOvKykVIzZBVHTPmysYQYsZUcQogaJJKIA?=
 =?us-ascii?Q?pfQa3Js/+jc+Y91YyQcNeycGS6TZ7VNVnu310H1FtR7J4xD2fFyjEjjt4lAz?=
 =?us-ascii?Q?Kjmjo5hvjQC78H078MRMY8RDqrENQAJxGStHqIP/8NCJtnD/RFIfvoOOSzQd?=
 =?us-ascii?Q?4P0F+RPXEHeSXdQ/qTDm72iXNu0rmrfFwhYVIQcBHZcLv7g8aYUb8+7Svx+2?=
 =?us-ascii?Q?vBO+XqpLYEBSaAfEeFwC5HuBB+Pk+KnAy9IyAVEDzXDQx1CtptHhwEt9+iFB?=
 =?us-ascii?Q?v24+Cq60utMFTPWx/9DU01jRu1l+anu29wWypgmYfzl5sZsM6KmjQzcfAvH1?=
 =?us-ascii?Q?A66vujs5uBB+DVIZLCdr8ouw7hx92NBGmLmjh490o3gETy9WK7643VGd/UNi?=
 =?us-ascii?Q?iNqg6KZIG4s2sEvwdawgIL1N?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06a1dab5-8304-4bcf-b4ea-08d8e4fc5bd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 02:12:59.3557 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uWwqZ01dtzM0XnDSJ1xTJ7VT27U1lM+GM+oJpfkdCUjuQ3EWujQiYwYCHc9Tf3kw4ms9i6JLxY7B5zD6qaKYAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1997
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=kevin.tian@intel.com; helo=mga18.intel.com
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
Cc: "Liu, Yi
 L" <yi.l.liu@intel.com>, "cjia@nvidia.com" <cjia@nvidia.com>, "Wang,
 Zhenyu Z" <zhenyu.z.wang@intel.com>,
 "quintela@redhat.com" <quintela@redhat.com>, "He,
 Shaopeng" <shaopeng.he@intel.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "lushenming@huawei.com" <lushenming@huawei.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, "dnigam@nvidia.com" <dnigam@nvidia.com>,
 "Jiang, Dave" <dave.jiang@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Alex Williamson <alex.williamson@redhat.com>
> Sent: Tuesday, March 9, 2021 6:51 AM
>=20
> [Cc +Intel]
>=20
> On Mon, 8 Mar 2021 21:39:49 +0530
> Tarun Gupta <targupta@nvidia.com> wrote:
>=20
> > VFIO migration support in QEMU is experimental as of now, which was
> done to
> > provide soak time and resolve concerns regarding bit-stream.
> > But, with the patches discussed in
> > https://www.mail-archive.com/qemu-
> devel@nongnu.org/msg784931.html , we have
> > corrected ordering of saving PCI config space and bit-stream.
> >
> > So, this patch proposes to make vfio migration support in QEMU to be
> enabled
> > by default. Tested by successfully migrating mdev device.
> >
> > Signed-off-by: Tarun Gupta <targupta@nvidia.com>
> > Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> > ---
> >  hw/vfio/pci.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> > index f74be78209..15e26f460b 100644
> > --- a/hw/vfio/pci.c
> > +++ b/hw/vfio/pci.c
> > @@ -3199,7 +3199,7 @@ static Property vfio_pci_dev_properties[] =3D {
> >      DEFINE_PROP_BIT("x-igd-opregion", VFIOPCIDevice, features,
> >                      VFIO_FEATURE_ENABLE_IGD_OPREGION_BIT, false),
> >      DEFINE_PROP_BOOL("x-enable-migration", VFIOPCIDevice,
> > -                     vbasedev.enable_migration, false),
> > +                     vbasedev.enable_migration, true),
> >      DEFINE_PROP_BOOL("x-no-mmap", VFIOPCIDevice, vbasedev.no_mmap,
> false),
> >      DEFINE_PROP_BOOL("x-balloon-allowed", VFIOPCIDevice,
> >                       vbasedev.ram_block_discard_allowed, false),
>=20
> Looking back at the commit where this was added:
>=20
> commit cf254988a50d4164c86a356c80b8d3ae0ccaa005
> Author: Alex Williamson <alex.williamson@redhat.com>
> Date:   Mon Nov 9 11:56:02 2020 -0700
>=20
>     vfio: Make migration support experimental
>=20
>     Support for migration of vfio devices is still in flux.  Developers
>     are attempting to add support for new devices and new architectures,
>     but none are yet readily available for validation.  We have concerns
>     whether we're transferring device resources at the right point in the
>     migration, whether we're guaranteeing that updates during pre-copy ar=
e
>     migrated, and whether we can provide bit-stream compatibility should
>     any of this change.  Even the question of whether devices should
>     participate in dirty page tracking during pre-copy seems contentious.
>     In short, migration support has not had enough soak time and it feels
>     premature to mark it as supported.
>=20
>     Create an experimental option such that we can continue to develop.
>=20
>     [Retaining previous acks/reviews for a previously identical code
>      change with different specifics in the commit log.]
>=20
>     Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>     Acked-by: Cornelia Huck <cohuck@redhat.com>
>     Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
>=20
>=20
> What has tangibly changed since then?  I think we have patches on-list
> to address the known issue of PCI config space (MSI) ordering, which
> related to enabling migration on ARM platforms.  Do we have
> significantly more confidence in our ability to make compatible
> enhancement to the migration bitstream?  This was a particularly
> troublesome point for me if we have any hope of calling this
> supportable.  As far as I know, there are still no open source vendor
> drivers supporting migration for community testing.  We're also still
> missing the documentation that was promised previously, as Connie noted.
>=20
> Huawei and Intel, what's your confidence level and what can you share
> regarding support for this implementation?  Thanks,
>=20

Internally our GVT-g live migration support is still experimental, and due
to resource/priority adjustment the upstreaming plan for this feature is
currently on hold. Timing-wise I'd expect IDXD will be the 1st Intel driver
which formally supports live migration (after its core functionalities - md=
ev/
vSVA are upstreamed). Alternatively once the vfio-pci-core library work=20
is completed I believe many interests will be also arose regarding to VF
live migration (e.g. NIC). But none of the options may come in short term..=
.=20

Thanks
Kevin

