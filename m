Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB6A6E4D66
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 17:39:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poQvx-0000CB-Aq; Mon, 17 Apr 2023 11:38:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1poQvv-0000C0-A3
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 11:38:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1poQvt-0005R6-EF
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 11:38:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681745900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tslY03Xs5mEsSLDILzS5NEr0161jN6oysuunAHUdqZ8=;
 b=hqND3Q5XseNaCwnvk2/nyP6iye0+zGQqfIcNcGgrsmQaK7ZmnyEoN/aV8Wi3HBQSA/jSmp
 sjMUuWgss/LnjYvBKNWW9GDEPZboImeZT7TUebEVEExBwCl8Mi7A5EqRMWJN8ONpdIViQT
 ZqGALa8tE9nJz4sOdeC7dPsDRPq3IkM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-qGOhyMdzP1e1X3f9nH4D_A-1; Mon, 17 Apr 2023 11:38:14 -0400
X-MC-Unique: qGOhyMdzP1e1X3f9nH4D_A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D61185C6E4;
 Mon, 17 Apr 2023 15:38:14 +0000 (UTC)
Received: from localhost (unknown [10.39.194.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 657E014152F6;
 Mon, 17 Apr 2023 15:38:12 +0000 (UTC)
Date: Mon, 17 Apr 2023 11:38:10 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Hanna Czenczek <hreitz@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 2/4] vhost-user: Interface for migration state transfer
Message-ID: <20230417153810.GE3852722@fedora>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-3-hreitz@redhat.com>
 <20230412210641.GC2813183@fedora>
 <CAJaqyWfm=g_hr9=WpsnwJ4hdpVb7K7p5rirWjvx=PxKYUp8trA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="b4l2pi0PgZ69pcAC"
Content-Disposition: inline
In-Reply-To: <CAJaqyWfm=g_hr9=WpsnwJ4hdpVb7K7p5rirWjvx=PxKYUp8trA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--b4l2pi0PgZ69pcAC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2023 at 12:14:24PM +0200, Eugenio Perez Martin wrote:
> On Wed, Apr 12, 2023 at 11:06=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat=
=2Ecom> wrote:
> >
> > On Tue, Apr 11, 2023 at 05:05:13PM +0200, Hanna Czenczek wrote:
> > > So-called "internal" virtio-fs migration refers to transporting the
> > > back-end's (virtiofsd's) state through qemu's migration stream.  To do
> > > this, we need to be able to transfer virtiofsd's internal state to and
> > > from virtiofsd.
> > >
> > > Because virtiofsd's internal state will not be too large, we believe =
it
> > > is best to transfer it as a single binary blob after the streaming
> > > phase.  Because this method should be useful to other vhost-user
> > > implementations, too, it is introduced as a general-purpose addition =
to
> > > the protocol, not limited to vhost-user-fs.
> > >
> > > These are the additions to the protocol:
> > > - New vhost-user protocol feature VHOST_USER_PROTOCOL_F_MIGRATORY_STA=
TE:
> > >   This feature signals support for transferring state, and is added so
> > >   that migration can fail early when the back-end has no support.
> > >
> > > - SET_DEVICE_STATE_FD function: Front-end and back-end negotiate a pi=
pe
> > >   over which to transfer the state.  The front-end sends an FD to the
> > >   back-end into/from which it can write/read its state, and the back-=
end
> > >   can decide to either use it, or reply with a different FD for the
> > >   front-end to override the front-end's choice.
> > >   The front-end creates a simple pipe to transfer the state, but maybe
> > >   the back-end already has an FD into/from which it has to write/read
> > >   its state, in which case it will want to override the simple pipe.
> > >   Conversely, maybe in the future we find a way to have the front-end
> > >   get an immediate FD for the migration stream (in some cases), in wh=
ich
> > >   case we will want to send this to the back-end instead of creating a
> > >   pipe.
> > >   Hence the negotiation: If one side has a better idea than a plain
> > >   pipe, we will want to use that.
> > >
> > > - CHECK_DEVICE_STATE: After the state has been transferred through the
> > >   pipe (the end indicated by EOF), the front-end invokes this function
> > >   to verify success.  There is no in-band way (through the pipe) to
> > >   indicate failure, so we need to check explicitly.
> > >
> > > Once the transfer pipe has been established via SET_DEVICE_STATE_FD
> > > (which includes establishing the direction of transfer and migration
> > > phase), the sending side writes its data into the pipe, and the readi=
ng
> > > side reads it until it sees an EOF.  Then, the front-end will check f=
or
> > > success via CHECK_DEVICE_STATE, which on the destination side includes
> > > checking for integrity (i.e. errors during deserialization).
> > >
> > > Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> > > ---
> > >  include/hw/virtio/vhost-backend.h |  24 +++++
> > >  include/hw/virtio/vhost.h         |  79 ++++++++++++++++
> > >  hw/virtio/vhost-user.c            | 147 ++++++++++++++++++++++++++++=
++
> > >  hw/virtio/vhost.c                 |  37 ++++++++
> > >  4 files changed, 287 insertions(+)
> > >
> > > diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vh=
ost-backend.h
> > > index ec3fbae58d..5935b32fe3 100644
> > > --- a/include/hw/virtio/vhost-backend.h
> > > +++ b/include/hw/virtio/vhost-backend.h
> > > @@ -26,6 +26,18 @@ typedef enum VhostSetConfigType {
> > >      VHOST_SET_CONFIG_TYPE_MIGRATION =3D 1,
> > >  } VhostSetConfigType;
> > >
> > > +typedef enum VhostDeviceStateDirection {
> > > +    /* Transfer state from back-end (device) to front-end */
> > > +    VHOST_TRANSFER_STATE_DIRECTION_SAVE =3D 0,
> > > +    /* Transfer state from front-end to back-end (device) */
> > > +    VHOST_TRANSFER_STATE_DIRECTION_LOAD =3D 1,
> > > +} VhostDeviceStateDirection;
> > > +
> > > +typedef enum VhostDeviceStatePhase {
> > > +    /* The device (and all its vrings) is stopped */
> > > +    VHOST_TRANSFER_STATE_PHASE_STOPPED =3D 0,
> > > +} VhostDeviceStatePhase;
> >
> > vDPA has:
> >
> >   /* Suspend a device so it does not process virtqueue requests anymore
> >    *
> >    * After the return of ioctl the device must preserve all the necessa=
ry state
> >    * (the virtqueue vring base plus the possible device specific states=
) that is
> >    * required for restoring in the future. The device must not change i=
ts
> >    * configuration after that point.
> >    */
> >   #define VHOST_VDPA_SUSPEND      _IO(VHOST_VIRTIO, 0x7D)
> >
> >   /* Resume a device so it can resume processing virtqueue requests
> >    *
> >    * After the return of this ioctl the device will have restored all t=
he
> >    * necessary states and it is fully operational to continue processin=
g the
> >    * virtqueue descriptors.
> >    */
> >   #define VHOST_VDPA_RESUME       _IO(VHOST_VIRTIO, 0x7E)
> >
> > I wonder if it makes sense to import these into vhost-user so that the
> > difference between kernel vhost and vhost-user is minimized. It's okay
> > if one of them is ahead of the other, but it would be nice to avoid
> > overlapping/duplicated functionality.
> >
>=20
> That's what I had in mind in the first versions. I proposed VHOST_STOP
> instead of VHOST_VDPA_STOP for this very reason. Later it did change
> to SUSPEND.

