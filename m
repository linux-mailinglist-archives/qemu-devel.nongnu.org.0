Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A553A42ED0D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:02:50 +0200 (CEST)
Received: from localhost ([::1]:60330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJ72-0004QO-Au
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:02:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mbIjB-0005RS-QB
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 04:38:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mbIj9-0005v2-7k
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 04:38:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634287086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OoMGm9c5FcKwSYN17lQoIEstKKjchGvETfEF0J0A4m8=;
 b=NxVurP3zsmTNBCKFK4emFqW5IvLX7ITldo13SRISyr/kVTmtITiAlVOqMT1oy1nmApgBIT
 c79jm48HRzmv0OV6FJbjGpuOng+XUFlAVSoNWyiVf+Ye/Zuxlmq53TWkvtb12CGAqtNWra
 eaW35XY0ZeHBCG9Mtj3O5o6adVw816M=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-AM4U3olBPKK9plOTmRhU2A-1; Fri, 15 Oct 2021 04:38:05 -0400
X-MC-Unique: AM4U3olBPKK9plOTmRhU2A-1
Received: by mail-lf1-f72.google.com with SMTP id
 z29-20020a195e5d000000b003fd437f0e07so1440769lfi.20
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 01:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OoMGm9c5FcKwSYN17lQoIEstKKjchGvETfEF0J0A4m8=;
 b=yPB+nQHN4uaoyb5V5b7QWBMCHp1h5FM+bXs4GBM0gDfwpv01MMlTkjZ6cdgMpxG/3D
 PVFT82iBc0yk9SDYiwhGVAW+vYJ1foN43/p+J10tVUAT33Dw8117TZvJNyon4LpUUo5H
 11f1go4r2DxPCnCf6AIAnFq6gkuSRYHIfCFHjbI97FCdhxEC4u5QDkNEi5o+GPHLEm8k
 IUDXrDuBLTe6ZKU4kKv54jsq+sEiEod4Sls8c1oYAnVekLNzdsypII4p+fOjT7Ru1D/M
 P0ayvBjmkqojJ+wn7MFEFbBVBlyLlS/2jsLV8jh4U8BCFz57+sSur17wjGj7vib4Vd2T
 ej4w==
X-Gm-Message-State: AOAM533HHttG4++2xK96kUo/drNThrb3ohVgvkVA+76V04Epn1NrUl+M
 Aeq/W32n3Nb6Lh+Qqax17+JopTunlko+nOf9d37GUJbhMpu7LMnYb89MOcNZkPv18+uKbBzm9cr
 1YFaqIkBxWqWnFmWPi5nmrBQt+ZY5Qrs=
X-Received: by 2002:a2e:a5c8:: with SMTP id n8mr11130204ljp.307.1634287083395; 
 Fri, 15 Oct 2021 01:38:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRfow4w3eb6iAW3KZ4R+0L4o9HRZKwsA9nATDJYkX+kEb8Mq4nu8oQT4vxwd5FF3SLe/049WnPV3etii4Wz2c=
X-Received: by 2002:a2e:a5c8:: with SMTP id n8mr11130185ljp.307.1634287083167; 
 Fri, 15 Oct 2021 01:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-21-eperezma@redhat.com>
 <d5f837ec-7b89-2e47-fcfb-680ee808f6ad@redhat.com>
 <CAJaqyWdEGWFNrxqKxRya=ybRiP0wTZ0aPksBBeOe9KOjOmUnqA@mail.gmail.com>
 <CACGkMEuhseBMckdzeGf-bCtyXKEKNNyCaR0LEeELTXhKWxxmwQ@mail.gmail.com>
 <CAJaqyWf7pFiw2twq9BPyr9fOJFa9ZpSMcbnoknOfC_pbuUWkmg@mail.gmail.com>
In-Reply-To: <CAJaqyWf7pFiw2twq9BPyr9fOJFa9ZpSMcbnoknOfC_pbuUWkmg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 15 Oct 2021 16:37:52 +0800
Message-ID: <CACGkMEv_uPeOTffNmJYa7YkhRTf2D=JCFogSJi_ot=UdVBcrYA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 20/20] vdpa: Add custom IOTLB translations to SVQ
To: Eugenio Perez Martin <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 15, 2021 at 4:21 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Fri, Oct 15, 2021 at 9:37 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Fri, Oct 15, 2021 at 3:28 PM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Wed, Oct 13, 2021 at 7:34 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > > >
> > > >
> > > > =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:06, Eugenio P=C3=A9rez =E5=
=86=99=E9=81=93:
> > > > > Use translations added in VhostIOVATree in SVQ.
> > > > >
> > > > > Now every element needs to store the previous address also, so Vi=
rtQueue
> > > > > can consume the elements properly. This adds a little overhead pe=
r VQ
> > > > > element, having to allocate more memory to stash them. As a possi=
ble
> > > > > optimization, this allocation could be avoided if the descriptor =
is not
> > > > > a chain but a single one, but this is left undone.
> > > > >
> > > > > TODO: iova range should be queried before, and add logic to fail =
when
> > > > > GPA is outside of its range and memory listener or svq add it.
> > > > >
> > > > > Signed-off-by: Eugenio P=C3=A9rez<eperezma@redhat.com>
> > > > > ---
> > > > >   hw/virtio/vhost-shadow-virtqueue.h |   4 +-
> > > > >   hw/virtio/vhost-shadow-virtqueue.c | 130 ++++++++++++++++++++++=
++-----
> > > > >   hw/virtio/vhost-vdpa.c             |  40 ++++++++-
> > > > >   hw/virtio/trace-events             |   1 +
> > > > >   4 files changed, 152 insertions(+), 23 deletions(-)
> > > >
> > > >
> > > > Think hard about the whole logic. This is safe since qemu memory ma=
p
> > > > will fail if guest submits a invalidate IOVA.
> > > >
> > >
> > > Can you expand on this? What you mean is that VirtQueue already
> > > protects SVQ code if the guest sets an invalid buffer address (GPA),
> > > isn't it?
> >
> > Yes.
> >
> > >
> > > > Then I wonder if we do something much more simpler:
> > > >
> > > > 1) Using qemu VA as IOVA but only maps the VA that belongs to guest
> > > > 2) Then we don't need any IOVA tree here, what we need is to just m=
ap
> > > > vring and use qemu VA without any translation
> > > >
> > >
> > > That would be great, but either qemu's SVQ vring or guest translated
> > > buffers address (in qemu VA form) were already in high addresses,
> > > outside of the device's iova range (in my test).
> >
> > You're right. I miss that and that's why we need e.g iova tree and allo=
cator.
> >
> > What I proposed only makes sense when shared virtual memory (SVA) is
> > implemented. In the case of SVA, the valid iova range should be the
> > full VA range.
> >
> > >
> > > I didn't try remapping tricks to make them fit in the range, but I
> > > think it does complicate the solution relatively fast if there was
> > > already memory in that range owned by qemu before enabling SVQ:
> > >
> > > * Guest memory must be contiguous in VA address space, but it "must"
> > > support hotplug/unplug (although vDPA currently pins it). Hotplug
> > > memory could always overlap with SVQ vring, so we would need to move
> > > it.
> > > * Duplicating mapped memory for writing? (Not sure if guest memory is
> > > actually movable in qemu).
> > > * Indirect descriptors will need to allocate and free memory more or
> > > less frequently, increasing the possibility of overlapping.
> >
> > I'm not sure I get the problem, but overlapping is not an issue since
> > we're using VA.
> >
>
> It's basically the same (potential) problem of DPDK's SVQ: IOVA Range
> goes from 0 to X. That means that both GPA and SVQ must be in IOVA
> range. As an example, we put GPA at the beginning of the range, that
> grows upwards when memory is hot plugged, and SVQ vrings that grows
> downwards when devices are added or set in SVQ mode.

