Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EA54255DA
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 16:54:35 +0200 (CEST)
Received: from localhost ([::1]:35292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYUn4-0002oR-HQ
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 10:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUid-0004QE-NX
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:50:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUib-00062g-UQ
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:49:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633618197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2IsTsCTxjxztO8tNsL68EfviiRmoAFnDUq0R3l5mUpA=;
 b=XGPKG6LgHRJ4AXPWarIWvXCbSenmNqzqvPdPVovFyXs9agiCutm/mYECpjyuWsnh447K2h
 4EZhXASbSFFKril1q1BSwi6se3EJB3aV1O4sMkPxK/FlaRrkgvsknS6Tv4Y4jPPbCWJ84A
 LlUg0s/DxaGnZPSrLVWUV8/3K/R5GgU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-tlOXwZccMUmVryuVy1YKsQ-1; Thu, 07 Oct 2021 10:49:56 -0400
X-MC-Unique: tlOXwZccMUmVryuVy1YKsQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BF9EDF8C9;
 Thu,  7 Oct 2021 14:49:55 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D8DA26574;
 Thu,  7 Oct 2021 14:49:54 +0000 (UTC)
Date: Thu, 7 Oct 2021 15:49:53 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 19/25] block_int-common.h: split function pointers
 in BlockDriver
Message-ID: <YV8JEbSlCpgw/l09@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-20-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005143215.29500-20-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6oSAZtWyiq0UyNFv"
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--6oSAZtWyiq0UyNFv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 05, 2021 at 10:32:09AM -0400, Emanuele Giuseppe Esposito wrote:
> Similar to the header split, also the function pointers in BlockDriver
> can be split in I/O and global state.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/block/block_int-common.h | 472 ++++++++++++++++---------------
>  1 file changed, 251 insertions(+), 221 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--6oSAZtWyiq0UyNFv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFfCREACgkQnKSrs4Gr
c8i+bQgAxHViHKUlIxhduJNW+FpeC4jjuratwL6B1tVCWF5GiOSsfEow0fTsjd06
kMbJvyaJ48te+IASxFc6kQgEIexps8Lsk11gyNzLl7iH03M9yA3D94nDor2HgL7t
0/H2LMcvu0b8E97lTE1NjizhEBxFUbovYCOL34DCGiMIpY+g2K3/2SJZpWkBKyPQ
2eFK1yrhb/7ZoWTt9A2TfvHDnNAchS0lrI1c8aIcFGYcuNMbXX1eog8flJzLj33Z
yDqWRC7QQzGjv0X9laiR5Mn9jN5FjAelmrPPxCejdY/j7di8puvgoeE7eq0ng7Pb
aEa5OtH3Gb0dAwtmmv2AryBSa0ZBDw==
=wJ1h
-----END PGP SIGNATURE-----

--6oSAZtWyiq0UyNFv--


