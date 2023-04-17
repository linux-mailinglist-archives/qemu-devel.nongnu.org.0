Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B19BE6E509A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 21:08:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poUBt-00041F-Q4; Mon, 17 Apr 2023 15:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1poUBs-000415-Ft
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 15:07:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1poUBq-0004dg-DY
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 15:07:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681758420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SmXzDUxIpiFrcf8BmzTzz6pr3U+ZOSBVsXbuRPFMvZc=;
 b=Os34ag+kpC9+FPdGLTP7w4zvaIyjJ3yjIHaXVwtVUyuFrvnFdZWVGZZq64+eTQpZVqm1bV
 LNQ7a/dsaEkBMb/cMgb246tFG2+7kPL8JomUAkOaUfnSZ0nqNIx16ABo/tm0S4f4Yo1P/3
 3oUevG3NEaBLlTucfYKo/pYw8hF6dAY=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-mxXeLVMGNc-qVlzEcXZgpQ-1; Mon, 17 Apr 2023 15:06:59 -0400
X-MC-Unique: mxXeLVMGNc-qVlzEcXZgpQ-1
Received: by mail-yb1-f199.google.com with SMTP id
 188-20020a2504c5000000b00b8f6f5dca5dso7461089ybe.7
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 12:06:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681758418; x=1684350418;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SmXzDUxIpiFrcf8BmzTzz6pr3U+ZOSBVsXbuRPFMvZc=;
 b=RewvdOLvwVzxTRgRaJUxKn4HSGFWNlYsvGcXpOzO7+qdN3ZgqokcqwI81TQoDrEQoH
 rC2aJ1tg+BcZVpyEqxsOu8ojgu6CVBKt4Q3h1Aivf8Y3mQLFk/+hDbk+n62uDXE52Aev
 9S+84IT/4u85XEtGN8egkXq03xRI63V/uOH6pFGLAfDy6OVxTBrRfUtWHqEpkIi4UJ1r
 PwehdmD9CmMqywC1Q0I4XpMyRYIw0Lq5F13J2D+LYvnQ2IrMR0Ng6ltlM1UjZ5ayw4xT
 18M5ctTaFn2E//4HxRqEaXlWRAOsFRj0NltQJ7ptl9IHmZN0lxYQLSD6qeTkadWFS5Vd
 oIjw==
X-Gm-Message-State: AAQBX9eh4lwY5aQF6zZ2IH8T99NE1qkSuvW0OTNaBQeYxlWIGplQsaco
 rhCLUxPJk3hrb4G6EnUxzVE9UkadUkWbKKLnrEo4ym7oWnaj40hYiAGckPmS+AQelkbkto5h353
 S358m8JtoLxbFJbwO1MpzdwRegJ1LFX8=
X-Received: by 2002:a81:ed11:0:b0:54f:a986:3f94 with SMTP id
 k17-20020a81ed11000000b0054fa9863f94mr9718128ywm.3.1681758418617; 
 Mon, 17 Apr 2023 12:06:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350YV9bN2dAbt2nGOcANN8nbXSbytI6V/HzmIMRzPi/wAAp0laE02OnvxDKu92kOJMgccfakY0msfRosF/9M5XWM=
X-Received: by 2002:a81:ed11:0:b0:54f:a986:3f94 with SMTP id
 k17-20020a81ed11000000b0054fa9863f94mr9718094ywm.3.1681758418142; Mon, 17 Apr
 2023 12:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-3-hreitz@redhat.com>
 <20230412210641.GC2813183@fedora>
 <CAJaqyWfm=g_hr9=WpsnwJ4hdpVb7K7p5rirWjvx=PxKYUp8trA@mail.gmail.com>
 <20230417171405.GA3890522@fedora>
In-Reply-To: <20230417171405.GA3890522@fedora>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 17 Apr 2023 21:06:21 +0200
Message-ID: <CAJaqyWePywgd11mA5D=SqSyGOjzdhj1kjNHVkjG1iWv9Ox0ytg@mail.gmail.com>
Subject: Re: [PATCH 2/4] vhost-user: Interface for migration state transfer
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Hanna Czenczek <hreitz@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>, 
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Mon, Apr 17, 2023 at 7:14=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat.co=
m> wrote:
>
> On Thu, Apr 13, 2023 at 12:14:24PM +0200, Eugenio Perez Martin wrote:
> > On Wed, Apr 12, 2023 at 11:06=E2=80=AFPM Stefan Hajnoczi <stefanha@redh=
at.com> wrote:
> > >
> > > On Tue, Apr 11, 2023 at 05:05:13PM +0200, Hanna Czenczek wrote:
> > > > So-called "internal" virtio-fs migration refers to transporting the
> > > > back-end's (virtiofsd's) state through qemu's migration stream.  To=
 do
