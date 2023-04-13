Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D646E1606
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 22:43:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn3mG-0004pN-3r; Thu, 13 Apr 2023 16:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pn3mE-0004p9-A6
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 16:42:42 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pn3mC-0006Np-6F
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 16:42:42 -0400
Received: by mail-yb1-xb29.google.com with SMTP id v7so15352377ybi.0
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 13:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681418559; x=1684010559;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sKPtIzidUFZ6mJSx4dXrIfhLjbtx3SV92WXT2BQwTE4=;
 b=ovW0zu1PWwpui+qg4eXXNgcbEj4LbEoBAma3EpWzw9Dt4B0ZIbthSD01CiSbr9g0LV
 lh8fkTinWt6lMT1KklE7Oy9X2tggSq7HdUeGn6ctyrqA5LTuCXbk4gocqZ4NP7U0KP5M
 +BipJuJIiIc3c5Z9yokJD4LdTGzTQPDsaqyHR1l5BlnF5NnnFEbPiEry/4wiVrSxf4Gp
 FSUDuE4a17CrMOU6IBObSpuyc/NJaSsBJOHtMaugwvAdxjcV1aG4XqARzEPLUm2x5kBN
 VToiwf0DzPDq0d+RUsW8WDuxo2qYWuYae0lYaQJp9tf7j8Jb3xNfyKjG6iZfwmlBtriF
 wgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681418559; x=1684010559;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sKPtIzidUFZ6mJSx4dXrIfhLjbtx3SV92WXT2BQwTE4=;
 b=BtkDSPOiCQIovIEYwR6NYWkkCo1QcvNIsniy5OMYF5c8zwHoeZZ2qDJmo4MHLUzsND
 lTggmgvwjc5OjnxFfdCC0GIrRGDDNp1mdgwYAXAkaueJ94kvr0t5mjgNaO38Z2G6Z7dW
 SlMKqhi4xqFNQd4tb7h81Y9U3mvohO8qYyfB3Z2PFLERR+C0slOzc12QzGEhPQRLI7Ff
 6hx4srpvv93AVQmfO0KLWMm6fxYLvMo6fagwdda8jBNWgUqF5wA074k4q35ekPWw1alN
 E2hGnMBGMRNWOdZjJQc1hcjz876wk2+NLwPBkcnBLd9XoVnqHqcLcYIozx7CAnrg30nD
 zWMQ==
X-Gm-Message-State: AAQBX9fkBkAmg5VNm2YavntAZejYCONNjaD4HhIx0LzX5kEwOvEk+GtE
 68ljF0bQn8f3eVMj1bezxTOVFlkV6elGsFZKudg=
X-Google-Smtp-Source: AKy350Y3W1WbIeLYnuSXoDMU8yE50tvOwg9CUGyshFtaLqhTnjmo6fOZ6XbP9+M10tFN8l9MX+jvlRHRwAvpU29hIRg=
X-Received: by 2002:a25:d690:0:b0:b8f:6be0:1732 with SMTP id
 n138-20020a25d690000000b00b8f6be01732mr359709ybg.2.1681418558614; Thu, 13 Apr
 2023 13:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-3-hreitz@redhat.com>
 <20230412210641.GC2813183@fedora>
 <246691c3-2287-7472-3615-7ec0f074445c@redhat.com>
 <CAJSP0QU-iDTT+xtkZ_xRf4vX+hM0WY+H1SXSuyS+cjiogz3A_A@mail.gmail.com>
 <b0cd4f54-94ed-09a4-cec2-e81f36da4008@redhat.com>
In-Reply-To: <b0cd4f54-94ed-09a4-cec2-e81f36da4008@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 13 Apr 2023 16:42:26 -0400
Message-ID: <CAJSP0QUh0j9QR_bXCGtbQvXiOt0cjP=L0x3APM7kNA6G=gVtfw@mail.gmail.com>
Subject: Re: [PATCH 2/4] vhost-user: Interface for migration state transfer
To: Hanna Czenczek <hreitz@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>, 
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_PH_BODY_ACCOUNTS_PRE=0.001 autolearn=ham autolearn_force=no
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

On Thu, 13 Apr 2023 at 13:55, Hanna Czenczek <hreitz@redhat.com> wrote:
>
> On 13.04.23 13:38, Stefan Hajnoczi wrote:
> > On Thu, 13 Apr 2023 at 05:24, Hanna Czenczek <hreitz@redhat.com> wrote:
> >> On 12.04.23 23:06, Stefan Hajnoczi wrote:
> >>> On Tue, Apr 11, 2023 at 05:05:13PM +0200, Hanna Czenczek wrote:
> >>>> So-called "internal" virtio-fs migration refers to transporting the
> >>>> back-end's (virtiofsd's) state through qemu's migration stream.  To =
do
> >>>> this, we need to be able to transfer virtiofsd's internal state to a=
nd
> >>>> from virtiofsd.
> >>>>
> >>>> Because virtiofsd's internal state will not be too large, we believe=
 it
