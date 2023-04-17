Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A566E50BF
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 21:22:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poUPK-0008Oi-8u; Mon, 17 Apr 2023 15:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1poUPI-0008OR-9j
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 15:20:56 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1poUPG-0007jw-6i
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 15:20:56 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id t16so14300465ybi.13
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 12:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681759252; x=1684351252;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H1zpO1uheOCfEqy4mYDPvvKqBZkHgBHiC4kIBWf2eLA=;
 b=oMU3wiPWwNz8hZ0voXkFJ9QZTvrYbWGM36yxiYhGj1TtPDPcHSXJVgvZ164QsoJN23
 7cX/MWAMyAe+hhdoF3dGXL7TH+5NDpNoTJ6S8wT4w8qGniQNORCboaIo72JgS1ILdyah
 B1b4vUARqNqO1E4dz6L03jk/cUED44SiD0cDm0HUy7ZYEdOsPdIGZ315IE/plVxYJmuN
 ttSjQ1uJHgVYvmuvuKm+FB46xh7L/qo/RSqZD70qWjzOSW3YeHuktnoxS/Rc2JvQOl7c
 PScWG9uGf7TKqtlnaBEfnlL5wz1C8fP3+o4pO+bZ0O+FOdnED0onwuM52YxO9H7xFd0D
 XE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681759252; x=1684351252;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H1zpO1uheOCfEqy4mYDPvvKqBZkHgBHiC4kIBWf2eLA=;
 b=aO+MDpwNvchcKvw367Y0L7Y+bk45U1RhVbFcxzcpMTzl5GXImqaNHu5ohIObUn+uIG
 6h/8uNyCMZ7Df94G9Uw5ioESfICahx6ZboDeSSKCA35hYV2rPXgAI02po477lvNZ9uul
 TUdzryR/v9d7xI6FPjWP6Kc5r4EkVnmHkuuqMxJushTzMvQMY+sklwZw4joug7psXTtk
 pWqSo67TQSWr0cXy9gjzUtDFb0gbxZzdm1BwQWD0+MCCpePWQSNnWUdW+8bMqY1Iksoe
 oezm0nJhQ4rWoGJIHL6cjVPAV05/dEfS1deQQt2yjda3oyq4ih610DBX2z/bs6Tl7sp8
 lUzQ==
X-Gm-Message-State: AAQBX9fMqJanEC6sZYrpcwPB/uHepdJADXimiUhNC1cnKtF/ptK46qZW
 gJM4ESzq53lULXvo0RvJsF4GYJBUoW64iqRd7+g=
X-Google-Smtp-Source: AKy350aVYDhwIYH0DXPIM3HgpF0z86fVfF9BDDAX+qViw7BgGyMVyVAGr2nuo89q64EJt9kxaoVIKdBXW+3LLwFZ+cU=
X-Received: by 2002:a25:748b:0:b0:b8f:6ab7:9328 with SMTP id
 p133-20020a25748b000000b00b8f6ab79328mr8561131ybc.2.1681759252409; Mon, 17
 Apr 2023 12:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-3-hreitz@redhat.com>
 <20230412210641.GC2813183@fedora>
 <CAJaqyWfm=g_hr9=WpsnwJ4hdpVb7K7p5rirWjvx=PxKYUp8trA@mail.gmail.com>
 <20230417171405.GA3890522@fedora>
 <CAJaqyWePywgd11mA5D=SqSyGOjzdhj1kjNHVkjG1iWv9Ox0ytg@mail.gmail.com>
In-Reply-To: <CAJaqyWePywgd11mA5D=SqSyGOjzdhj1kjNHVkjG1iWv9Ox0ytg@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 17 Apr 2023 15:20:40 -0400
Message-ID: <CAJSP0QUriW5D9QNX+=YHYepXVAzOKjL6Dc93zSYihTTZhif0ig@mail.gmail.com>
Subject: Re: [PATCH 2/4] vhost-user: Interface for migration state transfer
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Hanna Czenczek <hreitz@redhat.com>,
 qemu-devel@nongnu.org, 
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>, 
 Anton Kuchin <antonkuchin@yandex-team.ru>, Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 17 Apr 2023 at 15:08, Eugenio Perez Martin <eperezma@redhat.com> wr=
