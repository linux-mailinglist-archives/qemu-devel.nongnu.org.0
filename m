Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B7A628DC7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:55:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouir3-00048W-Sd; Mon, 14 Nov 2022 18:27:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ouih4-0005zG-3G
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:16:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ouWQP-0004Wd-Ig
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 05:10:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668420643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v2DlIpIaE404wmucI5Zy1OEn2gDRZe5DXmdNCtEjW2Y=;
 b=cYy4QMcMjDYjo5qACysUrVOCQj9HA6cJo9MDwGDUAMokHjyNWHrr0xfAY56JcN+IMFkRmU
 xE0SdjHQ54Ig52nKrq3egYhdoR/eNe+QmY3f/aYLPZWvEwcnnv7t8RFaK5w/6A/J3sMAGe
 K2YnkGnUl+v9BPWbH1JgbtvruKpZzcw=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-353-kzd-UbE7NZGuJmvOuyiX6A-1; Mon, 14 Nov 2022 05:10:41 -0500
X-MC-Unique: kzd-UbE7NZGuJmvOuyiX6A-1
Received: by mail-pj1-f69.google.com with SMTP id
 n9-20020a17090a2bc900b0021010dca313so4536728pje.7
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 02:10:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v2DlIpIaE404wmucI5Zy1OEn2gDRZe5DXmdNCtEjW2Y=;
 b=Wputu8AWWafG1QDoLGSpj6DQ/oxuoJaeRI8/dNoykVXnfhIObfsvqBTSsE4Fs7gbzZ
 nzWD3Cu1qVdgN7d+YxpVGbqGCKJ2nxqYVbX5INNXlaQK9j+WOBUryWliczSQBvC6MYMy
 Wq5P/YWh6Iavw+7tOIvtJdzkeDgg2q1VTzlja3WlMXQlT9LozaiI6B+9bmTfHNsNhxeR
 c9xgF6fJi78fGQgAOwnjbtgyp8SHzCL2SICtezyF/OPpq53FWZmMW39EKS/teWzmZTJ2
 BUJsmigmYW8Q3jxcvl0yvCcCe+0A20d1pW7/n9uJykTtB6Ll6OKwzyzyorgSO8sohT7H
 3YwA==
X-Gm-Message-State: ANoB5pmQk9uNOF/4wSHJ9MGR5msyR4XTiWM5Ch5hCobxFWwKSwpQhiVx
 lZ7HSHTEBJl8Ay9aPI74bpC+5TXwLIQBxsOaVh5jFPyjbxLP2nyS56PhMT+6t2qTOPezn+f1qtc
 5z6F+26cXvI96ga6a+hV29CJ2MqQJPVU=
X-Received: by 2002:a63:fe51:0:b0:459:a339:89e0 with SMTP id
 x17-20020a63fe51000000b00459a33989e0mr11288039pgj.300.1668420640743; 
 Mon, 14 Nov 2022 02:10:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7BILZLrTlYRhJGOGXEE1L04p1fDUk4H00nDMoNJg18nvd3U6a0UDvXOv66O9qDN8OENnOTE+I2UnRQP1I6FgQ=
X-Received: by 2002:a63:fe51:0:b0:459:a339:89e0 with SMTP id
 x17-20020a63fe51000000b00459a33989e0mr11288025pgj.300.1668420640460; Mon, 14
 Nov 2022 02:10:40 -0800 (PST)
MIME-Version: 1.0
References: <20221108170755.92768-1-eperezma@redhat.com>
 <20221108170755.92768-6-eperezma@redhat.com>
 <56bfad97-74d2-8570-c391-83ecf9965cfd@redhat.com>
 <CAJaqyWd47QdBoSm9RdF2yx21hKv_=YRp3uvP13Qb9PaVksss7Q@mail.gmail.com>
 <aa82783b-b1f5-a82b-5136-1f7f7725a433@redhat.com>
 <CAJaqyWfmTn1_o2z2S_o=bu2mD=r0+T=1+dh_WOwbpQaYQK0YSQ@mail.gmail.com>
 <CACGkMEvQm_0VqF5q2XtWmaHXmSj0Xjg7br3ydOQVVcHJ0yb_GA@mail.gmail.com>
 <CAJaqyWfYN_Y6OQ-ugdH3d4VRGBJufMLBhH47dfB0rLg=MEt47g@mail.gmail.com>
 <72179a7d-2303-7f11-7ebc-e4d9c8d5392f@redhat.com>
In-Reply-To: <72179a7d-2303-7f11-7ebc-e4d9c8d5392f@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 14 Nov 2022 11:10:04 +0100
Message-ID: <CAJaqyWdP8Mo25sn7+6ZKUodGzA8SXjjW-DWBWJD=pKjfrsTiZQ@mail.gmail.com>
Subject: Re: [PATCH v6 05/10] vdpa: move SVQ vring features check to net/
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Parav Pandit <parav@mellanox.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
 Laurent Vivier <lvivier@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, kvm@vger.kernel.org, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Nov 14, 2022 at 5:26 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/11/11 20:58, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > On Fri, Nov 11, 2022 at 9:07 AM Jason Wang <jasowang@redhat.com> wrote:
> >> On Fri, Nov 11, 2022 at 3:56 PM Eugenio Perez Martin
> >> <eperezma@redhat.com> wrote:
> >>> On Fri, Nov 11, 2022 at 8:34 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> >>>>
> >>>> =E5=9C=A8 2022/11/10 21:09, Eugenio Perez Martin =E5=86=99=E9=81=93:
> >>>>> On Thu, Nov 10, 2022 at 6:40 AM Jason Wang <jasowang@redhat.com> wr=
ote:
> >>>>>> =E5=9C=A8 2022/11/9 01:07, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> >>>>>>> The next patches will start control SVQ if possible. However, we =
don't
> >>>>>>> know if that will be possible at qemu boot anymore.
> >>>>>> If I was not wrong, there's no device specific feature that is che=
cked
> >>>>>> in the function. So it should be general enough to be used by devi=
ces
> >>>>>> other than net. Then I don't see any advantage of doing this.
> >>>>>>
> >>>>> Because vhost_vdpa_init_svq is called at qemu boot, failing if it i=
s
> >>>>> not possible to shadow the Virtqueue.
> >>>>>
> >>>>> Now the CVQ will be shadowed if possible, so we need to check this =
at
> >>>>> device start, not at initialization.
> >>>>
> >>>> Any reason we can't check this at device start? We don't need
> >>>> driver_features and we can do any probing to make sure cvq has an un=
ique
> >>>> group during initialization time.
> >>>>
> >>> We need the CVQ index to check if it has an independent group. CVQ
> >>> index depends on the features the guest's ack:
> >>> * If it acks _F_MQ, it is the last one.
> >>> * If it doesn't, CVQ idx is 2.
> >>>
> >>> We cannot have acked features at initialization, and they could
> >>> change: It is valid for a guest to ack _F_MQ, then reset the device,
> >>> then not ack it.
> >> Can we do some probing by negotiating _F_MQ if the device offers it,
> >> then we can know if cvq has a unique group?
> >>
> > What if the guest does not ack _F_MQ?
> >
> > To be completed it would go like:
> >
> > * Probe negotiate _F_MQ, check unique group,
> > * Probe negotiate !_F_MQ, check unique group,
>
>
> I think it should be a bug if device present a unique virtqueue group
> that depends on a specific feature. That is to say, we can do a single
> round of probing instead of try it twice here.
>

I didn't mean a single virtqueue group but CVQ has its own group.

From vhost POV the valid behavior is feature dependent already: If
_F_MQ is not negotiated, the vq in a different group must be the 3rd.
If it is negotiated, the vq in its own group must be the last one.

Since the check of the virtqueue group is already dependent on the vq
index I think it would be a mistake to change a vq group ASID without
checking if it is independent or not.

The consequence of not checking that is that:
* We will move all the dataplane vq group to ASID 1, so the device
will not work properly.
* The device will be migratable.

>
> > * Actually negotiate with the guest's feature set.
> > * React to failures. Probably the same way as if the CVQ is not
> > isolated, disabling SVQ?
> >
> > To me it seems simpler to specify somehow that the vq must be independe=
nt.
>
>
> It's just a suggestion, if you think doing it at the start, I'm fine.

Don't get me wrong, we can make changes to go toward that direction
and I think it's a good idea, especially to reduce syscalls. I'm just
trying to put all the scenarios on the table because maybe I'm missing
something to solve them, or we can ignore them

Thanks!

