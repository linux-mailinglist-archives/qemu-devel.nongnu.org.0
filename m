Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7759F6E5B09
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 09:56:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pogBU-0006ok-QJ; Tue, 18 Apr 2023 03:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pogBS-0006oE-CU
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 03:55:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pogBE-0000Z4-R9
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 03:55:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681804511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q26JbcGY+O7VkwAFxhB3WZLfpeHtEAicOkKWJ1GvMKI=;
 b=BfH7v/O+aw8XdhmlTrxmuA9/chmUThpG1SWcUmMhOcPH3lMMDYy1R7nCmK8OKUA2F4YCIw
 zOxetpx6P8aZDn9NvsMYQaxHubxDklRna64wNbZqUOZaz4EdEke309LUMEVzGtDqkpVyNZ
 Lmd8bw52zTqdDqLBbJ2jM4jon2CbdMI=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-kZivvdlIO9m6Pw41KVJ_9g-1; Tue, 18 Apr 2023 03:55:10 -0400
X-MC-Unique: kZivvdlIO9m6Pw41KVJ_9g-1
Received: by mail-yb1-f199.google.com with SMTP id
 e63-20020a255042000000b00b953ca0cf4eso1108619ybb.12
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 00:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681804510; x=1684396510;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q26JbcGY+O7VkwAFxhB3WZLfpeHtEAicOkKWJ1GvMKI=;
 b=djX0ki/EokUdQOkPNb5/Ht2eHytdM9Xara96j6eQE6/Xm+FyavSQC36FW7SwywQ3mK
 1RigFIeRHkLzjuOpw13mCwXGTy/2uK7ZDxSZIPr/lWhpJJmJg1dvA39MvpVXeXuskUuv
 B2pHGK+dfa/zEah1YX15hb4ipVn3X/lOHHV1FQ94SSZ8J6dt5pAlQZaq7qfbOTxrUFno
 n7X+aCoudF2KFCo5QNUsnen9oJksG1VlFI1S7cobANAt2OGg5bYWdcQjuxT73ZJI9Gag
 07fmZRvHBy/RRJnN3pF+anAacCQw3zGxkyh6VpvElaj/gsGC/vNd4Cvq8z2NBBVQmnTR
 xGhw==
X-Gm-Message-State: AAQBX9ezl8D05GqUA7f0ALWntGqjCtR55wGoLS8glh8IImaGif8XvaR3
 ZgBZI6F1zzYj1sC4ZETpDQtNB28zK+dAwHZYnbzhF4HTInKLZ9c84R8g/z4WO+B1cUU4qz5LWL7
 Z1Ut74CiBG4IOnTCRJltJpoWCbN0T2TI=
X-Received: by 2002:a81:46c4:0:b0:552:a306:5256 with SMTP id
 t187-20020a8146c4000000b00552a3065256mr9661390ywa.18.1681804509845; 
 Tue, 18 Apr 2023 00:55:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350aP/DWvn1YExVJ9+fRPf5F1ISCD2GH6hrhgcEWop5WSrAsw5ioPB6AMgnY6wuZK9iP2Gw1qIpIJWZNN2LnzPns=
X-Received: by 2002:a81:46c4:0:b0:552:a306:5256 with SMTP id
 t187-20020a8146c4000000b00552a3065256mr9661374ywa.18.1681804509499; Tue, 18
 Apr 2023 00:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-3-hreitz@redhat.com>
 <20230412210641.GC2813183@fedora>
 <CAJaqyWfm=g_hr9=WpsnwJ4hdpVb7K7p5rirWjvx=PxKYUp8trA@mail.gmail.com>
 <20230417171405.GA3890522@fedora>
 <CAJaqyWePywgd11mA5D=SqSyGOjzdhj1kjNHVkjG1iWv9Ox0ytg@mail.gmail.com>
 <CAJSP0QUriW5D9QNX+=YHYepXVAzOKjL6Dc93zSYihTTZhif0ig@mail.gmail.com>
In-Reply-To: <CAJSP0QUriW5D9QNX+=YHYepXVAzOKjL6Dc93zSYihTTZhif0ig@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 18 Apr 2023 09:54:32 +0200
Message-ID: <CAJaqyWc_59dhPcXOQDYh3vpMfV_4uZooYpQnRrcCkBBu1QO8tw@mail.gmail.com>
Subject: Re: [PATCH 2/4] vhost-user: Interface for migration state transfer
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Hanna Czenczek <hreitz@redhat.com>,
 qemu-devel@nongnu.org, 
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>, 
 Anton Kuchin <antonkuchin@yandex-team.ru>, Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Mon, Apr 17, 2023 at 9:21=E2=80=AFPM Stefan Hajnoczi <stefanha@gmail.com=