> >>>> is best to transfer it as a single binary blob after the streaming
> >>>> phase.  Because this method should be useful to other vhost-user
> >>>> implementations, too, it is introduced as a general-purpose addition=
 to
> >>>> the protocol, not limited to vhost-user-fs.
> >>>>
> >>>> These are the additions to the protocol:
> >>>> - New vhost-user protocol feature VHOST_USER_PROTOCOL_F_MIGRATORY_ST=
ATE:
> >>>>     This feature signals support for transferring state, and is adde=
d so
> >>>>     that migration can fail early when the back-end has no support.
> >>>>
> >>>> - SET_DEVICE_STATE_FD function: Front-end and back-end negotiate a p=
ipe
> >>>>     over which to transfer the state.  The front-end sends an FD to =
the
> >>>>     back-end into/from which it can write/read its state, and the ba=
ck-end
> >>>>     can decide to either use it, or reply with a different FD for th=
e
> >>>>     front-end to override the front-end's choice.
> >>>>     The front-end creates a simple pipe to transfer the state, but m=
aybe
> >>>>     the back-end already has an FD into/from which it has to write/r=
ead
> >>>>     its state, in which case it will want to override the simple pip=
e.
> >>>>     Conversely, maybe in the future we find a way to have the front-=
end
> >>>>     get an immediate FD for the migration stream (in some cases), in=
 which
