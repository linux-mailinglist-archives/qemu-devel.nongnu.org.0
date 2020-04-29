Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA8A1BE2F3
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 17:40:41 +0200 (CEST)
Received: from localhost ([::1]:56946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTopE-0008Q7-HR
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 11:40:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33040)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1jTom2-0002ja-Mu
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 11:37:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1jTocA-0007tE-1S
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 11:30:40 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:38185
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jToc9-0007sQ-Ih
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 11:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588174027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NP7oes80jMZLO5POXHfQYdzuf8rcV2BJA2f5Onrnf1o=;
 b=ctAoL8LA+1mVYU9LZsvLy/D1dZ3XMLAiTG6KnZdDM8vcLL2ucgjFm/o/6iB+udQrrRbtpG
 N5kv10eKbfIWfUir3wnc48xvCBJGj0audeA+wHEzQwTAvlgzM49fSgG9I1Uc2qY5rs9Wzq
 vYH1Xewb7VaDfHsmo/cViUw9GM8+h94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-VH0eOEcbOTKXI53g109tlA-1; Wed, 29 Apr 2020 11:27:05 -0400
X-MC-Unique: VH0eOEcbOTKXI53g109tlA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DADB872FE1
 for <qemu-devel@nongnu.org>; Wed, 29 Apr 2020 15:27:04 +0000 (UTC)
Received: from localhost (ovpn-114-2.ams2.redhat.com [10.36.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22B1410013BD;
 Wed, 29 Apr 2020 15:27:00 +0000 (UTC)
Date: Wed, 29 Apr 2020 16:26:59 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: jail lo->proc_self_fd
Message-ID: <20200429152659.GA134868@stefanha-x1.localdomain>
References: <20200429124733.22488-1-mszeredi@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200429124733.22488-1-mszeredi@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 00:53:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2020 at 02:47:33PM +0200, Miklos Szeredi wrote:
> While it's not possible to escape the proc filesystem through
> lo->proc_self_fd, it is possible to escape to the root of the proc
> filesystem itself through "../..".
>=20
> Use a temporary mount for opening lo->proc_self_fd, that has it's root at
> /proc/self/fd/, preventing access to the ancestor directories.
>=20
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)

Good idea!

It's important to note that the proc file system is already mounted
within a new pid namespace.  Therefore the only process visible is our
own process and we don't need to worry about /proc/$PID.  However, there
are a bunch of other files in /proc.  Some of them are protected by
capability checks like /proc/kcore and virtiofsd is unable to access
them, but it's hard to guarantee that they are all off limits.  Better
safe than sorry!

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl6pnMMACgkQnKSrs4Gr
c8gVhAf9HxQ28zYG8KXMDIkOoF+8g4feaj3fdMjwcC9JV56+AJ7oKPJo+hMFqarF
UR41YIMTHhbojaSjnlWLWL0rUIrBre+YlQft1tzpc4B7BXuVrqbZgVwuhztVjs2R
Cpjc/9SiB/nBslL6USs18A46x3pI40XQYCDlgZ0P6aC7vtCLkGEcjYNa630rvZhQ
KqZpMPu4e2Xvl/iEo0oeExr2xmRJnrI1ECjL+pRS02HZpWoNRYB2K0JT+AQnvwsT
Lcoe0y9UXciq/UvvpL8ZtAkNoheK//PG8zx/HxCE9LO9O4z9/fdwjQuK5by1kV9o
Fpwybg8jn/dUP8JxX2ceXK64wDDQyg==
=S+XI
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--


