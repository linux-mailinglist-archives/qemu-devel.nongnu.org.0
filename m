Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B52FB4D15F6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:14:41 +0100 (CET)
Received: from localhost ([::1]:36442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRXnc-0000Zr-Rs
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:14:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRXmQ-0008GT-T7
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:13:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRXmL-0001zF-Vh
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:13:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646738001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u1zA6UE2qgYn3eJrDhUGJlVfrbrXDtcgI4JnWdPHCmc=;
 b=gZf1nELZwWG15IF69V/VgJQfYKHXQjLRDyUGAcJ5jpBdoF3CrbCrGxkjZrgg3KlAMFDqir
 212d3558FBcA9tUTVmdUyK0vDxdbb1gbHe9dldSYTPhP3os1Zbu3AakusNn22OpTGETLjo
 uqN/i49xeAZ0Rlu57A1zfhL9YPhcWBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-iOBfEdjCOhm-ivPInbzBYw-1; Tue, 08 Mar 2022 06:13:20 -0500
X-MC-Unique: iOBfEdjCOhm-ivPInbzBYw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B79981006AA6;
 Tue,  8 Mar 2022 11:13:18 +0000 (UTC)
Received: from localhost (unknown [10.39.193.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1080C22E14;
 Tue,  8 Mar 2022 11:13:10 +0000 (UTC)
Date: Tue, 8 Mar 2022 11:13:09 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v5 16/20] commit and mirror: create new nodes using
 bdrv_get_aio_context, and not the job aiocontext
Message-ID: <Yic6RfILIsNDZ6ex@stefanha-x1.localdomain>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-17-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1Jv/y6KoGtoaFVxt"
Content-Disposition: inline
In-Reply-To: <20220208143513.1077229-17-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--1Jv/y6KoGtoaFVxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 09:35:09AM -0500, Emanuele Giuseppe Esposito wrote:
> We are always using the given bs AioContext, so there is no need
> to take the job ones (which is identical anyways).
> This also reduces the point we need to check when protecting
> job.aio_context field.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block/commit.c | 4 ++--
>  block/mirror.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--1Jv/y6KoGtoaFVxt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmInOkUACgkQnKSrs4Gr
c8i1JQf+Lsu9cNXy9poeDhsRgmjXUPywWCGAoT5uqHmbYGaiTqrz1pTHOiWMXJMn
MLqjypJ44sdT0pgmWqLSvtS/G21irKuVr6sBr4VVFOwMSf12VEnFy1BZKTDS1W50
SgDuj7X5lRDu5z9JYLu8gfcanEPsdUpzbkSAOnXtmuZ6ldmX/ZS/YnUkMky0W/ft
eFQ1bLCLghOJjYV+4Y5/WvBK93d6CLoWtMYIWUEul3Q70Mphhv9hxlKSSbqPWMVg
qF7SkAAvSUamCWPIgyDSu+GKe96YN3XSCRzdUc3O+wDJCZfJhbGvfEuXIa6lt6+w
40wwlHVFeuce1XNfk+WkAhRjyfRJnA==
=TXg2
-----END PGP SIGNATURE-----

--1Jv/y6KoGtoaFVxt--


