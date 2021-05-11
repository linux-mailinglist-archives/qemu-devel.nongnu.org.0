Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE20137B1B4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 00:43:35 +0200 (CEST)
Received: from localhost ([::1]:41426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgb6E-0005Nu-I0
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 18:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgb5S-0004hx-Dl
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:42:46 -0400
Received: from mga04.intel.com ([192.55.52.120]:20451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgb5P-0003VV-VN
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:42:45 -0400
IronPort-SDR: e2e8CooNjsac4KL9QX+mFdPcbCvxfVBvBeliUNgjMt47Cx7v6Hv0jU/3PsnjjxcRE7yZUb3ARy
 lkBGiso+2OnA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="197588959"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="197588959"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 15:42:38 -0700
IronPort-SDR: Mcy7WRKIQ3t6jNX0BBBZ0OjZQWN/nuHe2JvTvKnD/B+5uOx53BjtlwkAXpfnQhYEVJVu98BTKu
 KUAuhvTjSbuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="622036528"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 11 May 2021 15:42:38 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 11 May 2021 15:42:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 11 May 2021 15:42:37 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.013;
 Tue, 11 May 2021 15:42:37 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH v3 12/20] virtio-gpu: Add virtio_gpu_set_scanout_blob
Thread-Topic: [PATCH v3 12/20] virtio-gpu: Add virtio_gpu_set_scanout_blob
Thread-Index: AQHXRj6O1inSplV5VUa404vbR2iDvKrenZeAgABCk6A=
Date: Tue, 11 May 2021 22:42:37 +0000
Message-ID: <85ccf06ce13549b397bb30364d4fbe74@intel.com>
References: <20210511080818.366985-1-vivek.kasireddy@intel.com>
 <20210511080818.366985-13-vivek.kasireddy@intel.com>
 <20210511113957.7xxjcvpavimhgb73@sirius.home.kraxel.org>
In-Reply-To: <20210511113957.7xxjcvpavimhgb73@sirius.home.kraxel.org>
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd,

> > -    pixman_image_unref(res->image);
> > +    if (res->image) {
> > +        pixman_image_unref(res->image);
> > +    }
>=20
> There is qemu_pixman_image_unref().
>=20
> Like pixman_image_unref except that it also accepts (and ignores) NULL
> pointers.
[Kasireddy, Vivek] Made the change in v4.

>=20
> >      virtio_gpu_cleanup_mapping(g, res);
> >      QTAILQ_REMOVE(&g->reslist, res, next);
> >      g->hostmem -=3D res->hostmem;
> > @@ -494,6 +496,7 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
> >  {
> >      struct virtio_gpu_simple_resource *res;
> >      struct virtio_gpu_resource_flush rf;
> > +    struct virtio_gpu_scanout *scanout;
> >      pixman_region16_t flush_region;
> >      int i;
> >
> > @@ -504,16 +507,28 @@ static void virtio_gpu_resource_flush(VirtIOGPU *=
g,
> >
> >      res =3D virtio_gpu_find_check_resource(g, rf.resource_id, false,
> >                                           __func__, &cmd->error);
> > -    if (!res || res->blob) {
> > +    if (!res) {
> >          return;
> >      }
> >
> > -    if (rf.r.x > res->width ||
> > +    if (res->blob && display_opengl) {
>=20
> console_has_gl(scanout->con)
[Kasireddy, Vivek] Made this change here and in other places in v4.

>=20
> > +    if (!res->blob &&
> > +        (rf.r.x > res->width ||
> >          rf.r.y > res->height ||
> >          rf.r.width > res->width ||
> >          rf.r.height > res->height ||
> >          rf.r.x + rf.r.width > res->width ||
> > -        rf.r.y + rf.r.height > res->height) {
> > +        rf.r.y + rf.r.height > res->height)) {
> >          qemu_log_mask(LOG_GUEST_ERROR, "%s: flush bounds outside resou=
rce"
> >                        " bounds for resource %d: %d %d %d %d vs %d %d\n=
",
> >                        __func__, rf.resource_id, rf.r.x, rf.r.y,
>=20
> Indent needs fixing.
> Do we need sanity checks for the res->blob =3D=3D true case?  I think so =
...
[Kasireddy, Vivek] If a resource is a blob, it would not have valid width a=
nd height and
instead only have valid blob_size; hence, the sanity checks would not be ap=
plicable.

Thanks,
Vivek

>=20
> >      g->parent_obj.enable =3D 1;
> > -    data =3D (uint8_t *)pixman_image_get_data(res->image);
> > +
> > +    if (res->blob) {
> > +        if (display_opengl) {
>=20
> Again console_has_gl(scanout->con)
>=20
> > +            if (!virtio_gpu_update_dmabuf(g, scanout_id, res, fb)) {
> > +                virtio_gpu_update_scanout(g, scanout_id, res, r);
> > +                return;
> > +            }
> > +        }
> > +
> > +        data =3D res->blob;
> > +    } else {
> > +        data =3D (uint8_t *)pixman_image_get_data(res->image);
> > +    }
> >
> >      /* create a surface for this scanout */
> > -    if (!scanout->ds ||
> > +    if ((res->blob && !display_opengl) ||
>=20
> And again.
>=20
> take care,
>   Gerd


