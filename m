Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D900425613
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 17:06:15 +0200 (CEST)
Received: from localhost ([::1]:51650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYUyM-0005gf-2O
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 11:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUkr-0007t1-6M
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:52:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUkn-0007wT-8B
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633618332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UMShTri7cVJa73EybJ6G+dAL/ajOGKRFlXjz+FK3XpY=;
 b=A/S7oQbwDL8Edz1YNl/Z0Gx1j7TBSwfww4yWuic5h1xzOGMsAFe3aj2Fr8vJrVh8kh1MUo
 3l2uE0VeCX7NIJu9cqce8V9qO5b1nJea+WDV83WIEiARbHYLpYl9wRtt/cm9JK0jVL8Q3g
 PiSR7bchLlYLUaC0pBYsqul1qOsQ8EA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-kHZY1tTJOhiUp4yz0j36KA-1; Thu, 07 Oct 2021 10:52:09 -0400
X-MC-Unique: kHZY1tTJOhiUp4yz0j36KA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DF79145B6B;
 Thu,  7 Oct 2021 14:52:08 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0159E6091B;
 Thu,  7 Oct 2021 14:52:07 +0000 (UTC)
Date: Thu, 7 Oct 2021 15:52:06 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 23/25] block-backend-common.h: split function
 pointers in BlockDevOps
Message-ID: <YV8Jlsiw/Lknqh62@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-24-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005143215.29500-24-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FQ33CKL2n1K5kCwK"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--FQ33CKL2n1K5kCwK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 05, 2021 at 10:32:13AM -0400, Emanuele Giuseppe Esposito wrote:
> Assertions in the callers of the funciton pointrs are already
> added by previous patches.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/sysemu/block-backend-common.h | 42 +++++++++++++++++++++++----
>  1 file changed, 37 insertions(+), 5 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--FQ33CKL2n1K5kCwK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFfCZYACgkQnKSrs4Gr
c8jHZwf+JrF3ZdDfJAB3hxAaNvmpasMcP3ix4SXfapxo6cK1HV6YlQRKCc1aNhmo
cZuFDoTinblDCiq4EkUvP9wgQYRRscAOdyUiBdl/kmabh6/5TXLASDc0mjs1P+F5
09ANzmXULtW8upPdyZKgBdu2TebdwCtWIrUG3rLdGCFKTBcyE7zTGGEPgJ5usOHP
BrLJvh1BC/Ca6gF+epRvkPdIEyqgE2jKYLwXxKCiPzpNjrT5zCPKeVpDWD/fPJeY
Q4WZCDGqpOZKNDfx/e20lDm5B98zJogKRmZD7Pc9F/0s0TeySXYKct1kQnwbqZ8e
P1yEg2DelLG6V3EHXF/cNAScHdElag==
=m15J
-----END PGP SIGNATURE-----

--FQ33CKL2n1K5kCwK--


