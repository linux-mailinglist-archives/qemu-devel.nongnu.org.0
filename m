Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796C4D3CEB
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 12:00:07 +0200 (CEST)
Received: from localhost ([::1]:48012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIriQ-0003TK-AT
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 06:00:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58617)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mikhail.sennikovskii@cloud.ionos.com>)
 id 1iIrhE-000321-GP
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 05:58:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mikhail.sennikovskii@cloud.ionos.com>)
 id 1iIrhC-0004te-Vc
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 05:58:52 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:43049)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mikhail.sennikovskii@cloud.ionos.com>)
 id 1iIrhC-0004t8-OP
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 05:58:50 -0400
Received: by mail-oi1-x244.google.com with SMTP id t84so7494701oih.10
 for <qemu-devel@nongnu.org>; Fri, 11 Oct 2019 02:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UY2EcVrTpHBd7yeCscxX3uQfG2bnv/qaa5v/WrrZVV8=;
 b=OEzdRVdp6ZS8lbN9uDbPL5JdjYHkbiP/kOyvddkhHXr9Tk4H6UZ4JdBPAxGrtoIKp1
 FBrLtEFeqKFbg3BkfoYXK801mygUs6ZljjSG/eSyPq+40m1IfJ5inlJfXXqKaTLxcjoN
 FiKOXVUwlEY56EizZcJiPVXGH0hR9eY569AkTd0P7qDeGmaDaQ9/bX6ZBTOyGKqL5MGT
 vGewAsebOy+w+JRQR8FceOVbE82al53n7cUEzSRN4gkr4mGYDQ8rh+O3spcPksNlRj+3
 9Vv1d5VWPpWKS4elM/EFSL6/gR+9C7jPVmjR+e7yeQwEqANOtX/1Zd9oBZIdD2QxDByR
 BfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UY2EcVrTpHBd7yeCscxX3uQfG2bnv/qaa5v/WrrZVV8=;
 b=atD8NvwdBlG2x9AVnYFIq+Rg9NvWPEAmtlCXAikp0qefIIrj7MY4djmuyZYkcqq+dD
 biRAAfoZy/byqKp0w7ROmLnsgPZ7XtR4hcGFqxb3rZyIcyC0Ar7quJggAnpl8dmMmDMj
 g9Aa/kswmuU/jv6qxIaycPs7+frNLE+Svhd2gtp7fda28n8di1z7OzEqKMyzsBBenE76
 wlYZB1iBqTZHoIlCoqzyBA9B/k+MRKrNzfB+rvVpSD3B9pma+y1b4b2Z/3iydyFO3wEB
 hZ8eernXDZN/NWA425D6GxGJTgbQ9+UPObDaoxn4oaCCboZZF/qflqiYHVnG3a/VM+HZ
 ZxaA==
X-Gm-Message-State: APjAAAXuGrMkOBX+9/7PKUU2uDwo5bWbMVzwln/KsNEq/DhO3rOOpxXo
 GYLwyFLTUXeUCTvFqVK9x7jGYHoLmjkka52m8/NuOA==
X-Google-Smtp-Source: APXvYqymXjlpiCM2YNKs5xRwCdwmr6TDq0YQSTZM8R+Z4lUHAMTuqC9Bn4hEiKDy1XHioz0iCUp8J+gKHugewKdEOkE=
X-Received: by 2002:aca:650a:: with SMTP id m10mr11581829oim.130.1570787929447; 
 Fri, 11 Oct 2019 02:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191010180412.26236-1-mst@redhat.com>
 <20191010180412.26236-2-mst@redhat.com>
 <CALHVEJYqJ+4nvuXb27-1CKkZ=EL0QyEQY_qYRDYGk9kUWdR7kw@mail.gmail.com>
 <20191011055111-mutt-send-email-mst@kernel.org>
