Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F6F42EDD5
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:37:23 +0200 (CEST)
Received: from localhost ([::1]:60018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJeT-0002ux-JM
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mbJIy-0001Tl-8G
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:15:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mbJIu-0000I6-96
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:15:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634289302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UsD7vrcB/oYZSHjWZJ36M+6WNsAQ1fyIr9/hQ55RBzY=;
 b=ERtUt++Ts8qeehGFiP/nha3JKXigsfjI7v+8dYXKtcRKlUPfCrlD72+8E4IDQXXV+gFI1O
 bcEUw48pc18ZdRhsMfbY+xyBL3bB5Io2yOOdNPphtQ3rURe5jXB4OSsiUcC+fnUSgLJp8p
 f3SUjT/FL4zVTw0x+IR8nsrn6duBI+w=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-54mCabY1NRyXRDzMjOeoVw-1; Fri, 15 Oct 2021 05:15:00 -0400
X-MC-Unique: 54mCabY1NRyXRDzMjOeoVw-1
Received: by mail-qt1-f200.google.com with SMTP id
 59-20020aed2041000000b002a78c85c668so6250604qta.12
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 02:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UsD7vrcB/oYZSHjWZJ36M+6WNsAQ1fyIr9/hQ55RBzY=;
 b=nyRmz4ZR5rTGQOPYkWY4KKzGpN/9lX7HtiXdQSsA6AfQnGzk1l/bFcjUIoDwGuU+ss
 ot6K1Okgc5xFVLFhowRWesqOvCNlgAfAT6UPAt5y2HdyLay6NA+Ij88Flf/LDnuTQWyA
 6cJyH5kMcguGW48RKWt+MVeBLttd2RFQNPgKAX2V5CeIFJyoDj4hBjuOZxeZY7RdnCzJ
 g+1ngLTIHbjK1M3tTEdAJ7gYpTtp56d5IpJwFyTwSIq5qzQxn58wXb/uwoWPUo4JJlNr
 7jJZAV/ZEt66rDcntl3evua0DEmrTYdcV2zCZ86c+0oeQhrTDkRpw/l428kC/BlSo/RX
 FFFg==
X-Gm-Message-State: AOAM532JEsGncsMyzeH4K/VfwjGUxp2dpsyzHJDHfCRkjPdfU5T/BNfN
 Dws9ieonMLJnle3F61v00pgikpC/v/nWCO5QCTgj1+KCnmawI+ihXb86alqbRkPN7mTF/Se3mmU
 5y6PbmawpPSk9j2Er0MJRG3kA+pQTqUE=
X-Received: by 2002:a05:620a:4154:: with SMTP id
 k20mr9037452qko.316.1634289300340; 
 Fri, 15 Oct 2021 02:15:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydP+NTjMlQGsuj4Wwv5vF+4ZS4psXawH/WTwZ5ISnen5mzBj1aAm0U/ScA4tT/FJRm5/7seiYcWjNm6bE+448=
X-Received: by 2002:a05:620a:4154:: with SMTP id
 k20mr9037434qko.316.1634289300079; 
 Fri, 15 Oct 2021 02:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-21-eperezma@redhat.com>
 <d5f837ec-7b89-2e47-fcfb-680ee808f6ad@redhat.com>
 <CAJaqyWdEGWFNrxqKxRya=ybRiP0wTZ0aPksBBeOe9KOjOmUnqA@mail.gmail.com>
 <CACGkMEuhseBMckdzeGf-bCtyXKEKNNyCaR0LEeELTXhKWxxmwQ@mail.gmail.com>
 <CAJaqyWf7pFiw2twq9BPyr9fOJFa9ZpSMcbnoknOfC_pbuUWkmg@mail.gmail.com>
In-Reply-To: <CAJaqyWf7pFiw2twq9BPyr9fOJFa9ZpSMcbnoknOfC_pbuUWkmg@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 15 Oct 2021 11:14:24 +0200
Message-ID: <CAJaqyWceSoLODPWmhxD+wHhHmthsCdGOsuL_KirwGohAY+ZveQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 20/20] vdpa: Add custom IOTLB translations to SVQ
To: Jason Wang <jasowang@redhat.com>
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
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 15, 2021 at 10:20 AM Eugenio Perez Martin
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
>

PS: Actually, they still use the GArray solution as the previous
series. I'm currently migrating to use an actual tree and adding
allocation features to util/iova-tree, so maybe it is not worth
reviewing it at this moment. The public interface to it is the same,
but there is little to review there.

Thanks!

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


