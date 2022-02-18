Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 884644BB940
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 13:37:43 +0100 (CET)
Received: from localhost ([::1]:37524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL2W6-0006E8-1q
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 07:37:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nL2Up-0005J2-Ls
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 07:36:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nL2Ul-0000Wo-K4
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 07:36:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645187777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NPBIHxlR7WNPyrc06SsLgC4jGUyRkWBR50JONtEcMN0=;
 b=Ch0B40W0DBfKjWW6jEwnriAQ0zdA9uNTQzaYtTEYR9VhVrlPWBhN6uOZzNQqEKolfO6K6S
 JfjwNX+Cp2IOsHCeEbVfBWrabA7V3lqbxlq0xs7pZsSKXAfmOlSSYPKKCRCApqqfKBELo2
 7yqGgRRYMAx89IYDAfVjhV9gsiVtdJE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-peAcSNk2MnGbfJL_7H6CTQ-1; Fri, 18 Feb 2022 07:36:16 -0500
X-MC-Unique: peAcSNk2MnGbfJL_7H6CTQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 x16-20020a05620a449000b00508582d0db2so7188111qkp.0
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 04:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NPBIHxlR7WNPyrc06SsLgC4jGUyRkWBR50JONtEcMN0=;
 b=764t/tT4m2sCHA6c3Rg3wSzJ/7r8rmh311s0vKv3WpBRFHcHibsL1t+GawIejXK1hy
 3vlSC6sXetFddVJ98QDMyhi4z9UGyluX1mYYk9T+4HQyXXCEgDwxzVpqSoxqmqmEZPZw
 2xJvJFsk6d8h/lDS6rqzGo/z5EFKkDDVSVPHawZ5X2JnP//w1kZ0PMRm4lLNoGGP+RfT
 0NzfQf5bC3XtwTTD/QGXnGHFSqQkw7rJwlZkXsTQvu4hJXbuOYUQjVTTHdLG1toEWTyY
 S6nF8X36gNBDqHBo6NAoO98NEgzx3ISr+OhQyISvegzM/iIXXK/AY/5OuJAJI9BHhcLB
 y7Ww==
X-Gm-Message-State: AOAM531XrcGuXzKX7cLt8Qc4n/LEJmpPCjItzEYG6GpNaroJhBFflbyE
 ve8dxkBY0ARrnKbwS/lk2VOTVHEHUq3m8/4DVfBgdGnE6LFo0Zh/XcsKeF2wBKru6KCIGKKHf7y
 fo3tCdFcMaiiJK0FDhwYEd0f3Hf7RWe0=
X-Received: by 2002:ac8:5a01:0:b0:2dd:2de2:58cf with SMTP id
 n1-20020ac85a01000000b002dd2de258cfmr6418187qta.199.1645187776168; 
 Fri, 18 Feb 2022 04:36:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcPVDgXKzjc1MuhtNzqwCAMs5Bnq3xDL0eOG5c24Bnim8tMhE2bIvHCtkvHgNTbkoAhjPwalWDm2nJsZRR2Dw=
X-Received: by 2002:ac8:5a01:0:b0:2dd:2de2:58cf with SMTP id
 n1-20020ac85a01000000b002dd2de258cfmr6418150qta.199.1645187775863; Fri, 18
 Feb 2022 04:36:15 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-10-eperezma@redhat.com>
 <cbfbd909-4ee8-8ad2-effd-4b9f60270581@redhat.com>
 <CAJaqyWda5sBw9VGBrz8g60OJ07Eeq45RRYu9vwgOPZFwten9rw@mail.gmail.com>
 <cbdf79c3-48ed-bac2-a9cc-e5c29729e4af@redhat.com>
In-Reply-To: <cbdf79c3-48ed-bac2-a9cc-e5c29729e4af@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 18 Feb 2022 13:35:39 +0100
Message-ID: <CAJaqyWeisXmZ9+xw2Rj50K7aKx4khNZZjLZEz4MY97B9pQQm3w@mail.gmail.com>
Subject: Re: [PATCH 09/31] vhost-vdpa: Take into account SVQ in
 vhost_vdpa_set_vring_call
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 8, 2022 at 4:23 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/1/31 =E4=B8=8B=E5=8D=8811:34, Eugenio Perez Martin =E5=86=
=99=E9=81=93:
> > On Sat, Jan 29, 2022 at 9:06 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=86=
=99=E9=81=93:
> >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>> ---
> >>>    hw/virtio/vhost-vdpa.c | 20 ++++++++++++++++++--
> >>>    1 file changed, 18 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >>> index 18de14f0fb..029f98feee 100644
> >>> --- a/hw/virtio/vhost-vdpa.c
> >>> +++ b/hw/virtio/vhost-vdpa.c
> >>> @@ -687,13 +687,29 @@ static int vhost_vdpa_set_vring_kick(struct vho=
st_dev *dev,
> >>>        }
> >>>    }
> >>>
> >>> -static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
> >>> -                                       struct vhost_vring_file *file=
)
> >>> +static int vhost_vdpa_set_vring_dev_call(struct vhost_dev *dev,
> >>> +                                         struct vhost_vring_file *fi=
le)
> >>>    {
> >>>        trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
> >>>        return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
> >>>    }
> >>>
> >>> +static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
> >>> +                                     struct vhost_vring_file *file)
> >>> +{
> >>> +    struct vhost_vdpa *v =3D dev->opaque;
> >>> +
> >>> +    if (v->shadow_vqs_enabled) {
> >>> +        int vdpa_idx =3D vhost_vdpa_get_vq_index(dev, file->index);
> >>> +        VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vq=
s, vdpa_idx);
> >>> +
> >>> +        vhost_svq_set_guest_call_notifier(svq, file->fd);
> >>
> >> Two questions here (had similar questions for vring kick):
> >>
> >> 1) Any reason that we setup the eventfd for vhost-vdpa in
> >> vhost_vdpa_svq_setup() not here?
> >>
> > I'm not sure what you mean.
> >
> > The guest->SVQ call and kick fds are set here and at
> > vhost_vdpa_set_vring_kick. The event notifier handler of the guest ->
> > SVQ kick_fd is set at vhost_vdpa_set_vring_kick /
> > vhost_svq_set_svq_kick_fd. The guest -> SVQ call fd has no event
> > notifier handler since we don't poll it.
> >
> > On the other hand, the connection SVQ <-> device uses the same fds
> > from the beginning to the end, and they will not change with, for
> > example, call fd masking. That's why it's setup from
> > vhost_vdpa_svq_setup. Delaying to vhost_vdpa_set_vring_call would make
> > us add way more logic there.
>
>
> More logic in general shadow vq code but less codes for vhost-vdpa
> specific code I think.
>
> E.g for we can move the kick set logic from vhost_vdpa_svq_set_fds() to
> here.
>

