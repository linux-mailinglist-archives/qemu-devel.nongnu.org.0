Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D2B6F367E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 21:07:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptYsC-0003Za-LK; Mon, 01 May 2023 15:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptYsA-0003Z8-FH
 for qemu-devel@nongnu.org; Mon, 01 May 2023 15:07:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptYs8-0005Z6-UQ
 for qemu-devel@nongnu.org; Mon, 01 May 2023 15:07:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682968060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DXkjKVwHl4PSJ8pQG30bU8BVSpj8eiJ8dvxXzIkFHUA=;
 b=fwr6SriZjsPtGipU7ynf3/p6DkjQ5jIunK6NpFPlBiZETyZJ1l3xhYsDLBn8sGRZ5+Dcxe
 dSU6dD/z1AlekkHbBxG2weAUpCFaVsL1u1/kPmp2S1tTKH187Ib4EW7gyiXkU14L3MU5C2
 a/8Afbgf3rp5fv0im0KmI0VSqdNBU1k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-Rnrund6KNHiWsOyx0H3P3g-1; Mon, 01 May 2023 15:07:36 -0400
X-MC-Unique: Rnrund6KNHiWsOyx0H3P3g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36F46185A7A4;
 Mon,  1 May 2023 19:07:36 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9068340C6E67;
 Mon,  1 May 2023 19:07:35 +0000 (UTC)
Date: Mon, 1 May 2023 15:07:33 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 16/20] block: Mark BlockDriver callbacks for amend job
 GRAPH_RDLOCK
Message-ID: <20230501190733.GR14869@fedora>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-17-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lzoa/t+MuQrvu/Xi"
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-17-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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


--lzoa/t+MuQrvu/Xi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 07:31:54PM +0200, Kevin Wolf wrote:
> From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>=20
> This adds GRAPH_RDLOCK annotations to declare that callers of amend
> callbacks in BlockDriver need to hold a reader lock for the graph.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/block/block_int-common.h | 12 ++++++------
>  block/amend.c                    |  8 +++++++-
>  2 files changed, 13 insertions(+), 7 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--lzoa/t+MuQrvu/Xi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRQDfUACgkQnKSrs4Gr
c8gKHAf+Pyxk8o2vsNlBaU755DkKRqlBMd6JkJnJwaL2TWPjaewH75UiaUYo1tCL
yjKkFS0kCqviM9JUqfZM+1SELqiZbdotmQPI1BoD8ur8F+iAXFpNoCEnkyI58dwW
fQce+ZPLI6TSPhV4TrelKIYxatXGzo1JVHC3myQkBLMJaiRHnUla+Ov9Pzdhcunk
bOrnhM5u8CG+GXIS/s9T7WQSzbKjhPqjNXKa65m7kBXu+z8/6sU/mAhPooGN1EvW
c0vW4QX2WNl1wKB4RYrK/2j8AgK6De+yFAyZ2n6w6sgvc8c7HxYUwMGUlW7XCvSt
Iq8H/iY2S0mcBZWw85V0Wx4PtUFCfw==
=xbC0
-----END PGP SIGNATURE-----

--lzoa/t+MuQrvu/Xi--


