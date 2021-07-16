Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9013CBF30
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 00:20:07 +0200 (CEST)
Received: from localhost ([::1]:37900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4WBe-0004Ak-UI
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 18:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1m4WA9-00039e-DK
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 18:18:29 -0400
Received: from mga04.intel.com ([192.55.52.120]:19670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1m4WA6-0007Ut-7v
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 18:18:29 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="208981022"
X-IronPort-AV: E=Sophos;i="5.84,246,1620716400"; d="scan'208";a="208981022"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 15:18:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,246,1620716400"; d="scan'208";a="656544394"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga005.fm.intel.com with ESMTP; 16 Jul 2021 15:18:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 16 Jul 2021 15:18:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 16 Jul 2021 15:18:22 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.010;
 Fri, 16 Jul 2021 15:18:22 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: "Kim, Dongwon" <dongwon.kim@intel.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 2/3] ui/gtk-egl: make sure the right context is set as the
 current
Thread-Topic: [PATCH 2/3] ui/gtk-egl: make sure the right context is set as
 the current
Thread-Index: AQHXb6LdMxLeAlSONUqetQq8Oy+83KtGQXbA
Date: Fri, 16 Jul 2021 22:18:22 +0000
Message-ID: <3237bc891dea4342a247d8cff6108ef3@intel.com>
References: <20210703002809.26753-1-dongwon.kim@intel.com>
 <20210703002809.26753-2-dongwon.kim@intel.com>
In-Reply-To: <20210703002809.26753-2-dongwon.kim@intel.com>
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
Received-SPF: pass client-ip=192.55.52.120;
 envelope-from=vivek.kasireddy@intel.com; helo=mga04.intel.com
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Acknowledged-by: Vivek Kasireddy <vivek.kasireddy@intel.com>


> -----Original Message-----
> From: Qemu-devel <qemu-devel-bounces+vivek.kasireddy=3Dintel.com@nongnu.o=
rg> On
> Behalf Of Dongwon Kim
> Sent: Friday, July 02, 2021 5:28 PM
> To: qemu-devel@nongnu.org
> Cc: Kim, Dongwon <dongwon.kim@intel.com>
> Subject: [PATCH 2/3] ui/gtk-egl: make sure the right context is set as th=
e current
>=20
> Making the vc->gfx.ectx current before handling textures
> associated with it
>=20
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---
>  ui/gtk-egl.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
> index 2a2e6d3a17..32516b806c 100644
> --- a/ui/gtk-egl.c
> +++ b/ui/gtk-egl.c
> @@ -126,6 +126,7 @@ void gd_egl_refresh(DisplayChangeListener *dcl)
>          }
>          vc->gfx.gls =3D qemu_gl_init_shader();
>          if (vc->gfx.ds) {
> +            surface_gl_destroy_texture(vc->gfx.gls, vc->gfx.ds);
>              surface_gl_create_texture(vc->gfx.gls, vc->gfx.ds);
>          }
>      }
> @@ -152,6 +153,8 @@ void gd_egl_switch(DisplayChangeListener *dcl,
>          surface_height(vc->gfx.ds) =3D=3D surface_height(surface)) {
>          resized =3D false;
>      }
> +    eglMakeCurrent(qemu_egl_display, vc->gfx.esurface,
> +                   vc->gfx.esurface, vc->gfx.ectx);
>=20
>      surface_gl_destroy_texture(vc->gfx.gls, vc->gfx.ds);
>      vc->gfx.ds =3D surface;
> @@ -209,6 +212,11 @@ void gd_egl_scanout_dmabuf(DisplayChangeListener *dc=
l,
>                             QemuDmaBuf *dmabuf)
>  {
>  #ifdef CONFIG_GBM
> +    VirtualConsole *vc =3D container_of(dcl, VirtualConsole, gfx.dcl);
> +
> +    eglMakeCurrent(qemu_egl_display, vc->gfx.esurface,
> +                   vc->gfx.esurface, vc->gfx.ectx);
> +
>      egl_dmabuf_import_texture(dmabuf);
>      if (!dmabuf->texture) {
>          return;
> --
> 2.17.1
>=20


