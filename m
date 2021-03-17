Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C02233E565
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 02:04:55 +0100 (CET)
Received: from localhost ([::1]:49752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMKcH-0002Ip-S0
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 21:04:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lMKbV-0001sS-F1
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 21:04:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lMKbS-0006qN-6f
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 21:04:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615943040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c/YFlcWoAlLR0inYMU6/K9CFUr5QS2uZDV53+wUIpBA=;
 b=AfTBnJZbBSH4O2Til4HuxAQ3NbzQLHxy5Ndb1lgM7pqeJieGpeQE9drT/rN1foXWq0ARIk
 NarOtifBJtZKcvraM8qN7kxinDgXImRt7Sx5Eib0v5lLOXV1POCNHquL+lzckuGKKJ32UA
 ZuBNrjOO2YZMxKrieIvIOpoeLMY04/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-3Qe-m9zSOT-xstcxOvl2OQ-1; Tue, 16 Mar 2021 21:03:57 -0400
X-MC-Unique: 3Qe-m9zSOT-xstcxOvl2OQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16435107ACCA
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 01:03:57 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-107.rdu2.redhat.com
 [10.10.113.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71FE46A940;
 Wed, 17 Mar 2021 01:03:50 +0000 (UTC)
Date: Tue, 16 Mar 2021 21:03:48 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH] tests/acceptance: Print expected message on
 wait_for_console_pattern
Message-ID: <YFFVdJv06hnvwVz7@localhost.localdomain>
References: <20210309153507.1905682-1-wainersm@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210309153507.1905682-1-wainersm@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xBOCKAN2ci0GBeeV"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: willianr@redhat.com, philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--xBOCKAN2ci0GBeeV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 09, 2021 at 12:35:07PM -0300, Wainer dos Santos Moschetta wrote=
:
> For the sake of improve debuggability of tests which use the
> wait_for_console_pattern(), this changed the _console_interaction() so th=
at
> the expected message is printed if the test fail.
>=20
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
> While I was testing  "[PATCH v2 2/2] tests/acceptance: Test ast2600 machi=
ne"
> I could not clearly determine which of the called wait_for_console_patter=
n()
> was failing. So this patch improves debuggability in such as situations.
>=20
>  tests/acceptance/avocado_qemu/__init__.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--xBOCKAN2ci0GBeeV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmBRVXEACgkQZX6NM6Xy
CfOksQ/8Dsag7dopEYbZW1lstBWXmW9Aj4W54oPtk8dD39HEVBZDz0C/bAlLj6N0
TSRN+rulcBXU+82vHrtp8NqExY6tjdZdQ8le6OysGQ4dzui+pgK/RFAjmH3zlzEX
7mUBVPYQZPLgg5JUsNOjNvcbqp6Juqsv6D2oZLlHUqCfWK1e4fhbinhcQZm0v9Kx
XqIx9hbruIS3MH+7huf16sgTA3TG436BQJRkrBBJ25NK0e4PY27byEMxl1Bk00kr
O1V3D36n9Sq0qD4EVXtNYeikhjH4BWsbLN1hSCXe/78B/dqoNVg7vXw2TIpCXvQa
HzndevaPB55r84TAptTgzVe9689fBo8vJ8pIXZjUrGwvDPEys7YgWCbQZhf8U//E
GzWyaQtu4frWKEtVL5FDwLhy5EYfYWMQg05Ho1if9Dbwoi55Mx9yFFlq4BCAs5xM
yT1HpyxVxsqiviaYFHFq3mt4FyDvdL3HDW9RiIGlz23Mk6AZtW1kUqYoHuoSZp+M
P0eeXHVN3dY40ftbwDWo1QhgGTkb2KeKBOwDsX7GozVq7Pt7j/GmgiAd366CHa1h
+2xB0d7pOuJTq0+i6U95vUgoD3IzytEppvjApYO3MRiKbyTrqPCWZVQLunDCCKTT
PfaYay4I23XoB7ZMOnzki1PX9Opb8eC2xInUq6ZRRyUR0nTP6gk=
=leA/
-----END PGP SIGNATURE-----

--xBOCKAN2ci0GBeeV--


