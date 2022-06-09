Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03FB544498
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 09:18:34 +0200 (CEST)
Received: from localhost ([::1]:35962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzCR6-0003Ar-0T
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 03:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nzCMX-0002Dm-QH
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 03:13:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nzCMV-0004jU-7p
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 03:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654758826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UYtrF7yXvE2BKs+WYOCkoqW6PHv/X1reARlW7p2sEHA=;
 b=OVS+HG0fFqcjObSX/X2I6fuVZGedrHjcxSwoR63Y4hq3FLUKS1eYYrcVZoX80V0sbe5GC5
 fAjyqq8T4AdePUSadV/xhdFZ+kSTxmjxUN7ue4qhSll7iI+FM8avYGF/L3QZlRnRZw2NEL
 hdAPt5bl4OIyGntCTjW1oaQTdXOwYPs=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-ELjhTtT_MYCvPWbX1iqZPw-1; Thu, 09 Jun 2022 03:13:44 -0400
X-MC-Unique: ELjhTtT_MYCvPWbX1iqZPw-1
Received: by mail-lf1-f70.google.com with SMTP id
 w38-20020a0565120b2600b0047a030077edso1690482lfu.18
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 00:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UYtrF7yXvE2BKs+WYOCkoqW6PHv/X1reARlW7p2sEHA=;
 b=qo0kY/J3nHsB/Q5N1U8LNxuT9042GC5L6WaLcQNDCoCGWf5EWED4WazZxMCORYSmee
 sFZ7FxFG0je68dq9s5wnuXUoj+zfk10fxOjZESB8y7SUQ5BXz7QrKGnv/OHd/e4JslR3
 p1dY8vWR6xWVPgQb9mhjR7wQdavV+RKgzVkZxu3KIeWT7Dh2H5HSBjZu6t3E3Mt8UFu6
 61Y2ecIJ5u3GLkhKXBRFlh+f0ofE2N/IZXB85RpO9L03DWHsLRmUqs1oerzS7qOvleD1
 DNsvcMqZHA5bT7Xd/rPCVRL54rikjzq4wIQR7EI2eHRLTmkdwMUKRuuLkGDFnR0RpHoK
 i4iA==
X-Gm-Message-State: AOAM532fBuCw37154lncptKLIxS9r9RxGuHn6MV1KqfPSzPM6R4eC70z
 8AHx6JAq+yyqeV7kvFg9XRAZY32FBoU/j7Mkqe0eOaYj1RUXQvg5tGNg4R70tVve1wv0DSNoWkb
 3WRHOrHeVrbnGYyjWOJMYyFRAbTOt41g=
X-Received: by 2002:a05:6512:3501:b0:478:c864:8537 with SMTP id
 h1-20020a056512350100b00478c8648537mr24659556lfs.442.1654758823351; 
 Thu, 09 Jun 2022 00:13:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5pucQWqfQR5N7/qj1TE+5Oyrvil8/T3l1SOKGq6zywIDAyST2bdtSgq56eieCK6toAcPcKOd9Xb9cVSSEFDg=
X-Received: by 2002:a05:6512:3501:b0:478:c864:8537 with SMTP id
 h1-20020a056512350100b00478c8648537mr24659527lfs.442.1654758823016; Thu, 09
 Jun 2022 00:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220519191306.821774-1-eperezma@redhat.com>
 <20220519191306.821774-15-eperezma@redhat.com>
 <7a8468b5-f709-4b74-cbe3-8e87b257e41c@redhat.com>
 <CAJaqyWcidiP+YsOnh6LN4_AKFfxtjbSUDVOuMe9jFuJ1go_zeg@mail.gmail.com>
In-Reply-To: <CAJaqyWcidiP+YsOnh6LN4_AKFfxtjbSUDVOuMe9jFuJ1go_zeg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 9 Jun 2022 15:13:31 +0800
Message-ID: <CACGkMEujs3Zzu16tk+A8D8_qqAbPGT2Nm7Cfz5DZEG9qECyd6A@mail.gmail.com>
Subject: Re: [RFC PATCH v8 14/21] vhost: Make possible to check for device
 exclusive vq group
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Eric Blake <eblake@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 9, 2022 at 3:22 AM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Wed, Jun 8, 2022 at 6:25 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2022/5/20 03:12, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > > CVQ needs to be in its own group, not shared with any data vq. Enable
> > > the checking of it here, before introducing address space id concepts=
.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >   include/hw/virtio/vhost.h |  2 +
> > >   hw/net/vhost_net.c        |  4 +-
> > >   hw/virtio/vhost-vdpa.c    | 79 ++++++++++++++++++++++++++++++++++++=
++-
> > >   hw/virtio/trace-events    |  1 +
> > >   4 files changed, 84 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> > > index b291fe4e24..cebec1d817 100644
> > > --- a/include/hw/virtio/vhost.h
> > > +++ b/include/hw/virtio/vhost.h
> > > @@ -84,6 +84,8 @@ struct vhost_dev {
> > >       int vq_index_end;
> > >       /* if non-zero, minimum required value for max_queues */
> > >       int num_queues;
> > > +    /* Must be a vq group different than any other vhost dev */
> > > +    bool independent_vq_group;
> >
> >
> > We probably need a better abstraction here.
> >
> > E.g having a parent vhost_dev_group structure.
> >
>
> I think there is room for improvement too, but to make this work we
> don't need the device model to know all the other devices at this
> moment. I'm open to implementing it if we decide that solution is more
> maintainable or whatever other reason though.

I see, so let's keep it as is and do the enhancement in the future.

>
> >
> > >       uint64_t features;
> > >       uint64_t acked_features;
> > >       uint64_t backend_features;
> > > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > > index ccac5b7a64..1c2386c01c 100644
> > > --- a/hw/net/vhost_net.c
> > > +++ b/hw/net/vhost_net.c
> > > @@ -339,14 +339,16 @@ int vhost_net_start(VirtIODevice *dev, NetClien=
tState *ncs,
> > >       }
> > >
> > >       for (i =3D 0; i < nvhosts; i++) {
> > > +        bool cvq_idx =3D i >=3D data_queue_pairs;
> > >
> > > -        if (i < data_queue_pairs) {
> > > +        if (!cvq_idx) {
> > >               peer =3D qemu_get_peer(ncs, i);
> > >           } else { /* Control Virtqueue */
> > >               peer =3D qemu_get_peer(ncs, n->max_queue_pairs);
> > >           }
> > >
> > >           net =3D get_vhost_net(peer);
> > > +        net->dev.independent_vq_group =3D !!cvq_idx;
> > >           vhost_net_set_vq_index(net, i * 2, index_end);
> > >
> > >           /* Suppress the masking guest notifiers on vhost user
> > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > index eec6d544e9..52dd8baa8d 100644
> > > --- a/hw/virtio/vhost-vdpa.c
> > > +++ b/hw/virtio/vhost-vdpa.c
> > > @@ -685,7 +685,8 @@ static int vhost_vdpa_set_backend_cap(struct vhos=
t_dev *dev)
> > >   {
> > >       uint64_t features;
> > >       uint64_t f =3D 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
> > > -        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH;
> > > +        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
> > > +        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID;
> > >       int r;
> > >
> > >       if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)=
) {
> > > @@ -1110,6 +1111,78 @@ static bool vhost_vdpa_svqs_stop(struct vhost_=
dev *dev)
> > >       return true;
> > >   }
> > >
> > > +static int vhost_vdpa_get_vring_group(struct vhost_dev *dev,
> > > +                                      struct vhost_vring_state *stat=
e)
> > > +{
> > > +    int ret =3D vhost_vdpa_call(dev, VHOST_VDPA_GET_VRING_GROUP, sta=
te);
> > > +    trace_vhost_vdpa_get_vring_group(dev, state->index, state->num);
> > > +    return ret;
> > > +}
> > > +
> > > +static bool vhost_dev_is_independent_group(struct vhost_dev *dev)
> > > +{
> > > +    struct vhost_vdpa *v =3D dev->opaque;
> > > +    struct vhost_vring_state this_vq_group =3D {
> > > +        .index =3D dev->vq_index,
> > > +    };
> > > +    int ret;
> > > +
> > > +    if (!(dev->backend_cap & VHOST_BACKEND_F_IOTLB_ASID)) {
> > > +        return true;
> > > +    }
> >
> >
> > This should be false?
> >
> >
> > > +
> > > +    if (!v->shadow_vqs_enabled) {
> > > +        return true;
> > > +    }
> >
> >
> > And here?
> >
>
> They're true so it doesn't get in the middle if the device already
> knows there is no need to check vhost_dev for an independent group.

I'm not sure I understand this.

Without ASID but with MQ, we know all vhost_devs are not independent.

>
> With recent mq changes, I think I can delete these checks and move
> them to net/vhost-vdpa.
>
> >
> > > +
> > > +    ret =3D vhost_vdpa_get_vring_group(dev, &this_vq_group);
> > > +    if (unlikely(ret)) {
> > > +        goto call_err;
> > > +    }
> > > +
> > > +    for (int i =3D 1; i < dev->nvqs; ++i) {
> > > +        struct vhost_vring_state vq_group =3D {
> > > +            .index =3D dev->vq_index + i,
> > > +        };
> > > +
> > > +        ret =3D vhost_vdpa_get_vring_group(dev, &vq_group);
> > > +        if (unlikely(ret)) {
> > > +            goto call_err;
> > > +        }
> > > +        if (unlikely(vq_group.num !=3D this_vq_group.num)) {
> > > +            error_report("VQ %d group is different than VQ %d one",
> > > +                         this_vq_group.index, vq_group.index);
> >
> >
> > Not sure this is needed. The group id is not tied to vq index if I
> > understand correctly.
> >
> > E.g we have 1 qp with cvq, we can have
> >
> > group 0 cvq
> >
> > group 1 tx/rx
> >
>
> This function is severly undocumented, thanks for pointing out :).
>
> It checks if the virtqueues that belong to this vhost_dev does not
> share vq group with any other virtqueue in the device. We need to
> check it at device startup, since cvq index changes depending on _F_MQ
> negotiated.
>
> Since we're going to check all other virtqueues, we don't need to know
> other vhost_dev individually: We know the set of vqs to check is all
> vqs but our vhost_dev one.
>
> Does it make it more clear?

Kind of, but

We make independent_vq_group to be true for cvq unconditionally, and
check other vhost_dev during start. This seems less optimal. Any
reason we do all of the logic during net_inti_vhost_vdpa()?

E.g we can get and set up the group asid stuff once there instead of
on each stop/start.

Thanks

>
> Thanks!
>
> > Thanks
> >
> >
> > > +            return false;
> > > +        }
> > > +    }
> > > +
> > > +    for (int i =3D 0; i < dev->vq_index_end; ++i) {
> > > +        struct vhost_vring_state vq_group =3D {
> > > +            .index =3D i,
> > > +        };
> > > +
> > > +        if (dev->vq_index <=3D i && i < dev->vq_index + dev->nvqs) {
> > > +            continue;
> > > +        }
> > > +
> > > +        ret =3D vhost_vdpa_get_vring_group(dev, &vq_group);
> > > +        if (unlikely(ret)) {
> > > +            goto call_err;
> > > +        }
> > > +        if (unlikely(vq_group.num =3D=3D this_vq_group.num)) {
> > > +            error_report("VQ %d group is the same as VQ %d one",
> > > +                         this_vq_group.index, vq_group.index);
> > > +            return false;
> > > +        }
> > > +    }
> > > +
> > > +    return true;
> > > +
> > > +call_err:
> > > +    error_report("Can't read vq group, errno=3D%d (%s)", ret, g_stre=
rror(-ret));
> > > +    return false;
> > > +}
> > > +
> > >   static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started=
)
> > >   {
> > >       struct vhost_vdpa *v =3D dev->opaque;
> > > @@ -1118,6 +1191,10 @@ static int vhost_vdpa_dev_start(struct vhost_d=
ev *dev, bool started)
> > >
> > >       if (started) {
> > >           vhost_vdpa_host_notifiers_init(dev);
> > > +        if (dev->independent_vq_group &&
> > > +            !vhost_dev_is_independent_group(dev)) {
> > > +            return -1;
> > > +        }
> > >           ok =3D vhost_vdpa_svqs_start(dev);
> > >           if (unlikely(!ok)) {
> > >               return -1;
> > > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > > index ab8e095b73..ffb8eb26e7 100644
> > > --- a/hw/virtio/trace-events
> > > +++ b/hw/virtio/trace-events
> > > @@ -46,6 +46,7 @@ vhost_vdpa_set_vring_ready(void *dev) "dev: %p"
> > >   vhost_vdpa_dump_config(void *dev, const char *line) "dev: %p %s"
> > >   vhost_vdpa_set_config(void *dev, uint32_t offset, uint32_t size, ui=
nt32_t flags) "dev: %p offset: %"PRIu32" size: %"PRIu32" flags: 0x%"PRIx32
> > >   vhost_vdpa_get_config(void *dev, void *config, uint32_t config_len)=
 "dev: %p config: %p config_len: %"PRIu32
> > > +vhost_vdpa_get_vring_group(void *dev, unsigned int index, unsigned i=
nt num) "dev: %p index: %u num: %u"
> > >   vhost_vdpa_dev_start(void *dev, bool started) "dev: %p started: %d"
> > >   vhost_vdpa_set_log_base(void *dev, uint64_t base, unsigned long lon=
g size, int refcnt, int fd, void *log) "dev: %p base: 0x%"PRIx64" size: %ll=
u refcnt: %d fd: %d log: %p"
> > >   vhost_vdpa_set_vring_addr(void *dev, unsigned int index, unsigned i=
nt flags, uint64_t desc_user_addr, uint64_t used_user_addr, uint64_t avail_=
user_addr, uint64_t log_guest_addr) "dev: %p index: %u flags: 0x%x desc_use=
r_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64=
" log_guest_addr: 0x%"PRIx64
> >
>


