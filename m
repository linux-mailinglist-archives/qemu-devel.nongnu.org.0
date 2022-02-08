Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C664AD4CE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 10:26:55 +0100 (CET)
Received: from localhost ([::1]:42594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHMly-0005rt-0n
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 04:26:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nHLTW-0004li-13
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:03:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nHLTQ-0007ga-RE
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:03:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644307416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5C+Zg7tKqnIh1R0f02FaFb/9M5x9hB9jDX8mrRCyc9k=;
 b=HRmgHML3dppZKwZ25fCPXF6GDiOAfCdImnTZcv/NCq1rsM2AOHzmkLIqHRLexS21pcEKgQ
 EXmCaRi5y6QCTrQh/yT1/ILu2nSVj/8e7JbqR/pbw30nG5wd8I2/GqrUuM3+MSzrvd+sWe
 qZL8z54xr+svU23+ZMDG+NH46kRWsLQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-mcybj4tgMVGBW8_3kLD5Ew-1; Tue, 08 Feb 2022 03:03:33 -0500
X-MC-Unique: mcybj4tgMVGBW8_3kLD5Ew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AFD618C9F40;
 Tue,  8 Feb 2022 08:03:32 +0000 (UTC)
Received: from localhost (unknown [10.39.193.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6898827CC9;
 Tue,  8 Feb 2022 08:02:51 +0000 (UTC)
Date: Tue, 8 Feb 2022 08:02:50 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Yongji Xie <xieyongji@bytedance.com>
Subject: Re: [PATCH 2/5] libvduse: Add VDUSE (vDPA Device in Userspace) library
Message-ID: <YgIjqsYbsVZn6cQh@stefanha-x1.localdomain>
References: <20220125131800.91-1-xieyongji@bytedance.com>
 <20220125131800.91-3-xieyongji@bytedance.com>
 <YgEmB0nsNGYKunh/@stefanha-x1.localdomain>
 <CACycT3vdurZFfAc0PwAP2oVy8OcrEcG74QhgsJATvBuKbq-v-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jk2ZM64Bt/QuIPQx"
Content-Disposition: inline
In-Reply-To: <CACycT3vdurZFfAc0PwAP2oVy8OcrEcG74QhgsJATvBuKbq-v-g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, mreitz@redhat.com, mlureau@redhat.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jk2ZM64Bt/QuIPQx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 02:42:41PM +0800, Yongji Xie wrote:
> On Mon, Feb 7, 2022 at 10:01 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >
> > On Tue, Jan 25, 2022 at 09:17:57PM +0800, Xie Yongji wrote:
> > > +int vduse_dev_handler(VduseDev *dev)
> > > +{
> > > +    struct vduse_dev_request req;
> > > +    struct vduse_dev_response resp =3D { 0 };
> > > +    VduseVirtq *vq;
> > > +    int i, ret;
> > > +
> > > +    ret =3D read(dev->fd, &req, sizeof(req));
> >
> > This file descriptor is blocking? I guess the assumption is that the
> > kernel VDUSE code always enqueues at least one struct vduse_dev_request,
> > so userspace will not block when the file descriptor becomes readable?
> >
>=20
> Yes, that's true. We can always get one entire request if the file
> descriptor becomes readable.

Okay, then the code is fine. We trust the kernel not to block us. While
it is possible to get spurious select(2)/poll(2) ready file descriptors
in the general case (e.g. multiple processes monitoring the same file),
I don't think that can happen in this case.

--jk2ZM64Bt/QuIPQx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmICI6oACgkQnKSrs4Gr
c8gp+QgAqnbA8vp4ViftyP8noYK1+6N3/JoTs2eUGrfk7b6kFUQf6isBFOko4W1z
qy9q4dYwNq5tTYKR+e1ncC16DBBE5WrWSNRL9JaRSIw8QPUQYsGMmu919XQmBpG/
dDQLbSbK/+LK9szQKmUTZ2zvKe6Z125qBFYTePx1J9t+xf3jB9yf9xY9uK52nYYC
R/6sVx5+Ui4glslLoNc8ambCPpCatazvbGxhON/RzRIgbLVEZ4Rjs60RbHJQDbSl
PBtQuedo4GqgHEBzUuuLXrOVowAgAWkKTOEDU+BtNPwbENcx6WfZh8G2WcFpV12S
Nvn1vJ5agpeqbeuSR9mBVeoiR5eqOw==
=v95P
-----END PGP SIGNATURE-----

--jk2ZM64Bt/QuIPQx--


