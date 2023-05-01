Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C636F3670
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 21:00:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptYkT-0007b0-Mq; Mon, 01 May 2023 14:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptYkR-0007aM-IZ
 for qemu-devel@nongnu.org; Mon, 01 May 2023 14:59:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptYkP-00042e-38
 for qemu-devel@nongnu.org; Mon, 01 May 2023 14:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682967580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fbQPCd+ugMG7qsyvzwLJOFc7pbZ8bSWTf8m+qI6FaOY=;
 b=GKPjfznx9n7TXpdNBo29BZMOxOaprNzmck8fVgHY9DuZygIWjEgvxefLPgk3MlBauG6+5b
 8woa3pNM1+d4O9zIiSCLX4qVKyz9ixsjWND1mHJR6gW+9YW1E+vmKEpkv3yNEQPnp4oyKw
 IN9ZXEf6b+OxHlYXxbvQuuWCsQ9C860=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-ty5VWx-qPKyjAUxMxwTb3A-1; Mon, 01 May 2023 14:59:36 -0400
X-MC-Unique: ty5VWx-qPKyjAUxMxwTb3A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28295800047;
 Mon,  1 May 2023 18:59:36 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81D7F492C13;
 Mon,  1 May 2023 18:59:35 +0000 (UTC)
Date: Mon, 1 May 2023 14:59:33 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 12/20] mirror: Take graph lock for accessing a node's
 parent list
Message-ID: <20230501185933.GN14869@fedora>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-13-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="d7gqc4FkTCMk0y8x"
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-13-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--d7gqc4FkTCMk0y8x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 07:31:50PM +0200, Kevin Wolf wrote:
> This adds GRAPH_RDLOCK annotations to declare that functions accessing
> the parent list of a node need to hold a reader lock for the graph. As
> it happens, they already do.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  block/mirror.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

The commit message is misleading. This commit does not take the graph
lock, it declares that the caller must already hold the graph lock.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--d7gqc4FkTCMk0y8x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRQDBUACgkQnKSrs4Gr
c8ii9wf+OJXVc3NoWcAXTlh5tOSbysFgJkewmuzxm7dtOrjo4esNVXcLw53tefL1
VTsL6woUIdPFM+Ex+rKSKaJ+WJxwcgmanlylPchjncW1eXcqU9rUHEyP5UVBn2GO
lzbSqbBBV5jngDFzErDNTZqcZanR73vnDuMzSbFeKaXx9bs3LyCrGwPEGPu/i3Rk
ChNbDF9X8uPdxN4pSCMpLBaW1nIBdKIqyu1Biy0CyNG47hbsVCYQJTfDKYv1sjeC
cER2dwJLgAdwyIHfRgpmx9YxfZkff2jWpjFLsjK3W+5hu2VGdcHKZQhgd3s4nwHY
71LOI/j50VeNSw3G4sUdds7oaOIvLw==
=4PB+
-----END PGP SIGNATURE-----

--d7gqc4FkTCMk0y8x--


