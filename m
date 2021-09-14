Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC0340BAF0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 00:07:21 +0200 (CEST)
Received: from localhost ([::1]:58000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQGaG-00018P-Ml
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 18:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1mQGYG-0007kc-80
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 18:05:17 -0400
Received: from mga02.intel.com ([134.134.136.20]:6996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1mQGYC-0004my-FJ
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 18:05:14 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="209374544"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="209374544"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 15:05:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="529133443"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 14 Sep 2021 15:05:06 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 14 Sep 2021 15:05:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 14 Sep 2021 15:05:05 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.012;
 Tue, 14 Sep 2021 15:05:05 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PULL 0/6] Vga 20210910 patches
Thread-Topic: [PULL 0/6] Vga 20210910 patches
Thread-Index: AQHXpkZd8egHKkdS2k2nI77F39actqud8WaAgAWm5ICAAINLAA==
Date: Tue, 14 Sep 2021 22:05:05 +0000
Message-ID: <6f0d1a826cb84e058dd61ae41464f33d@intel.com>
References: <20210910131709.3681492-1-kraxel@redhat.com>
 <CAFEAcA_1SdGuiEgquVE2T5p-x6YkJXwAou==wdVoZvRqcZzJDg@mail.gmail.com>
 <20210914071133.wvgbf5ezcpbd4kr3@sirius.home.kraxel.org>
In-Reply-To: <20210914071133.wvgbf5ezcpbd4kr3@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=vivek.kasireddy@intel.com; helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd, Peter,

>=20
> On Fri, Sep 10, 2021 at 05:52:55PM +0100, Peter Maydell wrote:
> > On Fri, 10 Sept 2021 at 14:19, Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > > The following changes since commit bd662023e683850c085e98c8ff8297142c=
2dd9f2:
> > >
> > >   Merge remote-tracking branch
> > > 'remotes/mcayland/tags/qemu-openbios-20210908' into staging
> > > (2021-09-08 11:06:17 +0100)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.kraxel.org/qemu tags/vga-20210910-pull-request
> > >
> > > for you to fetch changes up to 6335c0b56819a5d1219ea84a11a732d0861542=
db:
> > >
> > >   qxl: fix pre-save logic (2021-09-10 12:23:12 +0200)
> > >
> > > ----------------------------------------------------------------
> > > virtio-gpu + ui: fence syncronization.
> > > qxl: unbreak live migration.
> > >
> > > ----------------------------------------------------------------
> >
> > Hi; this fails to build on the ppc64 system:
> >
> > ../../ui/egl-helpers.c:79:6: error: no previous prototype for
> > 'egl_dmabuf_create_sync' [-Werror=3Dmissing-prototypes]
> >    79 | void egl_dmabuf_create_sync(QemuDmaBuf *dmabuf)
> >       |      ^~~~~~~~~~~~~~~~~~~~~~
> > ../../ui/egl-helpers.c:95:6: error: no previous prototype for
> > 'egl_dmabuf_create_fence' [-Werror=3Dmissing-prototypes]
> >    95 | void egl_dmabuf_create_fence(QemuDmaBuf *dmabuf)
> >       |      ^~~~~~~~~~~~~~~~~~~~~~~
> >
> >
> > The prototype is hidden behind CONFIG_GBM, but the definition is not.
> >
> > Then the callsites fail:
> >
> > ../../ui/gtk-gl-area.c: In function 'gd_gl_area_draw':
> > ../../ui/gtk-gl-area.c:77:9: error: implicit declaration of function
> > 'egl_dmabuf_create_sync' [-Werror=3Dimplicit-function-declaration]
> >    77 |         egl_dmabuf_create_sync(dmabuf);
> >       |         ^~~~~~~~~~~~~~~~~~~~~~
> > ../../ui/gtk-gl-area.c:77:9: error: nested extern declaration of
> > 'egl_dmabuf_create_sync' [-Werror=3Dnested-externs]
> > ../../ui/gtk-gl-area.c:81:9: error: implicit declaration of function
> > 'egl_dmabuf_create_fence' [-Werror=3Dimplicit-function-declaration]
> >    81 |         egl_dmabuf_create_fence(dmabuf);
> >       |         ^~~~~~~~~~~~~~~~~~~~~~~
> > ../../ui/gtk-gl-area.c:81:9: error: nested extern declaration of
> > 'egl_dmabuf_create_fence' [-Werror=3Dnested-externs]
> >
> >
> > ../../ui/gtk-egl.c: In function 'gd_egl_draw':
> > ../../ui/gtk-egl.c:100:9: error: implicit declaration of function
> > 'egl_dmabuf_create_fence' [-Werror=3Dimplicit-function-declaration]
> >   100 |         egl_dmabuf_create_fence(dmabuf);
> >       |         ^~~~~~~~~~~~~~~~~~~~~~~
> > ../../ui/gtk-egl.c:100:9: error: nested extern declaration of
> > 'egl_dmabuf_create_fence' [-Werror=3Dnested-externs]
> > ../../ui/gtk-egl.c: In function 'gd_egl_scanout_flush':
> > ../../ui/gtk-egl.c:301:9: error: implicit declaration of function
> > 'egl_dmabuf_create_sync' [-Werror=3Dimplicit-function-declaration]
> >   301 |         egl_dmabuf_create_sync(vc->gfx.guest_fb.dmabuf);
> >       |         ^~~~~~~~~~~~~~~~~~~~~~
> > ../../ui/gtk-egl.c:301:9: error: nested extern declaration of
> > 'egl_dmabuf_create_sync' [-Werror=3Dnested-externs]
> >
> >
> > You can probably repro this on any system which has the opengl
> > libraries installed but not libgbm.
>=20
> Vivek?  Can you have a look please?
[Kasireddy, Vivek] I sent a v6 that fixes these compilation errors:
https://lists.nongnu.org/archive/html/qemu-devel/2021-09/msg03859.html

Compile tested the patches with and without GBM.

Thanks,
Vivek


