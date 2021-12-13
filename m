Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2014730D8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:47:23 +0100 (CET)
Received: from localhost ([::1]:38052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwnXt-00016v-V8
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:47:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwnSQ-0003Li-1k
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:41:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwnSO-0001zF-ES
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639410096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=564tUc2n6vOX/xxyju3koXYxrvnkhkC11+BI2bjk2Lw=;
 b=EvX61QtLFzT0IZW9fXWAjTDvkEJ3xDaG6PyelhvjcbvD4b2PYAnZkLHZMSYl2aHBWtuEaj
 0MMi24L8SpvKYHNcgFZV3oklT4W9IN14Ufn1dhji14PvlgD8lNLXFyJ40YLqFNbZDbGKzM
 tTPm/wUoHCqv2p+opjzg+deMwrX+D/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-105-v3wyv-azOva8j9wAubRtfQ-1; Mon, 13 Dec 2021 10:41:32 -0500
X-MC-Unique: v3wyv-azOva8j9wAubRtfQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B908993920;
 Mon, 13 Dec 2021 15:41:31 +0000 (UTC)
Received: from localhost (unknown [10.39.193.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A3B85FC22;
 Mon, 13 Dec 2021 15:41:31 +0000 (UTC)
Date: Mon, 13 Dec 2021 15:41:30 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v2 3/4] include/sysemu/blockdev.h: move drive_add and
 inline drive_def
Message-ID: <Ybdpqgo/+gc5B5Ps@stefanha-x1.localdomain>
References: <20211130094633.277982-1-eesposit@redhat.com>
 <20211130094633.277982-4-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211130094633.277982-4-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="N2VAJAsV6wHB0DNB"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--N2VAJAsV6wHB0DNB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30, 2021 at 04:46:32AM -0500, Emanuele Giuseppe Esposito wrote:
> drive_add is only used in softmmu/vl.c, so it can be a static
> function there, and drive_def is only a particular use case of
> qemu_opts_parse_noisily, so it can be inlined.
>=20
> Also remove drive_mark_claimed_by_board, as it is only defined
> but not implemented (nor used) anywhere.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block/monitor/block-hmp-cmds.c |  2 +-
>  blockdev.c                     | 25 -------------------------
>  include/sysemu/blockdev.h      |  4 ----
>  softmmu/vl.c                   | 25 ++++++++++++++++++++++++-
>  4 files changed, 25 insertions(+), 31 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--N2VAJAsV6wHB0DNB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG3aaoACgkQnKSrs4Gr
c8j/ugf9GggQED4GWdtJF5v3C0IeuYgywtx2qN+SpOI2TnswYHkGSW61cLmfL0lb
8pXBZrrSbVyPGF/MjXzWx0/m4P3YggHlIxbI02geY5xlYNwK1Wtb1zZsgDhB6Rh4
OyAGmoQkQ9f795No8KZOJV1CofHAHxbl8rPictsH6ocBD1M987yZ9Yn8e49H+N9B
3Fcupz5RU83eIErVNruFfESjoJDq1ttiDzvEYZJf6hACIKjMbRI3r3Vu31dHwtBQ
pOqol8IPYfhn8f2BV1EJ4pKGYHVgcjeVqEuLL6A+69sU1ShmAtYIykPiAj6ik6Cm
fSCSnwrvjsaq46ygbGxVD6h7pYnq6w==
=Nv6t
-----END PGP SIGNATURE-----

--N2VAJAsV6wHB0DNB--


