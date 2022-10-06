Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1466C5F6B81
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 18:22:49 +0200 (CEST)
Received: from localhost ([::1]:57438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogTe3-0004Ia-Nj
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 12:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogSfp-0004ap-Pg
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:20:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogSfm-0006GN-88
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:20:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665069629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d9PVicglgcNbGIvi0xhRD5ykSx3pg4GT4b7S9raAoSY=;
 b=i/eqb4YjYkGwM0bFim8oMZtGBrJ+JumDZi/cdGGpw0drna+ue6k7bhVNeGZ4QqniURadtL
 lL2DmLvkM6yYJZ1BvVhsxLkKsqR/7HN23tXq1xl7x3eZGnwBmHbyI7a1SnZ9+h10mVfjSM
 eAcQOZLSoI3VmfW2uEzsVWw2sHqOuxQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-kebGq-3mO--4Tx9BoyrDQg-1; Thu, 06 Oct 2022 11:20:25 -0400
X-MC-Unique: kebGq-3mO--4Tx9BoyrDQg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A69E1C0BC69;
 Thu,  6 Oct 2022 15:20:25 +0000 (UTC)
Received: from localhost (unknown [10.39.193.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF4D74EA5D;
 Thu,  6 Oct 2022 15:20:24 +0000 (UTC)
Date: Thu, 6 Oct 2022 11:20:23 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org,
 Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH] coroutine: Make qemu_coroutine_self() return NULL if not
 in coroutine
Message-ID: <Yz7yN0vpU5SZlUZx@fedora>
References: <20221005142006.926013-1-afaria@redhat.com>
 <Yz2yAWVMUrkaCNYY@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+xp33WwmNLLA7K3o"
Content-Disposition: inline
In-Reply-To: <Yz2yAWVMUrkaCNYY@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+xp33WwmNLLA7K3o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 05, 2022 at 06:34:09PM +0200, Kevin Wolf wrote:
> Am 05.10.2022 um 16:20 hat Alberto Faria geschrieben:
> > qemu_coroutine_self() is used in several places outside of coroutine
> > context (mostly in qcow2 tracing calls).
> >=20
> > Ensure qemu_coroutine_self() works properly when not called from
> > coroutine context, returning NULL in that case, and remove its
> > coroutine_fn annotation.
> >=20
> > Signed-off-by: Alberto Faria <afaria@redhat.com>
>=20
> The coroutine_fn annotation for qemu_coroutine_self() is wrong, but I
> think it already works outside of coroutine context, and consistently in
> all three backends, by returning &leader.

Yes, I remember implementing it specifically so that NULL is never
returned.

The coroutine_fn annotation should be removed.

Stefan

--+xp33WwmNLLA7K3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM+8jcACgkQnKSrs4Gr
c8iFTAf/QlsAOvjZuccN7Pcfach2zTs8F5nFEu7buyX21Crgwd7gjjlE/GPyYeIi
gG7cSakkwuV3FjaiHp2+j0KQko9ARLZhUR/Z31A9zajEbPQkalFFtuot+ptI3109
tFuBML69iKdYUR01nbgfjkYkwLoxwQmd4nMyVTil4kKL4TE3+FOyWp6pwsYMg8X5
1KzwoQzwks/Z4MmthQIXYK3bKkiaZymzDXuvD4DL8r7QaGI88aZdqPCg64tYJF0o
08UPDMeZo5fx1ndmtxHvUOKj5j4NyAYhpMnZQotYbDOPIKOiY8wi4bWZwft/MCGu
1OJVaEdSLZ+6HwBaXszM7Vi0PRsFsQ==
=aRCt
-----END PGP SIGNATURE-----

--+xp33WwmNLLA7K3o--