> > > > this, we need to be able to transfer virtiofsd's internal state to =
and
> > > > from virtiofsd.
> > > >
> > > > Because virtiofsd's internal state will not be too large, we believ=
e it
> > > > is best to transfer it as a single binary blob after the streaming
> > > > phase.  Because this method should be useful to other vhost-user
> > > > implementations, too, it is introduced as a general-purpose additio=
n to
> > > > the protocol, not limited to vhost-user-fs.
> > > >
> > > > These are the additions to the protocol:
> > > > - New vhost-user protocol feature VHOST_USER_PROTOCOL_F_MIGRATORY_S=
TATE:
> > > >   This feature signals support for transferring state, and is added=
 so
> > > >   that migration can fail early when the back-end has no support.
> > > >
> > > > - SET_DEVICE_STATE_FD function: Front-end and back-end negotiate a =
pipe
> > > >   over which to transfer the state.  The front-end sends an FD to t=
he
> > > >   back-end into/from which it can write/read its state, and the bac=
k-end
> > > >   can decide to either use it, or reply with a different FD for the
> > > >   front-end to override the front-end's choice.
> > > >   The front-end creates a simple pipe to transfer the state, but ma=
ybe
> > > >   the back-end already has an FD into/from which it has to write/re=
ad
> > > >   its state, in which case it will want to override the simple pipe=
.
> > > >   Conversely, maybe in the future we find a way to have the front-e=
nd
> > > >   get an immediate FD for the migration stream (in some cases), in =
which
> > > >   case we will want to send this to the back-end instead of creatin=
g a
> > > >   pipe.
> > > >   Hence the negotiation: If one side has a better idea than a plain
> > > >   pipe, we will want to use that.
> > > >
> > > > - CHECK_DEVICE_STATE: After the state has been transferred through =
the
> > > >   pipe (the end indicated by EOF), the front-end invokes this funct=
ion
> > > >   to verify success.  There is no in-band way (through the pipe) to
> > > >   indicate failure, so we need to check explicitly.
> > > >
> > > > Once the transfer pipe has been established via SET_DEVICE_STATE_FD
> > > > (which includes establishing the direction of transfer and migratio=
n
> > > > phase), the sending side writes its data into the pipe, and the rea=
ding
> > > > side reads it until it sees an EOF.  Then, the front-end will check=
 for
