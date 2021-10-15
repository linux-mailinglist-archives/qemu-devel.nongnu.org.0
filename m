Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5110542EA2D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 09:30:03 +0200 (CEST)
Received: from localhost ([::1]:60864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbHfG-0007Cs-E5
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 03:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mbHdw-0006GO-Uf
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:28:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mbHdu-0004dy-UF
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634282918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0eP+/+B/gknKVwlIaS7Hsu3GzpgbK5CPHUzSvfjaG+A=;
 b=IEjFsTi5or9SmTkB2wUB4OrA37J4H+J3ksXDgQmZ1ErjgAH2lDQju0PNIv4mCHGuKi/RNR
 xlxI5xI1RIVOvJnChh7j0I/lQDBNbLQYFJyU/PjCikRJxS/pxWhllGXx0SW0rXJJGl5MVn
 mpB46bzOkyDyAoWjrL6xHWEl0ZfEOWE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-52lSrYmYMdGsCd66G4f5rA-1; Fri, 15 Oct 2021 03:28:34 -0400
X-MC-Unique: 52lSrYmYMdGsCd66G4f5rA-1
Received: by mail-qt1-f198.google.com with SMTP id
 d19-20020ac85ad3000000b002a74d0626bcso6164279qtd.5
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0eP+/+B/gknKVwlIaS7Hsu3GzpgbK5CPHUzSvfjaG+A=;
 b=yCig8/h+PWQzSIw+kta0uOItw2uqiI5kl81xgVkw2SoC3okuZBl3WfXyUPMfyKPhjP
 qQtfjKJiMLhJk4loBgoumoFIG8gS+mkQGNbb4lnnYNZ5t38oVhIBdDSTkN8XtwTpffYw
 LbDU9aALBOjPUaiHmzG5hdcvryMOTXq5i2/UDQ/EIaGu3XZSeqnBHfLN10vP1PKlxQK7
 ubvrwNZL0jKO0khBqm4u54Gj6ZY4S6zIKVp8R52TPwRj/e/oyDUmNFLXRMjpfCuWxgQK
 an+tGjrHqmpPXwL3rMwYvh4e8i5SgSVFp3Xb2JCYx2RFciJQbAxfqWxOgVyv0zfu3/9o
 Gp4g==
X-Gm-Message-State: AOAM530m0ne0n09y0Bqei39FGGLRm68+2tc+O801OAR5L26KNwUR+An5
 89fijN7LlYFAjqGnTM266eSM1LsweOMrW5kMSmr7kuYMiFJPQ985qQez4+QFs5DU+vYzRYN3Zgn
 ptw8wS3xHK32d0c4vCY3C2ZDGXeh8vbQ=
X-Received: by 2002:a37:a082:: with SMTP id j124mr8703688qke.495.1634282913872; 
 Fri, 15 Oct 2021 00:28:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcUs7noWWXqIjvtCVjjRQyow8J1NTphVWbwM9YTAn5kDVh9bBQoqAAhEuidLizXVjLeu2OwZBEg/jl+kw6/OU=
X-Received: by 2002:a37:a082:: with SMTP id j124mr8703676qke.495.1634282913617; 
 Fri, 15 Oct 2021 00:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-21-eperezma@redhat.com>
 <d5f837ec-7b89-2e47-fcfb-680ee808f6ad@redhat.com>
In-Reply-To: <d5f837ec-7b89-2e47-fcfb-680ee808f6ad@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 15 Oct 2021 09:27:57 +0200
Message-ID: <CAJaqyWdEGWFNrxqKxRya=ybRiP0wTZ0aPksBBeOe9KOjOmUnqA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 20/20] vdpa: Add custom IOTLB translations to SVQ
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 7:34 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:06, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > Use translations added in VhostIOVATree in SVQ.
> >
> > Now every element needs to store the previous address also, so VirtQueu=
e
> > can consume the elements properly. This adds a little overhead per VQ
> > element, having to allocate more memory to stash them. As a possible
> > optimization, this allocation could be avoided if the descriptor is not
> > a chain but a single one, but this is left undone.
> >
> > TODO: iova range should be queried before, and add logic to fail when
> > GPA is outside of its range and memory listener or svq add it.
> >
> > Signed-off-by: Eugenio P=C3=A9rez<eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h |   4 +-
> >   hw/virtio/vhost-shadow-virtqueue.c | 130 ++++++++++++++++++++++++----=
-
> >   hw/virtio/vhost-vdpa.c             |  40 ++++++++-
> >   hw/virtio/trace-events             |   1 +
> >   4 files changed, 152 insertions(+), 23 deletions(-)
>
>
> Think hard about the whole logic. This is safe since qemu memory map
> will fail if guest submits a invalidate IOVA.
>

Can you expand on this? What you mean is that VirtQueue already
protects SVQ code if the guest sets an invalid buffer address (GPA),
isn't it?

> Then I wonder if we do something much more simpler:
>
> 1) Using qemu VA as IOVA but only maps the VA that belongs to guest
> 2) Then we don't need any IOVA tree here, what we need is to just map
> vring and use qemu VA without any translation
>

That would be great, but either qemu's SVQ vring or guest translated
buffers address (in qemu VA form) were already in high addresses,
outside of the device's iova range (in my test).

I didn't try remapping tricks to make them fit in the range, but I
think it does complicate the solution relatively fast if there was
already memory in that range owned by qemu before enabling SVQ:

* Guest memory must be contiguous in VA address space, but it "must"
support hotplug/unplug (although vDPA currently pins it). Hotplug
memory could always overlap with SVQ vring, so we would need to move
it.
* Duplicating mapped memory for writing? (Not sure if guest memory is
actually movable in qemu).
* Indirect descriptors will need to allocate and free memory more or
less frequently, increasing the possibility of overlapping.

If we can move guest memory, however, I can see how we can track it in
a tree *but* mark when the tree is 1:1 with qemu's VA, so buffers
forwarding does not take the translation penalty. When guest memory
cannot be map 1:1, we can resort to tree, and come back to 1:1
translation if the offending tree node(s) get deleted.

However I think this puts the solution a little bit farther than
"starting simple" :).

Does it make sense?

Thanks!

> Thanks
>


