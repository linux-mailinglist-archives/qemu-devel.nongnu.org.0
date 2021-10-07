Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4538042547B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:41:39 +0200 (CEST)
Received: from localhost ([::1]:56832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTeU-0005u4-88
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYTTy-0003Ai-0b
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:30:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYTTu-0002w9-VY
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:30:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633613437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ScrS88vuPnSLBBT17oilEwfS4w7UNFUR0FfDH6ic1v0=;
 b=MdNBloRUHAUbtqUOJY0NLgZYCxVRGO93q/ExD5Yjp2cHUn1mmg0MdudnwFXRYxMb5JrIPp
 m6rhULnFfb+A5ZOfPrXuxFubs9vYk51XGBW59sgjDhgM9dlDKz/NOIsX+bQkoJIPnuwTBk
 CF1D/3eeXFttyMjfVZGkYNTGeyh3D7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-HkqhcT78Pd-wtQk81_3nLA-1; Thu, 07 Oct 2021 09:30:18 -0400
X-MC-Unique: HkqhcT78Pd-wtQk81_3nLA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F82F1926DA1;
 Thu,  7 Oct 2021 13:30:17 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C405A2657F;
 Thu,  7 Oct 2021 13:30:02 +0000 (UTC)
Date: Thu, 7 Oct 2021 14:29:50 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/5] block/nvme: Display CQ/SQ pointer in
 nvme_free_queue_pair()
Message-ID: <YV72ThEbuM8o9pWS@stefanha-x1.localdomain>
References: <20211006164931.172349-1-philmd@redhat.com>
 <20211006164931.172349-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211006164931.172349-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MesSd1MR521Il2sA"
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--MesSd1MR521Il2sA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 06, 2021 at 06:49:28PM +0200, Philippe Mathieu-Daud=E9 wrote:
> For debugging purpose it is helpful to know the CQ/SQ pointers.
> We already have a trace event in nvme_free_queue_pair(), extend
> it to report these pointer addresses.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  block/nvme.c       | 2 +-
>  block/trace-events | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--MesSd1MR521Il2sA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFe9k4ACgkQnKSrs4Gr
c8hD+wgAnHrlwjjYo0i38ov7kuQAJe1VEzec0YpLRLn0lQcs7cdeE8vLIPqA2h5z
rXO05GDQ/4323GBcP0jKa8OtO838LSwe9IUJGbw4kEYH23b2oVKR/dVl/3N7lxYe
T5UFONnufW3eUwDd5TEAKITYgYXcanJ2R/79JZNjoShB6CLeHfMSGrviytdaJza3
oiKm+qjZ7TUrnJq+koFf5zTCEUuLTu7mwNc3nFsoidVogQpg9D4xPlHioJKqstDL
02OWh9LJrf47VbYvq8qPBQpj9Z9Npd44Gz7XTDscSjq2Md57aXr8p4dVh4Mb61P5
Qw9GaaAJWH5SWzY6LnlMP1ziwgeZbQ==
=V8z1
-----END PGP SIGNATURE-----

--MesSd1MR521Il2sA--


