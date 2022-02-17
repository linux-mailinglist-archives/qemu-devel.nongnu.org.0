Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 940A24BA382
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 15:50:05 +0100 (CET)
Received: from localhost ([::1]:56678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKi6e-0008NW-BT
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 09:50:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKhGf-0001tG-8a
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 08:56:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKhGc-0004XA-Dy
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 08:56:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645106177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IsoNOWlkBKvaHjTfkpuw6/FVcqQx/E9omsC89WjQ1DY=;
 b=QUHQpVbBe781fDM0SAx9FtRkvagjK3v8yp/WXs8LCTXg9HMqSwa+5E4MS/DXk6aN5EwsOk
 g44rFb7GxguojpqTMsf1tP/KpGY64E4xFTdIK0N1y7AmBlH+3NfElqRKxbhH17t+pINK0r
 kO5rqkYwg3Y5vScjYBadfK+I1cXV+98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-aeKUMoRgOj2u7lYpAZfI6Q-1; Thu, 17 Feb 2022 08:56:14 -0500
X-MC-Unique: aeKUMoRgOj2u7lYpAZfI6Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BE3C8144E1;
 Thu, 17 Feb 2022 13:56:12 +0000 (UTC)
Received: from localhost (unknown [10.39.194.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 025CD752AC;
 Thu, 17 Feb 2022 13:56:09 +0000 (UTC)
Date: Thu, 17 Feb 2022 13:56:08 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v5 05/20] aio-wait.h: introduce AIO_WAIT_WHILE_UNLOCKED
Message-ID: <Yg5T+NGgwMWll+hE@stefanha-x1.localdomain>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-6-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kceYshB7ETOCDe3J"
Content-Disposition: inline
In-Reply-To: <20220208143513.1077229-6-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--kceYshB7ETOCDe3J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 09:34:58AM -0500, Emanuele Giuseppe Esposito wrote:
> Same as AIO_WAIT_WHILE macro, but if we are in the Main loop
> do not release and then acquire ctx_ 's aiocontext.
>=20
> Once all Aiocontext locks go away, this macro will replace
> AIO_WAIT_WHILE.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/block/aio-wait.h | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>=20
> diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
> index b39eefb38d..ff27fe4eab 100644
> --- a/include/block/aio-wait.h
> +++ b/include/block/aio-wait.h
> @@ -59,10 +59,11 @@ typedef struct {
>  extern AioWait global_aio_wait;
> =20
>  /**
> - * AIO_WAIT_WHILE:
> + * _AIO_WAIT_WHILE:
>   * @ctx: the aio context, or NULL if multiple aio contexts (for which the
>   *       caller does not hold a lock) are involved in the polling condit=
ion.
>   * @cond: wait while this conditional expression is true
> + * @unlock: whether to unlock and then lock again @ctx

Please document that this only applies when waiting for another
AioContext from the main loop thread. It's ignored otherwise.

--kceYshB7ETOCDe3J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIOU/gACgkQnKSrs4Gr
c8gmZQf+OT4g0PYOjqWN5nEErLrptCYq5mCQ35K2MwwH9r7JOFIxWimu29PkH/X0
LlosabWIrLZtEOUzsoH+HkVuuI1SNcsewOc//c2v7+ArW26FwhbmFRQ+JoZRM/PK
1D4qfFOQlnJizKhYobyuTN4/FFYm5HRZ+lpeaBN6TGrUxh66lN4aN5wHwlxKSSla
5Wtl6lLeVpxTXjBiRKFVLE0Xlt1rnepm8FpqxdEkdTcCfRo0eHC2odJTpPh2o4Ir
iueMTd5cQahPsLLDhivWS0sKwuNOKy+UgDCUbbQ3saywPGmRX8S27RDoQURXf+he
5b92m3MC02l7hR4JboZnoL5o7xtqmQ==
=2zpp
-----END PGP SIGNATURE-----

--kceYshB7ETOCDe3J--


