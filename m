Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 048D14358AF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 04:36:37 +0200 (CEST)
Received: from localhost ([::1]:50772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdNwa-0001eu-4T
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 22:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mdNux-0000cl-B6
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 22:34:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mdNut-0007Iw-P1
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 22:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634783690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+CUe1x+E8bGu/72iChGYTQ+poQeBwCR1eRlzAU+j+Y4=;
 b=X7PCEm1RqGZ3CzfbwBzQCTtcaFeqstjKpilnxl0vAyaJ9YY3dZPDpgbm1UP9ywj5IpAoAF
 lCFlMN2jG3wczfCTOmKOMVczeLNTE+dtoaDnvRj3Uag1VqumQcKz0pgdh4XDSF1eod7fpy
 9UQqEJun1Rmx4/vcrRi2Y9Me7epPSfE=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-BiZoCwLnOYqe10zmywexhg-1; Wed, 20 Oct 2021 22:34:48 -0400
X-MC-Unique: BiZoCwLnOYqe10zmywexhg-1
Received: by mail-lj1-f198.google.com with SMTP id
 j12-20020a2e800c000000b00210c475e1aaso2331128ljg.15
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 19:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+CUe1x+E8bGu/72iChGYTQ+poQeBwCR1eRlzAU+j+Y4=;
 b=5luGJuW2OrSBeoebyQwch7lbqSsxszNky+PfAvcT6sPRh8OQJvfrNmoWshkkx64lYa
 iRfFPDcpoFBWJ2pPKiyp+m6C6KyurXNFDvCxSUbOHJcxuTwxXVueVsm2uEFzt8Y9gnCp
 UBpZpiBo2gefWYcn66XXIW3qgXD4t1K8BQijezqrMHQbadyAagroQvMVOgj7zsAQn2XP
 4ees5TVXC95NNocHFEomCfxx8E0+9PKDkTyYQbUXOER8IHtd0sRC+b4oL+epmcyMyGff
 QFkB3jxCgDW/H74YS2NRMqB70z0SdMypmkHk3Zc+S4MgCG5RLhC/TeGwsKAXXWzjNKXf
 RF6w==
X-Gm-Message-State: AOAM532NJ5ESWYa3H7wO129mzP9/WFzpbsVEL2IF6ebPr7Ot7bfcmLZi
 imedoLTUaXUiPi25jI7FNFFDGjusLOaXvayJ/z64ohuQLX34vARvlrhAuPCrB5XowcgCHQDXl1c
 lxrFrG4t0Uts6tFzas3+HpYRbQkps1ow=
X-Received: by 2002:a2e:8099:: with SMTP id i25mr2920446ljg.277.1634783687206; 
 Wed, 20 Oct 2021 19:34:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRDo95s5e7iNB46zrTeZAe8KC9n49srN4A8MHrmNDd+sKzoUCSG1mVR38L9obbOvS3834nqXQ91XH3o2pAdCY=
X-Received: by 2002:a2e:8099:: with SMTP id i25mr2920420ljg.277.1634783686821; 
 Wed, 20 Oct 2021 19:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-19-eperezma@redhat.com>
 <79905c11-e313-ad60-17dc-1a47d35f12cc@redhat.com>
 <CACGkMEtc6tw5xauzw=1zSFUfC0oSRfokZbA6QsR7nEe5T7-4_A@mail.gmail.com>
 <CAJaqyWfvT36tbnSRhMoQcWXCYhjdkaOs_E3yKisPhv-o0oajCQ@mail.gmail.com>
 <CACGkMEvHopK4akFLeg56qN35AnJUHURs2MnFNwLWtOTvJ643uA@mail.gmail.com>
 <CAJaqyWdK6ZWeB3r2bU9SthL2Z9qWPR++km5QAzD48XH3Srv8mA@mail.gmail.com>
In-Reply-To: <CAJaqyWdK6ZWeB3r2bU9SthL2Z9qWPR++km5QAzD48XH3Srv8mA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 21 Oct 2021 10:34:36 +0800
Message-ID: <CACGkMEtFirKqFvS_wWu65wEDecSYwBo6Ke_H9eKzv5OrJzkwrw@mail.gmail.com>
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

On Wed, Oct 20, 2021 at 8:07 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Wed, Oct 20, 2021 at 11:01 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Wed, Oct 20, 2021 at 3:54 PM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Tue, Oct 19, 2021 at 11:23 AM Jason Wang <jasowang@redhat.com> wro=
te:
> > > >
> > > > On Tue, Oct 19, 2021 at 4:32 PM Jason Wang <jasowang@redhat.com> wr=
ote:
> > > > >
> > > > >
> > > > > =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:06, Eugenio P=C3=A9rez =
=E5=86=99=E9=81=93:
> > > > > > This tree is able to look for a translated address from an IOVA=
 address.
> > > > > >
> > > > > > At first glance is similar to util/iova-tree. However, SVQ work=
ing on
> > > > > > devices with limited IOVA space need more capabilities, like al=
locating
> > > > > > IOVA chunks or perform reverse translations (qemu addresses to =
iova).
> > > > >
> > > > >
> > > > > I don't see any reverse translation is used in the shadow code. O=
r
> > > > > anything I missed?
> > > >
> > > > Ok, it looks to me that it is used in the iova allocator. But I thi=
nk
> > > > it's better to decouple it to an independent allocator instead of
> > > > vhost iova tree.
> > > >
> > >
> > > Reverse translation is used every time a buffer is made available,
> > > since buffers content are not copied, only the descriptors to SVQ
> > > vring.
> >
> > I may miss something but I didn't see the code? Qemu knows the VA of
> > virtqueue, and the VA of the VQ is stored in the VirtQueueElem?
> >
>
> It's used in the patch 20/20, could that be the misunderstanding? The
> function calling it is vhost_svq_translate_addr.
>
> Qemu knows the VA address of the buffer, but it must offer a valid SVQ
> iova to the device. That is the translation I mean.

Ok, I get you. So if I understand correctly, what you did is:

1) allocate IOVA during region_add
2) preform VA->IOVA reverse lookup in handle_kick

