Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A496ACAE3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 18:42:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZEq6-00072Q-2o; Mon, 06 Mar 2023 12:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pZEpz-00070l-8a
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:41:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pZEpx-0006Fg-Ph
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:41:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678124485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+Em9IOxeLXXIWDMB0+tGlF6aGCrjqBPiwafaasAZXqQ=;
 b=fq9gr6e6jY43IfHQpKmef4zHFk7Yz5Hxahue5LqFQeo3OJhk7H3fDrqQpKrcboZDC0RKZi
 hxVJFrtgsLKjKZ4/mF6YtaFIp67m15ukoJdvP0aOq2t9tgDweG9gTcFIa7qiQvqlocJd41
 FzH7f6IDBSya+vaGhRhU7frO7FF9eaM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-gds5Tls5OByYFum-R3B0Dg-1; Mon, 06 Mar 2023 12:41:21 -0500
X-MC-Unique: gds5Tls5OByYFum-R3B0Dg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 182E71C02D36;
 Mon,  6 Mar 2023 17:41:21 +0000 (UTC)
Received: from localhost (unknown [10.39.195.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94BC540B40E4;
 Mon,  6 Mar 2023 17:41:20 +0000 (UTC)
Date: Mon, 6 Mar 2023 12:41:18 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 19/20] tracing: remove transform.py
Message-ID: <20230306174118.GA66132@fedora>
References: <20230304181900.1097116-1-richard.henderson@linaro.org>
 <20230304181900.1097116-20-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dcnYs+JohD+hDXC/"
Content-Disposition: inline
In-Reply-To: <20230304181900.1097116-20-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--dcnYs+JohD+hDXC/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 04, 2023 at 10:18:59AM -0800, Richard Henderson wrote:
> This file, and a couple of uses, got left behind when the
> tcg stuff was removed from tracetool.
>=20
> Fixes: 126d4123c50a ("tracing: excise the tcg related from tracetool")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  meson.build                    |   1 -
>  scripts/tracetool/__init__.py  |  23 -----
>  scripts/tracetool/transform.py | 168 ---------------------------------
>  3 files changed, 192 deletions(-)
>  delete mode 100644 scripts/tracetool/transform.py

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--dcnYs+JohD+hDXC/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQGJb4ACgkQnKSrs4Gr
c8i5Uwf+PKtK0J9M7HQuicrED5q+foAz98svNl0K8bIIWjO0MFnwOm1NAgJ9nZNG
IvTgm1gBK6WZj3Z1XMAKSu+zNJpcrgnH6oYQ/ISghFAZuQJ5UNjsYR70pOn7kpRR
oyzAcOcJAOuIgH+70PI3Ife+u/LaPjsR7oN6BiD1Ne9RSTSTmzgwmcNoaT/736if
uGire8tSszrZ3xXMbNH4FhKQh2Vevm/c+mp+S6/ggpNrhNmqhsGok8GNKnx7vRlR
E5XHydnpSkWFD0riWnxW3wSkT58HsNS58b3vQWsXz0mKet7NtDKk4s5RSymC4IYB
Yln5p/Lq3BB6lqQ6YiKmdlChfNJPoA==
=EeA0
-----END PGP SIGNATURE-----

--dcnYs+JohD+hDXC/--


