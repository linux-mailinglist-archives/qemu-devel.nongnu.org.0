Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDAE4227A0
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 15:18:38 +0200 (CEST)
Received: from localhost ([::1]:49756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXkL7-0001kf-85
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 09:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mXkHn-0007yR-Ev
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 09:15:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mXkHk-00077Y-GG
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 09:15:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633439706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5VuyWVupjgVPbvj4WYMIv8TpJvFkCM6pIWlhaJw9oTQ=;
 b=K1uefeOXHUb47VhnXEPo26xkDHxThzCY1frPXOR9QtgGRh79SM3eT7RorH06rTN0zUtAvo
 whLV9Ctgxh7OAhH+ewlrUIkRWDuOI+Mo3YRYG/93LEljnkBS8AWA53RXruNV9Lgv3iUzl8
 6rI8ygSoA0eL0u49IZCDiPH18PSFH+0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-pGAPDoxFO3eOkuDLm1ur-A-1; Tue, 05 Oct 2021 09:15:05 -0400
X-MC-Unique: pGAPDoxFO3eOkuDLm1ur-A-1
Received: by mail-qv1-f71.google.com with SMTP id
 u13-20020ad45aad000000b003829b9760b8so13902908qvg.18
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 06:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5VuyWVupjgVPbvj4WYMIv8TpJvFkCM6pIWlhaJw9oTQ=;
 b=pZwpRB2s8PlLICP7xD3ad+4bQfP1CR2K9/WJTHKGR10EDaaaPEOJFDUR4G63bCd/W4
 Su9Omzt+1BheX7Gp1AqtU6RCRTWb/9F/04UCC32kDi7JF9GXYxWN+iEagTpVC46BuDR8
 bs2fmoQ6U75LhIjxwwvsWnNxr7Q2g0OWLh40WSTdquXAZrBBEXNQEYc0/jknsKjC1jZe
 u2O987RQJxh64QFzTHx40zC9x82I3fSMcfFKOmAVvoSQhoCwYYe+hF5P70AICUN6R0YB
 frIlTB1QYPT7hnIoPMrn6zbCiRD1+sfuIrcIlGOJqipc+uHgR7VaLNlzf7YDTRZ/EWLx
 59mw==
X-Gm-Message-State: AOAM532lesEOCT79f6iCYGMdGPHLu0hyPfteHsOWcdn7fHOXUeUvpJzj
 VC+XeQJ3Ovm7iLV9LW3TX0vONqXR6+0mt7iCxiurDltgnvRb94KoL6kaAIxOg3N/Fvw0UGw/RBM
 p1aD+q8H4VqdnsB991cNbrosT+pnczsw=
X-Received: by 2002:a37:6646:: with SMTP id a67mr14463133qkc.87.1633439704983; 
 Tue, 05 Oct 2021 06:15:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXNjgLt0ULC+09Ep1nImdNYBEJTiYO42IaOHfhWOtu3NQNH5Euq3YFQGHNyjtiJPNp8LTyuSRYNilotJEKGU4=
X-Received: by 2002:a37:6646:: with SMTP id a67mr14463106qkc.87.1633439704718; 
 Tue, 05 Oct 2021 06:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211005080131.408506-1-eperezma@redhat.com>
 <20211005080131.408506-3-eperezma@redhat.com>
 <20211005041429-mutt-send-email-mst@kernel.org>
 <CAJaqyWfa8DLkLjmcOYd-av1ZsTDFyr++_+1omomtS=-Qq=Y9zw@mail.gmail.com>
 <20211005064646-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211005064646-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 5 Oct 2021 15:14:28 +0200
Message-ID: <CAJaqyWdrJn8JSxCAkWc8xRh=6hg9xBOCX9BXs-bZk=6F39+Myw@mail.gmail.com>
Subject: Re: [PATCH 2/3] vdpa: Add vhost_vdpa_section_end
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
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

On Tue, Oct 5, 2021 at 12:47 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Oct 05, 2021 at 11:52:37AM +0200, Eugenio Perez Martin wrote:
> > On Tue, Oct 5, 2021 at 10:15 AM Michael S. Tsirkin <mst@redhat.com> wro=
te:
> > >
> > > On Tue, Oct 05, 2021 at 10:01:30AM +0200, Eugenio P=C3=A9rez wrote:
> > > > Abstract this operation, that will be reused when validating the re=
gion
> > > > against the iova range that the device supports.
> > > >
> > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > >
> > > Note that as defined end is actually 1 byte beyond end of section.
> > > As such it can e.g. overflow if cast to u64.
> > > So be careful to use int128 ops with it.
> >
> > You are right, but this is only the result of extracting "llend"
> > calculation in its own function, since it is going to be used a third
> > time in the next commit. This next commit contains a mistake because
> > of this, as you pointed out.
> >
> > Since "last" would be a very misleading name, do you think we could
> > give a better name / type to it?
> >
> > > Also - document?
> >
> > It will be documented with that ("It returns one byte beyond end of
> > section" or similar) too.
> >
> > Thanks!
>
> that's how c++ containers work so maybe it's not too bad as long
> as we document this carefully.
>

I tend to see it that way except when the name is "last", that I read
as "last one addressable/valid", as discussed in the
VHOST_VDPA_GET_IOVA_RANGE call mail thread. So end =3D past range, last
=3D last one valid.

It would be great to have something like void * / hwaddr, or c++
chrono time_point<second> vs time_point<millisecond>, that moves to
type system the verification of not mixing different range types. But
this may be overthinking at this moment.

Thanks!

> > >
> > > > ---
> > > >  hw/virtio/vhost-vdpa.c | 18 +++++++++++-------
> > > >  1 file changed, 11 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > > index ea1aa71ad8..a1de6c7c9c 100644
> > > > --- a/hw/virtio/vhost-vdpa.c
> > > > +++ b/hw/virtio/vhost-vdpa.c
> > > > @@ -24,6 +24,15 @@
> > > >  #include "trace.h"
> > > >  #include "qemu-common.h"
> > > >
> > > > +static Int128 vhost_vdpa_section_end(const MemoryRegionSection *se=
ction)
> > > > +{
> > > > +    Int128 llend =3D int128_make64(section->offset_within_address_=
space);
> > > > +    llend =3D int128_add(llend, section->size);
> > > > +    llend =3D int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
> > > > +
> > > > +    return llend;
> > > > +}
> > > > +
> > > >  static bool vhost_vdpa_listener_skipped_section(MemoryRegionSectio=
n *section)
> > > >  {
> > > >      return (!memory_region_is_ram(section->mr) &&
> > > > @@ -160,10 +169,7 @@ static void vhost_vdpa_listener_region_add(Mem=
oryListener *listener,
> > > >      }
> > > >
> > > >      iova =3D TARGET_PAGE_ALIGN(section->offset_within_address_spac=
e);
> > > > -    llend =3D int128_make64(section->offset_within_address_space);
> > > > -    llend =3D int128_add(llend, section->size);
> > > > -    llend =3D int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
> > > > -
> > > > +    llend =3D vhost_vdpa_section_end(section);
> > > >      if (int128_ge(int128_make64(iova), llend)) {
> > > >          return;
> > > >      }
> > > > @@ -221,9 +227,7 @@ static void vhost_vdpa_listener_region_del(Memo=
ryListener *listener,
> > > >      }
> > > >
> > > >      iova =3D TARGET_PAGE_ALIGN(section->offset_within_address_spac=
e);
> > > > -    llend =3D int128_make64(section->offset_within_address_space);
> > > > -    llend =3D int128_add(llend, section->size);
> > > > -    llend =3D int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
> > > > +    llend =3D vhost_vdpa_section_end(section);
> > > >
> > > >      trace_vhost_vdpa_listener_region_del(v, iova, int128_get64(lle=
nd));
> > > >
> > > > --
> > > > 2.27.0
> > >
>


