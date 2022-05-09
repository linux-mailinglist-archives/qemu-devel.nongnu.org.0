Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C5951FB5D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 13:34:38 +0200 (CEST)
Received: from localhost ([::1]:47728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no1ev-0006CH-8Z
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 07:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1no109-0007XW-0b
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:52:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1no106-0006Cb-7V
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:52:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652093544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pt7vGFPu7Ub2DwkR0aVHaNn5OEuRFa46LKmOr+dPMXo=;
 b=cn/E0skxJ6HLboUITMtrt52gaCVXPO6oUe1JexYhhw7o15kGr+1fr7qcVKTiQ6edFI0Noy
 IHlUFA+2utWAQbpimwqKnizNdRBdubRfi/Jj8adeWR2+aBWjgPT5yJjeZIuF1iYFzQrR56
 1nAOhtcjEHMGqzW3xV/X67iNTmd8qRs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-hCH57zddPjGFZoEUzXGYlA-1; Mon, 09 May 2022 06:52:23 -0400
X-MC-Unique: hCH57zddPjGFZoEUzXGYlA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA5641C05B17
 for <qemu-devel@nongnu.org>; Mon,  9 May 2022 10:52:22 +0000 (UTC)
Received: from localhost (unknown [10.40.195.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77FF742D4F8;
 Mon,  9 May 2022 10:52:21 +0000 (UTC)
Date: Mon, 9 May 2022 12:52:20 +0200
From: Victor Toso <victortoso@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
Message-ID: <20220509105220.nhiduk3u4guzkmyd@tapioca>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <87bkwonlkb.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2twuz56onwjz4shw"
Content-Disposition: inline
In-Reply-To: <87bkwonlkb.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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


--2twuz56onwjz4shw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the quick review Markus. Sorry for taking quite a bit
of time to get back to you.

On Tue, Apr 26, 2022 at 01:14:28PM +0200, Markus Armbruster wrote:
> Victor Toso <victortoso@redhat.com> writes:
>=20
> > Hi,
> >
> > Happy 1st April. Not a joke :) /* ugh, took me too long to send */
> >
> > This series is about adding a generator in scripts/qapi to produce
> > Go data structures that can be used to communicate with QEMU over
> > QMP.
> >
> >
> > * Why Go?
> >
> > There are quite a few Go projects that interact with QEMU over QMP
> > and they endup using a mix of different libraries with their own
> > code.
> >
> >
> > ** Which projects?
> >
> > The ones I've found so far:
> >
> > - podman machine
> >   https://github.com/containers/podman/tree/main/pkg/machine/qemu
> >
> > - kata-containers (govmm)
> >   https://github.com/kata-containers/kata-containers/tree/main/src/runt=
ime/pkg/govmm
> >
> > - lxd
> >   https://github.com/lxc/lxd/tree/master/lxd/instance/drivers
> >
> > - kubevirt (plain json strings)
> >   https://github.com/kubevirt/kubevirt
> >
> > (let me know if you know others)
> >
> >
> > * But Why?
> >
> > I'm particularly interested in 3 out of 4 of the projects above and
> > only Kubevirt uses libvirt to handle QEMU. That means that every
> > QEMU releases where a QMP command, event or other data struct is
> > added, removed or changed, those projects need to check what changed
> > in QEMU and then address those changes in their projects, if needed.
> >
> > The idea behind generating Go data structures is that we can keep a
> > Go module which can have releases that follow QEMU releases.
>=20
> We need to look at "following the QEMU releases" a bit more
> closely.
>=20
> Merging your patches gives us the capability to generate a Go
> interface to HEAD's version of QMP.

Right, just to put it up here, it should be expected that the
qapi-go project is to have releases that match QEMU's release.
=20
> The obvious way for an out-of-tree Go program to use this
> generated Go interface is to build with a specific version of
> it.  It can then talk QMP to any compatible QEMU version.
>=20
> Compatibility with older QEMUs is not assured: stuff added
> since is present on the Go QMP client end, but not on the QEMU
> QMP server end.
>=20
> Compatibility with newer QEMUs is subject to our deprecation
> policy:
>=20
>     In general features are intended to be supported
>     indefinitely once introduced into QEMU.  In the event that
>     a feature needs to be removed, it will be listed in this
>     section.  The feature will remain functional for the
>     release in which it was deprecated and one further release.
>     After these two releases, the feature is liable to be
>     removed.
>=20
> So, if you stay away from deprecated stuff, you're good for two
> more releases at least.
>=20
> Does this work for the projects you have in mind?

It depends on how the project will be using qapi-go, so I can't
say for them all.

There are projects that will be targeting specific QEMU version
(e.g: Kubevirt, Kata containers) and for those, I think they
don't mind only bumping qapi-go when they plan to change the
target QEMU version or perhaps to keep separated binary versions
for a limited amount of time (just my guess).

Some other projects like Podman, will likely be talking with the
running version of QEMU they have in that host. The possibilities
are quite broad here.

> Aside: graceful degradation in case of incompatibility seems
> desirable.

I agree. I haven't thought much on how to handle those scenarios
yet and suggestions are more than welcomed.

I know that, those projects are already hardcoding commands and
expected return types by hand. My first goal is to provide well
defined types, QAPI/QMP compliant, with easy to reach
documentation as provided by QAPI docs.

I expect that, step by step, we can improve things all around but
I don't expect it to be done all at once.

> > The project that uses this Go module, only need to bump the
> > module version and it shall receive all the changes in their
> > own vendored code base.
>=20
> Ideally, incompatible changes that affect the Go program show
> up as compile errors.  Do they?

It depends. A field/type that they were using but is removed, for
sure a compile-time error.

What about a new mandatory field? If you run the unit tests in
qapi-go, there will be failures but it wouldn't be compile time
error. If user doesn't define a mandatory field in a Go struct,
the default value is used for the over-the-wire message.

Perhaps some tooling can be developed to help users check that
something they are using has changed. I'll look into it.

> > * Status
> >
> > There are a few rough edges to work on but this is usable. The major
> > thing I forgot to add is handling Error from Commands. It'll be the
> > first thing I'll work on next week.
> >
> > If you want to start using this Today you can fetch it in at
> >
> >     https://gitlab.com/victortoso/qapi-go/
> >
> > There are quite a few tests that I took from the examples in the
> > qapi schema. Coverage using go's cover tool is giving `28.6% of
> > statements`
> >
> > I've uploaded the a static generated godoc output of the above Go
> > module here:
> >
> >     https://fedorapeople.org/~victortoso/qapi-go/rfc/victortoso.com/qap=
i-go/pkg/qapi/
> >
> >
> > * License
> >
> > While the generator (golang.py in this series) is GPL v2, the
>=20
> I'd make it v2+, just to express my displeasure with the
> decision to make the initial QAPI generator v2 only for no good
> reason at all.
>=20
> > generated code needs to be compatible with other Golang projects,
> > such as the ones mentioned above. My intention is to keep a Go
> > module with a MIT license.
>=20
> Meh.  Can't be helped, I guess.

:)

> > * Disclaimer to reviewers
> >
> > This is my first serious python project so there'll be lots of
> > suggetions that I'll be happy to take and learn from.
> >
> >
> > Thanks for taking a look, let me know if you have questions, ideas
> > or suggestions.
> >
> > Cheers,
> > Victor

Thanks again,
Victor

--2twuz56onwjz4shw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmJ48mQACgkQl9kSPeN6
SE87Zg/+JpcVvvnAyVzaJnDcpOHbDkIhzHOStRhOcqbKzKMFJ7UVc762S/gs2kAu
4I5Z4olHi254Dik3KGsOpEnoZ0psAZsHwpR/ay2tWuNN4XUL4DIpNLRez7NKY7uN
ZEWalUce0N3l8Lh9l5AMNHopDzZV/iuUD1tsm4fADvq0MRvTwQYOpc2s3WGvYiQ+
Pjb9H8b+LRa5BPIZLcuq6BrGOGekczNNdSr9uNBtLfD9BEplb5QZYPczzoV8ylA9
lZ/7wI/I+ANjryzhivSrBXlLEqH7I5gIV3ddUvO1z6CVVCWYB85rNhrv8IAP5+LN
WDpKRqA8rdRQ8M/BCNPXfItWizUu7kHfcIsGTnqCVm8n1oblAd6/5yYHExLNDAkV
c04v+J6wA7Xfo1b0t7HADvQfkO+PWMpGgCVqNFt2MnqRsRRZWduRIziv5QW0mAod
pDSaR71pyvcJgGZyPcqFTK3LWiZeI1Zco9S1XbX7puTcAqDhl3irWgj1HTn0gqLf
NxORqvrgUZboXP+hE7aJijODwD/8Lj63Zzo3UPGIQ+jRoA3HGRO2H/5Kxjlz/9t6
Rr7Lmja60IOi3yraMH4jbm4gJ25UpVak4bGe5wm3Rd3uETWPNAjUeDDzXyoQCQWq
AWp73Rzg20cLTDyoz4M8Qe/rceoZ6KnqOh01Zp5AjMiriJ9CWIw=
=0+Se
-----END PGP SIGNATURE-----

--2twuz56onwjz4shw--


