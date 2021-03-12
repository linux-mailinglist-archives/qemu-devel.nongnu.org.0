Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1FE338447
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 04:15:42 +0100 (CET)
Received: from localhost ([::1]:56524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKYH7-0004MA-IX
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 22:15:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1lKYFZ-0003oc-QS
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 22:14:05 -0500
Received: from mga01.intel.com ([192.55.52.88]:6848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1lKYFV-00031O-Bn
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 22:14:05 -0500
IronPort-SDR: XT6w3BFgXIoIR+KulkqJsE7Vu5ZFNi4Yi0qDBR/vaNZLecnHVQgqNYFq5GGFU/kNw3D4KrWBVi
 90YkWP9duNog==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="208609405"
X-IronPort-AV: E=Sophos;i="5.81,242,1610438400"; d="scan'208";a="208609405"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 19:13:58 -0800
IronPort-SDR: jode1vmCs1IN3geKHO53Myuz9Bvv5hXLcLvnAXf4SVtol8nkWqbIXLZs032m9OtbyF48a4KcSM
 NcjtXI8+jRMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,242,1610438400"; d="scan'208";a="370761204"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 11 Mar 2021 19:13:57 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 11 Mar 2021 19:13:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 11 Mar 2021 19:13:57 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 11 Mar 2021 19:13:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgysTXeh2wbdpQZ6aCtmunwfBdLYzvRZa13A19j2ES6VTxUFOaPc5VbWamAmnRN/nkC4nCBzu/EyhAZG2FSjz0EJFZACrZaIStOBCWy60fNYJh7KQquo/chS9A6eTI2JGf3FbajF5jEMJ1bDhdcNhpKsAYQhr+761AMc1EhErGWCK0lt8WW2sxTMUN5t5vhJK8GxXAtdnq87HsylnwDB7iXh3EQkPM1sTfaR9EbKom4O8WI1Zrk/w2WBgEHQEmPLbliq9kfBFGAQoViQnCPGRIcNWlqf7ZfFKj5focxFwinRurpxcf/tJ2bV8iu8WthaJGlI0adi3B3ZoyMkpJciCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTuf1gfPdmHiIzNSrPxTPc0MyJkoMsGQQ4Cm+yqc7hU=;
 b=bAkZlCBVvtagl3mYIl6l0FUT0w58/lPIb7kNhXGdU351xpyeincLYakCSnwcK95zVbQAQNyj3g5284d9pAHXQtAJuMJHWlf7xZ9FYC7KGZuMPoiGWXTkNlj0t33rtqPvRAr5hHjb/+qOAHI7JkJCKSFm4LrXbtQiZRYcMTKK5+qADvHinqVuCGAnYP1XrCYs3ZZO7jGL9MThROmBLEcjfJKFjahvc4owMHhO/THHoIdaYpANar2TaIdNEaxWdnXYr0FnzBdW21rfxpS58tZFQImPkWP1Ki8dAsa3myJRPTBTXOz8yqtbrr9d0ECwX0h0/IzASpftBajsQySaLzaulg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTuf1gfPdmHiIzNSrPxTPc0MyJkoMsGQQ4Cm+yqc7hU=;
 b=cDMhEqR1Edc366WT+7UyF2183g6s7aESb1CtSLO6W4Cuu/EbsKrI7VOTQYMZ35FLTMcAO35XFWirgO6W+0tAxBtpx3/uU17oy0QEH16CPApUex86mDgFUt57kREUt9iyvuH8F/b1UkLezQD4Y0DbUyW13F2h+eoKgAVRiLvnVs0=
Received: from BN6PR11MB1875.namprd11.prod.outlook.com (2603:10b6:404:104::11)
 by BN9PR11MB5388.namprd11.prod.outlook.com (2603:10b6:408:11d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 03:13:55 +0000
Received: from BN6PR11MB1875.namprd11.prod.outlook.com
 ([fe80::90ec:1b70:5912:9849]) by BN6PR11MB1875.namprd11.prod.outlook.com
 ([fe80::90ec:1b70:5912:9849%4]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 03:13:55 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Tarun Gupta <targupta@nvidia.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "cohuck@redhat.com" <cohuck@redhat.com>
Subject: RE: [PATCH v2 1/1] docs/devel: Add VFIO device migration documentation
Thread-Topic: [PATCH v2 1/1] docs/devel: Add VFIO device migration
 documentation
Thread-Index: AQHXFeKChCZAPNERSkWYs2XEwwoMcKp/qFIQ
Date: Fri, 12 Mar 2021 03:13:54 +0000
Message-ID: <BN6PR11MB1875F23CA1AE08034F96DC898C6F9@BN6PR11MB1875.namprd11.prod.outlook.com>
References: <20210310192009.53848-1-targupta@nvidia.com>
In-Reply-To: <20210310192009.53848-1-targupta@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 020abd50-bd53-4790-ad1d-08d8e504de9b
x-ms-traffictypediagnostic: BN9PR11MB5388:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN9PR11MB5388BE66685DE01BAE95CC218C6F9@BN9PR11MB5388.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5TOcjHGs1gZYdOTiHBSiz05uyoq3T0Um2a+pvIOXaiuU0BmU/SAXM7nAZK9z5s65mYOWh+3cg4H63FGCGkm0vfH1wrGBHm3lQ0rn0Mp+2TeXQM2TGzAWephDiUDW+Otpjm+GPmq2GoNFKQnQYUAiqlq4l5mquIvn/2PJwBtrjAobQjxzUxkpnFdygZinSkFGhAoL9LgTDS/3JUb0a8SsAdJ3Td2hhNVbgpQzdFpOwISocqAKWQnGYDVlc/LXdLR2iL2TmuanzmVnoTTyZsfVsN9cty1qUPvsINoKhSZRmBczTt7jHKtjOHffCze6QJlxRMcvYYc+a2vszGD6pjam5y1+xo9HDXPYFYsLvvZ+WFrMexbOz9n6j+3e7CVMsrUhWkGMZH6hN9U8i2rgwsb6OxCpHhdra20zr6/Em43JQ57OSpEWklH3etTRrhSg0jwYPeHhQAnxtzXPfsg0/6I4s3gAP7/mBCkD5urybVkgKKcJhCRp7U6dbj7AGMIo+OlJcPBLQqlVaGea4g2bfmshgY4/0tlY2xxrF8q1iSPuDfIiUUQ6CHU7fTTa7DJh8Y6Q
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1875.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(136003)(366004)(346002)(376002)(8676002)(7416002)(5660300002)(52536014)(316002)(6506007)(478600001)(71200400001)(54906003)(2906002)(110136005)(4326008)(7696005)(55016002)(8936002)(186003)(26005)(9686003)(83380400001)(33656002)(86362001)(76116006)(66556008)(64756008)(66476007)(66946007)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?t9J5VUHVnvrwSWwWGfUFqVDmTFyOE9/v9aLfZRhTZiFomesZzSmOBo2nZ62b?=
 =?us-ascii?Q?E7+iiRsG5d3lg5V472g6wvegN19nQ6VjYWgJdM8sDiT0CowFQf/w3EOP+AHw?=
 =?us-ascii?Q?QTzluPZyvXtYT+UmdwZnkIsyrjxUlTTsm9oFyTQEyNHlG64J08mXJjx2Y+PP?=
 =?us-ascii?Q?WZlIuIvmGPTg3qfE4Wrw4qzuMtaU0tNqSKsUN+pfstlc3+ylIDU93Web/mOq?=
 =?us-ascii?Q?q1t6eomAag35/BSj6S9R0Nl/I+KHhGWLwsbbr8VuWTVgOi6b91tqerOFqRnW?=
 =?us-ascii?Q?IF+XDwZuUTWG9JIWBpIArkOxpCC4eWlB0wpG26b2Z7mhXf4dcDgNdfzZHxoA?=
 =?us-ascii?Q?m7bQZavO3vasuBa/oX45z7phlSXjB8JZSix7ktvLisxLmZS/USdbizzhUYN1?=
 =?us-ascii?Q?nXoSVlotmKDQMwLxhFKWaRoFVRGAPY5A0uS2RK3pzIzJSIlMCjrVABgoGFLu?=
 =?us-ascii?Q?vKiSZCMdXD7QR0iU4eRg2I0xSAGpwo4EKeB8kp0DS46HdM1tNASmhwjLXrE8?=
 =?us-ascii?Q?Oc3BjIwtvhsz25aBMpNk/CxEKOWc46+C+tk0ip6B5PMRdj+BHVz3baQ9LsfH?=
 =?us-ascii?Q?IbsuzW/PAGkWP5xe7hXD3v56eDuMFd05qqUUDPn9v91dfQK5pwz/dcepb/4E?=
 =?us-ascii?Q?KqXPWV290Be6n3O4Jkx1TreFr9Y+RYwIUwtwp87rTmsgGOTFIhdCWA5M1VqH?=
 =?us-ascii?Q?04lDqWDs+ee4ohu0BThyiIqODEXRJUmQ7j10Un8uvlfDyvyhLdZz0FtEnVoS?=
 =?us-ascii?Q?8yQi3Y2yaDiCPIhBXjUztW+73Dagx/yoR6DfoCQFnUde0nyXI6WcHF2/yGWX?=
 =?us-ascii?Q?JhTEUjK+XqJueG0awjayyt+QWcmckerzfBysg4kvsuqcxDg7EOjQ7Gri/4rH?=
 =?us-ascii?Q?fWpxTKjw4jTF55Wwb1YNQ5kyWqE0TCv5890Dp/sXOgW0GIHlxAaMub8Kn4oc?=
 =?us-ascii?Q?qi6a0jiyAILFlIwtt6/OhWhvplkEsn510Q3qyyXQ/1O3i5ZOrzrJyuMGtd8/?=
 =?us-ascii?Q?EVL835VCMP4l7oo/WiOY6DEPsOH5LDXscb4FgKrQ/tR9n34hs9RAkiGrl2Cm?=
 =?us-ascii?Q?ynYEl4PmcPhSepaQ9IZO6eRgnBtLBzkGAOelZsc+DPvt01iiAMGEEADdoAy6?=
 =?us-ascii?Q?I/9XOAaAgu8GjUTBnhx7rjqnpI9oJEntCEtMHKVTwKxmd4gDp1VrXOJheuUE?=
 =?us-ascii?Q?NV72AcJOeklQVeS/n3UFX0d/jxihJfXCYRBXPDwkJ0impOjaKL3XyuiGfp9R?=
 =?us-ascii?Q?lcKZHMaMbVslIz2SUZCsFJwMjHArG2n995sPdlyn1pZMJFEiLSGAnTyJF0VP?=
 =?us-ascii?Q?+74bFgmv6XPLU+L4+tQfFZQw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1875.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 020abd50-bd53-4790-ad1d-08d8e504de9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 03:13:54.9569 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CscojhRYoSp29UZALfhdLL5tgBUSqrl2qV4duD7brYItMH0IUaeN2wHXdx2cKWpyMtVG2hd9T7sSrWGgVNI1aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5388
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.88; envelope-from=kevin.tian@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: "berrange@redhat.com" <berrange@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "Zhao,
 Yan Y" <yan.y.zhao@intel.com>, "lushenming@huawei.com" <lushenming@huawei.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, "dnigam@nvidia.com" <dnigam@nvidia.com>,
 "cjia@nvidia.com" <cjia@nvidia.com>, "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Tarun Gupta <targupta@nvidia.com>
> Sent: Thursday, March 11, 2021 3:20 AM
>=20
> Document interfaces used for VFIO device migration. Added flow of state
> changes
> during live migration with VFIO device. Tested by building docs with the =
new
> vfio-migration.rst file.
>=20
> v2:
> - Included the new vfio-migration.rst file in index.rst
> - Updated dirty page tracking section, also added details about
>   'pre-copy-dirty-page-tracking' opt-out option.
> - Incorporated comments around wording of doc.
>=20
> Signed-off-by: Tarun Gupta <targupta@nvidia.com>
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> ---
>  MAINTAINERS                   |   1 +
>  docs/devel/index.rst          |   1 +
>  docs/devel/vfio-migration.rst | 135 ++++++++++++++++++++++++++++++++++
>  3 files changed, 137 insertions(+)
>  create mode 100644 docs/devel/vfio-migration.rst
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 738786146d..a2a80eee59 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1801,6 +1801,7 @@ M: Alex Williamson <alex.williamson@redhat.com>
>  S: Supported
>  F: hw/vfio/*
>  F: include/hw/vfio/
> +F: docs/devel/vfio-migration.rst
>=20
>  vfio-ccw
>  M: Cornelia Huck <cohuck@redhat.com>
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index ae664da00c..5330f1ca1d 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -39,3 +39,4 @@ Contents:
>     qom
>     block-coroutine-wrapper
>     multi-process
> +   vfio-migration
> diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rs=
t
> new file mode 100644
> index 0000000000..6196fb132c
> --- /dev/null
> +++ b/docs/devel/vfio-migration.rst
> @@ -0,0 +1,135 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +VFIO device Migration
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +VFIO devices use an iterative approach for migration because certain VFI=
O
> +devices (e.g. GPU) have large amount of data to be transfered. The itera=
tive
> +pre-copy phase of migration allows for the guest to continue whilst the =
VFIO
> +device state is transferred to the destination, this helps to reduce the=
 total
> +downtime of the VM. VFIO devices can choose to skip the pre-copy phase o=
f
> +migration by returning pending_bytes as zero during the pre-copy phase.
> +
> +A detailed description of the UAPI for VFIO device migration can be foun=
d in
> +the comment for the ``vfio_device_migration_info`` structure in the head=
er
> +file linux-headers/linux/vfio.h.
> +
> +VFIO device hooks for iterative approach:
> +
> +* A ``save_setup`` function that sets up the migration region, sets _SAV=
ING
> +  flag in the VFIO device state and informs the VFIO IOMMU module to sta=
rt
> +  dirty page tracking.
> +
> +* A ``load_setup`` function that sets up the migration region on the
> +  destination and sets _RESUMING flag in the VFIO device state.
> +
> +* A ``save_live_pending`` function that reads pending_bytes from the
> vendor
> +  driver, which indicates the amount of data that the vendor driver has =
yet
> to
> +  save for the VFIO device.
> +
> +* A ``save_live_iterate`` function that reads the VFIO device's data fro=
m the
> +  vendor driver through the migration region during iterative phase.
> +
> +* A ``save_live_complete_precopy`` function that resets _RUNNING flag
> from the
> +  VFIO device state, saves the device config space, if any, and iterativ=
ely

and if any,=20

> +  copies the remaining data for the VFIO device untill the vendor driver
> +  indicates that no data remains (pending bytes is zero).
> +
> +* A ``load_state`` function that loads the config section and the data
> +  sections that are generated by the save functions above
> +
> +* ``cleanup`` functions for both save and load that perform any migratio=
n
> +  related cleanup, including unmapping the migration region
> +
> +A VM state change handler is registered to change the VFIO device state
> when
> +the VM state changes.
> +
> +Similarly, a migration state change notifier is registered to get a
> +notification on migration state change. These states are translated to V=
FIO
> +device state and conveyed to vendor driver.
> +
> +System memory dirty pages tracking
> +----------------------------------
> +
> +A ``log_sync`` memory listener callback marks those system memory pages
> +as dirty which are used for DMA by the VFIO device. The dirty pages bitm=
ap
> is
> +queried per container. All pages pinned by the vendor driver through
> +vfio_pin_pages() external API have to be marked as dirty during migratio=
n.

why mention kernel internal functions in an userspace doc?

> +When there are CPU writes, CPU dirty page tracking can identify dirtied
> pages,
> +but any page pinned by the vendor driver can also be written by device.
> There
> +is currently no device which has hardware support for dirty page trackin=
g.

no device or IOMMU support

> So
> +all pages which are pinned by vendor driver are considered as dirty.

Similarly, why do we care about how the kernel identifies whether a page is
dirty. It could be dirtied due to pinning, or due to IOMMU dirty bit, or du=
e
to IOMMU page fault. Here we'd better just focus on user-tangible effect,
e.g. a large/non-converging dirty map might be returned then how to handle
such situation...

> +
> +By default, dirty pages are tracked when the device is in pre-copy as we=
ll as
> +stop-and-copy phase. So, a page pinned by the vendor driver using
> +vfio_pin_pages() will be copied to destination in both the phases. Copyi=
ng
> +dirty pages in pre-copy phase helps QEMU to predict if it can achieve it=
s
> +downtime tolerances.

worthy of some elaboration on the last sentence.

> +
> +QEMU also provides a per device opt-out option ``pre-copy-dirty-page-
> tracking``
> +to disable dirty page tracking during pre-copy phase. If it is set to of=
f, all

IIUC dirty page tracking is always enabled in vfio_save_setup. What this op=
tion
does is to skip sync-ing dirty bitmap in vfio_listerner_log_sync.

> +pinned pages will be copied to destination in stop-and-copy phase only.
> +
> +System memory dirty pages tracking when vIOMMU is enabled
> +---------------------------------------------------------
> +
> +With vIOMMU, an IO virtual address range can get unmapped while in pre-
> copy
> +phase of migration. In that case, the unmap ioctl returns any pinned pag=
es
> in
> +that range and QEMU reports corresponding guest physical pages dirty.

pinned pages -> dirty pages

> During
> +stop-and-copy phase, an IOMMU notifier is used to get a callback for
> mapped
> +pages and then dirty pages bitmap is fetched from VFIO IOMMU modules
> for those
> +mapped ranges.
> +
> +Flow of state changes during Live migration
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Below is the flow of state change during live migration.
> +The values in the brackets represent the VM state, the migration state, =
and
> +the VFIO device state, respectively.
> +
> +Live migration save path
> +------------------------
> +
> +::
> +
> +                        QEMU normal running state
> +                        (RUNNING, _NONE, _RUNNING)
> +                                  |
> +                     migrate_init spawns migration_thread
> +                Migration thread then calls each device's .save_setup()
> +                    (RUNNING, _SETUP, _RUNNING|_SAVING)
> +                                  |
> +                    (RUNNING, _ACTIVE, _RUNNING|_SAVING)
> +             If device is active, get pending_bytes by .save_live_pendin=
g()
> +          If total pending_bytes >=3D threshold_size, call .save_live_it=
erate()
> +                  Data of VFIO device for pre-copy phase is copied
> +        Iterate till total pending bytes converge and are less than thre=
shold
> +                                  |
> +  On migration completion, vCPU stops and
> calls .save_live_complete_precopy for
> +   each active device. The VFIO device is then transitioned into _SAVING
> state
> +                   (FINISH_MIGRATE, _DEVICE, _SAVING)
> +                                  |
> +     For the VFIO device, iterate in .save_live_complete_precopy until
> +                         pending data is 0
> +                   (FINISH_MIGRATE, _DEVICE, _STOPPED)
> +                                  |
> +                 (FINISH_MIGRATE, _COMPLETED, _STOPPED)
> +             Migraton thread schedules cleanup bottom half and exits
> +
> +Live migration resume path
> +--------------------------
> +
> +::
> +
> +              Incoming migration calls .load_setup for each device
> +                       (RESTORE_VM, _ACTIVE, _STOPPED)
> +                                 |
> +       For each device, .load_state is called for that device section da=
ta
> +                       (RESTORE_VM, _ACTIVE, _RESUMING)
> +                                 |
> +    At the end, .load_cleanup is called for each device and vCPUs are st=
arted
> +                       (RUNNING, _NONE, _RUNNING)
> +
> +Postcopy
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Postcopy migration is not supported for VFIO devices.
> --
> 2.27.0

Thanks
Kevin

