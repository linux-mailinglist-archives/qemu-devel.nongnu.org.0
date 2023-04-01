Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE9A6D32F5
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 19:48:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pifKD-0005wl-Dv; Sat, 01 Apr 2023 13:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pifK6-0005wZ-W6
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 13:47:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pifK5-0008RO-DU
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 13:47:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680371248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Tpmv0tauPOBvGbqc1nq7Ov8uWV37PBsSq5RSEzfDwtY=;
 b=Bvoxbso5hdBggwLIBROtYr6f4bAb8bewfRyXioroAqLD/qbV9aWUpUXWDatjVc64yWfxTE
 ktT9lyTuYhLt0rdYIDIdw1WrKLdp4YVxdS15W/8xMATnZa6DjUelExo9crnUjJk1i5jRr3
 GjhML29Tszr/xMjQDIp/Cl1h3Gz48dI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-npt-uvJMO6uPzsscwBdVvg-1; Sat, 01 Apr 2023 13:47:24 -0400
X-MC-Unique: npt-uvJMO6uPzsscwBdVvg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EB53296A600;
 Sat,  1 Apr 2023 17:47:24 +0000 (UTC)
Received: from localhost (unknown [10.39.192.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A32EF40BC797;
 Sat,  1 Apr 2023 17:47:23 +0000 (UTC)
Date: Sat, 1 Apr 2023 13:47:16 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alexander Graf <graf@amazon.com>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Philippe Mathieu-Daude <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [PATCH v4] hostmem-file: add offset option
Message-ID: <20230401174716.GB154566@fedora>
References: <20230401124257.24537-1-graf@amazon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3e0fe1/Rj+dSgInQ"
Content-Disposition: inline
In-Reply-To: <20230401124257.24537-1-graf@amazon.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--3e0fe1/Rj+dSgInQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 01, 2023 at 12:42:57PM +0000, Alexander Graf wrote:
> Add an option for hostmem-file to start the memory object at an offset
> into the target file. This is useful if multiple memory objects reside
> inside the same target file, such as a device node.
>=20
> In particular, it's useful to map guest memory directly into /dev/mem
> for experimentation.
>=20
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@gmail.com>
>=20
> ---
>=20
> v1 -> v2:
>=20
>   - add qom documentation
>   - propagate offset into truncate, size and alignment checks
>=20
> v2 -> v3:
>=20
>   - failed attempt at fixing typo
>=20
> v2 -> v4:
>=20
>   - fix typo
> ---
>  backends/hostmem-file.c | 40 +++++++++++++++++++++++++++++++++++++++-
>  include/exec/memory.h   |  2 ++
>  include/exec/ram_addr.h |  3 ++-
>  qapi/qom.json           |  5 +++++
>  qemu-options.hx         |  6 +++++-
>  softmmu/memory.c        |  3 ++-
>  softmmu/physmem.c       | 14 ++++++++++----
>  7 files changed, 65 insertions(+), 8 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--3e0fe1/Rj+dSgInQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQobiQACgkQnKSrs4Gr
c8iKcQf/To+jRH/7MnVX6NW2PXcW5UGpJ4tAACWZMBUBhFK5EJ06NI8o3xpd67VO
3VtG7KGyBpvjdWtILFYzuPJkui5ijVOHaAAcn0K3iNKihpe6NAGof6gcRv1n73pg
MgohFoCNMlNSfZEMS3HDT/gxQ2XSnaa4y+KtSHEd18MTNQICaVS0La5uDxwS1gqF
wIi7bXPkqgl7ETObWoOsd9DMyFWCUr3BKrnFyjti5HhmFMdBFPlsR+qWyh44hz/u
TacjdUVVRzlPhiqLHqumy3nSid2GRmllWMNW+J1vdV62y66BBvFBKmBgp4WthI9I
/OoqfZyiVIYC6f40AmYEzSZuQ7NWXg==
=6R3c
-----END PGP SIGNATURE-----

--3e0fe1/Rj+dSgInQ--


