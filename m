Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E572034E9B0
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 15:57:31 +0200 (CEST)
Received: from localhost ([::1]:35284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lREs6-0005Ho-KG
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 09:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lREqi-0004CL-RD
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:56:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lREqb-000551-0r
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:56:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617112556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hbNKz6PA2wdNnA/7qpFfTv6CIK4/xmNox1zLskIz7A0=;
 b=O2mxy0QQvnhgx8XTJSKnYXGOMfZ3V+Ozcf7mw5jbPB8M3Dk5JIRhZ/Wmz/GRq8pzSKKr0W
 BoJX+HlxJ5+nve93Ckfmy6qNpvExIqgD2LRKlQZsKOABvp7mB3Yt2UcVLGVCisuAWe1SIG
 f42INprLwvBtpTU2aFyDdpy9w5AQ+jo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-xudlXGMhOyuBCVm9kFDWig-1; Tue, 30 Mar 2021 09:55:51 -0400
X-MC-Unique: xudlXGMhOyuBCVm9kFDWig-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA31281650;
 Tue, 30 Mar 2021 13:55:49 +0000 (UTC)
Received: from localhost (ovpn-115-22.ams2.redhat.com [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF9F21002388;
 Tue, 30 Mar 2021 13:55:43 +0000 (UTC)
Date: Tue, 30 Mar 2021 14:55:42 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [RFC 3/8] virtio: Add API to batch set host notifiers
Message-ID: <YGMt3t3WNVxUDMnE@stefanha-x1.localdomain>
References: <20210325150735.1098387-1-groug@kaod.org>
 <20210325150735.1098387-4-groug@kaod.org>
 <YGIKIUIJbkNTfXKC@stefanha-x1.localdomain>
 <20210330121740.73825957@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210330121740.73825957@bahia.lan>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rm5SJ9NIrrgpf0ki"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--rm5SJ9NIrrgpf0ki
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2021 at 12:17:40PM +0200, Greg Kurz wrote:
> On Mon, 29 Mar 2021 18:10:57 +0100
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > On Thu, Mar 25, 2021 at 04:07:30PM +0100, Greg Kurz wrote:
> > > @@ -315,6 +338,10 @@ static void virtio_bus_unset_and_cleanup_host_no=
tifiers(VirtioBusState *bus,
> > > =20
> > >      for (i =3D 0; i < nvqs; i++) {
> > >          virtio_bus_set_host_notifier(bus, i + n_offset, false);
> > > +    }
> > > +    /* Let address_space_update_ioeventfds() run before closing ioev=
entfds */
> >=20
> > assert(memory_region_transaction_depth =3D=3D 0)?
> >=20
>=20
> Hmm... appart from the fact that memory_region_transaction_depth is
> a memory internal thing that shouldn't be exposed here, it seems to
> me that memory_region_transaction_depth can be !=3D 0 when, e.g. when
> batching is used... or I'm missing something ?
>=20
> I was actually thinking of adding some asserts for that in the
> memory_region_*_eventfd_full() functions introduced by patch 1.
>=20
>     if (!transaction) {
>         memory_region_transaction_begin();
>     }
>     assert(memory_region_transaction_depth !=3D 0);

In that case is it safe to call virtio_bus_cleanup_host_notifier()
below? I thought it depends on the transaction committing first.

>=20
> > > +    virtio_bus_set_host_notifier_commit(bus);
> > > +    for (i =3D 0; i < nvqs; i++) {
> > >          virtio_bus_cleanup_host_notifier(bus, i + n_offset);
> > >      }
> > >  }

--rm5SJ9NIrrgpf0ki
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBjLd4ACgkQnKSrs4Gr
c8iOlgf/SCMeWv/SGVMHh/0b8dr5HlZlB7yjrqpNJE5cO/wGwY45xXRtJkN6Jhs+
Y/xX8i4KGY2qEAmoBSrVvn542SlUy2F2GIMuAzU2rZe+ipZF/whWM/YOwPTZt2vA
iJLrfYkx5rD5gTAsBINCcue88dvnmow1eADVynNPW1vwAT5hdHp1EaBRjBjqLQ2T
dLYfzKIoxJkokl88/RCjfQ/JIXJuihBYHYX1MwM4L/sHyoNr4u8O4H+hx1L+mDZk
gcOY/GJx+72KIULVi83PPx6pFjtNA4JfhXwn4vN9o+7ti+a/QmMF0lQjNBMEEys4
n4+lC+IluG36Ngu8skMft1zNA1yZsg==
=MPeP
-----END PGP SIGNATURE-----

--rm5SJ9NIrrgpf0ki--


