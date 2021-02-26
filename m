Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CC5325F72
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:52:07 +0100 (CET)
Received: from localhost ([::1]:59930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYqz-000669-OO
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:52:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1lFYE6-00083C-FF
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:11:54 -0500
Received: from mga01.intel.com ([192.55.52.88]:6394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1lFYE3-0007cV-6v
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:11:54 -0500
IronPort-SDR: OdlRUa9YZmRPCRrC1WXCz+VLb9GydkxZsrxAj7C0FP6agwaM9oBEhlG6jvc77k8MKzmgXrAZ22
 uCOcs8J241jg==
X-IronPort-AV: E=McAfee;i="6000,8403,9906"; a="205338068"
X-IronPort-AV: E=Sophos;i="5.81,207,1610438400"; d="scan'208";a="205338068"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2021 00:11:45 -0800
IronPort-SDR: zMej77SUaiFuxWO0woOgZUK0cOoRiFshKNRH3ThOOzGg8ROzo/hcq1iKNT93siusv/tENBED9s
 O5lVtqp1694w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,207,1610438400"; d="scan'208";a="516429989"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 26 Feb 2021 00:11:43 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 26 Feb 2021 00:11:43 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Fri, 26 Feb 2021 00:11:43 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Fri, 26 Feb 2021 00:11:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcyWfI/ABkoxHwEsf1vAIeYnBxR3lk6Hw1hrJxZBOQJDThxmSJjMLEr79wB5kyzp4VC4/Y/wx2yWpawTO56Mt9SxInl+04QZ73RDPkFedXzklePnBU+u8pCqHsPBTldtWVX4fPvCrSCxQZzTxGgqzPhhqGvrETcSJrfiYQ2BMg8Fu1fPeKKKio5Ksab57HBni+XEH8d6RKJbPuboZLdKJ6gtMDuFAd4rudjffs3h9cvyL+phoJSZWrFC1OmDjIxU/rZrD31WeAhwNUlZLtUx1ciRi77gzPDNQZ//pKMjBM0Wwq+n3rn7tsQvOR/VzGehPGDt5NZWowA5CO8f1/N2vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nf59bfT+obX9ZFqiO73hHuEvNEKFO0x68WYw89cO32M=;
 b=IAYbZHz8Fl9RXYvKdssP0P/rXCQXcPtAuTeGxlJk6Uo45JcQzq3xFj2Ov6+WW+QIeCkPk9zxnbVN0ZRw+u/nFLK9qIHZaI2NPM3iQzuKhUOv38MY1+AQT3PZbJqIDr+iQE10u8/R+XX0aTUu50L9FU/3chrAtIIzgIhyksO98wfNx0N+Rl6+9unVYvPgoil0bgzewkHTD9OeXLZ1mGlX/FgRrNCFkaE9BO+RzRDbYzhajTOvoJQU+VaOFBXVLKWNKm95dkSk9eUnysaUORFsut0fOVFnfLM3CJ+/J7uLnuWwlyvrsRmMjzf8DyMVj9LOWGszSJBLEYfJXfJoDJlK7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nf59bfT+obX9ZFqiO73hHuEvNEKFO0x68WYw89cO32M=;
 b=osNEoj6O5GjDFgmItGYwn5jGpuqVA+Oqm6mxMh+Uip1lSe2cbgG6XyvgWh88xAllFke1ePNi4dKNTZOCMGbN66Gub85yC7beFNpzy0mr0F/uoOJkEs9I7/FH311cXcf2YPSbQE12DJXTt4u0haPRz7mhZL3G0j63CIoe6BMc5+0=
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MWHPR1101MB2077.namprd11.prod.outlook.com (2603:10b6:301:4d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Fri, 26 Feb
 2021 08:11:41 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46%6]) with mapi id 15.20.3890.020; Fri, 26 Feb 2021
 08:11:41 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>
Subject: RE: [PATCH] virtio-iommu: Default to bypass during boot
Thread-Topic: [PATCH] virtio-iommu: Default to bypass during boot
Thread-Index: AQHXBeaUxWke9mdNCkS9tX2R5NO2MqpigkAAgAak/wCAAPcM4A==
Date: Fri, 26 Feb 2021 08:11:41 +0000
Message-ID: <MWHPR11MB18862C07D1473445DBC42C928C9D9@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <20210218105929.1433230-1-jean-philippe@linaro.org>
 <20210221064211-mutt-send-email-mst@kernel.org> <YDfatCDUZ3FISPJI@myrica>
In-Reply-To: <YDfatCDUZ3FISPJI@myrica>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [101.88.226.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a71c4da4-5fb4-48d0-a53b-08d8da2e25fe
x-ms-traffictypediagnostic: MWHPR1101MB2077:
x-microsoft-antispam-prvs: <MWHPR1101MB2077279E55757FED92E181E18C9D9@MWHPR1101MB2077.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fAB/EqemMNDqruhf+lhc0B+hKRYAEQ0EwdHN84hxO9WBvNn7E8aCCIr6f5UbnMuxcO18lvynMM3fEqmRbOkGhlis/1FB+aXOvknO8D427VibpZ5Ac/8pAhWwq88nGpC2byvzJmNsMsEh7ESlupvNUS7SZYsMWYJEy17aMYegUxOe+s9Y0aISTyfu8MDY+RkLWK9cOUcCc8mViI0uBuT019/5QApsvXBSiBulMk+a6XLJfgbV+MhufB5aFusX6NgsPmgBNCtY8Z+Ce0Ge28qTAJfN+MtbLyaiUcAVVAZpfKrTVFQCJ9b0IhCUPr2FdTTYWvOvGBHxgAZoSPpkEom1TTni9T1A7EzIA7MWiE+z1Ie5wYpT69fkIGvnoeBaa8y9ajkyFM3piOCb6jOVX8HDxRl5ciXhgegQ0u95W4x2/4K+h8Z51Udu3YrJ+ZeD3TUgkkZMhGOgVNgJii4A7vlypU0pARDtT8wALRd6q6G/xUI0F4RhrhvKfs4EilmabrdtlUx800wmUBjHmOsOI6+mTvm5RujS/SK7sOmJta8I7Ltf9G25IzxoNtFq5mr9p/kA0WQfIbAUV/1ntydllCFm0VqEp+GsknliklB7KOjykwY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1886.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(39860400002)(346002)(366004)(136003)(66946007)(54906003)(71200400001)(316002)(52536014)(110136005)(7696005)(66476007)(26005)(64756008)(6506007)(66556008)(8676002)(478600001)(86362001)(2906002)(66446008)(33656002)(966005)(4326008)(55016002)(8936002)(9686003)(76116006)(5660300002)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?HAyZ5o7ATW6Uq95nbFDjmBudiS9okmdlSvYfGlp1dxp6cs9oM8716zorSMxw?=
 =?us-ascii?Q?f4kuVspc92EsmkJklUUY2zJ+5SZj0wAMSdcwei92cxJLJNSD+ebQ3+9Agz3v?=
 =?us-ascii?Q?hiMSqS0Ke65f/IntjYr+AOtJzgKSPBQTtniHLAOmHY2wWBx7cDwTabJvCNnU?=
 =?us-ascii?Q?4kXBZH8qsD96WNxMZGKN6ARpcQyT0997KnTVihaHqdcPFQ11K/qeIj2pP3uT?=
 =?us-ascii?Q?onPUQQGaTr9F+hjvwR4//fOHKvJq/ATGz0xiFJDgaAyT1yBucpZ+lEtHt/VO?=
 =?us-ascii?Q?kfHqebwST50n15no16dvmDieZsVgJvUmFVQBJH2eCnIMBdXsPHFeIE25SQfy?=
 =?us-ascii?Q?L9A9Gog0w+SJOR2IZ5dG3Hb2GItdJ6wKanJamk4Giv23f3SiEVd1xG2QXygj?=
 =?us-ascii?Q?cS1+n7PNR+TtlwPMNbFsnt1dBYvQ53gY28UP7eXsejWEfhOIkaIvB6XtTs23?=
 =?us-ascii?Q?YE/UKmC740wcwILtZArBIYXh57Rb06P6bxcA978z51jYQu7FEgGpaVpoZjmf?=
 =?us-ascii?Q?7TvS5QGP+FE4U3Q66zQZ/3uIMSFWnhOZdc9+aE3YRPRkzlDdmuDURZ2agZy8?=
 =?us-ascii?Q?c+Z51GE7HldN/ikd0NdAGB5WJFk5PwDcVuTN3SAYCYf6CAY5c71Kz8K7S24e?=
 =?us-ascii?Q?33KpqrhKf7mKEDGu/rKyO+vl5qtL/d0MCxg4PDybhp3iH6HBTOM9a24ZMPlR?=
 =?us-ascii?Q?DCMUWPiKJ5EFV3i6hysie/qAsZ9+Kl8zEKVyd7RcV9pbF2uBMJR2NA8L5dga?=
 =?us-ascii?Q?fDU/NG6GZF4lCyZ4ap/i5hlFlU1daAvxkKqGU1fdf4noA5tU3UqHdAzK1b6p?=
 =?us-ascii?Q?XKieCWbPbLM+NEO7YIBGGtYtLdkJm6fQRYwYLoz/J7P6EdwyM9kGnQAPVJgM?=
 =?us-ascii?Q?95yjTXKDcqUGrBFQ30b5B2lColRpwFVmgyI7oT5nfmKZ3KELUb5wTUvyvLxV?=
 =?us-ascii?Q?In+49mXdOzo2nPHZFlfD97O77W/oqijvbNcFYgr/QGg4vluzEvN5agA8afty?=
 =?us-ascii?Q?Y+GyXbHt8xubJ3HtT4Kew1lmxQ2VjHwOnNV7I1aWv3SSMdAdue78uyLDJuEt?=
 =?us-ascii?Q?SjLTsZvaFODjFjAXffSevN5+8chzMPYed8z5eDYCHBfTwyvbjgkEDIAY/mmt?=
 =?us-ascii?Q?5b8y7RcnnUKl0RXCbJ74LPS8X2C86YFog/7ESg5RbTvAMtnk+tVB/54rrhVA?=
 =?us-ascii?Q?/3grY0ZHTp8arU7ep5i5C01y+P5pfshvt9DCGV6JjWyVrS7qgEJB8iahnAlZ?=
 =?us-ascii?Q?eWf1rLKy0uUN4egC+EWnJBs39Hra4h/1JCPCmKv5MS84g9MZix8qzB36ynPU?=
 =?us-ascii?Q?SZdi/xGsRXamTWqSrpNG0h7O?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a71c4da4-5fb4-48d0-a53b-08d8da2e25fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2021 08:11:41.2781 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s8bJ+hmabff1DxZlvG5b2S9DyRelRseg0BqpKYWapDaUORgop2K3BFEcAijEwm3jxopbab9al4+0lFnyKZ9bgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2077
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
Cc: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Qemu-devel <qemu-devel-bounces+kevin.tian=3Dintel.com@nongnu.org>
> On Behalf Of Jean-Philippe Brucker
>=20
> On Sun, Feb 21, 2021 at 06:45:18AM -0500, Michael S. Tsirkin wrote:
> > On Thu, Feb 18, 2021 at 11:59:30AM +0100, Jean-Philippe Brucker wrote:
> > > Currently the virtio-iommu device must be programmed before it allows
> > > DMA from any PCI device. This can make the VM entirely unusable when
> a
> > > virtio-iommu driver isn't present, for example in a bootloader that
> > > loads the OS from storage.
> > >
> > > Similarly to the other vIOMMU implementations, default to DMA
> bypassing
> > > the IOMMU during boot. Add a "boot-bypass" option that lets users
> change
> > > this behavior.
> > >
> > > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> >
> > wouldn't this be a spec violation?
> >
> >
> > When the device is reset, endpoints are not attached to any domain.
> >
> > If the VIRTIO_IOMMU_F_BYPASS feature is negotiated, all accesses from
> > unattached endpoints are allowed and translated by the IOMMU using the
> > identity function. If the feature is not negotiated, any memory access
> > from an unattached endpoint fails. Upon attaching an endpoint in
> > bypass mode to a new domain, any memory access from the endpoint fails,
> > since the domain does not contain any mapping.
>=20
> Right, but the device behavior regarding BYPASS is specified as:
>=20
>   If the driver does not accept the VIRTIO_IOMMU_F_BYPASS feature, the
>   device SHOULD NOT let endpoints access the guest-physical address space=
.
>=20
> So I figured that the spec could be read as "before feature negotiation
> it's undefined whether the IOMMU is bypassed or not" and so a device
> implementation can choose either (previously discussed at [1]). But it's =
a
> stretch, we should clarify this.
>=20
> Also, the OS might want to know whether DMA was bypassing the IOMMU
> before
> the device is initialized. If there are strong security requirements, the=
n
> boot-bypass means the system was vulnerable to DMA attacks during boot.
>=20
> So I'd like to add a new feature bit for this, VIRTIO_IOMMU_F_BOOT_BYPASS=
,
> that tells whether DMA bypasses the IOMMU before feature negotiation. It'=
s
> only an indicator, accepting the feature doesn't change anything. I'll
> send the spec change shortly.
>=20
> Thanks,
> Jean
>=20
> [1] https://lore.kernel.org/qemu-
> devel/20200109104032.GA937123@myrica/
>=20

I wonder why we didn't define the default behavior to bypass (to align with
other vIOMMUs) in the first place and then have an option (e.g.=20
VIRTIO_IOMMU_F_NOBYPASS) to override in case a stricter policy is required.=
=20
In concept when a IOMMU device is uninitialized or reset, it essentially me=
ans=20
no protection in place thus a bypass behavior.=20

Thanks
Kevin