> wrote:
>
> On Mon, 17 Apr 2023 at 15:08, Eugenio Perez Martin <eperezma@redhat.com> =
wrote:
> >
> > On Mon, Apr 17, 2023 at 7:14=E2=80=AFPM Stefan Hajnoczi <stefanha@redha=
t.com> wrote:
> > >
> > > On Thu, Apr 13, 2023 at 12:14:24PM +0200, Eugenio Perez Martin wrote:
> > > > On Wed, Apr 12, 2023 at 11:06=E2=80=AFPM Stefan Hajnoczi <stefanha@=
redhat.com> wrote:
> > > > >
> > > > > On Tue, Apr 11, 2023 at 05:05:13PM +0200, Hanna Czenczek wrote:
> > > > > > So-called "internal" virtio-fs migration refers to transporting=
 the
> > > > > > back-end's (virtiofsd's) state through qemu's migration stream.=
  To do
> > > > > > this, we need to be able to transfer virtiofsd's internal state=
 to and
> > > > > > from virtiofsd.
> > > > > >
> > > > > > Because virtiofsd's internal state will not be too large, we be=
lieve it
> > > > > > is best to transfer it as a single binary blob after the stream=
ing
> > > > > > phase.  Because this method should be useful to other vhost-use=
r
> > > > > > implementations, too, it is introduced as a general-purpose add=
ition to
> > > > > > the protocol, not limited to vhost-user-fs.
> > > > > >
> > > > > > These are the additions to the protocol:
> > > > > > - New vhost-user protocol feature VHOST_USER_PROTOCOL_F_MIGRATO=
RY_STATE:
> > > > > >   This feature signals support for transferring state, and is a=
dded so
> > > > > >   that migration can fail early when the back-end has no suppor=
t.
> > > > > >
> > > > > > - SET_DEVICE_STATE_FD function: Front-end and back-end negotiat=
e a pipe
> > > > > >   over which to transfer the state.  The front-end sends an FD =
to the
> > > > > >   back-end into/from which it can write/read its state, and the=
 back-end
> > > > > >   can decide to either use it, or reply with a different FD for=
 the
> > > > > >   front-end to override the front-end's choice.
> > > > > >   The front-end creates a simple pipe to transfer the state, bu=
t maybe
> > > > > >   the back-end already has an FD into/from which it has to writ=
e/read
> > > > > >   its state, in which case it will want to override the simple =
pipe.
> > > > > >   Conversely, maybe in the future we find a way to have the fro=
nt-end
> > > > > >   get an immediate FD for the migration stream (in some cases),=
 in which
> > > > > >   case we will want to send this to the back-end instead of cre=
ating a
> > > > > >   pipe.
> > > > > >   Hence the negotiation: If one side has a better idea than a p=
lain
> > > > > >   pipe, we will want to use that.
> > > > > >
> > > > > > - CHECK_DEVICE_STATE: After the state has been transferred thro=
ugh the
> > > > > >   pipe (the end indicated by EOF), the front-end invokes this f=
unction
> > > > > >   to verify success.  There is no in-band way (through the pipe=
) to
> > > > > >   indicate failure, so we need to check explicitly.
> > > > > >
> > > > > > Once the transfer pipe has been established via SET_DEVICE_STAT=
E_FD
> > > > > > (which includes establishing the direction of transfer and migr=
ation
> > > > > > phase), the sending side writes its data into the pipe, and the=
 reading
