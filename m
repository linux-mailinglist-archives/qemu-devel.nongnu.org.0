Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A70E36F626
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 09:04:04 +0200 (CEST)
Received: from localhost ([::1]:41346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcNBz-0000Ay-Am
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 03:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lcN7W-0004PQ-Vp
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 02:59:27 -0400
Received: from mga14.intel.com ([192.55.52.115]:27738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lcN7T-0000wk-TP
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 02:59:26 -0400
IronPort-SDR: /Ao4bEYeuNaF5Iw3bxmGS4qH3ygdIcIb6l143Q7UZCJj8uIQCPWYhTIzjSgntzvngN1C3fnMZD
 cP590FcFaT2Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="196773559"
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="196773559"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 23:59:12 -0700
IronPort-SDR: 2KogMkrZYYcOR96I2Ow+E3d+PbwRUcyF/0b0/YnxA6bzSb8EqTPyqk1u497Q7lem2p1opWxbgL
 j2frScFyQfrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="605575583"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga005.jf.intel.com with ESMTP; 29 Apr 2021 23:59:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 29 Apr 2021 23:59:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 29 Apr 2021 23:59:11 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.013;
 Thu, 29 Apr 2021 23:59:11 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH v2 07/12] virtio-gpu: Add virtio_gpu_resource_create_blob
Thread-Topic: [PATCH v2 07/12] virtio-gpu: Add virtio_gpu_resource_create_blob
Thread-Index: AQHXNbORkc2XoTpqakm7y9eO0n1QrKrKKFqAgAKGo9A=
Date: Fri, 30 Apr 2021 06:59:11 +0000
Message-ID: <f849fc8706bc49e5be67b6f240e5e7bc@intel.com>
References: <20210420065347.2685768-1-vivek.kasireddy@intel.com>
 <20210420065347.2685768-8-vivek.kasireddy@intel.com>
 <20210428091643.rkqmgwptjbhyvpim@sirius.home.kraxel.org>
In-Reply-To: <20210428091643.rkqmgwptjbhyvpim@sirius.home.kraxel.org>
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
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=vivek.kasireddy@intel.com; helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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

> >      res->remapsz =3D QEMU_ALIGN_UP(res->remapsz,
> > qemu_real_host_page_size);
> >
> >      res->remapped =3D mmap(NULL, res->remapsz, PROT_READ, @@ -152,7
> > +155,9 @@ void virtio_gpu_init_udmabuf(struct virtio_gpu_simple_resourc=
e *res)
> >          pdata =3D res->remapped;
> >      }
> >
> > -    (void) pdata;
> > +    if (pdata) {
> > +        res->blob =3D pdata;
> > +    }
> >  }
>=20
> That is confusing.  Patch #2 introduces code which is removed here (proba=
bly leftovers
> from udmabuf prototype which didn't use blob resources).  I think it woul=
d be useful to
> merge patch #2 with this one.
[Kasireddy, Vivek] Ok, will do.

>=20
> Also we might cleanup things a bit.  Do we need separate remapsz + blob_s=
ize fields in the
> first place?  Probably not ...
[Kasireddy, Vivek] Right, we don't. I was also going to slightly change the=
 names of some
of the new functions in v3 to keep them consistent with the rest of the cod=
e. Do you have
any additional feedback for the other patches that I can include in v3?

>=20
> take care,
>   Gerd
>=20
> PS: Can you explicitly cc me on the next version of the patch series?
>     Some patches (this one for example) are on the list only and not in
>     my inbox.  Thanks.
[Kasireddy, Vivek] Sure. I was hoping that including the Based-on-patch-by
tag would do just that but looks like it doesn't.=20

Thanks,
Vivek


