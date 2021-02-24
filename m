Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECF83240F7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 16:57:10 +0100 (CET)
Received: from localhost ([::1]:60682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEwXF-0006ub-A2
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 10:57:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEwRX-0001vJ-Oi
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:51:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEwRQ-0008WN-OZ
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:51:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614181868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8IO0feKnQpkKDmGdg3SJzC4GYwm2FUXwpfFYXHI1ckM=;
 b=BjxWll2qG/wG9xlH3V7iA0/cjKq0wkQTeZgOL9fZZWdPqkZXw5br9cE+DnvgQxsj8AjOoJ
 IiWvJsE12268P9dnN89epfqZnAIxv97fOsFaCUZ6Zo7PVt5Ssdk0BVDkV8LnJR5661AR1x
 tx4SnKFXi6Hs8tKClmLqsRLWBRGd6ms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-_rDh9ZbaNWKlLUNhCSxZ7A-1; Wed, 24 Feb 2021 10:51:04 -0500
X-MC-Unique: _rDh9ZbaNWKlLUNhCSxZ7A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 490BFE4050
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 15:40:26 +0000 (UTC)
Received: from localhost (ovpn-115-137.ams2.redhat.com [10.36.115.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8F515D9DD;
 Wed, 24 Feb 2021 15:40:18 +0000 (UTC)
Date: Wed, 24 Feb 2021 15:40:17 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 2/3] memory: add memory_region_is_mapped_shared()
Message-ID: <YDZzYcIEk7a9t8+e@stefanha-x1.localdomain>
References: <20210222161017.570837-1-stefanha@redhat.com>
 <20210222161017.570837-3-stefanha@redhat.com>
 <CAMxuvaxXpRFa+V3H5qmKe4MAo+vUrasMTc+y_s8w4AVQGdnkAA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMxuvaxXpRFa+V3H5qmKe4MAo+vUrasMTc+y_s8w4AVQGdnkAA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pA19J2z7YdqQK5Ia"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Wolf, Kevin" <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--pA19J2z7YdqQK5Ia
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 02:33:32PM +0400, Marc-Andr=E9 Lureau wrote:
> On Mon, Feb 22, 2021 at 8:11 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
>=20
> > Add a function to query whether a memory region is mmap(MAP_SHARED).
> > This will be used to check that vhost-user memory regions can be shared
> > with the device backend process in the next patch.
> >
> > An inline function in "exec/memory.h" would have been nice but RAMBlock
> > fields are only accessible from memory.c (see "exec/ramblock.h").
> >
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  include/exec/memory.h | 11 +++++++++++
> >  softmmu/memory.c      |  6 ++++++
> >  2 files changed, 17 insertions(+)
> >
> > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > index c6fb714e49..7b7dbe9fd0 100644
> > --- a/include/exec/memory.h
> > +++ b/include/exec/memory.h
> > @@ -2457,6 +2457,17 @@ static inline bool
> > memory_access_is_direct(MemoryRegion *mr, bool is_write)
> >      }
> >  }
> >
> > +/**
> > + * memory_region_is_mapped_shared: check whether a memory region is
> > + * mmap(MAP_SHARED)
> > + *
> > + * Returns %true is a memory region is mmap(MAP_SHARED). This is alway=
s
> > false
> > + * on memory regions that do not support memory_region_get_ram_ptr().
> > + *
> > + * @mr: the memory region being queried
> > + */
> > +bool memory_region_is_mapped_shared(MemoryRegion *mr);
> > +
> >  /**
> >   * address_space_read: read from an address space.
> >   *
> > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > index 874a8fccde..e6631e5d4c 100644
> > --- a/softmmu/memory.c
> > +++ b/softmmu/memory.c
> > @@ -1809,6 +1809,12 @@ bool memory_region_is_ram_device(MemoryRegion *m=
r)
> >      return mr->ram_device;
> >  }
> >
> > +bool memory_region_is_mapped_shared(MemoryRegion *mr)
> > +{
> > +    return memory_access_is_direct(mr, false) &&
> >
>=20
> memory_access_is_direct is a bit special, it treats ram-device differentl=
y
> from rom-device since commit 4a2e242bbb306 ("memory: Don't use memcpy for
> ram_device regions").
>=20
> I don't think it's an issue for now, but I wonder if in the future we wil=
l
> share ram-device as well.
>=20
> Where did you get the idea to use that function? I suppose that's also th=
e
> one we use somewhere else in the code path sharing the VM memory.

It's used right before qemu_map_ram_ptr() in address_space_read() and
seems like the most comprehensive way to check if a MemoryRegion is
accessed via memory loads/stores.

Do you prefer just memory_region_is_ram()? Or something more complicated
to also allow romd?

Stefan

--pA19J2z7YdqQK5Ia
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA2c2EACgkQnKSrs4Gr
c8jQxQf+LI/JO5kVvcOGuJ8D99JCdOF/wRrJfrKUqlXN3R6NWWdjqIzNl62Fwunh
DsK4HLhsy98yGsfNiT6FlMT9pIIgxNxI05jNgDv/oiKbUDOI2+3qFowOAsPgPic+
MuSp80FUy7KDEW12Y82PAFuOEm4VIVDq0gNvpWYj6LJWmwo58ZSXtSwC8YJg9URM
GYLcR4IW8qHc4LVSQ1fPiEZFZqS6kV4gh4KFd68e7I3GqENTAh1jpQEWKdJBhQ9O
sJ359Nul6klht+bFsTl1JnZOukHKiZgD4KDlW/dNB8sSXwegKsMIkije8njhtZQj
NOovHHnIFFPjYQWD/26XqnLtWEkQrw==
=Inlv
-----END PGP SIGNATURE-----

--pA19J2z7YdqQK5Ia--