But they are different fds. vhost_vdpa_svq_set_fds sets the
SVQ<->device. This function sets the SVQ->guest call file descriptor.

To move the logic of vhost_vdpa_svq_set_fds here would imply either:
a) Logic to know if we are receiving the first call fd or not. That
code is not in the series at the moment, because setting at
vhost_vdpa_dev_start tells the difference for free. Is just adding
code, not moving.
b) Logic to set again *the same* file descriptor to device, with logic
to tell if we have missed calls. That logic is not implemented for
device->SVQ call file descriptor, because we are assuming it never
changes from vhost_vdpa_svq_set_fds. So this is again adding code.

At this moment, we have:
vhost_vdpa_svq_set_fds:
  set SVQ<->device fds

vhost_vdpa_set_vring_call:
  set guest<-SVQ call

vhost_vdpa_set_vring_kick:
  set guest->SVQ kick.

If I understood correctly, the alternative would be something like:
vhost_vdpa_set_vring_call:
  set guest<-SVQ call
  if(!vq->call_set) {
    - set SVQ<-device call.
    - vq->call_set =3D true
  }

vhost_vdpa_set_vring_kick:
  set guest<-SVQ call
  if(!vq->dev_kick_set) {
    - set guest->device kick.
    - vq->dev_kick_set =3D true
  }

dev_reset / dev_stop:
for vq in vqs:
  vq->dev_kick_set =3D vq->dev_call_set =3D false
...

Or have I misunderstood something?

Thanks!

> Thanks
>
>
> >
> >> 2) The call could be disabled by using -1 as the fd, I don't see any
> >> code to deal with that.
> >>
> > Right, I didn't take that into account. vhost-kernel takes also -1 as
> > kick_fd to unbind, so SVQ can be reworked to take that into account
> > for sure.
> >
> > Thanks!
> >
> >> Thanks
> >>
> >>
> >>> +        return 0;
> >>> +    } else {
> >>> +        return vhost_vdpa_set_vring_dev_call(dev, file);
> >>> +    }
> >>> +}
> >>> +
> >>>    /**
> >>>     * Set shadow virtqueue descriptors to the device
> >>>     *
>


