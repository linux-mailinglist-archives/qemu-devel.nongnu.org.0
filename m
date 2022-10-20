Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0368B605A1C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 10:42:57 +0200 (CEST)
Received: from localhost ([::1]:60160 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olR8h-00070J-J5
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 04:42:55 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olR8h-0006jF-DH
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 04:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olR4s-0002Fl-7O
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 04:38:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olR4q-0001uh-4A
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 04:38:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666255135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Equ7KnN+Q9BW7ql98ZjkbkEldT6d5HpoDvOVfpP0N0=;
 b=Idg3LHKmr7uvOVMhoeBoGb2XWs+mGdqVQ7WiKZuNC95XJxHLwEDpRwo2tqUP84qWKoOh/Z
 mCzqQPSXduWwuE5lfnDkR1Kxz5bQ3jtXexADSVZPjyBLZ0ix3ugRS4nLy6bqnDrxlrrjHi
 sTZAbs/0QRpfX1uIWKAsYlDT1t3TqaU=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-267-GCT77tCAP9KjUO1k5yJJqA-1; Thu, 20 Oct 2022 04:38:53 -0400
X-MC-Unique: GCT77tCAP9KjUO1k5yJJqA-1
Received: by mail-pl1-f199.google.com with SMTP id
 w11-20020a170902e88b00b001855276704aso7445649plg.4
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 01:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Equ7KnN+Q9BW7ql98ZjkbkEldT6d5HpoDvOVfpP0N0=;
 b=HkUAjONIpe6iF4fYZGdy4/N1feT+eQB7oVmIiaqiVi/I/kR1Z0Z/jHFEdDniV3OqDy
 rXd+PAJW9foWtRDBkEIF1RMU+JJk3y5YwwKZndc3Wd3QAwMAYhe9Mnmo9s6JNghY2i1B
 kKqnwIlgpCiPTa9q8kFB+JzNoaFny3OPFHr1i68E4lZTETsCiQ3Ub0qYUOx/VMRHEwkd
 b5ceCcMaXprywdpVz/v1H4OKvwmTGvV2FgzwUzC3g7+zoL1uAJTO7qLrXGqiowrfKhQc
 vpPyag/topgpCoThcAJzbO5ohT4+2jSckgeUIgJp21/tP/G40x6ZsVscBVqk5uIDBIvI
 ETUA==
X-Gm-Message-State: ACrzQf0ebDwmW4RDLFa+XBsjLjbi0r4gQ2j+zqLPqZfDkQvkb8STNpLy
 OU/Npwg97/lDa3kwANgV6uLdY/2PpELUszHovglRR0lf7QKgLmUPHWZT8b7Am8JfiHyJVLUJV2V
 28K7uBpiF2PYYLXkxtPy6W/kyigarbYs=
X-Received: by 2002:a65:5242:0:b0:46e:9bac:178 with SMTP id
 q2-20020a655242000000b0046e9bac0178mr1843973pgp.300.1666255132540; 
 Thu, 20 Oct 2022 01:38:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM58QUuWN9o5HXn2Y+26rUwtqaLHZZaYlIEZZ96QIHk5gMtnBj8Gcmm75FC1PD4zXKlYmZH7BorLFBym4Px4SoA=
X-Received: by 2002:a65:5242:0:b0:46e:9bac:178 with SMTP id
 q2-20020a655242000000b0046e9bac0178mr1843948pgp.300.1666255132293; Thu, 20
 Oct 2022 01:38:52 -0700 (PDT)
MIME-Version: 1.0
References: <20221019125210.226291-1-eperezma@redhat.com>
 <CACGkMEv9EODLU5DdATMW4BEZ5TNTgaDt4Tw+DzXiQAKhFWXsgA@mail.gmail.com>
In-Reply-To: <CACGkMEv9EODLU5DdATMW4BEZ5TNTgaDt4Tw+DzXiQAKhFWXsgA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 20 Oct 2022 10:38:15 +0200
Message-ID: <CAJaqyWf9BZqdfOKjDXeA3AtJQ2vZFaBPaf0UWi7RcHh-uwx7Tw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/8] Guest announce feature emulation using Shadow
 VirtQueue
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
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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

On Thu, Oct 20, 2022 at 6:24 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Wed, Oct 19, 2022 at 8:52 PM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > A gratuitous ARP is recommended after a live migration to reduce the am=
ount of
> > time needed by the network links to be aware of the new location.
>
> A question: I think we need to deal with the case when GUSET_ANNOUNCE
> is not negotiated? E.d sending the gARP by ourselves via vhost-vDPA?
>

That is possible and I totally agree to implement it on top of this
series, but it complicates the code in two ways:

1. The startup will be slower and more complicated.
We can only send the gARP from qemu using SVQ. At this point SVQ in
dataplane is always enabled as long as cmdline x-svq is on, but in the
final form it will not be the case, and dataplane will be passthrough.

If we want to send gARP from qemu, this will imply to start the device
all in SVQ, and then reset it to its final configuration.

2. Qemu may not know the actual guest state
For example, regarding the mac filtering qemu will simply allow all
unicast if too many macs are configured in the device, not saving them
individually.

However, I think it is better than nothing for the guest that does not
support GUEST_ANNOUNCE so, as said, I'm ok to implement it on top of
this series for sure. But I think other features should have more
priority, isn't it?

Thanks!

> Thanks
>
> > A hypervisor
> > may not have the knowledge of the guest network configuration, and this=
 is
> > especially true on passthrough devices, so its simpler to ask the guest=
 to
> > do it.
> >
> > However, the device control part of this feature can be totally emulate=
d by
> > qemu and shadow virtqueue, not needing any special feature from the act=
ual
> > vdpa device.
> >
> > VIRTIO_NET_F_STATUS is also needed for the guest to access the status o=
f
> > virtio net config where announcement status bit is set. Emulating it as
> > always active in case backend does not support it.
> >
> > v2:
> > * Add VIRTIO_NET_F_STATUS emulation.
> >
> > Eugenio P=C3=A9rez (8):
> >   vdpa: Delete duplicated vdpa_feature_bits entry
> >   vdpa: Save emulated features list in vhost_vdpa
> >   vhost_net: Emulate link state up if backend doesn't expose it
> >   vdpa: Expose VIRTIO_NET_F_STATUS unconditionally
> >   vdpa: Remove shadow CVQ command check
> >   vdpa: handle VIRTIO_NET_CTRL_ANNOUNCE in
> >     vhost_vdpa_net_handle_ctrl_avail
> >   vhost_net: return VIRTIO_NET_S_ANNOUNCE is device model has it set
> >   vdpa: Offer VIRTIO_NET_F_GUEST_ANNOUNCE feature if SVQ is enabled
> >
> >  include/hw/virtio/vhost-vdpa.h |  2 +
> >  hw/net/vhost_net.c             | 35 +++++++++++++++-
> >  hw/virtio/vhost-vdpa.c         |  8 ++--
> >  net/vhost-vdpa.c               | 74 ++++++++++------------------------
> >  4 files changed, 62 insertions(+), 57 deletions(-)
> >
> > --
> > 2.31.1
> >
> >
>