> >>>>     case we will want to send this to the back-end instead of creati=
ng a
> >>>>     pipe.
> >>>>     Hence the negotiation: If one side has a better idea than a plai=
n
> >>>>     pipe, we will want to use that.
> >>>>
> >>>> - CHECK_DEVICE_STATE: After the state has been transferred through t=
he
> >>>>     pipe (the end indicated by EOF), the front-end invokes this func=
tion
> >>>>     to verify success.  There is no in-band way (through the pipe) t=
o
> >>>>     indicate failure, so we need to check explicitly.
> >>>>
> >>>> Once the transfer pipe has been established via SET_DEVICE_STATE_FD
> >>>> (which includes establishing the direction of transfer and migration
> >>>> phase), the sending side writes its data into the pipe, and the read=
ing
> >>>> side reads it until it sees an EOF.  Then, the front-end will check =
for
> >>>> success via CHECK_DEVICE_STATE, which on the destination side includ=
es
> >>>> checking for integrity (i.e. errors during deserialization).
> >>>>
> >>>> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> >>>> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> >>>> ---
> >>>>    include/hw/virtio/vhost-backend.h |  24 +++++
> >>>>    include/hw/virtio/vhost.h         |  79 ++++++++++++++++
> >>>>    hw/virtio/vhost-user.c            | 147 +++++++++++++++++++++++++=
+++++
> >>>>    hw/virtio/vhost.c                 |  37 ++++++++
> >>>>    4 files changed, 287 insertions(+)
> >>>>
> >>>> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/v=
host-backend.h
> >>>> index ec3fbae58d..5935b32fe3 100644
> >>>> --- a/include/hw/virtio/vhost-backend.h
> >>>> +++ b/include/hw/virtio/vhost-backend.h
> >>>> @@ -26,6 +26,18 @@ typedef enum VhostSetConfigType {
> >>>>        VHOST_SET_CONFIG_TYPE_MIGRATION =3D 1,
> >>>>    } VhostSetConfigType;
> >>>>
> >>>> +typedef enum VhostDeviceStateDirection {
> >>>> +    /* Transfer state from back-end (device) to front-end */
> >>>> +    VHOST_TRANSFER_STATE_DIRECTION_SAVE =3D 0,
> >>>> +    /* Transfer state from front-end to back-end (device) */
> >>>> +    VHOST_TRANSFER_STATE_DIRECTION_LOAD =3D 1,
> >>>> +} VhostDeviceStateDirection;
> >>>> +
> >>>> +typedef enum VhostDeviceStatePhase {
> >>>> +    /* The device (and all its vrings) is stopped */
> >>>> +    VHOST_TRANSFER_STATE_PHASE_STOPPED =3D 0,
> >>>> +} VhostDeviceStatePhase;
> >>> vDPA has:
> >>>
> >>>     /* Suspend a device so it does not process virtqueue requests any=
more
> >>>      *
> >>>      * After the return of ioctl the device must preserve all the nec=
essary state
> >>>      * (the virtqueue vring base plus the possible device specific st=
ates) that is
> >>>      * required for restoring in the future. The device must not chan=
ge its
> >>>      * configuration after that point.
> >>>      */
> >>>     #define VHOST_VDPA_SUSPEND      _IO(VHOST_VIRTIO, 0x7D)
> >>>
> >>>     /* Resume a device so it can resume processing virtqueue requests
> >>>      *
> >>>      * After the return of this ioctl the device will have restored a=
ll the
> >>>      * necessary states and it is fully operational to continue proce=
ssing the
> >>>      * virtqueue descriptors.
> >>>      */
> >>>     #define VHOST_VDPA_RESUME       _IO(VHOST_VIRTIO, 0x7E)
> >>>
> >>> I wonder if it makes sense to import these into vhost-user so that th=
e
> >>> difference between kernel vhost and vhost-user is minimized. It's oka=
y
> >>> if one of them is ahead of the other, but it would be nice to avoid
> >>> overlapping/duplicated functionality.
> >>>
> >>> (And I hope vDPA will import the device state vhost-user messages
> >>> introduced in this series.)
> >> I don=E2=80=99t understand your suggestion.  (Like, I very simply don=
=E2=80=99t
> >> understand :))
> >>
> >> These are vhost messages, right?  What purpose do you have in mind for
> >> them in vhost-user for internal migration?  They=E2=80=99re different =
from the
> >> state transfer messages, because they don=E2=80=99t transfer state to/=
from the
> >> front-end.  Also, the state transfer stuff is supposed to be distinct
> >> from starting/stopping the device; right now, it just requires the
> >> device to be stopped beforehand (or started only afterwards).  And in
> >> the future, new VhostDeviceStatePhase values may allow the messages to
> >> be used on devices that aren=E2=80=99t stopped.
> >>
> >> So they seem to serve very different purposes.  I can imagine using th=
e
> >> VDPA_{SUSPEND,RESUME} messages for external migration (what Anton is
> >> working on), but they don=E2=80=99t really help with internal migratio=
n
> >> implemented here.  If I were to add them, they=E2=80=99d just be sent =
in
> >> addition to the new messages added in this patch here, i.e. SUSPEND on
> >> the source before SET_DEVICE_STATE_FD, and RESUME on the destination
> >> after CHECK_DEVICE_STATE (we could use RESUME in place of
> >> CHECK_DEVICE_STATE on the destination, but we can=E2=80=99t do that on=
 the
> >> source, so we still need CHECK_DEVICE_STATE).
> > Yes, they are complementary to the device state fd message. I want to
> > make sure pre-conditions about the device's state (running vs stopped)
> > already take into account the vDPA SUSPEND/RESUME model.
> >
> > vDPA will need device state save/load in the future. For virtiofs
> > devices, for example. This is why I think we should plan for vDPA and
> > vhost-user to share the same interface.
>
> While the paragraph below is more important, I don=E2=80=99t feel like th=
is
> would be important right now.  It=E2=80=99s clear that SUSPEND must come =
before
> transferring any state, and that RESUME must come after transferring
> state.  I don=E2=80=99t think we need to clarify this now, it=E2=80=99d b=
e obvious when
> implementing SUSPEND/RESUME.
>
> > Also, I think the code path you're relying on (vhost_dev_stop()) on
> > doesn't work for backends that implement VHOST_USER_PROTOCOL_F_STATUS
> > because stopping the backend resets the device and throws away its
> > state. SUSPEND/RESUME solve this. This looks like a more general
> > problem since vhost_dev_stop() is called any time the VM is paused.
> > Maybe it needs to use SUSPEND/RESUME whenever possible.
>
> That=E2=80=99s a problem.  Quite a problem, to be honest, because this so=
unds
> rather complicated with honestly absolutely no practical benefit right
> now.
>
> Would you require SUSPEND/RESUME for state transfer even if the back-end
> does not implement GET/SET_STATUS?  Because then this would also lead to
> more complexity in virtiofsd.
>
> Basically, what I=E2=80=99m hearing is that I need to implement a differe=
nt
> feature that has no practical impact right now, and also fix bugs around
> it along the way...

Eugenio's input regarding the design of the vhost-user messages is
important. That way we know it can be ported to vDPA later.

There is some extra discussion and work here, but only on the design
of the interface. You shouldn't need to implement extra unused stuff.
Whoever needs it can do that later based on a design that left room to
eventually do iterative migration for vhost-user and vDPA (comparable
to VFIO's migration interface).

Since both vDPA (vhost kernel) and vhost-user are stable APIs, it will
be hard to make significant design changes later without breaking all
existing implementations. That's why I think we should think ahead.

Stefan

