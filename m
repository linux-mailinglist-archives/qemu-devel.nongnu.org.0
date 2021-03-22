Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B3D344AED
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:18:40 +0100 (CET)
Received: from localhost ([::1]:56426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONGK-0006aI-0V
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lOMuL-0001CC-Bf
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:55:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lOMuI-0004sA-0J
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:55:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616428552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I4Vv77CfZNFsrVoBCrs9TiwTxb7IxI6IjNdD1me+0nI=;
 b=i1ZetcVvYu/Yy4bLCK5AHB9XGPG50L2zOBSscPNrtbViwDMCGuwIXOfosEZha0EC5iLJgT
 KAswDsaJwwIV3v1Mih+JM/H+bOfrwpjZHQP9fMty40HRJNju6rlxjmO4nLQ4ZmX1YMp4oX
 XR0c9FO3L557YijM74nHsL+UWHtSHf8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-nTVsGxLJNf69f20qt3ZPUA-1; Mon, 22 Mar 2021 11:55:50 -0400
X-MC-Unique: nTVsGxLJNf69f20qt3ZPUA-1
Received: by mail-qv1-f70.google.com with SMTP id h12so37435098qvm.9
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 08:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=I4Vv77CfZNFsrVoBCrs9TiwTxb7IxI6IjNdD1me+0nI=;
 b=jx3AkWjvRkTeeGiAcR5lj4FBTdGY5Rx4ZRZ9rYc8GDLBs2VYrShkcOiZNndinAYJFc
 h6iJGHLDj/2UfncI4ZJCPKWYI+clHl5hHFN7CEy/g9lW7oSRQhkM/7Gr4zpCXR6vVaKe
 22nH9zP4kcuPYJFMwUlP6ecYbgWm+RgQRRDcgfPT2PyMM7RB/K48pDsY64regBH1tCue
 5ZOgZvLC6EtJV3Dqy0gyhUxOYjj6GdtwIEvz6dUtzTntlocEGF9ctixR9KZ73ofKdqq1
 MyhFi1hnD5HdUdCdUaN3JMyS7x+hF0aI/CeDoq4q0LXahvGtedllgep1IIcJE56jxI/s
 dNzQ==
X-Gm-Message-State: AOAM531FjjgQisDTRedeLMEVDQEMjeTDUDyhINXCeghgw+zf6kfp7eMS
 4E2htU7D6bFn5pfOY3WQvHTT6LJW4HaGocXYwZ0g5XUq3K0zCHoVLJ4ULYnlfiJZ/GZ3yEfYQrm
 AewCNkz2yLaUq1mjhMpdCT03xyKv9rbo=
X-Received: by 2002:a37:a785:: with SMTP id q127mr631498qke.425.1616428550040; 
 Mon, 22 Mar 2021 08:55:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy892EkFwISNRff5JpJGGz+klHllkjHwGTVZUyaw5p0GcpjpVeyccAWKw9LgRI8LWE4CYBjGxmVZG2JCdTB9IQ=
X-Received: by 2002:a37:a785:: with SMTP id q127mr631477qke.425.1616428549690; 
 Mon, 22 Mar 2021 08:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-14-eperezma@redhat.com>
 <20201208081621.GR203660@stefanha-x1.localdomain>
 <CAJaqyWf13ta5MtzmTUz2N5XnQ+ebqFPYAivdggL64LEQAf=y+A@mail.gmail.com>
 <20201210115547.GH416119@stefanha-x1.localdomain>
 <CAJaqyWe3EKiHHxgtabeZ8d7TS3LKP_BsCvHjt3YUDGLxy-Egjg@mail.gmail.com>
 <CAJaqyWdNeaboGaSsXPA8r=mUsbctFLzACFKLX55yRQpTvjqxJw@mail.gmail.com>
 <YFh2tpwBdedgrwLE@stefanha-x1.localdomain>
In-Reply-To: <YFh2tpwBdedgrwLE@stefanha-x1.localdomain>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 22 Mar 2021 16:55:13 +0100
Message-ID: <CAJaqyWccygCK4a8riMy9ZTf1cDepQQTyAK4vvh08cAUCX7nTYQ@mail.gmail.com>
Subject: Re: [RFC PATCH 13/27] vhost: Send buffers to device
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-level <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 11:51 AM Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
>
> On Thu, Mar 11, 2021 at 07:53:53PM +0100, Eugenio Perez Martin wrote:
> > On Fri, Jan 22, 2021 at 7:18 PM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Thu, Dec 10, 2020 at 12:55 PM Stefan Hajnoczi <stefanha@redhat.com=
> wrote:
> > > >
> > > > On Wed, Dec 09, 2020 at 07:41:23PM +0100, Eugenio Perez Martin wrot=
e:
> > > > > On Tue, Dec 8, 2020 at 9:16 AM Stefan Hajnoczi <stefanha@gmail.co=
m> wrote:
> > > > > > On Fri, Nov 20, 2020 at 07:50:51PM +0100, Eugenio P=C3=A9rez wr=
ote:
> > > > > > > +        while (true) {
> > > > > > > +            int r;
> > > > > > > +            if (virtio_queue_full(vq)) {
> > > > > > > +                break;
> > > > > > > +            }
> > > > > >
> > > > > > Why is this check necessary? The guest cannot provide more desc=
riptors
> > > > > > than there is ring space. If that happens somehow then it's a d=
river
> > > > > > error that is already reported in virtqueue_pop() below.
> > > > > >
> > > > >
> > > > > It's just checked because virtqueue_pop prints an error on that c=
ase,
> > > > > and there is no way to tell the difference between a regular erro=
r and
> > > > > another caused by other causes. Maybe the right thing to do is ju=
st to
> > > > > not to print that error? Caller should do the error printing in t=
hat
> > > > > case. Should we return an error code?
> > > >
> > > > The reason an error is printed today is because it's a guest error =
that
> > > > never happens with correct guest drivers. Something is broken and t=
he
> > > > user should know about it.
> > > >
> > > > Why is "virtio_queue_full" (I already forgot what that actually mea=
ns,
> > > > it's not clear whether this is referring to avail elements or used
> > > > elements) a condition that should be silently ignored in shadow vqs=
?
> > > >
> > >
> > > TL;DR: It can be changed to a check of the number of available
> > > descriptors in shadow vq, instead of returning as a regular operation=
.
> > > However, I think that making it a special return of virtqueue_pop
> > > could help in devices that run to completion, avoiding having to
> > > duplicate the count logic in them.
> > >
> > > The function virtio_queue_empty checks if the vq has all descriptors
> > > available, so the device has no more work to do until the driver make=
s
> > > another descriptor available. I can see how it can be a bad name
> > > choice, but virtio_queue_full means the opposite: device has pop()
> > > every descriptor available, and it has not returned any, so the drive=
r
> > > cannot progress until the device marks some descriptors as used.
> > >
> > > As I understand, if vq->in_use >vq->num would mean we have a bug in
> > > the device vq code, not in the driver. virtio_queue_full could even b=
e
> > > changed to "assert(vq->inuse <=3D vq->vring.num); return vq->inuse =
=3D=3D
> > > vq->vring.num", as long as vq->in_use is operated right.
> > >
> > > If we hit vq->in_use =3D=3D vq->num in virtqueue_pop it means the dev=
ice
> > > tried to pop() one more buffer after having all of them available and
> > > pop'ed. This would be invalid if the device is counting right the
> > > number of in_use descriptors, but then we are duplicating that logic
> > > in the device and the vq.
>
> Devices call virtqueue_pop() until it returns NULL. They don't need to
> count virtqueue buffers explicitly. It returns NULL when vq->num
> virtqueue buffers have already been popped (either because
> virtio_queue_empty() is true or because an invalid driver state is
> detected by checking vq->num in virtqueue_pop()).

If I understood you right, the virtio_queue_full addresses the reverse
problem: it controls when the virtqueue is out of buffers to make
available for the device because the latter has not consumed any, not
when the driver does not offer more buffers to the device because it
has no more data to offer.

I find it easier to explain with the virtio-net rx queue (and I think
it's the easier way to trigger this issue). You are describing it's
regular behavior: The guest fills it (let's say 100%), and the device
picks buffers one by one:

virtio_net_receive_rcu:
while (offset < size) {
    elem =3D virtqueue_pop(q->rx_vq, sizeof(VirtQueueElement));
    if (!elem) {
        virtio_error("unexpected empty queue");
    }
    /* [1] */
    /* fill elem with rx packet */
    virtqueue_fill(virtqueue, elem);
    ...
    virtqueue_flush(q->rx_vq, i);
}

Every device as far as I know does this buffer by buffer, there is
just processing code in [1], and it never tries to pop more than one
buffers/chain of buffers at the same time. In the case of a queue
empty (no more available buffers), we hit an error, because there are
no more buffers to write. In other devices (or tx queue), empty
buffers means there is no more work to do, not an error.

In the case of shadow virtqueue, we cannot limit the number of exposed
rx buffers to 1 buffer/chain of buffers in [1], since it will affect
batching. We have the opposite problem: All devices (but rx queue)
want to queue "as empty as possible", or "to mark all available
buffers empty". Net rx queue is ok as long as it has a buffer/buffer
chain big enough to write to, but it will fetch them on demand, so
"queue full" (as in all buffers are available) is not a problem for
the device.

However, the part of the shadow virtqueue that forwards the available
buffer seeks the opposite: It wants as many buffers as possible to be
available. That means that there is no [1] code that fills/read &
flush/detach the buffer immediately: Shadow virtqueue wants to make
available as many buffers as possible, but the device may not use them
until it has more data available. To the extreme (virtio-net rx queue
full), shadow virtqueue may make available all buffers, so in a
while(true) loop, it will try to make them available until it hits
that all the buffers are already available (vq->in_use =3D=3D vq->num).

The solution is to check the number of buffers already available
before calling virtio_queue_pop(). We could duplicate in_use in shadow
virtqueue, of course, but everything we need is already done in
VirtQueue code, so I think to reuse it is a better solution. Another
solution could be to treat vq->in_use =3D=3D vq->num as an special return
code with no printed error in virtqueue_pop, but to expose if the
queue is full (as vq->in_use =3D=3D vq->num) sounds less invasive to me.

>
> > > In shadow vq this situation happens with the correct guest network
> > > driver, since the rx queue is filled for the device to write. Network
> > > device in qemu fetch descriptors on demand, but shadow vq fetch all
> > > available in batching. If the driver just happens to fill the queue o=
f
> > > available descriptors, the log will raise, so we need to check in
> > > handle_sw_lm_vq before calling pop(). Of course the shadow vq can
> > > duplicate guest_vq->in_use instead of checking virtio_queue_full, but
> > > then it needs to check two things for every virtqueue_pop() [1].
>
> I don't understand this scenario. It sounds like you are saying the
> guest and shadow rx vq are not in sync so there is a case where
> vq->in_use > vq->num is triggered?

Sorry if I explain it bad, what I meant is that there is a case where
SVQ (as device code) will call virtqueue_pop() when vq->in_use =3D=3D
vq->num. virtio_queue_full maintains the check as >=3D, I think it
should be safe to even to code virtio_queue_full to:

assert(vq->in_use > vq->num);
return vq->inuse =3D=3D vq->num;

Please let me know if this is not clear enough.

Thanks!

> I'm not sure how that can happen
> since both vqs have equal vq->num. Maybe you can explain the scenario in
> more detail?
>
> Stefan


