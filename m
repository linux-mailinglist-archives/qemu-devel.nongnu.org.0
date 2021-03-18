Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EC533FF84
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 07:27:05 +0100 (CET)
Received: from localhost ([::1]:45228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMm7c-0000J1-TY
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 02:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tina.zhang@intel.com>)
 id 1lMm5g-00087N-Fs
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 02:25:04 -0400
Received: from mga09.intel.com ([134.134.136.24]:61425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tina.zhang@intel.com>)
 id 1lMm5c-0003rm-Ht
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 02:25:04 -0400
IronPort-SDR: hcLgRzp4H8dbTcxpfudda33avS6NmHGQ9ZlFMhM82KWeHgtr4x/H5EObgmYX1bmbCOUim/aLQ6
 FjDOAs1HVPRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="189703208"
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="189703208"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 23:24:55 -0700
IronPort-SDR: WTIn/zr/7K3baZo+w1+uGIqhj6dImj5+V7YUAe87UnS+tEyYjY3qaLx4+bDCmuGeJ1SO0LEqt8
 of5/pMwbAZqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="606020813"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 17 Mar 2021 23:24:54 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 17 Mar 2021 23:24:54 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 17 Mar 2021 23:24:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Wed, 17 Mar 2021 23:24:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Wed, 17 Mar 2021 23:24:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4VrvPysCU+1jDy18rVdcKeVEVYpaxvyd+SL9RSffYNEF8LoB+eSGEd2BLXPdLVS2Dl10ayO5HqC0y43GsMKRRRmuoU+i4LSBmOznoZIdQn/vjIOLQbcm5MpSnh/D1BtbDGzXubIcAJ4tgFPSbwhHz9aBXz+2ukfX91GPrQgMLlw4sBhEvaUXQMjj3DvX0ufFdEuXOefxWiMA6qO9t2TQNLsoxXkDQl4zUn8iqONEztVH5MFzv2UIrMEp/sN6TZsQToh5+eN8qBOjtiRsKmBvn3U8VBnXycjdZ/aoDD5N2hnphROkLilW24x8FUORoYB4gUbMvWjGG+nRsXU4KIamA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRmlV6A9DWLMgERORj5zsh9DYaoFSrLHvad9yYRtAmo=;
 b=Z9ke2vG4+2IN4DePxA3fKPGP4CFr/NHpz09S/vZUzRsJE1BIddhefBleT0g2oAqHDzHizIGD0wg7sG5dQUTCurs10ZZ59kBWH04E0udQsQ/KrAMcKqRt+BEsMOrEtQUz4IxLyiFz+QU8mLS/jkqpOI866p2jtjUD4gro7nQs053ey1jn5KikzvS+OIPplqbdhWvENUnxl0UpQhZNHxpq49kSr4e0EK4LyWeyUZl8BI/s7Rn4VrcTDf9W2WHbEpnEXXzjMO+OAr74sLu/qMxTwDJgPs+o9bbO4uxhbA/+voFhPQbbQKxCVd0Pagn58eZKiIQNbmRV7Z9XVDzptOxlDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRmlV6A9DWLMgERORj5zsh9DYaoFSrLHvad9yYRtAmo=;
 b=wOo5NoSsn2G2thYmykFQ+IV+2riP9BWDlsb1MZDgGFaojq9j/674TCfCofcjwt0//FkXFGPZpRvO0cHQqjbzIhA/jYO97WxJmTYd/ATE7Ph2Oz/+gxO/faqXrkzw+IZImk5lYgz/pNEHUO5/fu0iuIZiFkxiHnCKIWsv0jXQnd0=
