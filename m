Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B233607395
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:11:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olo3V-000711-A5
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:11:05 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olnzq-0007pZ-48
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olnyb-0006qW-2V
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:06:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olnyX-0007Fh-P2
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:06:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666343156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=17O2H9bHGeGQcaHrpyCGY88XuPVP2cWpJx06wnlpcuw=;
 b=GAZqTjzl1HYuMyxevEQ4Fj8FeoAP4qILgT9hH3CW+YdIAYN2Nujksbv/BraSD8M3BH36DZ
 etJVXpaDZaTKO7DVItLwMhlZ0HzJWAYah3xlhv7GsCJBKvdOaTufyl0VPfXF/kHUwXX8d5
 Gwu5S3yxl4fCt6KOTz+DTdKDx8qCqf0=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-339-zH32BEclMcWgU8nyd_RNKg-1; Fri, 21 Oct 2022 05:05:55 -0400
X-MC-Unique: zH32BEclMcWgU8nyd_RNKg-1
Received: by mail-pg1-f197.google.com with SMTP id
 q63-20020a632a42000000b0045724b1dfb9so1131886pgq.3
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 02:05:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=17O2H9bHGeGQcaHrpyCGY88XuPVP2cWpJx06wnlpcuw=;
 b=KjdFZGvCOH++Zpa4J/4DcEMY38tT+p35XAuLQ6ZrlSvYcnMEMf+rwKN4lgckM0AOYe
 EPsR88Y/AQAmLmALOWwxrhRCZryhNl6vXkom1a5MsTUON5Uw4FXE1doktuzBIpu2cRe+
 BKf2B2R0xPTFaxjp1nJGsab560zfMWDjP4B7rqEqReE6X9ymhiURQFN7j8A9Ve0CdpUd
 55Z1pYnVS7HtS+kn0eG78CwbJ5LPiWQX6cH4mAAEQZA9Zz0FHwnFCGCd0ozjaYap940r
 Ap0tuo9W1CMZiuTCQF3Du+2P2Q5fJNzEpjYVFw/0VnWT9aH1G3VdRqXj6WwMXBe6cXTE
 uvjg==
X-Gm-Message-State: ACrzQf1tub8E9FnvbtF5oAZvJ36L6ro5PMQVGT16bwutver12gZa5tAu
 jcaZb0VdW0qgrkrnbeBZnBVCJGUYQXgP4rn6hrIKMf+L5fN/UrZziPZn4K/HfnYLgQfnV4dQhQv
 LSrTkX1ACgEIYj8NrUcQgS47bkCkK/xU=
X-Received: by 2002:a65:5242:0:b0:46e:9bac:178 with SMTP id
 q2-20020a655242000000b0046e9bac0178mr6458178pgp.300.1666343154054; 
 Fri, 21 Oct 2022 02:05:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6mz/gKGLlXrcqtfDkIaKpMtQIKn7YKdsu9AI8njj5Hb1WYHvHO7CteLWgB25LcL+WBS1DjWEAeNo+WtwU4ud0=
X-Received: by 2002:a65:5242:0:b0:46e:9bac:178 with SMTP id
 q2-20020a655242000000b0046e9bac0178mr6458150pgp.300.1666343153798; Fri, 21
 Oct 2022 02:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221019125210.226291-1-eperezma@redhat.com>
 <20221019125210.226291-7-eperezma@redhat.com>
 <CACGkMEuKCXP2DMQWtPFmLnCKYuyDA8LEFbETU==AM_aRvdVM8g@mail.gmail.com>
 <CAJaqyWfFk_yXTJjsvSpqG2XCJvgP7BqjcVediQL0KSDgN5nZ=A@mail.gmail.com>
 <CACGkMEtUBz99zAyreiUgqp7U3BFgFgLi+bPKW1tKZhq7p2+cFQ@mail.gmail.com>
In-Reply-To: <CACGkMEtUBz99zAyreiUgqp7U3BFgFgLi+bPKW1tKZhq7p2+cFQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 21 Oct 2022 11:05:17 +0200
Message-ID: <CAJaqyWdBtxW8y6Oeji+UJ5QmYTMiy3NP2Q9FaaZyvYR5VyS6TA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 6/8] vdpa: handle VIRTIO_NET_CTRL_ANNOUNCE in
 vhost_vdpa_net_handle_ctrl_avail
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Gautam Dawar <gdawar@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 21, 2022 at 5:02 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Thu, Oct 20, 2022 at 3:01 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Thu, Oct 20, 2022 at 6:35 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Wed, Oct 19, 2022 at 8:52 PM Eugenio P=C3=A9rez <eperezma@redhat.c=
om> wrote:
> > > >
> > > > Since this capability is emulated by qemu shadowed CVQ cannot forwa=
rd it
> > > > to the device.
> > >
> > > I wonder what happens for a device that has GUEST_ANNOUNCE support on=
 its own?
> > >
> >
> > If SVQ is enabled the feature is always emulated by qemu by this series=
.
> >
> > if SVQ is disabled then the device is the one in charge of all of it.
>
> Ok, I see.
>
> >
> > > > Process all that command within qemu.
> > > >
> > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > ---
> > > >  net/vhost-vdpa.c | 15 ++++++++++++---
> > > >  1 file changed, 12 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > index 3374c21b4d..5fda405a66 100644
> > > > --- a/net/vhost-vdpa.c
> > > > +++ b/net/vhost-vdpa.c
> > > > @@ -488,9 +488,18 @@ static int vhost_vdpa_net_handle_ctrl_avail(Vh=
ostShadowVirtqueue *svq,
> > > >      out.iov_len =3D iov_to_buf(elem->out_sg, elem->out_num, 0,
> > > >                               s->cvq_cmd_out_buffer,
> > > >                               vhost_vdpa_net_cvq_cmd_len());
> > > > -    dev_written =3D vhost_vdpa_net_cvq_add(s, out.iov_len, sizeof(=
status));
> > > > -    if (unlikely(dev_written < 0)) {
> > > > -        goto out;
> > > > +    if (*(uint8_t *)s->cvq_cmd_out_buffer =3D=3D VIRTIO_NET_CTRL_A=
NNOUNCE) {
> > >
> > > Interesting, I thought we can do better by forbidding the code that
> > > goes into vhost-vDPA specific code, everything should be set at
> > > virtio-net.c level.
> > >
> >
> > Do you mean to move the SVQ processing to each handle_output? It's
> > somehow on the roadmap but I'm not sure if it has more priority than
> > implementing the different features.
>
> Right, but I think we need to find a way to eliminate the casting here.
>

Would it work to use it this way?
uint8_t *virtio_net_ctrl_class =3D s->cvq_cmd_out_buffer
if (*virtio_net_ctrl_class =3D=3D VIRTIO_NET_CTRL_ANNOUNCE) {
  ...
}

> Thanks
>
> >
> > Thanks!
> >
> >
> > > Thanks
> > >
> > > > +        /*
> > > > +         * Guest announce capability is emulated by qemu, so dont =
forward to
> > > > +         * the device.
> > > > +         */
> > > > +        dev_written =3D sizeof(status);
> > > > +        *s->status =3D VIRTIO_NET_OK;
> > > > +    } else {
> > > > +        dev_written =3D vhost_vdpa_net_cvq_add(s, out.iov_len, siz=
eof(status));
> > > > +        if (unlikely(dev_written < 0)) {
> > > > +            goto out;
> > > > +        }
> > > >      }
> > > >
> > > >      if (unlikely(dev_written < sizeof(status))) {
> > > > --
> > > > 2.31.1
> > > >
> > >
> >
>


