Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CCB5714FF
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 10:47:24 +0200 (CEST)
Received: from localhost ([::1]:55954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBBYB-0001ii-AK
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 04:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oBBUO-0007Q1-R4
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 04:43:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oBBUL-0006Pt-18
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 04:43:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657615403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zzrCt/dQXoNyGt11auu4eh1SEMU5bYSXno1kKnG8fbI=;
 b=NDpLE0X4pCLCRyoz2glYgHu4HLJlovVe1caAA7qjVPgYrwOL/MYpfpBhr9BXqtQrAuNxQU
 CYG+TNY6cLdEM6vYRa7+h0v6PNXLYZBzWhkMgEFVihOjXRupxbRiF3smdgCSijmvZqsmjj
 hX0PJlXah8FB1fRKQOM5C95uySq7FXs=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-E8Fa19UrOluRzjdarZYPOA-1; Tue, 12 Jul 2022 04:43:21 -0400
X-MC-Unique: E8Fa19UrOluRzjdarZYPOA-1
Received: by mail-lj1-f198.google.com with SMTP id
 z5-20020a05651c022500b0025d4d99593aso1302355ljn.18
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 01:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zzrCt/dQXoNyGt11auu4eh1SEMU5bYSXno1kKnG8fbI=;
 b=i2gKWg8pHEWeyyVXXktmFPVnOowfMnMZP5el4KVkv2eIKdOkGdcwPWBOR+bYMipiHK
 1A/cdI8fqRPoZaLBT3APoOBbBQnQ0cpCE9rdjMz1RM60GMoO8oHWHlebVl3MGtsy6Rxj
 RWHAf6WV/e8PoX5vLP3kf9J4PXAs+gm1Xb7tPaIjQLvRO/lIz5uHaz7q+GTPDvaXs/fr
 ppDdSG+wMAV1sAnV7PuDczjCLUEfftlIQ/AU/dXViGtKDP3zzWVdzx/srCIxtqBSv9SU
 Udz8eErMPcHAK3Z4i0NOpFfWlDsaYinZ4mRvQ3wWWgzbcxFrejxtonaylOkufjXYHXJQ
 iVUQ==
X-Gm-Message-State: AJIora+OzLcDJa7rj+qG8kLnAX3fNdKiZhnYiLGayTUo8IWdVpEoCf2p
 dM47JEdAFh8p2QEHuNV4M1M0DD1ILfqgT4uFt54EyJ6hwpH3YzTRNOxcggXs/gchHantoJilmbW
 IGm0ygaOYBQShuEvnvrndyCmtxmZbKxg=
X-Received: by 2002:a05:6512:3b8e:b0:481:1a75:452 with SMTP id
 g14-20020a0565123b8e00b004811a750452mr15380893lfv.238.1657615400320; 
 Tue, 12 Jul 2022 01:43:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v40KSGki5A5CjyNY/rVQeuPw2HdTYgtS5PSl0NeHoRNK7NTL7LsnY4idGsjjU3KBkV7/+aZpv14wmGYQYLgs8=
X-Received: by 2002:a05:6512:3b8e:b0:481:1a75:452 with SMTP id
 g14-20020a0565123b8e00b004811a750452mr15380868lfv.238.1657615400031; Tue, 12
 Jul 2022 01:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-13-eperezma@redhat.com>
 <ffa1e417-846a-0da8-7fa1-fe473e860215@redhat.com>
 <CAJaqyWccXPE5A4wAQb5rymPGfEDjQzNMeVCHhjCAXww2fdk7Pw@mail.gmail.com>
 <bcaee23e-6d48-e35b-856b-97e1d397d418@redhat.com>
 <CAJaqyWdCuQgK=KR5j=ZOWVgjHfbo0SVn+NsnfWsG+Xb9iDkyrw@mail.gmail.com>
In-Reply-To: <CAJaqyWdCuQgK=KR5j=ZOWVgjHfbo0SVn+NsnfWsG+Xb9iDkyrw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 12 Jul 2022 16:43:08 +0800
Message-ID: <CACGkMEtZuiqP8qPm3Y0FeVfwQFa2WYbK+u4eb1Hj5N+fAoopoA@mail.gmail.com>
Subject: Re: [RFC PATCH v9 12/23] vhost: Add opaque member to SVQElement
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eric Blake <eblake@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Jul 12, 2022 at 4:33 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Tue, Jul 12, 2022 at 9:53 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2022/7/11 17:56, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > > On Mon, Jul 11, 2022 at 11:05 AM Jason Wang <jasowang@redhat.com> wro=
te:
> > >>
> > >> =E5=9C=A8 2022/7/7 02:39, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > >>> When qemu injects buffers to the vdpa device it will be used to mai=
ntain
> > >>> contextual data. If SVQ has no operation, it will be used to mainta=
in
> > >>> the VirtQueueElement pointer.
> > >>>
> > >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > >>> ---
> > >>>    hw/virtio/vhost-shadow-virtqueue.h |  3 ++-
> > >>>    hw/virtio/vhost-shadow-virtqueue.c | 13 +++++++------
> > >>>    2 files changed, 9 insertions(+), 7 deletions(-)
> > >>>
> > >>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-s=
hadow-virtqueue.h
> > >>> index 0e434e9fd0..a811f90e01 100644
> > >>> --- a/hw/virtio/vhost-shadow-virtqueue.h
> > >>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > >>> @@ -16,7 +16,8 @@
> > >>>    #include "hw/virtio/vhost-iova-tree.h"
> > >>>
> > >>>    typedef struct SVQElement {
> > >>> -    VirtQueueElement *elem;
> > >>> +    /* Opaque data */
> > >>> +    void *opaque;
> > >>
> > >> So I wonder if we can simply:
> > >>
> > >> 1) introduce a opaque to VirtQueueElement
> > > (answered in other thread, pasting here for completion)
> > >
> > > It does not work for messages that are not generated by the guest. Fo=
r
> > > example, the ones used to restore the device state at live migration
> > > destination.
> >
> >
> > For the ones that requires more metadata, we can store it in elem->opaq=
ue?
> >
>
> But there is no VirtQueueElem there. VirtQueueElem is allocated by
> virtqueue_pop, but state restoring messages are not received by this
> function. If we allocate an artificial one, a lot of members do not
> make sense (like in_addr / out_addr), and we should never use them
> with virtqueue_push / fill / flush and similar.

Ok.

>
> >
> > >
> > >> 2) store pointers to ring_id_maps
> > >>
> > > I think you mean to keep storing VirtQueueElement at ring_id_maps?
> >
> >
> > Yes and introduce a pointer to metadata in VirtQueueElement
> >
> >
> > > Otherwise, looking for them will not be immediate.
> > >
> > >> Since
> > >>
> > >> 1) VirtQueueElement's member looks general
> > > Not general enough :).
> > >
> > >> 2) help to reduce the tricky codes like vhost_svq_empty_elem() and
> > >> vhost_svq_empty_elem().
> > >>
> > > I'm ok to change to whatever other method, but to allocate them
> > > individually seems worse to me. Both performance wise and because
> > > error paths are more complicated. Maybe it would be less tricky if I
> > > try to move the use of them less "by value" and more "as pointers"?
> >
> >
> > Or let's having a dedicated arrays (like desc_state/desc_extra in
> > kernel) instead of trying to reuse ring_id_maps.
> >
>
> Sure, it looks to me like:
> * renaming ring_id_maps to desc_state/desc_extra/something similar,
> since now it's used to store more state that only the guest mapping
> * Rename "opaque" to "data"
> * Forget the wrapper and assume data =3D=3D NULL is an invalid head /
> empty. To me they serve as a doc, but I guess it's fine to use them
> directly. The kernel works that way anyway.
>
> Does this look better?

Yes.

> It's definitely closer to the kernel so I guess
> it's an advantage.

I think the advantage is that it decouples the dynamic allocated
metadata (VirtQueueElem) out of the static allocated ones.

>
> Thanks!
>


