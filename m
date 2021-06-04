Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4320139BF50
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 20:07:17 +0200 (CEST)
Received: from localhost ([::1]:48674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpEE0-0008PG-76
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 14:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lpED9-0007iX-5i
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:06:23 -0400
Received: from mga06.intel.com ([134.134.136.31]:43274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lpED6-0007g9-Jp
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:06:22 -0400
IronPort-SDR: /4cJkHD4IDxhADlfP4d4d2yWgeGO7s9zVsCONMibbmSz945mk4nmkUvNGOlRxzr7wlchbtZIw8
 HQR1weU8FQ2A==
X-IronPort-AV: E=McAfee;i="6200,9189,10005"; a="265503673"
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="265503673"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 11:06:12 -0700
IronPort-SDR: FViysA1+u/glgpfiI5inubkPaBrUpNSKtAOgX5GxHP4nBFA07txec9UidRLgxHGIQBzeRItHvV
 6d3oY2iGrizg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="448343400"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga008.fm.intel.com with ESMTP; 04 Jun 2021 11:06:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 4 Jun 2021 11:06:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 4 Jun 2021 11:06:09 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.008;
 Fri, 4 Jun 2021 11:06:09 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH] virtio-gpu: move scanout_id sanity check
Thread-Topic: [PATCH] virtio-gpu: move scanout_id sanity check
Thread-Index: AQHXWRZmU00u0sYuj0aR08ldSJEIHKsEJYoA
Date: Fri, 4 Jun 2021 18:06:09 +0000
Message-ID: <b917d889e28c4775acf5d2f89abb48b8@intel.com>
References: <20210604075029.1201478-1-kraxel@redhat.com>
In-Reply-To: <20210604075029.1201478-1-kraxel@redhat.com>
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
Cc: Alexander Bulekov <alxndr@bu.edu>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Vivek Kasireddy <vivek.kasireddy@intel.com>


> -----Original Message-----
> From: Qemu-devel <qemu-devel-bounces+vivek.kasireddy=3Dintel.com@nongnu.o=
rg> On
> Behalf Of Gerd Hoffmann
> Sent: Friday, June 04, 2021 12:50 AM
> To: qemu-devel@nongnu.org
> Cc: Alexander Bulekov <alxndr@bu.edu>; Gerd Hoffmann <kraxel@redhat.com>;
> Michael S. Tsirkin <mst@redhat.com>
> Subject: [PATCH] virtio-gpu: move scanout_id sanity check
>=20
> Checking scanout_id in virtio_gpu_do_set_scanout() is too late, for the
> "resource_id =3D=3D 0" case (aka disable scanout) the scanout_id is used
> unchecked.  Move the check into the callers to fix that.
>=20
> Fixes: e64d4b6a9bc3 ("virtio-gpu: Refactor virtio_gpu_set_scanout")
> Fixes: 32db3c63ae11 ("virtio-gpu: Add virtio_gpu_set_scanout_blob")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/383
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/display/virtio-gpu.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 4d549377cbc1..e183f4ecdaa5 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -610,12 +610,6 @@ static void virtio_gpu_do_set_scanout(VirtIOGPU *g,
>      struct virtio_gpu_scanout *scanout;
>      uint8_t *data;
>=20
> -    if (scanout_id >=3D g->parent_obj.conf.max_outputs) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal scanout id specified=
 %d",
> -                      __func__, scanout_id);
> -        *error =3D VIRTIO_GPU_RESP_ERR_INVALID_SCANOUT_ID;
> -        return;
> -    }
>      scanout =3D &g->parent_obj.scanout[scanout_id];
>=20
>      if (r->x > fb->width ||
> @@ -694,6 +688,13 @@ static void virtio_gpu_set_scanout(VirtIOGPU *g,
>      trace_virtio_gpu_cmd_set_scanout(ss.scanout_id, ss.resource_id,
>                                       ss.r.width, ss.r.height, ss.r.x, ss=
.r.y);
>=20
> +    if (ss.scanout_id >=3D g->parent_obj.conf.max_outputs) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal scanout id specified=
 %d",
> +                      __func__, ss.scanout_id);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_SCANOUT_ID;
> +        return;
> +    }
> +
>      if (ss.resource_id =3D=3D 0) {
>          virtio_gpu_disable_scanout(g, ss.scanout_id);
>          return;
> @@ -730,6 +731,13 @@ static void virtio_gpu_set_scanout_blob(VirtIOGPU *g=
,
>                                            ss.r.width, ss.r.height, ss.r.=
x,
>                                            ss.r.y);
>=20
> +    if (ss.scanout_id >=3D g->parent_obj.conf.max_outputs) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal scanout id specified=
 %d",
> +                      __func__, ss.scanout_id);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_SCANOUT_ID;
> +        return;
> +    }
> +
>      if (ss.resource_id =3D=3D 0) {
>          virtio_gpu_disable_scanout(g, ss.scanout_id);
>          return;
> --
> 2.31.1
>=20


