Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D79248C29E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 11:59:10 +0100 (CET)
Received: from localhost ([::1]:51536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7bLQ-0002OS-CZ
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 05:59:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n7bIz-0000Qc-K9
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:56:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n7bIw-0006w3-Pn
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:56:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641984993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/IbOkn7iDasMRKdvgh3wfyzCezNrSl3K52lqrc39jQQ=;
 b=HbxaqHkoWOoOoSYBJAkyxoRFJTaH4y4zd/b+yuaNqPQjY1RAt8YbSR9mq8wFlplFxDLFIW
 Inuo3/OtryOccqSUegOFScoJEj3mGoKQrCHPDbtqtAfN4ygS+lheZewkS99Z4fZS5RGJSc
 6XphouUf4FvSjS8mFXZlmuIWslLeedk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-qBpDIZMnPTKa2Ap5ImNotg-1; Wed, 12 Jan 2022 05:56:29 -0500
X-MC-Unique: qBpDIZMnPTKa2Ap5ImNotg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54F11101AFAC
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 10:56:28 +0000 (UTC)
Received: from localhost (unknown [10.39.195.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C681C7D57D;
 Wed, 12 Jan 2022 10:56:26 +0000 (UTC)
Date: Wed, 12 Jan 2022 10:56:25 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: PyPI account
Message-ID: <Yd6z2WS3hGwPNKkl@stefanha-x1.localdomain>
References: <CAFn=p-b+ene2vKCCDJR9viT9P=GyhBeAO5ZLGsUmiijoxrkfCg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-b+ene2vKCCDJR9viT9P=GyhBeAO5ZLGsUmiijoxrkfCg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fedB4FY5eSwSy6Hn"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--fedB4FY5eSwSy6Hn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Context: John created a PyPI QEMU user in order to publish the qemu.qmp
package. If anyone wants to publish additional Python packages from
qemu.git, please contact him for PyPI access.]

On Tue, Jan 11, 2022 at 03:42:23PM -0500, John Snow wrote:
> Account made: https://pypi.org/user/QEMU/
>=20
> I can't update the wiki, I lack admin perms to edit
> https://wiki.qemu.org/AdminContacts
>=20
> I assume in the event that I fall into a black hole or get launched
> out of a cannon into the sun, any mails sent to jsnow@redhat.com can
> be recovered by Red Hat in general, so there's a sufficient recourse
> for recovering the account in that circumstance.

Thanks, I have added the PyPI QEMU user and added you as the admin
contact:
https://wiki.qemu.org/AdminContacts#Other_resources

Stefan

--fedB4FY5eSwSy6Hn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHes9gACgkQnKSrs4Gr
c8jmzgf9GmKhoLezgzqrYztLJJYFf8ORYJG2FhWdf5+gk9JKYrtcDYSaVVSKDErL
3O8W8qeF6iL4MDh+2lf1JDj7Z4F13W2CPVYSxXmOPY0h+bonKw/jnGyN73cGLyiR
YefY8IzMQQM59V/iaPWtkFR9KkAhaTUPIo8+z7Gd1TZYm0b+lqfIwDIFeRe2ArCP
bz19Qukfv5umnWFvEyr3B1UDItcLA52nvZC542c173ldCXMUNuyi4+0CFAhLd3a8
51j0yotFzlcHPrQaCOso80rvBNgM/UGMcrjmHdvOL6WUKjuJWPTvn0CqWXxK/gDk
TrvmuJpv+NFvVoMOEj5xFPGmmadQcA==
=rzUp
-----END PGP SIGNATURE-----

--fedB4FY5eSwSy6Hn--


