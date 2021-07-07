Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 780B93BE66A
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 12:38:06 +0200 (CEST)
Received: from localhost ([::1]:58822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m14wP-0004rE-0d
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 06:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1m14vB-0004CD-Jj
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:36:49 -0400
Received: from mga02.intel.com ([134.134.136.20]:49740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1m14v8-0000kM-Ki
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:36:48 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="196446119"
X-IronPort-AV: E=Sophos;i="5.83,331,1616482800"; d="scan'208";a="196446119"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 03:36:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,331,1616482800"; d="scan'208";a="486793525"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Jul 2021 03:36:33 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 7 Jul 2021 03:36:33 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 7 Jul 2021 03:36:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 7 Jul 2021 03:36:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Wed, 7 Jul 2021 03:36:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YkJsZZyCDR4rM0YrSYtwPwObpAunytJKTc7p5wrN9C4vYX3MZbebI8YzueVBeDUUbvnrZXctxnC68TMp7S4DwAR+FYBVmZfUlBoE9kc+mn23ODh8Gcqbwh0lzCNYHPK4Smj4isah+VHv7rC4nyLjdBnWC0yqYfyBWcAIViz2Xg42egs0VGV9YeQyoOqguUkBUqOAUpbbSuhCdfi2Iqkfch/yL7uJls189Bc5wWV91dq9hpldeAREwz5IbJ2vJSkNQ6/K1Zs6w3l55rVscP3PV0lWLguHfiVYP1onXYclbFUM5DbXtbXk7Td9+PnyeTGpaLsDC+rgYpd2JfwH0Z/ZHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/MOATtMHo82Bb4e3BuOWd1W5CBURCiGGzNWIR5Z2nk=;
 b=YQl4XbeSFNpfKERpz1V79G1quXwQ3lsd9fORCqBABicq2YZyT+EiQxjA9Od8we+/SeNGInMEkCIyrHwu/D6nlNvVmbUTkSlVpWn/plP0GTEmykFscNhozOOYPjqUWeBw5/J8Ttsd7Z4d9srs/lT3IwuByjGip0/DJWOnDPCZk42lZg6CqZu1bcsiVJgwbqxkoo7g7bZHvfJQ+607wksjjptu2XSfBUG7+vmfIrohN3WPZQ5ZVKZWWS0LARQoz0JpjunRYFOWx7TiG6rD3/SP0JiCfVuxMOMZA7gKSL8Elt0OtAzzyf8GQC7XloMIG7RlKjtQJWmWB81cg+/MEFwX2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/MOATtMHo82Bb4e3BuOWd1W5CBURCiGGzNWIR5Z2nk=;
 b=SOr8Ivx2qYa/HOxS0TmHZfzq/3tB4sAQGXtPqF0oXGKpgupECsTtj51YTBeUAuqWSmgsHHJDKjKuz56t+zBK7bPa4CuWvErfkRuYgEYmtKISi/O2dK3ETnOk4KslbBDSCgn+l3rdj3HYCF141yoH1hYcj8k1m8JnjJulW74+IHo=
Received: from BY5PR11MB4070.namprd11.prod.outlook.com (2603:10b6:a03:181::16)
 by BYAPR11MB3846.namprd11.prod.outlook.com (2603:10b6:a03:f5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 10:36:30 +0000
Received: from BY5PR11MB4070.namprd11.prod.outlook.com
 ([fe80::d122:f263:7ce9:97cf]) by BY5PR11MB4070.namprd11.prod.outlook.com
 ([fe80::d122:f263:7ce9:97cf%3]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 10:36:30 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Peter Xu <peterx@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH] docs: Add '-device intel-iommu' entry
Thread-Topic: [PATCH] docs: Add '-device intel-iommu' entry
Thread-Index: AQHXXvNaRxnNEkeFUkmAhuPIdHbvHKs3eSRA
Date: Wed, 7 Jul 2021 10:36:30 +0000
Message-ID: <BY5PR11MB40706BCDECFE74B7B95C6751C31A9@BY5PR11MB4070.namprd11.prod.outlook.com>
References: <20210611185500.343525-1-peterx@redhat.com>
In-Reply-To: <20210611185500.343525-1-peterx@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1d62f12-90f8-4907-85d9-08d941331569
x-ms-traffictypediagnostic: BYAPR11MB3846:
x-microsoft-antispam-prvs: <BYAPR11MB38468678FE56A378DCD3F906C31A9@BYAPR11MB3846.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h3vezYZ3h0K9wrMVnyku+S2XBtwToLPGb8L2cUgBBCIfO+eLBxDnUn02hI/62VdfCEwaoEGdTLIOKI3R+NGiEUimpjD2bp/rXNZ/IvRR/oxVBAi8gbmY/mOVM20B+LUI9Mk4cZh/B25Q+8WgoZcZH8w3hXcOG//SDp75qK/8GY09T3UViU+tupzQUsJviIQGO49hGV5iNqKOLko3Mb2cutzDk/MsroJ0Qy2V4m6EnAcXkmWmfH2bg9h8Y2ie/UKv5+aIhB+wKe7kYaAUAtE2sQCUvjmgx0BKmp/IiyQS4qEpCfWAFDLWdJU5AsTHN4KZznFwne8t/f13KUlASuI4lImV6eSs/1/yVsCaF79na0KgZxx7Qo+ajOSO+m6cV0m7/1jJ0jLh2c+3QdGkxJqzypK+MSV5kLO/Sep8/fl0fYf/Uxs4UuKMZ+f1UWdqUL16wMkHF9DvdgFY8va9TLJa2en5fguSqoPrP8aXF47QfhtFVrlms0cG2ep9+x+fXxSlcA7gfwitD7EZb5SKDDbwhr7JXsrFuJfOMoTvqLWX3A4GohzooMA9P2ZKToDmwfea9nZuAx+6ngGzKBDgxxDH1W6mye4ee+kD8UnYpz+MhbV4K81PrWNSB9gNk/XQKsm00B8yQmVXZ0au8w9fbUj1dT1duPUF0KvwS7LI8vjOeDs8OCjVFoWw2CuejdzpETxCc25PL72R7V3DMEE7nN0luL8JltAgzG7fgP1P82feT6w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4070.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(366004)(346002)(376002)(136003)(26005)(122000001)(5660300002)(7696005)(478600001)(6506007)(9686003)(55016002)(4326008)(33656002)(54906003)(38100700002)(66556008)(66946007)(66476007)(76116006)(186003)(71200400001)(52536014)(64756008)(66446008)(2906002)(8936002)(8676002)(966005)(86362001)(316002)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5ecXHuWWFDGkKwJC9ild5U9WlTo0YcJP4SieOEz7uF1k9Bn6fCFMLvVjVIpk?=
 =?us-ascii?Q?g2dbe1AzHLN39B5gynMRXUH3E4qLY9aivuyyHSKwKe2oNxdotaAmy64nwJpe?=
 =?us-ascii?Q?ZB24qpS4GPbL6PyAnvXV4PrGlmGuBrRlgcopiNNhUzg8qEZDICHwKKVmkLzJ?=
 =?us-ascii?Q?v7urwsRaTJIf4F4NajXIqeavUFJTy/DM3KxzRtd/8E/B6e9m6hBRZRYpI1Je?=
 =?us-ascii?Q?l4Ign1fOscJKoSXp+pDd3/TLd+fpsS6dURuC+uDDow6QTg6Q0TApGevUy6S3?=
 =?us-ascii?Q?PPBxGjcnZGD2RXhw21syXrPUeMMppktEFddzqKYKiHzsmSQ+Gz6tzE1LSaAI?=
 =?us-ascii?Q?PxN4015cq0OaYyJ+/Y2FgbCyeenlI0Jwg8dKndjwqV245DU/6f6FuQ8bVtbO?=
 =?us-ascii?Q?tmyU54TsjYzgExkaOz12EHQ1v5TqDHwvNEA45/Wwv+EiyxsUIZlxTaKfN3Hb?=
 =?us-ascii?Q?QzSVnvq3/U2aduIt+JvOXqMBgieqPT6xnVTQu09eODgkNIIJoes/ORFUTrfr?=
 =?us-ascii?Q?RvZ+j/WWu2GNIB6mf4x8r08K7FIFy2saLPAJjEAtXcIEOoqHmATWWo6M6Aym?=
 =?us-ascii?Q?mejhOfkecHgClCUlDjOwq8QW7+CUSZ7fcU6/8020ALAEQbdtOb9cXIMIYzAB?=
 =?us-ascii?Q?Gz6nwPUut0S4SVNk9/2KwTKVLT3Bn32mx87Fu1ncdxMvgnN3hrnIPILCExMv?=
 =?us-ascii?Q?6N9cnQJgUMSt6GtcQqaoA7kPd4Mx7EPNwzDTQ1cGUe9pX9MZnIr9EF2hUzud?=
 =?us-ascii?Q?dxmwfue01uYMyKA0JgN7U3LlPVAsHDniAJhgyC47LdcqCyvrLBx7dbElpqAZ?=
 =?us-ascii?Q?00fk71BE+W9s5Go4djZU7m5fC8K9DW5gOJjhUQhpAgIGjsWxPEAUsiid0rkn?=
 =?us-ascii?Q?R8Q+6itMH6+HV7/pWjNML5Uvh5FyM9eJ18L3FE7Lg4/3OaBxpBCOSMd4rPcB?=
 =?us-ascii?Q?Y/LpyK2/kQkDY9dN93W3VVgNtB87k8vNyG60ZJzWSVCNDWSY82eoq0iaOC3v?=
 =?us-ascii?Q?aTaIWtpheGcqqnxEgHm4e0FfnkE+yUMBQjEzrTM/JHESnA3i9lLVnfH4XBtZ?=
 =?us-ascii?Q?W4eFQU9Pv8XMxWEeVw79jJEaryEwPIs7i7Mbe1nv9rPsQoFBYiqHmuP6k9RX?=
 =?us-ascii?Q?utviTUO7gq/gZ9Ui8wwdxzPT7yUEEvdBZ88osaCXWlvJwc8j6NdCDSHjo12X?=
 =?us-ascii?Q?WYKt1TbXe2ysOv240cU6yVHoHhTH1buR65JOCfEZeH/JbvuHm2lCceXVsey6?=
 =?us-ascii?Q?3t1ZBGE4eoHY92Osh3dAgDUMfP8Jyx9wAvzyUMhcrfKrudG9NbDqMMtgLpPA?=
 =?us-ascii?Q?4X0=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4070.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d62f12-90f8-4907-85d9-08d941331569
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2021 10:36:30.6461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ca75mwC26e7PlTFhH1DgGT+n4LTXDkG5xf3YzRIUWjpBD5cmAkdjmExl4ZGB4eVvU3TD7JiCMnOXLFTiRSPouw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3846
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.20; envelope-from=yi.l.liu@intel.com;
 helo=mga02.intel.com
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Lei Yang <leiyang@redhat.com>,
 Jing Zhao <jinzhao@redhat.com>, Chao Yang <chayang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Peter Xu < peterx@redhat.com >
> Sent: Saturday, June 12, 2021 2:55 AM
>=20
> The parameters of intel-iommu device are non-trivial to understand.  Add
> an
> entry for it so that people can reference to it when using.
>=20
> There're actually a few more options there, but I hide them explicitly
> because
> they shouldn't be used by normal QEMU users.

yes, it's a good start.

Looks good to me.
Reviewed-by: Liu Yi L <yi.l.liu@intel.com>

Regards,
Yi Liu

>=20
> Cc: Chao Yang <chayang@redhat.com>
> Cc: Lei Yang <leiyang@redhat.com>
> Cc: Jing Zhao <jinzhao@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  qemu-options.hx | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 14258784b3a..4bb04243907 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -926,6 +926,38 @@ SRST
>=20
>  ``-device pci-ipmi-bt,bmc=3Did``
>      Like the KCS interface, but defines a BT interface on the PCI bus.
> +
> +``-device intel-iommu[,option=3D...]``
> +    This is only supported by ``-machine q35``, which will enable Intel =
VT-d
> +    emulation within the guest.  It supports below options:
> +
> +    ``intremap=3Don|off`` (default: auto)
> +        This enables interrupt remapping feature in the guest.  It's req=
uired
> +        to enable complete x2apic.  Currently it only supports kvm
> +        kernel-irqchip modes ``off`` or ``split``.  Full kernel-irqchip =
is not
> +        yet supported.
> +
> +    ``caching-mode=3Don|off`` (default: off)
> +        This enables caching mode for the VT-d emulated device.  When
> +        caching-mode is enabled, each guest DMA buffer mapping will
> generate an
> +        IOTLB invalidation from the guest IOMMU driver to the vIOMMU
> device in
> +        a synchronous way.  It is required for ``-device vfio-pci`` to w=
ork
> +        with the VT-d device, because host assigned devices requires to =
setup
> +        the DMA mapping on the host before guest DMA starts.
> +
> +    ``device-iotlb=3Don|off`` (default: off)
> +        This enables device-iotlb capability for the emulated VT-d devic=
e.  So
> +        far virtio/vhost should be the only real user for this parameter=
,
> +        paired with ats=3Don configured for the device.
> +
> +    ``aw-bits=3D39|48`` (default: 39)
> +        This decides the address width of IOVA address space.  The addre=
ss
> +        space has 39 bits width for 3-level IOMMU page tables, and 48 bi=
ts for
> +        4-level IOMMU page tables.
> +
> +    Please also refer to the wiki page for general scenarios of VT-d
> +    emulation in QEMU: https://wiki.qemu.org/Features/VT-d.
> +
>  ERST
>=20
>  DEF("name", HAS_ARG, QEMU_OPTION_name,
> --
> 2.31.1
>=20


