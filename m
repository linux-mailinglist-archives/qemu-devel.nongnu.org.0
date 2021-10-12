Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F7E42A5E2
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 15:39:21 +0200 (CEST)
Received: from localhost ([::1]:49746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maI00-0001tF-HM
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 09:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1maHpw-0001qf-9H
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 09:28:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1maHpi-0007Zf-Dn
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 09:28:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634045320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cgBKype/d5ixYYs+9j1rhCeWcarMdlinv87UmkKt6OA=;
 b=hZt1k4th57kQ+SRcY3iw3uoOWvTVyta4sCsDrTIdX+XCaUv7KG157Azub8/dyEYy1H57iA
 FH87D3pO8/HHxfAKrv9uWlnkXEC41h3uRJ6sR5O8+aP/2wgruNMNKN5MOVTwq2icWYsxGe
 DDY+7xd+3/M2MKaodjwxXVz8KQxeFs0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-pKaJOsAbPJe_V0lEJP1mbg-1; Tue, 12 Oct 2021 09:28:37 -0400
X-MC-Unique: pKaJOsAbPJe_V0lEJP1mbg-1
Received: by mail-qt1-f197.google.com with SMTP id
 e10-20020ac8670a000000b002a78257482eso5708640qtp.10
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 06:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cgBKype/d5ixYYs+9j1rhCeWcarMdlinv87UmkKt6OA=;
 b=5ujceFW771ptb3wiMWn0vn71QEe1x94R6Jdve0PFXbL6/GmcWwK/B4We8yPub15Z0j
 vdW4M0NmxyEGhn07SZfNpfbwYteCPSqlhGIAQLZgDJmUcMN69AGap32mshi+BuhzYBae
 ltFEs2gau33Wa75enz7ey7iB6TwG7r7bHArXJvD7g4H5RwYilBtT6J/ti1ieCg7IxpZM
 TgleMxsCgS7yVXtx5UXkPOQvABzwdTgBf7SFVf86qRLJF04Ko8Fzbx8xfICnHUpctPzQ
 0ZuBUSbQi5PyznNPrZpjDgqjoNaOi6WqMFoDydc36VzSSJhMwCxcJAgHlXkiAQZldXCE
 7yxQ==
X-Gm-Message-State: AOAM530WCRsFhRpzr36utfQUru92/C1ZzxnR73bko6ZXtQuktdk24337
 1OstU51qXDMCknRjKk13BuFc+Mj3h+8QtwZz+cex0LnqfVcB9cyKrOCC0j3KMlI7aBdUZcPcEUQ
 vFNnfyN/z1y4K2yMTkSm6IZHoJ1gBE7c=
X-Received: by 2002:a0c:80e4:: with SMTP id 91mr30299308qvb.57.1634045317473; 
 Tue, 12 Oct 2021 06:28:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTdi+Q/24yKsJV/eM8C5bfF7Cj6UWfGG3U7Za94+TzYHKv4KPR2WZ3Y1RL5pye3gJxLs/PDDOiJcQT/Fg1OmU=
X-Received: by 2002:a0c:80e4:: with SMTP id 91mr30299290qvb.57.1634045317280; 
 Tue, 12 Oct 2021 06:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-16-eperezma@redhat.com>
 <87y26yg6nt.fsf@dusky.pond.sub.org>
In-Reply-To: <87y26yg6nt.fsf@dusky.pond.sub.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 12 Oct 2021 15:28:01 +0200
Message-ID: <CAJaqyWcqLWAUEOyaenYYzXDhU=rh1+inr_o3C-3th8Pz0BjOpg@mail.gmail.com>
Subject: Re: [RFC PATCH v4 15/20] vhost: Shadow virtqueue buffers forwarding
To: Markus Armbruster <armbru@redhat.com>
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
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 7:21 AM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> Eugenio P=C3=A9rez <eperezma@redhat.com> writes:
>
> > Initial version of shadow virtqueue that actually forward buffers. Ther=
e
> > are no iommu support at the moment, and that will be addressed in futur=
e
> > patches of this series. Since all vhost-vdpa devices uses forced IOMMU,
> > this means that SVQ is not usable at this point of the series on any
> > device.
> >
> > For simplicity it only supports modern devices, that expects vring
> > in little endian, with split ring and no event idx or indirect
> > descriptors. Support for them will not be added in this series.
> >
> > It reuses the VirtQueue code for the device part. The driver part is
> > based on Linux's virtio_ring driver, but with stripped functionality
> > and optimizations so it's easier to review. Later commits add simpler
> > ones.
> >
> > SVQ uses VIRTIO_CONFIG_S_DEVICE_STOPPED to pause the device and
> > retrieve its status (next available idx the device was going to
> > consume) race-free. It can later reset the device to replace vring
> > addresses etc. When SVQ starts qemu can resume consuming the guest's
> > driver ring from that state, without notice from the latter.
> >
> > This status bit VIRTIO_CONFIG_S_DEVICE_STOPPED is currently discussed
> > in VirtIO, and is implemented in qemu VirtIO-net devices in previous
> > commits.
> >
> > Removal of _S_DEVICE_STOPPED bit (in other words, resuming the device)
> > can be done in the future if an use case arises. At this moment we can
> > just rely on reseting the full device.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  qapi/net.json                      |   2 +-
> >  hw/virtio/vhost-shadow-virtqueue.c | 237 ++++++++++++++++++++++++++++-
> >  hw/virtio/vhost-vdpa.c             | 109 ++++++++++++-
> >  3 files changed, 337 insertions(+), 11 deletions(-)
> >
> > diff --git a/qapi/net.json b/qapi/net.json
> > index fe546b0e7c..1f4a55f2c5 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -86,7 +86,7 @@
> >  #
> >  # @name: the device name of the VirtIO device
> >  #
> > -# @enable: true to use the alternate shadow VQ notifications
> > +# @enable: true to use the alternate shadow VQ buffers fowarding path
>
> Uh, why does the flag change meaning half-way through this series?
>

Before this patch, the SVQ mode just makes an extra hop for
notifications. Guest ones are now received by qemu via ioeventfd, and
qemu forwards them to the device using a different eventfd. The
reverse is also true: the device ones will be received by qemu by
device call fd, and then qemu will forward them to the guest using a
different irqfd.

This intermediate step is not very useful by itself, but helps for
checking that that part of the communication works fine, with no need
for shadow virtqueue to understand vring format. Doing that way also
produces smaller patches.

So it makes sense to me to tell what QMP command does exactly at every
point of the series. However I can directly document it as "use the
alternate shadow VQ buffers forwarding path" from the beginning.

Does this make sense, or will it be better to write the final
intention of the command?

Thanks!

> >  #
> >  # Returns: Error if failure, or 'no error' for success.
> >  #
>
> [...]
>


