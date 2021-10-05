Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BEF4227E8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 15:32:27 +0200 (CEST)
Received: from localhost ([::1]:42226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXkYT-00084s-PN
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 09:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXkVW-00067H-Uc
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 09:29:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXkVU-0005HV-UI
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 09:29:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633440560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qje3aoYeAaF6mD6fH4MLmfnJht75Q3j/7VxsVOO6n3o=;
 b=M2bgD/c4QvfaVQckcY2pJyoObbStLPSO2keul7EqFdsGilEYGfDI+x3JfpG0XNmYHsW00v
 /1Xky+tT5f2mBHhcdht0AdFrbErrbPEEUiNQ77EXZLq6Y4+SEc49AAY7Wry8jG+3T7zgDp
 USGqp+NvRy+jyWFX+hr8XAuoVxmDP4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-nUlnBZd3NketCeP9ktCN4w-1; Tue, 05 Oct 2021 09:29:17 -0400
X-MC-Unique: nUlnBZd3NketCeP9ktCN4w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 954D71023F4D;
 Tue,  5 Oct 2021 13:29:16 +0000 (UTC)
Received: from localhost (unknown [10.39.194.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C288B60C17;
 Tue,  5 Oct 2021 13:29:01 +0000 (UTC)
Date: Tue, 5 Oct 2021 14:29:00 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Michael Roth <michael.roth@amd.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: Moving QEMU downloads to GitLab Releases?
Message-ID: <YVxTHAMCVncGvbFi@stefanha-x1.localdomain>
References: <YVW+ZGmIs+repvj4@stefanha-x1.localdomain>
 <769a612c-9a78-6fc8-0893-43ce2c173957@amsat.org>
 <YVrC4niegCWq+1kM@stefanha-x1.localdomain>
 <163337608907.347510.4401699281486806089@amd.com>
MIME-Version: 1.0
In-Reply-To: <163337608907.347510.4401699281486806089@amd.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="isCe0rTfQnq8C79K"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--isCe0rTfQnq8C79K
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 04, 2021 at 02:34:49PM -0500, Michael Roth wrote:
> Quoting Stefan Hajnoczi (2021-10-04 04:01:22)
> > On Fri, Oct 01, 2021 at 09:39:13AM +0200, Philippe Mathieu-Daud=E9 wrot=
e:
> > > On 9/30/21 15:40, Stefan Hajnoczi wrote:
> > > > Hi Mike,
> > > > QEMU downloads are currently hosted on qemu.org's Apache web server=
.
> > > > Paolo and I were discussing ways to reduce qemu.org network traffic=
 to
> > > > save money and eventually turn off the qemu.org server since there =
is no
> > > > full-time sysadmin for it. I'd like to discuss moving QEMU download=
s to
> > > > GitLab Releases.
> > > >=20
> > > > Since you create and sign QEMU releases I wanted to see what you th=
ink
> > > > about the idea. GitLab Releases has two ways of creating release as=
sets:
> > > > archiving a git tree and attaching arbitrary binaries. The
> > > > scripts/make-release script fetches submodules and generates versio=
n
> > > > files, so it may be necessary to treat QEMU tarballs as arbitrary
> > > > binaries instead of simply letting GitLab create git tree archives:
> > > > https://docs.gitlab.com/ee/user/project/releases/#use-a-generic-pac=
kage-for-attaching-binaries
> > > >=20
> > > > Releases can be uploaded via the GitLab API from your local machine=
 or
> > > > deployed as a GitLab CI job. Uploading from your local machine woul=
d be
> > > > the closest to the current workflow.
> > > >=20
> > > > In the long term we could have a CI job that automatically publishe=
s
> > > > QEMU releases when a new qemu.git tag is pushed. The release proces=
s
> > > > could be fully automated so that manual steps are no longer necessa=
ry,
> > > > although we'd have to trust GitLab with QEMU GPG signing keys.
> > >=20
> > > Before having to trust a SaaS for GPG signing, could this work?
> > >=20
> > > - make-release script should produce a reproducible tarball in a
> > >   gitlab job, along with a file containing the tarball hash.
> > >=20
> > > - Mike (or whoever is responsible of releases) keeps doing a local
> > >   manual build
> > >=20
> > > - Mike checks the local hash matches the Gitlab artifact hash
> > >=20
> > > - Mike signs its local build/hash and uses the GitLab API to upload
> > >   that .sig to job artifacts
> > >=20
> > > - we can have an extra manual job that checks the tarball.sig
> > >   (hash and pubkey) and on success deploys updating the download
> > >   page, adding the new release
> >=20
> > I wonder what Mike sees as the way forward.
>=20
> Hi Stefan, Philippe,
>=20
> In general I like the idea, since we could also have the CI do the full
> gamut of testing against the binaries built from said tarball, so the
> Release Person can just regenerate the tarball and provide a sig to
> attest that it came from the proper sources. Currently I do make check
> and make check-acceptance and a few other sanity checks, which I guess
> would no longer be needed then.
>=20
> But I think the more immediate issue is where/how to host those
> tarballs. Even moving all the ROMs/capstone out of the source tree still
> results in an xz-compressed tarball size ~25MB, which is well above the
> 10MB limit mentioned earlier. We could break it out into target-specific
> tarballs, maybe further into softmmu/user variants, but that sounds
> painful for both users and maintainers who need to deal with the
> resulting source tree differences.
>=20
> What I'm wondering is whether we could just use the archive files
> generated by gitlab when we tag our releases? E.g.:
>=20
>   https://gitlab.com/qemu-project/qemu/-/archive/v6.1.0/qemu-v6.1.0.tar.b=
z2
>=20
> If we paired that with an in-tree script similar to make-release for
> users to download individual ROM sources/subprojects used for a particula=
r
> tagged release, would that be sufficient for GPL compliance and verifying
> what sources the binaries were built from? Are there any other
> considerations WRT ROMs/etc.?
>=20
> With something like that in place, Release Person could just do a git
> checkout, verify the Maintainer's sig/tag (in case we don't necessarily
> trust the git host), generate the tarball, verify the hash matches what
> gitlab published (or verify/diff individual files if the bz/gz hashes
> require a specific environment), then sign the gitlab tarball and add
> the sig to qemu.org download page along with a link the gitlab-generated
> tarball.
>=20
> We could also publish the Maintainer and Release Person public keys on
> qemu.org download page so users can verify this as well using the same
> process.
>=20
> Users that want the additional sources can then do it locally via
> above-mentioned script, which would be part of the now-signed tarball
> and so could be 'trusted' assuming the individual project hosts weren't
> compromised (which is still an assumption that's needed with the current
> process anyway).
>=20
> I guess the main question is who is using the ROM/BIOS sources in the
> tarballs, and would this 2-step process work for those users? If there
> are distros relying on them then maybe there are some more logistics to
> consider since the make-release downloads are both time-consuming and
> prone to network errors/stalls since it relies on the availability of a
> good number of different hosts.

Great, maybe Gerd can comment on splitting out firmware.

QEMU mirrors firmware sources on GitLab too. We're able to provide the
same level of download availability on our mirror firmware repos as for
the main qemu.git repo.

I think qemu.git should include information about where to get the
firmware sources in order to comply with the GPL. I'm not sure if the
git submodules metadata counts from a GPL perspective, but that seems
enough since it has both a mirror repo URL and the exact hash used to
build the binary blob.

Stefan

--isCe0rTfQnq8C79K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFcUxwACgkQnKSrs4Gr
c8gjAwgAj5VXoMgeb6BtA8pViNAo0SYVK4i8nf2T3qeJaNrm9Ww5YW96nbeQOjCm
tF9U1jBbe4fVG2Eolmk4VkVT8FgtZihliKaX/U2+4pVVP13SZ972gjQyDmkeGfyh
YXc/jlZhQKLTf4mI3cMb9IdF6Xa5bPBooNuff0nowHhXcR7jsPIOwtMvb0+Kxlhl
uA+ah9qWzYXUedkoU5setERTkga/4TA9NN6RnDxTPbqqnMB12SnNIlz5w7QdAa9f
jCLAr/QhTXL2J4qrOrQm4ZANWiF7raao7JOC9KOHHI9dcurA+z4pj7uSXyyXoxsv
UiooEvBcYz8Y1RL2+fe4bNqA+T8YbQ==
=556k
-----END PGP SIGNATURE-----

--isCe0rTfQnq8C79K--


