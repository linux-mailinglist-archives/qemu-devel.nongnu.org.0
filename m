Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB8F420839
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:26:40 +0200 (CEST)
Received: from localhost ([::1]:52014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKF5-0000mF-9X
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXJjK-0002iV-8A
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:53:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXJjD-0002cb-9k
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:53:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633337621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X6hBFxacCc97ceibONdogqRksbv5sp0JNYkTYeHqw98=;
 b=Z/Q+5i0uG3q/hrb9Yc8p80ceu+d50jIuJbuZDMPzkepbfv56n4gf3mn8XGSI9dDvXs+dtd
 aBjcz8XLJZiaEUVHGDKHz9INnJ7gfYNXJDsTjnZYco0ezYXk5HuffcZZRo9d8UN5QlL9r4
 gsECyRG53S2Z/yCfDeMDTU02Iha6jWs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-8JV_3OzzMOCN3pKi5HV6mA-1; Mon, 04 Oct 2021 04:53:31 -0400
X-MC-Unique: 8JV_3OzzMOCN3pKi5HV6mA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC745824FA9;
 Mon,  4 Oct 2021 08:53:30 +0000 (UTC)
Received: from localhost (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B3CA60871;
 Mon,  4 Oct 2021 08:53:28 +0000 (UTC)
Date: Mon, 4 Oct 2021 09:53:27 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: Moving QEMU downloads to GitLab Releases?
Message-ID: <YVrBB+y+H6faOgVU@stefanha-x1.localdomain>
References: <YVW+ZGmIs+repvj4@stefanha-x1.localdomain>
 <CAJSP0QUq46nOTAv=4V0mhT2ZNbfKBPJXLNLY5Jun5B_h=sedQw@mail.gmail.com>
 <YVXePK28T7nl9J7k@invalid>
 <YVa0p4rZDh3teOwC@stefanha-x1.localdomain>
 <YVbMROzMahQmaRt5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YVbMROzMahQmaRt5@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UB8dqTkWrcxtwvWh"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, Eldon Stegall <eldon-qemu@eldondev.com>,
 michael.roth@amd.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--UB8dqTkWrcxtwvWh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 01, 2021 at 09:52:20AM +0100, Daniel P. Berrang=E9 wrote:
> On Fri, Oct 01, 2021 at 08:11:35AM +0100, Stefan Hajnoczi wrote:
> > We need to keep the security of QEMU releases in mind. Mike Roth
> > signs and publishes releases. Whoever facilitates or hosts the files
> > should not be able to modify the files after Mike has blessed them. One
> > way to do this is to keep hosting the .sig files on download.qemu.org
> > and to redirect the actual tarballs to a file hosting provider. A way t=
o
> > securely publish files without hosting anything on qemu.org would be
> > even better though (maybe it's enough to publish signatures on the
> > static GitLab Pages website).
>=20
> If someone modifies the download files, then when you verify the sig
> it will be detected. It doesn't matter whether the sig is on the same
> host or not, because if someone modifies the sig too, then it will
> still fail validation. The important thing is that the user has got
> the right public key to verify with.
>=20
> IOW, hosting the .sig separately is not required. We need to ensure
> that our public key, however, is published & discoverable in a
> trustworthy place that is separate from the download server. We fail
> at that today because www.qemu.org and download.qemu.org are the
> same server.
>=20
> So it will be beneficial if the download site is split off from
> the public website, compared to our current setup.

You're right. Thanks for pointing this out. I was thinking of the .sig
as a checksum but it's a signature :-).

Stefan

--UB8dqTkWrcxtwvWh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFawQcACgkQnKSrs4Gr
c8iJVgf/Yy91ZzVNL4QDanGBhxqghl25NYGfOPG6ymJv2OwIrkwYYXp6SYc4Btka
1kDtWOJtrvBGB9bOdPromrvPritj+D8OhoWcS9Oh+dMYzGFfJ9fMiV9j7IAJLljW
fMWb4ZjhRCcPfXCv6156NPkfKNrMRWcZhEibY/hN7OdcgdrfspHBYI8611X4wSNr
nnsaWl2i2lflhP0MkNzDMz4ef2UdKlXsCKPu4LaG8NSaMUxMSFoU++yzB9cw2Y/w
Ve7L8lkb0DQ5+Dxv9PugIHgn5Hl6do59O9K2FEAt/t8OogqovXuc/chsVlcD3WPP
fgCNfF55P9B/qVM8rf+dC/4zWpZsFA==
=t+hm
-----END PGP SIGNATURE-----

--UB8dqTkWrcxtwvWh--