Yes, but this is not the case if we're using VA.

>
> Even without both space fragmentation problems, we could reach a point
> where both will take the same address, and we would need to go to the
> tree.
>
> But since we are able to detect those situations, I can see how we can
> work in two modes as an optimization: 1:1 when they don't overlap, and
> fragmented tree where it does. But I don't think it's a good idea to
> include it from the beginning, and I'm not sure if that is worth it
> without measuring the  tree translation cost first.
>
> > >
> > > If we can move guest memory,
> >
> > I'm not sure we can do this or it looks very tricky.
> >
>
> Just thinking out loud here, but maybe we could map all memory and
> play with remap_file_pages [1] a little bit for that.

The problem is that there's no guarantee that it will always succeed.
So let's start with the current dedicated IOVA address space. We can
do optimization on top anyhow.

>
> > > however, I can see how we can track it in
> > > a tree *but* mark when the tree is 1:1 with qemu's VA, so buffers
> > > forwarding does not take the translation penalty. When guest memory
> > > cannot be map 1:1, we can resort to tree, and come back to 1:1
> > > translation if the offending tree node(s) get deleted.
> > >
> > > However I think this puts the solution a little bit farther than
> > > "starting simple" :).
> > >
> > > Does it make sense?
> >
> > Yes. So I think I will review the IOVA tree codes and get back to you.
> >
>
> Looking forward to it :).

Thanks

>
> Thanks!
>
> [1] https://linux.die.net/man/2/remap_file_pages
>
> > THanks
> >
> > >
> > > Thanks!
> > >
> > > > Thanks
> > > >
> > >
> >
>