> > > > > > side reads it until it sees an EOF.  Then, the front-end will c=
heck for
> > > > > > success via CHECK_DEVICE_STATE, which on the destination side i=
ncludes
> > > > > > checking for integrity (i.e. errors during deserialization).
> > > > > >
> > > > > > Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > > > Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> > > > > > ---
> > > > > >  include/hw/virtio/vhost-backend.h |  24 +++++
> > > > > >  include/hw/virtio/vhost.h         |  79 ++++++++++++++++
> > > > > >  hw/virtio/vhost-user.c            | 147 ++++++++++++++++++++++=
++++++++
> > > > > >  hw/virtio/vhost.c                 |  37 ++++++++
> > > > > >  4 files changed, 287 insertions(+)
> > > > > >
> > > > > > diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/vir=
tio/vhost-backend.h
> > > > > > index ec3fbae58d..5935b32fe3 100644
> > > > > > --- a/include/hw/virtio/vhost-backend.h
> > > > > > +++ b/include/hw/virtio/vhost-backend.h
> > > > > > @@ -26,6 +26,18 @@ typedef enum VhostSetConfigType {
> > > > > >      VHOST_SET_CONFIG_TYPE_MIGRATION =3D 1,
> > > > > >  } VhostSetConfigType;
> > > > > >
> > > > > > +typedef enum VhostDeviceStateDirection {
> > > > > > +    /* Transfer state from back-end (device) to front-end */
> > > > > > +    VHOST_TRANSFER_STATE_DIRECTION_SAVE =3D 0,
> > > > > > +    /* Transfer state from front-end to back-end (device) */
> > > > > > +    VHOST_TRANSFER_STATE_DIRECTION_LOAD =3D 1,
> > > > > > +} VhostDeviceStateDirection;
> > > > > > +
> > > > > > +typedef enum VhostDeviceStatePhase {
> > > > > > +    /* The device (and all its vrings) is stopped */
> > > > > > +    VHOST_TRANSFER_STATE_PHASE_STOPPED =3D 0,
> > > > > > +} VhostDeviceStatePhase;
> > > > >
> > > > > vDPA has:
> > > > >
> > > > >   /* Suspend a device so it does not process virtqueue requests a=
nymore
> > > > >    *
> > > > >    * After the return of ioctl the device must preserve all the n=
ecessary state
> > > > >    * (the virtqueue vring base plus the possible device specific =
states) that is
> > > > >    * required for restoring in the future. The device must not ch=
ange its
> > > > >    * configuration after that point.
> > > > >    */
> > > > >   #define VHOST_VDPA_SUSPEND      _IO(VHOST_VIRTIO, 0x7D)
> > > > >
> > > > >   /* Resume a device so it can resume processing virtqueue reques=
ts
> > > > >    *
> > > > >    * After the return of this ioctl the device will have restored=
 all the
> > > > >    * necessary states and it is fully operational to continue pro=
cessing the
> > > > >    * virtqueue descriptors.
> > > > >    */
> > > > >   #define VHOST_VDPA_RESUME       _IO(VHOST_VIRTIO, 0x7E)
> > > > >
> > > > > I wonder if it makes sense to import these into vhost-user so tha=
t the
> > > > > difference between kernel vhost and vhost-user is minimized. It's=
 okay