> > > > success via CHECK_DEVICE_STATE, which on the destination side inclu=
des
> > > > checking for integrity (i.e. errors during deserialization).
> > > >
> > > > Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> > > > ---
> > > >  include/hw/virtio/vhost-backend.h |  24 +++++
> > > >  include/hw/virtio/vhost.h         |  79 ++++++++++++++++
> > > >  hw/virtio/vhost-user.c            | 147 ++++++++++++++++++++++++++=
++++
> > > >  hw/virtio/vhost.c                 |  37 ++++++++
> > > >  4 files changed, 287 insertions(+)
> > > >
> > > > diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/=
vhost-backend.h
> > > > index ec3fbae58d..5935b32fe3 100644
> > > > --- a/include/hw/virtio/vhost-backend.h
> > > > +++ b/include/hw/virtio/vhost-backend.h
> > > > @@ -26,6 +26,18 @@ typedef enum VhostSetConfigType {
> > > >      VHOST_SET_CONFIG_TYPE_MIGRATION =3D 1,
> > > >  } VhostSetConfigType;
> > > >
> > > > +typedef enum VhostDeviceStateDirection {
> > > > +    /* Transfer state from back-end (device) to front-end */
> > > > +    VHOST_TRANSFER_STATE_DIRECTION_SAVE =3D 0,
> > > > +    /* Transfer state from front-end to back-end (device) */
> > > > +    VHOST_TRANSFER_STATE_DIRECTION_LOAD =3D 1,
> > > > +} VhostDeviceStateDirection;
> > > > +
> > > > +typedef enum VhostDeviceStatePhase {
> > > > +    /* The device (and all its vrings) is stopped */
> > > > +    VHOST_TRANSFER_STATE_PHASE_STOPPED =3D 0,
> > > > +} VhostDeviceStatePhase;
> > >
> > > vDPA has:
> > >
> > >   /* Suspend a device so it does not process virtqueue requests anymo=
re
> > >    *
> > >    * After the return of ioctl the device must preserve all the neces=
sary state
> > >    * (the virtqueue vring base plus the possible device specific stat=
es) that is
> > >    * required for restoring in the future. The device must not change=
 its
> > >    * configuration after that point.
> > >    */
> > >   #define VHOST_VDPA_SUSPEND      _IO(VHOST_VIRTIO, 0x7D)
> > >
> > >   /* Resume a device so it can resume processing virtqueue requests
> > >    *
> > >    * After the return of this ioctl the device will have restored all=
 the
> > >    * necessary states and it is fully operational to continue process=
ing the
> > >    * virtqueue descriptors.
> > >    */
> > >   #define VHOST_VDPA_RESUME       _IO(VHOST_VIRTIO, 0x7E)
> > >
> > > I wonder if it makes sense to import these into vhost-user so that th=
e
> > > difference between kernel vhost and vhost-user is minimized. It's oka=
y
> > > if one of them is ahead of the other, but it would be nice to avoid
> > > overlapping/duplicated functionality.
> > >
> >
> > That's what I had in mind in the first versions. I proposed VHOST_STOP
> > instead of VHOST_VDPA_STOP for this very reason. Later it did change
> > to SUSPEND.
> >
> > Generally it is better if we make the interface less parametrized and
> > we trust in the messages and its semantics in my opinion. In other
> > words, instead of
> > vhost_set_device_state_fd_op(VHOST_TRANSFER_STATE_PHASE_STOPPED), send
> > individually the equivalent of VHOST_VDPA_SUSPEND vhost-user command.
> >
> > Another way to apply this is with the "direction" parameter. Maybe it
> > is better to split it into "set_state_fd" and "get_state_fd"?
> >
> > In that case, reusing the ioctls as vhost-user messages would be ok.
> > But that puts this proposal further from the VFIO code, which uses
> > "migration_set_state(state)", and maybe it is better when the number
> > of states is high.
>
> Hi Eugenio,
> Another question about vDPA suspend/resume:
>
>   /* Host notifiers must be enabled at this point. */
>   void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev, bool vr=
ings)
>   {
>       int i;
>
>       /* should only be called after backend is connected */
>       assert(hdev->vhost_ops);
>       event_notifier_test_and_clear(
>           &hdev->vqs[VHOST_QUEUE_NUM_CONFIG_INR].masked_config_notifier);
>       event_notifier_test_and_clear(&vdev->config_notifier);
>
>       trace_vhost_dev_stop(hdev, vdev->name, vrings);
>
>       if (hdev->vhost_ops->vhost_dev_start) {
>           hdev->vhost_ops->vhost_dev_start(hdev, false);
>           ^^^ SUSPEND ^^^
>       }
>       if (vrings) {
>           vhost_dev_set_vring_enable(hdev, false);
>       }
>       for (i =3D 0; i < hdev->nvqs; ++i) {
>           vhost_virtqueue_stop(hdev,
>                                vdev,
>                                hdev->vqs + i,
>                                hdev->vq_index + i);
>         ^^^ fetch virtqueue state from kernel ^^^
>       }
>       if (hdev->vhost_ops->vhost_reset_status) {
>           hdev->vhost_ops->vhost_reset_status(hdev);
>           ^^^ reset device^^^
>
> I noticed the QEMU vDPA code resets the device in vhost_dev_stop() ->
> vhost_reset_status(). The device's migration code runs after
> vhost_dev_stop() and the state will have been lost.
>

vhost_virtqueue_stop saves the vq state (indexes, vring base) in the
qemu VirtIONet device model. This is for all vhost backends.

Regarding the state like mac or mq configuration, SVQ runs for all the
VM run in the CVQ. So it can track all of that status in the device
model too.

When a migration effectively occurs, all the frontend state is
migrated as a regular emulated device. To route all of the state in a
normalized way for qemu is what leaves open the possibility to do
cross-backends migrations, etc.

Does that answer your question?

> It looks like vDPA changes are necessary in order to support stateful
> devices even though QEMU already uses SUSPEND. Is my understanding
> correct?
>

Changes are required elsewhere, as the code to restore the state
properly in the destination has not been merged.

Thanks!


