Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CAB6F32B8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 17:20:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptVJr-0002Wc-1e; Mon, 01 May 2023 11:20:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptVJo-0002VN-Bo
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:20:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptVJn-0003JB-1S
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:20:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682954398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6jRHf/29afgpm+ctvZ7rpkHx9r3WMi/Vpxnv8geSGWc=;
 b=WErr8shsoIzjTTkVpv/1Bq/XumMHDt1vVPSWdAdOskdOE7a8017E0hoSgpLpUowJVJoHRk
 hQBPpbioSJleFGM6FFb2bLyErRAXIUbB/fIJTOZSTgZfcXJU/8mNop+GUYBuK6agfIHcnc
 BkPEYBP0V0VoRrZr0x2JwVZjaxo/+so=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-V2S9TYwsPD-7o_25qg4yRA-1; Mon, 01 May 2023 11:19:39 -0400
X-MC-Unique: V2S9TYwsPD-7o_25qg4yRA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A00B33C16E91;
 Mon,  1 May 2023 15:19:24 +0000 (UTC)
Received: from localhost (unknown [10.39.192.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E1E5400F4D;
 Mon,  1 May 2023 15:19:23 +0000 (UTC)
Date: Mon, 1 May 2023 11:19:22 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 01/20] qcow2: Don't call bdrv_getlength() in coroutine_fns
Message-ID: <20230501151922.GC14869@fedora>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-2-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="opDhPctWWoDugrp7"
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-2-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--opDhPctWWoDugrp7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 07:31:39PM +0200, Kevin Wolf wrote:
> There is a bdrv_co_getlength() now, which should be used in coroutine
> context.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  block/qcow2.h          |  4 +++-
>  block/qcow2-refcount.c |  2 +-
>  block/qcow2.c          | 19 +++++++++----------
>  3 files changed, 13 insertions(+), 12 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--opDhPctWWoDugrp7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRP2HoACgkQnKSrs4Gr
c8gLFgf/RBMn1K3CvQGlNrEDV3vSFgKl6qq5hUVf05qCOIt1aSi5ii3dSR7PM1/3
aED3aXhhjVwnBD045cIre2bWvVPM27chk6tiyk+e/SbB2SaQfpuImAwUFD8GGryr
LraboJcyUJ1hGWI9X9YuLjv8YMVPT+E+SnvRXfSmAUs9oXyrdn2Bu+jWJep1fKzn
iw1lrUld6LERg/aWb8klD3v/Qz8dxFvsccsyLGCinsjYQVd8dFIqkeiGbh6j4hoY
0D7OpleImLMGiaQXtK1m9n+7K57xbC+j0TMAicL/2ZUJ6ZDdlubtQYImMJErnuPh
JAt87OwA8Tmw6Od4uQERWdCKKU0cVA==
=uMKO
-----END PGP SIGNATURE-----

--opDhPctWWoDugrp7--


