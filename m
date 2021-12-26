Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0351247F5B8
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Dec 2021 08:51:43 +0100 (CET)
Received: from localhost ([::1]:46128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1OJh-00025Z-K2
	for lists+qemu-devel@lfdr.de; Sun, 26 Dec 2021 02:51:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n1OGj-0001Jl-Oq
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 02:48:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n1OGg-0003yN-VB
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 02:48:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640504912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n72cskj0xks/cMUunZUJeF1fj5na/a4KpmUDo3Y/Z2I=;
 b=CNnQqf5725UDxm5UzLLX5CJbaqsdl/970g8W7amPfId0zaddNMph1z7yh5Uvplt/ZgEeny
 OhihLnueXxkQxUE2PzLCsjrp5SNF8jl9bXOx0wO2HU3eL77z+Vn1f+CkT9bvfcgZgh0Nyk
 GNV2KH4O/FmuiW8cidb4fLgBzFC83QU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-nX6y1B_hOoedQKhjizf2Cw-1; Sun, 26 Dec 2021 02:48:29 -0500
X-MC-Unique: nX6y1B_hOoedQKhjizf2Cw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E3371006AA3;
 Sun, 26 Dec 2021 07:48:28 +0000 (UTC)
Received: from localhost (unknown [10.39.192.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7621973178;
 Sun, 26 Dec 2021 07:48:27 +0000 (UTC)
Date: Sun, 26 Dec 2021 08:48:26 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: Building QEMU as a shared library
Message-ID: <YcgeSqB5m2la2Bif@stefanha-x1.localdomain>
References: <PA4PR09MB4880FF47C3A6E249E55B80E2EB769@PA4PR09MB4880.eurprd09.prod.outlook.com>
 <CAFEAcA8m0M2+=ZuBAXcRmyGMzjHdjCYWM+_KzFK_eoPdwX-vpA@mail.gmail.com>
 <c2efa7d0-906b-21bc-bcee-d9f79a2e2064@amsat.org>
MIME-Version: 1.0
In-Reply-To: <c2efa7d0-906b-21bc-bcee-d9f79a2e2064@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4HCLZGcfgh6p0tkY"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Amir Gonnen <amir.gonnen@neuroblade.ai>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--4HCLZGcfgh6p0tkY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 23, 2021 at 10:49:46AM +0100, Philippe Mathieu-Daud=E9 wrote:
> What are your thoughts on Daniel idea to where (IIUC) cores can are
> external processes wired via vhost-user. One problem is not all
> operating systems supported provide this possibility.

There is no fundamental limitation that prevents vhost-user from being
used on non-Linux OSes. Eventfds can be replaced with pipes or other
file descriptors. Shared memory fd passing can be replaced with an
OS-specific shared memory API.

If the OS does not support these things:

- Johannes Berg added in-band notifications ("docs: vhost-user: add
  in-band kick/call messages"), so eventfds aren't strictly necessary
  anymore.

- David Gilbert is working on in-band DMA, reducing the need for shared
  memory (at the cost of extra inter-process communication).

Stefan

--4HCLZGcfgh6p0tkY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHIHkkACgkQnKSrs4Gr
c8hw4Af/ZC6Bq8uz7SZnOQULb243+sRQ+1/Yth9zXSJqm7O9iX4VFh7pKviBs++4
uUdWUWBJpKvLb0bKaTOJZW2/RKuHUEmFAEKVFW9xXrXUXRgu2ZdXgPkLIOOHXxbm
JKguo9kUq/EfG5FVrUlNJjrYpXEM2TQ6jAmGYLMw/IicWiqDdQ0BkZYEDboEQm2h
GDaopCzqiaFWWwpCMdVv/H3CK6kgO3emmm+7ZQXfFuThhTqbYyQl0nQMtN5dGsLI
ZdpWX99ZjUpdq/NFhNWm2tCikpJaI7b79PRFSWX/scvnsUqSEX/4/Rgs7PW5aPlu
KiFoaO77s97daoGoJiSuBzcDcFYrXw==
=loqc
-----END PGP SIGNATURE-----

--4HCLZGcfgh6p0tkY--


