Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74957436453
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 16:33:03 +0200 (CEST)
Received: from localhost ([::1]:45932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdZ7u-0006A5-1Y
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 10:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdZ4D-0002RC-AQ
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 10:29:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdZ48-0006Q3-Mb
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 10:29:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634826546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kB6/wsQBBXYphBPk/fIHvoAnhgqaYAuxJp88s23OKCg=;
 b=WVwCMIptUXlEYpfChIKkkiCelrqodViQT/EVaAn3hb1+QuNkM0Y8dxkDqbTd7vND8Tf8aK
 kwVvS1hEgEOPzvn3eOe7NUgQ266pZrbGVuBFHOkBCepSkzezKHNHlbIMuT/r2lgfxvodaE
 Akz0psBcVTwwbun4o6jVfHXJsImHlZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-AiI8eV0HMZifL6mlW8_BHw-1; Thu, 21 Oct 2021 10:29:05 -0400
X-MC-Unique: AiI8eV0HMZifL6mlW8_BHw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2237EBAF82;
 Thu, 21 Oct 2021 14:29:04 +0000 (UTC)
Received: from localhost (unknown [10.39.195.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4B0F19D9F;
 Thu, 21 Oct 2021 14:28:58 +0000 (UTC)
Date: Thu, 21 Oct 2021 15:28:57 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v3 04/25] include/sysemu/block-backend: split header into
 I/O and global state (GS) API
Message-ID: <YXF5KedAVqgWwf4A@stefanha-x1.localdomain>
References: <20211012084906.2060507-1-eesposit@redhat.com>
 <20211012084906.2060507-5-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211012084906.2060507-5-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="o4ZW2wM9Nyi/3bvz"
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

--o4ZW2wM9Nyi/3bvz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 12, 2021 at 04:48:45AM -0400, Emanuele Giuseppe Esposito wrote:
> Similarly to the previous patches, split block-backend.h
> in block-backend-io.h and block-backend-global-state.h
>=20
> In addition, remove "block/block.h" include as it seems
> it is not necessary anymore, together with "qemu/iov.h"
>=20
> block-backend-common.h contains the structures shared between
> the two headers, and the functions that can't be categorized as
> I/O or global state.
>=20
> Assertions are added in the next patch.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block/block-backend.c                       |   9 +-
>  include/sysemu/block-backend-common.h       |  74 ++++++
>  include/sysemu/block-backend-global-state.h | 122 +++++++++
>  include/sysemu/block-backend-io.h           | 134 ++++++++++
>  include/sysemu/block-backend.h              | 264 +-------------------
>  5 files changed, 339 insertions(+), 264 deletions(-)
>  create mode 100644 include/sysemu/block-backend-common.h
>  create mode 100644 include/sysemu/block-backend-global-state.h
>  create mode 100644 include/sysemu/block-backend-io.h

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--o4ZW2wM9Nyi/3bvz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFxeSkACgkQnKSrs4Gr
c8gyjgf/bfwEUE0goRvj4+JUk4kQXqRPjkx7zNfZkNlrZbBeU1SkcDyRQUJk5BKJ
s92xMQvT8NImP/6waKt/h+RwwCIM9/IgmORMtHsJdDc43/Y5WYfD93qkMkHtOJwg
hLNzrTegjd2mmCG8AS097iZauwqwVPPKVaf1P13KQLXl91/e+yMEe7Aws0azJ/eY
r+9twZkKmBMgO8jr0tHCBX+yXnpQT09E8ojofQCTnfDwmhIRowb8PL4YtZj/T6Hc
6QEi3K6/zOGk19T8UgsOChlYmBLUpwDI6xLRvAvwPUVC9UssKrzmoVqH3ZQcIv14
GYF0R7UiQ+m3Phd9X5q9Vo8LIrfqKQ==
=GvCt
-----END PGP SIGNATURE-----

--o4ZW2wM9Nyi/3bvz--


