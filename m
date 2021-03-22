Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDC9344EBC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 19:43:55 +0100 (CET)
Received: from localhost ([::1]:55172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOPWr-0002Rc-PJ
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 14:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lOPUx-00016n-QI
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 14:41:56 -0400
Received: from mga17.intel.com ([192.55.52.151]:37755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lOPUv-0005cE-3A
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 14:41:54 -0400
IronPort-SDR: 8fCvMzO4rJJ9zdaNcLI7niV8SRpSR/Et5szZvv5zBoTqF6f6nNybCZu8shWGYbar42WuWdRYZM
 f+KKyefCbi2Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="170288802"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="170288802"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 11:41:48 -0700
IronPort-SDR: 4jpvvmy+H7wf4ODtGB8Kl6QdO/ao8p2DR9WeWDh2npxwCaYr249t1dcURMSx9qwZwvb6BXYDby
 JO3X5RO59Y+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="442234679"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Mar 2021 11:41:48 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Mar 2021 11:41:47 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Mar 2021 11:41:47 -0700
Received: from orsmsx612.amr.corp.intel.com ([10.22.229.25]) by
 ORSMSX612.amr.corp.intel.com ([10.22.229.25]) with mapi id 15.01.2106.013;
 Mon, 22 Mar 2021 11:41:47 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>, =?iso-8859-1?Q?Marc-Andr=E9_Lureau?=
 <marcandre.lureau@gmail.com>
Subject: RE: [PATCH 00/15] virtio-gpu: split into two devices.
Thread-Topic: [PATCH 00/15] virtio-gpu: split into two devices.
Thread-Index: AQHXHLIVjE2wPIolwUGxyLdnspQjEaqLp5IAgAR7QwCAADjNIA==
Date: Mon, 22 Mar 2021 18:41:47 +0000
Message-ID: <7bce08a87c9c4deeb511f555ed835c49@intel.com>
References: <20210319112147.4138943-1-kraxel@redhat.com>
 <CAJ+F1C+FPAwLxCtZG+Fhnizqy7KU2ttdr0w72WWoS+mprthgwA@mail.gmail.com>
 <20210322081454.vpkvybavjoaqfa6q@sirius.home.kraxel.org>
In-Reply-To: <20210322081454.vpkvybavjoaqfa6q@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=vivek.kasireddy@intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Zhang, Tina" <tina.zhang@intel.com>, QEMU <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd,

> On Fri, Mar 19, 2021 at 03:48:42PM +0400, Marc-Andr=E9 Lureau wrote:
> > Hi Gerd
> >
> > On Fri, Mar 19, 2021 at 3:22 PM Gerd Hoffmann <kraxel@redhat.com> wrote=
:
> >
> > > Currently we have one virtio-gpu device.  Problem with this approach =
is
> > > that if you compile a full-featured qemu you'll get a virtio-gpu devi=
ce
> > > which depends on opengl and virgl, so these dependencies must be
> > > installed and the libraries will be loaded into memory even if you do=
n't
> > > use virgl.  Also the code is cluttered with #ifdefs and a bit messy.
> > >
> > > This patch series splits the virtio-gpu device into two:
> > >
> > >  (1) virtio-gpu-device becomes the non-virgl device, same as
> > >      virtio-gpu-device,virgl=3Doff today.
> > >  (2) virtio-gpu-gl-device is the new virgl device, same as
> > >      virtio-gpu-device,virgl=3Don today.
> > >
> > > When compiling qemu without virglrenderer support virtio-gpu-device
> > > behavior doesn't change.
[Kasireddy, Vivek] Just a random thought: if a user enables both these devi=
ces=20
either intentionally or accidentally, can they play nice with each other?
If this case is not allowed, where and how is that being enforced?

Thanks,
Vivek

> > >
> >
> > Nice!
> > We are post 6.0 soft freeze. I suppose you target those changes for 6.1=
?
>=20
> Yes, it's clearly 6.1 material at this point.
>=20
> take care,
>   Gerd


