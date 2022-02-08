Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 364E44AD506
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 10:33:30 +0100 (CET)
Received: from localhost ([::1]:53744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHMsL-0004qV-8j
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 04:33:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nHLYj-0005zE-S3
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:09:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nHLYg-0008SF-C7
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:09:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644307745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vIPSQBsKBQco9TpJ/GwXnH5BiOl5U0hqD4rFbaFj1/4=;
 b=AU3BxBrO6MsH4j+745dTs8//oidXFJANaqO5hleVOXAJURdKBVC7IWUFOwtaq1Yo1yy3rk
 tflHtha/sE4NxPwkQ9LumzSeBstNoX/iZaWJRUflAQ1gIAR6wM+7oyt3WFIgveCnwGDI8q
 mdeLZHuHzjaDfmXMJ6W4Lb31vz1mAP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-_5MIQ7iPNhWLFQnK-UXUkg-1; Tue, 08 Feb 2022 03:09:02 -0500
X-MC-Unique: _5MIQ7iPNhWLFQnK-UXUkg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA5231084F40;
 Tue,  8 Feb 2022 08:09:00 +0000 (UTC)
Received: from localhost (unknown [10.39.193.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 245307AB58;
 Tue,  8 Feb 2022 08:08:01 +0000 (UTC)
Date: Tue, 8 Feb 2022 08:08:00 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Yongji Xie <xieyongji@bytedance.com>
Subject: Re: [PATCH 5/5] libvduse: Add support for reconnecting
Message-ID: <YgIk4H8tEI6pK9o2@stefanha-x1.localdomain>
References: <20220125131800.91-1-xieyongji@bytedance.com>
 <20220125131800.91-6-xieyongji@bytedance.com>
 <YgEvInUC/upRN3py@stefanha-x1.localdomain>
 <CACycT3sMFpt92xtJ2xwRtLVfx3ZS-3jo0SPhfe4tZjOfb_j9Fw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fzc0O6CmpeG7yEv9"
Content-Disposition: inline
In-Reply-To: <CACycT3sMFpt92xtJ2xwRtLVfx3ZS-3jo0SPhfe4tZjOfb_j9Fw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


--fzc0O6CmpeG7yEv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 03:35:27PM +0800, Yongji Xie wrote:
> On Mon, Feb 7, 2022 at 10:39 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >
> > On Tue, Jan 25, 2022 at 09:18:00PM +0800, Xie Yongji wrote:
> > > +static void *vduse_log_get(const char *dir, const char *name, size_t=
 size)
> > > +{
> > > +    void *ptr =3D MAP_FAILED;
> > > +    char *path;
> > > +    int fd;
> > > +
> > > +    path =3D (char *)malloc(strlen(dir) + strlen(name) +
> > > +                          strlen("/vduse-log-") + 1);
> > > +    if (!path) {
> > > +        return ptr;
> > > +    }
> > > +    sprintf(path, "%s/vduse-log-%s", dir, name);
> >
> > Please use g_strdup_printf() and g_autofree in QEMU code. In libvduse
> > code it's okay to use malloc(3), but regular QEMU code should use glib.
> >
>=20
> But this code resides in libvduse currently.

Oops, I thought we were in block/export/vduse-blk.c. Then it's fine to
use malloc(3).

> > > +static int vduse_queue_check_inflights(VduseVirtq *vq)
> > > +{
> > > +    int i =3D 0;
> > > +    VduseDev *dev =3D vq->dev;
> > > +
> > > +    vq->used_idx =3D vq->vring.used->idx;
> >
> > Is this reading struct vring_used->idx without le16toh()?
> >
> > > +    vq->resubmit_num =3D 0;
> > > +    vq->resubmit_list =3D NULL;
> > > +    vq->counter =3D 0;
> > > +
> > > +    if (unlikely(vq->log->inflight.used_idx !=3D vq->used_idx)) {
> > > +        vq->log->inflight.desc[vq->log->inflight.last_batch_head].in=
flight =3D 0;
> >
> > I suggest validating vq->log->inflight fields before using them.
> > last_batch_head must be less than the virtqueue size. Although the log
> > file is somewhat trusted, there may still be ways to corrupt it or
> > confuse the new process that loads it.
> >
>=20
> I can validate the last_batch_head field. But it's hard to validate
> the inflight field, so we might still meet some issues if the file is
> corrupted.

It's okay if the log tells us to resubmit virtqueue buffers that have
garbage vring descriptors because the vring code needs to handle garbage
descriptors anyway.

But we cannot load dest[untrusted_input] or do anything else that could
crash, corrupt memory, etc.

> > > @@ -988,6 +1212,12 @@ VduseDev *vduse_dev_create(const char *name, ui=
nt32_t device_id,
> > >          vqs[i].index =3D i;
> > >          vqs[i].dev =3D dev;
> > >          vqs[i].fd =3D -1;
> > > +        if (log) {
> > > +            vqs[i].log =3D log;
> > > +            vqs[i].log->inflight.desc_num =3D VIRTQUEUE_MAX_SIZE;
> > > +            log =3D (void *)((char *)log +
> > > +                  vduse_vq_log_size(VIRTQUEUE_MAX_SIZE));
> >
> > The size of the log needs to be verified. The file is mmapped but
> > there's no guarantee that the size matches num_queues *
> > vduse_vq_log_size(VIRTQUEUE_MAX_SIZE).
> >
>=20
> We will call ftruncate() in vduse_log_get(). Is it enough?

Yes, I think so.

Thanks,
Stefan

--fzc0O6CmpeG7yEv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmICJOAACgkQnKSrs4Gr
c8iVQgf+I5oAbvybRvCVVLNcTKr0UA6jRCiYDHu/gQNcFksvDPg88duTt5R/cDHF
/QgxmQIyMvkhz/SLC+J/oHLP3TxIa2K31HfRrEJA/gpNeWWc7zBAuOAsbcvL9VCB
VS4TGH0OBIhl+CCTmwRZy/GngRGHPOEHoX8tdJB6tEDJ2nv8lc1AWtuiNKcxsfZZ
OFOjYK+SDM/J7/Gfo1JUo3KD/pC/rzi6TTL0mv97bCw2jli+nn+JgSeEQ81wu9r8
KYeJaz9Gj6zff7dMYRum8uhOt9LKppzuNOpKZuJAviTcDpxm9CHJOqqT+v8EDC+u
WehZtyLYCP5n7EmNWejQvgd1DoqJ+Q==
=rINh
-----END PGP SIGNATURE-----

--fzc0O6CmpeG7yEv9--


