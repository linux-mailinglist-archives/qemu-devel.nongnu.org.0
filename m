Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91690566EFB
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 15:12:59 +0200 (CEST)
Received: from localhost ([::1]:49192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8iMM-00012g-MM
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 09:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8iK5-0006gy-Lc
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 09:10:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8iK3-00089p-S0
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 09:10:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657026635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4IiBMTUXbYmQoax+kIKs3zoaPBM92YrzHYi6njHhgfQ=;
 b=glnvXgAcxBxBcH9885KS4uyBJPu+u0TUZhl7twVKvdTDH2yeYtytpRqlOkdEvI3k9M5FtF
 eO3dzx1AWU8oMHK6cqh2AB4WsSIJ0FCH8Xkt8Sfa3QY6vvBjQa2dHurJxfWrkkXdMehzcv
 +h1EouUoTK/ltM477Y7yfu/6m+nbV+8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-6Upc8zZuP9ClOgXNIxc2LQ-1; Tue, 05 Jul 2022 09:10:28 -0400
X-MC-Unique: 6Upc8zZuP9ClOgXNIxc2LQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8E4A89C7DC;
 Tue,  5 Jul 2022 13:10:27 +0000 (UTC)
Received: from localhost (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 452402026D64;
 Tue,  5 Jul 2022 13:10:27 +0000 (UTC)
Date: Tue, 5 Jul 2022 14:10:26 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v8 19/20] blockjob: remove unused functions
Message-ID: <YsQ4Qh4Guorm6fLG@stefanha-x1.localdomain>
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-20-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="U2jK7gbSmgD16UrS"
Content-Disposition: inline
In-Reply-To: <20220629141538.3400679-20-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--U2jK7gbSmgD16UrS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2022 at 10:15:37AM -0400, Emanuele Giuseppe Esposito wrote:
> These public functions are not used anywhere, thus can be dropped.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  blockjob.c               | 30 ------------------------------
>  include/block/blockjob.h | 33 +++++++++++++--------------------
>  2 files changed, 13 insertions(+), 50 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--U2jK7gbSmgD16UrS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLEOEIACgkQnKSrs4Gr
c8iWeAf7BlOuSZBSedvkuC0bf1fhjDW0lnxbieLtxnwupOm8LwIhoL778+lArWPC
XuUyXI6MlZ0SPm+Ca+Mw9QPdF7z+2V/DLdrsJy5AxVBi2YVIwrkvMuZFOvOEAd7h
ev07Rso628aI7FLGsYZaIo4+4reTmr4DH8Wy6CTcFW7ucPxhpc0csXsdxcfiuufd
w4DrIgyTYB5vyrvPcycUlJEXGu/ELgg2sAdJAe0mEr2Rtv9JuAXBVQmeWpqlaxb0
WCiNCdz51aMKEcAA/RyJ38jZb+62jdB3Tg8VeQ9T8mzEFpqcTbrhf2AY6IMYOWo2
0q1JvYZOO7trDVD5Q32b6s5HOnFX7Q==
=elQO
-----END PGP SIGNATURE-----

--U2jK7gbSmgD16UrS--


