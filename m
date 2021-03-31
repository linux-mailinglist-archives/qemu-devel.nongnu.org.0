Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F873502B0
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 16:49:38 +0200 (CEST)
Received: from localhost ([::1]:56390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRcA3-0005oI-7o
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 10:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRc8a-00056m-JN
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 10:48:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRc8X-0000yC-87
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 10:48:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617202078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lswr6O7JBe9JnyN2EYhhIwQNgLnzP3PGU8/wdjVi46g=;
 b=FsMMzEfQXw76hVdmPTJvp/LIqi4a78J2y5MV553zBbypub6tfMEyF2AKYy8w7nW/CpR0If
 aiYH6HMLgfAVGMj6T0qeMHgbfS5qslrdEIlKAoYr61BDOI4EfUIwFkpbED+l2b1E2dQPHz
 rw07/lU/T3RPUGUtHXeFD1B1wW2uL/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-az2WtQREMH6fhDjA6gOOog-1; Wed, 31 Mar 2021 10:47:55 -0400
X-MC-Unique: az2WtQREMH6fhDjA6gOOog-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05BBE84E20A;
 Wed, 31 Mar 2021 14:47:52 +0000 (UTC)
Received: from localhost (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D45E1B5FB;
 Wed, 31 Mar 2021 14:47:45 +0000 (UTC)
Date: Wed, 31 Mar 2021 15:47:45 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [RFC 3/8] virtio: Add API to batch set host notifiers
Message-ID: <YGSLkVHI/JzevSLl@stefanha-x1.localdomain>
References: <20210325150735.1098387-1-groug@kaod.org>
 <20210325150735.1098387-4-groug@kaod.org>
 <YGIKIUIJbkNTfXKC@stefanha-x1.localdomain>
 <20210330121740.73825957@bahia.lan>
 <YGMt3t3WNVxUDMnE@stefanha-x1.localdomain>
 <20210330161732.1ee55325@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210330161732.1ee55325@bahia.lan>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MT/lAgZDBlWzN28c"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--MT/lAgZDBlWzN28c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2021 at 04:17:32PM +0200, Greg Kurz wrote:
> On Tue, 30 Mar 2021 14:55:42 +0100
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> > On Tue, Mar 30, 2021 at 12:17:40PM +0200, Greg Kurz wrote:
> > > On Mon, 29 Mar 2021 18:10:57 +0100
> > > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > > > On Thu, Mar 25, 2021 at 04:07:30PM +0100, Greg Kurz wrote:
> > > > > @@ -315,6 +338,10 @@ static void virtio_bus_unset_and_cleanup_hos=
t_notifiers(VirtioBusState *bus,
> > > > > =20
> > > > >      for (i =3D 0; i < nvqs; i++) {
> > > > >          virtio_bus_set_host_notifier(bus, i + n_offset, false);
> > > > > +    }
> > > > > +    /* Let address_space_update_ioeventfds() run before closing =
ioeventfds */
> > > >=20
> > > > assert(memory_region_transaction_depth =3D=3D 0)?
> > > >=20
> > >=20
> > > Hmm... appart from the fact that memory_region_transaction_depth is
> > > a memory internal thing that shouldn't be exposed here, it seems to
> > > me that memory_region_transaction_depth can be !=3D 0 when, e.g. when
> > > batching is used... or I'm missing something ?
> > >=20
> > > I was actually thinking of adding some asserts for that in the
> > > memory_region_*_eventfd_full() functions introduced by patch 1.
> > >=20
> > >     if (!transaction) {
> > >         memory_region_transaction_begin();
> > >     }
> > >     assert(memory_region_transaction_depth !=3D 0);
> >=20
> > In that case is it safe to call virtio_bus_cleanup_host_notifier()
> > below? I thought it depends on the transaction committing first.
> >=20
>=20
> Yes because the transaction ends...
>=20
> > >=20
> > > > > +    virtio_bus_set_host_notifier_commit(bus);
> ...                here ^^
>=20
> > > > > +    for (i =3D 0; i < nvqs; i++) {
> > > > >          virtio_bus_cleanup_host_notifier(bus, i + n_offset);
> > > > >      }
> > > > >  }

That contradicts what you said above: "it seems to me that
memory_region_transaction_depth can be !=3D 0 when, e.g. when batching is
used".

If memory_region_transaction_depth can be !=3D 0 when this function is
entered then memory_region_transaction_commit() will have no effect:

  void memory_region_transaction_commit(void)
  {
      AddressSpace *as;

      assert(memory_region_transaction_depth);
      assert(qemu_mutex_iothread_locked());

      --memory_region_transaction_depth;
      if (!memory_region_transaction_depth) {
          ^--- we won't take this branch!

So the code after memory_region_transaction_commit() cannot assume that
anything was actually committed.

That's why I asked about adding assert(memory_region_transaction_depth
=3D=3D 0) to guarantee that our commit takes effect immediately so that it'=
s
safe to call virtio_bus_cleanup_host_notifier().

Stefan

--MT/lAgZDBlWzN28c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBki5AACgkQnKSrs4Gr
c8gxaQf9Esnl04dYoNMFKl6abdH5+HV9jlaOHS3nb3m7d0zj1fgOreQXPO5htqdO
kzVxtqz3MdAIXWQB033FVtrLqxLhEvL2+URXcLb7IA2LKNt2yrW+2Lv8dJckFzl2
uqtRF3V4Onls/KdOV9ztZYxmGeozdnbyw1je5aKkEpoeDfYu6nvjgJP7QXNf2E9x
2ED33zv8oyYwczpUcWYvg0Zv5yzc8EaqmrtmAxAO7ikxa+LKEtjLYPbYGZbJjZ2z
JtpdvE2Q9tXbTgfo4xBJmZJzj8AfmiR1gIP4OpXGIkjp50S3/BvdfF5ebHcdYRMY
FTnGn1FXkKUXcsvCErWIyMl4McGzzw==
=KXI+
-----END PGP SIGNATURE-----

--MT/lAgZDBlWzN28c--


