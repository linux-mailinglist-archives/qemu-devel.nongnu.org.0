Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A182E46ED37
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 17:37:35 +0100 (CET)
Received: from localhost ([::1]:32910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvMQI-0000rU-Q2
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 11:37:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mvMNr-0007KE-3s
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 11:35:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mvMNp-0006Py-1L
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 11:35:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639067700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XkPob5xzrGSr5yd8mPjzS/k3pcOAUlOhBoLeGzOfzX8=;
 b=Fau4/Ylu3bUDn8xVBrztQrPiMK4EZxmxtBOsU3fsLepeH+qTodtf6TKeVmgrTNOpcyuQQZ
 B8y/V9OSjvFZqU2ey6ClYdudMe93XlghiGfz2zryktBVFrq2n/bNtQWjTW9+TJcuW3Yu+d
 HKkT0uonoiIKWBpYshN4pMcNFRDaHok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-U18lPQ2MNNqVJ9akeOIbBQ-1; Thu, 09 Dec 2021 11:34:56 -0500
X-MC-Unique: U18lPQ2MNNqVJ9akeOIbBQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8226F90BC91;
 Thu,  9 Dec 2021 16:34:09 +0000 (UTC)
Received: from localhost (unknown [10.39.194.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED59599224;
 Thu,  9 Dec 2021 16:34:08 +0000 (UTC)
Date: Thu, 9 Dec 2021 16:34:07 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/1] Block patches
Message-ID: <YbIv/yz/fLQq+eOP@stefanha-x1.localdomain>
References: <20211209152117.383832-1-stefanha@redhat.com>
 <CAFEAcA8mpWWZ0YS-FX8zCy6fZmCi_oznZ8c0N9mzyOqzVX1HMA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8mpWWZ0YS-FX8zCy6fZmCi_oznZ8c0N9mzyOqzVX1HMA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jMy3/M/6Aco89mH6"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--jMy3/M/6Aco89mH6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 03:46:29PM +0000, Peter Maydell wrote:
> On Thu, 9 Dec 2021 at 15:21, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > The following changes since commit a3607def89f9cd68c1b994e1030527df33aa=
91d0:
> >
> >   Update version for v6.2.0-rc4 release (2021-12-07 17:51:38 -0800)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> >
> > for you to fetch changes up to cf4fbc3030c974fff726756a7ceef8386cdf500b=
:
> >
> >   block/nvme: fix infinite loop in nvme_free_req_queue_cb() (2021-12-09=
 09:19:49 +0000)
> >
> > ----------------------------------------------------------------
> > Pull request
> >
> > An infinite loop fix for the userspace NVMe driver.
> >
> > ----------------------------------------------------------------
>=20
> I'm not running the release cycle this time around, but: it's
> already rc4, pull requests by this point need a clear justification
> in the cover letter for why they're really release critical.

It's late, this isn't a show-stopper (block/nvme.c is not widely used).
Let's leave it for the next release cycle and -stable.

Stefan

--jMy3/M/6Aco89mH6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGyL/8ACgkQnKSrs4Gr
c8j2hwf+OxW7zOn2frSevFpUNiRIIXlFlWUQze3lrmeXh7esKxHvAeY/Y2mJ5l1/
RCjdcFTqYIGlIFgutWlAIKz0CHWnVGf9CK/sryIEoWpV8zBTwyFWtpDi8zFhQfyE
FJy+96h1EC+TYTQJLHrDBAidaYAVgDbQ9AQ5SH98NWlvzISTJQ+w1YE7OcEnp5ef
3GB854eLLK2apdhUEr92wBv3bVIxLDnmKLdV9Kvva4R9Y8/Bj8o/6z1K5ntrJSiz
N+OAKfKVfcKnJwcNisKK9dEuP97g6f79Ox6cxnNr0bNBOGbErSy6mnbpn1Kuhi5J
M8PYnPcfOmPIU8wWmieZYcybFiVKXQ==
=Fv9/
-----END PGP SIGNATURE-----

--jMy3/M/6Aco89mH6--


