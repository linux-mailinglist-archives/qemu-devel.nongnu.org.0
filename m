Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E48E343655D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:12:32 +0200 (CEST)
Received: from localhost ([::1]:33770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdZk8-0004Dn-1o
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdZh7-0000pk-B4
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:09:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdZh5-0003Br-R7
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:09:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634828963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YiZzr0cCM5t2VHfHaUNELBotq8o+QCTqUsELo/rCZXI=;
 b=E253N67PE9WwaXJyH+q/7r+0yFt/9+zOxiiIZ3TCAPn6Tlb75FE8DAgadAaPAil58VJrAl
 /NJ9tgZ+YPVpYrd7MYjPKlIXxAC7HktcuoKVwrKJ4GS1KJNbaQjJRKb5qQ0nQF0fsQ+xzL
 QkfWmfC8AMTEJ/lxGSsD7B+PQhFZNAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-ZGhckibBMkWjDE7JN4xFkQ-1; Thu, 21 Oct 2021 11:09:20 -0400
X-MC-Unique: ZGhckibBMkWjDE7JN4xFkQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F2AE8066F1;
 Thu, 21 Oct 2021 15:09:18 +0000 (UTC)
Received: from localhost (unknown [10.39.195.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FEF817155;
 Thu, 21 Oct 2021 15:09:17 +0000 (UTC)
Date: Thu, 21 Oct 2021 16:09:17 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v3 08/25] block: introduce assert_bdrv_graph_writable
Message-ID: <YXGCnSEjibVnaN+5@stefanha-x1.localdomain>
References: <20211012084906.2060507-1-eesposit@redhat.com>
 <20211012084906.2060507-9-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211012084906.2060507-9-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DQJKq9HCqZPdwcDR"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

--DQJKq9HCqZPdwcDR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 12, 2021 at 04:48:49AM -0400, Emanuele Giuseppe Esposito wrote:
> We want to be sure that the functions that write the child and
> parent list of a bs are under BQL and drain.
>=20
> BQL prevents from concurrent writings from the GS API, while
> drains protect from I/O.
>=20
> TODO: drains are missing in some functions using this assert.
> Therefore a proper assertion will fail. Because adding drains
> requires additional discussions, they will be added in future
> series.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block.c                                |  5 +++++
>  block/io.c                             | 11 +++++++++++
>  include/block/block_int-global-state.h | 10 +++++++++-
>  3 files changed, 25 insertions(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--DQJKq9HCqZPdwcDR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFxgpwACgkQnKSrs4Gr
c8gqDggAwO26NltlVYQ2d2x+wUDUmCUSmKwv+jXMJTJYVWu1d4TQNlfRCMzJthGt
8NN4OK/kYrTBlpRui9WIJFHHWp7sw3uEzQ1jtnMpNdZoJekmQ+rA9mvWsuzdDOa0
yYeav6lC0YUgSu7QABFu3M76fmLstHYSAym96HJVK2INY+cO+CwNELNFPgzbk5vr
8vfDVA0G66Nvu5JobtfOlcLycNkDZmNs6Tfj8NIvrnvC8uXAN6D/sXKZ5ChPzCFq
n/4U8N433K0li+CBZ2jeZlvUivj4KnnCCTIhuBucrkFNrgxgQCrp3opJH+bfUzAj
JGvyDskzvxN+ovG5thKAPWzXpQJ4fw==
=hzqV
-----END PGP SIGNATURE-----

--DQJKq9HCqZPdwcDR--


