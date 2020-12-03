Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9A72CDB6C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 17:41:51 +0100 (CET)
Received: from localhost ([::1]:43292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkrfy-00060T-Bk
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 11:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kkreK-0005TZ-0n
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:40:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kkreH-00046M-AM
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:40:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607013603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fn9zJki2CFTSVkKEiyf15omKK5jyUvDIatkdHg/loqM=;
 b=P3shcgj601mOdNRdbWcHZLv2S1YhLDBOMhu+zxnLj+2BjBQlR3gbR3DIm+tg04mHFY0M7j
 tHj+lDxD/R272xXx/MIzeFwX1U22G1UffCNjkUG+kdhFA7f9QO8eScWJ1TzgwEovKwgrUr
 Yq4KnsBUnk1EICgZ140R9CnXw/bujys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-ge_5Gg38OHWNLZOmVE04ow-1; Thu, 03 Dec 2020 11:40:00 -0500
X-MC-Unique: ge_5Gg38OHWNLZOmVE04ow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF791800D53;
 Thu,  3 Dec 2020 16:39:58 +0000 (UTC)
Received: from localhost.localdomain (ovpn-118-183.rdu2.redhat.com
 [10.10.118.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA94A5D9CC;
 Thu,  3 Dec 2020 16:39:54 +0000 (UTC)
Date: Thu, 3 Dec 2020 11:39:52 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH-for-5.2? 0/1] Acceptance tests: bump Fedora to 32
Message-ID: <20201203163952.GA2787993@localhost.localdomain>
References: <20201202215747.2719507-1-crosa@redhat.com>
 <CAFEAcA8o8hCBTJakir4wpE-w_bQCaMmpAiYVYyp=19fqNqmEJw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8o8hCBTJakir4wpE-w_bQCaMmpAiYVYyp=19fqNqmEJw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2020 at 10:09:37AM +0000, Peter Maydell wrote:
> On Wed, 2 Dec 2020 at 21:57, Cleber Rosa <crosa@redhat.com> wrote:
> >
> > I believe this may be a candidate for "right now" because the code
> > changes here simply sync with external infrastructure changes, that
> > is, the retirement of Fedora 31 from the official repository
> > locations).
>=20
> Strong "no" at this point in the release cycle. Only
> "this is absolutely critical because QEMU sets users'
> machines on fire" bug fixes at this point.
>=20
> thanks
> -- PMM
>=20

Sure,

Thanks for taking the time to consider it and for the response.

Cheers,
- Cleber.

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAl/JFNYACgkQZX6NM6Xy
CfMnZBAApCULGnGPOkV0Tq1ilkt8cNTb5ZF3PVUkOMlRf6f5KpqhDI0nByE83Dj4
yZbwWEf1IEBBtcTyDJDaNzdV5Ea0FYymGtRo9+Km9Vg/pbLbHLKnkVwVKQY/F05c
LyVVzbq+aTkhqpNoYuB9Ugh7VcbKtgbtzbuCJDuY0LdE0yklQZjfymcKzCbkSbOv
tVJlnnMg+VcKesQAghUeBHvesdvjWihbEoz5naSvuOL6DpglUAOoD8+F4E0d71iL
qy4Dr/fEgOPWU+80AJLnSdebv3eZzn/SpnX73n8YdUWmejihQua+knrSRckzGTir
xv3S2615K2Vj20K9L7BZg6H/6z76MJGbw/wE2kk3cVQlCQyibNlDtYxRLZC2yFZT
K7pan4AA8wQqL7/J5BEUm454b5igQ/pNaSBrXSlkfEhMwTE2Ysc5fE7tKoXFcIpS
3DOG6ryv4/UTRRc2VItWz/So7NW2nIeGApQGFXfTzPDTV347BeZdXaeMoe5F3hqy
zR9BR8ecyy2+QbKkBE2rNmapUu3pLH+rGrAABFJXTT0HhZwozXdquYNC46kxkN04
0/U2iy4F3T/S7J1EqKoaGsTRrxumP4Xh/RPOK4NyozxcJfZa1JsswaoICb/kKKNV
KzekkP1B3YHQFoHKkzPzDhqHfS2Zk4RUPextE3IAvkLrNt7bfc0=
=m/Fd
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--


