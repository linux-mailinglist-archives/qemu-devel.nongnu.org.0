Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A678C461797
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:09:42 +0100 (CET)
Received: from localhost ([::1]:35972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhLh-0007MC-P5
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:09:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mrhC3-00029l-Ih
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:59:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mrhBz-0004Oi-Nl
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:59:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638194377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dyqXseiGEUsLqn/U1S4B2HGT3zX7zPiM4x/4RxKID+o=;
 b=Vq0u2L2b7+nGqQnVJMm+O/Wt2IXqlDT1im2bUKyL+UQEIrDudSjSK2ftHKw76SlEmzn7dK
 fO53gZ+nmgZBZN3vpuwN2H75lHqGyDX9IBTX6uqcbc4uCdyLF3CD2sKsFDg3OT2tB8k7cu
 3z9KGrdeBF5BUO11Ws1nJEavfU+PH6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-6EnleUFIP52gtno7wNkaTQ-1; Mon, 29 Nov 2021 08:59:36 -0500
X-MC-Unique: 6EnleUFIP52gtno7wNkaTQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F3B710199A2;
 Mon, 29 Nov 2021 13:59:35 +0000 (UTC)
Received: from localhost (unknown [10.39.195.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC13B19D9F;
 Mon, 29 Nov 2021 13:59:34 +0000 (UTC)
Date: Mon, 29 Nov 2021 13:59:33 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 0/4] block: minor refactoring in preparation to the block
 layer API split
Message-ID: <YaTcxfnNf7I62ScQ@stefanha-x1.localdomain>
References: <20211124063640.3118897-1-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124063640.3118897-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1Hr9tT+J6f1QoRSi"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--1Hr9tT+J6f1QoRSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 24, 2021 at 01:36:36AM -0500, Emanuele Giuseppe Esposito wrote:
> These patches are taken from my old patches and feedback of
> my series "block layer: split block APIs in global state and I/O".
>=20
> The reason for a separate series is that the original one is
> already too long, and these patches are just refactoring the code,
> mainly deleting or moving functions in blockdev.h and block_int.h.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>=20
> Emanuele Giuseppe Esposito (4):
>   block_int: make bdrv_backing_overridden static
>   include/sysemu/blockdev.h: rename if_name in block_if_name
>   include/sysemu/blockdev.h: move drive_add and inline drive_def
>   include/sysemu/blockdev.h: remove drive_get_max_devs
>=20
>  include/block/block_int.h      |  3 --
>  include/sysemu/blockdev.h      |  7 ++---
>  block.c                        |  4 ++-
>  block/monitor/block-hmp-cmds.c |  2 +-
>  blockdev.c                     | 54 ++++------------------------------
>  softmmu/vl.c                   | 25 +++++++++++++++-
>  6 files changed, 36 insertions(+), 59 deletions(-)
>=20
> --=20
> 2.27.0
>=20

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--1Hr9tT+J6f1QoRSi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGk3MUACgkQnKSrs4Gr
c8in1wf/XlG7KWbs+KEd8uPxr+kG2VwBb+rHNdGCU1pVsV5t3JGqYeo26hR98lY7
gpvbOaDC9v37KusKG4cN/iOYCazSvnSHPJh9Gq7uRDUf1Al3pVyb9mJzk4hLD7x1
L33pNKEy+l7gEgLhev4xkGljMGx/Xm233P8Xp6fqexFFBTrH6L6w5G85htD2kY3y
+jNiJGPUA0v5/XJ9Ql8IEVUMiJGADdp7goDfGodL58BUg8hiFCcor9yfDWwhjiqE
YtjlzUZGVbhIJfkHKTOVKN3ZSqOGTzFnt7sPFkZm28LUtRscjX88eNTXZTGh938f
M3Aofn1FCFTj7QqWmWsaey3F8f1VCw==
=s7df
-----END PGP SIGNATURE-----

--1Hr9tT+J6f1QoRSi--


