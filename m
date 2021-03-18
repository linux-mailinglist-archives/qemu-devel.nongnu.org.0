Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D70234052A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 13:08:57 +0100 (CET)
Received: from localhost ([::1]:60780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMrSS-0004aO-8c
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 08:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lMrOg-0002Tw-0K
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 08:05:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lMrOb-0005KX-2k
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 08:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616069095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hpfeTeRdlPF3EIHPqcDnLt+I1neJwlPZZIBRf0R+Qjw=;
 b=ODdR5NlleRQ2aakHTjsN23nh0CumZm3wKDrOXDiqX9m2zpEp1yVXulV647Qd0VsBU3kzFh
 fhY/hwD8yFF7GFFD1y1xv3AY+fY6BSLoW6geBMpHxjVBtz1DlN8WHy3ChI6EaTKtrB22m8
 QFCxOMsvd3U1Azl7vRWY8DUhBMko4vs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-GiYk9ydqND2DVAMnDcFxww-1; Thu, 18 Mar 2021 08:04:53 -0400
X-MC-Unique: GiYk9ydqND2DVAMnDcFxww-1
Received: by mail-qk1-f197.google.com with SMTP id c7so31416321qka.6
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 05:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hpfeTeRdlPF3EIHPqcDnLt+I1neJwlPZZIBRf0R+Qjw=;
 b=OtBkjWxwrKNoSkn2apEqgKLP6czB5YH8GVaYxhbMa/PoDSvi0yW5zv8RlDEGzni9z2
 Ycbz2kFZk8VWzOgXHo/ryBfE6hdGAzUyDf7jDEYLp27JNjdWDSWYy1FgzWcbxFw3HQME
 U78OOMSSxzIBfbIcpkcXTn8lwhwrGsnV6NNlszfjOGmxrKuy1blo14l3iJF5BWxT+DN1
 /VIVNAdlUr1N2hCkDcW6MCeA2bKFOLJyKv3y2o/WLFlDO3qej4IYP/EeatCku6h6Xu/m
 gaihc5yUIvGuhgQ3cqo+OthlDl7ml5aqJVzeCAsbVgfISyqq/HHUo2UTeuX3QEwVCjnL
 fl2g==
X-Gm-Message-State: AOAM531bX27k+w4OYSmDu3fAVEl0lIQlnl5jgxOL1O4zqZ421JJJPBGc
 Ei+q0JTYAohcb793GE2X8G3vDFSDNV4lughaPAvZX16tgmHvLirv9ld2qqiz8xfPZhaEw0OmQnl
 tibRYtZDYxf/Y9zBt5fh9Lyq7ujbbLPc=
X-Received: by 2002:a0c:d843:: with SMTP id i3mr3872616qvj.16.1616069092751;
 Thu, 18 Mar 2021 05:04:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDY1fFtoM7ChDeSrsMFu7LJyc7YZP+vGrlp4PmI/T6yaJOZZHNj/sRiSlAnKbpbb8FZGZcZPw7yxM+8fhA64o=
X-Received: by 2002:a0c:d843:: with SMTP id i3mr3872575qvj.16.1616069092214;
 Thu, 18 Mar 2021 05:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210315194842.277740-1-eperezma@redhat.com>
 <20210315194842.277740-6-eperezma@redhat.com>
 <23e492d1-9e86-20d3-e2b3-b3d7c8c6da9c@redhat.com>
 <CAJaqyWf6Vec1B+ybHdHoUVOG8Ga8hO0=ub8eVou+S0PfgyW+2A@mail.gmail.com>
 <2a64dae7-a1db-53b2-413d-45225d8653ca@redhat.com>
 <CAJaqyWfkUTVyzMrGg_S6sCtAU+PD=zAjDsr3EdYvPa+fLutrhA@mail.gmail.com>
 <ac53f914-ffd3-3d16-b05d-c2d6e4c53cff@redhat.com>
 <CAJaqyWd-vcXJ7RdZn=cSM+JeOxvk7hzpWjpcsYccfAuKkBEeZg@mail.gmail.com>
 <d676c5b7-1e0b-54f6-1461-17b162f9d3b6@redhat.com>
 <CAJaqyWfzgnbxiNGq6pTrp5H6ZVVv0XX0EFKYntYFT+h+d6eh0w@mail.gmail.com>
In-Reply-To: <CAJaqyWfzgnbxiNGq6pTrp5H6ZVVv0XX0EFKYntYFT+h+d6eh0w@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 18 Mar 2021 13:04:15 +0100
Message-ID: <CAJaqyWcBnYvffs2ksBsgmuEvtvs+4sJycin9_=ZFyCeR=qVUGw@mail.gmail.com>
Subject: Re: [RFC v2 05/13] vhost: Route guest->host notification through
 shadow virtqueue
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Guru Prasad <guru.prasad@broadcom.com>, Juan Quintela <quintela@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 18, 2021 at 11:48 AM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Thu, Mar 18, 2021 at 10:29 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2021/3/18 =E4=B8=8B=E5=8D=885:18, Eugenio Perez Martin =E5=86=
=99=E9=81=93:
> > > On Thu, Mar 18, 2021 at 4:11 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > >>
> > >> =E5=9C=A8 2021/3/18 =E4=B8=8A=E5=8D=8812:47, Eugenio Perez Martin =
=E5=86=99=E9=81=93:
> > >>> On Wed, Mar 17, 2021 at 3:05 AM Jason Wang <jasowang@redhat.com> wr=
ote:
> > >>>> =E5=9C=A8 2021/3/16 =E4=B8=8B=E5=8D=886:31, Eugenio Perez Martin =
=E5=86=99=E9=81=93:
> > >>>>> On Tue, Mar 16, 2021 at 8:18 AM Jason Wang <jasowang@redhat.com> =
wrote:
> > >>>>>> =E5=9C=A8 2021/3/16 =E4=B8=8A=E5=8D=883:48, Eugenio P=C3=A9rez =
=E5=86=99=E9=81=93:
> > >>>>>>> Shadow virtqueue notifications forwarding is disabled when vhos=
t_dev
> > >>>>>>> stops, so code flow follows usual cleanup.
> > >>>>>>>
> > >>>>>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > >>>>>>> ---
> > >>>>>>>      hw/virtio/vhost-shadow-virtqueue.h |   7 ++
> > >>>>>>>      include/hw/virtio/vhost.h          |   4 +
> > >>>>>>>      hw/virtio/vhost-shadow-virtqueue.c | 113 +++++++++++++++++=
+++++-
> > >>>>>>>      hw/virtio/vhost.c                  | 143 +++++++++++++++++=
+++++++++++-
> > >>>>>>>      4 files changed, 265 insertions(+), 2 deletions(-)
> > >>>>>>>
> > >>>>>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vho=
st-shadow-virtqueue.h
> > >>>>>>> index 6cc18d6acb..c891c6510d 100644
> > >>>>>>> --- a/hw/virtio/vhost-shadow-virtqueue.h
> > >>>>>>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > >>>>>>> @@ -17,6 +17,13 @@
> > >>>>>>>
> > >>>>>>>      typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> > >>>>>>>
> > >>>>>>> +bool vhost_shadow_vq_start(struct vhost_dev *dev,
> > >>>>>>> +                           unsigned idx,
> > >>>>>>> +                           VhostShadowVirtqueue *svq);
> > >>>>>>> +void vhost_shadow_vq_stop(struct vhost_dev *dev,
> > >>>>>>> +                          unsigned idx,
> > >>>>>>> +                          VhostShadowVirtqueue *svq);
> > >>>>>>> +
> > >>>>>>>      VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev=
 *dev, int idx);
