Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D7C488EB0
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 03:42:54 +0100 (CET)
Received: from localhost ([::1]:59098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6ke5-0000vp-Nf
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 21:42:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1n6kcS-0000EV-76
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 21:41:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1n6kcN-0006xu-RJ
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 21:41:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641782467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oe8Fzbs8z6I2+WvZmPInklAezRh7kB80jsBmJhx/3sY=;
 b=USJWkDoSmQr0mjcXhYkOMbrIO5cJAhcNrg9D0QSzbWOTUGINjg6FAS6D/htZjwAakrZgar
 hXHuWFbIlocBcvFLULYIgLIyWNUE4kxy29I67X6wWSlvmFn0kHkx6UlkhV9Ae1GrFBnvbt
 g6vglt15Ay2swvs7V16pIEeUHBLBtHo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-iJgpQ9wbPf6-GHXEWVWEAA-1; Sun, 09 Jan 2022 21:41:05 -0500
X-MC-Unique: iJgpQ9wbPf6-GHXEWVWEAA-1
Received: by mail-ed1-f71.google.com with SMTP id
 w6-20020a05640234c600b003f916e1b615so8958746edc.17
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 18:41:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oe8Fzbs8z6I2+WvZmPInklAezRh7kB80jsBmJhx/3sY=;
 b=xfk5jqTBh7ygSpULg4FnQ7SzSP+mZkQT8KPooxcxDiGRSg4tSEKrK7iAEKMfUqIcZB
 59/QOJRleHeFONN5PIpR8ARa2mRCho/3uPuN3INycGaK2f8O3as0xhMxz2+Ct4PJJn5z
 2jJAJOoNu9UnKxYfO/hTGunHtyl8nZDCY+ewlq0n/Gv+JfaeBWTkGffwuoUSbD39fTnY
 VxFFdDYMUHrq3hNlhoglj+1SfUsHz9LSETh1bLpyYKdaa9WTZANrUwtibG7731R6RlC8
 l9RMfdaO2r7XM8jFP8tNqrWI1qsNyepmQdSiT5ocj1l7Ht7UaolkHOOfh4b45PeSeRNv
 +MSw==
X-Gm-Message-State: AOAM5326Zjos9TcaKXUE6h0lVa2oH44R9KNXR7AAfikd8zfD+oL99Eo4
 pYSeNnFA09cKxdfPeqaa1f3qdrktqX5cFfGuReuf9IVA7+2e8oQjS31PadYXPVSmHUP+5mU0Cyr
 WUmvF0ul3a6+c0ZhLCvO0y7Gm2sutmNU=
X-Received: by 2002:a17:907:3da3:: with SMTP id
 he35mr58311579ejc.195.1641782464484; 
 Sun, 09 Jan 2022 18:41:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfi9ZMkH9Y8m+C12x7KKb6efNMmw8HBu9vztS7Xc8wDsGGJ84qjYlb2Zu6UZiP+ZTnNWR5T3KwY8Wh9w4e1bg=
X-Received: by 2002:a17:907:3da3:: with SMTP id
 he35mr58311563ejc.195.1641782464270; 
 Sun, 09 Jan 2022 18:41:04 -0800 (PST)
MIME-Version: 1.0
References: <20211104164827.21911-1-lulu@redhat.com>
 <20220109125240-mutt-send-email-mst@kernel.org>
 <CACLfguUTTpt7Fct3S7O92OXO=RvuDDRRpga8NMweR2cX-n6ctg@mail.gmail.com>
 <CACGkMEtt5WQoMJkt_oOtTsMhKfxKyKrDUjvH0v=uqVpS9+E7AQ@mail.gmail.com>
In-Reply-To: <CACGkMEtt5WQoMJkt_oOtTsMhKfxKyKrDUjvH0v=uqVpS9+E7AQ@mail.gmail.com>
From: Cindy Lu <lulu@redhat.com>
Date: Mon, 10 Jan 2022 10:40:26 +0800
Message-ID: <CACLfguVsjtSV_RPFhn4ueoKprkJvEGNTBenuXQw6uHx5G3-q4w@mail.gmail.com>
Subject: Re: [PATCH v10 00/10]vhost-vdpa: add support for configure interrupt
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000094eafc05d53144c0"
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, David Gilbert <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000094eafc05d53144c0
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 10, 2022 at 10:37 AM Jason Wang <jasowang@redhat.com> wrote:

> On Mon, Jan 10, 2022 at 9:37 AM Cindy Lu <lulu@redhat.com> wrote:
> >
> >
> >
> >
> > On Mon, Jan 10, 2022 at 1:56 AM Michael S. Tsirkin <mst@redhat.com>
> wrote:
> >>
> >> On Fri, Nov 05, 2021 at 12:48:17AM +0800, Cindy Lu wrote:
> >> > these patches add the support for configure interrupt
> >> >
> >> > These codes are all tested in vp-vdpa (support configure interrupt)
> >> > vdpa_sim (not support configure interrupt), virtio tap device
> >> >
> >> > test in virtio-pci bus and virtio-mmio bus
> >> >
> >> > Change in v2:
> >> > Add support for virtio-mmio bus
> >> > active the notifier while the backend support configure interrupt
> >> > misc fixes from v1
> >> >
> >> > Change in v3
> >> > fix the coding style problems
> >> >
> >> > Change in v4
> >> > misc fixes from v3
> >> > merge the set_config_notifier to set_guest_notifier
> >> > when vdpa start, check the feature by VIRTIO_NET_F_STATUS
> >> >
> >> > Change in v5
> >> > misc fixes from v4
> >> > split the code to introduce configure interrupt type and the callback
> function
> >> > will init the configure interrupt in all virtio-pci and virtio-mmio
> bus, but will
> >> > only active while using vhost-vdpa driver
> >> >
> >> > Change in v6
> >> > misc fixes from v5
> >> > decouple vq from interrupt setting and misc process
> >> > fix the bug in virtio_net_handle_rx
> >> > use -1 as the queue number to identify if the interrupt is configure
> interrupt
> >> >
> >> > Change in v7
> >> > misc fixes from v6
> >> > decouple vq from interrupt setting and misc process
> >> > decouple vq from vector use/release process
> >> > decouple vq from set notifier fd handler process
> >> > move config_notifier and masked_config_notifier to VirtIODevice
> >> > fix the bug in virtio_net_handle_rx, add more information
> >> > add VIRTIO_CONFIG_IRQ_IDX as the queue number to identify if the
> interrupt is configure interrupt
> >> >
> >> > Change in v8
> >> > misc fixes from v7
> >> > decouple vq from interrupt setting and misc process
> >> > decouple vq from vector use/release process
> >> > decouple vq from set notifier fd handler process
> >> > move the vhost configure interrupt to vhost_net
> >> >
> >> > Change in v9
> >> > misc fixes from v8
> >> > address the comments from v8
> >> >
> >> > Change in v10
> >> > fix the hang issue in qtest
> >> > address the comments from v9
> >> >
> >> > Cindy Lu (10):
> >> >   virtio: introduce macro IRTIO_CONFIG_IRQ_IDX
> >> >   virtio-pci: decouple notifier from interrupt process
> >> >   virtio-pci: decouple the single vector from the interrupt process
> >> >   vhost: introduce new VhostOps vhost_set_config_call
> >> >   vhost-vdpa: add support for config interrupt
> >> >   virtio: add support for configure interrupt
> >> >   vhost: add support for configure interrupt
> >> >   virtio-net: add support for configure interrupt
> >> >   virtio-mmio: add support for configure interrupt
> >> >   virtio-pci: add support for configure interrupt
> >> >
> >> >  hw/display/vhost-user-gpu.c       |   6 +
> >> >  hw/net/vhost_net.c                |   9 +
> >> >  hw/net/virtio-net.c               |  10 +-
> >> >  hw/virtio/trace-events            |   1 +
> >> >  hw/virtio/vhost-user-fs.c         |   6 +
> >> >  hw/virtio/vhost-vdpa.c            |   7 +
> >> >  hw/virtio/vhost-vsock-common.c    |   6 +
> >> >  hw/virtio/vhost.c                 |  76 +++++++++
> >> >  hw/virtio/virtio-crypto.c         |   6 +
> >> >  hw/virtio/virtio-mmio.c           |  27 +++
> >> >  hw/virtio/virtio-pci.c            | 269
> +++++++++++++++++++++---------
> >> >  hw/virtio/virtio-pci.h            |   4 +-
> >> >  hw/virtio/virtio.c                |  29 ++++
> >> >  include/hw/virtio/vhost-backend.h |   3 +
> >> >  include/hw/virtio/vhost.h         |   4 +
> >> >  include/hw/virtio/virtio.h        |   7 +
> >> >  include/net/vhost_net.h           |   2 +
> >> >  17 files changed, 389 insertions(+), 83 deletions(-)
> >>
> >> So I just realized something. The spec says:
> >>
> >> The device MUST set the Device Configuration Interrupt bit
> >> in \field{ISR status} before sending a device configuration
> >> change notification to the driver.
> >>
> >> and I don't see how these patches achieve this: it requires
> >> that config interrupts go through userspace.
> >>
> >> Revert, and think more about it? Or did I miss something?
> >>
> >  Thanks, Micheal, I'm ok to revert these patchs and there are also
> several bugs  I need to fix.
> > I will post a new version soon
>
> Please test with vectors=0 for the new version to make it work as expected.
>
> Thanks
>
> Sure, I will, Thanka Jason

> >>
> >>
> >> > --
> >> > 2.21.3
> >>
>
>

--00000000000094eafc05d53144c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 10, 2022 at 10:37 AM Jaso=
n Wang &lt;<a href=3D"mailto:jasowang@redhat.com">jasowang@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon=
, Jan 10, 2022 at 9:37 AM Cindy Lu &lt;<a href=3D"mailto:lulu@redhat.com" t=
arget=3D"_blank">lulu@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Jan 10, 2022 at 1:56 AM Michael S. Tsirkin &lt;<a href=3D"mail=
to:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Nov 05, 2021 at 12:48:17AM +0800, Cindy Lu wrote:<br>
&gt;&gt; &gt; these patches add the support for configure interrupt<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; These codes are all tested in vp-vdpa (support configure inte=
rrupt)<br>
&gt;&gt; &gt; vdpa_sim (not support configure interrupt), virtio tap device=
<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; test in virtio-pci bus and virtio-mmio bus<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Change in v2:<br>
&gt;&gt; &gt; Add support for virtio-mmio bus<br>
&gt;&gt; &gt; active the notifier while the backend support configure inter=
rupt<br>
&gt;&gt; &gt; misc fixes from v1<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Change in v3<br>
&gt;&gt; &gt; fix the coding style problems<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Change in v4<br>
&gt;&gt; &gt; misc fixes from v3<br>
&gt;&gt; &gt; merge the set_config_notifier to set_guest_notifier<br>
&gt;&gt; &gt; when vdpa start, check the feature by VIRTIO_NET_F_STATUS<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Change in v5<br>
&gt;&gt; &gt; misc fixes from v4<br>
&gt;&gt; &gt; split the code to introduce configure interrupt type and the =
callback function<br>
&gt;&gt; &gt; will init the configure interrupt in all virtio-pci and virti=
o-mmio bus, but will<br>
&gt;&gt; &gt; only active while using vhost-vdpa driver<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Change in v6<br>
&gt;&gt; &gt; misc fixes from v5<br>
&gt;&gt; &gt; decouple vq from interrupt setting and misc process<br>
&gt;&gt; &gt; fix the bug in virtio_net_handle_rx<br>
&gt;&gt; &gt; use -1 as the queue number to identify if the interrupt is co=
nfigure interrupt<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Change in v7<br>
&gt;&gt; &gt; misc fixes from v6<br>
&gt;&gt; &gt; decouple vq from interrupt setting and misc process<br>
&gt;&gt; &gt; decouple vq from vector use/release process<br>
&gt;&gt; &gt; decouple vq from set notifier fd handler process<br>
&gt;&gt; &gt; move config_notifier and masked_config_notifier to VirtIODevi=
ce<br>
&gt;&gt; &gt; fix the bug in virtio_net_handle_rx, add more information<br>
&gt;&gt; &gt; add VIRTIO_CONFIG_IRQ_IDX as the queue number to identify if =
the interrupt is configure interrupt<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Change in v8<br>
&gt;&gt; &gt; misc fixes from v7<br>
&gt;&gt; &gt; decouple vq from interrupt setting and misc process<br>
&gt;&gt; &gt; decouple vq from vector use/release process<br>
&gt;&gt; &gt; decouple vq from set notifier fd handler process<br>
&gt;&gt; &gt; move the vhost configure interrupt to vhost_net<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Change in v9<br>
&gt;&gt; &gt; misc fixes from v8<br>
&gt;&gt; &gt; address the comments from v8<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Change in v10<br>
&gt;&gt; &gt; fix the hang issue in qtest<br>
&gt;&gt; &gt; address the comments from v9<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Cindy Lu (10):<br>
&gt;&gt; &gt;=C2=A0 =C2=A0virtio: introduce macro IRTIO_CONFIG_IRQ_IDX<br>
&gt;&gt; &gt;=C2=A0 =C2=A0virtio-pci: decouple notifier from interrupt proc=
ess<br>
&gt;&gt; &gt;=C2=A0 =C2=A0virtio-pci: decouple the single vector from the i=
nterrupt process<br>
&gt;&gt; &gt;=C2=A0 =C2=A0vhost: introduce new VhostOps vhost_set_config_ca=
ll<br>
&gt;&gt; &gt;=C2=A0 =C2=A0vhost-vdpa: add support for config interrupt<br>
&gt;&gt; &gt;=C2=A0 =C2=A0virtio: add support for configure interrupt<br>
&gt;&gt; &gt;=C2=A0 =C2=A0vhost: add support for configure interrupt<br>
&gt;&gt; &gt;=C2=A0 =C2=A0virtio-net: add support for configure interrupt<b=
r>
&gt;&gt; &gt;=C2=A0 =C2=A0virtio-mmio: add support for configure interrupt<=
br>
&gt;&gt; &gt;=C2=A0 =C2=A0virtio-pci: add support for configure interrupt<b=
r>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 hw/display/vhost-user-gpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A06 +<br>
&gt;&gt; &gt;=C2=A0 hw/net/vhost_net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +<br>
&gt;&gt; &gt;=C2=A0 hw/net/virtio-net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +-<br>
&gt;&gt; &gt;=C2=A0 hw/virtio/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;&gt; &gt;=C2=A0 hw/virtio/vhost-user-fs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A06 +<br>
&gt;&gt; &gt;=C2=A0 hw/virtio/vhost-vdpa.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A07 +<br>
&gt;&gt; &gt;=C2=A0 hw/virtio/vhost-vsock-common.c=C2=A0 =C2=A0 |=C2=A0 =C2=
=A06 +<br>
&gt;&gt; &gt;=C2=A0 hw/virtio/vhost.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 76 +++++++++<br>
&gt;&gt; &gt;=C2=A0 hw/virtio/virtio-crypto.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A06 +<br>
&gt;&gt; &gt;=C2=A0 hw/virtio/virtio-mmio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 27 +++<br>
&gt;&gt; &gt;=C2=A0 hw/virtio/virtio-pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 269 +++++++++++++++++++++---------<br>
&gt;&gt; &gt;=C2=A0 hw/virtio/virtio-pci.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;&gt; &gt;=C2=A0 hw/virtio/virtio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 29 ++++<br>
&gt;&gt; &gt;=C2=A0 include/hw/virtio/vhost-backend.h |=C2=A0 =C2=A03 +<br>
&gt;&gt; &gt;=C2=A0 include/hw/virtio/vhost.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A04 +<br>
&gt;&gt; &gt;=C2=A0 include/hw/virtio/virtio.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A07 +<br>
&gt;&gt; &gt;=C2=A0 include/net/vhost_net.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;&gt; &gt;=C2=A0 17 files changed, 389 insertions(+), 83 deletions(-)<br=
>
&gt;&gt;<br>
&gt;&gt; So I just realized something. The spec says:<br>
&gt;&gt;<br>
&gt;&gt; The device MUST set the Device Configuration Interrupt bit<br>
&gt;&gt; in \field{ISR status} before sending a device configuration<br>
&gt;&gt; change notification to the driver.<br>
&gt;&gt;<br>
&gt;&gt; and I don&#39;t see how these patches achieve this: it requires<br=
>
&gt;&gt; that config interrupts go through userspace.<br>
&gt;&gt;<br>
&gt;&gt; Revert, and think more about it? Or did I miss something?<br>
&gt;&gt;<br>
&gt;=C2=A0 Thanks, Micheal, I&#39;m ok to revert these patchs and there are=
 also several bugs=C2=A0 I need to fix.<br>
&gt; I will post a new version soon<br>
<br>
Please test with vectors=3D0 for the new version to make it work as expecte=
d.<br>
<br>
Thanks<br>
<br></blockquote><div>Sure, I will, Thanka=C2=A0Jason=C2=A0=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.21.3<br>
&gt;&gt;<br>
<br>
</blockquote></div></div>

--00000000000094eafc05d53144c0--