This should be fine, but here're some suggestions:

1) remove the assert(map) in vhost_svq_translate_addr() since guest
can add e.g BAR address
2) we probably need a better name vhost_iova_tree_alloc(), maybe
"vhost_iova_tree_map_alloc()"

There's actually another method.

1) don't do IOVA/map allocation in region_add()
2) do the allocation in handle_kick(), then we know the IOVA so no
reverse lookup

The advantage is that this can work for the case of vIOMMU. And they
should perform the same:

1) you method avoid the iova allocation per sg
2) my method avoid the reverse lookup per sg

>
> > >
> > > At this point all the limits are copied to vhost iova tree in the nex=
t
> > > revision I will send, defined at its creation at
> > > vhost_iova_tree_new(). They are outside of util/iova-tree, only sent
> > > to the latter at allocation time.
> > >
> > > Since vhost_iova_tree has its own vhost_iova_tree_alloc(), that wraps
> > > the iova_tree_alloc() [1], limits could be kept in vhost-vdpa and mak=
e
> > > them an argument of vhost_iova_tree_alloc. But I'm not sure if it's
> > > what you are proposing or I'm missing something.
> >
> > If the reverse translation is only used in iova allocation, I meant to
> > split the logic of IOVA allocation itself.
> >
>
> Still don't understand it, sorry :). In SVQ setup we allocate an iova
> address for every guest's GPA address its driver can use. After that
> there should be no allocation unless memory is hotplugged.
>
> So the limits are only needed precisely at allocation time. Not sure
> if that is what you mean here, but to first allocate and then check if
> it is within the range could lead to false negatives, since there
> could be a valid range *in* the address but the iova allocator
> returned us another range that fell outside the range. How could we
> know the cause if it is not using the range itself?

See my above reply. And we can teach the iova allocator to return the
IOVA in the range that vhost-vDPA supports.

Thanks

>
> > >
> > > Either way, I think it is harder to talk about this specific case
> > > without code, since this one still does not address the limits. Would
> > > you prefer me to send another RFC in WIP quality, with *not* all
> > > comments addressed? I would say that there is not a lot of pending
> > > work to send the next one, but it might be easier for all of us.
> >
> > I'd prefer to try to address them all, otherwise it's not easy to see
> > what is missing.
> >
>
> Got it, I will do it that way then!
>
> Thanks!
>
> > Thanks
> >
> > >
> > > Thanks!
> > >
> > > [1] This util/iova-tree method will be proposed in the next series,
> > > and vhost_iova_tree wraps it since it needs to keep in sync both
> > > trees: iova->qemu vaddr for iova allocation and the reverse one to
> > > translate available buffers.
> > >
> > > > Thanks
> > > >
> > >
> >
>


