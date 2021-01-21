Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 937A22FF591
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 21:13:47 +0100 (CET)
Received: from localhost ([::1]:37054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2gKw-0001jC-NO
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 15:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l2gIb-0007P8-Le
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:11:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l2gIY-000826-RS
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:11:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611259876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9/S1AC2FTxz4g0HD+H8LDYzz2hqAr1Tv6Nfanb0Lvqs=;
 b=IWQRBTPa5ihLzY46EAm0VxR0HysVso1ojQQ4HaIrtIHCVEl9OXfbe9t1LXbbDzuFaeCIf1
 ga0U2A94oyeQHKPDPV2wVLFZjatl0xeBRPPw7hPHxNY+vqYNve37SA+Qc4a9IVwSVTDVOI
 9laU3kFu1JEiRqemjMOHbWcTLaTsybg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-SVUtXVJrMIyYXNjGrTB5zQ-1; Thu, 21 Jan 2021 15:11:15 -0500
X-MC-Unique: SVUtXVJrMIyYXNjGrTB5zQ-1
Received: by mail-qk1-f197.google.com with SMTP id w204so2452659qka.18
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 12:11:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9/S1AC2FTxz4g0HD+H8LDYzz2hqAr1Tv6Nfanb0Lvqs=;
 b=tTnwNni6aMqmFPU3YDTNqvVIvr0el3URO+zIjqgPehe4NTiNVLF1Le+xfFCpHilxmI
 sIa4OKdP3jZV6l6/SWVOwm4qbYiIMIXa5IktO18VMHoyOIT/R3MPIvKCsHGxuCxarWI2
 RpNppt8me9hzpV1I9SclSi5kqwshK2zF2LStAIXRZSvraxrE238C+DQMnP+DZWARPJCu
 cTalf2GuBSNRBcQBSA4wmzGVZEQXNsL9LQlo38gC72JbMouFM6rtlcr6yqFqRDY9mgs9
 4n4ABU0ud/PhFuiy2EztdqTXG10XlfUt0b9LfeHgivpVC564ITYr7apuBXNzekPPo+jY
 EHhg==
X-Gm-Message-State: AOAM532ejNP+VpRh9dKbyIMRH6Cpx3iWJuCx4e0MpLSDvGeB6aSKbTtT
 W85PpxYy5voG5ocQF0SVyY9c6p8cFCz/6AiGzylB528dW6wqjK2evQxN+0zKWEH5LyuSw+oeb1N
 8wzT6P2DlWug9/hNbl3TXqwJFDI94clk=
X-Received: by 2002:a0c:fa4c:: with SMTP id k12mr1256453qvo.16.1611259874855; 
 Thu, 21 Jan 2021 12:11:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkXvOAGt6ZlMe8/BD9HMhDfNICZQCgC6hAVFS6cVSwfZjK0GbFoBhGZB0aChoPvFURG4te+3SSi7EtluXcDP4=
X-Received: by 2002:a0c:fa4c:: with SMTP id k12mr1256415qvo.16.1611259874594; 
 Thu, 21 Jan 2021 12:11:14 -0800 (PST)
MIME-Version: 1.0
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-8-eperezma@redhat.com>
 <20201207174233.GN203660@stefanha-x1.localdomain>
 <CAJaqyWfiMsRP9FgSv7cOj=3jHx=DJS7hRJTMbRcTTHHWng0eKg@mail.gmail.com>
 <20201210115052.GG416119@stefanha-x1.localdomain>
In-Reply-To: <20201210115052.GG416119@stefanha-x1.localdomain>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 21 Jan 2021 21:10:38 +0100
Message-ID: <CAJaqyWcN2LWC+XmU6zSG-kgrfhGc4VXjG+zj2LgCe3haLfeRgg@mail.gmail.com>
Subject: Re: [RFC PATCH 07/27] vhost: Route guest->host notification through
 qemu
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Stefan Hajnoczi <stefanha@gmail.com>, Jason Wang <jasowang@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Daniel Daly <dandaly0@gmail.com>,
 virtualization@lists.linux-foundation.org, Liran Alon <liralon@gmail.com>,
 Eli Cohen <eli@mellanox.com>, Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Rob Miller <rob.miller@broadcom.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 10, 2020 at 12:51 PM Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
>
> On Wed, Dec 09, 2020 at 06:08:14PM +0100, Eugenio Perez Martin wrote:
> > On Mon, Dec 7, 2020 at 6:42 PM Stefan Hajnoczi <stefanha@gmail.com> wro=
te:
> > > On Fri, Nov 20, 2020 at 07:50:45PM +0100, Eugenio P=C3=A9rez wrote:
> > > > +{
> > > > +    struct vhost_vring_file file =3D {
> > > > +        .index =3D idx
> > > > +    };
> > > > +    VirtQueue *vq =3D virtio_get_queue(dev->vdev, idx);
> > > > +    VhostShadowVirtqueue *svq;
> > > > +    int r;
> > > > +
> > > > +    svq =3D g_new0(VhostShadowVirtqueue, 1);
> > > > +    svq->vq =3D vq;
> > > > +
> > > > +    r =3D event_notifier_init(&svq->hdev_notifier, 0);
> > > > +    assert(r =3D=3D 0);
> > > > +
> > > > +    file.fd =3D event_notifier_get_fd(&svq->hdev_notifier);
> > > > +    r =3D dev->vhost_ops->vhost_set_vring_kick(dev, &file);
> > > > +    assert(r =3D=3D 0);
> > > > +
> > > > +    return svq;
> > > > +}
> > >
> > > I guess there are assumptions about the status of the device? Does th=
e
> > > virtqueue need to be disabled when this function is called?
> > >
> >
> > Yes. Maybe an assertion checking the notification state?
>
> Sounds good.
>
> > > > +
> > > > +static int vhost_sw_live_migration_stop(struct vhost_dev *dev)
> > > > +{
> > > > +    int idx;
> > > > +
> > > > +    vhost_dev_enable_notifiers(dev, dev->vdev);
> > > > +    for (idx =3D 0; idx < dev->nvqs; ++idx) {
> > > > +        vhost_sw_lm_shadow_vq_free(dev->sw_lm_shadow_vq[idx]);
> > > > +    }
> > > > +
> > > > +    return 0;
> > > > +}
> > > > +
> > > > +static int vhost_sw_live_migration_start(struct vhost_dev *dev)
> > > > +{
> > > > +    int idx;
> > > > +
> > > > +    for (idx =3D 0; idx < dev->nvqs; ++idx) {
> > > > +        dev->sw_lm_shadow_vq[idx] =3D vhost_sw_lm_shadow_vq(dev, i=
dx);
> > > > +    }
> > > > +
> > > > +    vhost_dev_disable_notifiers(dev, dev->vdev);
> > >
> > > There is a race condition if the guest kicks the vq while this is
> > > happening. The shadow vq hdev_notifier needs to be set so the vhost
> > > device checks the virtqueue for requests that slipped in during the
> > > race window.
> > >
> >
> > I'm not sure if I follow you. If I understand correctly,
> > vhost_dev_disable_notifiers calls virtio_bus_cleanup_host_notifier,
> > and the latter calls virtio_queue_host_notifier_read. That's why the
> > documentation says "This might actually run the qemu handlers right
> > away, so virtio in qemu must be completely setup when this is
> > called.". Am I missing something?
>
> There are at least two cases:
>
> 1. Virtqueue kicks that come before vhost_dev_disable_notifiers().
>    vhost_dev_disable_notifiers() notices that and calls
>    virtio_queue_notify_vq(). Will handle_sw_lm_vq() be invoked or is the
>    device's vq handler function invoked?
>

As I understand both the code and your question, no kick can call
handle_sw_lm_vq before vhost_dev_disable_notifiers (in particular,
before memory_region_add_eventfd calls in
virtio_{pci,mmio,ccw}_ioeventfd_assign(true) calls. So these will be
handled by the device.

> 2. Virtqueue kicks that come in after vhost_dev_disable_notifiers()
>    returns. We hold the QEMU global mutex so the vCPU thread cannot
>    perform MMIO/PIO dispatch immediately. The vCPU thread's
>    ioctl(KVM_RUN) has already returned and will dispatch dispatch the
>    MMIO/PIO access inside QEMU as soon as the global mutex is released.
>    In other words, we're not taking the kvm.ko ioeventfd path but
>    memory_region_dispatch_write_eventfds() should signal the ioeventfd
>    that is registered at the time the dispatch occurs. Is that eventfd
>    handled by handle_sw_lm_vq()?
>

I didn't think on that case, but it's being very difficult for me to
reproduce that behavior. It should be handled by handle_sw_lm_vq, but
maybe I'm trusting too much in vhost_dev_disable_notifiers.

> Neither of these cases are obvious from the code. At least comments
> would help but I suspect restructuring the code so the critical
> ioeventfd state changes happen in a sequence would make it even clearer.

Could you expand on this? That change is managed entirely by
virtio_bus_set_host_notifier, and the virtqueue callback is already
changed before the call to vhost_dev_disable_notifiers(). Did you mean
to restructure virtio_bus_set_host_notifier or
vhost_dev_disable_notifiers maybe?

Thanks!


