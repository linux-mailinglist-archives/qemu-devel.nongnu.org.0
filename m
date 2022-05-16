Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 178205288FB
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:35:54 +0200 (CEST)
Received: from localhost ([::1]:52152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqclF-0001xn-5I
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nqcaz-0001ay-0x
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:25:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nqcaw-0005v2-Ep
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652714713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H3gPfvZCvKuH4iLkSTd04R1dmhkyCZWw6Xyp6j5YG38=;
 b=G6nS2CjKr0EMJEdtErtRoJ73KHc4DcW56+fes4QDke52F3SUlp/VuP3AWVVRbwDBW28g05
 phmNp1ziKMv5Ce3/WuToOWgHDgUjXmvNZDTdVUhyDYCrvqNyLSHHczTAMDgqHvRF/vLiHj
 VAk2hSht/IYTXxNJjXrGkO7us9ttVNk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-N1Fpws9xN5uX3sLJPfq8zw-1; Mon, 16 May 2022 11:25:09 -0400
X-MC-Unique: N1Fpws9xN5uX3sLJPfq8zw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74377800B21;
 Mon, 16 May 2022 15:25:08 +0000 (UTC)
Received: from localhost (unknown [10.39.192.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C0D5C27E80;
 Mon, 16 May 2022 15:25:07 +0000 (UTC)
Date: Mon, 16 May 2022 16:25:05 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Getting rid of the last bits of QEMU's 'ad-hoc CI' for merges
Message-ID: <YoJs0SmcohJxlh9y@stefanha-x1.localdomain>
References: <CAFEAcA_SSJ9BBryV0iuXi1G30e6HoMeuNbSpKDh4_+y2oxTLJw@mail.gmail.com>
 <5132a3d1-de12-a306-c64e-56cfd2c40a42@redhat.com>
 <CAFEAcA_5ouMzMx=1da0VFHXWvMsOoYJ_zZCA6Q_LjwNNO4WwOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/4DE+qUXifOR32E9"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_5ouMzMx=1da0VFHXWvMsOoYJ_zZCA6Q_LjwNNO4WwOQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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


--/4DE+qUXifOR32E9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2022 at 03:35:25PM +0100, Peter Maydell wrote:
> On Mon, 16 May 2022 at 15:30, Thomas Huth <thuth@redhat.com> wrote:
> >
> > On 16/05/2022 14.43, Peter Maydell wrote:
> > > For the BSDs, the ad-hoc CI is just running the tests/vm
> > > "make vm-build-netbsd" etc. Is there some way we can get
> > > coverage of this into the gitlab CI setup? (I think we
> > > have FreeBSD via Cirrus CI, so I have not listed that one.)
> >
> > A simple setup is already there, running NetBSD and OpenBSD via KVM on =
the
> > Cirrus-CI, see e.g.:
> >
> >   https://gitlab.com/thuth/qemu/-/jobs/2411943817#L1973
> >
> > Caveats:
> > - The jobs are currently marked as "manual only" since the double
> >    indirect setup (via cirrus-run and KVM) is not that reliable.
> >    Also we can not run that many cirrus-ci jobs in parallel, so
> >    we likely don't want to enable these by default.
> > - Compilation is not very fast, the jobs often run longer than
> >    1h, though the --target-list is very short already.
> >
> > Anyway, this should show that running NetBSD and OpenBSD is very well
> > possible in our CI - we just need a more powerful x86 host with KVM ena=
bled
> > for this.
>=20
> Yes, if we have an x86 machine we can use as a private CI runner
> for these jobs that would work.

Hi Cleber,
I think there was a Fosshost x86 machine that is currently idle? Does it
support nested virt?

Thanks,
Stefan

--/4DE+qUXifOR32E9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKCbNEACgkQnKSrs4Gr
c8jDxQf/cZk/qE1dafLdLMFajkwURFCKFpodQktUpTJ4cVnJO4p/pgJvDoxxX4Zd
gY0WIvFQBu1ozm+kq8QldIwfQ1L3hJEM379iQeKgP3NWzCdKzpa12Gd6uCtxa5PK
TFWlvRZx7N9IwzBqkd903/63n6ic5dy81an6AEcJkXvayJd/qFRmlfkz2yBTlTHv
Bp/q2UiklBxrPE9VPDPgm1/SqxZkyrI1N3eveQQmFijYWj573V6ppXHcQ//5Pc3u
GYjeBpGu28YSZ7uQFNdVx5G3u3F2AbQgUfqqsPQrlZTnLIRvcf8ZUqoy/EkN52ER
C4XRDVEZipCOUzRnTfGP3GnJhK9Eqg==
=QzGw
-----END PGP SIGNATURE-----

--/4DE+qUXifOR32E9--


