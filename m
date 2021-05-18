Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABE038707D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 06:11:52 +0200 (CEST)
Received: from localhost ([::1]:56290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lir5D-0000u4-6V
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 00:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lir3Y-0007QM-31
 for qemu-devel@nongnu.org; Tue, 18 May 2021 00:10:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lir3V-00039I-BK
 for qemu-devel@nongnu.org; Tue, 18 May 2021 00:10:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621311004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5S4DPXj+MteFyk9tHlFYvV0O6GQJSTG9IQMAXBfwDcE=;
 b=P6dBlin5vX3ve+MmT5cK7nHo+fiqoVFEzyM1+ZiJxKgHRkHqwqr7xqDnRwnSFiiedb8R0k
 iloBP9GWWe53j+uSrVZyen0yetOgxXvfEChVtyZ3K8A3OUjV+UdZmd8EKP0S5frGP9Wlo3
 7j9GfkUWPrGOnarAkX1hhJiRi57qjsg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-ScZdrZi_O3qz_PmGEtuGRw-1; Tue, 18 May 2021 00:10:01 -0400
X-MC-Unique: ScZdrZi_O3qz_PmGEtuGRw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1269107ACE8
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 04:10:00 +0000 (UTC)
Received: from localhost (ovpn-115-22.phx2.redhat.com [10.3.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 435785D6A8;
 Tue, 18 May 2021 04:09:57 +0000 (UTC)
Date: Tue, 18 May 2021 00:07:12 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 5/6] python/machine: Disable pylint warning for open()
 in _pre_launch
Message-ID: <20210518040712.GD917386@amachine.somewhere>
References: <20210517184808.3562549-1-jsnow@redhat.com>
 <20210517184808.3562549-6-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210517184808.3562549-6-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="11Y7aswkeuHtSBEs"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--11Y7aswkeuHtSBEs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 02:48:07PM -0400, John Snow wrote:
> Shift the open() call later so that the pylint pragma applies *only* to
> that one open() call. Add a note that suggests why this is safe: the
> resource is unconditionally cleaned up in _post_shutdown().
>=20
> _post_shutdown is called after failed launches (see launch()), and
> unconditionally after every call to shutdown(), and therefore also on
> __exit__.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  python/qemu/machine.py | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--11Y7aswkeuHtSBEs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCjPW4ACgkQZX6NM6Xy
CfPyFw/8CQdvbe5KMZaDPQZhuqRr7/tPDtgK7cAkR1dd/de9x3XG88kjWXKHNC1L
3grnwqKKi5kxnLf6h2TwxMu5XGRn9lgoURyZ4g6x7ZEq7R3i/hiytad5YPsU+iDP
Xdy4lY/9LhE6EBnHWhb1Qr+gzD/wkkLDiI+R1fdLCsUWUy4iuWtbIGHMInzSY1vt
RD4wuvIaIVEE0k6e4eK0yi/X3kbNrfAzqI+3gmaNEbb861si5H1PGX+ZBPFbny1b
9HJG/IuhY8ObJg3rppE3bI8CgbxLB9fgiqRN6HI9v0CqJnmzy4JBOs7rRBFsF3Pn
NRnT84Ow69CY1M7cdUnVqcJux/TNfNgd/4ZboIszUefW88zVn4hvmQ7Plnl3q9Co
GYT6EVZOonWesdCCl6lnbFtCepMKFWNAhs4Usmcee6EpK5iv6IZmzltPQNTQ5azu
KXIE9vmJXn7cyKo+HnEEvphb1IRZsY4t1/7WcU8MGVjoe+qqcTl38LrfE4V4H1pS
oqUjaqDbn6vjoSIlHKcr0hj/e6R4Uh2k9blZNoZ+s/HOf+VdHrW8fH5IaP36qIqF
bNAifsv6LMzcRDlVBS0QUBx4jHwyT9PFkMWLuq6AtpNgt1tNxyJqjwkbVSbVQ8k1
8SrwSotgVPEQHHgEavNfuE4LHTMwdd3WTM56jVUHUK0l9giOtm4=
=ftQk
-----END PGP SIGNATURE-----

--11Y7aswkeuHtSBEs--


