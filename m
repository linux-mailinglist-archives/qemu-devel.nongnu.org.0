Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0933CBF04
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 00:09:55 +0200 (CEST)
Received: from localhost ([::1]:56092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4W1r-0005VH-0J
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 18:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1m4W0f-0004WQ-V5
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 18:08:41 -0400
Received: from mga09.intel.com ([134.134.136.24]:27573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1m4W0d-0000nP-8Z
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 18:08:41 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="210787238"
X-IronPort-AV: E=Sophos;i="5.84,246,1620716400"; d="scan'208";a="210787238"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 15:08:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,246,1620716400"; d="scan'208";a="460889412"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga008.jf.intel.com with ESMTP; 16 Jul 2021 15:08:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 16 Jul 2021 15:08:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 16 Jul 2021 15:08:34 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.010;
 Fri, 16 Jul 2021 15:08:34 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: "Kim, Dongwon" <dongwon.kim@intel.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 1/3] ui/gtk-egl: un-tab and re-tab should destroy egl
 surface and context
Thread-Topic: [PATCH 1/3] ui/gtk-egl: un-tab and re-tab should destroy egl
 surface and context
Thread-Index: AQHXb6KybM1tJ9RIOUaOAY/EAPLq2KtGPu3A
Date: Fri, 16 Jul 2021 22:08:34 +0000
Message-ID: <eef764448c1b45be95fdb3ea214ce048@intel.com>
References: <20210703002809.26753-1-dongwon.kim@intel.com>
In-Reply-To: <20210703002809.26753-1-dongwon.kim@intel.com>
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
Cc: "Romli, Khairul Anuar" <khairul.anuar.romli@intel.com>, "Kim,
 Dongwon" <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Vivek Kasireddy <vivek.kasireddy@intel.com>


> -----Original Message-----
> From: Qemu-devel <qemu-devel-bounces+vivek.kasireddy=3Dintel.com@nongnu.o=
rg> On
> Behalf Of Dongwon Kim
> Sent: Friday, July 02, 2021 5:28 PM
> To: qemu-devel@nongnu.org
> Cc: Romli, Khairul Anuar <khairul.anuar.romli@intel.com>; Kim, Dongwon
> <dongwon.kim@intel.com>
> Subject: [PATCH 1/3] ui/gtk-egl: un-tab and re-tab should destroy egl sur=
face and context
>=20
> An old esurface should be destroyed and set to be NULL when doing
> un-tab and re-tab so that a new esurface an context can be created
> for the window widget that those will be bound to.
>=20
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@intel.com>
> ---
>  ui/gtk.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 98046f577b..bfb95f3b4b 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -1232,6 +1232,14 @@ static gboolean gd_tab_window_close(GtkWidget *wid=
get,
> GdkEvent *event,
>                                      vc->tab_item, vc->label);
>      gtk_widget_destroy(vc->window);
>      vc->window =3D NULL;
> +    if (vc->gfx.esurface) {
> +        eglDestroySurface(qemu_egl_display, vc->gfx.esurface);
> +        vc->gfx.esurface =3D NULL;
> +    }
> +    if (vc->gfx.ectx) {
> +        eglDestroyContext(qemu_egl_display, vc->gfx.ectx);
> +        vc->gfx.ectx =3D NULL;
> +    }
>      return TRUE;
>  }
>=20
> @@ -1261,6 +1269,14 @@ static void gd_menu_untabify(GtkMenuItem *item, vo=
id
> *opaque)
>      if (!vc->window) {
>          gtk_widget_set_sensitive(vc->menu_item, false);
>          vc->window =3D gtk_window_new(GTK_WINDOW_TOPLEVEL);
> +        if (vc->gfx.esurface) {
> +            eglDestroySurface(qemu_egl_display, vc->gfx.esurface);
> +            vc->gfx.esurface =3D NULL;
> +        }
> +        if (vc->gfx.esurface) {
> +            eglDestroyContext(qemu_egl_display, vc->gfx.ectx);
> +            vc->gfx.ectx =3D NULL;
> +        }
>          gd_widget_reparent(s->notebook, vc->window, vc->tab_item);
>=20
>          g_signal_connect(vc->window, "delete-event",
> --
> 2.17.1
>=20


