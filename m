Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCE4442759
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 07:59:03 +0100 (CET)
Received: from localhost ([::1]:47806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhnl8-0000OV-0h
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 02:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhniy-00088q-Mg
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 02:56:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhniw-0004eW-8i
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 02:56:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635836204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zk/hyB3h+pJLsnangCNjUiAWq7kbKbpRJOjiEYJfMws=;
 b=PUPynCSWK8/kQkAxlsWU84AGOi1PJt3fq1MdI0myawMIqeESuD410rUSzxfeg0a6Fqo6WQ
 s7RE7Lksd65YOyrwmiAn+AP6sfblmdjm7kwDtRR63ELslgngFaLnZMI3kSz/Qld8UlAAZb
 kIYgYXzq2hOKF+74gR52fmp+H1XYsLs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-u6a-T9N5PNu17wg1U0ZSMw-1; Tue, 02 Nov 2021 02:55:08 -0400
X-MC-Unique: u6a-T9N5PNu17wg1U0ZSMw-1
Received: by mail-qv1-f70.google.com with SMTP id
 e10-20020a0cd64a000000b0038422ec2242so18599046qvj.19
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 23:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Zk/hyB3h+pJLsnangCNjUiAWq7kbKbpRJOjiEYJfMws=;
 b=kZHBuNX+8vSWzywSWhN6LeknhydaAWXuy9ncpCRhFt1lMzreZv08DVl+uSVD30Qzml
 YgdJc+EizjHUZLGnI+EuCbihUl10cjh8XrPASBbs3ZfsANgL57ypd/N6cyxuGFDS3UGm
 bIzOkHT48O8YIWHMPgD3Vj9FByrEwgeKb4TPg5tRlwMG6bJBCaNUih+jiEaXx2oo8EL8
 mBkLcvGieSqAttOln/hVpDs2j60shuBvhu/xw8bijNTUHVh+rj1A8WVwjXdMKl+1h6Ph
 Cww0mGfocUbU36pkV+KJxQIxdfFyBOADsp8bWzGISxFTO0xsB62lz7lmYo0O5MS4Ugt/
 vJHg==
X-Gm-Message-State: AOAM530hu4AkO0Sc6Lz5dULGR1YWSgsF0VbLsGTPYvPNN3XAj/X7wnRC
 nomY3cctO8G1aQ3m29QbnbS0EMUTIlWArhMEGBHRnY6nnPIktYdXcyqJ0/iBoAo2YzUq5IZChq4
 ZMc/MvxcH5NInQIJP5b7nc5SxhbH6ddQ=
X-Received: by 2002:ac8:598d:: with SMTP id e13mr36994416qte.76.1635836107594; 
 Mon, 01 Nov 2021 23:55:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwF+LWJqmI7BYm+epfg3p2hPyYg5AohKo1w5zwzXDSp9sHODTCogx/Coa2j1wjJDkZKPDTIsmEmmLKizSN8rkg=
X-Received: by 2002:ac8:598d:: with SMTP id e13mr36994399qte.76.1635836107364; 
 Mon, 01 Nov 2021 23:55:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211029141608.1728855-1-eperezma@redhat.com>
 <CACGkMEss8Xq8WYUkDkLaYx-XBW6GADDAjH1mwmpBdxKc2wsRAQ@mail.gmail.com>
 <CAJaqyWcsbtOoLGkCW6J_9M8qR1-yvbQmWq1rU0y+8Y=BhPeRWw@mail.gmail.com>
 <CAJaqyWdBMCeFZ4yARpezqmZSSoiLKBStNDm_CLJPrZRDx7X4wg@mail.gmail.com>
 <20211101164749-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211101164749-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 2 Nov 2021 07:54:31 +0100
Message-ID: <CAJaqyWcEq5-f=W3TnC+ZS3aKP4q9cUwXWKUieuWbQ0i8v50dEQ@mail.gmail.com>
Subject: Re: [PATCH] vhost: Fix last queue index of devices with no cvq
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 1, 2021 at 9:48 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Nov 01, 2021 at 04:42:01PM +0100, Eugenio Perez Martin wrote:
> > On Mon, Nov 1, 2021 at 9:58 AM Eugenio Perez Martin <eperezma@redhat.co=
m> wrote:
> > >
> > > On Mon, Nov 1, 2021 at 4:34 AM Jason Wang <jasowang@redhat.com> wrote=
:
> > > >
> > > > On Fri, Oct 29, 2021 at 10:16 PM Eugenio P=C3=A9rez <eperezma@redha=
t.com> wrote:
> > > > >
> > > > > The -1 assumes that all devices with no cvq have an spare vq allo=
cated
> > > > > for them, but with no offer of VIRTIO_NET_F_CTRL_VQ. This may not=
 be the
> > > > > case, and the device may have a pair number of queues.
> > > > >
> > > > > To fix this, just resort to the lower even number of queues.
> > > > >
> > > > > Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index for =
the virtio device")
> > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > ---
> > > > >  hw/net/vhost_net.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > > > > index 0d888f29a6..edf56a597f 100644
> > > > > --- a/hw/net/vhost_net.c
> > > > > +++ b/hw/net/vhost_net.c
> > > > > @@ -330,7 +330,7 @@ int vhost_net_start(VirtIODevice *dev, NetCli=
entState *ncs,
> > > > >      NetClientState *peer;
> > > > >
> > > > >      if (!cvq) {
> > > > > -        last_index -=3D 1;
> > > > > +        last_index &=3D ~1ULL;
> > > > >      }
> > > >
> > > > The math here looks correct but we need to fix vhost_vdpa_dev_start=
() instead?
> > > >
> > > > if (dev->vq_index + dev->nvqs - 1 !=3D dev->last_index) {
> > > > ...
> > > > }
> > > >
> > >
> > > If we just do that, devices that offer an odd number of queues but do
> > > not offer ctrl vq would never enable the last vq pair, isn't it?
> > >
> >
> > To expand the issue,
> >
> > With that condition it is not possible to make vp_vdpa work on devices
> > with no cvq. If I set the L0 guest's device with no cvq (with -device
> > virtio-net-pci,...,ctrl_vq=3Doff,mq=3Doff). The nested VM will enter th=
at
> > conditional in vhost_net_start, and will mark last_index=3D1, making it
> > impossible to start a vhost_vdpa device.
> >
> > However, re-reading the standard:
> >
> > controlq only exists if VIRTIO_NET_F_CTRL_VQ set.
> >
> > So the code is actually handling an invalid device: The device set
> > VIRTIO_NET_F_CTRL_VQ but offered an odd number of VQs.
> >
> > Do we have an example of such a device? It's not the case on qemu
> > virtio-net, with or without vhost-net in L0 device. The operation &=3D
> > ~1ULL is an intended noop in case the queues are already even. I'm
> > fine to keep making last_index even, so we have that safety net, with
> > further clarifications as MST said, just in case the device is not
> > behaving well. But maybe it's even better just to delete that
> > conditional entirely?
> >
> > Thanks!
> >
>
> For sure, no need to handle an invalid configuration.
> Do you have a patch in mind? It'd be easier to discuss
> things with a specific patch rather than theoretically.
>

I meant to totally delete the check, since it's assuming a device has
an odd number of virtqueues but cvq feature flag enabled. And this is
invalid in -net kind of devices.

I can send a patch with that for sure.

> >
> >
> > > Also, I would say that the right place for the solution of this
> > > problem should not be virtio/vhost-vdpa: This is highly dependent on
> > > having cvq, and this implies a knowledge about the use of each
> > > virtqueue. Another kind of device could have an odd number of
> > > virtqueues naturally, and that (-1) would not work for them, isn't it=
?
> > >
> > > Thanks!
> > >
> > > > Thanks
> > > >
> > > > >
> > > > >      if (!k->set_guest_notifiers) {
> > > > > --
> > > > > 2.27.0
> > > > >
> > > >
>