ote:
>
> On Mon, Apr 17, 2023 at 7:14=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat.=
com> wrote:
> >
> > On Thu, Apr 13, 2023 at 12:14:24PM +0200, Eugenio Perez Martin wrote:
> > > On Wed, Apr 12, 2023 at 11:06=E2=80=AFPM Stefan Hajnoczi <stefanha@re=
dhat.com> wrote:
> > > >
> > > > On Tue, Apr 11, 2023 at 05:05:13PM +0200, Hanna Czenczek wrote:
> > > > > So-called "internal" virtio-fs migration refers to transporting t=
he
> > > > > back-end's (virtiofsd's) state through qemu's migration stream.  =
To do
> > > > > this, we need to be able to transfer virtiofsd's internal state t=
o and
> > > > > from virtiofsd.
> > > > >
> > > > > Because virtiofsd's internal state will not be too large, we beli=
eve it
> > > > > is best to transfer it as a single binary blob after the streamin=
g
> > > > > phase.  Because this method should be useful to other vhost-user
> > > > > implementations, too, it is introduced as a general-purpose addit=
ion to
> > > > > the protocol, not limited to vhost-user-fs.
> > > > >
> > > > > These are the additions to the protocol:
> > > > > - New vhost-user protocol feature VHOST_USER_PROTOCOL_F_MIGRATORY=
_STATE:
> > > > >   This feature signals support for transferring state, and is add=
ed so
> > > > >   that migration can fail early when the back-end has no support.
> > > > >
> > > > > - SET_DEVICE_STATE_FD function: Front-end and back-end negotiate =
a pipe
> > > > >   over which to transfer the state.  The front-end sends an FD to=
 the
