Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BCF425585
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 16:34:08 +0200 (CEST)
Received: from localhost ([::1]:43402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYUTH-0005KQ-M0
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 10:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYURA-0002TS-Ij
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:31:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUR3-0003gU-KP
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:31:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633617108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bEB+SkJnoVTVaJUOTXDv4uGPgWR1jzs5M3llP4x8IOw=;
 b=MrZynijbnCrE0pbvRoBFhxnfRwWUuz1yNQnJvChOLO7sMujfL7FaLVBG9ZfskoCdNnb+4a
 G8UF0b0PMuHjH2hMSJzmZXNUfh87xCcVsswGExQqczlFWqKibt+zt5ht5YRYJUt9coir8n
 CqL12e5IxlBrR6krsU4Zq6FUfqKg3fc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-tju6VxQeME2z1FJVKVPPyg-1; Thu, 07 Oct 2021 10:31:47 -0400
X-MC-Unique: tju6VxQeME2z1FJVKVPPyg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6336E802B9F;
 Thu,  7 Oct 2021 14:31:46 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0929A5C1A3;
 Thu,  7 Oct 2021 14:31:45 +0000 (UTC)
Date: Thu, 7 Oct 2021 15:31:44 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 15/25] include/block/snapshot: global state API +
 assertions
Message-ID: <YV8E0FJssM5WbnsK@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-16-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005143215.29500-16-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TVTY0sJFmUl0J+QP"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--TVTY0sJFmUl0J+QP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 05, 2021 at 10:32:05AM -0400, Emanuele Giuseppe Esposito wrote:
> Snapshots run also under the BQL lock, so they all are
> in the global state API. The aiocontext lock that they hold
> is currently an overkill and in future could be removed.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block/snapshot.c         | 28 ++++++++++++++++++++++++++++
>  include/block/snapshot.h | 21 +++++++++++++++++++++
>  migration/savevm.c       |  2 ++
>  3 files changed, 51 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--TVTY0sJFmUl0J+QP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFfBNAACgkQnKSrs4Gr
c8jYUggAkiQ8mO2ShAlNSyozjgkovpmaPUP1PdqvRHXZ4g+P/fnES0SA1HpN8qrZ
oouaVcqZGs/hUBMzTwEWm3p8hMAyDMGPP1cpHU/boPk7ErsJM1PeMOt/XpRggf4D
1D2sokf8Bg3HgXjgGzmEeftJYc9g9EeKJixIIgM3IhVMWBzig3KE20CdpfBV6RIk
qLmdJZiSkq82ymHfsI2BnChuYhiyoK9jqALl5EfKPWa4ZEUXWqLhnfjr3Wphe1/d
lhyBCgffG21us19g1foJqREyZUq13k45h2dK2XMMMAfBlctI8evw8WdW3xP4ZEGm
fvutc2ZOiwT1lV8I3H7rCuHfO05Z/Q==
=j8jx
-----END PGP SIGNATURE-----

--TVTY0sJFmUl0J+QP--


