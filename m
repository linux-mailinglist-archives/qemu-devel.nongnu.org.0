Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F4B29CFCC
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 12:50:44 +0100 (CET)
Received: from localhost ([::1]:47664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXjyV-0007AY-GM
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 07:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kXjwP-0006Ec-Nv
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 07:48:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kXjwN-0002VV-MR
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 07:48:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603885710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=koD4Vj5bvP7uFo60o7m8Eo9QiGfWEqtRLmjAntBPAl0=;
 b=f9RAXuE2OKaP8GaZmt+lQ66OT373AZMbzY6qKk6cV1jXEckrVRMN6JIFSn0SfjCweeF8G2
 b+JJChsWM2NRPAx35S7sweIrWLXxVvbm0QFUQbeAJMjswU4C4uKvmPGBJUauf8/oR8QKni
 ZiPhK5p+fGpexSB/j1Aw3UKrTyqlQbo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-2dgCFPC-PwuSRsbMxfD-ew-1; Wed, 28 Oct 2020 07:48:27 -0400
X-MC-Unique: 2dgCFPC-PwuSRsbMxfD-ew-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFA4C803650;
 Wed, 28 Oct 2020 11:48:26 +0000 (UTC)
Received: from localhost (ovpn-113-87.ams2.redhat.com [10.36.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8734755766;
 Wed, 28 Oct 2020 11:48:26 +0000 (UTC)
Date: Wed, 28 Oct 2020 11:48:25 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Joelle van Dyne <j@getutm.app>
Subject: Re: [PATCH v3 5/7] slirp: update build flags for iOS resolv fix
Message-ID: <20201028114825.GI221115@stefanha-x1.localdomain>
References: <20201028030701.14086-1-j@getutm.app>
 <20201028030701.14086-6-j@getutm.app>
MIME-Version: 1.0
In-Reply-To: <20201028030701.14086-6-j@getutm.app>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DwoPkXS38qd3dnhB"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:51:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--DwoPkXS38qd3dnhB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2020 at 08:06:59PM -0700, Joelle van Dyne wrote:
> A future libslirp update will use libresolv on Darwin systems, so we add =
the
> flags in QEMU build now.
>=20
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  meson.build | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--DwoPkXS38qd3dnhB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+ZWokACgkQnKSrs4Gr
c8hsxQf9GdVGuTh10MynbkKVfsKtWuOYUUcqSHoI1LVweoM0rBZlrWk06nUOflyP
nvnWZDl3wzDpx7pJa5Z4qvccK4YA8rjDTCrL2EBPsewh4aFrVroz10nYESAissGd
HYG4EHgckAa3fGxQb+0PY3W3qx4HcAMmcWr18g15wA+5tA9abMTi1BiEY+lWzyma
grckZ+jgRwpzd9zBuoVSQF8ug50cb97yUlBNM/B/7KlYVVoaV7IrLxnr7/zqiomF
RQgssZPs5GxrNh6cLVc4ORNnjRZlXlsK2WztU5dmke5kTqXIsAwA7foLwAyXRgYt
GQ1SyHvl9UoiLnPqJ9ahl+g+6Il0uQ==
=JbEu
-----END PGP SIGNATURE-----

--DwoPkXS38qd3dnhB--


