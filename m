Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AC723A259
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Aug 2020 11:56:01 +0200 (CEST)
Received: from localhost ([::1]:55216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2XCK-00059R-8Z
	for lists+qemu-devel@lfdr.de; Mon, 03 Aug 2020 05:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k2XBZ-0004dZ-GT
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 05:55:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49090
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k2XBX-0000oy-V1
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 05:55:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596448510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GfF/GoNPwhzvzmnVtLWx1cnICjOsPlVX6dd6TVLXkiY=;
 b=IFxQz4+dT9dCKC9ZerBs7+uJBp4as6RE/OJkDLifiLz+LoJGcr0kU06Wk4zUB5rQFt3USX
 M/R17BoizyHIUNLxiU/xWZFX3Q1trQ9kRVdXvEv6JhIllt0m8sgdSXDguYRw0cSSPv2r1V
 qHKPfmYfXjw7j7jW/mGUBIQkFeaGbwI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-gVXtkLw5ME6wEZb95PCoRg-1; Mon, 03 Aug 2020 05:55:08 -0400
X-MC-Unique: gVXtkLw5ME6wEZb95PCoRg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13340E91F
 for <qemu-devel@nongnu.org>; Mon,  3 Aug 2020 09:55:08 +0000 (UTC)
Received: from localhost (ovpn-114-66.ams2.redhat.com [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BFBF60BF4;
 Mon,  3 Aug 2020 09:55:00 +0000 (UTC)
Date: Mon, 3 Aug 2020 10:54:59 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v2 4/5] virtiofsd: Open lo->source while setting up root
 in sandbox=NONE mode
Message-ID: <20200803095459.GD244853@stefanha-x1.localdomain>
References: <20200730194736.173994-1-vgoyal@redhat.com>
 <20200730194736.173994-5-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200730194736.173994-5-vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wULyF7TL5taEdwHz"
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/03 01:24:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, vromanso@redhat.com, dwalsh@redhat.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com, virtio-fs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--wULyF7TL5taEdwHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2020 at 03:47:35PM -0400, Vivek Goyal wrote:
> In sandbox=3DNONE mode, lo->source points to the directory which is being
> exported. We have not done any chroot()/pivot_root(). So open lo->source.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrou=
gh_ll.c
> index 76ef891105..a6fa816b6c 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -3209,7 +3209,10 @@ static void setup_root(struct lo_data *lo, struct =
lo_inode *root)
>      int fd, res;
>      struct stat stat;
> =20
> -    fd =3D open("/", O_PATH);
> +    if (lo->sandbox =3D=3D SANDBOX_NONE)
> +        fd =3D open(lo->source, O_PATH);
> +    else
> +        fd =3D open("/", O_PATH);

Up until now virtiofsd has been able to assume that path traversal has
the shared directory as "/".

Now this is no longer true and it is necessary to audit all syscalls
that take path arguments. They must ensure that:
1. Path components are safe (no ".." or "/" allowed)
2. Symlinks are not followed.

Did you audit all syscalls made by passthrough_ll.c?

virtiofsd still needs to restrict the client to the shared directory for
two reasons:
1. The guest may not be trusted. An unprivileged sandbox=3Dnone mount can
   be used with a malicious guest.
2. If accidental escapes are possible then the guest could accidentally
   corrupt or delete files outside the shared directory.

Stefan

--wULyF7TL5taEdwHz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl8n3vMACgkQnKSrs4Gr
c8iRsQf/UkXbGSctdsfbjvgX4yRKdTIBNS14iuO8+BHThEoDKAGmSxDKQkCt1dVJ
F1lsVMXyFLviyh3xKJ4uZYBDukIV7uuL/ETA/UotpaSKD+BTDCFn7kMNt9O6H9lW
Ix/MtNt0u9Qv+VGCUwXSS6gEwmyYCgMaikePcqYsU1ncOS/woIi5Wc/MkCg+3Add
8jXtI8E3fOpMOZEKZENaJS1T98mUTawbxl6QVWqOvtrlA/Hj7ePp9YY0YaF/37A1
GcaseSd3p8q3WkpHyPcPn8hRd6IXmqv1pcadi3YIm43YTIKld8UaRO7r/n5OxzMV
Of3JGvz4zKfUOZoBODPJzzrxC8QZAg==
=ecCi
-----END PGP SIGNATURE-----

--wULyF7TL5taEdwHz--