I noticed QEMU only calls ioctl(VHOST_VDPA_SUSPEND) and not
ioctl(VHOST_VDPA_RESUME).

The doc comments in <linux/vdpa.h> don't explain how the device can
leave the suspended state. Can you clarify this?

Stefan

--b4l2pi0PgZ69pcAC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQ9Z+IACgkQnKSrs4Gr
c8glWQf/ZN2qWP0UoPuCrMhwusQi50OkWEGgDY3ZW3iI93Vt/QhZGVAPztUPODdT
w/yqO4TptcNIXAHzrvC5uT0XuxPb1epuVCSE5Vlxi1DeuzjTY+vlWJe5+814ou3j
QS5DbjiaWpCUrmM+F+fk+jHxt4Z3DxXfDeu1Up5nSePcSnkyb/sG/Ny5gwV6t/iM
ifn5JHs9rz/fdjupfULCtkYPXDgFGfPkDb3d0HQi9WJFAMlbvzVJHzecxe8dOtZu
pkJPVGuuaab0I7vEOHKUr+AWtbIQWRZhq050XBSCEiPF+JRRl1icbErQSFd8Mg0b
1SkgQg/XnFtapAHJHv/AAFL79Xutlg==
=DAce
-----END PGP SIGNATURE-----

--b4l2pi0PgZ69pcAC--


