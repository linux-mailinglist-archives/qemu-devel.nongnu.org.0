Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AD46E4EEF
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 19:15:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poSQq-00019v-Oi; Mon, 17 Apr 2023 13:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1poSQo-00019l-Up
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 13:14:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1poSQm-0006xL-UM
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 13:14:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681751659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B/V+NP/fwcKXbAiCq7ORrf8cvYa66d891apa5XxgV8Q=;
 b=bjY6nEdWKFf1KrfCDb5CiacqX9F+d9/ivBDS9gS8MWv/IOesASNbkZV/dG3osjmps33w4i
 ITuq0EqxhyXRMa24vVOwNTect92xifoyyb5sgMIHd9Ks4C/JwddZsNwem+DDrJr216LTLR
 bW3o2jKI2HvnaeH36VgAtcQlAXllUVY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-5uxSI05FNnqLEIn9ZirtcA-1; Mon, 17 Apr 2023 13:14:08 -0400
X-MC-Unique: 5uxSI05FNnqLEIn9ZirtcA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28675102F237;
 Mon, 17 Apr 2023 17:14:08 +0000 (UTC)
Received: from localhost (unknown [10.39.194.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5143E400EA94;
 Mon, 17 Apr 2023 17:14:07 +0000 (UTC)
Date: Mon, 17 Apr 2023 13:14:05 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Hanna Czenczek <hreitz@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 2/4] vhost-user: Interface for migration state transfer
Message-ID: <20230417171405.GA3890522@fedora>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-3-hreitz@redhat.com>
 <20230412210641.GC2813183@fedora>
 <CAJaqyWfm=g_hr9=WpsnwJ4hdpVb7K7p5rirWjvx=PxKYUp8trA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+Mqe6XgaMH3khBWw"
Content-Disposition: inline
In-Reply-To: <CAJaqyWfm=g_hr9=WpsnwJ4hdpVb7K7p5rirWjvx=PxKYUp8trA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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


--+Mqe6XgaMH3khBWw
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
>=20
> Generally it is better if we make the interface less parametrized and
> we trust in the messages and its semantics in my opinion. In other
> words, instead of
> vhost_set_device_state_fd_op(VHOST_TRANSFER_STATE_PHASE_STOPPED), send
> individually the equivalent of VHOST_VDPA_SUSPEND vhost-user command.
>=20
> Another way to apply this is with the "direction" parameter. Maybe it
> is better to split it into "set_state_fd" and "get_state_fd"?
>=20
> In that case, reusing the ioctls as vhost-user messages would be ok.
> But that puts this proposal further from the VFIO code, which uses
> "migration_set_state(state)", and maybe it is better when the number
> of states is high.

Hi Eugenio,
Another question about vDPA suspend/resume:

  /* Host notifiers must be enabled at this point. */
  void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev, bool vrin=
gs)
  {
      int i;
 =20
      /* should only be called after backend is connected */
      assert(hdev->vhost_ops);
      event_notifier_test_and_clear(
          &hdev->vqs[VHOST_QUEUE_NUM_CONFIG_INR].masked_config_notifier);
      event_notifier_test_and_clear(&vdev->config_notifier);
 =20
      trace_vhost_dev_stop(hdev, vdev->name, vrings);
 =20
      if (hdev->vhost_ops->vhost_dev_start) {
          hdev->vhost_ops->vhost_dev_start(hdev, false);
          ^^^ SUSPEND ^^^
      }
      if (vrings) {
          vhost_dev_set_vring_enable(hdev, false);
      }
      for (i =3D 0; i < hdev->nvqs; ++i) {
          vhost_virtqueue_stop(hdev,
                               vdev,
                               hdev->vqs + i,
                               hdev->vq_index + i);
	^^^ fetch virtqueue state from kernel ^^^
      }
      if (hdev->vhost_ops->vhost_reset_status) {
          hdev->vhost_ops->vhost_reset_status(hdev);
	  ^^^ reset device^^^

I noticed the QEMU vDPA code resets the device in vhost_dev_stop() ->
vhost_reset_status(). The device's migration code runs after
vhost_dev_stop() and the state will have been lost.

It looks like vDPA changes are necessary in order to support stateful
devices even though QEMU already uses SUSPEND. Is my understanding
correct?

Stefan

--+Mqe6XgaMH3khBWw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQ9fl0ACgkQnKSrs4Gr
c8juMwf/XvLMgHq/OAIaR4S7qyo0djcy6tKt+dYve+8X4B8uHehnbY1Y/OfJIV3r
Kf0mZEyiD+okEC1xJlhqBIqZEBQ3U7pinnt1+X6JDkRillxrONpJP1NR3w9+d+PS
rRdZ0KXmPZHAi1XoPIZYQcQ77c2Tx1ok28xQABTQjOSdWQzrr3yxriMBfPyFzumj
aOb7hnwqChHxAy/VwByFqlseiWF1f9UJu1Jfi0AjSQYBnILsVkzjXu6RVYEpcIgs
UgsSObQWXxvPwvzHn9Q0H4ZGQibsdzBVe80raiS4MN0hyLQLNAB16GHtrzjuD6i+
yuSRuO6153o6N5B/nbxqTG1vofV8Kw==
=kTH3
-----END PGP SIGNATURE-----

--+Mqe6XgaMH3khBWw--


