Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56CF57DB2F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 09:22:30 +0200 (CEST)
Received: from localhost ([::1]:44336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEmzU-0005Ou-FA
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 03:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEmgc-00034M-Hx
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 03:02:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEmgY-0002ie-TK
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 03:02:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658473373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8lVuut8dDMHF/rB5VP7JnS5uFLPr9DH7Jyo4RHOIWzs=;
 b=RIkOz2Tsm29Hv40TRGtUU6i7mUb5iV36ZZHUigluszzbhevEYUqShE7OEFI+YW7t3UyV5g
 0CblEKq6gim4fez0MLG727+7hVseQAJmivgFpcfD6gMQqi7ykl+8LyN2sQr7PI0Mpj50xn
 QG/ygBPUemEnACFsdHBinELzRHQ9xeg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-kgmHP0Y-OKuKD1pVkAJ8eQ-1; Fri, 22 Jul 2022 03:02:51 -0400
X-MC-Unique: kgmHP0Y-OKuKD1pVkAJ8eQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 w26-20020a05622a191a00b0031f0b4a561bso2408731qtc.21
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 00:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8lVuut8dDMHF/rB5VP7JnS5uFLPr9DH7Jyo4RHOIWzs=;
 b=MrRaQnarQ+11DFRRl7mEWC9VSxcYX6SxTXahnjxx4hraWda8MTrcEHvrU/lOKnttt+
 fXMwWgwFByrWiF162vBhd4NE4lHVeSW3WAcyG/6ilUKsZr0/30vCRoS4ezHMAyLKtF3R
 WiItLTsoDgfq5hHcQdgbOuWMigsf0wn5aT7YiZ8hqmnWvYioKAXQTNaeaItEn7nYqz/d
 gP911AaLLlehusF9zhmv1qAcxed9Nlz/Hs/jMOI1SNzi92mwjOEjJ5LxSf3RT3pZxS/y
 1MA3MYDrFVYdVRj4UwHOxEhMu971VmaPVCg6lhpF+SkTxUDqSXX5o6H793T/TYo3D/SK
 K6ww==
X-Gm-Message-State: AJIora9Alrl3KiNVqEq+VglzZQ6dendVWgHblT8u5bVJ6OOZVI3X/A0r
 vqKBeSDdGuh69+3+iPGN4V3zyv2tLfC6Pd5VG5IMgCaKX6ZMjGoryktZoNU19K9aORupdFR6NNH
 vIq3rqf9Hm+p7mZDXoWKQw/9xhMHOm3o=
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id
 v16-20020a05620a0f1000b006aa318e55a9mr1494360qkl.559.1658473370868; 
 Fri, 22 Jul 2022 00:02:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uHjZ6O36vIliirFjZKTDS+iJ/+qJnNq7TLe3XSwREkPeY/VUFjp9ZoyS/xSQPRpvLymqLycNItZPiSTe4b0Io=
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id
 v16-20020a05620a0f1000b006aa318e55a9mr1494342qkl.559.1658473370588; Fri, 22
 Jul 2022 00:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220718162938.2938783-1-eperezma@redhat.com>
 <20220718162938.2938783-5-eperezma@redhat.com>
 <CACGkMEsjR6HbVLzLNypMu+7yLkAosrkLCSkrySG5miQfd+ZLdg@mail.gmail.com>
In-Reply-To: <CACGkMEsjR6HbVLzLNypMu+7yLkAosrkLCSkrySG5miQfd+ZLdg@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 22 Jul 2022 09:02:14 +0200
Message-ID: <CAJaqyWdRrX44Seqf4m---6MUFOUAUSt2RsisE2h2sVvLa3T14g@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] vdpa: Add virtio-net mac address via CVQ at start
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Eric Blake <eblake@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 Parav Pandit <parav@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Eli Cohen <eli@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 22, 2022 at 4:29 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Tue, Jul 19, 2022 at 12:30 AM Eugenio P=C3=A9rez <eperezma@redhat.com>=
 wrote:
> >
> > This is needed so the destination vdpa device see the same state a the
> > guest set in the source.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  include/net/vhost-vdpa.h |  1 +
> >  hw/net/vhost_net.c       |  8 +++++
> >  net/vhost-vdpa.c         | 64 ++++++++++++++++++++++++++++++++++++++--
> >  3 files changed, 71 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/net/vhost-vdpa.h b/include/net/vhost-vdpa.h
> > index b81f9a6f2a..38d65e845d 100644
> > --- a/include/net/vhost-vdpa.h
> > +++ b/include/net/vhost-vdpa.h
> > @@ -15,6 +15,7 @@
> >  #define TYPE_VHOST_VDPA "vhost-vdpa"
> >
> >  struct vhost_net *vhost_vdpa_get_vhost_net(NetClientState *nc);
> > +int vhost_vdpa_start(NetClientState *nc);
> >
> >  extern const int vdpa_feature_bits[];
> >
> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > index ccac5b7a64..f9cebd9716 100644
> > --- a/hw/net/vhost_net.c
> > +++ b/hw/net/vhost_net.c
> > @@ -274,6 +274,13 @@ static int vhost_net_start_one(struct vhost_net *n=
et,
> >              }
> >          }
> >      }
> > +
> > +    if (net->nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA) {
> > +        r =3D vhost_vdpa_start(net->nc);
> > +        if (r < 0) {
> > +            goto fail;
> > +        }
> > +    }
>
> This seems tricky, I wonder if we can do this via NetClientInfo
> instead of directly via the vhost layer?
>

