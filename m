Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C963CBF39
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 00:24:00 +0200 (CEST)
Received: from localhost ([::1]:40110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4WFU-0006JY-08
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 18:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1m4WEg-0005fK-BY
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 18:23:10 -0400
Received: from mga09.intel.com ([134.134.136.24]:28468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1m4WEe-00027A-Kd
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 18:23:10 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="210788502"
X-IronPort-AV: E=Sophos;i="5.84,246,1620716400"; d="scan'208";a="210788502"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 15:23:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,246,1620716400"; d="scan'208";a="631191875"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga005.jf.intel.com with ESMTP; 16 Jul 2021 15:23:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 16 Jul 2021 15:23:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 16 Jul 2021 15:23:05 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.010;
 Fri, 16 Jul 2021 15:23:05 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: "Kim, Dongwon" <dongwon.kim@intel.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 4/4] ui/gtk-egl: guest fb texture needs to be regenerated
 when reinitializing egl
Thread-Topic: [PATCH 4/4] ui/gtk-egl: guest fb texture needs to be regenerated
 when reinitializing egl
Thread-Index: AQHXcr/haWfolLq6mEmb4eOEL0fXQatGPIvw
Date: Fri, 16 Jul 2021 22:23:05 +0000
Message-ID: <231333a31a6f4de9a66328890b61bf8c@intel.com>
References: <20210703002809.26753-3-dongwon.kim@intel.com>
 <20210706233445.7094-1-dongwon.kim@intel.com>
In-Reply-To: <20210706233445.7094-1-dongwon.kim@intel.com>
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
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=vivek.kasireddy@intel.com; helo=mga09.intel.com
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>=20
> If guest fb is backed by dmabuf (blob-resource), the texture bound to the=
 old context needs
> to be recreated in case the egl is re-initialized (e.g.
> new window for vc is created in case of detaching/reattaching of the tab)
>=20
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---
>  ui/gtk-egl.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c index 32516b806c..5dd7c7e1f5 100=
644
> --- a/ui/gtk-egl.c
> +++ b/ui/gtk-egl.c
> @@ -129,6 +129,10 @@ void gd_egl_refresh(DisplayChangeListener *dcl)
>              surface_gl_destroy_texture(vc->gfx.gls, vc->gfx.ds);
>              surface_gl_create_texture(vc->gfx.gls, vc->gfx.ds);
>          }
> +        if (vc->gfx.guest_fb.dmabuf) {
> +            vc->gfx.guest_fb.dmabuf->texture =3D 0;
[Kasireddy, Vivek] Shouldn't you call egl_dmabuf_release_texture() instead?


Thanks,
Vivek
> +            gd_egl_scanout_dmabuf(dcl, vc->gfx.guest_fb.dmabuf);
> +        }
>      }
>=20
>      graphic_hw_update(dcl->con);
> --
> 2.17.1
>=20


