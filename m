Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C9C7ECD3
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 08:43:36 +0200 (CEST)
Received: from localhost ([::1]:60626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htRHm-00058D-7o
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 02:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50023)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@redhat.com>) id 1htRHD-0004bY-2a
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 02:42:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1htRHC-0001B1-7g
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 02:42:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41322)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>)
 id 1htRH9-00019a-Vy; Fri, 02 Aug 2019 02:42:52 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 323B13086B4D;
 Fri,  2 Aug 2019 06:42:51 +0000 (UTC)
Received: from localhost (ovpn-116-202.ams2.redhat.com [10.36.116.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBDAF60852;
 Fri,  2 Aug 2019 06:42:45 +0000 (UTC)
Date: Fri, 2 Aug 2019 07:42:44 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Aarushi Mehta <mehta.aaru20@gmail.com>
Message-ID: <20190802064244.GC4227@stefanha-x1.localdomain>
References: <20190801234031.29561-1-mehta.aaru20@gmail.com>
 <20190801234031.29561-13-mehta.aaru20@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UFHRwCdBEJvubb2X"
Content-Disposition: inline
In-Reply-To: <20190801234031.29561-13-mehta.aaru20@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 02 Aug 2019 06:42:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v9 12/17] qemu-img: adds option to use aio
 engine for benchmarking
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Sergio Lopez <slp@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 saket.sinha89@gmail.com, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefan@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--UFHRwCdBEJvubb2X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 02, 2019 at 05:10:26AM +0530, Aarushi Mehta wrote:
> diff --git a/qemu-img.texi b/qemu-img.texi
> index c8e9bba515..0a2eccea85 100644
> --- a/qemu-img.texi
> +++ b/qemu-img.texi
> @@ -206,7 +206,7 @@ Command description:
>  Amends the image format specific @var{options} for the image file
>  @var{filename}. Not all file formats support this operation.
> =20
> -@item bench [-c @var{count}] [-d @var{depth}] [-f @var{fmt}] [--flush-in=
terval=3D@var{flush_interval}] [-n] [--no-drain] [-o @var{offset}] [--patte=
rn=3D@var{pattern}] [-q] [-s @var{buffer_size}] [-S @var{step_size}] [-t @v=
ar{cache}] [-w] [-U] @var{filename}
> +@item bench [-c @var{count}] [-d @var{depth}] [-f @var{fmt}] [--flush-in=
terval=3D@var{flush_interval}] [-n] [-i @var{aio}][--no-drain] [-o @var{off=
set}] [--pattern=3D@var{pattern}] [-q] [-s @var{buffer_size}] [-S @var{step=
_size}] [-t @var{cache}] [-w] [-U] @var{filename}

Please add a space:

  [-i @var{aio}] [--no-drain]

--UFHRwCdBEJvubb2X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1D22QACgkQnKSrs4Gr
c8gkTQgAgdntJVlbWVvK3/WOTBSvGqQvWPnlxF7EbeE/xywd7k1Dvr+S42etjAYG
ozCAxyzn28IO+XHw0bpJFRMHVZLPygm0Y+sCzSfMPpombvFpRWLZAP8B1x64LIrK
XcfSCw5DqKU+cQ5mR0y8HQRuLDdVX0LRLoA2Jo0RtUPs2QVv/5wMwmiJWi6GMJvW
OMbyi+jiT3TpvYMRYvZcJaSd24iV/XCB4Hpz9bqKQyvHGEcMoRdhTeJ9Ui7BLYJR
rW4sQe481GGMdAs7gydQqgfE/mlgTjWF07gs0K7lOHukjimIdxb0tEuacsikui1G
pE57SnyMkQG0Ic3aOrDg7PPcRqeLeQ==
=6OGP
-----END PGP SIGNATURE-----

--UFHRwCdBEJvubb2X--