Received: from BN7PR11MB2786.namprd11.prod.outlook.com (2603:10b6:406:b3::27)
 by BN8PR11MB3827.namprd11.prod.outlook.com (2603:10b6:408:90::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Thu, 18 Mar
 2021 06:24:48 +0000
Received: from BN7PR11MB2786.namprd11.prod.outlook.com
 ([fe80::167:12a:8fe3:6c10]) by BN7PR11MB2786.namprd11.prod.outlook.com
 ([fe80::167:12a:8fe3:6c10%2]) with mapi id 15.20.3933.033; Thu, 18 Mar 2021
 06:24:48 +0000
From: "Zhang, Tina" <tina.zhang@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "Kasireddy, Vivek"
 <vivek.kasireddy@intel.com>
Subject: RE: [RFC 0/1] Use dmabufs for display updates instead of pixman
Thread-Topic: [RFC 0/1] Use dmabufs for display updates instead of pixman
Thread-Index: AQHXDzyEBegPNSw52UuP35SL1ySY+apwmb0AgBi+ZiA=
Date: Thu, 18 Mar 2021 06:24:48 +0000
Message-ID: <BN7PR11MB278631D2E7F4C7F3DCCB0C6D89699@BN7PR11MB2786.namprd11.prod.outlook.com>
References: <20210302080358.3095748-1-vivek.kasireddy@intel.com>
 <20210302120350.5zqcrdajdpszezpr@sirius.home.kraxel.org>
In-Reply-To: <20210302120350.5zqcrdajdpszezpr@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.193]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 398ca6cf-673a-49a2-b418-08d8e9d68827
x-ms-traffictypediagnostic: BN8PR11MB3827:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR11MB382776871AA0C30BDF0C39A289699@BN8PR11MB3827.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4887dXEqgdnpqJDpjgg8DvYm9OIlbZDmVeFv7BwE8zugx45RnFrg5ogy0N03sCOiIghCCnVjUJdCiW0Efj7pZf6inqLhzobii1Ccd+/HaB3R0seQImy//YHe+ZiNRiuFI37pYVK41xclEI4NTU/qcHsSIUF03KEDuAY4mLljgH1taUREgjPnRxRELzkKTfmg9xH8psoEWbqNy3/C5hohtFXtv9DpxZ7QVO4KZFtmMjmJFiIco6amXkVyBPNO5b99VK+pyJO5Q1Hdt0PHXgKUZgVR0QEaSxcviOFdwU5/VJFfhaPcflf8JsWMpdQyVUrj3YWRl/Q6TyAJC3TVgEdXtBB8iCTvaJJqVLvm0N7EDucsqpTDanANUHa5lCuJu9GTcYRXdVqRLaKnDRAurOa8yRLFTMeApWlS4IqthRhWzrGVSmYj1uzzVfFdkzDG9CNqRbFU8zrFA5b9gdYvrgdwFvCyxU8q4q+uZAiee9bZf3Qj7RcD76PlsqLAl7tVoWlBsVaahA28ZIDeMki0M/j+MaJ0yOW+M3M9aKDBeZjPH2RV8GWYaHkn6RvOEVA85j6NMCPAf6rOW4Z6SX9X/ZDE9qs3jwsBbTNxrQsyrppi24FXiqWPJr0szh0ltQFt1kGuUd/wxQuoFdqnZUtn++j47fc8LIZ/AhzOeAFDPq+d0pucCHeBA7alNcPChEbVSZnq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR11MB2786.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(366004)(376002)(346002)(396003)(54906003)(966005)(7696005)(76116006)(316002)(53546011)(6636002)(83380400001)(186003)(66476007)(66946007)(110136005)(66556008)(66446008)(5660300002)(64756008)(2906002)(86362001)(6506007)(52536014)(478600001)(4326008)(55016002)(15650500001)(8676002)(26005)(9686003)(71200400001)(38100700001)(33656002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?kDlcjSvTzhN0K5UmChEWzIIqQhwPvKL3RPr4L84MXhIz1hR+CfbAgUN0W3?=
 =?iso-8859-1?Q?9p4QSxNq7QhP8YQ39r/TUHB+ClE+p88d5vfLdwl2LX434Nt2IEc+/a7D5V?=
 =?iso-8859-1?Q?8e7ro1JNY3lASyfwnGEbPXkOXU0Fa5q/jbswdolVmlSc/zqOu3O7wyCPzQ?=
 =?iso-8859-1?Q?MuQJ2T9DaqsrG3Iv9ZYu2HxsXZnc3rPkHOc1rBUVvh023Vl4BZz9AqP6Fj?=
 =?iso-8859-1?Q?nNik6t0n6A377CEqTXzgFt+IDE3kvw6g5imZnUrHVPiXIJyuthGneYOCvl?=
 =?iso-8859-1?Q?bJccLigXhUgsWLedJDhSFWuOmK6iWsD3u8tKhGrNmzvdjdvzf5N5UXXn5L?=
 =?iso-8859-1?Q?9qzEhYXv8U8MbBrOd+1jQv+5NzvoJhjNutf9PN7Pyn/EfQ/Q5zWVQk1/iY?=
 =?iso-8859-1?Q?5H6LYqXsRHCOoXIygGYUXcwMmRUBaAdhr0rx7WriEVLmbwJ+NVffp3/0Bx?=
 =?iso-8859-1?Q?Zm/tEqYpbNW1/eHg17r8cmmUQk/DM4qgoqG4NfPtWhF/UypledtOwULHI2?=
 =?iso-8859-1?Q?LWXP5F2toWdvYERE1v9YjhE/oM8dGpongY5WyyA/0pcCaFtX7uVCDWYMti?=
 =?iso-8859-1?Q?9gug3hLKIiAc4fLKJu76gIeFdVAvREzlNwm858rHKUxhTeJfjeZmWLrmla?=
 =?iso-8859-1?Q?Huq0fDxq8ctaNr408isgZuRz0U3lnaBH+UDAOQEQ2WBUiQQg7lgbRw8/me?=
 =?iso-8859-1?Q?d3Wi3VbUBwWoolMwYn4IuOeTlpZ7+Wu84DCFZ0wvvtaF4U7sJ1xN7h6WL7?=
 =?iso-8859-1?Q?hbiNrPTxwhgW9FIoqg14AOgrdFpfWRE1fuGDxjSGvCC3ZSaUsablWod42O?=
 =?iso-8859-1?Q?AN3J5FHtxLg45O+Zx95yWOIDnGLBsdpD1qQjScqVTjVPxsMJMkvR4gnJVi?=
 =?iso-8859-1?Q?nUd7ogtU0xhbQ7eS9WU58OvlItfY7WR8dMG1/9Sns7qjnr91ZA1PCkBy6H?=
 =?iso-8859-1?Q?2Bul0+cgbi4YTOyqWSLzQw8kA7RC9m29fdXj/ZCfX65VztHeyzNdK9TzU3?=
 =?iso-8859-1?Q?5DAHyWQh517c+RCPmONAZoDOtHfjQrPG8WJKYbzc5+SYAF36YGFghZJTM1?=
 =?iso-8859-1?Q?cbs4ArntosmRQ/3kicB4qDDw7z5HLTM7a+q8Hn7G6bLPAFrvsejaa7wxUb?=
 =?iso-8859-1?Q?QwdvEzt6xR7XVWqwfX8KPRAl7DxEx7Sc4WfQ7Ie19CuGXJo3JohQqF8B2q?=
 =?iso-8859-1?Q?crzH8M1TPEkJvoAvfoz6xrmQdHUsNxov20McnLi+8PSr83rrYrPnM4ATnl?=
 =?iso-8859-1?Q?KrBApJ3dVhvgV2T5ZnSx4RZeeT2qjgiXAHOP/VNMl2prFOQoGiE4kfl4O/?=
 =?iso-8859-1?Q?Nc223QIMlk2lZkfgz9c7bUzfYiRl8ItzshpuQdsWoastWmN8YCrCd8b4RQ?=
 =?iso-8859-1?Q?0a2fpYYA6h?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2786.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 398ca6cf-673a-49a2-b418-08d8e9d68827
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2021 06:24:48.8032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OFI5BFohOATOA1LFSZLfVH0mHQAkC1lAyV39Gp2xDjERoBjpmIADfrx/+3kC7CHSdjJyga9CXIBVLXKMDDu3aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3827
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24; envelope-from=tina.zhang@intel.com;
 helo=mga09.intel.com
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, "Kim,
 Dongwon" <dongwon.kim@intel.com>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Qemu-devel <qemu-devel-bounces+tina.zhang=3Dintel.com@nongnu.org>
