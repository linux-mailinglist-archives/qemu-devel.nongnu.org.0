Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A10A33FF91
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 07:30:21 +0100 (CET)
Received: from localhost ([::1]:48428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMmAm-0001pT-61
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 02:30:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1lMm8i-000142-9M
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 02:28:12 -0400
Received: from mga06.intel.com ([134.134.136.31]:58169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1lMm8g-0005fa-0a
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 02:28:12 -0400
IronPort-SDR: DkXDRPMU84O44WucPAIkG/a5imBCdhHhi1CppjXsCRXS6MJQbe+xIwB8Gwwxd6fyFqUfAsAYyy
 w8E3qAlzYX3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="250967387"
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="250967387"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 23:28:06 -0700
IronPort-SDR: 8POupBgvVyEvKA4v1zio6sZ2PLE57V7TMSdsj71MiZE5V7JF93Uiv1nWmIgumcnYdcCyEkjSVG
 AHD9eF7wqDtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="523148721"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 17 Mar 2021 23:28:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 17 Mar 2021 23:28:05 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 17 Mar 2021 23:28:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Wed, 17 Mar 2021 23:28:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Wed, 17 Mar 2021 23:28:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSUgqQPTNOK9dFYu5j3g763pZ/StRfTVNVyvHRKDeDYDcPs6m5v4H5Uaiflbw+YT4VR0Vs09dRALVscNm0akiv0WsknG9k7ANB4c2MNFpb4vN7twNu9sW8318pfnRDtAeinrGWu06MYrUIRtExY0bfcCZv714rCAZUKPNGVDL0y5g9B9ofmc4Wdrt5zAOEM0/tqLcLh5UQ/Ko/hXewt4s/Z9IdfHd1RiF1SpZoaCAcftwN8S5xQWjFtH54pH/o8iDpGXgcPZKRQlYTjz755wQ04H58fM2mOSJOCnNmK7QGXJayRkpkmp6/OJkJ9t3QmHgw6HFuoXGn+UgILYXPrGWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/UEp69TQV2cKFt0nPhtnmvLKW672mrz09MXVv1hK3A=;
 b=Vk73kRehPdOrZzgmqJX6w2jSHedDebfifihdsG6w9vjFCuta3pNS3cL88engJ5dMLSzAC+5ea0YbxXuCqVpcge0hs6O0vNlR/smVBFXBmxNzRIDn7P+JPjqQ2ZRnq3khGGCVYR7Fj1OX8f6bIQMZenJp/4CJrczk/oYp4z0kxn/FVCcRsmlhPsI1SGe+TE4pOKSfVZTV3AOApp3P9bbWZ44mwjYtEu4LzUDnYP0XKQAdnwGUIVBGm7uRciwxa1KHSGjUNmna6Y0TlCfSlj5oyv7RCXpodk6XATxTdZxv3hnVFABLn6YKF5jFu7kJutAgXOA6lhYDghnxwvjVcB/U5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/UEp69TQV2cKFt0nPhtnmvLKW672mrz09MXVv1hK3A=;
 b=HUaO/kili25qPa2UUUeNG16ji0taN1a4q8aYF/Hg1nLocwwJpMWQO0Bxg501rB80yCITIoE+PzX4S7YzQRpcUiivkzZAnApIP9RhLe9WXrV7GmwWQQJJpOBUx9s6F+qWjan3QKQi56gM1DZYzCTHIfUUkYL/kuIuS8MwYWVX0L8=
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by CO1PR11MB5092.namprd11.prod.outlook.com (2603:10b6:303:6e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 06:28:02 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29%9]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 06:28:02 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Kunkun Jiang <jiangkunkun@huawei.com>, Alex Williamson
 <alex.williamson@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Kirti Wankhede" <kwankhede@nvidia.com>,
 =?iso-8859-1?Q?Daniel_P_=2E_Berrang=E9?= <berrange@redhat.com>, Tarun Gupta
 <targupta@nvidia.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: RE: [RFC PATCH 0/3] vfio/migration: Support manual clear vfio dirty
 log
Thread-Topic: [RFC PATCH 0/3] vfio/migration: Support manual clear vfio dirty
 log
Thread-Index: AQHXFZHd9gMMyJ85yEilSjdZld3496qJVEGw
Date: Thu, 18 Mar 2021 06:28:02 +0000
Message-ID: <MWHPR11MB188608DDA524E353866268AE8C699@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <20210310094106.2191-1-jiangkunkun@huawei.com>
In-Reply-To: <20210310094106.2191-1-jiangkunkun@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [101.88.226.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a48393f0-e5d7-43c1-f07b-08d8e9d6fb7d
x-ms-traffictypediagnostic: CO1PR11MB5092:
x-microsoft-antispam-prvs: <CO1PR11MB509218C1B59B9C96C9AE1A138C699@CO1PR11MB5092.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XngkE9fmZF+95vgM9Mz1UwzqwG8LblVlG3e93Pv6kWrH5rOvCFrRIVr2BR6hqeyUgeoozT3XDky8mn5c64JmazHtTSnSeLnrB2C7tZSSPAqYsgS2XDzTiyYgug7YBGhziDBiT4FnRMmtXW5tyMDtVb/+H3QmJQOoEoGILDPUv3e3OwztcHQXU5lx37KTIjpHjY3UH8YITqd220IA46iOf+mY+/Z2e3qtISMTmR/W02lDUMzn5pnRsKAp70YjxT8lAyxtyhvDMsPdMtwi+kWhpQL3iW/aA7MuDfvy9KC5THmLRcweg6+uXYZrz5nYa8HZfDit9Jwbh7o8orGBGGxcmS0WZFqzV5rwR/G7czXp3RZwhBejaD0Vk57+UHlKCVfd1qjNOOp2JrlEVZVUxUW1BmfaBIUh8Z/gwLcHQB0/YNQ8Huu9MzspuA+sTTDQ/CNuJsiH3nczwQ+GALOpeT/5nm+f737H9pHECeZlgQsMrQ/6bAI/vNL/zBDch5rvguzHchDP8U9G+ISPQcJ0x2HylF4493+pwBd62univLZljA0CYTRPAyQuVIlcDKtm1Br9L0nwOKyIvVJFq+QH3UeQ8xbrFisEaspHJ7NmrsspJlYkfYlZpAjbL2tTIqHxpAj+Otif4oEk6JwTB7/V204FYWuuFLY8hFarwK92/31lZZ1e02Qpx+citDx+HAvwjgbngjc5mV9aZKUa1iEXbbJlP7MAoOcYH900J+8miYeozaQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1886.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(39860400002)(376002)(136003)(396003)(8936002)(26005)(71200400001)(4326008)(55016002)(478600001)(316002)(8676002)(9686003)(33656002)(186003)(86362001)(7696005)(64756008)(966005)(54906003)(7416002)(2906002)(110136005)(83380400001)(66946007)(66556008)(66476007)(66446008)(5660300002)(6506007)(76116006)(38100700001)(52536014)(14143004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?kq56VBBgF5Wj6x7N8FANe9fks0fCCUJxoHTcc+lmgFIa8exItbJwH9zjH2?=
 =?iso-8859-1?Q?8YQQKYJAWDZksyCoON2VVqLypTtzbkCekdR/bzdYx5hNPNi1DBYgLR4/MB?=
 =?iso-8859-1?Q?YjGRMW+XNFJCvlU5DKJpatNewU3xX0koigTVuQxIgHu/hc3SeXJ8GAb/AF?=
 =?iso-8859-1?Q?YS1RZKE3wYDI3HRaA3bRPgy8l0BycO6A6/wYen0abBS/05g0oMorLAjAe5?=
 =?iso-8859-1?Q?Vc/CRiCulAdFjXmISd/nrE7A2T53A9PzJpgoJPFHc9UEsybt0q6Y8ij6sh?=
 =?iso-8859-1?Q?vtJDCs7IPQTgL15iAieafgYrCeLCEklQJ5ijJ13iTKbKUEhLgHElNn4iXD?=
 =?iso-8859-1?Q?43eDLDSPWy5t51C10K31K4/Ofi9kzpKvjwL7rjt+nzjyVIT9/S9EK29fCf?=
 =?iso-8859-1?Q?1KNN1nBEJ0Z7wiG/XeArr0zQr6J7TBJqWyv06cnFroOggpPSWgN3vBEn0W?=
 =?iso-8859-1?Q?6D3NlY7LYw4M77q4Sysz9nhy+Amty7gTmsbf0Bodi2blpo/AKmN/blSoYZ?=
 =?iso-8859-1?Q?mZLLVYeecmtXlAJKkGIfesuL0gvpCBVFZQRUWgyJqz0ENKBk7BcXHNvv+X?=
 =?iso-8859-1?Q?jm+63DsHz1pzc8YyiyVZyHouxfXK7XegMkONnkP/5OnpdrSAkeS30EyGQj?=
 =?iso-8859-1?Q?ZTddeFHwCcWSmyP16OppR0Zj0E+pThfnQD7NZj3aVxsYFno2EPDX9+M9kJ?=
 =?iso-8859-1?Q?kj+PaoD0quar7UGiOJqWi+ChmPONiJisUccdiNFCtEow5sIHD2vnGxrM9+?=
 =?iso-8859-1?Q?t6lIrjc7niE3P2AVjfND9A5uDhFphn0a2eF8VnI0bYvcrdSIvAshDoBJiV?=
 =?iso-8859-1?Q?f4IHlavfDkhgQuW/TmFvjlfLyBiRDhh7k6rxaQEVYszghnW1oy4A8wJpYT?=
 =?iso-8859-1?Q?mIsZ6cYNbeUioesUg9rPynhZkDdllJhW0wE1dNyr/mQGA6jXxEeGbqOAli?=
 =?iso-8859-1?Q?Y4NMlP7fACgTv5nqF4TdURxbb/pESnAmWdOHBlP4YMzXu2X8+Dtv/2elpL?=
 =?iso-8859-1?Q?NoaRgRAiRPjXHcmWr+t6yU7B5ppkDuPDOW/vVer10My81k4rMBb0MsgCEr?=
 =?iso-8859-1?Q?vy2YApWt76uvuDF+4zpNOnf34d8XDgCU6To0U1kOeAT8CJhZYfZ9Wq+G3t?=
 =?iso-8859-1?Q?O8FpZ+4Fw73hUJo4QtbvxnrIPMl11iLuk7OSQej7WPDPiJvGNcdlU21O+6?=
 =?iso-8859-1?Q?n/DI8WUszwZi0U4LwZMOmrbxZ6Xghd562x1vEJjEknGU1+KM4stS4/Mexi?=
 =?iso-8859-1?Q?vO8CMJfx135BFjSjoV9gbKKwgd98kKFQgMS7JbETDiw5Bm45fm29TIYfX3?=
 =?iso-8859-1?Q?7Y/Q6a5dr8RTWx4UmMMGrO9+MfmskgZW57BoxLPKK8Do2bq2CuBs7JQUj6?=
 =?iso-8859-1?Q?TAg5BWJbEE?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a48393f0-e5d7-43c1-f07b-08d8e9d6fb7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2021 06:28:02.2553 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AwjMBx6QeXkoc1iRKQgYuDJ4sHySzObsXSR7k1f+rQ3Crcd6tjsgg6t2PWyJY3LElPTI+k3516HJy4xbTH1ZHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5092
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31; envelope-from=kevin.tian@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Xu <peterx@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com"
 <shameerali.kolothum.thodi@huawei.com>, Zenghui Yu <yuzenghui@huawei.com>,
 "wanghaibin.wang@huawei.com" <wanghaibin.wang@huawei.com>,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Kunkun Jiang
> Sent: Wednesday, March 10, 2021 5:41 PM
>=20
> Hi all,
>=20
> In the past, we clear dirty log immediately after sync dirty log to
> userspace. This may cause redundant dirty handling if userspace
> handles dirty log iteratively:
>=20
> After vfio clears dirty log, new dirty log starts to generate. These
> new dirty log will be reported to userspace even if they are generated
> before userspace handles the same dirty page.
>=20
> Since a new dirty log tracking method for vfio based on iommu hwdbm[1]
> has been introduced in the kernel and added a new capability named
> VFIO_DIRTY_LOG_MANUAL_CLEAR, we can eliminate some redundant dirty
> handling by supporting it.

Is there any performance data showing the benefit of this new method?

>=20
> This series include patches as below:
> Patch 1:
> - updated the linux-headers/linux/vfio.h from kernel side
>=20
> Patch 2:
> - introduced 'struct VFIODMARange' to describe a range of the given DMA
>   mapping and with respect to a VFIO_IOMMU_MAP_DMA operation
>=20
> Patch 3:
> - implemented the operation to manual clear vfio dirty log, which can
>   eliminate some redundant dirty handling
>=20
> Thanks,
> Kunkun Jiang
>=20
> [1] https://lore.kernel.org/linux-iommu/20210310090614.26668-1-
> zhukeqian1@huawei.com/T/#mb168c9738ecd3d8794e2da14f970545d5820f
> 863
>=20
> Zenghui Yu (3):
>   linux-headers: update against 5.12-rc2 and "vfio log clear" series
>   vfio: Maintain DMA mapping range for the container
>   vfio/migration: Support VFIO_IOMMU_DIRTY_PAGES_FLAG_CLEAR_BITMAP
>=20
>  hw/vfio/common.c              | 207 ++++++++++++++++++++++++++++++++--
>  include/hw/vfio/vfio-common.h |  10 ++
>  linux-headers/linux/vfio.h    |  55 ++++++++-
>  3 files changed, 264 insertions(+), 8 deletions(-)
>=20
> --
> 2.23.0
>=20


