Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F269B6F3660
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 20:58:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptYi3-00061K-Td; Mon, 01 May 2023 14:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptYhz-00060b-88
 for qemu-devel@nongnu.org; Mon, 01 May 2023 14:57:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptYhx-0003mm-RQ
 for qemu-devel@nongnu.org; Mon, 01 May 2023 14:57:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682967429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DZMELa2V+jckeqdUWAQ5MhrZYzOotmHY1e3HukUM8U4=;
 b=W2uBqpRsSh9LTlVDJ7zcnABe2B/XBtpVWPBC/sFdTHUqqYKeSsNXYOkyPsXcJAMX3k8Ml5
 PfGeQ4EVt7bWaHxPWD39h+9Fmtf/UxvQf/9snsU/vetuPoq42GQzKUFPZrxMrgD6yCb5Ba
 tufruD2sxJ+tylhId2MH2tiQZfx6y90=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-NOSJ7vSVMz-11pw1VXZcOw-1; Mon, 01 May 2023 14:57:05 -0400
X-MC-Unique: NOSJ7vSVMz-11pw1VXZcOw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C6BF185A790;
 Mon,  1 May 2023 18:57:05 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02AB0112132E;
 Mon,  1 May 2023 18:57:04 +0000 (UTC)
Date: Mon, 1 May 2023 14:57:03 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 10/20] nbd: Mark nbd_co_do_establish_connection() and
 callers GRAPH_RDLOCK
Message-ID: <20230501185703.GL14869@fedora>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-11-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XO/VzYoHIzJ+C5fu"
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-11-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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


--XO/VzYoHIzJ+C5fu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 07:31:48PM +0200, Kevin Wolf wrote:
> From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>=20
> This adds GRAPH_RDLOCK annotations to declare that callers of
> nbd_co_do_establish_connection() need to hold a reader lock for the
> graph.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  block/coroutines.h |  5 +++--
>  block/nbd.c        | 39 +++++++++++++++++++++------------------
>  2 files changed, 24 insertions(+), 20 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--XO/VzYoHIzJ+C5fu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRQC38ACgkQnKSrs4Gr
c8iSCwf/ceRNDns64E+xc4kK/i2G3v0DtNr7ynJxadpmkIY7hO19p1acS409GCiu
WWXAF8q1fkjoVgYrkaCWNBhurCpx5POaiUKfdV/O6zWVygVUJUwT3YN+YmE7WE9f
5aL3kDerPRBHgiHfsgtFcQ/4lr2HHvpK+AmXvwZOYGp+qKg2wJrXjVOOh5g61aZN
azgezAxQFnqJ/Zjjr1CsuQpKwDsa94jx3/cSAD7007iXAU6hjKjWCO0PeWT7QDto
EGSJpf12ikX6YF1sVTiQcpGZ7yFxlSEO09HdaiQY5Q1UR9dXEhsdqj/ChdOMDZ2z
PcgiqO7aSY/qtrClndp9wkmc5QHKWw==
=WSh/
-----END PGP SIGNATURE-----

--XO/VzYoHIzJ+C5fu--


