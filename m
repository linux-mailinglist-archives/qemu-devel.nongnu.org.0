Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FFD2D41AC
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 13:04:38 +0100 (CET)
Received: from localhost ([::1]:49518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmyCz-0004vC-Dy
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 07:04:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kmy9h-0003Fa-8x
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 07:01:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kmy9V-0003qz-Eu
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 07:01:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607515258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=swJyXfHdLUgSl0keTb4tv1Zg2o/rljVaHBscj8NqdsQ=;
 b=RIVWHCQ1gHOq/yTwI7gJXHSnRZ4TBKl1uQz83a0i6Sd9QnkM6ScFIB6DmAXcegIFumxdGM
 6RdyknPKUtiOwHD3MOxAV1m/eCV+/73kifCDif4tcAl42PBmXOLR2rsah7R8cLYp6VcKlc
 MdJZ8lca5Pfrt5OJryi5Dq4aEaqFXyA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-nVVpFb4qMlWKLiqONtdDXA-1; Wed, 09 Dec 2020 07:00:56 -0500
X-MC-Unique: nVVpFb4qMlWKLiqONtdDXA-1
Received: by mail-qt1-f200.google.com with SMTP id f11so999023qth.23
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 04:00:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=swJyXfHdLUgSl0keTb4tv1Zg2o/rljVaHBscj8NqdsQ=;
 b=ibXdh7PlNCC8McoYZynsb4kqIExERBa4Ubk/n2ZUwLOFIm2WwD8BernL9J7S9wGN/b
 3/+dd1XiT/szFfXWWSK0RyPzTBPR5eXz+QJzw9Gq3+P++DT6QUd2+68eGamQBYYCxeX8
 dggoK4gic5DgwL8O415Jad5VRm91FNdoIgGlTeLLjI3Q10Do7VCZV3Zd6t3of6ldd6Pl
 lZRdp9ANew2kYN9ZBQB3lrxWzXMT7GcAxTHVi6Ye75GVzOQo0cDd7nAPtnRTTczIeOZA
 GPqNulqCVdDp3+UbWhQAqqCSPpndD0rkKJjQZ0DhhQkcl8kpaCfRdp0uUwtmiRhZN7v5
 Laqw==
X-Gm-Message-State: AOAM532BGku7uBA/Hj+RGp8lDZqkPII+P7uQ7KlvuHXDO10wfLQS/Fai
 B+QhOI3wuUGCyys/BK6clNx098dLFEzwsgPjm9Us0zzkeWyDU/86l3CJ5NQXyxdr+FxWeMAS4wO
 dWb7o9q4entovTSHkzu3pJkFJ8SuVIRQ=
X-Received: by 2002:ae9:dcc1:: with SMTP id q184mr2482626qkf.425.1607515255954; 
 Wed, 09 Dec 2020 04:00:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcJSG02TAyUTW+VNdiN2re1N9kAh2N75Xi7v7CXyvg3kf2iqP7u2vinBaagIz7uHe3uMaKmoLrXvjkvH01MEM=
X-Received: by 2002:ae9:dcc1:: with SMTP id q184mr2482593qkf.425.1607515255708; 
 Wed, 09 Dec 2020 04:00:55 -0800 (PST)
MIME-Version: 1.0
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-5-eperezma@redhat.com>
 <20201207164323.GK203660@stefanha-x1.localdomain>
In-Reply-To: <20201207164323.GK203660@stefanha-x1.localdomain>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 9 Dec 2020 13:00:19 +0100
Message-ID: <CAJaqyWd5oAJ4kJOhyDz+1KNvwzqJi3NO+5Z7X6W5ju2Va=LTMQ@mail.gmail.com>
Subject: Re: [RFC PATCH 04/27] vhost: add vhost_kernel_set_vring_enable
To: Stefan Hajnoczi <stefanha@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kvm list <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Daniel Daly <dandaly0@gmail.com>, virtualization@lists.linux-foundation.org,
 Liran Alon <liralon@gmail.com>, Eli Cohen <eli@mellanox.com>,
 Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Rob Miller <rob.miller@broadcom.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 7, 2020 at 5:43 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Fri, Nov 20, 2020 at 07:50:42PM +0100, Eugenio P=C3=A9rez wrote:
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/virtio/vhost-backend.c | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >
> > diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
> > index 222bbcc62d..317f1f96fa 100644
> > --- a/hw/virtio/vhost-backend.c
> > +++ b/hw/virtio/vhost-backend.c
> > @@ -201,6 +201,34 @@ static int vhost_kernel_get_vq_index(struct vhost_=
dev *dev, int idx)
> >      return idx - dev->vq_index;
> >  }
> >
> > +static int vhost_kernel_set_vq_enable(struct vhost_dev *dev, unsigned =
idx,
> > +                                      bool enable)
> > +{
> > +    struct vhost_vring_file file =3D {
> > +        .index =3D idx,
> > +    };
> > +
> > +    if (!enable) {
> > +        file.fd =3D -1; /* Pass -1 to unbind from file. */
> > +    } else {
> > +        struct vhost_net *vn_dev =3D container_of(dev, struct vhost_ne=
t, dev);
> > +        file.fd =3D vn_dev->backend;
> > +    }
> > +
> > +    return vhost_kernel_net_set_backend(dev, &file);
>
> This is vhost-net specific even though the function appears to be
> generic. Is there a plan to extend this to all devices?
>

I expected each vhost backend to enable-disable in its own terms, but
I think it could be 100% virtio-device generic with something like the
device state capability:
https://lists.oasis-open.org/archives/virtio-comment/202012/msg00005.html
.

> > +}
> > +
> > +static int vhost_kernel_set_vring_enable(struct vhost_dev *dev, int en=
able)
> > +{
> > +    int i;
> > +
> > +    for (i =3D 0; i < dev->nvqs; ++i) {
> > +        vhost_kernel_set_vq_enable(dev, i, enable);
> > +    }
> > +
> > +    return 0;
> > +}
>
> I suggest exposing the per-vq interface (vhost_kernel_set_vq_enable())
> in VhostOps so it follows the ioctl interface.

It was actually the initial plan, I left as all-or-nothing to make less cha=
nges.

> vhost_kernel_set_vring_enable() can be moved to vhost.c can loop over
> all vqs if callers find it convenient to loop over all vqs.

I'm ok with it. Thinking out loud, I don't know if it is easier for
some devices to enable/disable all of it (less syscalls? less downtime
somehow?) but I find more generic and useful the per-virtqueue
approach.

Thanks!


