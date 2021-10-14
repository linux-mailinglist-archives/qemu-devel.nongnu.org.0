Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AA042DD98
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 17:08:36 +0200 (CEST)
Received: from localhost ([::1]:51022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb2LS-0001vJ-IE
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 11:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mb2Ho-0008DI-U5
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:04:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mb2Hj-0008Bh-6Z
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:04:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634223882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fiaTZGyh8Y8PoVD5FwOqkosYD7LUYaFf78rkttcxqpQ=;
 b=EZh1jRxwJAvvF/milRSVLsHRVRqqGFGR7ivPX95B6LYlyURmGvfUe1WXyrs4neUm9L3SkH
 3V4XUzsIOLdouvlEN9uVZBzqS9rs+ZO4fRAOE6TsYps1DAkgTWGik4v37v5bu4oQbtyr2k
 FZjrVX5AeIBM2vjEcHUHDqmJtlYgHV0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-K2EicquONQumglCZusiGoQ-1; Thu, 14 Oct 2021 11:04:40 -0400
X-MC-Unique: K2EicquONQumglCZusiGoQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 z29-20020a05620a08dd00b0045fa369b83dso4655806qkz.9
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 08:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fiaTZGyh8Y8PoVD5FwOqkosYD7LUYaFf78rkttcxqpQ=;
 b=DvYdVmthiNFA6wcF0Bvx7UXphe+aHcXUetE4euOfSSCy1Eg9cw45On/D3c3wZEX7D6
 y35KeariD2MyRVjOJWZ/LrsbMzzf8KE0FjCE7WCsM2dXexcz3WWPaC9hSOkfo9uIH6D3
 w1eKvzoL3+LQda+iboKQhoNZvsHTKGo7jlBcUrDmdmMRWISZ0aSLeWF2OWkNhO0+8nEm
 g4SeM3J9GVmc30g5rydIlUkPh6BU4qdhpmGC43GQxS1Et7gNuOvM+z8ByMGKjZOOc+Oe
 aV6R7GFFg3HnC3ye8uFA4+VYwXPPobFLFf3ijW7YZ/fkI3K9ub6nybS71fwGBwlSOJqb
 Awdw==
X-Gm-Message-State: AOAM5335h5SuCbQZEBDqTFTf7zbbjtKl0y+cvCZvWoIvpj6AKjtGx45k
 yupIVEcn9KWG4MQz9Ox+e8Bi8ERFlmHO2DZyIyvvKxpCc64eVkffFh+NUEzNGm4dsb2+kuQeRDa
 XooYOihAZsWoChYYDRpNy5kclI1UJHSk=
X-Received: by 2002:a37:5446:: with SMTP id i67mr5214454qkb.502.1634223880085; 
 Thu, 14 Oct 2021 08:04:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/JqMZHkmDofskwCeBPxmayMBUVavKj4EOOJ6Mbnpp61SQxPZrlB4HYDBekrShjuF3oEirhfPfVbeC3QS3Qmw=
X-Received: by 2002:a37:5446:: with SMTP id i67mr5214428qkb.502.1634223879886; 
 Thu, 14 Oct 2021 08:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-16-eperezma@redhat.com>
 <87y26yg6nt.fsf@dusky.pond.sub.org>
 <CAJaqyWcqLWAUEOyaenYYzXDhU=rh1+inr_o3C-3th8Pz0BjOpg@mail.gmail.com>
 <87lf2y5p7i.fsf@dusky.pond.sub.org>
In-Reply-To: <87lf2y5p7i.fsf@dusky.pond.sub.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 14 Oct 2021 17:04:03 +0200
Message-ID: <CAJaqyWdNBYLLMznGa1NJN3XEcoc77iie1ad=2=1uxA548BQwAQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 15/20] vhost: Shadow virtqueue buffers forwarding
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Tue, Oct 12, 2021 at 3:48 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> Eugenio Perez Martin <eperezma@redhat.com> writes:
>
> > On Tue, Oct 12, 2021 at 7:21 AM Markus Armbruster <armbru@redhat.com> w=
rote:
> >>
> >> Eugenio P=C3=A9rez <eperezma@redhat.com> writes:
> >>
> >> > Initial version of shadow virtqueue that actually forward buffers. T=
here
> >> > are no iommu support at the moment, and that will be addressed in fu=
ture
> >> > patches of this series. Since all vhost-vdpa devices uses forced IOM=
MU,
> >> > this means that SVQ is not usable at this point of the series on any
> >> > device.
> >> >
> >> > For simplicity it only supports modern devices, that expects vring
> >> > in little endian, with split ring and no event idx or indirect
> >> > descriptors. Support for them will not be added in this series.
> >> >
> >> > It reuses the VirtQueue code for the device part. The driver part is
> >> > based on Linux's virtio_ring driver, but with stripped functionality
> >> > and optimizations so it's easier to review. Later commits add simple=
r
> >> > ones.
> >> >
> >> > SVQ uses VIRTIO_CONFIG_S_DEVICE_STOPPED to pause the device and
> >> > retrieve its status (next available idx the device was going to
> >> > consume) race-free. It can later reset the device to replace vring
> >> > addresses etc. When SVQ starts qemu can resume consuming the guest's
> >> > driver ring from that state, without notice from the latter.
> >> >
> >> > This status bit VIRTIO_CONFIG_S_DEVICE_STOPPED is currently discusse=
d
> >> > in VirtIO, and is implemented in qemu VirtIO-net devices in previous
> >> > commits.
> >> >
> >> > Removal of _S_DEVICE_STOPPED bit (in other words, resuming the devic=
e)
> >> > can be done in the future if an use case arises. At this moment we c=
an
> >> > just rely on reseting the full device.
> >> >
> >> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >> > ---
> >> >  qapi/net.json                      |   2 +-
> >> >  hw/virtio/vhost-shadow-virtqueue.c | 237 ++++++++++++++++++++++++++=
++-
> >> >  hw/virtio/vhost-vdpa.c             | 109 ++++++++++++-
> >> >  3 files changed, 337 insertions(+), 11 deletions(-)
> >> >
> >> > diff --git a/qapi/net.json b/qapi/net.json
> >> > index fe546b0e7c..1f4a55f2c5 100644
> >> > --- a/qapi/net.json
> >> > +++ b/qapi/net.json
> >> > @@ -86,7 +86,7 @@
> >> >  #
> >> >  # @name: the device name of the VirtIO device
> >> >  #
> >> > -# @enable: true to use the alternate shadow VQ notifications
> >> > +# @enable: true to use the alternate shadow VQ buffers fowarding pa=
th
> >>
> >> Uh, why does the flag change meaning half-way through this series?
> >>
> >
> > Before this patch, the SVQ mode just makes an extra hop for
> > notifications. Guest ones are now received by qemu via ioeventfd, and
> > qemu forwards them to the device using a different eventfd. The
> > reverse is also true: the device ones will be received by qemu by
> > device call fd, and then qemu will forward them to the guest using a
> > different irqfd.
> >
> > This intermediate step is not very useful by itself, but helps for
> > checking that that part of the communication works fine, with no need
> > for shadow virtqueue to understand vring format. Doing that way also
> > produces smaller patches.
> >
> > So it makes sense to me to tell what QMP command does exactly at every
> > point of the series. However I can directly document it as "use the
> > alternate shadow VQ buffers forwarding path" from the beginning.
> >
> > Does this make sense, or will it be better to write the final
> > intention of the command?
> >
> > Thanks!
>
> Working your explanation into commit messages and possibly comments
> should do.
>

Got it, I will include them in both. Thanks!


