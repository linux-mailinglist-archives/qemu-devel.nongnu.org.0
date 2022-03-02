Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F754CAA3C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 17:32:25 +0100 (CET)
Received: from localhost ([::1]:43284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPRto-0007MB-CD
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 11:32:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nPRnf-0005lg-Jr
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:26:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nPRne-000863-7I
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:26:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646238361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ebrpmhzzMWyi6koE6wpvXdH/sxw8xx9xtiqxxE6+EsU=;
 b=PqoXfRQg4Dl5hympv1Pgr/BmQtpMuVBUr7Z+MCjRDGb8jbouvu76MDllUFVueun6ZJnYmt
 o+lsTdirvbbmk9zDhV60hch4oP5tYOzKVQ72dUSdEYw2BX5hdMOP7q57GY+MW9+84KTxo/
 djnkoDkEGabjkqpTKdYPWtuUUECLqdw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-8wqLTSBzOyWxxqGMDckgpA-1; Wed, 02 Mar 2022 11:25:57 -0500
X-MC-Unique: 8wqLTSBzOyWxxqGMDckgpA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4A14801DDC;
 Wed,  2 Mar 2022 16:25:56 +0000 (UTC)
Received: from localhost (unknown [10.39.195.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33E337C023;
 Wed,  2 Mar 2022 16:25:32 +0000 (UTC)
Date: Wed, 2 Mar 2022 16:25:30 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 3/5] block/io.c: introduce
 bdrv_subtree_drained_{begin/end}_unlocked
Message-ID: <Yh+aetDTHHw2l0eQ@stefanha-x1.localdomain>
References: <20220301142113.163174-1-eesposit@redhat.com>
 <20220301142113.163174-4-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="c4mQP3dQzZ3MZhYZ"
Content-Disposition: inline
In-Reply-To: <20220301142113.163174-4-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--c4mQP3dQzZ3MZhYZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2022 at 09:21:11AM -0500, Emanuele Giuseppe Esposito wrote:
> Same as the locked version, but use BDRV_POLL_UNLOCKED.
> We are going to add drains to all graph modifications, and they are
> generally performed without the AioContext lock taken.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block/io.c            | 48 ++++++++++++++++++++++++++++++++-----------
>  include/block/block.h |  2 ++
>  2 files changed, 38 insertions(+), 12 deletions(-)

Looks okay but I hope we can get rid of the non-_unlocked versions soon
to avoid adding extra APIs and supporting both locked and unlocked code
paths.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--c4mQP3dQzZ3MZhYZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIfmnoACgkQnKSrs4Gr
c8jFkwf/cWyRhr2gFSBOEYBYxks/lP4KXG3bUjRb924IXP1eo6FRFlGRAqdHQ+hU
J47YKJ6MBIQba2XGYFFHRfJyFmKXpr66PLQyud1toL4uUf+1AX7L0UsxCrGDT2w3
l6Z2RFhvKs5qlrBwOQqIunbYaSdJAdLsVypCFxha6t3FwyrZlcgybrthINSNPpDP
yhLGIL6FooKF14ePL6S9v9p9sYg4khNbL739VEdbjegyhw03JXNPO9Xj9gsMkAg+
dWlEjUJtcbcbifPIUYZr2JJOp6B/r23nlsZgWRnd5Cq8UjIIwqK9Q6/iXHLCR3R0
3AaEs0Et2OVyaqUM9u4G0Q6Ky8YOBQ==
=1EvM
-----END PGP SIGNATURE-----

--c4mQP3dQzZ3MZhYZ--


