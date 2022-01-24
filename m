Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14136498480
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 17:19:26 +0100 (CET)
Received: from localhost ([::1]:35820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC23w-00030X-N5
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 11:19:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nC220-0002DG-Qp
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 11:17:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nC21x-0006tI-Mi
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 11:17:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643041040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tpUjLr5VT4kyG1FqogE5n95Sbb9JDhX0Wa5cGAbDuWw=;
 b=Xzn9lN2n1qyC3vr1k1ltg0Su999Lc9XQpwObt15Ca5v0x1moOzLCL4IPgdPbex122JLz3R
 uYjVynOGD/YyAMoEzT6wwZ1gen+wGHSbiml4nErpJ4HiJIG8AbRVd6x9xZqU8fHlegyLrF
 67oq0TuVI0ySC0tlm5rNqEYuz6PhQE0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20--oIaEEh7OU23DiQysMi8Vw-1; Mon, 24 Jan 2022 11:17:16 -0500
X-MC-Unique: -oIaEEh7OU23DiQysMi8Vw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AECFB1083F66;
 Mon, 24 Jan 2022 16:17:14 +0000 (UTC)
Received: from localhost (unknown [10.39.195.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62C6274EAE;
 Mon, 24 Jan 2022 16:16:28 +0000 (UTC)
Date: Mon, 24 Jan 2022 16:16:27 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v3 3/3] softmmu/physmem: Introduce MemTxAttrs::memory
 field and MEMTX_BUS_ERROR
Message-ID: <Ye7Q24HKWs7B5ode@stefanha-x1.localdomain>
References: <20211215182421.418374-1-philmd@redhat.com>
 <20211215182421.418374-4-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ji34wkwpYJK1vjdQ"
Content-Disposition: inline
In-Reply-To: <20211215182421.418374-4-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Ji34wkwpYJK1vjdQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 07:24:21PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Add the 'memory' bit to the memory attributes to restrict bus
> controller accesses to memories.
>=20
> Introduce flatview_access_allowed() to check bus permission
> before running any bus transaction.
>=20
> Have read/write accessors return MEMTX_BUS_ERROR if an access is
> restricted.
>=20
> There is no change for the default case where 'memory' is not set.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  include/exec/memattrs.h |  9 +++++++++
>  softmmu/physmem.c       | 43 +++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 50 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Ji34wkwpYJK1vjdQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHu0NsACgkQnKSrs4Gr
c8gfvwgAmgAM2qyQhFncOB6OhEqtjkXn9HAN3sVNR+82ApnRUbvLXa+3mZhwKuyZ
WImb157OnljaDPgoRBhk+w41VH6CJL3stIxFcZhtIcaImAsLGSvqCuMC+Bp0v0/g
Ru4RsJ0HzFpcUshgzop0d3mLMhXODbPVDUdfSc72C3r79vMV/80kC8t24qWDL7Q5
g89Wt/eLUgx8o0PEjolk1mRn5gmdfeoYl1pmQaV6EEfRDdcALCeMaz5M3ZY9o/v4
UKYcCI91hWD8R13thdrxvx55f7wuD78hooEAwieomzju7BaZLr6jIIvunwk4WWLu
9YQa8Z+wG8XZ+cens+AjvDD2k3Y9Og==
=tfwu
-----END PGP SIGNATURE-----

--Ji34wkwpYJK1vjdQ--


