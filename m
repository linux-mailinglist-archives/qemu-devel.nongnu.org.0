Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB3B3CBECB
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 23:58:35 +0200 (CEST)
Received: from localhost ([::1]:47376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Vqs-00078b-LY
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 17:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1m4Vo3-0004X3-IE
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 17:55:39 -0400
Received: from mga04.intel.com ([192.55.52.120]:18286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1m4Vo1-0000Tw-BL
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 17:55:39 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="208978653"
X-IronPort-AV: E=Sophos;i="5.84,246,1620716400"; d="scan'208";a="208978653"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 14:55:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,246,1620716400"; d="scan'208";a="563257996"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 16 Jul 2021 14:55:31 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 16 Jul 2021 14:55:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 16 Jul 2021 14:55:30 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.010;
 Fri, 16 Jul 2021 14:55:30 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: "Kim, Dongwon" <dongwon.kim@intel.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 3/3] ui/gtk: gd_draw_event returns FALSE when no cairo
 surface is bound
Thread-Topic: [PATCH 3/3] ui/gtk: gd_draw_event returns FALSE when no cairo
 surface is bound
Thread-Index: AQHXb6K0XNEQkcVAhEqpMJSIxAXmqKtGOztA
Date: Fri, 16 Jul 2021 21:55:30 +0000
Message-ID: <0d19e5d7c90e4865bb23d10020db6ac2@intel.com>
References: <20210703002809.26753-1-dongwon.kim@intel.com>
 <20210703002809.26753-3-dongwon.kim@intel.com>
In-Reply-To: <20210703002809.26753-3-dongwon.kim@intel.com>
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

Reviewed-by: Vivek Kasireddy <vivek.kasireddy@intel.com>


> -----Original Message-----
> From: Qemu-devel <qemu-devel-bounces+vivek.kasireddy=3Dintel.com@nongnu.o=
rg> On
> Behalf Of Dongwon Kim
> Sent: Friday, July 02, 2021 5:28 PM
> To: qemu-devel@nongnu.org
> Cc: Kim, Dongwon <dongwon.kim@intel.com>
> Subject: [PATCH 3/3] ui/gtk: gd_draw_event returns FALSE when no cairo su=
rface is
> bound
>=20
> gd_draw_event shouldn't try to repaint if surface does not exist
> for the VC.
>=20
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---
>  ui/gtk.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/ui/gtk.c b/ui/gtk.c
> index bfb95f3b4b..0a38deedc7 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -756,6 +756,9 @@ static gboolean gd_draw_event(GtkWidget *widget, cair=
o_t *cr,
> void *opaque)
>      if (!vc->gfx.ds) {
>          return FALSE;
>      }
> +    if (!vc->gfx.surface) {
> +        return FALSE;
> +    }
>=20
>      vc->gfx.dcl.update_interval =3D
>          gd_monitor_update_interval(vc->window ? vc->window : s->window);
> --
> 2.17.1
>=20