> On Behalf Of Gerd Hoffmann
> Sent: Tuesday, March 2, 2021 8:04 PM
> To: Kasireddy, Vivek <vivek.kasireddy@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>; Kim, Dongwon
> <dongwon.kim@intel.com>; qemu-devel@nongnu.org; Marc-Andr=E9 Lureau
> <marcandre.lureau@redhat.com>
> Subject: Re: [RFC 0/1] Use dmabufs for display updates instead of pixman
>=20
> On Tue, Mar 02, 2021 at 12:03:57AM -0800, Vivek Kasireddy wrote:
> > This is still a WIP/RFC patch that attempts to use dmabufs for display
> > updates with the help of Udmabuf driver instead of pixman. This patch
> > is posted to the ML to elicit feedback and start a discussion whether
> > something like this would be useful or not for mainly non-Virgl
> > rendered BOs and also potentially in other cases.
>=20
> Yes, it surely makes sense to go into that direction.
> The patch as-is doesn't, it breaks the guest/host interface.
> That's ok-ish for a quick proof-of-concept, but clearly not merge-able.

Hi,
According to https://lore.kernel.org/dri-devel/20210212110140.gdpu7kapnr7ov=
dcn@sirius.home.kraxel.org/ proposal, we made some progress on making a 'vi=
rtio-gpu (display) + pass-through GPU' prototype. We leverage the kmsro fra=
mework provided by mesa to let the virtio-gpu display work with a passed-th=
rough GPU in headless mode. And the MR is here: https://gitlab.freedesktop.=
org/mesa/mesa/-/merge_requests/9592

