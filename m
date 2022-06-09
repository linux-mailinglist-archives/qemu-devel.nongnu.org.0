Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72D15451A1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:12:21 +0200 (CEST)
Received: from localhost ([::1]:37850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKle-0002hI-R8
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nzKTm-0003B3-QT
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:53:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nzKTl-0005fB-As
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:53:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654790027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OXhJTA59b0sLVYzTe/maOVka46kY8Hp85wyt4zjn318=;
 b=SM0CwglpetXKHUJ2bIiTmsJYcnC5GR30pVkxX0XrrxTDhKOs/xqvfLFAWGwvmdI/CPZAtU
 Y03p6umXuAeqDXuCLkVsPNTsku+5Gyj6pQ1+YjW9tjxaNxDxOIYJ9VXjbsh0bZNj8W7zYw
 eb+9iqhc+NxM/pWouiqOtPq/ZYeuvqM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-i0DeylkBN06eRjVDVUTEkw-1; Thu, 09 Jun 2022 11:53:44 -0400
X-MC-Unique: i0DeylkBN06eRjVDVUTEkw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA7A7185A79C;
 Thu,  9 Jun 2022 15:53:43 +0000 (UTC)
Received: from localhost (unknown [10.39.193.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8854D456CD5;
 Thu,  9 Jun 2022 15:53:43 +0000 (UTC)
Date: Thu, 9 Jun 2022 16:53:41 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] main loop: add missing documentation links to GS/IO macros
Message-ID: <YqIXhdHvZedgVFRr@stefanha-x1.localdomain>
References: <20220609122206.1016936-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pf22hyXMUkbxSY+B"
Content-Disposition: inline
In-Reply-To: <20220609122206.1016936-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--pf22hyXMUkbxSY+B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2022 at 08:22:06AM -0400, Emanuele Giuseppe Esposito wrote:
> If we go directly to GLOBAL_STATE_CODE, IO_CODE or IO_OR_GS_CODE
> definition, we just find that they "mark and check that the function
> is part of the {category} API".
> However, ther is no definition on what {category} API is, they are
> in include/block/block-*.h
> Therefore, add a comment that refers to such documentation.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/qemu/main-loop.h | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)

Great, thank you for the patch!

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--pf22hyXMUkbxSY+B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKiF4UACgkQnKSrs4Gr
c8hP8wgAt2jerxy4t6IbXyr4si9Ao0hUjAgWrnVU9iePjnks6C7LPau1twI5ikMy
tpFKqsZCUsomYnQA78CeRTLRdVONwXJHBJ08H3zxLeMzpY3PIglmK+CBQ8yFeYzF
w1MkB9TfaedQN2T4tO3OjdQEmwQz1q3ORxrFVRVQl5qkZxC5wSOKezcnv9bluHK0
t3P+V5tUk1e1Ypmfd2Yp8VOUQCjG1KUk4A60QlnrGanSw7ebC50X451WuZZOj1kW
WTIzbUASPQjXqdoQIEBYfCzm+8HjQi5fql6ps+a7VoXg/iYSsi94OpLMbqSaBOg5
X4SwSnjr6Q+Kqa+7JeNOUf+LOUVj/Q==
=16KV
-----END PGP SIGNATURE-----

--pf22hyXMUkbxSY+B--