> > >>>>>>>
> > >>>>>>>      void vhost_shadow_vq_free(VhostShadowVirtqueue *vq);
> > >>>>>>> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhos=
t.h
> > >>>>>>> index ac963bf23d..7ffdf9aea0 100644
> > >>>>>>> --- a/include/hw/virtio/vhost.h
> > >>>>>>> +++ b/include/hw/virtio/vhost.h
> > >>>>>>> @@ -55,6 +55,8 @@ struct vhost_iommu {
> > >>>>>>>          QLIST_ENTRY(vhost_iommu) iommu_next;
> > >>>>>>>      };
> > >>>>>>>
> > >>>>>>> +typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> > >>>>>>> +
> > >>>>>>>      typedef struct VhostDevConfigOps {
> > >>>>>>>          /* Vhost device config space changed callback
> > >>>>>>>           */
> > >>>>>>> @@ -83,7 +85,9 @@ struct vhost_dev {
> > >>>>>>>          uint64_t backend_cap;
> > >>>>>>>          bool started;
> > >>>>>>>          bool log_enabled;
> > >>>>>>> +    bool shadow_vqs_enabled;
> > >>>>>>>          uint64_t log_size;
> > >>>>>>> +    VhostShadowVirtqueue **shadow_vqs;
> > >>>>>> Any reason that you don't embed the shadow virtqueue into
> > >>>>>> vhost_virtqueue structure?
> > >>>>>>
> > >>>>> Not really, it could be relatively big and I would prefer SVQ
> > >>>>> members/methods to remain hidden from any other part that include=
s
> > >>>>> vhost.h. But it could be changed, for sure.
> > >>>>>
> > >>>>>> (Note that there's a masked_notifier in struct vhost_virtqueue).
> > >>>>>>
> > >>>>> They are used differently: in SVQ the masked notifier is a pointe=
r,
> > >>>>> and if it's NULL the SVQ code knows that device is not masked. Th=
e
> > >>>>> vhost_virtqueue is the real owner.
> > >>>> Yes, but it's an example for embedding auxciliary data structures =
in the
> > >>>> vhost_virtqueue.
> > >>>>
> > >>>>
> > >>>>> It could be replaced by a boolean in SVQ or something like that, =
I
> > >>>>> experimented with a tri-state too (UNMASKED, MASKED, MASKED_NOTIF=
IED)
> > >>>>> and let vhost.c code to manage all the transitions. But I find cl=
earer
> > >>>>> the pointer use, since it's the more natural for the
> > >>>>> vhost_virtqueue_mask, vhost_virtqueue_pending existing functions.
> > >>>>>
> > >>>>> This masking/unmasking is the part I dislike the most from this
> > >>>>> series, so I'm very open to alternatives.
> > >>>> See below. I think we don't even need to care about that.
> > >>>>
> > >>>>
> > >>>>>>>          Error *migration_blocker;
> > >>>>>>>          const VhostOps *vhost_ops;
> > >>>>>>>          void *opaque;
> > >>>>>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vho=
st-shadow-virtqueue.c
> > >>>>>>> index 4512e5b058..3e43399e9c 100644
> > >>>>>>> --- a/hw/virtio/vhost-shadow-virtqueue.c
> > >>>>>>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > >>>>>>> @@ -8,9 +8,12 @@
> > >>>>>>>       */
> > >>>>>>>
> > >>>>>>>      #include "hw/virtio/vhost-shadow-virtqueue.h"
> > >>>>>>> +#include "hw/virtio/vhost.h"
> > >>>>>>> +
> > >>>>>>> +#include "standard-headers/linux/vhost_types.h"
> > >>>>>>>
> > >>>>>>>      #include "qemu/error-report.h"
> > >>>>>>> -#include "qemu/event_notifier.h"
> > >>>>>>> +#include "qemu/main-loop.h"
> > >>>>>>>
> > >>>>>>>      /* Shadow virtqueue to relay notifications */
> > >>>>>>>      typedef struct VhostShadowVirtqueue {
> > >>>>>>> @@ -18,14 +21,121 @@ typedef struct VhostShadowVirtqueue {
> > >>>>>>>          EventNotifier kick_notifier;
> > >>>>>>>          /* Shadow call notifier, sent to vhost */
> > >>>>>>>          EventNotifier call_notifier;
> > >>>>>>> +
> > >>>>>>> +    /*
> > >>>>>>> +     * Borrowed virtqueue's guest to host notifier.
> > >>>>>>> +     * To borrow it in this event notifier allows to register =
on the event
> > >>>>>>> +     * loop and access the associated shadow virtqueue easily.=
 If we use the
> > >>>>>>> +     * VirtQueue, we don't have an easy way to retrieve it.
> > >>>>>> So this is something that worries me. It looks like a layer viol=
ation
> > >>>>>> that makes the codes harder to work correctly.
> > >>>>>>
> > >>>>> I don't follow you here.
> > >>>>>
> > >>>>> The vhost code already depends on virtqueue in the same sense:
> > >>>>> virtio_queue_get_host_notifier is called on vhost_virtqueue_start=
. So
> > >>>>> if this behavior ever changes it is unlikely for vhost to keep wo=
rking
> > >>>>> without changes. vhost_virtqueue has a kick/call int where I thin=
k it
> > >>>>> should be stored actually, but they are never used as far as I se=
e.
> > >>>>>
> > >>>>> Previous RFC did rely on vhost_dev_disable_notifiers. From its do=
cumentation:
> > >>>>> /* Stop processing guest IO notifications in vhost.
> > >>>>>     * Start processing them in qemu.
> > >>>>>     ...
> > >>>>> But it was easier for this mode to miss a notification, since the=
y
> > >>>>> create a new host_notifier in virtio_bus_set_host_notifier right =
away.
> > >>>>> So I decided to use the file descriptor already sent to vhost in
> > >>>>> regular operation mode, so guest-related resources change less.
> > >>>>>
> > >>>>> Having said that, maybe it's useful to assert that
> > >>>>> vhost_dev_{enable,disable}_notifiers are never called on shadow
> > >>>>> virtqueue mode. Also, it could be useful to retrieve it from
> > >>>>> virtio_bus, not raw shadow virtqueue, so all get/set are performe=
d
> > >>>>> from it. Would that make more sense?
> > >>>>>
> > >>>>>> I wonder if it would be simpler to start from a vDPA dedicated s=
hadow
> > >>>>>> virtqueue implementation:
> > >>>>>>
> > >>>>>> 1) have the above fields embeded in vhost_vdpa structure
> > >>>>>> 2) Work at the level of
> > >>>>>> vhost_vdpa_set_vring_kick()/vhost_vdpa_set_vring_call()
> > >>>>>>
> > >>>>> This notifier is never sent to the device in shadow virtqueue mod=
e.
> > >>>>> It's for SVQ to react to guest's notifications, registering it on=
 its
> > >>>>> main event loop [1]. So if I perform these changes the way I
> > >>>>> understand them, SVQ would still rely on this borrowed EventNotif=
ier,
> > >>>>> and it would send to the vDPA device the newly created kick_notif=
ier
> > >>>>> of VhostShadowVirtqueue.
> > >>>> The point is that vhost code should be coupled loosely with virtio=
. If
> > >>>> you try to "borrow" EventNotifier from virtio, you need to deal wi=
th a
> > >>>> lot of synchrization. An exampleis the masking stuffs.
> > >>>>
> > >>> I still don't follow this, sorry.
> > >>>
> > >>> The svq->host_notifier event notifier is not affected by the maskin=
g
> > >>> issue, it is completely private to SVQ. This commit creates and use=
s
> > >>> it, and nothing related to masking is touched until the next commit=
.
> > >>>
> > >>>>>> Then the layer is still isolated and you have a much simpler con=
text to
> > >>>>>> work that you don't need to care a lot of synchornization:
> > >>>>>>
> > >>>>>> 1) vq masking
> > >>>>> This EventNotifier is not used for masking, it does not change fr=
om
> > >>>>> the start of the shadow virtqueue operation through its end. Call=
 fd
> > >>>>> sent to vhost/vdpa device does not change either in shadow virtqu=
eue
> > >>>>> mode operation with masking/unmasking. I will try to document it
> > >>>>> better.
> > >>>>>
> > >>>>> I think that we will need to handle synchronization with
> > >>>>> masking/unmasking from the guest and dynamically enabling SVQ
> > >>>>> operation mode, since they can happen at the same time as long as=
 we
> > >>>>> let the guest run. There may be better ways of synchronizing them=
 of
> > >>>>> course, but I don't see how moving to the vhost-vdpa backend help=
s
> > >>>>> with this. Please expand if I've missed it.
> > >>>>>
> > >>>>> Or do you mean to forbid regular <-> SVQ operation mode transitio=
ns and delay it
> > >>>>> to future patchsets?
> > >>>> So my idea is to do all the shadow virtqueue in the vhost-vDPA cod=
es and
> > >>>> hide them from the upper layers like virtio. This means it works a=
t
> > >>>> vhost level which can see vhost_vring_file only. When enalbed, wha=
t it
> > >>>> needs is just:
> > >>>>
> > >>>> 1) switch to use svq kickfd and relay ioeventfd to svq kickfd
> > >>>> 2) switch to use svq callfd and relay svq callfd to irqfd
> > >>>>
> > >>>> It will still behave like a vhost-backend that the switching is do=
ne
> > >>>> internally in vhost-vDPA which is totally transparent to the virti=
o
> > >>>> codes of Qemu.
> > >>>>
> > >>>> E.g:
> > >>>>
> > >>>> 1) in the case of guest notifier masking, we don't need to do anyt=
hing
> > >>>> since virtio codes will replace another irqfd for us.
> > >>> Assuming that we don't modify vhost masking code, but send shadow
> > >>> virtqueue call descriptor to the vhost device:
> > >>>
> > >>> If guest virtio code mask the virtqueue and replaces the vhost-vdpa
> > >>> device call fd (VhostShadowVirtqueue.call_notifier in the next comm=
it,
> > >>> or the descriptor in your previous second point, svq callfd) with t=
he
> > >>> masked notifier, vhost_shadow_vq_handle_call will not be called
> > >>> anymore, and no more used descriptors will be forwarded. They will =
be
> > >>> stuck if the shadow virtqueue forever. Guest itself cannot recover
> > >>> from this situation, since a masking will set irqfd, not SVQ call f=
d.
> > >>
> > >> Just to make sure we're in the same page. During vq masking, the vir=
tio
> > >> codes actually use the masked_notifier as callfd in vhost_virtqueue_=
mask():
> > >>
> > >>       if (mask) {
> > >>           assert(vdev->use_guest_notifier_mask);
> > >>           file.fd =3D event_notifier_get_fd(&hdev->vqs[index].masked=
_notifier);
> > >>       } else {
> > >>       file.fd =3D event_notifier_get_fd(virtio_queue_get_guest_notif=
ier(vvq));
> > >>       }
> > >>
> > >>       file.index =3D hdev->vhost_ops->vhost_get_vq_index(hdev, n);
> > >>       r =3D hdev->vhost_ops->vhost_set_vring_call(hdev, &file);
> > >>
> > >> So consider the shadow virtqueue in done at vhost-vDPA. We just need=
 to
> > >> make sure
> > >>
> > >> 1) update the callfd which passed by virtio layer via set_vring_kick=
()
> > >> 2) always write to the callfd during vhost_shadow_vq_handle_call()
> > >>
> > >> Then
> > >>
> > >> 3) When shadow vq is enabled, we just set the callfd of shadow virtq=
ueue
> > >> to vDPA via VHOST_SET_VRING_CALL, and poll the svq callfd
> > >> 4) When shadow vq is disabled, we just set the callfd that is passed=
 by
> > >> virtio via VHOST_SET_VRING_CALL, stop poll the svq callfd
> > >>
> > >> So you can see in step 2 and 4, we don't need to know whether or not=
 the
> > >> vq is masked since we follow the vhost protocol "VhostOps" and do
> > >> everyhing transparently in the vhost-(vDPA) layer.
> > >>
> > > All of this assumes that we can enable/disable SVQ dynamically while
> > > the device is running. If it's not the case, there is no need for the
> > > mutex neither in vhost.c code nor vdpa_backend.
> > >
> > > As I see it, the issue is that step (2) and (4) happens in different
> > > threads: (2) is in vCPU vmexit, and (4) is in main event loop.
> > > Consider unmasking and disabling SVQ at the same time with no mutex:
> > >
> > > vCPU vmexit thread                     aio thread
> > > (unmask)                               (stops SVQ)
> > > |                                      |
> > > |                                      // Last callfd set was masked_=
notifier
> > > |                                      vdpa_backend.callfd =3D \
> > > |                                              atomic_read(masked_not=
ifier).
> > > |                                      |
> > > vhost_set_vring_call(vq.guest_notifier)|
> > > -> vdpa_backend.callfd =3D \             |
> > >             vq.guest_notifier           |
> > > |                                      |
> > > |                                      ioctl(vdpa,
> > > VHOST_SET_VRING_CALL, vdpa_backend.callfd)
> > > |
> > > // guest expects more interrupts, but
> > > // device just set masked
> > >
> > > And vhost_set_vring_call could happen entirely even while ioctl is
> > > being executed.
> > >
> > > So that is the reason for the mutex: vdpa_backend.call_fd and the
> > > ioctl VHOST_SET_VRING_CALL must be serialized. I'm ok with moving to
> > > vdpa backend, but it's the same code, just in vdpa_backend.c instead
> > > of vhost.c, so it becomes less generic in my opinion.
> >
> >
> > You are right. But let's consider if we can avoid the dedicated mutex.
> >
> > E.g can we use the BQL, bascially we need to synchronizae with iothread=
.
> >
> > Or is it possible to schedule bh then things are serailzied automatical=
ly?
> >
>
> I tried RCU with no success, and I think the same issues apply to bh.
> I will try to explain the best I can what I achieved in the past, and
> why I discarded it. I will explore BQL approaches, it could be simpler
> that way actually.
>
> The hard part to achieve if that no notification can be forwarded to
> the guest once masking vmexit returns (isn't it?). Unmasking scenario
> is easy with RCU, since the pending notification could reach the guest
> asynchronously if it exists.
>
> On the other hand, whatever guest set should take priority over
> whatever shadow_vq_stop sets.
>
> With RCU, the problem is that the synchronization point should be the
> vmexit thread. The function vhost_virtqueue_mask is already called
> within RCU, so it could happen that RCU lock is held longer than it
> returns, so the effective masking could happen after vmexit returns. I
> see no way to make something like "call_rcu but only in this thread"
> or, in other words, " rcu_synchronize after the rcu_unlock of this
> thread and then run this".
>
> I tried to explore to synchronize that situation in the event loop,
> but the guest is able to call unmask/mask again, making the race
> condition. If I can mark a range where unmask/mask cannot return, I'm
> creating an artificial mutex. If I retry in the main event loop, there
> is a window where notification can reach the guest after masking.
>
> In order to reduce this window, shadow_virtqueue_stop could set the
> masked notifier fd unconditionally, and then check if it should unmask
> under the mutex. I'm not sure if this is worth however, since
> enabling/disabling already involves a system call.
>
> I think it would be way more natural to at least protect
> vhost_virtqueue.notifier_is_masked with the BQL, however, so I will
> check that possibility. It would be great to be able to do it on bh,
> but I think this opens a window for the host to send notifications
> when the guest has masked the vq, since mask/unmasking could happen
> while bh is running as far as I see.
>

So actually vhost_shadow_virtqueue_start/stop (being a QMP command)
and vhost_virtqueue_mask (vmexit) already runs under BQL.

The ideal scenario would be to run kick/call handlers in its own aio
context and do not take BQL on them, but I think this is doable with
just atomics and maybe events. For this series I think we can delete
the introduced mutex (and maybe replace it with an assertion?)

Thanks!

> Actually, in my test I override vhost_virtqueue_mask, so it looks more
> similar to your proposal with VhostOps.
>
> Thanks!
>
> >
> > >
> > >>>> 2) easily to deal with vhost dev start and stop
> > >>>>
> > >>>> The advantages are obvious, simple and easy to implement.
> > >>>>
> > >>> I still don't see how performing this step from backend code avoids
> > >>> the synchronization problem, since they will be done from different
> > >>> threads anyway. Not sure what piece I'm missing.
> > >>
> > >> See my reply in another thread. If you enable the shadow virtqueue v=
ia a
> > >> OOB monitor that's a real issue.
> > >>
> > >> But I don't think we need to do that since
> > >>
> > >> 1) SVQ should be transparnet to management
> > >> 2) unncessary synchronization issue
> > >>
> > >> We can enable the shadow virtqueue through cli, new parameter with
> > >> vhost-vdpa probably. Then we don't need to care about threads. And i=
n
> > >> the final version with full live migration support, the shadow virtq=
ueue
> > >> should be enabled automatically. E.g for the device without
> > >> VHOST_F_LOG_ALL or we can have a dedicated capability of vDPA via
> > >> VHOST_GET_BACKEND_FEATURES.
> > >>
> > > It should be enabled automatically in those condition, but it also
> > > needs to be dynamic, and only be active during migration. Otherwise,
> > > guest should use regular vdpa operation. The problem with masking is
> > > the same if we enable with QMP or because live migration event.
> > >
> > > So we will have the previous synchronization problem sooner or later.
> > > If we omit the rollback to regular vdpa operation (in other words,
> > > disabling SVQ), code can be simplified, but I'm not sure if that is
> > > desirable.
> >
> >
> > Rgiht, so I'm ok to have the synchronziation from the start if you wish=
.
> >
> > But we need to figure out what to synchronize and how to do synchronize=
.
> >
> > THanks
> >
> >
> > >
> > > Thanks!
> > >
> > >> Thanks
> > >>
> > >>
> > >>> I can see / tested a few solutions but I don't like them a lot:
> > >>>
> > >>> * Forbid hot-swapping from/to shadow virtqueue mode, and set it fro=
m
> > >>> cmdline: We will have to deal with setting the SVQ mode dynamically
> > >>> sooner or later if we want to use it for live migration.
> > >>> * Forbid coming back to regular mode after switching to shadow
> > >>> virtqueue mode: The heavy part of the synchronization comes from sv=
q
> > >>> stopping code, since we need to serialize the setting of device cal=
l
> > >>> fd. This could be acceptable, but I'm not sure about the implicatio=
ns:
> > >>> What happens if live migration fails and we need to step back? A mu=
tex
> > >>> is not needed in this scenario, it's ok with atomics and RCU code.
> > >>>
> > >>> * Replace KVM_IRQFD instead and let SVQ poll the old one and masked
> > >>> notifier: I haven't thought a lot of this one, I think it's better =
to
> > >>> not touch guest notifiers.
> > >>> * Monitor also masked notifier from SVQ: I think this could be
> > >>> promising, but SVQ needs to be notified about masking/unmasking
> > >>> anyway, and there is code that depends on checking the masked notif=
ier
> > >>> for the pending notification.
> > >>>
> > >>>>>> 2) vhost dev start and stop
> > >>>>>>
> > >>>>>> ?
> > >>>>>>
> > >>>>>>
> > >>>>>>> +     *
> > >>>>>>> +     * So shadow virtqueue must not clean it, or we would lose=
 VirtQueue one.
> > >>>>>>> +     */
> > >>>>>>> +    EventNotifier host_notifier;
> > >>>>>>> +
> > >>>>>>> +    /* Virtio queue shadowing */
> > >>>>>>> +    VirtQueue *vq;
> > >>>>>>>      } VhostShadowVirtqueue;
> > >>>>>>>
> > >>>>>>> +/* Forward guest notifications */
> > >>>>>>> +static void vhost_handle_guest_kick(EventNotifier *n)
> > >>>>>>> +{
> > >>>>>>> +    VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowV=
irtqueue,
> > >>>>>>> +                                             host_notifier);
> > >>>>>>> +
> > >>>>>>> +    if (unlikely(!event_notifier_test_and_clear(n))) {
> > >>>>>>> +        return;
> > >>>>>>> +    }
> > >>>>>>> +
> > >>>>>>> +    event_notifier_set(&svq->kick_notifier);
> > >>>>>>> +}
> > >>>>>>> +
> > >>>>>>> +/*
> > >>>>>>> + * Restore the vhost guest to host notifier, i.e., disables sv=
q effect.
> > >>>>>>> + */
> > >>>>>>> +static int vhost_shadow_vq_restore_vdev_host_notifier(struct v=
host_dev *dev,
> > >>>>>>> +                                                     unsigned =
vhost_index,
> > >>>>>>> +                                                     VhostShad=
owVirtqueue *svq)
> > >>>>>>> +{
> > >>>>>>> +    EventNotifier *vq_host_notifier =3D virtio_queue_get_host_=
notifier(svq->vq);
> > >>>>>>> +    struct vhost_vring_file file =3D {
> > >>>>>>> +        .index =3D vhost_index,
> > >>>>>>> +        .fd =3D event_notifier_get_fd(vq_host_notifier),
> > >>>>>>> +    };
> > >>>>>>> +    int r;
> > >>>>>>> +
> > >>>>>>> +    /* Restore vhost kick */
> > >>>>>>> +    r =3D dev->vhost_ops->vhost_set_vring_kick(dev, &file);
> > >>>>>>> +    return r ? -errno : 0;
> > >>>>>>> +}
> > >>>>>>> +
> > >>>>>>> +/*
> > >>>>>>> + * Start shadow virtqueue operation.
> > >>>>>>> + * @dev vhost device
> > >>>>>>> + * @hidx vhost virtqueue index
> > >>>>>>> + * @svq Shadow Virtqueue
> > >>>>>>> + */
> > >>>>>>> +bool vhost_shadow_vq_start(struct vhost_dev *dev,
> > >>>>>>> +                           unsigned idx,
> > >>>>>>> +                           VhostShadowVirtqueue *svq)
> > >>>>>> It looks to me this assumes the vhost_dev is started before
> > >>>>>> vhost_shadow_vq_start()?
> > >>>>>>
> > >>>>> Right.
> > >>>> This might not true. Guest may enable and disable virtio drivers a=
fter
> > >>>> the shadow virtqueue is started. You need to deal with that.
> > >>>>
> > >>> Right, I will test this scenario.
> > >>>
> > >>>> Thanks
> > >>>>
> >