Although our work is different from this on-going discussion which is about=
 enabling a general way to share buffers between guest and host, we'd like =
to leverage this patch. So, is there any plan to refine this patch? E.g. mo=
ve the uuid blob support into another patch, as the implementation of the p=
roposal doesn't require guest user space to share buffers with host side, a=
nd also maybe add the dma-buf support for cursor plane. Thanks.

BR,
Tina

>=20
> > TODO:
> > - Use Blob resources for getting meta-data such as modifier, format, et=
c.
>=20
> That is pretty much mandatory.  Without blob resources there is no concep=
t of
> resources shared between host and guest in virtio-gpu, all data is explic=
itly
> copied with transfer commands.
>=20
> Which implies quite a bit of work because we don't have blob resource sup=
port
> in qemu yet.
>=20
> > - Test with Virgil rendered BOs to see if this can be used in that case=
..
>=20
> That also opens up the question how to go forward with virtio-gpu in gene=
ral.
> The object hierarchy we have right now (skipping pci + vga variants for
> simplicity):
>=20
>   TYPE_VIRTIO_GPU_BASE (abstract base)
>    -> TYPE_VIRTIO_GPU (in-qemu implementation)
>    -> TYPE_VHOST_USER_GPU (vhost-user implementation)
>=20
> When compiled with opengl + virgl TYPE_VIRTIO_GPU has a virgl=3Don/off
> property.  Having a single device is not ideal for modular builds.
> because the hw-display-virtio-gpu.so module has a dependency on ui-opengl=
.so
> so that is needed (due to symbol references) even for the virgl=3Doff cas=
e.  Also
> the code is a bit of a #ifdef mess.
>=20
> I think we should split TYPE_VIRTIO_GPU into two devices.  Remove
> virgl+opengl support from TYPE_VIRTIO_GPU.  Add a new
> TYPE_VIRTIO_GPU_VIRGL, with either TYPE_VIRTIO_GPU or
> TYPE_VIRTIO_GPU_BASE as parent (not sure which is easier), have all
> opengl/virgl support code there.
>=20
> I think when using opengl it makes sense to also require virgl, so we can=
 use the
> virglrenderer library to manage blob resources (even when the actual rend=
ering
> isn't done with virgl).  Also reduces the complexity and test matrix.
>=20
> Maybe it even makes sense to deprecate in-qemu virgl support and focus
> exclusively on the vhost-user implementation, so we don't have to duplica=
te all
> work for both implementations.
>=20
> > Considerations/Challenges:
> > - One of the main concerns with using dmabufs is how to synchronize
> > access to them and this use-case is no different. If the Guest is
> > running Weston, then it could use a maximum of 4 color buffers but
> > uses only 2 by default and flips between them if it is not sharing the
> > FBs with other plugins while running with the drm backend. In this
> > case, how do we make sure that Weston and Qemu UI are not using the sam=
e
> buffer at any given time?
>=20
> There is graphic_hw_gl_block + graphic_hw_gl_flushed for syncronization.
> Right now this is only wired up in spice, and it is rather simple (just s=
talls virgl
> rendering instead of providing per-buffer syncronization).
>=20
> > - If we have Xorg running in the Guest, then it gets even more
> > interesting as Xorg in some cases does frontbuffer rendering (uses
> DRM_IOCTL_MODE_DIRTYFB).
>=20
> Well, if the guest does frontbuffer rendering we can't do much about it a=
nd have
> to live with rendering glitches I guess.
>=20
> take care,
>   Gerd
>=20


