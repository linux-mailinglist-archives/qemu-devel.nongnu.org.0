Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE8932AA2B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 20:16:27 +0100 (CET)
Received: from localhost ([::1]:38008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHAVP-0003wW-0W
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 14:16:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lH9rM-0006Kx-5y
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:35:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lH9rK-0004hf-6l
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:35:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614710101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tkxzT6eGQQunGDeBfXZ5nUwmm4W221ZStlrJWqytAHo=;
 b=gN/EmSjTxSn9vfkAPvAL3MMo1tcvBOWrpl/u6BO+zRJ8BJcF1lZYeD3eHqPOusTC9HHYv5
 V4tBG5GKGUxmAJC3C991kseHfya4RSc5NzAlwek3bZciUzJTf4LJm7AsbgJRc4nSAT7xY/
 E5IGAmI9ufsGP53yAkwH+WpJWXXgsE8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-KDtqOaJON9KY4oW2CP6F0Q-1; Tue, 02 Mar 2021 13:34:58 -0500
X-MC-Unique: KDtqOaJON9KY4oW2CP6F0Q-1
Received: by mail-qv1-f70.google.com with SMTP id jx11so9097537qvb.10
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 10:34:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tkxzT6eGQQunGDeBfXZ5nUwmm4W221ZStlrJWqytAHo=;
 b=T0ZCPbjuXHYF13Z/ui0R7Cv56Xq5VarHEuCXEQtrTY/T2OxPrygNaRK/baFZ7N86t5
 ZohjPXKwGmlolJSubrt6oMldrtEBffTl/x9sbwGk2DCYS/n+PD+M1y/nccb3EqXNdU/a
 0sZ+QX+h9EWilJR3kOzUSRkeuFaDyKUXU88buwiaanOJyUkhg0HkhO5Wy4OOHgFqB8xT
 Yw2HPyrF3N+qbYZCFJ1jUFFr6k4NSWBj6S+H+Rubr/GqEd+4AcgpVhRpRrQip7Lv9h3Z
 Dp80AfpJNkrxOoxMtj63YDaXsHXW+S5WNQpjGwwqTdkGxfVZiS0rZRlTvn+YqhnKDEmf
 4PLg==
X-Gm-Message-State: AOAM530GUfIJkkKw+AlnjDHCxhciW68YWeFSJSLA9ad6tXcl9ZJPMvEy
 f3LptAWokbOy30fXl46MIMMkFKG3Nzbu4qA3gntSO7FZNb24zZB3kEqy/n8YaEuhFqjC5CqL26G
 LVpJSpjKStB4M95TorEPRcQKpeJ70ETk=
X-Received: by 2002:a37:a785:: with SMTP id q127mr1189787qke.425.1614710097255; 
 Tue, 02 Mar 2021 10:34:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyM1RgDFsSo8eAG5i1uUEDF42mlVywf5r9ywIBg4y0XWNnvPp9gd/vAMbtuh4g8pVo6SmdIHTGoPK0tZrUU+wo=
X-Received: by 2002:a37:a785:: with SMTP id q127mr1189751qke.425.1614710096940; 
 Tue, 02 Mar 2021 10:34:56 -0800 (PST)
MIME-Version: 1.0
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-7-eperezma@redhat.com>
 <20201207165848.GM203660@stefanha-x1.localdomain>
 <CAJaqyWc4oLzL02GKpPSwEGRxK+UxjOGBAPLzrgrgKRZd9C81GA@mail.gmail.com>
 <YD4f4KEIYRlTUP4/@stefanha-x1.localdomain>
In-Reply-To: <YD4f4KEIYRlTUP4/@stefanha-x1.localdomain>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 2 Mar 2021 19:34:20 +0100
Message-ID: <CAJaqyWd0iRUUW5Hu=U3mwQ4f43kA=bse3EkN4+QauFR4BJwObQ@mail.gmail.com>
Subject: Re: [RFC PATCH 06/27] virtio: Add virtio_queue_get_used_notify_split
To: Stefan Hajnoczi <stefanha@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Tue, Mar 2, 2021 at 12:22 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Tue, Jan 12, 2021 at 07:21:27PM +0100, Eugenio Perez Martin wrote:
> > On Mon, Dec 7, 2020 at 5:58 PM Stefan Hajnoczi <stefanha@gmail.com> wro=
te:
> > >
> > > On Fri, Nov 20, 2020 at 07:50:44PM +0100, Eugenio P=C3=A9rez wrote:
> > > > This function is just used for a few commits, so SW LM is developed
> > > > incrementally, and it is deleted after it is useful.
> > > >
> > > > For a few commits, only the events (irqfd, eventfd) are forwarded.
> > >
> > > s/eventfd/ioeventfd/ (irqfd is also an eventfd)
> > >
> >
> > Oops, will fix, thanks!
> >
> > > > +bool virtio_queue_get_used_notify_split(VirtQueue *vq)
> > > > +{
> > > > +    VRingMemoryRegionCaches *caches;
> > > > +    hwaddr pa =3D offsetof(VRingUsed, flags);
> > > > +    uint16_t flags;
> > > > +
> > > > +    RCU_READ_LOCK_GUARD();
> > > > +
> > > > +    caches =3D vring_get_region_caches(vq);
> > > > +    assert(caches);
> > > > +    flags =3D virtio_lduw_phys_cached(vq->vdev, &caches->used, pa)=
;
> > > > +    return !(VRING_USED_F_NO_NOTIFY & flags);
> > > > +}
> > >
> > > QEMU stores the notification status:
> > >
> > > void virtio_queue_set_notification(VirtQueue *vq, int enable)
> > > {
> > >     vq->notification =3D enable; <---- here
> > >
> > >     if (!vq->vring.desc) {
> > >         return;
> > >     }
> > >
> > >     if (virtio_vdev_has_feature(vq->vdev, VIRTIO_F_RING_PACKED)) {
> > >         virtio_queue_packed_set_notification(vq, enable);
> > >     } else {
> > >         virtio_queue_split_set_notification(vq, enable);
> > >
> > > I'm wondering why it's necessary to fetch from guest RAM instead of
> > > using vq->notification? It also works for both split and packed
> > > queues so the code would be simpler.
> >
> > To use vq->notification makes sense at the end of the series.
> >
> > However, at this stage (just routing notifications, not descriptors),
> > vhost device is the one updating that flag, not qemu. Since we cannot
> > just migrate used ring memory to qemu without migrating descriptors
> > ring too, qemu needs to check guest's memory looking for vhost device
> > updates on that flag.
> >
> > I can see how that deserves better documentation or even a better
> > name. Also, this function should be in the shadow vq file, not
> > virtio.c.
>
> I can't think of a reason why QEMU needs to know the flag value that the
> vhost device has set. This flag is a hint to the guest driver indicating
> whether the device wants to receive notifications.
>
> Can you explain why QEMU needs to look at the value of the flag?
>
> Stefan

My bad, "need" is not the right word: SVQ could just forward the
notification at this point without checking the flag. Taking into
account that it's not used in later series, and it's even removed in
patch 14/27 of this series, I can see that it just adds noise to the
entire patchset

This function just allows svq to re-check the flag after the guest
sends the notification. This way svq is able to drop the kick as a
(premature?) optimization in case the device sets it just after the
guest sends the kick.

Until patch 13/27, only notifications are forwarded, not buffers. VM
guest's drivers and vhost device still read and write at usual
addresses, but ioeventfd and kvmfd are intercepted by qemu. This
allows us to test if the notification forwarding part is doing ok.
From patch 14 of this series, svq offers a new vring to the device in
qemu's VAS, so the former does not need to check the guest's memory
anymore, and this function can be dropped.

Is it clearer now? Please let me know if I should add something else.

Thanks!