> > > > >   back-end into/from which it can write/read its state, and the b=
ack-end
> > > > >   can decide to either use it, or reply with a different FD for t=
he
> > > > >   front-end to override the front-end's choice.
> > > > >   The front-end creates a simple pipe to transfer the state, but =
maybe
> > > > >   the back-end already has an FD into/from which it has to write/=
read
> > > > >   its state, in which case it will want to override the simple pi=
pe.
> > > > >   Conversely, maybe in the future we find a way to have the front=
-end
> > > > >   get an immediate FD for the migration stream (in some cases), i=
n which
> > > > >   case we will want to send this to the back-end instead of creat=
ing a
> > > > >   pipe.
> > > > >   Hence the negotiation: If one side has a better idea than a pla=
in
> > > > >   pipe, we will want to use that.
> > > > >
> > > > > - CHECK_DEVICE_STATE: After the state has been transferred throug=
h the
> > > > >   pipe (the end indicated by EOF), the front-end invokes this fun=
ction
> > > > >   to verify success.  There is no in-band way (through the pipe) =
to
> > > > >   indicate failure, so we need to check explicitly.
> > > > >
> > > > > Once the transfer pipe has been established via SET_DEVICE_STATE_=
FD
> > > > > (which includes establishing the direction of transfer and migrat=
ion
> > > > > phase), the sending side writes its data into the pipe, and the r=
eading
> > > > > side reads it until it sees an EOF.  Then, the front-end will che=
ck for
> > > > > success via CHECK_DEVICE_STATE, which on the destination side inc=
ludes
> > > > > checking for integrity (i.e. errors during deserialization).
> > > > >
> > > > > Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > > Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> > > > > ---
> > > > >  include/hw/virtio/vhost-backend.h |  24 +++++
> > > > >  include/hw/virtio/vhost.h         |  79 ++++++++++++++++
> > > > >  hw/virtio/vhost-user.c            | 147 ++++++++++++++++++++++++=
++++++
> > > > >  hw/virtio/vhost.c                 |  37 ++++++++
> > > > >  4 files changed, 287 insertions(+)
> > > > >
> > > > > diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virti=
o/vhost-backend.h
> > > > > index ec3fbae58d..5935b32fe3 100644
> > > > > --- a/include/hw/virtio/vhost-backend.h
> > > > > +++ b/include/hw/virtio/vhost-backend.h
> > > > > @@ -26,6 +26,18 @@ typedef enum VhostSetConfigType {
> > > > >      VHOST_SET_CONFIG_TYPE_MIGRATION =3D 1,
> > > > >  } VhostSetConfigType;
> > > > >
> > > > > +typedef enum VhostDeviceStateDirection {
> > > > > +    /* Transfer state from back-end (device) to front-end */
> > > > > +    VHOST_TRANSFER_STATE_DIRECTION_SAVE =3D 0,
> > > > > +    /* Transfer state from front-end to back-end (device) */
> > > > > +    VHOST_TRANSFER_STATE_DIRECTION_LOAD =3D 1,
> > > > > +} VhostDeviceStateDirection;
> > > > > +
> > > > > +typedef enum VhostDeviceStatePhase {
> > > > > +    /* The device (and all its vrings) is stopped */
> > > > > +    VHOST_TRANSFER_STATE_PHASE_STOPPED =3D 0,
> > > > > +} VhostDeviceStatePhase;
> > > >
> > > > vDPA has:
> > > >
> > > >   /* Suspend a device so it does not process virtqueue requests any=
more
> > > >    *
> > > >    * After the return of ioctl the device must preserve all the nec=
essary state
> > > >    * (the virtqueue vring base plus the possible device specific st=
ates) that is
> > > >    * required for restoring in the future. The device must not chan=
ge its
> > > >    * configuration after that point.
> > > >    */
> > > >   #define VHOST_VDPA_SUSPEND      _IO(VHOST_VIRTIO, 0x7D)
> > > >
> > > >   /* Resume a device so it can resume processing virtqueue requests
> > > >    *
> > > >    * After the return of this ioctl the device will have restored a=
ll the
> > > >    * necessary states and it is fully operational to continue proce=
ssing the
> > > >    * virtqueue descriptors.
> > > >    */
> > > >   #define VHOST_VDPA_RESUME       _IO(VHOST_VIRTIO, 0x7E)
> > > >
> > > > I wonder if it makes sense to import these into vhost-user so that =
the
> > > > difference between kernel vhost and vhost-user is minimized. It's o=
kay
> > > > if one of them is ahead of the other, but it would be nice to avoid
> > > > overlapping/duplicated functionality.
> > > >
> > >
> > > That's what I had in mind in the first versions. I proposed VHOST_STO=
P
> > > instead of VHOST_VDPA_STOP for this very reason. Later it did change
> > > to SUSPEND.
> > >
> > > Generally it is better if we make the interface less parametrized and
> > > we trust in the messages and its semantics in my opinion. In other
> > > words, instead of
> > > vhost_set_device_state_fd_op(VHOST_TRANSFER_STATE_PHASE_STOPPED), sen=
d
> > > individually the equivalent of VHOST_VDPA_SUSPEND vhost-user command.
> > >
> > > Another way to apply this is with the "direction" parameter. Maybe it
> > > is better to split it into "set_state_fd" and "get_state_fd"?
> > >
> > > In that case, reusing the ioctls as vhost-user messages would be ok.
> > > But that puts this proposal further from the VFIO code, which uses
> > > "migration_set_state(state)", and maybe it is better when the number
> > > of states is high.
> >
> > Hi Eugenio,
> > Another question about vDPA suspend/resume:
> >
> >   /* Host notifiers must be enabled at this point. */
> >   void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev, bool =
vrings)
> >   {
> >       int i;
> >
> >       /* should only be called after backend is connected */
> >       assert(hdev->vhost_ops);
> >       event_notifier_test_and_clear(
> >           &hdev->vqs[VHOST_QUEUE_NUM_CONFIG_INR].masked_config_notifier=
);
> >       event_notifier_test_and_clear(&vdev->config_notifier);
> >
> >       trace_vhost_dev_stop(hdev, vdev->name, vrings);
> >
> >       if (hdev->vhost_ops->vhost_dev_start) {
> >           hdev->vhost_ops->vhost_dev_start(hdev, false);
> >           ^^^ SUSPEND ^^^
> >       }
> >       if (vrings) {
> >           vhost_dev_set_vring_enable(hdev, false);
> >       }
> >       for (i =3D 0; i < hdev->nvqs; ++i) {
> >           vhost_virtqueue_stop(hdev,
> >                                vdev,
> >                                hdev->vqs + i,
> >                                hdev->vq_index + i);
> >         ^^^ fetch virtqueue state from kernel ^^^
> >       }
> >       if (hdev->vhost_ops->vhost_reset_status) {
> >           hdev->vhost_ops->vhost_reset_status(hdev);
> >           ^^^ reset device^^^
> >
> > I noticed the QEMU vDPA code resets the device in vhost_dev_stop() ->
> > vhost_reset_status(). The device's migration code runs after
> > vhost_dev_stop() and the state will have been lost.
> >
>
> vhost_virtqueue_stop saves the vq state (indexes, vring base) in the
> qemu VirtIONet device model. This is for all vhost backends.
>
> Regarding the state like mac or mq configuration, SVQ runs for all the
> VM run in the CVQ. So it can track all of that status in the device
> model too.
>
> When a migration effectively occurs, all the frontend state is
> migrated as a regular emulated device. To route all of the state in a
> normalized way for qemu is what leaves open the possibility to do
> cross-backends migrations, etc.
>
> Does that answer your question?

I think you're confirming that changes would be necessary in order for
vDPA to support the save/load operation that Hanna is introducing.

> > It looks like vDPA changes are necessary in order to support stateful
> > devices even though QEMU already uses SUSPEND. Is my understanding
> > correct?
> >
>
> Changes are required elsewhere, as the code to restore the state
> properly in the destination has not been merged.

I'm not sure what you mean by elsewhere?

I'm asking about vDPA ioctls. Right now the sequence is SUSPEND and
then VHOST_VDPA_SET_STATUS 0.

In order to save device state from the vDPA device in the future, it
will be necessary to defer the VHOST_VDPA_SET_STATUS 0 call so that
the device state can be saved before the device is reset.

Does that sound right?

Stefan

