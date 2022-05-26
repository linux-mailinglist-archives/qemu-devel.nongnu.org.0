Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DC7534C96
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 11:37:52 +0200 (CEST)
Received: from localhost ([::1]:45080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu9wE-0005vY-Es
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 05:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nu9N3-0002Dd-FR
 for qemu-devel@nongnu.org; Thu, 26 May 2022 05:01:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nu9N1-0006vu-S4
 for qemu-devel@nongnu.org; Thu, 26 May 2022 05:01:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653555687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zP1tBWFknBlcAGEh2mqRomSDItsDSx61g9SKzLxonLE=;
 b=QtZ8pPUldoksxcFlpFRrqGxVmSpY2hRcHJ8RT+qVIstsLaM65Ov/H1LbOGTsFz4gwHaIbV
 W5mq+MjPsEFQtmA0pCy1K78xaxpj33bQw5zKn6j1b5VYa1yVddA73JdOhII7+dK7j+KUpr
 DbPRXboMuEXHXIegKHpoNohzkT5AUl8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-7s0T8dsCNaqeajFI0imLSQ-1; Thu, 26 May 2022 05:01:24 -0400
X-MC-Unique: 7s0T8dsCNaqeajFI0imLSQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DB77811E7A;
 Thu, 26 May 2022 09:01:23 +0000 (UTC)
Received: from localhost (unknown [10.39.193.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 023281730C;
 Thu, 26 May 2022 09:01:22 +0000 (UTC)
Date: Thu, 26 May 2022 10:01:22 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jeff Cody <codyprime@gmail.com>, Fam Zheng <fam@euphon.net>,
 Ari Sundholm <ari@tuxera.com>
Subject: Re: [PATCH v3 09/10] block: Use bdrv_co_pwrite_sync() when caller is
 coroutine_fn
Message-ID: <Yo9B4gSGr7+0l+PD@stefanha-x1.localdomain>
References: <20220519144841.784780-1-afaria@redhat.com>
 <20220519144841.784780-10-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k0VrK4iwkTWnl/S6"
Content-Disposition: inline
In-Reply-To: <20220519144841.784780-10-afaria@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--k0VrK4iwkTWnl/S6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2022 at 03:48:39PM +0100, Alberto Faria wrote:
> Convert uses of bdrv_pwrite_sync() into bdrv_co_pwrite_sync() when the
> callers are already coroutine_fn.
>=20
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
> ---
>  block/parallels.c      | 2 +-
>  block/qcow2-snapshot.c | 6 +++---
>  block/qcow2.c          | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--k0VrK4iwkTWnl/S6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKPQeEACgkQnKSrs4Gr
c8gUbwf+Ol8NzJbLnVs863Cvn4BLB/BQIw5fSu3ks9Qn+W2VGNqJbFGB2itES4/C
U0yhsYP3iAspQXVX5p0DccsjfhNna4ckN7LNmcaBBsR684uipzYeaStDbhrdEUMl
NRXQD5C99lcGY8ylrgTW/OlffyN8jG8YdL4U/m2+vKIKFBKufqaSML4i0T1FUjFt
YLlDWjI8GfAH42VMd9N9eqPpDoAu9Smnx4L3S8LpoSaSYK3Tpbxs9dOMO9qRGl24
L6xW2bkiwednjskHsNHPoEhDNU9A6JLAgNAdcXQcOdbROY9ljbct26RgEyY/kEK2
akHbq5JvudukrEnf0bM4uolsg1MF6g==
=DwsJ
-----END PGP SIGNATURE-----

--k0VrK4iwkTWnl/S6--


