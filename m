Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4EC434ADD
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 14:11:37 +0200 (CEST)
Received: from localhost ([::1]:51766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdARU-0005Ce-HD
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 08:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mdAN6-0002LQ-Bq
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 08:07:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mdAN3-000479-HX
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 08:07:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634731619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kur45H/6hCEtVCfMvDu1d5EQYDNpy0O9ZeybcG57PLk=;
 b=BR2BWcOk++MCUadZ8MbjxMFqLRb/wV970EU+wWBcDERMAN4UeCfAT4jlWq4kcAE+xDnnIN
 2PThCprASvNGTdjkBwHqWCPi2VNNyw55Z+JGWWwU3O+7FfXfwMsW3NrD9+bzTkCG/nQLYa
 cY8EytglhazA7dn7Y/XvEQhhV7V4Lig=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-Lda__IcANl2kUW8yuRc38g-1; Wed, 20 Oct 2021 08:06:57 -0400
X-MC-Unique: Lda__IcANl2kUW8yuRc38g-1
Received: by mail-qv1-f70.google.com with SMTP id
 4-20020a05621420a400b003831d93e2b5so2594728qvd.12
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 05:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Kur45H/6hCEtVCfMvDu1d5EQYDNpy0O9ZeybcG57PLk=;
 b=34dDd3M63+alv8WNCMU0evbHQ8ncg2+lp0mrGlTY+ZIYsNS8q9qZgPY+6PLETr363+
 V9cRuW8rGSKWPBiMQmRc4zalnbElINyNGaCt72fGpI558IJLLKTSxsb5Y/gjo63nocYa
 Dqa2DuDGDxz1RIVYqwOfe4uASWcBxg4QUN2cTxTEPcjzJzUdRQD6kDahQ1ZpDmhhxZnE
 nck5EXQXVkY7lMHPmMXPeoBDYZhJXsW8LJtVxmjpXSmibf6IjUjJVXAA2s63WFPmlOQO
 Cywvdjeu2uYhyFT+HSnQm6Pl1w3FMIAZMai4KeiJkSP/HNmJPDQDPHZV+IEbg9kMD/P/
 0lpw==
X-Gm-Message-State: AOAM532pViB6YSDkbcB1SfWiut5wBoeTZzSii/RSVnZT5HCaFPbChIVr
 5djf0RFSjQvEK8ekLi6o8zBYtFDexGTddpU+7544gLyHzU+/SUz0IR3OovF8RU62c75JUkcPz3a
 QX7C6mQfKwKQFvldcFCeUv6QCQ5Vgs3k=
X-Received: by 2002:a05:620a:41e:: with SMTP id
 30mr4822074qkp.87.1634731615667; 
 Wed, 20 Oct 2021 05:06:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvpdv/F7mkC7ofYmOW2T0cKxvsfRMxqqedigEC7DXc8AP+ZD/D+q5PAiGy8gKm7FWH+9ldUzyQvU+H/TVgOko=
X-Received: by 2002:a05:620a:41e:: with SMTP id
 30mr4821887qkp.87.1634731613552; 
 Wed, 20 Oct 2021 05:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-19-eperezma@redhat.com>
 <79905c11-e313-ad60-17dc-1a47d35f12cc@redhat.com>
 <CACGkMEtc6tw5xauzw=1zSFUfC0oSRfokZbA6QsR7nEe5T7-4_A@mail.gmail.com>
 <CAJaqyWfvT36tbnSRhMoQcWXCYhjdkaOs_E3yKisPhv-o0oajCQ@mail.gmail.com>
 <CACGkMEvHopK4akFLeg56qN35AnJUHURs2MnFNwLWtOTvJ643uA@mail.gmail.com>
In-Reply-To: <CACGkMEvHopK4akFLeg56qN35AnJUHURs2MnFNwLWtOTvJ643uA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 20 Oct 2021 14:06:17 +0200
Message-ID: <CAJaqyWdK6ZWeB3r2bU9SthL2Z9qWPR++km5QAzD48XH3Srv8mA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 18/20] vhost: Add VhostIOVATree
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, Oct 20, 2021 at 11:01 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Wed, Oct 20, 2021 at 3:54 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Tue, Oct 19, 2021 at 11:23 AM Jason Wang <jasowang@redhat.com> wrote=
:
> > >
> > > On Tue, Oct 19, 2021 at 4:32 PM Jason Wang <jasowang@redhat.com> wrot=
e:
> > > >
> > > >
> > > > =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:06, Eugenio P=C3=A9rez =E5=
=86=99=E9=81=93:
> > > > > This tree is able to look for a translated address from an IOVA a=
ddress.
> > > > >
> > > > > At first glance is similar to util/iova-tree. However, SVQ workin=
g on
> > > > > devices with limited IOVA space need more capabilities, like allo=
cating
> > > > > IOVA chunks or perform reverse translations (qemu addresses to io=
va).
> > > >
> > > >
> > > > I don't see any reverse translation is used in the shadow code. Or
> > > > anything I missed?
> > >
> > > Ok, it looks to me that it is used in the iova allocator. But I think
> > > it's better to decouple it to an independent allocator instead of
> > > vhost iova tree.
> > >
> >
> > Reverse translation is used every time a buffer is made available,
> > since buffers content are not copied, only the descriptors to SVQ
> > vring.
>
> I may miss something but I didn't see the code? Qemu knows the VA of
> virtqueue, and the VA of the VQ is stored in the VirtQueueElem?
>

It's used in the patch 20/20, could that be the misunderstanding? The
function calling it is vhost_svq_translate_addr.

Qemu knows the VA address of the buffer, but it must offer a valid SVQ
iova to the device. That is the translation I mean.

> >
> > At this point all the limits are copied to vhost iova tree in the next
> > revision I will send, defined at its creation at
> > vhost_iova_tree_new(). They are outside of util/iova-tree, only sent
> > to the latter at allocation time.
> >
> > Since vhost_iova_tree has its own vhost_iova_tree_alloc(), that wraps
> > the iova_tree_alloc() [1], limits could be kept in vhost-vdpa and make
> > them an argument of vhost_iova_tree_alloc. But I'm not sure if it's
> > what you are proposing or I'm missing something.
>
> If the reverse translation is only used in iova allocation, I meant to
> split the logic of IOVA allocation itself.
>

Still don't understand it, sorry :). In SVQ setup we allocate an iova
address for every guest's GPA address its driver can use. After that
there should be no allocation unless memory is hotplugged.

So the limits are only needed precisely at allocation time. Not sure
if that is what you mean here, but to first allocate and then check if
it is within the range could lead to false negatives, since there
could be a valid range *in* the address but the iova allocator
returned us another range that fell outside the range. How could we
know the cause if it is not using the range itself?

> >
> > Either way, I think it is harder to talk about this specific case
> > without code, since this one still does not address the limits. Would
> > you prefer me to send another RFC in WIP quality, with *not* all
> > comments addressed? I would say that there is not a lot of pending
> > work to send the next one, but it might be easier for all of us.
>
> I'd prefer to try to address them all, otherwise it's not easy to see
> what is missing.
>

Got it, I will do it that way then!

Thanks!

> Thanks
>
> >
> > Thanks!
> >
> > [1] This util/iova-tree method will be proposed in the next series,
> > and vhost_iova_tree wraps it since it needs to keep in sync both
> > trees: iova->qemu vaddr for iova allocation and the reverse one to
> > translate available buffers.
> >
> > > Thanks
> > >
> >
>


