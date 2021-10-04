Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044B7420821
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:19:09 +0200 (CEST)
Received: from localhost ([::1]:36796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXK7o-0006la-0v
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXJqs-0008Mr-Ps
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:01:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXJqj-0004jj-Hn
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:01:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633338086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C6Lbr1HCfW+2P2ZE5nx83Ao7GcU3yDG0Rq1yCySRbss=;
 b=D2eM2FBT6eYXRcioCkHes/W9kav6J1v5l1Atvu8RLqX7ZiJS9gqafRxKECUujaXxuUm2KA
 orktstlxwIAOOw6f6eaHx0ihilJxNSmMnMC+MFuCyzyglLS8xetmpUyMFqU3u2xa7U/Ns6
 nS5r7FLY0LnhcyzUc1qyw8uLOr1OKk0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-zJM3N864N-62Kdyt7qTumQ-1; Mon, 04 Oct 2021 05:01:24 -0400
X-MC-Unique: zJM3N864N-62Kdyt7qTumQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8108C1006AAE;
 Mon,  4 Oct 2021 09:01:23 +0000 (UTC)
Received: from localhost (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C0FB10023AB;
 Mon,  4 Oct 2021 09:01:23 +0000 (UTC)
Date: Mon, 4 Oct 2021 10:01:22 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: Moving QEMU downloads to GitLab Releases?
Message-ID: <YVrC4niegCWq+1kM@stefanha-x1.localdomain>
References: <YVW+ZGmIs+repvj4@stefanha-x1.localdomain>
 <769a612c-9a78-6fc8-0893-43ce2c173957@amsat.org>
MIME-Version: 1.0
In-Reply-To: <769a612c-9a78-6fc8-0893-43ce2c173957@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="h8B3losz3p+1u8V6"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
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
Cc: michael.roth@amd.com, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--h8B3losz3p+1u8V6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 01, 2021 at 09:39:13AM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 9/30/21 15:40, Stefan Hajnoczi wrote:
> > Hi Mike,
> > QEMU downloads are currently hosted on qemu.org's Apache web server.
> > Paolo and I were discussing ways to reduce qemu.org network traffic to
> > save money and eventually turn off the qemu.org server since there is n=
o
> > full-time sysadmin for it. I'd like to discuss moving QEMU downloads to
> > GitLab Releases.
> >=20
> > Since you create and sign QEMU releases I wanted to see what you think
> > about the idea. GitLab Releases has two ways of creating release assets=
:
> > archiving a git tree and attaching arbitrary binaries. The
> > scripts/make-release script fetches submodules and generates version
> > files, so it may be necessary to treat QEMU tarballs as arbitrary
> > binaries instead of simply letting GitLab create git tree archives:
> > https://docs.gitlab.com/ee/user/project/releases/#use-a-generic-package=
-for-attaching-binaries
> >=20
> > Releases can be uploaded via the GitLab API from your local machine or
> > deployed as a GitLab CI job. Uploading from your local machine would be
> > the closest to the current workflow.
> >=20
> > In the long term we could have a CI job that automatically publishes
> > QEMU releases when a new qemu.git tag is pushed. The release process
> > could be fully automated so that manual steps are no longer necessary,
> > although we'd have to trust GitLab with QEMU GPG signing keys.
>=20
> Before having to trust a SaaS for GPG signing, could this work?
>=20
> - make-release script should produce a reproducible tarball in a
>   gitlab job, along with a file containing the tarball hash.
>=20
> - Mike (or whoever is responsible of releases) keeps doing a local
>   manual build
>=20
> - Mike checks the local hash matches the Gitlab artifact hash
>=20
> - Mike signs its local build/hash and uses the GitLab API to upload
>   that .sig to job artifacts
>=20
> - we can have an extra manual job that checks the tarball.sig
>   (hash and pubkey) and on success deploys updating the download
>   page, adding the new release

I wonder what Mike sees as the way forward.

Stefan

--h8B3losz3p+1u8V6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFawuEACgkQnKSrs4Gr
c8jg8AgAjqz9YsPmw53mnwYos9FdNFVCwgOB3IQP4qJ1iyanUKKAjYNgvYiQPXTs
af0q7z36gemk8l1LOGrx5rVRMQY/k9zZeQ7mJ6WMnn+05lBRbxQ56h+fMyxe2x10
dX4oTv3nvFoNtxje5HHRPJSWYpE/t4zNsb9ebFI0d4IYUGEI7B3fwCYsxWT5Biso
mvkvYBjIzQAB/6hxaPwhWUy+9SCf2hpBlR9FaSIqyBEsjMTMzr4ZoftGBz023BVc
wfvjo7OjWQDernZ5UQf/3VZ3bl9W2/Jizo56jpIjD+JBG+/JPdvMQ5LQ27Wlx1Xs
xpwzy2TkUWrTFTk+tRq+rmcL5GGc+Q==
=MjVc
-----END PGP SIGNATURE-----

--h8B3losz3p+1u8V6--


