Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFCD305EA4
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 15:51:05 +0100 (CET)
Received: from localhost ([::1]:41354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4m9w-0007AG-Qo
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 09:51:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4m8L-0005Wz-6F
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 09:49:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4m8J-0001Vo-4R
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 09:49:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611758962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xDXKVUZnpHjx/VXPJi6EfAvQ+34qVrDWW19D/Izw4PE=;
 b=VIGIvN0Gsv9kTmliJrrfXKtGi6DGMXYhGAY3ZuHcqYKUP6+Kd0XBaqCdG3iGAY0111XSQv
 cp/AoJ8y3oycIA4IJWAhMxcxhuJB1GzHUW5kO8olUzvA+NcWrZxBuuiX9Bs4R9WE6Ei3dh
 MZbJ/OYdsgQMY2izbyQYATuTVc2ULZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-aZv6rgAdOMS6CKtY5waS6w-1; Wed, 27 Jan 2021 09:49:18 -0500
X-MC-Unique: aZv6rgAdOMS6CKtY5waS6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A5CEBBEEF
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 14:49:17 +0000 (UTC)
Received: from localhost (ovpn-115-15.ams2.redhat.com [10.36.115.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A1B477F17;
 Wed, 27 Jan 2021 14:49:16 +0000 (UTC)
Date: Wed, 27 Jan 2021 14:49:15 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 2/8] meson: move up hw subdir (specifically before
 trace subdir)
Message-ID: <20210127144915.GE310142@stefanha-x1.localdomain>
References: <20210121125028.3247190-1-kraxel@redhat.com>
 <20210121125028.3247190-3-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210121125028.3247190-3-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AjmyJqqohANyBN/e"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--AjmyJqqohANyBN/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2021 at 01:50:22PM +0100, Gerd Hoffmann wrote:
> Needed so trace/meson.build can see
> stuff done in hw/*/meson.build.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  meson.build | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meson.build b/meson.build
> index 1f3d48b53a06..7462a50b4c36 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1777,6 +1777,8 @@ if 'CONFIG_VHOST_USER' in config_host
>    vhost_user =3D libvhost_user.get_variable('vhost_user_dep')
>  endif
> =20
> +subdir('hw')
> +
>  subdir('qapi')

Please add a comment into the meson.build file explaining the ordering
requirement. This will prevent people accidentally breaking this in the
future.

--AjmyJqqohANyBN/e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmARfWsACgkQnKSrs4Gr
c8ja+AgAtCGcTBlIcfzGGj/ybtHv5h1SyRcwij4WhPbMCtubdBQpvKnNRu7CxzeS
uovUu9gMf3zIKGN8vxAE3Tj2UhxWO/xxRzEOUn4DeUGLw7sgidopOOv9acm9wFGl
3qm/BrxbnsYgTeAHHc99QcaEuHNqTZOFWvZJN0SAz3xohhZGP3C5hOO1Ja/NtswY
a8Y4IdspaQeEn24CYuxzmUXgoWBjx3RDanU3De4bDiyxvciizHDugiWH7zTBxNpR
QIvEsqEe80rFFTFk6ZsWmUfgIZyfsOKSoqsrJkm948R82TuipMKuByGK0sJv8W+O
5NHg2wwiT0EYsKEdSAQEAPgS/O2gaw==
=Fxxi
-----END PGP SIGNATURE-----

--AjmyJqqohANyBN/e--