> But we need document the reason with a comment maybe.
>
> Thanks
>
>
> >
> > Thanks!
> >
> >>>>>    To store this information at boot
> >>>>> time is not valid anymore, because v->shadow_vqs_enabled is not val=
id
> >>>>> at this time anymore.
> >>>>
> >>>> Ok, but this doesn't explain why it is net specific but vhost-vdpa s=
pecific.
> >>>>
> >>> We can try to move it to a vhost op, but we have the same problem as
> >>> the svq array allocation: We don't have the right place in vhost ops
> >>> to check this. Maybe vhost_set_features is the right one here?
> >> If we can do all the probing at the initialization phase, we can do
> >> everything there.
> >>
> >> Thanks
> >>
> >>> Thanks!
> >>>
> >>>> Thanks
> >>>>
> >>>>
> >>>>> Thanks!
> >>>>>
> >>>>>> Thanks
> >>>>>>
> >>>>>>
> >>>>>>> Since the moved checks will be already evaluated at net/ to know =
if it
> >>>>>>> is ok to shadow CVQ, move them.
> >>>>>>>
> >>>>>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>>>>>> ---
> >>>>>>>     hw/virtio/vhost-vdpa.c | 33 ++-------------------------------
> >>>>>>>     net/vhost-vdpa.c       |  3 ++-
> >>>>>>>     2 files changed, 4 insertions(+), 32 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >>>>>>> index 3df2775760..146f0dcb40 100644
> >>>>>>> --- a/hw/virtio/vhost-vdpa.c
> >>>>>>> +++ b/hw/virtio/vhost-vdpa.c
> >>>>>>> @@ -402,29 +402,9 @@ static int vhost_vdpa_get_dev_features(struc=
t vhost_dev *dev,
> >>>>>>>         return ret;
> >>>>>>>     }
> >>>>>>>
> >>>>>>> -static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vh=
ost_vdpa *v,
> >>>>>>> -                               Error **errp)
> >>>>>>> +static void vhost_vdpa_init_svq(struct vhost_dev *hdev, struct v=
host_vdpa *v)
> >>>>>>>     {
> >>>>>>>         g_autoptr(GPtrArray) shadow_vqs =3D NULL;
> >>>>>>> -    uint64_t dev_features, svq_features;
> >>>>>>> -    int r;
> >>>>>>> -    bool ok;
> >>>>>>> -
> >>>>>>> -    if (!v->shadow_vqs_enabled) {
> >>>>>>> -        return 0;
> >>>>>>> -    }
> >>>>>>> -
> >>>>>>> -    r =3D vhost_vdpa_get_dev_features(hdev, &dev_features);
> >>>>>>> -    if (r !=3D 0) {
> >>>>>>> -        error_setg_errno(errp, -r, "Can't get vdpa device featur=
es");
> >>>>>>> -        return r;
> >>>>>>> -    }
> >>>>>>> -
> >>>>>>> -    svq_features =3D dev_features;
> >>>>>>> -    ok =3D vhost_svq_valid_features(svq_features, errp);
> >>>>>>> -    if (unlikely(!ok)) {
> >>>>>>> -        return -1;
> >>>>>>> -    }
> >>>>>>>
> >>>>>>>         shadow_vqs =3D g_ptr_array_new_full(hdev->nvqs, vhost_svq=
_free);
> >>>>>>>         for (unsigned n =3D 0; n < hdev->nvqs; ++n) {
> >>>>>>> @@ -436,7 +416,6 @@ static int vhost_vdpa_init_svq(struct vhost_d=
ev *hdev, struct vhost_vdpa *v,
> >>>>>>>         }
> >>>>>>>
> >>>>>>>         v->shadow_vqs =3D g_steal_pointer(&shadow_vqs);
> >>>>>>> -    return 0;
> >>>>>>>     }
> >>>>>>>
> >>>>>>>     static int vhost_vdpa_init(struct vhost_dev *dev, void *opaqu=
e, Error **errp)
> >>>>>>> @@ -461,11 +440,7 @@ static int vhost_vdpa_init(struct vhost_dev =
*dev, void *opaque, Error **errp)
> >>>>>>>         dev->opaque =3D  opaque ;
> >>>>>>>         v->listener =3D vhost_vdpa_memory_listener;
> >>>>>>>         v->msg_type =3D VHOST_IOTLB_MSG_V2;
> >>>>>>> -    ret =3D vhost_vdpa_init_svq(dev, v, errp);
> >>>>>>> -    if (ret) {
> >>>>>>> -        goto err;
> >>>>>>> -    }
> >>>>>>> -
> >>>>>>> +    vhost_vdpa_init_svq(dev, v);
> >>>>>>>         vhost_vdpa_get_iova_range(v);
> >>>>>>>
> >>>>>>>         if (!vhost_vdpa_first_dev(dev)) {
> >>>>>>> @@ -476,10 +451,6 @@ static int vhost_vdpa_init(struct vhost_dev =
*dev, void *opaque, Error **errp)
> >>>>>>>                                    VIRTIO_CONFIG_S_DRIVER);
> >>>>>>>
> >>>>>>>         return 0;
> >>>>>>> -
> >>>>>>> -err:
> >>>>>>> -    ram_block_discard_disable(false);
> >>>>>>> -    return ret;
> >>>>>>>     }
> >>>>>>>
> >>>>>>>     static void vhost_vdpa_host_notifier_uninit(struct vhost_dev =
*dev,
> >>>>>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> >>>>>>> index d3b1de481b..fb35b17ab4 100644
> >>>>>>> --- a/net/vhost-vdpa.c
> >>>>>>> +++ b/net/vhost-vdpa.c
> >>>>>>> @@ -117,9 +117,10 @@ static bool vhost_vdpa_net_valid_svq_feature=
s(uint64_t features, Error **errp)
> >>>>>>>         if (invalid_dev_features) {
> >>>>>>>             error_setg(errp, "vdpa svq does not work with feature=
s 0x%" PRIx64,
> >>>>>>>                        invalid_dev_features);
> >>>>>>> +        return false;
> >>>>>>>         }
> >>>>>>>
> >>>>>>> -    return !invalid_dev_features;
> >>>>>>> +    return vhost_svq_valid_features(features, errp);
> >>>>>>>     }
> >>>>>>>
> >>>>>>>     static int vhost_vdpa_net_check_device_id(struct vhost_net *n=
et)
>