> > > > > if one of them is ahead of the other, but it would be nice to avo=
id
> > > > > overlapping/duplicated functionality.
> > > > >
> > > >
> > > > That's what I had in mind in the first versions. I proposed VHOST_S=
TOP
> > > > instead of VHOST_VDPA_STOP for this very reason. Later it did chang=
e
> > > > to SUSPEND.
> > > >
> > > > Generally it is better if we make the interface less parametrized a=
nd
> > > > we trust in the messages and its semantics in my opinion. In other
> > > > words, instead of
> > > > vhost_set_device_state_fd_op(VHOST_TRANSFER_STATE_PHASE_STOPPED), s=
end
> > > > individually the equivalent of VHOST_VDPA_SUSPEND vhost-user comman=
d.
> > > >
> > > > Another way to apply this is with the "direction" parameter. Maybe =
it
> > > > is better to split it into "set_state_fd" and "get_state_fd"?
> > > >
> > > > In that case, reusing the ioctls as vhost-user messages would be ok=
.
> > > > But that puts this proposal further from the VFIO code, which uses
> > > > "migration_set_state(state)", and maybe it is better when the numbe=
r
> > > > of states is high.
> > >
> > > Hi Eugenio,
> > > Another question about vDPA suspend/resume:
> > >
> > >   /* Host notifiers must be enabled at this point. */
> > >   void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev, boo=
l vrings)
> > >   {
> > >       int i;
> > >
> > >       /* should only be called after backend is connected */
> > >       assert(hdev->vhost_ops);
> > >       event_notifier_test_and_clear(
> > >           &hdev->vqs[VHOST_QUEUE_NUM_CONFIG_INR].masked_config_notifi=
er);
> > >       event_notifier_test_and_clear(&vdev->config_notifier);
> > >
> > >       trace_vhost_dev_stop(hdev, vdev->name, vrings);
> > >
> > >       if (hdev->vhost_ops->vhost_dev_start) {
> > >           hdev->vhost_ops->vhost_dev_start(hdev, false);
> > >           ^^^ SUSPEND ^^^
> > >       }
> > >       if (vrings) {
> > >           vhost_dev_set_vring_enable(hdev, false);
> > >       }
> > >       for (i =3D 0; i < hdev->nvqs; ++i) {
> > >           vhost_virtqueue_stop(hdev,
> > >                                vdev,
> > >                                hdev->vqs + i,
> > >                                hdev->vq_index + i);
> > >         ^^^ fetch virtqueue state from kernel ^^^
> > >       }
> > >       if (hdev->vhost_ops->vhost_reset_status) {
> > >           hdev->vhost_ops->vhost_reset_status(hdev);
> > >           ^^^ reset device^^^
> > >
> > > I noticed the QEMU vDPA code resets the device in vhost_dev_stop() ->
> > > vhost_reset_status(). The device's migration code runs after
> > > vhost_dev_stop() and the state will have been lost.
> > >
> >
> > vhost_virtqueue_stop saves the vq state (indexes, vring base) in the
> > qemu VirtIONet device model. This is for all vhost backends.
> >
> > Regarding the state like mac or mq configuration, SVQ runs for all the
> > VM run in the CVQ. So it can track all of that status in the device
> > model too.
> >
> > When a migration effectively occurs, all the frontend state is
> > migrated as a regular emulated device. To route all of the state in a
> > normalized way for qemu is what leaves open the possibility to do
> > cross-backends migrations, etc.
> >
> > Does that answer your question?
>
> I think you're confirming that changes would be necessary in order for
> vDPA to support the save/load operation that Hanna is introducing.
>

Yes, this first iteration was centered on net, with an eye on block,
where state can be routed through classical emulated devices. This is
how vhost-kernel and vhost-user do classically. And it allows
cross-backend, to not modify qemu migration state, etc.

To introduce this opaque state to qemu, that must be fetched after the
suspend and not before, requires changes in vhost protocol, as
discussed previously.

> > > It looks like vDPA changes are necessary in order to support stateful
> > > devices even though QEMU already uses SUSPEND. Is my understanding
> > > correct?
> > >
> >
> > Changes are required elsewhere, as the code to restore the state
> > properly in the destination has not been merged.
>
> I'm not sure what you mean by elsewhere?
>

I meant for vdpa *net* devices the changes are not required in vdpa
ioctls, but mostly in qemu.

If you meant stateful as "it must have a state blob that it must be
opaque to qemu", then I think the straightforward action is to fetch
state blob about the same time as vq indexes. But yes, changes (at
least a new ioctl) is needed for that.

> I'm asking about vDPA ioctls. Right now the sequence is SUSPEND and
> then VHOST_VDPA_SET_STATUS 0.
>
> In order to save device state from the vDPA device in the future, it
> will be necessary to defer the VHOST_VDPA_SET_STATUS 0 call so that
> the device state can be saved before the device is reset.
>
> Does that sound right?
>

The split between suspend and reset was added recently for that very
reason. In all the virtio devices, the frontend is initialized before
the backend, so I don't think it is a good idea to defer the backend
cleanup. Especially if we have already set the state is small enough
to not needing iterative migration from virtiofsd point of view.

If fetching that state at the same time as vq indexes is not valid,
could it follow the same model as the "in-flight descriptors"?
vhost-user follows them by using a shared memory region where their
state is tracked [1]. This allows qemu to survive vhost-user SW
backend crashes, and does not forbid the cross-backends live migration
as all the information is there to recover them.

For hw devices this is not convenient as it occupies PCI bandwidth. So
a possibility is to synchronize this memory region after a
synchronization point, being the SUSPEND call or GET_VRING_BASE. HW
devices are not going to crash in the software sense, so all use cases
remain the same to qemu. And that shared memory information is
recoverable after vhost_dev_stop.

Does that sound reasonable to virtiofsd? To offer a shared memory
region where it dumps the state, maybe only after the
set_state(STATE_PHASE_STOPPED)?

Thanks!

[1] https://qemu.readthedocs.io/en/latest/interop/vhost-user.html#inflight-=
i-o-tracking


