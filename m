Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D24624AED
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 20:50:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otDXj-0003FT-5E; Thu, 10 Nov 2022 14:48:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1otDXh-0003FL-SW
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 14:48:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1otDXg-0007mw-HZ
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 14:48:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668109731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4UfzrblUXLsk9wyFyCrLDqkY3SYGypu3fN8vTyqzY60=;
 b=dGPHWx4+TP2KnsKmamr++u/JpRZIRnwfJY4QL8Hy5B2DiiaTpN8D3Ppsrtu6ULthJHelLN
 JP8T4mSpHZYOf4zH2quz7zi5zuHlFzRMHkY1gK1HzL/elYPhDZdrKai9h0TRwrn2EtZJ7d
 F3VOXZp3l7RhWwuIEjXSpDUIPbB15H4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-_7MeDjPwNtqJrsNVE5Yc0A-1; Thu, 10 Nov 2022 14:48:49 -0500
X-MC-Unique: _7MeDjPwNtqJrsNVE5Yc0A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72A7785A583;
 Thu, 10 Nov 2022 19:48:49 +0000 (UTC)
Received: from localhost (unknown [10.39.192.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6BCE141511F;
 Thu, 10 Nov 2022 19:48:48 +0000 (UTC)
Date: Thu, 10 Nov 2022 14:48:46 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, eesposit@redhat.com, hreitz@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 05/13] block: Inline bdrv_drain_invoke()
Message-ID: <Y21Vnnz9kZZxd1hG@fedora>
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-6-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6p1xx2M159F5encK"
Content-Disposition: inline
In-Reply-To: <20221108123738.530873-6-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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


--6p1xx2M159F5encK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2022 at 01:37:30PM +0100, Kevin Wolf wrote:
> bdrv_drain_invoke() has now two entirely separate cases that share no
> code any more and are selected depending on a bool parameter. Each case
> has only one caller. Just inline the function.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  block/io.c | 23 ++++++-----------------
>  1 file changed, 6 insertions(+), 17 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--6p1xx2M159F5encK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNtVZ4ACgkQnKSrs4Gr
c8gTtwgAqRL/pwqxhI5JB2RKXXP85B6zGtI8Z84lWnyVNkyjmoqF45P3FnXIRlk6
uaSv/UEOOdH2wxo1Ly0+MnNOETe45uAWB3jhq1jA1xYL3BBmQ480hOhDzEuOn/Df
DLDZIJSd2AJbH3ipUlHm2BkuDBc3yqh+9Epr9NEtDFuxg36LZsLsnKcejXG6bw0d
LIkDQNBnHXRm86ErldMPY4koorgH/OuCmDrgb6XziwoF3dg111Cja1FJKAJkdQX/
dQYhMD+HxaMS0zvum4grp7UHhuUpjqmZS7g4cDcCDGvweo5RMIS/TVgA10eNSvHT
8nmR1OKCNOXV7oh42Pb0HqpEMbG04A==
=8Le8
-----END PGP SIGNATURE-----

--6p1xx2M159F5encK--


