Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 673D34DB013
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 13:49:33 +0100 (CET)
Received: from localhost ([::1]:57228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUT5m-0002dH-Mm
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 08:49:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nUSxT-000125-Je
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:40:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nUSxP-00040K-Lu
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:40:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647434450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uvlIsYwCWLyHMkgfcV2NVYsDH0H/EFWO2lVcpMRRFO8=;
 b=AULLklYpGDT9zZDbO8oXCGN3RErB3RZKReNOi0LDp7j7IHEAzcq4pfqbyp5e4cRvIi5GL2
 17739GylET+lChQgI8LlaDCv/rqr0OYdUeZ36Wt7Fyp+SOxrvQHybNqm5UE3MQ6F/6k4v3
 hZcqA+IomwEEN7eGJbLDxvD3Xwu0t6Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-WwE7LJ39OzuVAVp_3n3FsA-1; Wed, 16 Mar 2022 08:40:46 -0400
X-MC-Unique: WwE7LJ39OzuVAVp_3n3FsA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2953E811E7A;
 Wed, 16 Mar 2022 12:40:46 +0000 (UTC)
Received: from localhost (unknown [10.39.193.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5B82215688A;
 Wed, 16 Mar 2022 12:40:45 +0000 (UTC)
Date: Wed, 16 Mar 2022 12:40:45 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
Message-ID: <YjHazSWJEM3lU8j6@stefanha-x1.localdomain>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <Yi9MBGoc3WtOLx82@stefanha-x1.localdomain>
 <4528e387-8016-0774-9c8b-532a75566d9d@redhat.com>
 <YjCdKfbQsgfsw76N@stefanha-x1.localdomain>
 <YjCnss5W5MhZK1Hw@redhat.com> <YjC2+F2SkNEDOXTe@redhat.com>
 <7b634dc9-cca5-c9d0-e392-21a594851b0c@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fxJCO6oHESiRPBx2"
Content-Disposition: inline
In-Reply-To: <7b634dc9-cca5-c9d0-e392-21a594851b0c@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, hreitz@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--fxJCO6oHESiRPBx2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 16, 2022 at 12:08:33AM +0100, Paolo Bonzini wrote:
> On 3/15/22 16:55, Daniel P. Berrang=E9 wrote:
> > Expecting maintainers to enforce a subset during code review feels
> > like it would be a tedious burden, that will inevitably let stuff
> > through because humans are fallible, especially when presented
> > with uninspiring, tedious, repetitive tasks.
> >=20
> > Restricting ourselves to a subset is only viable if we have
> > an automated tool that can reliably enforce that subset. I'm not
> > sure that any such tool exists, and not convinced our time is
> > best served by trying to write & maintainer one either.
>=20
> We don't need to have a policy on which features are used.  We need to ha=
ve
> goals for what to use C++ for.  I won't go into further details here,
> because I had already posted "When and how to use C++"[1] about an hour
> before your reply.
>=20
> > IOW, I fear one we allow C++ in any level, it won't be practical
> > to constrain it as much we desire. I fear us turning QEMU into
> > even more of a monster like other big C++ apps I see which take
> > all hours to compile while using all available RAM in Fedora RPM
> > build hosts.
>=20
> Sorry but this is FUD.  There's plenty of C++ apps and libraries that do =
not
> "take hours to compile while using all available RAM".  You're probably
> thinking of the Chromium/Firefox/Libreoffice triplet but those are an ord=
er
> of magnitude larger than QEMU.  And in fact, QEMU is *already* a monster
> that takes longer to compile than most other packages, no matter the
> language they're written in.
>=20
> Most of KDE and everything that uses Qt is written in C++, and so is
> Inkscape in GTK+ land.  LLVM and Clang are written in C++.  Hotspot and V8
> are written in C++.  Kodi, MAME and DolphinEmu are written in C++. GCC and
> GDB have migrated to C++ and their compile times have not exploded.
>=20
> > My other question is whether adoption of C++ would complicate any
> > desire to make more use of Rust in QEMU ? I know Rust came out of
> > work by the Mozilla Firefox crew, and Firefox was C++, but I don't
> > have any idea how they integrated use of Rust with Firefox, so
> > whether there are any gotcha's for us or not ?
>=20
> Any Rust integration would go through C APIs.  Using Rust in the block la=
yer
> would certainly be much harder, though perhaps not impossible, if the blo=
ck
> layer uses C++ coroutines.  Rust supports something similar, but
> two-direction interoperability would be hard.

I haven't looked at this in depth but there is a solution for Rust-C++
interop: https://cxx.rs/

Stefan

--fxJCO6oHESiRPBx2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIx2swACgkQnKSrs4Gr
c8gYjQf/TD1PZQO9l/ybMAimzEMewml0C3IulONXAqPF9UTrJXOKXqqdRgz3nWtX
XcxkdAbuu7CjXmdNp16d25UhuRoYoPB5xShotxNGmShTdTdXAd43vtML085scjXJ
+Xd11xwI8fa3Zr/9TolZu9cqSsH8l/X6CzAWpNMBd4fGZ76sdWgZykoNFMRn3jqk
3AaY+Ktzeepc/5TivppjEGWq3QCq2SFgwMOB6add4Z4rXrD5m3voRIFDMdKU/5SO
48By3Hhrqc0/i1GD7DA8oORxeKkURlAm4tCfE+8m/rJyAvqyVM2YGbGhD8nH1ZWN
GPOHctAJi1Vt5b6SCrQK2JJUk3G77Q==
=OGvA
-----END PGP SIGNATURE-----

--fxJCO6oHESiRPBx2--