In-Reply-To: <20191011055111-mutt-send-email-mst@kernel.org>
From: Mikhail Sennikovsky <mikhail.sennikovskii@cloud.ionos.com>
Date: Fri, 11 Oct 2019 11:58:38 +0200
Message-ID: <CALHVEJa=PPBzM+E5ppoJ+qs9a_K5yKtczW5nmOU81PkZ6rP_ig@mail.gmail.com>
Subject: Re: [RFC 2/2] virtio-net: use post load hook
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 stefanha@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Note that the virtio_net_set_features gets also called from the
virtio_pci_common_write when guest does virtio device configuration.
In that case the curr_guest_offloads are still expected to be reset.

Mikhail

Am Fr., 11. Okt. 2019 um 11:51 Uhr schrieb Michael S. Tsirkin <mst@redhat.com>:
>
> On Fri, Oct 11, 2019 at 11:46:22AM +0200, Mikhail Sennikovsky wrote:
> > Hi Michael,
> >
> > Unfortunately your approach will not work, because the
> > VirtIONet::curr_guest_offloads would still be reset in
> > virtio_net_set_features:
> > --
> > if (n->has_vnet_hdr) {
> >     n->curr_guest_offloads =
> >         virtio_net_guest_offloads_by_features(features);
>
> So let's move that part to the new hook too.
>
> > --
> > ( https://github.com/qemu/qemu/blob/master/hw/net/virtio-net.c#L774 )
> >
> > I.e. although virtio_net_apply_guest_offloads would now be called
> > after the virtio_net_set_features, by the time it is called the
> > VirtIONet::curr_guest_offloads would be reset to a full list of
> > features.
> >
> > Regards,
> > Mikhail
> >
> > Am Do., 10. Okt. 2019 um 20:04 Uhr schrieb Michael S. Tsirkin <mst@redhat.com>:
> > >
> > > Currently offloads disabled by guest via the VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET
> > > command are not preserved on VM migration.
> > > Instead all offloads reported by guest features (via VIRTIO_PCI_GUEST_FEATURES)
> > > get enabled.
> > > What happens is: first the VirtIONet::curr_guest_offloads gets restored
> > > and offloads are getting set correctly:
> > >
> > >  #0  qemu_set_offload (nc=0x555556a11400, csum=1, tso4=0, tso6=0, ecn=0, ufo=0) at net/net.c:474
> > >  #1  virtio_net_apply_guest_offloads (n=0x555557701ca0) at hw/net/virtio-net.c:720
> > >  #2  virtio_net_post_load_device (opaque=0x555557701ca0, version_id=11) at hw/net/virtio-net.c:2334
> > >  #3  vmstate_load_state (f=0x5555569dc010, vmsd=0x555556577c80 <vmstate_virtio_net_device>, opaque=0x555557701ca0, version_id=11)
> > >      at migration/vmstate.c:168
> > >  #4  virtio_load (vdev=0x555557701ca0, f=0x5555569dc010, version_id=11) at hw/virtio/virtio.c:2197
> > >  #5  virtio_device_get (f=0x5555569dc010, opaque=0x555557701ca0, size=0, field=0x55555668cd00 <__compound_literal.5>) at hw/virtio/virtio.c:2036
> > >  #6  vmstate_load_state (f=0x5555569dc010, vmsd=0x555556577ce0 <vmstate_virtio_net>, opaque=0x555557701ca0, version_id=11) at migration/vmstate.c:143
> > >  #7  vmstate_load (f=0x5555569dc010, se=0x5555578189e0) at migration/savevm.c:829
> > >  #8  qemu_loadvm_section_start_full (f=0x5555569dc010, mis=0x5555569eee20) at migration/savevm.c:2211
> > >  #9  qemu_loadvm_state_main (f=0x5555569dc010, mis=0x5555569eee20) at migration/savevm.c:2395
> > >  #10 qemu_loadvm_state (f=0x5555569dc010) at migration/savevm.c:2467
> > >  #11 process_incoming_migration_co (opaque=0x0) at migration/migration.c:449
> > >
> > > However later on the features are getting restored, and offloads get reset to
> > > everything supported by features:
> > >
> > >  #0  qemu_set_offload (nc=0x555556a11400, csum=1, tso4=1, tso6=1, ecn=0, ufo=0) at net/net.c:474
> > >  #1  virtio_net_apply_guest_offloads (n=0x555557701ca0) at hw/net/virtio-net.c:720
> > >  #2  virtio_net_set_features (vdev=0x555557701ca0, features=5104441767) at hw/net/virtio-net.c:773
> > >  #3  virtio_set_features_nocheck (vdev=0x555557701ca0, val=5104441767) at hw/virtio/virtio.c:2052
> > >  #4  virtio_load (vdev=0x555557701ca0, f=0x5555569dc010, version_id=11) at hw/virtio/virtio.c:2220
> > >  #5  virtio_device_get (f=0x5555569dc010, opaque=0x555557701ca0, size=0, field=0x55555668cd00 <__compound_literal.5>) at hw/virtio/virtio.c:2036
> > >  #6  vmstate_load_state (f=0x5555569dc010, vmsd=0x555556577ce0 <vmstate_virtio_net>, opaque=0x555557701ca0, version_id=11) at migration/vmstate.c:143
> > >  #7  vmstate_load (f=0x5555569dc010, se=0x5555578189e0) at migration/savevm.c:829
> > >  #8  qemu_loadvm_section_start_full (f=0x5555569dc010, mis=0x5555569eee20) at migration/savevm.c:2211
> > >  #9  qemu_loadvm_state_main (f=0x5555569dc010, mis=0x5555569eee20) at migration/savevm.c:2395
> > >  #10 qemu_loadvm_state (f=0x5555569dc010) at migration/savevm.c:2467
> > >  #11 process_incoming_migration_co (opaque=0x0) at migration/migration.c:449
> > >
> > > Fix this by pushing out offload initialization to the new post load hook.
> > >
> > > Reported-by: Mikhail Sennikovsky <mikhail.sennikovskii@cloud.ionos.com>
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > >  hw/net/virtio-net.c | 14 ++++++++++----
> > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > index 9f11422337..62fb858e2d 100644
> > > --- a/hw/net/virtio-net.c
> > > +++ b/hw/net/virtio-net.c
> > > @@ -2333,10 +2333,6 @@ static int virtio_net_post_load_device(void *opaque, int version_id)
> > >          n->curr_guest_offloads = virtio_net_supported_guest_offloads(n);
> > >      }
> > >
> > > -    if (peer_has_vnet_hdr(n)) {
> > > -        virtio_net_apply_guest_offloads(n);
> > > -    }
> > > -
> > >      virtio_net_set_queues(n);
> > >
> > >      /* Find the first multicast entry in the saved MAC filter */
> > > @@ -2370,6 +2366,15 @@ static int virtio_net_post_load_device(void *opaque, int version_id)
> > >      return 0;
> > >  }
> > >
> > > +static int virtio_net_post_load_virtio(VirtIODevice *vdev)
> > > +{
> > > +    if (peer_has_vnet_hdr(n)) {
> > > +        virtio_net_apply_guest_offloads(n);
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > >  /* tx_waiting field of a VirtIONetQueue */
> > >  static const VMStateDescription vmstate_virtio_net_queue_tx_waiting = {
> > >      .name = "virtio-net-queue-tx_waiting",
> > > @@ -2912,6 +2917,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
> > >      vdc->guest_notifier_mask = virtio_net_guest_notifier_mask;
> > >      vdc->guest_notifier_pending = virtio_net_guest_notifier_pending;
> > >      vdc->legacy_features |= (0x1 << VIRTIO_NET_F_GSO);
> > > +    vdc->post_load = virtio_net_post_load_virtio;
> > >      vdc->vmsd = &vmstate_virtio_net_device;
> > >  }
> > >
> > > --
> > > MST
> > >

