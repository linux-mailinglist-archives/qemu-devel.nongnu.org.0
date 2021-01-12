Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B3F2F391F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 19:46:14 +0100 (CET)
Received: from localhost ([::1]:43398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzOgH-0001lu-CI
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 13:46:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kzOJ3-0001Ti-Jt
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 13:22:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kzOIz-0002MW-T3
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 13:22:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610475726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ltzSMsOBmoKeRI1L4IOCgQ7n1ZwKFysvzmkyq562kMs=;
 b=jVj6xSJOSm65BeYrnYAI1HHEXzlLL2tgyIET/5o2de49gl9qc6Mt03Ss7Gio+H0CYwcBv5
 rf2HFXSfoBAGbD6KsdXxJ4Y+5gxCx/Ia7lFq2df2HXdzE59a7dx3fo30VWfGk8tJMTX88h
 1pyQk5VLPEaXznHbHdmcIQn26T68F/8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-r5UJI4sTMxCjK7DYVivpDQ-1; Tue, 12 Jan 2021 13:22:05 -0500
X-MC-Unique: r5UJI4sTMxCjK7DYVivpDQ-1
Received: by mail-qv1-f72.google.com with SMTP id j24so2086797qvg.8
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 10:22:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ltzSMsOBmoKeRI1L4IOCgQ7n1ZwKFysvzmkyq562kMs=;
 b=TE8LjAADqaoTGbyBtxYOsCXZAYmSOqDqn5GcjgqsruV5ksTTRi82DuiJ0HCvJKeP9+
 Cu/XYgn09Ne/9e4BGwQX8Q1a15/GXo6f9B5yXNep4mlPCJRkPLImXDyHPFvB26ydff02
 /a4BCJRnHAAfmMkY5sHVZ9cKCZ42GED+IA6giy2sVpQg/tEmxcnFd5fry+dseEPDalwu
 Yfo4CCFT5qYzmYGwUhRlZkP9MuWYOkX3xvY0h0zeC+VcMAr9H/3K6s2BU1xZJ8ymt5G7
 sVqe1u2AnRjFRTiFml7bDAYnK9GGFLbEqscUjxYdAFkH1TuMnpmdcWwRwgglJ2ZpJVYC
 VkgA==
X-Gm-Message-State: AOAM533h0d/qAyhy3XxnMYP95kXahK6b3vU92xfgtByoHXuy6BlZFTYg
 +k4HKPJ4Ui/TwNdOByrkzBpayHhyc0i1Mz0h9EMZxWpCXQHWG/GdCC1lTp7f1SmqMS1AE6nME+H
 5RzPXkvytPbTtZWnldaO/JFdSU4EWvTY=
X-Received: by 2002:ac8:5441:: with SMTP id d1mr270432qtq.384.1610475724533;
 Tue, 12 Jan 2021 10:22:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxrsSzZftWuMuBvJWz3zjdZXTF9Rj/KikTBG5Gvotrb499zSfZZnuj1AhLDoewu2jIs4sw+lQd5WdkoGYx0ic=
X-Received: by 2002:ac8:5441:: with SMTP id d1mr270398qtq.384.1610475724263;
 Tue, 12 Jan 2021 10:22:04 -0800 (PST)
MIME-Version: 1.0
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-7-eperezma@redhat.com>
 <20201207165848.GM203660@stefanha-x1.localdomain>
In-Reply-To: <20201207165848.GM203660@stefanha-x1.localdomain>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 12 Jan 2021 19:21:27 +0100
Message-ID: <CAJaqyWc4oLzL02GKpPSwEGRxK+UxjOGBAPLzrgrgKRZd9C81GA@mail.gmail.com>
Subject: Re: [RFC PATCH 06/27] virtio: Add virtio_queue_get_used_notify_split
To: Stefan Hajnoczi <stefanha@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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

On Mon, Dec 7, 2020 at 5:58 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Fri, Nov 20, 2020 at 07:50:44PM +0100, Eugenio P=C3=A9rez wrote:
> > This function is just used for a few commits, so SW LM is developed
> > incrementally, and it is deleted after it is useful.
> >
> > For a few commits, only the events (irqfd, eventfd) are forwarded.
>
> s/eventfd/ioeventfd/ (irqfd is also an eventfd)
>

Oops, will fix, thanks!

> > +bool virtio_queue_get_used_notify_split(VirtQueue *vq)
> > +{
> > +    VRingMemoryRegionCaches *caches;
> > +    hwaddr pa =3D offsetof(VRingUsed, flags);
> > +    uint16_t flags;
> > +
> > +    RCU_READ_LOCK_GUARD();
> > +
> > +    caches =3D vring_get_region_caches(vq);
> > +    assert(caches);
> > +    flags =3D virtio_lduw_phys_cached(vq->vdev, &caches->used, pa);
> > +    return !(VRING_USED_F_NO_NOTIFY & flags);
> > +}
>
> QEMU stores the notification status:
>
> void virtio_queue_set_notification(VirtQueue *vq, int enable)
> {
>     vq->notification =3D enable; <---- here
>
>     if (!vq->vring.desc) {
>         return;
>     }
>
>     if (virtio_vdev_has_feature(vq->vdev, VIRTIO_F_RING_PACKED)) {
>         virtio_queue_packed_set_notification(vq, enable);
>     } else {
>         virtio_queue_split_set_notification(vq, enable);
>
> I'm wondering why it's necessary to fetch from guest RAM instead of
> using vq->notification? It also works for both split and packed
> queues so the code would be simpler.

To use vq->notification makes sense at the end of the series.

However, at this stage (just routing notifications, not descriptors),
vhost device is the one updating that flag, not qemu. Since we cannot
just migrate used ring memory to qemu without migrating descriptors
ring too, qemu needs to check guest's memory looking for vhost device
updates on that flag.

I can see how that deserves better documentation or even a better
name. Also, this function should be in the shadow vq file, not
virtio.c.

Thanks!


