Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48584488E53
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 02:51:32 +0100 (CET)
Received: from localhost ([::1]:42264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6jqN-00075B-B4
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 20:51:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1n6jeM-0004Xa-Uz
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 20:39:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1n6jeI-0006vy-7o
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 20:39:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641778741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TameMC+s+bJwRjQRZ1l/EWn2GRmYH57KoPt2wBgz5jg=;
 b=LClA7HxwwG0rJt7s83LFGQWQLuIyxZjo3fwHtq9LI51fefTkzJrRorOIO2hJHGu+ta2Mc9
 VJAfys/CpTBwX6k7K464Xi3ZDvbuqJ5iWpwK9cBsYSwmelcjJkSjRIb8Ws7WQavuV380Bg
 E9wKTFqo1mRDRnnooKePb927/bvtjZA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-YPYDZctVO6O5ijruGGaRyA-1; Sun, 09 Jan 2022 20:37:50 -0500
X-MC-Unique: YPYDZctVO6O5ijruGGaRyA-1
Received: by mail-ed1-f70.google.com with SMTP id
 x19-20020a05640226d300b003f8b80f5729so8822164edd.13
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 17:37:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TameMC+s+bJwRjQRZ1l/EWn2GRmYH57KoPt2wBgz5jg=;
 b=OHfoCNg45PAAXUdZqt+Q63MCpb+U1tlhPMmqfURem12tAYbiAcUF4dokMGXPuvMkP2
 SXoeBadrS9b3hsGyw8A/oTisy5eVdVyMAzU5jTc0AKPdCYUayua1oD8sQ8G2xFBSdCd6
 JnVzfGtWtk5ZOeEClZEFuIBln2qASxRU6T+wq5ZBBxp6iVX0ZiW+RNT25CAEZ+cZOmKK
 rcPQOKJ0DZjjNe83IjM+QjSWysS4xXuhsJKrhOinLlAd2ViEOQutE0/YewwufR1G/hpe
 Qnl+Q+bmhw7bTkfrPH1xDzRoXVWgy9VApenM+Ct4tPStReo2cO+zuWPeHYXUh1nu6wsP
 YsMw==
X-Gm-Message-State: AOAM532N+OW5++z2D+crFTxb2QDiU5TcZw2hMy7XNC4PJnZKw64ToevG
 AoXVOxbQlvmFBOfA+fgUrf+1unOgqISbdLl/x7+i6HpfDTXx0sWls7ZWlhBC1LzPBMYVZzsNkfX
 reVMbJaBNpUAAJN2zATnvJAui6xQm6ME=
X-Received: by 2002:aa7:cb08:: with SMTP id s8mr32653232edt.57.1641778669154; 
 Sun, 09 Jan 2022 17:37:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcPGUTggQ7qsEZNMcU+RwOkeZVxO7lNxx7zCb/WxRIVFSYWlgtejOluB9PnQW2u2ahloLebhbK/dtCjjCsmq4=
X-Received: by 2002:aa7:cb08:: with SMTP id s8mr32653207edt.57.1641778668906; 
 Sun, 09 Jan 2022 17:37:48 -0800 (PST)
MIME-Version: 1.0
References: <20211104164827.21911-1-lulu@redhat.com>
 <20220109125240-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220109125240-mutt-send-email-mst@kernel.org>
From: Cindy Lu <lulu@redhat.com>
Date: Mon, 10 Jan 2022 09:37:11 +0800
Message-ID: <CACLfguUTTpt7Fct3S7O92OXO=RvuDDRRpga8NMweR2cX-n6ctg@mail.gmail.com>
Subject: Re: [PATCH v10 00/10]vhost-vdpa: add support for configure interrupt
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000005c397905d5306200"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, David Gilbert <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, arei.gonglei@huawei.com,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005c397905d5306200
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 10, 2022 at 1:56 AM Michael S. Tsirkin <mst@redhat.com> wrote:

> On Fri, Nov 05, 2021 at 12:48:17AM +0800, Cindy Lu wrote:
> > these patches add the support for configure interrupt
> >
> > These codes are all tested in vp-vdpa (support configure interrupt)
> > vdpa_sim (not support configure interrupt), virtio tap device
> >
> > test in virtio-pci bus and virtio-mmio bus
> >
> > Change in v2:
> > Add support for virtio-mmio bus
> > active the notifier while the backend support configure interrupt
> > misc fixes from v1
> >
> > Change in v3
> > fix the coding style problems
> >
> > Change in v4
> > misc fixes from v3
> > merge the set_config_notifier to set_guest_notifier
> > when vdpa start, check the feature by VIRTIO_NET_F_STATUS
> >
> > Change in v5
> > misc fixes from v4
> > split the code to introduce configure interrupt type and the callback
> function
> > will init the configure interrupt in all virtio-pci and virtio-mmio bus,
> but will
> > only active while using vhost-vdpa driver
> >
> > Change in v6
> > misc fixes from v5
> > decouple vq from interrupt setting and misc process
> > fix the bug in virtio_net_handle_rx
> > use -1 as the queue number to identify if the interrupt is configure
> interrupt
> >
> > Change in v7
> > misc fixes from v6
> > decouple vq from interrupt setting and misc process
> > decouple vq from vector use/release process
> > decouple vq from set notifier fd handler process
> > move config_notifier and masked_config_notifier to VirtIODevice
> > fix the bug in virtio_net_handle_rx, add more information
> > add VIRTIO_CONFIG_IRQ_IDX as the queue number to identify if the
> interrupt is configure interrupt
> >
> > Change in v8
> > misc fixes from v7
> > decouple vq from interrupt setting and misc process
> > decouple vq from vector use/release process
> > decouple vq from set notifier fd handler process
> > move the vhost configure interrupt to vhost_net
> >
> > Change in v9
> > misc fixes from v8
> > address the comments from v8
> >
> > Change in v10
> > fix the hang issue in qtest
> > address the comments from v9
> >
> > Cindy Lu (10):
> >   virtio: introduce macro IRTIO_CONFIG_IRQ_IDX
> >   virtio-pci: decouple notifier from interrupt process
> >   virtio-pci: decouple the single vector from the interrupt process
> >   vhost: introduce new VhostOps vhost_set_config_call
> >   vhost-vdpa: add support for config interrupt
> >   virtio: add support for configure interrupt
> >   vhost: add support for configure interrupt
> >   virtio-net: add support for configure interrupt
> >   virtio-mmio: add support for configure interrupt
> >   virtio-pci: add support for configure interrupt
> >
> >  hw/display/vhost-user-gpu.c       |   6 +
> >  hw/net/vhost_net.c                |   9 +
> >  hw/net/virtio-net.c               |  10 +-
> >  hw/virtio/trace-events            |   1 +
> >  hw/virtio/vhost-user-fs.c         |   6 +
> >  hw/virtio/vhost-vdpa.c            |   7 +
> >  hw/virtio/vhost-vsock-common.c    |   6 +
> >  hw/virtio/vhost.c                 |  76 +++++++++
> >  hw/virtio/virtio-crypto.c         |   6 +
> >  hw/virtio/virtio-mmio.c           |  27 +++
> >  hw/virtio/virtio-pci.c            | 269 +++++++++++++++++++++---------
> >  hw/virtio/virtio-pci.h            |   4 +-
> >  hw/virtio/virtio.c                |  29 ++++
> >  include/hw/virtio/vhost-backend.h |   3 +
> >  include/hw/virtio/vhost.h         |   4 +
> >  include/hw/virtio/virtio.h        |   7 +
> >  include/net/vhost_net.h           |   2 +
> >  17 files changed, 389 insertions(+), 83 deletions(-)
>
> So I just realized something. The spec says:
>
> The device MUST set the Device Configuration Interrupt bit
> in \field{ISR status} before sending a device configuration
> change notification to the driver.
>
> and I don't see how these patches achieve this: it requires
> that config interrupts go through userspace.
>
> Revert, and think more about it? Or did I miss something?
>
>  Thanks, Micheal, I'm ok to revert these patchs and there are also several
bugs  I need to fix.
I will post a new version soon

>
> > --
> > 2.21.3
>
>

--0000000000005c397905d5306200
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div dir=3D"lt=
r"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Jan 10, 2022 at 1:56 AM Michael S. Tsirkin &lt;<a href=3D"ma=
ilto:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Nov 05, 2021 a=
t 12:48:17AM +0800, Cindy Lu wrote:<br>
&gt; these patches add the support for configure interrupt<br>
&gt; <br>
&gt; These codes are all tested in vp-vdpa (support configure interrupt)<br=
>
&gt; vdpa_sim (not support configure interrupt), virtio tap device<br>
&gt; <br>
&gt; test in virtio-pci bus and virtio-mmio bus<br>
&gt; <br>
&gt; Change in v2:<br>
&gt; Add support for virtio-mmio bus<br>
&gt; active the notifier while the backend support configure interrupt<br>
&gt; misc fixes from v1<br>
&gt; <br>
&gt; Change in v3<br>
&gt; fix the coding style problems<br>
&gt; <br>
&gt; Change in v4<br>
&gt; misc fixes from v3<br>
&gt; merge the set_config_notifier to set_guest_notifier<br>
&gt; when vdpa start, check the feature by VIRTIO_NET_F_STATUS<br>
&gt; <br>
&gt; Change in v5<br>
&gt; misc fixes from v4<br>
&gt; split the code to introduce configure interrupt type and the callback =
function<br>
&gt; will init the configure interrupt in all virtio-pci and virtio-mmio bu=
s, but will<br>
&gt; only active while using vhost-vdpa driver<br>
&gt; <br>
&gt; Change in v6<br>
&gt; misc fixes from v5<br>
&gt; decouple vq from interrupt setting and misc process<br>
&gt; fix the bug in virtio_net_handle_rx<br>
&gt; use -1 as the queue number to identify if the interrupt is configure i=
nterrupt<br>
&gt; <br>
&gt; Change in v7<br>
&gt; misc fixes from v6<br>
&gt; decouple vq from interrupt setting and misc process<br>
&gt; decouple vq from vector use/release process<br>
&gt; decouple vq from set notifier fd handler process<br>
&gt; move config_notifier and masked_config_notifier to VirtIODevice<br>
&gt; fix the bug in virtio_net_handle_rx, add more information<br>
&gt; add VIRTIO_CONFIG_IRQ_IDX as the queue number to identify if the inter=
rupt is configure interrupt<br>
&gt; <br>
&gt; Change in v8<br>
&gt; misc fixes from v7<br>
&gt; decouple vq from interrupt setting and misc process<br>
&gt; decouple vq from vector use/release process<br>
&gt; decouple vq from set notifier fd handler process<br>
&gt; move the vhost configure interrupt to vhost_net<br>
&gt; <br>
&gt; Change in v9<br>
&gt; misc fixes from v8<br>
&gt; address the comments from v8<br>
&gt; <br>
&gt; Change in v10<br>
&gt; fix the hang issue in qtest<br>
&gt; address the comments from v9<br>
&gt; <br>
&gt; Cindy Lu (10):<br>
&gt;=C2=A0 =C2=A0virtio: introduce macro IRTIO_CONFIG_IRQ_IDX<br>
&gt;=C2=A0 =C2=A0virtio-pci: decouple notifier from interrupt process<br>
&gt;=C2=A0 =C2=A0virtio-pci: decouple the single vector from the interrupt =
process<br>
&gt;=C2=A0 =C2=A0vhost: introduce new VhostOps vhost_set_config_call<br>
&gt;=C2=A0 =C2=A0vhost-vdpa: add support for config interrupt<br>
&gt;=C2=A0 =C2=A0virtio: add support for configure interrupt<br>
&gt;=C2=A0 =C2=A0vhost: add support for configure interrupt<br>
&gt;=C2=A0 =C2=A0virtio-net: add support for configure interrupt<br>
&gt;=C2=A0 =C2=A0virtio-mmio: add support for configure interrupt<br>
&gt;=C2=A0 =C2=A0virtio-pci: add support for configure interrupt<br>
&gt; <br>
&gt;=C2=A0 hw/display/vhost-user-gpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A06 +<br>
&gt;=C2=A0 hw/net/vhost_net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A09 +<br>
&gt;=C2=A0 hw/net/virtio-net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 10 +-<br>
&gt;=C2=A0 hw/virtio/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 hw/virtio/vhost-user-fs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A06 +<br>
&gt;=C2=A0 hw/virtio/vhost-vdpa.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A07 +<br>
&gt;=C2=A0 hw/virtio/vhost-vsock-common.c=C2=A0 =C2=A0 |=C2=A0 =C2=A06 +<br=
>
&gt;=C2=A0 hw/virtio/vhost.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 76 +++++++++<br>
&gt;=C2=A0 hw/virtio/virtio-crypto.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A06 +<br>
&gt;=C2=A0 hw/virtio/virtio-mmio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 27 +++<br>
&gt;=C2=A0 hw/virtio/virtio-pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| 269 +++++++++++++++++++++---------<br>
&gt;=C2=A0 hw/virtio/virtio-pci.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 hw/virtio/virtio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 29 ++++<br>
&gt;=C2=A0 include/hw/virtio/vhost-backend.h |=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 include/hw/virtio/vhost.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A04 +<br>
&gt;=C2=A0 include/hw/virtio/virtio.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A07 +<br>
&gt;=C2=A0 include/net/vhost_net.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 17 files changed, 389 insertions(+), 83 deletions(-)<br>
<br>
So I just realized something. The spec says:<br>
<br>
The device MUST set the Device Configuration Interrupt bit<br>
in \field{ISR status} before sending a device configuration<br>
change notification to the driver.<br>
<br>
and I don&#39;t see how these patches achieve this: it requires<br>
that config interrupts go through userspace.<br>
<br>
Revert, and think more about it? Or did I miss something?<br>
<br></blockquote><div>=C2=A0Thanks, Micheal, I&#39;m ok to revert these pat=
chs and there are also several bugs=C2=A0 I need to fix.</div><div>I will p=
ost a new version soon=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; -- <br>
&gt; 2.21.3<br>
<br>
</blockquote></div></div>
</div>

--0000000000005c397905d5306200--


