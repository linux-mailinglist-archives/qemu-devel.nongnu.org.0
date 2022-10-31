Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6429B613DD8
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 19:54:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opZu0-00018n-7R; Mon, 31 Oct 2022 14:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opZtq-0000yL-03
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:52:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opZto-0003cS-Be
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:52:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667242359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CWwKYXrucORlioyJKcgfBADBdAoZigndeo5WYlURb8s=;
 b=KboNTK7E+Sf/GkvpnFgh/J6pnE1Km9VBOb3lnuIqDnOQX6ckOjU70u4qnuOS5ULipdDxgz
 NrxOaoF1rAoiJ0iXY1pnLLVNkCh166zugmYUVVaGv+CCAU7EMUBnUIjpye7Bl2blcBtPEO
 L7KB8J/otftv/2JkRTa2Ldc+4p2sD6s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-2SXE0qMlMkeiuOSm5sLH1Q-1; Mon, 31 Oct 2022 14:52:38 -0400
X-MC-Unique: 2SXE0qMlMkeiuOSm5sLH1Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1EB129ABA0D;
 Mon, 31 Oct 2022 18:52:37 +0000 (UTC)
Received: from localhost (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B9BE492B0A;
 Mon, 31 Oct 2022 18:52:36 +0000 (UTC)
Date: Mon, 31 Oct 2022 14:35:03 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] block/blkio: Make driver nvme-io_uring take a "path"
 instead of a "filename"
Message-ID: <Y2AVV67zxclwnJYn@fedora>
References: <20221028233854.839933-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ozIijSfPoYGuT5Jl"
Content-Disposition: inline
In-Reply-To: <20221028233854.839933-1-afaria@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org


--ozIijSfPoYGuT5Jl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 29, 2022 at 12:38:54AM +0100, Alberto Faria wrote:
> The nvme-io_uring driver expects a character special file such as
> /dev/ng0n1. Follow the convention of having a "filename" option when a
> regular file is expected, and a "path" option otherwise.
>=20
> This makes io_uring the only libblkio-based driver with a "filename"
> option, as it accepts a regular file (even though it can also take a
> block special file).
>=20
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>  block/blkio.c        | 12 ++++++++----
>  qapi/block-core.json |  4 ++--
>  2 files changed, 10 insertions(+), 6 deletions(-)

I have applied this so I can prepare a final pull request for QEMU 7.2.
If we decide to follow a different naming strategy in the next day (QEMU
soft freeze) then I'll drop the patch, but for now I think this is the
most likely way forward.

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--ozIijSfPoYGuT5Jl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNgFVcACgkQnKSrs4Gr
c8j7jAgAkf9dYaZxlScNiSzVnzXl6N8JcJOBR27g264dQ8RI1P3Hv0PKrZA7d9MA
QcfUIcRYwzgcDyjk7Iy1HoWbyzbWEOEOWnLooj4H0PvIK0VQXKe8FUYmF5W3iU4s
mbLx1o6YRlXSXdBe6iPh/zjOsktCnwSNXbOvSVFqO0B5W8OvrPYMiJBeJi5Bb4Q8
bQCD/S/uT6QwxDvVrfhoGRKU5/VrPxG+1ZZqUPmCYwq+uZNwwD1FyYOgZqNzxycm
3BwVhvNdZ7oA4WhLouJyJKugAR2mjzotXielk/1Gz9W24xrknrtWhEFuo+3ibjCk
6X1fpEfxGVKhswYZZ1oz9PtSPdQP+g==
=n1ad
-----END PGP SIGNATURE-----

--ozIijSfPoYGuT5Jl--


