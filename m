Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D20C3D1725
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 21:35:56 +0200 (CEST)
Received: from localhost ([::1]:40978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6I0Y-00021b-Fn
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 15:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1m6Hy4-0007tP-Qb
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 15:33:21 -0400
Received: from mga06.intel.com ([134.134.136.31]:41334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1m6Hxz-00048f-OE
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 15:33:19 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="272617874"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="272617874"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 12:32:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="576793137"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga001.fm.intel.com with ESMTP; 21 Jul 2021 12:32:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 21 Jul 2021 12:32:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 21 Jul 2021 12:32:55 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.010;
 Wed, 21 Jul 2021 12:32:55 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Tomeu Vizoso
 <tomeu.vizoso@collabora.com>
Subject: RE: vulkan support in qemu with virgil
Thread-Topic: vulkan support in qemu with virgil
Thread-Index: AQHXfjGvnBnkMfMs9E66ZMndkYYN/KtN/IAA///Me0A=
Date: Wed, 21 Jul 2021 19:32:55 +0000
Message-ID: <f7c4e0cc7d3b44bb9b1c8c97bdd2fd5c@intel.com>
References: <22cb9b75-b29b-d824-1327-13092b5a8da9@collabora.com>
 <20210721150458.p3rt4mtg5igwxsjv@sirius.home.kraxel.org>
In-Reply-To: <20210721150458.p3rt4mtg5igwxsjv@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=vivek.kasireddy@intel.com; helo=mga06.intel.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Tomeu,
=20
> On Wed, Jul 21, 2021 at 03:09:21PM +0200, Tomeu Vizoso wrote:
> > Hi all,
> >
> > At Collabora we have started looking at Vulkan support in QEMU with Vir=
gil.
> >
> > We have seen the work that Vivek has submitted to support the new virti=
o-gpu
> > BLOB API (thanks!) and have identified a few holes that are still neede=
d for
> > Vulkan support.
> >
> > We would like to know if anybody else is working on Vulkan support or o=
n
> > common tasks such as host-side blobs, CONTEXT_INIT, CROSS_DEVICE,
> > HOST_VISIBLE, venus capsets,
[Kasireddy, Vivek] Nope; I am not aware of anyone working on these features=
 for Qemu. Our
focus is mainly on Passthrough (and Headless) GPUs for which Virgl is not n=
eeded. However,
I am assuming you are already collaborating with CrossVM folks on the imple=
mentation of
these features in Virtio-gpu Linux Guest driver?

>> a new DisplayChangeListenerOps implementation,
[Kasireddy, Vivek] Could you please elaborate on this? Which backend are yo=
u planning to
add? I am working on adding a plain and simple Wayland UI backend for Qemu =
to reduce the
GPU Blits:
https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg06482.html

The above version does not have keyboard and mouse support added but I do h=
ave a version
which does and it is more or less working. However, the only problem I have=
 run into with this
backend is:
https://gitlab.freedesktop.org/wayland/weston/-/issues/514

Not sure if you'd run into a similar issue with your use-case or interested=
 in the Wayland UI
backend but I am currently working on trying to come up with a plan to deco=
uple OUT_FENCE
signalling from atomic pageflip completion event as suggested by Weston ups=
tream (Pekka) to
fix the above issue.

Thanks,
Vivek

>=20
> I'm not aware of anyone working on this in qemu specifically.
> The crosvm guys are working on it, not sure what the status is.
>=20
> take care,
>   Gerd


