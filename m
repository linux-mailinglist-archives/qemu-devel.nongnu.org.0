Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BB4509F89
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 14:23:23 +0200 (CEST)
Received: from localhost ([::1]:41036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVqD-0003O2-Rj
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 08:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nhVOw-0007pA-3C
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:55:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nhVOu-0001AQ-AH
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650542107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qc5lW6VdCG0JiwD1bGmcjg2pMxUnU9yAilSrjaetnl8=;
 b=Zqe06A7mOk71fb5BRcLWR58RHQzFn1RI4hk9XJ59Qlro6Haa67dDHch2gD3BxlVp6gNxj2
 P0NrtuopvvjMbN7go1ZZiClfWs5Qhb7fHp/2FmjdPB6MQjNMAVOa4cd0zfuxDUZlwWfrXD
 A9R6zBvHV6RBSzxDMlDdDLf0WxDFMBU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-QQfSVZyOM6uhoN1dfHVJuA-1; Thu, 21 Apr 2022 07:55:03 -0400
X-MC-Unique: QQfSVZyOM6uhoN1dfHVJuA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2CEE802809;
 Thu, 21 Apr 2022 11:55:03 +0000 (UTC)
Received: from localhost (unknown [10.39.194.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 187FCC33AE8;
 Thu, 21 Apr 2022 11:55:02 +0000 (UTC)
Date: Thu, 21 Apr 2022 12:26:24 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 04/26] coroutine: remove incorrect coroutine_fn annotations
Message-ID: <YmExUOU21d5NMSak@stefanha-x1.localdomain>
References: <20220415131900.793161-1-pbonzini@redhat.com>
 <20220415131900.793161-5-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sn5FqAvSoslTUJA+"
Content-Disposition: inline
In-Reply-To: <20220415131900.793161-5-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, marcandre.lureau@redhat.com, hreitz@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--sn5FqAvSoslTUJA+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 15, 2022 at 03:18:38PM +0200, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/qemu/coroutine.h | 2 +-
>  util/qemu-coroutine.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

This one is easy to audit because the implementation of
qemu_coroutine_get_aio_context() definitely does not require running in
coroutine context. :)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--sn5FqAvSoslTUJA+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJhMVAACgkQnKSrs4Gr
c8jGKAf+InKXzOE/yEQ9oZm9HjHwHbwdIOVXT/cKaKGP/InSdsPGHGuNdQNGykgP
sZ7BnG4ArzPkGiKDUkGyxJ24NZVPgwNp5oEQ2wArGLKbwSnKFqr2JrMaPPQ7ZoZ5
qByOQlHYrHyMKbOmeNmOTfaePX8cM3O9MajruZTeIBiYWrDB9BD4TDsNmG1/m+xR
qffHnb4Gs+ygtT2qaN2Vr/RpvKOhMMm7196mSud/wB0yHnxbXejTVW5fdBsIbAEL
8iKkBBKp5pMbm6pAcgB4fv68EF487FBd9jW6NbwQc1KboizYTgzs99gIgCJHxMY5
6/XQGHVjU8uytv8z2T2wj9AFZuVJZg==
=EC/O
-----END PGP SIGNATURE-----

--sn5FqAvSoslTUJA+--


