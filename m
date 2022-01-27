Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EACB49DDC1
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 10:19:41 +0100 (CET)
Received: from localhost ([::1]:55510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD0wO-0007dd-OG
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 04:19:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nD02y-0005Jx-Sy
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 03:22:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nD02s-0004uN-Q5
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 03:22:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643271654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OYtX3ZNn+eaPsvnBpDMezCwWUInmrR5WRjylcIBQt0g=;
 b=fsauyQwFmzyrbAI68LmUh8EgXjEIv3d52GDqnHgtemlT7lKaRT/cgLyKQuWiC139+R2EBs
 hW6uQV0gTLwzBCuG223Z6UuyDzkPlZQABMxBNFyAzrO/rS5jJS+KdsL4YZo12Sz45Rt9ql
 5UKGeo0tsDx6RrFKILwZO3+5ideLyz8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-NGbqKqWQN-WDD949mSreWw-1; Thu, 27 Jan 2022 03:20:53 -0500
X-MC-Unique: NGbqKqWQN-WDD949mSreWw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4B3E18A08C3;
 Thu, 27 Jan 2022 08:20:51 +0000 (UTC)
Received: from localhost (unknown [10.39.193.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 371624EC80;
 Thu, 27 Jan 2022 08:20:50 +0000 (UTC)
Date: Thu, 27 Jan 2022 08:20:49 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 5/7] docs/qapi-code-gen: update to cover trace events
 code generation
Message-ID: <YfJV4cb8H+nKIlnx@stefanha-x1.localdomain>
References: <20220126161130.3240892-1-vsementsov@virtuozzo.com>
 <20220126161130.3240892-6-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="q48kQ5TdWhcZmkVs"
Content-Disposition: inline
In-Reply-To: <20220126161130.3240892-6-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org,
 armbru@redhat.com, hreitz@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--q48kQ5TdWhcZmkVs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 26, 2022 at 05:11:28PM +0100, Vladimir Sementsov-Ogievskiy wrot=
e:
> Previous commits enabled trace events generation for most of QAPI
> generated code (except for tests/ and qga/). Let's update documentation
> to illustrate it.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  docs/devel/qapi-code-gen.rst | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--q48kQ5TdWhcZmkVs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHyVeEACgkQnKSrs4Gr
c8hQiwf/fhg20OkwyYKnA/xlfg0LDqdQdbYBxhmuxHjXL72Sc3kpLqa9qKeqeumn
tmT6pRCh0sQbWP1k2ov03RgzGZqRPt7dP9YH49DgQ46OBkKz4A41iWeAG0DS9GqE
uVakeAno03RoII0Fra0dKHjyue6iBRML73pSjfNbsdvI4A2r2+ovsw4yUpyt8C6t
AWXr//NiK74l5xFVnWk/ouJc0Pnkv2OALqPg1MBKJebIEGu+UERwOJvFLo9mCG1C
CqRowMz1cTD1OuHoydfLs95JWiAmTTPrM247C53FesRkqgj7D3ZvI2dbMCa9Drea
QUVsKTP3vlSnOHpIhKpMUEMbDkS1ow==
=C83I
-----END PGP SIGNATURE-----

--q48kQ5TdWhcZmkVs--


