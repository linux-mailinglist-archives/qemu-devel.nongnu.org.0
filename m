Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A67C4730EE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:53:38 +0100 (CET)
Received: from localhost ([::1]:52102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwndx-0002Dd-AJ
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:53:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwnSi-0003mL-BI
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:42:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwnSg-00022M-Kn
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:42:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639410115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6CPOJfwA/snGlwFVy8SrwUOvfwTlF+KxoMdp8YMDQts=;
 b=KzbBe55Jl6rLP0LErNam3H62xBWeWaTASOYt2Uzuc6HMWUX5obaz0b5s9xIVD+8ddBqRkY
 amBfNr8kaFPLaEo9Jr+YWIk3NVdaMd1GupZOWu52xypEZCUAC6h/VYqrBSerrn22u8QLED
 rBmTiAFD+/+6URqq4JYPsHQGQZcFk9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-109-OOz6N3RBODS08v6xtuzrWQ-1; Mon, 13 Dec 2021 10:41:52 -0500
X-MC-Unique: OOz6N3RBODS08v6xtuzrWQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8054C93931;
 Mon, 13 Dec 2021 15:41:51 +0000 (UTC)
Received: from localhost (unknown [10.39.193.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 097B45E24E;
 Mon, 13 Dec 2021 15:41:50 +0000 (UTC)
Date: Mon, 13 Dec 2021 15:41:50 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v2 0/4] block: minor refactoring in preparation to the
 block layer API split
Message-ID: <Ybdpvs1pfGAWvl3m@stefanha-x1.localdomain>
References: <20211130094633.277982-1-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211130094633.277982-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TBRr1584ABp+tNl2"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--TBRr1584ABp+tNl2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30, 2021 at 04:46:29AM -0500, Emanuele Giuseppe Esposito wrote:
> These patches are taken from my old patches and feedback of
> my series "block layer: split block APIs in global state and I/O".
>=20
> The reason for a separate series is that the original one is
> already too long, and these patches are just refactoring the code,
> mainly deleting or moving functions in blockdev.h and block_int.h.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
> v2:
> * Apply Philippe comments, instead of renaming a make if_name
>   public, create a getter method (discard old patch 2).
>=20
> Emanuele Giuseppe Esposito (4):
>   block_int: make bdrv_backing_overridden static
>   include/sysemu/blockdev.c: introduce block_if_name
>   include/sysemu/blockdev.h: move drive_add and inline drive_def
>   include/sysemu/blockdev.h: remove drive_get_max_devs
>=20
>  block.c                        |  4 ++-
>  block/monitor/block-hmp-cmds.c |  2 +-
>  blockdev.c                     | 47 ++++------------------------------
>  include/block/block_int.h      |  3 ---
>  include/sysemu/blockdev.h      |  6 +----
>  softmmu/vl.c                   | 25 +++++++++++++++++-
>  6 files changed, 34 insertions(+), 53 deletions(-)
>=20
> --=20
> 2.31.1
>=20

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--TBRr1584ABp+tNl2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG3ab4ACgkQnKSrs4Gr
c8j04wf+L0+uiNpl20uBoSlJDeNu56mEe2ugHkD5b0sLvC2w1ocxiQOuHJ6E6lLt
YoRLSbX/NCrTgJumps6glj7j5WTurahK+J08mQnYDnl8GCY1tKiYpoXkdd/qhiLn
hobEiowdo1hmNHgWrdVQjIY5PzI5ho7dpKYiFEjysiGJAfAbF09MUqu8iIqr6lkr
Ii95GQNvAm5wgKrsRWVnvZiQJ/tQUJ+cy0Fj9qPNi4CAvzGuszSjq7HYVJMC3W36
EeHHfqgQ2kOJ6+NPpR7B8NAodzpZoMQ+v0PRNDDo2VRc0C92ms46YHWficM2Zg04
5JPIIbObOgAqYLKSojibYfgetJHg+Q==
=9Eds
-----END PGP SIGNATURE-----

--TBRr1584ABp+tNl2--


