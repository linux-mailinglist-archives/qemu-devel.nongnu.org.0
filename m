Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA2845B87E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:39:46 +0100 (CET)
Received: from localhost ([::1]:47088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppgo-0003kR-3q
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:39:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mppFX-0001HJ-1v
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:11:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mppFP-0000mS-S2
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:11:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637748687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kH03oxk5aMRUfRn1TjwDPsq6jjEOHDGnf2vw3KSlPZc=;
 b=OBSSmsQ4L7LYTRuGKEbiPyZzjJYU1ze4e+YKZ02ZcnfbFA20JxQpjbm0KzZFBijC4FOqRq
 nAODmfzgq3j87dwv7n/g3aJtek3FU+QlvhQieUVy7D6erM5gYPAU9dkFMxBiE4OS4Hr5gF
 TwBcuewzWrKHp645r12fiQzg9kwwQyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-R4k6IFE-Pq6OTjPPMndx6A-1; Wed, 24 Nov 2021 05:11:23 -0500
X-MC-Unique: R4k6IFE-Pq6OTjPPMndx6A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3B0D835E20;
 Wed, 24 Nov 2021 10:11:22 +0000 (UTC)
Received: from localhost (unknown [10.39.195.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5814E72437;
 Wed, 24 Nov 2021 10:11:22 +0000 (UTC)
Date: Wed, 24 Nov 2021 10:11:21 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [qemu-web PATCH v3] Add Sponsors page
Message-ID: <YZ4PyT26uHZiUgjk@stefanha-x1.localdomain>
References: <20211124080519.440677-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124080519.440677-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vtbbEKATlwWRnGfl"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Thomas Markey <admin@fosshost.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alistair Francis <alistair23@gmail.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--vtbbEKATlwWRnGfl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 24, 2021 at 09:05:19AM +0100, Philippe Mathieu-Daud=E9 wrote:
> Add a page listing QEMU sponsors.
>=20
> For now, only mention Fosshost which requested to be listed:
> https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg05381.html

I don't know if Azure Cloud, PLCT, CIP United, and ARM wanted QEMU to
list them as sponsors. Sometimes organizations do not want others to
claim an association with them. Are there links to email threads or
pages where they asked to be listed or gave permission?

Without that info reviewers don't know whether it is appropriate to list
these sponsors.

Stefan

--vtbbEKATlwWRnGfl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGeD8kACgkQnKSrs4Gr
c8hrgQf/d53at42Ts8Y2CLsCDf9lh+s/UfIBVBn/ZTszJ92vBkoojN2o7kRtP9v2
/GUn5EzTzSh7WvLA4NE+TllQrEvloFqzzEHVkQaGV9Y0q8DoIcdhiab6VVMAHZ4u
lBqqRnJ3xiujQm7ugLJM3/VA3sfmT7+rPzxnkABAyEKdGHrtukpR22BLsLt2RXtl
68OuGg1Rg1VIDcCTgvv/ZK4vB01CChSs53C4U3SaMUhwdo5lfCGP32Z3uUgEE7kB
MRJF9X9coNi8gVEErPVAyTFX9SKTpCOxOkYXj7bGGBoEvj0pnNB0E/FP+FbdfmtS
twvyvJ0LPHiaYO4B26wXlPEkKrfn1g==
=yU0m
-----END PGP SIGNATURE-----

--vtbbEKATlwWRnGfl--


