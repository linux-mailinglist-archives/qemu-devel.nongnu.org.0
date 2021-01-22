Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 931AA300B2D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 19:26:13 +0100 (CET)
Received: from localhost ([::1]:55268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l318O-0000sy-Iy
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 13:26:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l311k-0007hZ-Lg
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:19:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l311i-0006ww-Mb
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611339557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i5uG3VkTMr9TyU6fW63sMt/tjIFddnD19fqLFaikmWM=;
 b=SCsMVNuNfynObix7MAibDszyU9WbvX+qwCqgGF0W5BKL89uu5CFioALt4Fds8qgJBc1pnM
 AAOfIMUejoE37ptzCzYTVcSeRIGdIsqCDvvmmkU5/jvpJJ1kEHn7V63ba6APdLhSosBXsS
 KlSL4lGPUDbeOO5f3f9s2RdlILklb5c=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-P0zj-z88ORWuUbvmpbQUtQ-1; Fri, 22 Jan 2021 13:19:16 -0500
X-MC-Unique: P0zj-z88ORWuUbvmpbQUtQ-1
Received: by mail-qv1-f70.google.com with SMTP id m8so4468396qvt.14
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 10:19:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=i5uG3VkTMr9TyU6fW63sMt/tjIFddnD19fqLFaikmWM=;
 b=h1ciz015H7yoh+UO1tMaq7cWbep7XuV+y9ymV8xWAybPF8hXT5kPK6khrwkYiNrCY8
 /zxeuESlbFiDzS/YjfNL3jeFtRZr4V2K4H6vRAiapNxM8lim/RWdLeNcJS3L8HqMSq09
 E1OVO7KpFxiU+5IsgiO3OrozlzW49O61QmzaRbgczs/jJbbmslaMdE2wzJZOnlNZJ3Zn
 8ZKqaaYU4oFso+xxMmWuXDYgDFH0NO6E51QLDExmKdySigUZkOaXhYPJlfSUQ5AXNef9
 qG6oMWWfx6ANpbUMCX9vgEPPgLpaH/OZ8UQGRIy5kYXm8HHdf6mwNg2u+ba7iPNPQ8Ro
 6quQ==
X-Gm-Message-State: AOAM532QJVB0AjJb2Z9Z4cZknzbN87NgP2uBBSxHGBBWyTV+mX2wL2/H
 7oGsp9YTFJhoolt2vusQloDN6ZkYZnKtAkuMslDk+0lqbN5DeW2nA0d6XdeXzMfyt17Iy3l1p4t
 GbU/7wbeRvPuViBacK9xc7pfRAS+APbU=
X-Received: by 2002:aed:3ac1:: with SMTP id o59mr5439434qte.203.1611339555672; 
 Fri, 22 Jan 2021 10:19:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpPu8drxNo1TOf01hRflaUbJD4hoWniIU5vblEAujNTjuxLzJtBLkYPa8MgoCrN1bnI0xumA6K4af+E0k4B48=
X-Received: by 2002:aed:3ac1:: with SMTP id o59mr5439388qte.203.1611339555418; 
 Fri, 22 Jan 2021 10:19:15 -0800 (PST)
MIME-Version: 1.0
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-14-eperezma@redhat.com>
 <20201208081621.GR203660@stefanha-x1.localdomain>
 <CAJaqyWf13ta5MtzmTUz2N5XnQ+ebqFPYAivdggL64LEQAf=y+A@mail.gmail.com>
 <20201210115547.GH416119@stefanha-x1.localdomain>
In-Reply-To: <20201210115547.GH416119@stefanha-x1.localdomain>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 22 Jan 2021 19:18:39 +0100
Message-ID: <CAJaqyWe3EKiHHxgtabeZ8d7TS3LKP_BsCvHjt3YUDGLxy-Egjg@mail.gmail.com>
Subject: Re: [RFC PATCH 13/27] vhost: Send buffers to device
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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

On Thu, Dec 10, 2020 at 12:55 PM Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
>
> On Wed, Dec 09, 2020 at 07:41:23PM +0100, Eugenio Perez Martin wrote:
> > On Tue, Dec 8, 2020 at 9:16 AM Stefan Hajnoczi <stefanha@gmail.com> wro=
te:
> > > On Fri, Nov 20, 2020 at 07:50:51PM +0100, Eugenio P=C3=A9rez wrote:
> > > > +        while (true) {
> > > > +            int r;
> > > > +            if (virtio_queue_full(vq)) {
> > > > +                break;
> > > > +            }
> > >
> > > Why is this check necessary? The guest cannot provide more descriptor=
s
> > > than there is ring space. If that happens somehow then it's a driver
> > > error that is already reported in virtqueue_pop() below.
> > >
> >
> > It's just checked because virtqueue_pop prints an error on that case,
> > and there is no way to tell the difference between a regular error and
> > another caused by other causes. Maybe the right thing to do is just to
> > not to print that error? Caller should do the error printing in that
> > case. Should we return an error code?
>
> The reason an error is printed today is because it's a guest error that
> never happens with correct guest drivers. Something is broken and the
> user should know about it.
>
> Why is "virtio_queue_full" (I already forgot what that actually means,
> it's not clear whether this is referring to avail elements or used
> elements) a condition that should be silently ignored in shadow vqs?
>

TL;DR: It can be changed to a check of the number of available
descriptors in shadow vq, instead of returning as a regular operation.
However, I think that making it a special return of virtqueue_pop
could help in devices that run to completion, avoiding having to
duplicate the count logic in them.

The function virtio_queue_empty checks if the vq has all descriptors
available, so the device has no more work to do until the driver makes
another descriptor available. I can see how it can be a bad name
choice, but virtio_queue_full means the opposite: device has pop()
every descriptor available, and it has not returned any, so the driver
cannot progress until the device marks some descriptors as used.

As I understand, if vq->in_use >vq->num would mean we have a bug in
the device vq code, not in the driver. virtio_queue_full could even be
changed to "assert(vq->inuse <=3D vq->vring.num); return vq->inuse =3D=3D
vq->vring.num", as long as vq->in_use is operated right.

If we hit vq->in_use =3D=3D vq->num in virtqueue_pop it means the device
tried to pop() one more buffer after having all of them available and
pop'ed. This would be invalid if the device is counting right the
number of in_use descriptors, but then we are duplicating that logic
in the device and the vq.

In shadow vq this situation happens with the correct guest network
driver, since the rx queue is filled for the device to write. Network
device in qemu fetch descriptors on demand, but shadow vq fetch all
available in batching. If the driver just happens to fill the queue of
available descriptors, the log will raise, so we need to check in
handle_sw_lm_vq before calling pop(). Of course the shadow vq can
duplicate guest_vq->in_use instead of checking virtio_queue_full, but
then it needs to check two things for every virtqueue_pop() [1].

Having said that, would you prefer a checking of available slots in
the shadow vq?

Thanks!

[1] if we don't change virtqueue_pop code.


