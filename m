Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B055670C9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 16:18:11 +0200 (CEST)
Received: from localhost ([::1]:44124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8jNS-0007cC-83
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 10:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8jLg-0005cJ-44
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 10:16:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8jLd-0002Ig-EG
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 10:16:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657030576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VtwsOEyv3rN4+uZq012oV2mWbWo1NiRNEjaAnksZvEI=;
 b=dJn/r37e6RKworkNPxE5qi2gw6S6LCu1rw3lUzpV6o9xoBK9oP/sZU5ZkQXXXFesSydyty
 b62ydIHCPEwAhR6q+VXEE8KjXyOBE5YEIxWbVAEz0Cub9VTZUAgnwKwp30+KCOuPnCE1L3
 nuI/JWyu0HIcqpNe6LdbrnVXdNDY9dc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-mdpz0MLwOXC42ChcJVvGCQ-1; Tue, 05 Jul 2022 10:16:12 -0400
X-MC-Unique: mdpz0MLwOXC42ChcJVvGCQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D233F8339B7;
 Tue,  5 Jul 2022 14:16:11 +0000 (UTC)
Received: from localhost (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6ABDBC2811A;
 Tue,  5 Jul 2022 14:16:11 +0000 (UTC)
Date: Tue, 5 Jul 2022 15:16:10 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 2/8] block-backend: enable_write_cache should be atomic
Message-ID: <YsRHqqR2feXndU8z@stefanha-x1.localdomain>
References: <20220609143727.1151816-1-eesposit@redhat.com>
 <20220609143727.1151816-3-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zqGvRtKPcvbxglrv"
Content-Disposition: inline
In-Reply-To: <20220609143727.1151816-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--zqGvRtKPcvbxglrv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2022 at 10:37:21AM -0400, Emanuele Giuseppe Esposito wrote:
> It is read from IO_CODE and written with BQL held,
> so setting it as atomic should be enough.
>=20
> Also remove the aiocontext lock that was sporadically
> taken around the set.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block/block-backend.c | 6 +++---
>  hw/block/virtio-blk.c | 4 ----
>  2 files changed, 3 insertions(+), 7 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--zqGvRtKPcvbxglrv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLER6kACgkQnKSrs4Gr
c8gf1QgApqcT5O/IiK7R8ULOTnGei1y16fxeQAxVWhE0DvRTC+Oik/i6KXIwOwFe
AFTF5pTKxctVm93iRNaQ8qqNoyJFuSeqSYIZADzKeY8uUGVXDcPYTbOx5dkGUUdT
eIMg99vD9Uf/2khQSXGVIuaU4KAUgirC1zcLbOSbdraPTyN63602YbYKXHbDv6px
/9j/K/GYDdm4ZoTXAa/kKoKWrbjc0SPwGWyf2Qt9/8Lh1ZEJmZDhQe1tDbIdPgdP
2SaLu6tX2EPo/3K5jwNQphXQ3cMhKbuBuFgV8HJl5g7VOm/5o/LUabOW5FHauhkW
3/wEH0CzsFMCz8XsiEj0bgDUVdlnqg==
=uOOT
-----END PGP SIGNATURE-----

--zqGvRtKPcvbxglrv--


