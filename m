Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B853545E49B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 03:33:24 +0100 (CET)
Received: from localhost ([::1]:34160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqR3D-0007Xo-SV
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 21:33:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mqR1J-0006il-V2
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 21:31:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mqR1H-0001Vx-A8
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 21:31:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637893882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HqvyaDstZ1aB9sPQZNGLZzlWYdCNH5I84t2Qt1gWDr4=;
 b=SC53B/LbzQCMRqvgUEHWDj5Ns6rK9b9mXNpiEmvnjtaf3L1+NzupkbQ2j8sdOFYp5AnnG4
 w7IkbOOPnja7zHeni1R0gvwDeeitUNSeTUA32z47Z9fyHLwfuRRIyMIac0qYoUopjJKXTl
 I38vlf5VyQU8rpBGtwCyO4rc1T5PjmY=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-haCW0sICNfuODCmVa6bKxQ-1; Thu, 25 Nov 2021 21:31:20 -0500
X-MC-Unique: haCW0sICNfuODCmVa6bKxQ-1
Received: by mail-lj1-f198.google.com with SMTP id
 k24-20020a2e9a58000000b00218c7914524so2558359ljj.17
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 18:31:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HqvyaDstZ1aB9sPQZNGLZzlWYdCNH5I84t2Qt1gWDr4=;
 b=kYgX3pU1rDHHCXWVMtuT22kQkllgt2a7zZv93OVRQT2pifGDbJ7kcT7sTzwNqBpTW6
 twlAEEjFRqfpdHKv8QKziKHT325gXapEw7OTQQFymx/aPGJIjHlRY+Po6P/dIRnas4vC
 T5bM23sAlq2JJLRiT8a//3EApZzDXsjnfDZUQpm4Scn4GOrzen8HLvnL+gQ2Se6b2JdU
 kRXAU7uATFmrLLFwm2sulH6VDDTOiMhQMrXYW+VXkqpxlqAPFKncbviV5pv8KL7lSklB
 PG6CWncK14jQVFJPewaibN9yw7KBlZ+pGFvm20eKtKihGO8EnNAmuiX1lNdkzedlH6yF
 4dZg==
X-Gm-Message-State: AOAM533WCEQSXLQ9yncT4H0aqz3xboNMkrD8nB3gmOI+rJ/DZMzWm8PQ
 SlZ3+mea9dp4Y+P4PfPZFbEzfMws8MkTIKV92T0DQDrMmBB/vXfSnAX3xZkEtFN0gusQ7pykuhw
 gppCP2szgnK2dMTMC5E8va1Oz8lEQN6U=
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr28289452ljp.362.1637893879229; 
 Thu, 25 Nov 2021 18:31:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3ZUeb9FVsmSBbqYI24WnZ8PTWbxVhCsWzaT7e671yilGl79LlnDZb7nlAYNUZR66zQActhc6f17zaKOXXT+w=
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr28289428ljp.362.1637893878949; 
 Thu, 25 Nov 2021 18:31:18 -0800 (PST)
MIME-Version: 1.0
References: <20211125022046.10433-1-jasowang@redhat.com>
 <f4ae1d19-1409-7250-5149-8831b2cfa1d2@redhat.com>
 <20211125110724-mutt-send-email-mst@kernel.org>
 <d162f85f-214b-3d4b-c860-47b3367e7099@redhat.com>
 <b8d226cb51d04484861f1e1809043c1d@intel.com>
In-Reply-To: <b8d226cb51d04484861f1e1809043c1d@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 26 Nov 2021 10:31:08 +0800
Message-ID: <CACGkMEtKazhmn=1AfiGszoOYUNAyEnyBQtbw79jh2wL=hm+Pcg@mail.gmail.com>
Subject: Re: [PATCH 1/2] virito-balloon: process all in sgs for free_page_vq
To: "Wang, Wei W" <wei.w.wang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Alexander Duyck <alexander.duyck@gmail.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 26, 2021 at 9:21 AM Wang, Wei W <wei.w.wang@intel.com> wrote:
>
> On Friday, November 26, 2021 12:11 AM, David Hildenbrand wrote:
> > On 25.11.21 17:09, Michael S. Tsirkin wrote:
> > > On Thu, Nov 25, 2021 at 09:28:59AM +0100, David Hildenbrand wrote:
> > >> On 25.11.21 03:20, Jason Wang wrote:
> > >>> We only process the first in sg which may lead to the bitmap of the
> > >>> pages belongs to following sgs were not cleared. This may result
> > >>> more pages to be migrated. Fixing this by process all in sgs for
> > >>> free_page_vq.
> > >>>
> > >>> Signed-off-by: Jason Wang <jasowang@redhat.com>
> > >>> ---
> > >>>  hw/virtio/virtio-balloon.c | 7 +++++--
> > >>>  1 file changed, 5 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.=
c
> > >>> index c6962fcbfe..17de2558cb 100644
> > >>> --- a/hw/virtio/virtio-balloon.c
> > >>> +++ b/hw/virtio/virtio-balloon.c
> > >>> @@ -510,6 +510,7 @@ static bool get_free_page_hints(VirtIOBalloon
> > *dev)
> > >>>      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> > >>>      VirtQueue *vq =3D dev->free_page_vq;
> > >>>      bool ret =3D true;
> > >>> +    int i;
> > >>>
> > >>>      while (dev->block_iothread) {
> > >>>          qemu_cond_wait(&dev->free_page_cond,
> > &dev->free_page_lock);
> > >>> @@ -544,8 +545,10 @@ static bool get_free_page_hints(VirtIOBalloon
> > *dev)
> > >>>      }
> > >>>
> > >>>      if (elem->in_num && dev->free_page_hint_status =3D=3D
> > FREE_PAGE_HINT_S_START) {
> > >>> -        qemu_guest_free_page_hint(elem->in_sg[0].iov_base,
> > >>> -                                  elem->in_sg[0].iov_len);
> > >>> +        for (i =3D 0; i < elem->in_num; i++) {
> > >>> +            qemu_guest_free_page_hint(elem->in_sg[i].iov_base,
> > >>> +                                      elem->in_sg[i].iov_len);
> > >>> +        }
> > >>>      }
> > >>>
> > >>>  out:
> > >>>
> > >>
> > >> Yes, but:
> > >>
> > >> 1. Linux never used more than one
> > >> 2. QEMU never consumed more than one
>
> Yes, it works based on the fact that Linux only sends one hint each time.
>
> > >>
> > >> The spec states:
> > >>
> > >> "(b) The driver maps a series of pages and adds them to the
> > >> free_page_vq as individual scatter-gather input buffer entries."
> > >>
> > >> However, the spec was written by someone else (Alex) as the code was
> > >> (Wei). The code was there first.
> > >>
> > >> I don't particularly care what to adjust (code or spec). However, to
> > >> me it feels more like the spec is slightly wrong and it was intended
> > >> like the code is by the original code author.
> > >>
> > >> But then again, I don't particularly care :)
> > >
> > > Original QEMU side code had several bugs so, that's another one.
> > > Given nothing too bad happens if guest submits too many S/Gs, and
> > > given the spec also has a general chapter suggesting devices are
> > > flexible in accepting a single buffer split to multiple S/Gs, I'm
> > > inclined to accept the patch.

Yes, and it's probably too late to change the spec even if we want to chang=
e.

> >
> > Yeah, as I said, I don't particularly care. It's certainly an "easy cha=
nge".
> >
> > Acked-by: David Hildenbrand <david@redhat.com>
> >

Thanks

>
> Don=E2=80=99t object the change.
> Just in case something unexpected, it would be better if someone could he=
lp do a test.

I've tested the code with migration before sending the patches, I see
the hint works fine.

Thanks

>
> Thanks,
> Wei


