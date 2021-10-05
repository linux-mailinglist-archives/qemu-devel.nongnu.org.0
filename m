Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02D94222DF
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 11:56:34 +0200 (CEST)
Received: from localhost ([::1]:38194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXhBZ-0006zh-P4
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 05:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mXh8S-0004Tq-Lw
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 05:53:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mXh8N-00066b-DU
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 05:53:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633427594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j3IA3WKmvNlPDXR0zxqt4xLeYpduDrvMVwoIyXkju78=;
 b=Lz8UkOdJd8kcjEljg1223aKPV4BKxxGgefuunrxNESqSE+/OpcSvVwzd+9xBnYRqt9kwNF
 4GdF+eolfkuz4uezGSMe2BmmejP9udZQFc6IGNXyzw+YL0tAk7XWTj6sm0twzoZyLetwe8
 GIsLcEfLg1WGAdYU/gmKmTCNnBRUEJs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-ur48VwiYNLqbmJ-KSKacdA-1; Tue, 05 Oct 2021 05:53:13 -0400
X-MC-Unique: ur48VwiYNLqbmJ-KSKacdA-1
Received: by mail-qv1-f72.google.com with SMTP id
 gi5-20020a056214248500b00382f7a7c7e6so2932289qvb.21
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 02:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j3IA3WKmvNlPDXR0zxqt4xLeYpduDrvMVwoIyXkju78=;
 b=IbIqY22XKTeGpFpvVwdJI69vV5idc7ra+mIU95qzXgTitddNEV4eK7ZFwmPb7yNOBF
 Zf0DScUdv6D4NQJd/bM5NBc9oB1YtyDFNEl8YqEdpUGh7wXR6Xam+kxB/7CKjXCYMukK
 Alps3EnfTANKePk1cThdcXJub/EkQq2BcgWjLZl8r1NHhPalGjgBlI/p18pMR2+YYW79
 ah9I5DrLpbj3wdEeaxOOfnxH5LkTCJDcZM2JMBAsrR76Tc1Gcav67Lj4dY7pV6oOADjw
 6Og8Ags8wpx/31m/0g1zJ/tsfexTNf7M+5xM5hR0/f6sM9B3QNs1cUWDzzU9fprC6y0f
 hyIA==
X-Gm-Message-State: AOAM532dIWJGW783i0oZUC+xIyybNqtrgvk9wI31emaWYWEJv6E9I7yG
 0apfsr9xWZQ/SlmLjLtjekayoNbgLoMHyXH9YyWHfi+NtWvx30Ixnijfr8UwKBGzDg0V+rJ2+cQ
 bkQO04sAumfbXXqLLECcQAsh4ocSLgDA=
X-Received: by 2002:aed:3022:: with SMTP id 31mr18782324qte.322.1633427593292; 
 Tue, 05 Oct 2021 02:53:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPzzzhD6ejVLQcgkzyNhP1jrmqTRsraWxsxIcG5MdDmF3F9dQy6MCOkYqU/xQBad41iVJeMsK1UdmpWDt2Gpk=
X-Received: by 2002:aed:3022:: with SMTP id 31mr18782307qte.322.1633427593087; 
 Tue, 05 Oct 2021 02:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211005080131.408506-1-eperezma@redhat.com>
 <20211005080131.408506-3-eperezma@redhat.com>
 <20211005041429-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211005041429-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 5 Oct 2021 11:52:37 +0200
Message-ID: <CAJaqyWfa8DLkLjmcOYd-av1ZsTDFyr++_+1omomtS=-Qq=Y9zw@mail.gmail.com>
Subject: Re: [PATCH 2/3] vdpa: Add vhost_vdpa_section_end
To: "Michael S. Tsirkin" <mst@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: Parav Pandit <parav@mellanox.com>, Jason Wang <jasowang@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 5, 2021 at 10:15 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Oct 05, 2021 at 10:01:30AM +0200, Eugenio P=C3=A9rez wrote:
> > Abstract this operation, that will be reused when validating the region
> > against the iova range that the device supports.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> Note that as defined end is actually 1 byte beyond end of section.
> As such it can e.g. overflow if cast to u64.
> So be careful to use int128 ops with it.

You are right, but this is only the result of extracting "llend"
calculation in its own function, since it is going to be used a third
time in the next commit. This next commit contains a mistake because
of this, as you pointed out.

Since "last" would be a very misleading name, do you think we could
give a better name / type to it?

> Also - document?

It will be documented with that ("It returns one byte beyond end of
section" or similar) too.

Thanks!

>
> > ---
> >  hw/virtio/vhost-vdpa.c | 18 +++++++++++-------
> >  1 file changed, 11 insertions(+), 7 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index ea1aa71ad8..a1de6c7c9c 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -24,6 +24,15 @@
> >  #include "trace.h"
> >  #include "qemu-common.h"
> >
> > +static Int128 vhost_vdpa_section_end(const MemoryRegionSection *sectio=
n)
> > +{
> > +    Int128 llend =3D int128_make64(section->offset_within_address_spac=
e);
> > +    llend =3D int128_add(llend, section->size);
> > +    llend =3D int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
> > +
> > +    return llend;
> > +}
> > +
> >  static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *s=
ection)
> >  {
> >      return (!memory_region_is_ram(section->mr) &&
> > @@ -160,10 +169,7 @@ static void vhost_vdpa_listener_region_add(MemoryL=
istener *listener,
> >      }
> >
> >      iova =3D TARGET_PAGE_ALIGN(section->offset_within_address_space);
> > -    llend =3D int128_make64(section->offset_within_address_space);
> > -    llend =3D int128_add(llend, section->size);
> > -    llend =3D int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
> > -
> > +    llend =3D vhost_vdpa_section_end(section);
> >      if (int128_ge(int128_make64(iova), llend)) {
> >          return;
> >      }
> > @@ -221,9 +227,7 @@ static void vhost_vdpa_listener_region_del(MemoryLi=
stener *listener,
> >      }
> >
> >      iova =3D TARGET_PAGE_ALIGN(section->offset_within_address_space);
> > -    llend =3D int128_make64(section->offset_within_address_space);
> > -    llend =3D int128_add(llend, section->size);
> > -    llend =3D int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
> > +    llend =3D vhost_vdpa_section_end(section);
> >
> >      trace_vhost_vdpa_listener_region_del(v, iova, int128_get64(llend))=
;
> >
> > --
> > 2.27.0
>


