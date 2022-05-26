Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8042534BDE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 10:40:40 +0200 (CEST)
Received: from localhost ([::1]:39462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu92t-00016x-OQ
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 04:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nu90h-0008HG-Ml
 for qemu-devel@nongnu.org; Thu, 26 May 2022 04:38:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nu90e-0002yj-9F
 for qemu-devel@nongnu.org; Thu, 26 May 2022 04:38:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653554299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UuJilYlbw7gfWEvatZ4nmSk8OFgugtYhzbtvxGodpIo=;
 b=TrFIflIeFnpJXyu+bz0WGEgduRWHrRzqe4+3dmKp2MEPUEnnEKwuZJ9xSWJuA/ZWR2iFAk
 lPu1lpw1oX0QvS6Jn216m2UjjpY7xA/yk6Id6rLFETFVyBOkkaKFPJUaG4FMoXVN8hlPUx
 LWjFtvL5ragCvw65kHnwB9E8RSNtIjY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-lNZO9e9vNruf6NoDcvpwYw-1; Thu, 26 May 2022 04:38:15 -0400
X-MC-Unique: lNZO9e9vNruf6NoDcvpwYw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD45F811E81;
 Thu, 26 May 2022 08:38:14 +0000 (UTC)
Received: from localhost (unknown [10.39.193.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E201400F38;
 Thu, 26 May 2022 08:38:13 +0000 (UTC)
Date: Thu, 26 May 2022 09:38:13 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jeff Cody <codyprime@gmail.com>, Fam Zheng <fam@euphon.net>,
 Ari Sundholm <ari@tuxera.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 01/10] block: Add a 'flags' param to
 bdrv_{pread,pwrite,pwrite_sync}()
Message-ID: <Yo88dWjHMvp9Xdwj@stefanha-x1.localdomain>
References: <20220519144841.784780-1-afaria@redhat.com>
 <20220519144841.784780-2-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="F0V5cjt4r7UuqVJt"
Content-Disposition: inline
In-Reply-To: <20220519144841.784780-2-afaria@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--F0V5cjt4r7UuqVJt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2022 at 03:48:31PM +0100, Alberto Faria wrote:
> For consistency with other I/O functions, and in preparation to
> implement them using generated_co_wrapper.
>=20
> Callers were updated using this Coccinelle script:
>=20
>     @@ expression child, offset, buf, bytes; @@
>     - bdrv_pread(child, offset, buf, bytes)
>     + bdrv_pread(child, offset, buf, bytes, 0)
>=20
>     @@ expression child, offset, buf, bytes; @@
>     - bdrv_pwrite(child, offset, buf, bytes)
>     + bdrv_pwrite(child, offset, buf, bytes, 0)
>=20
>     @@ expression child, offset, buf, bytes; @@
>     - bdrv_pwrite_sync(child, offset, buf, bytes)
>     + bdrv_pwrite_sync(child, offset, buf, bytes, 0)
>=20
> Resulting overly-long lines were then fixed by hand.
>=20
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/blklogwrites.c             |  4 +--
>  block/bochs.c                    |  6 ++--
>  block/cloop.c                    | 10 +++---
>  block/crypto.c                   |  4 +--
>  block/dmg.c                      | 24 +++++++-------
>  block/io.c                       | 13 ++++----
>  block/parallels-ext.c            |  4 +--
>  block/parallels.c                | 12 +++----
>  block/qcow.c                     | 27 ++++++++-------
>  block/qcow2-bitmap.c             | 14 ++++----
>  block/qcow2-cache.c              |  7 ++--
>  block/qcow2-cluster.c            | 21 ++++++------
>  block/qcow2-refcount.c           | 42 +++++++++++------------
>  block/qcow2-snapshot.c           | 39 +++++++++++-----------
>  block/qcow2.c                    | 44 ++++++++++++------------
>  block/qed.c                      |  8 ++---
>  block/vdi.c                      | 10 +++---
>  block/vhdx-log.c                 | 19 +++++------
>  block/vhdx.c                     | 32 ++++++++++--------
>  block/vmdk.c                     | 57 ++++++++++++++------------------
>  block/vpc.c                      | 19 ++++++-----
>  block/vvfat.c                    |  7 ++--
>  include/block/block-io.h         |  7 ++--
>  tests/unit/test-block-iothread.c |  8 ++---
>  24 files changed, 219 insertions(+), 219 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--F0V5cjt4r7UuqVJt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKPPHQACgkQnKSrs4Gr
c8g0lAgAq9l3L96W1ecdhKOmDjLy8t9Kjto6gm3Iw+qrW2YR1TVvl7nCxHxFm0Pw
p2hWw+WR9juMr3smeY9NM/AkyaqdBAmYd2OHCuVphTptedvyJvqFBBnl4Sw9jbSR
74OkqxHVDG5UgQlMPv0V/vIPqkeACsL7q1eHDUPuTPQypjNnLwwSIDJPLF80VPOG
NZSu1FkiWC1o+MhNt6iAqqg4RY7Zex+mwNc6XZz4/NmYRf7grxTfkqnmJ4V9h/Fq
FEsKg9ySdNPs0rlZYGmXhu8DcSwLTDNWULyWz20JCGXck145YfFvUU6TAJuBKHGP
nxFkdiJufefvDWTEw85pDAIhjqCqYQ==
=nCGx
-----END PGP SIGNATURE-----

--F0V5cjt4r7UuqVJt--


