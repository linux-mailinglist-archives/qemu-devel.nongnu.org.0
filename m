Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52009472446
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 10:35:31 +0100 (CET)
Received: from localhost ([::1]:45142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwhk1-0005tn-Sa
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 04:35:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwhiA-0003lU-0n
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 04:33:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwhi6-0003CI-2E
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 04:33:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639388008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KZOmConc0yW+RzizjS5fXEGDORxV1Z02rwj/598peOw=;
 b=ZtUYmo/shjBiLi4oQgNRoY7eB1mB9L902UYAARbFkC5yzqx8JSXUz2wRUby6D3XVpIT3i9
 /6FfbBZZrIpI1uppYMGPPlrMHgRnOaYGzLns1hWFDfZV51/o2XakgQnIWnoeqLpgK4XAV/
 0KnLLmRjg/1CzQx881lu2ukRfsznOa8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-6NXdAkGnPpGg2ZfeEi1H5w-1; Mon, 13 Dec 2021 04:33:26 -0500
X-MC-Unique: 6NXdAkGnPpGg2ZfeEi1H5w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62F911023F4E;
 Mon, 13 Dec 2021 09:33:25 +0000 (UTC)
Received: from localhost (unknown [10.39.194.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7DDE5BE04;
 Mon, 13 Dec 2021 09:33:24 +0000 (UTC)
Date: Mon, 13 Dec 2021 09:33:23 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL 0/1] Block patches
Message-ID: <YbcTY2A5Rqp9XGnd@stefanha-x1.localdomain>
References: <20211209152117.383832-1-stefanha@redhat.com>
 <CAFEAcA8mpWWZ0YS-FX8zCy6fZmCi_oznZ8c0N9mzyOqzVX1HMA@mail.gmail.com>
 <YbIv/yz/fLQq+eOP@stefanha-x1.localdomain>
 <6a2447a7-461a-2959-e680-caafa86b8af2@linaro.org>
MIME-Version: 1.0
In-Reply-To: <6a2447a7-461a-2959-e680-caafa86b8af2@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="A8ziIt38yGcKuxmI"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--A8ziIt38yGcKuxmI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 08:53:25AM -0800, Richard Henderson wrote:
> On 12/9/21 8:34 AM, Stefan Hajnoczi wrote:
> > > I'm not running the release cycle this time around, but: it's
> > > already rc4, pull requests by this point need a clear justification
> > > in the cover letter for why they're really release critical.
> >=20
> > It's late, this isn't a show-stopper (block/nvme.c is not widely used).
> > Let's leave it for the next release cycle and -stable.
>=20
> Good.
>=20
> Unless you want to re-issue with Cc: qemu-stable included in the patch, t=
his
> can be the first PR of the next devel cycle, since it's already here.  :-=
)

Thank you! qemu-stable can merge it separately. I won't add a Cc: tag to
the commit description.

Stefan

--A8ziIt38yGcKuxmI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG3E2MACgkQnKSrs4Gr
c8jhPAgAqCGp5hgJ7k7DhIUtyxVrE5bhBSMop6KQC1b7kV9NRIq0ip549vee/Jq9
VdaUKI9fjs6IODaW22bA7ZOBjWc34xvQHZ/9lnNYKNUtNgbuCKYig2ujW8JItu+G
AudwaxJhIPWWtT7VPaih5zAou77Rnq9Iv0OGD2kigB/PLK98j0sdKBUdxkbi6OKX
TDky0SXOgwvW+7RcWq6CSgKbVqA8HhFUuXB+By7jxv6KwvjO9mla249bBUK1TCPK
0znCLe2jnjYlf9SbOIFoXvcOXXIqWOxR7NKdGFzM5j2Qou9rAwWR/H7KKnJ7gnou
pWv8wXoSej7D+/9KwOnEf8ethXxEBQ==
=txXO
-----END PGP SIGNATURE-----

--A8ziIt38yGcKuxmI--


