Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D338F575E39
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 11:10:04 +0200 (CEST)
Received: from localhost ([::1]:41248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCHKl-0000dp-U4
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 05:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oCGza-0005qx-Kg
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 04:48:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oCGzW-00054R-Co
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 04:48:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657874885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kk3JVlcex6DCNhEfc9R2AHfotNU5Glx4eY13MK9u00E=;
 b=Huyz6DJi5L1GuqLGw325u8V7OlzpYXRPCpqHshgLrmw+rl9bY6tNf9BptkI3DmcfMu/joL
 ds0gPe9s+EeBFh3HI6lKTVlbQGaRmgtRxSlHjaB2g94/uWtA7IUXjrmYESVVZerPydTWiQ
 12DWjGSAl8TGzeCHQwI7F/ep9EpIg8Q=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-w7UaRoU1NpO-9Miz4bEJVg-1; Fri, 15 Jul 2022 04:48:04 -0400
X-MC-Unique: w7UaRoU1NpO-9Miz4bEJVg-1
Received: by mail-lj1-f198.google.com with SMTP id
 g3-20020a2e9cc3000000b00253cc2b5ab5so1016951ljj.19
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 01:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Kk3JVlcex6DCNhEfc9R2AHfotNU5Glx4eY13MK9u00E=;
 b=Tb+2vBuiEeblk6gS+J6BygjB6SAoBsxT0PJdRL7zbKFoLLVm8LWiPqjV6Nx/3Xn3zG
 zPWdcgJn+5PsVCPSf8IM7KWeAApmZeI9KOyxDte8TNJeIHrAyORwyx0MsdCVNtWQozBZ
 FLDCbB6egYHXUj53lPAZwdwZKzOci5dxUMvvNyTxBYK+Vt1zt+tbpoJ5/QOSgGkj03an
 D3dpmNcTt5m7yJvxKvT+8W5xipv6V57X9jAZYDikyHZsCnVhp+iCHwu0IoYrcg99VXmb
 jhkk+5/k/rKoe3nWoo4hxfbYgYy0wtA+OOIvaoT8IIOqLqAi//Z8ZJyGUNBpTFz7aL0Y
 oTRg==
X-Gm-Message-State: AJIora+ExF4gvZIAtjwXnalmAFaQUwcNJyHiIo3eT/geiYRkPPYtII3u
 x7mZcGBeDlogzFRxx0uKHRVGRzVR4SiXElEO2jsup9EfuIBHhWmZoRgQLaFXb8lStEjdQ2CjEPG
 3u4mst5B7b+J1w62rUQaEdWIhTcUz1bM=
X-Received: by 2002:a2e:2e0d:0:b0:25d:48a6:827d with SMTP id
 u13-20020a2e2e0d000000b0025d48a6827dmr6602211lju.323.1657874882483; 
 Fri, 15 Jul 2022 01:48:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v5GAfyWRhd37f+kwMDMCBlSIiDU+sUtwzQazNlfS1ElMnKMfBG6OH+ikrlAjNO1RW+fNkkuEZAUJaHvXsdnX8=
X-Received: by 2002:a2e:2e0d:0:b0:25d:48a6:827d with SMTP id
 u13-20020a2e2e0d000000b0025d48a6827dmr6602189lju.323.1657874882207; Fri, 15
 Jul 2022 01:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220714163150.2536327-1-eperezma@redhat.com>
 <20220714163150.2536327-13-eperezma@redhat.com>
 <CACGkMEuHR_R6Jxjvznv1T-d6SGngsYQyfhCNw8-HoTb3FLcX0w@mail.gmail.com>
 <CAJaqyWfwODXUr_z3Qzp7_MSbEamG0W8MxUtxn1kV-NE_qfBi-A@mail.gmail.com>
In-Reply-To: <CAJaqyWfwODXUr_z3Qzp7_MSbEamG0W8MxUtxn1kV-NE_qfBi-A@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 15 Jul 2022 16:47:51 +0800
Message-ID: <CACGkMEvfPDMK+7jg+r5hunxA+EXuN9V_d_KZfkCfufe-ONbXFQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/19] vhost: add vhost_svq_poll
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Parav Pandit <parav@mellanox.com>, 
 Laurent Vivier <lvivier@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Eli Cohen <eli@mellanox.com>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Fri, Jul 15, 2022 at 1:39 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Fri, Jul 15, 2022 at 5:59 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Fri, Jul 15, 2022 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redhat.co=
m> wrote:
> > >
> > > It allows the Shadow Control VirtQueue to wait for the device to use =
the
> > > available buffers.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >  hw/virtio/vhost-shadow-virtqueue.h |  1 +
> > >  hw/virtio/vhost-shadow-virtqueue.c | 22 ++++++++++++++++++++++
> > >  2 files changed, 23 insertions(+)
> > >
> > > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-sha=
dow-virtqueue.h
> > > index 1692541cbb..b5c6e3b3b4 100644
> > > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > > @@ -89,6 +89,7 @@ void vhost_svq_push_elem(VhostShadowVirtqueue *svq,=
 const SVQElement *elem,
> > >  int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out=
_sg,
> > >                    size_t out_num, const struct iovec *in_sg, size_t =
in_num,
> > >                    SVQElement *elem);
> > > +size_t vhost_svq_poll(VhostShadowVirtqueue *svq);
> > >
> > >  void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_ki=
ck_fd);
> > >  void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_f=
d);
> > > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-sha=
dow-virtqueue.c
> > > index 5244896358..31a267f721 100644
> > > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > > @@ -486,6 +486,28 @@ static void vhost_svq_flush(VhostShadowVirtqueue=
 *svq,
> > >      } while (!vhost_svq_enable_notification(svq));
> > >  }
> > >
> > > +/**
> > > + * Poll the SVQ for one device used buffer.
> > > + *
> > > + * This function race with main event loop SVQ polling, so extra
> > > + * synchronization is needed.
> > > + *
> > > + * Return the length written by the device.
> > > + */
> > > +size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
> > > +{
> > > +    do {
> > > +        uint32_t len;
> > > +        SVQElement *elem =3D vhost_svq_get_buf(svq, &len);
> > > +        if (elem) {
> > > +            return len;
> > > +        }
> > > +
> > > +        /* Make sure we read new used_idx */
> > > +        smp_rmb();
> >
> > There's already one smp_rmb(0 in vhost_svq_get_buf(). So this seems use=
less?
> >
>
> That rmb is after checking for new entries with (vq->last_used_idx !=3D
> svq->shadow_used_idx) , to avoid reordering used_idx read with the
> actual used entry. So my understanding is
> that the compiler is free to skip that check within the while loop.

What do you mean by "that check" here?

>
> Maybe the right solution is to add it in vhost_svq_more_used after the
> condition (vq->last_used_idx !=3D svq->shadow_used_idx) is false?

I'm not sure I get the goal of the smp_rmb() here. What barrier does it pai=
r?

Since we are in the busy loop, we will read the for new used_idx for
sure, and we can't forecast when the used_idx is committed to memory.

Thanks

>
> Thanks!
>
>
> > Thanks
> >
> > > +    } while (true);
> > > +}
> > > +
> > >  /**
> > >   * Forward used buffers.
> > >   *
> > > --
> > > 2.31.1
> > >
> >
>


