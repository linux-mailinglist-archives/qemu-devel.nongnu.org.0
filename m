Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334404347A0
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 11:07:11 +0200 (CEST)
Received: from localhost ([::1]:40102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md7Z0-0001dv-0P
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 05:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md7Th-0006EK-L5
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 05:01:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md7Tf-0008Ay-RN
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 05:01:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634720499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OeIM3b3a9OTfXYldrnqO/3YdJ6F8u22/85b1rgGrfjM=;
 b=ho8St/FcUdnzEi4e2rO+LkOOUKqQdiuhCZoYqFh57i3vx6MvRKLsaHHBfT07YGJq0oYAjl
 /u9IMMZTc6g/PABoS0bkqAtSX3sJUnXUVu+Nm3vI3C6ifp/Neu5HI2nhIUYbDUvIz6Mw6E
 Bt6/COzPWrpwc0v6fBYHed2PBs1AFvM=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-d263puRYNJWTJHRiUaqsXA-1; Wed, 20 Oct 2021 05:01:37 -0400
X-MC-Unique: d263puRYNJWTJHRiUaqsXA-1
Received: by mail-lf1-f70.google.com with SMTP id
 i1-20020a056512340100b003fdd5b951e0so2829379lfr.22
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 02:01:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OeIM3b3a9OTfXYldrnqO/3YdJ6F8u22/85b1rgGrfjM=;
 b=zvGAmloF3voj0oG+MVjJPGQNfz81mf/kA9o/bUd5jK9WoSuSlEXIFfStCtliR2F5QR
 7tWtY6VxlvSNJLR9XMuVjcRbGOCd0dFr4uuBHe5MRd/64elMaHmnHRrIe5wzGMVatpRw
 2EVVErBkw57bJ9BpahRpUtUgqHVxHV5d9ybE1bCl/UFEej1GrJNZHIWSk/w/MyPoqYQb
 byKFD0iAX8cp/eincZaXfpgcBzHOZQg3AeEuB+zU1ArYyUn5u+PyKERP4CNLTIggvZSh
 DoNmcUA8+Q2wDttLjz2TyID55LB2qQdbPfieCuhregD6+iDUJ1e+Pd2aGFbvPFG0S6IF
 p08A==
X-Gm-Message-State: AOAM5338xn0OlgO1THYPr0GeEAPzOa/uqwBGtDpgOjrTXyWvue2fcEvb
 dGnaXAzoh5g175i6d6NO7/whqEYUs7uLEfhOxFNHM8ZlHOnXsNEHVo6qa5AmMlcoN4CuiZGSDVH
 JrUANtoIjxPPWT+txdZlV6fysftmYqb0=
X-Received: by 2002:ac2:494d:: with SMTP id o13mr11393083lfi.580.1634720496113; 
 Wed, 20 Oct 2021 02:01:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDBTuBk3Em445V9wHDhC35s7/sRtYTVBrj+JZ7HluDXe537dY+Kj/zSFVKmCVHx5hiBy/r8ejm52ztlOErHUY=
X-Received: by 2002:ac2:494d:: with SMTP id o13mr11393058lfi.580.1634720495811; 
 Wed, 20 Oct 2021 02:01:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-19-eperezma@redhat.com>
 <79905c11-e313-ad60-17dc-1a47d35f12cc@redhat.com>
 <CACGkMEtc6tw5xauzw=1zSFUfC0oSRfokZbA6QsR7nEe5T7-4_A@mail.gmail.com>
 <CAJaqyWfvT36tbnSRhMoQcWXCYhjdkaOs_E3yKisPhv-o0oajCQ@mail.gmail.com>
In-Reply-To: <CAJaqyWfvT36tbnSRhMoQcWXCYhjdkaOs_E3yKisPhv-o0oajCQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 20 Oct 2021 17:01:25 +0800
Message-ID: <CACGkMEvHopK4akFLeg56qN35AnJUHURs2MnFNwLWtOTvJ643uA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 18/20] vhost: Add VhostIOVATree
To: Eugenio Perez Martin <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 20, 2021 at 3:54 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Tue, Oct 19, 2021 at 11:23 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Tue, Oct 19, 2021 at 4:32 PM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > >
> > > =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:06, Eugenio P=C3=A9rez =E5=86=
=99=E9=81=93:
> > > > This tree is able to look for a translated address from an IOVA add=
ress.
> > > >
> > > > At first glance is similar to util/iova-tree. However, SVQ working =
on
> > > > devices with limited IOVA space need more capabilities, like alloca=
ting
> > > > IOVA chunks or perform reverse translations (qemu addresses to iova=
).
> > >
> > >
> > > I don't see any reverse translation is used in the shadow code. Or
> > > anything I missed?
> >
> > Ok, it looks to me that it is used in the iova allocator. But I think
> > it's better to decouple it to an independent allocator instead of
> > vhost iova tree.
> >
>
> Reverse translation is used every time a buffer is made available,
> since buffers content are not copied, only the descriptors to SVQ
> vring.

I may miss something but I didn't see the code? Qemu knows the VA of
virtqueue, and the VA of the VQ is stored in the VirtQueueElem?

>
> At this point all the limits are copied to vhost iova tree in the next
> revision I will send, defined at its creation at
> vhost_iova_tree_new(). They are outside of util/iova-tree, only sent
> to the latter at allocation time.
>
> Since vhost_iova_tree has its own vhost_iova_tree_alloc(), that wraps
> the iova_tree_alloc() [1], limits could be kept in vhost-vdpa and make
> them an argument of vhost_iova_tree_alloc. But I'm not sure if it's
> what you are proposing or I'm missing something.

If the reverse translation is only used in iova allocation, I meant to
split the logic of IOVA allocation itself.

>
> Either way, I think it is harder to talk about this specific case
> without code, since this one still does not address the limits. Would
> you prefer me to send another RFC in WIP quality, with *not* all
> comments addressed? I would say that there is not a lot of pending
> work to send the next one, but it might be easier for all of us.

I'd prefer to try to address them all, otherwise it's not easy to see
what is missing.

Thanks

>
> Thanks!
>
> [1] This util/iova-tree method will be proposed in the next series,
> and vhost_iova_tree wraps it since it needs to keep in sync both
> trees: iova->qemu vaddr for iova allocation and the reverse one to
> translate available buffers.
>
> > Thanks
> >
>