Route it via net->nc->info->start()? I think it's better, yes. It was
how it was done before [1].

vhost_kernel could also call to vhost_net_set_backend there.

> Note that the virtio-net has several places that check VDPA backend
> explicitly. This is suboptimal, I will post patch to hide them via
> NetClientInfo.
>
> >      return 0;
> >  fail:
> >      file.fd =3D -1;
> > @@ -373,6 +380,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientSta=
te *ncs,
> >          r =3D vhost_net_start_one(get_vhost_net(peer), dev);
> >
> >          if (r < 0) {
> > +            vhost_net_stop_one(get_vhost_net(peer), dev);
>
> This should not be correct. vhost_net_start_one() fail means the
> device is not started, stop once again seems not again.
>

You're right, I think the rebase process put it here by mistake.

> >              goto err_start;
> >          }
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 533bd9f680..84e90f067a 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -342,9 +342,12 @@ static virtio_net_ctrl_ack vhost_vdpa_net_cvq_add(=
VhostShadowVirtqueue *svq,
> >      virtio_net_ctrl_ack status;
> >      size_t dev_written;
> >      int r;
> > -    void *unused =3D (void *)1;
> >
> > -    r =3D vhost_svq_add(svq, &dev_buffers[0], 1, &dev_buffers[1], 1, u=
nused);
> > +    /*
> > +     * Add a fake non-NULL VirtQueueElement since we'll remove before =
SVQ
> > +     * event loop can get it.
> > +     */
> > +    r =3D vhost_svq_add(svq, &dev_buffers[0], 1, &dev_buffers[1], 1, (=
void *)1);
>
> Any reason we can 't simply pass NULL as the last parameter for vhost_svq=
_add()?
>

Since we're being more similar to the kernel, we cannot pass NULL.
NULL as "data" would mean that there are no descriptors there.

The kernel passes the virtnet_info, but it's totally unused as you're
polling for receiving the only buffer it introduced previously. We
can:
a) Put whatever value we want here (svq? dev_written? any non NULL value wo=
rk).
b) Delete this argument and use a sentinel value in SVQ to mark the
buffers not injected by the guest (separating the code from the kernel
one).

Thanks!

[1] https://patchwork.kernel.org/project/qemu-devel/patch/20220413163206.19=
58254-21-eperezma@redhat.com/

> Thanks
>
> >      if (unlikely(r !=3D 0)) {
> >          if (unlikely(r =3D=3D -ENOSPC)) {
> >              qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device que=
ue\n",
> > @@ -372,6 +375,63 @@ static virtio_net_ctrl_ack vhost_vdpa_net_cvq_add(=
VhostShadowVirtqueue *svq,
> >      return VIRTIO_NET_OK;
> >  }
> >
> > +int vhost_vdpa_start(NetClientState *nc)
> > +{
> > +    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> > +    VirtIONet *n =3D VIRTIO_NET(v->dev->vdev);
> > +    uint64_t features =3D v->dev->vdev->host_features;
> > +    VhostShadowVirtqueue *svq;
> > +
> > +    if (!v->shadow_vqs_enabled) {
> > +        return 0;
> > +    }
> > +
> > +    if (v->dev->vq_index + v->dev->nvqs !=3D v->dev->vq_index_end) {
> > +        /* Only interested in CVQ */
> > +        return 0;
> > +    }
> > +
> > +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > +
> > +    svq =3D g_ptr_array_index(v->shadow_vqs, 0);
> > +    if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
> > +        const struct virtio_net_ctrl_hdr ctrl =3D {
> > +            .class =3D VIRTIO_NET_CTRL_MAC,
> > +            .cmd =3D VIRTIO_NET_CTRL_MAC_ADDR_SET,
> > +        };
> > +        uint8_t mac[6];
> > +        const struct iovec out[] =3D {
> > +            {
> > +                .iov_base =3D (void *)&ctrl,
> > +                .iov_len =3D sizeof(ctrl),
> > +            },{
> > +                .iov_base =3D mac,
> > +                .iov_len =3D sizeof(mac),
> > +            },
> > +        };
> > +        struct iovec dev_buffers[2] =3D {
> > +            { .iov_base =3D s->cvq_cmd_out_buffer },
> > +            { .iov_base =3D s->cvq_cmd_in_buffer },
> > +        };
> > +        bool ok;
> > +        virtio_net_ctrl_ack state;
> > +
> > +        ok =3D vhost_vdpa_net_cvq_map_sg(s, out, ARRAY_SIZE(out), dev_=
buffers);
> > +        if (unlikely(!ok)) {
> > +            return -1;
> > +        }
> > +
> > +        memcpy(mac, n->mac, sizeof(mac));
> > +        state =3D vhost_vdpa_net_cvq_add(svq, dev_buffers);
> > +        vhost_vdpa_cvq_unmap_buf(v, dev_buffers[0].iov_base);
> > +        vhost_vdpa_cvq_unmap_buf(v, dev_buffers[1].iov_base);
> > +        return state =3D=3D VIRTIO_NET_OK ? 0 : 1;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >  /**
> >   * Do not forward commands not supported by SVQ. Otherwise, the device=
 could
> >   * accept it and qemu would not know how to update the device model.
> > --
> > 2.31.1
> >
>


