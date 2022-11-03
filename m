Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385D8617E90
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 14:58:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqajc-0000YO-Qf; Thu, 03 Nov 2022 09:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oqajV-0000UG-Rt
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 09:58:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oqajR-0004R5-6c
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 09:58:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667483888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CZKJhCKPnQiHhb080C1ioExfRcxOVqovC3v0UbURZxE=;
 b=hmuQF046VLLJ6W96BgIt3h0k6RhZkblzopRQ+pZpVuwLzUxvlDAh0bGHRZ6bR0JOYqrYj4
 BlEXfwYkwwI+68GRlkYE8GPvNUF2dn2vObpCJC3uf9MGknoFNqFYRLbPl/FRUOx7r9WYKD
 jOBEQQv2I+9/A1BZ1AxV4tCrHaaRR8c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-pxhYwNZSOvOWEkha8oJSlw-1; Thu, 03 Nov 2022 09:58:04 -0400
X-MC-Unique: pxhYwNZSOvOWEkha8oJSlw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7049E3C0DDD5;
 Thu,  3 Nov 2022 13:58:04 +0000 (UTC)
Received: from localhost (unknown [10.39.193.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D82F01121325;
 Thu,  3 Nov 2022 13:58:03 +0000 (UTC)
Date: Thu, 3 Nov 2022 09:57:51 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Eric Biggers <ebiggers@kernel.org>, qemu-devel@nongnu.org,
 hreitz@redhat.com, qemu-block@nongnu.org, nsoffer@redhat.com
Subject: Re: [PATCH 1/2] file-posix: fix Linux alignment probing when EIO is
 returned
Message-ID: <Y2PI3x/JkWPIrcv6@fedora>
References: <20221101190031.6766-1-stefanha@redhat.com>
 <20221101190031.6766-2-stefanha@redhat.com>
 <Y2HVgnwAPdTIaZR6@sol.localdomain>
 <Y2HasGvN6qMFq29A@sol.localdomain> <Y2OPaxoX7UanUzTd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="j1CQlMyCOA2ggU97"
Content-Disposition: inline
In-Reply-To: <Y2OPaxoX7UanUzTd@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--j1CQlMyCOA2ggU97
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 03, 2022 at 10:52:43AM +0100, Kevin Wolf wrote:
> Am 02.11.2022 um 03:49 hat Eric Biggers geschrieben:
> > On Tue, Nov 01, 2022 at 07:27:16PM -0700, Eric Biggers wrote:
> > > On Tue, Nov 01, 2022 at 03:00:30PM -0400, Stefan Hajnoczi wrote:
> > > > Linux dm-crypt returns errno EIO from unaligned O_DIRECT pread(2) c=
alls.
> > >=20
> > > Citation needed.  For direct I/O to block devices, the kernel's block=
 layer
> > > checks the alignment before the I/O is actually submitted to the unde=
rlying
> > > block device.  See
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/block/fops.c?h=3Dv6.1-rc3#n306
> > >=20
> > > > Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1290
> > >=20
> > > That "bug" seems to be based on a misunderstanding of the kernel sour=
ce code,
> > > and not any actual testing.
> > >=20
> > > I just tested it, and the error code is EINVAL.
> > >=20
> >=20
> > I think I see what's happening.  The kernel code was broken just a few =
months
> > ago, in v6.0 by the commit "block: relax direct io memory alignment"
> > (https://git.kernel.org/linus/b1a000d3b8ec582d).  Now the block layer l=
ets DIO
> > through when the user buffer is only aligned to the device's dma_alignm=
ent.  But
> > a dm-crypt device has a dma_alignment of 512 even when the crypto secto=
r size
> > (and thus also the logical block size) is 4096.  So there is now a case=
 where
> > misaligned DIO can reach dm-crypt, when that shouldn't be possible.
> >=20
> > It also means that STATX_DIOALIGN will give the wrong value for
> > stx_dio_mem_align in the above case, 512 instead of 4096.  This is beca=
use
> > STATX_DIOALIGN for block devices relies on the dma_alignment.
>=20
> In other words, STATX_DIOALIGN is unusable from the start because we
> don't know whether the information it returns is actually correct? :-/
>=20
> I guess we could still use the value returned by STATX_DIOALIGN as a
> preferred value that we'll use if it survives probing, and otherwise
> fall back to the same probing we've always been doing because there was
> no (or no sane) way to get the information from the kernel.

Yes, it seems probing is required to verify the values returned by
STATX_DIOALIGN. At least until enough time passes so we can say
"STATX_DIOALIGN has been correct for X years and no one is running those
old kernels anymore".

Stefan

--j1CQlMyCOA2ggU97
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNjyN8ACgkQnKSrs4Gr
c8j+bAgAo8lYaqN0LsFGayZQMcY18oIv+R3D/3xQb8BymA4VWfkSagKzyIjQgpRC
R4pR/vjw1cDiPeAMSyZM7G6ItQ4KhzKBo12Fj+w00RFrp5PAnlfK4qbSrCVuzGWs
piSVnKW2l/u/uet5lw4A1+Q2/Csepj0n87MUzySbJfKv/st+WiWcUizJZ3TNfbv/
ddXPOYzSJYCsCV+aBF91ZmtDeq+N4zqt6I8rcimlf6tE/vAN1hdKNep3ZQhlrFNh
GD9t/y1XCCkP3f51I3OD4lxV1bBw5EW3kFqCV4VYWJR/3qLRhCytK+IYMDEOodHi
iO6+oFAWCvpLp69M5isrqHzmNeSvcQ==
=JFSc
-----END PGP SIGNATURE-----

--j1CQlMyCOA2ggU97--


