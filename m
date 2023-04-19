Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 283E86E74CF
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 10:17:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp2zO-0005hW-BM; Wed, 19 Apr 2023 04:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pp2zL-0005fQ-Qw
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 04:16:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pp2zJ-0007aF-QU
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 04:16:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681892183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TkoxCWcP2qshdiMAPLY4QaeLrlgKkikFdbGxxQiF5Sk=;
 b=ZfCjOZLVfTTKEJKfoaIzsINCn8ByyCAz0xsgcOqWUAWf7r4fHHT3D0Ttd3CSVIhqWE9fSk
 MuDIkklUAFfZ4jbYCn59iXdTPIFH1Ya1LASgSqe0iRqUvxVPKgge7msVZ4cGVRnZFBKifm
 8FuvLWf6NpS39TPmM0vKiReMGaF1EO0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-J6Jt2QGWM8Omx8HyilRVEg-1; Wed, 19 Apr 2023 04:16:22 -0400
X-MC-Unique: J6Jt2QGWM8Omx8HyilRVEg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8613884340
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 08:16:21 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.167])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF4191410DD7;
 Wed, 19 Apr 2023 08:16:20 +0000 (UTC)
Date: Wed, 19 Apr 2023 10:16:19 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: =?utf-8?B?THVrw6HFoQ==?= Doktor <ldoktor@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: Performance improvement with 81f730d4
Message-ID: <ZD+jU35n+6xwNY/H@redhat.com>
References: <f8f0c9ff-5cb9-a440-f84f-19d55f7036a8@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VgWmN/y+gdpL3I1L"
Content-Disposition: inline
In-Reply-To: <f8f0c9ff-5cb9-a440-f84f-19d55f7036a8@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--VgWmN/y+gdpL3I1L
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Luk=C3=A1=C5=A1,

Am 19.04.2023 um 08:02 hat Luk=C3=A1=C5=A1 Doktor geschrieben:
> Hello Paolo,
>=20
> the perf-ci detected and bisected the 81f730d4 - block, block-backend:
> write some hot coroutine wrappers by hand - as a performance
> improvement with 4K read/writes across various profiles. Without
> pinning it was about 10%, with pinned qemu about 15%.
>=20
>     https://ldoktor.github.io/tmp/RedHat-virtlab722/v8.0.0/130-improvemen=
t.html

I must admit that I don't really understand how to read this page, and
which build corresponds to which QEMU revision (or even which one is
older and which one is newer).

All the build names are links, but they only result in a 404.

> Based on the commit message I guess it's expected, so my question is
> whether I should report such obvious improvements or only report
> improvements/regressions that are not that obvious?

I think it's useful to know that we did indeed fix the performance
problem, so as far as I am concerned, please do report them.

When we're addressing a regression, the most interesting part would of
course be comparing to the version before the regression was introduced
(pre-d8fbf9aa85a in this case) to see if the regression was fully fixed.
Maybe the page you linked above does already explain this and I just
don't know where to look? :-)

Kevin

--VgWmN/y+gdpL3I1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmQ/o1MACgkQfwmycsiP
L9bLPg/+KKdTNqlnznGJdFTkTMvu2AtlMRu48M7Zavu+1ydcrtE63LPW7iUOOrZm
X+PBlb64IhnIQpYLqpaYTid4H/FE8KzoXLOwN0Y25MaeQejW2HBS/0fvR7HmkgML
VkL+qbwnVZmcirbyF6YRIqeMD54SyJ7zDU/iTAMn+VUATdF+Q2lrlF3hbmrP1N9h
UELV8gT4dht6k7p0wuGTvp/X/k/D2Bf5qTtBX++YPx2A+QvYGXppMe25WWLvkBS8
q8onzrpOQsjCTo0ppbM/duWqlDtv7ZaYFxjMW+b3yjCtYNTdGPeNe8akhnIWlXHR
iTy+aCGKOrwJ0lGbfXjJ4uQHXxtyTofFFKjIPRixWXSjW4HE84/RMlItuQMZZptP
WtGXePMpTPSekMz0Z+9CZbY/zMUZIZMSOrGMq+lVYSAEwehfkFU67A3IFqc0QWMd
QFduFLK2x5rHYh9U8OdaBWYcAtlnKuKcaW/ZURnyrMq/887c05+UcUCNrNvP3jQQ
sbrjmZK7XIAEBI13US57e2mLnznXrl4SPTJnECN8XWB3M/fOUvmfPii9dT2k0ZA3
NO+b90qZiSootfUiqvQpEcw5C6KOTER4BM4rc3nk6rOgHulIBRH1Z3VyWdJ3xu9X
dTNGJ9/o6kwUiEKOtnn9HmX0FayExnPd2ugIPVj1zAxIruVjNss=
=sPY5
-----END PGP SIGNATURE-----

--VgWmN/y+gdpL3I1L--


