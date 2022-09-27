Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0853B5ECE32
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 22:16:09 +0200 (CEST)
Received: from localhost ([::1]:51028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odGzv-00087S-En
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 16:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1odGyM-0006kb-Nf
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 16:14:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1odGyJ-0002Q3-GD
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 16:14:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664309665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hvsxVJ/8a/UELca/nXca8CYkUPKmv8hjpVdFw/6yIRs=;
 b=bNQixmdGPdO8D6odEPe/VsJ+f0QQCwYDZRyBl0rvn4rjLiz2mUEKe1G+SzXAQUYq9cJuTC
 /1jkWJ54fPNH1kezUjH5pp1drnueOzB4AgGlKJOHFyAtPfgFxsbqI9BtGFSfL8/dDRk/rr
 MSG3jPCZpLJc3iS4depkttbTB4p0KKk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-iifNloXPP2mW6IihkSwaLw-1; Tue, 27 Sep 2022 16:14:23 -0400
X-MC-Unique: iifNloXPP2mW6IihkSwaLw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D82C101CC6E;
 Tue, 27 Sep 2022 20:14:23 +0000 (UTC)
Received: from localhost (unknown [10.39.192.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDE9B140EBF5;
 Tue, 27 Sep 2022 20:14:22 +0000 (UTC)
Date: Tue, 27 Sep 2022 16:14:20 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Colin Walters <walters@verbum.org>
Cc: German Maglione <gmaglione@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Virtio-fs] virtiofsd: Any reason why there's not an "openat2"
 sandbox mode?
Message-ID: <YzNZnPiUqySu6sGh@fedora>
References: <4362261a-c762-4666-84e2-03c9daa6c4d9@www.fastmail.com>
 <YzMmu3xfOtQwuFUx@redhat.com> <YzMrYAJQeSP2hDSs@redhat.com>
 <CAJh=p+5rQDBJJC8VNGL10KYgDeq-Hg5WK7avONCti03eJGH+ow@mail.gmail.com>
 <798fe353-9537-44fe-a76a-819e8c93abb5@www.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fE1aOEgntkr1nLH8"
Content-Disposition: inline
In-Reply-To: <798fe353-9537-44fe-a76a-819e8c93abb5@www.fastmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--fE1aOEgntkr1nLH8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 27, 2022 at 01:51:41PM -0400, Colin Walters wrote:
>=20
>=20
> On Tue, Sep 27, 2022, at 1:27 PM, German Maglione wrote:
> >
> >> > Now all the development has moved to rust virtiofsd.
>=20
> Oh, awesome!!  The code there looks great.
>=20
> > I could work on this for the next major version and see if anything bre=
aks.
> > But I prefer to add this as a compilation feature, instead of a command=
 line
> > option that we will then have to maintain for a while.
>=20
> Hmm, what would be the issue with having the code there by default?  I th=
ink rather than any new command line option, we automatically use `openat2+=
RESOLVE_IN_ROOT` if the process is run as a nonzero uid.
>=20
> > Also, I don't see it as a sandbox feature, as Stefan mentioned, a compr=
omised
> > process can call openat2() without RESOLVE_IN_ROOT.=20
>=20
> I'm a bit skeptical honestly about how secure the existing namespace code=
 is against a compromised virtiofsd process.  The primary worry is guest fi=
lesystem traversals, right?  openat2+RESOLVE_IN_ROOT addresses that.  Plus =
being in Rust makes this dramatically safer.
>=20
> > I did some test with
> > Landlock to lock virtiofsd inside the shared directory, but IIRC it req=
uires a
> > kernel 5.13
>=20
> But yes, landlock and other things make sense, I just don't see these thi=
ngs as strongly linked.  IOW we shouldn't in my opinion block unprivileged =
virtiofsd on more sandboxing than openat2 already gives us.

I think openat2(RESOLVE_IN_ROOT) support should be added unless there is
another unprivileged mechanism that is stronger.

The security implications need to be covered in the user documentation
so people can decide whether using this mode is appropriate.

We should continue to explain the difference between a voluntary
mechanism like openat2(RESOLVE_IN_ROOT) and a mandatory mechanism like
mount namespaces with pivot_root(2). Rust programs are not immune to
arbitrary code execution, but it's less likely than with a C program.

Stefan

--fE1aOEgntkr1nLH8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMzWZwACgkQnKSrs4Gr
c8hsNggAq2b4EiLGdaw/6VKEnOUsLflmhehlNssdGVaRQHdceOt4vB/4XqF39eb6
ER462uf7KqydVjM8/DVxK5VQY9/p64W1CsSQkx1C4+S1QCwx3R/pbrT3k9UfTjKP
yFe0+pRDjx9wTwLm/rXPwv8vtkQd0ikKYTrLXgHOlX2gEtj55kFlfAgJIFy3vk8n
P8P1QikfAhZYOXhuRJBJP7MofCJAJnpkQfn4CnFFpCpogyQwyWWgiRDfl7QfCDdV
/VwDvBFD7aJ2fEBz5yGhe281D0LtZeGaMeKDeg/visXZu8FZbviLdHy7s7c70Wex
VvJQDuGJ0NOGbxbwlu4g1gipRZaAXA==
=uTzR
-----END PGP SIGNATURE-----

--fE1aOEgntkr1nLH8--


