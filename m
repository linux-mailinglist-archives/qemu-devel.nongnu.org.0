Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D175138F3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:47:38 +0200 (CEST)
Received: from localhost ([::1]:53964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk6Mk-0004OF-0l
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk5N3-0005Te-SS
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:43:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk5N1-00072k-VR
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651157030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ccd8nk9S13q53zBEElaR/4y03CyIGHW8EUi7GIGNCSk=;
 b=L0uHpYcn0ekfsunyCcs3IQDC0WQ5eu/svwyVBwS101SmqLfSJo29JizV7z1t16oYa3Os13
 Nhq3hXR7M2/CNt9zmMi0omty66qe/iCj03XdTMLfhd8MXHnwNRU6VAq0kHWhcHXX4LBeX6
 YAZNnx3797y5eBG3kecXyMZC/ZsI6FM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-nKn-PYjeNNuHzES2XCyKUA-1; Thu, 28 Apr 2022 10:43:46 -0400
X-MC-Unique: nKn-PYjeNNuHzES2XCyKUA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02A0685A5A8;
 Thu, 28 Apr 2022 14:43:46 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B395CC28100;
 Thu, 28 Apr 2022 14:43:45 +0000 (UTC)
Date: Thu, 28 Apr 2022 15:43:44 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 6/8] block: assert that graph read and writes are
 performed correctly
Message-ID: <YmqoID0zLEUqWMZC@stefanha-x1.localdomain>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <20220426085114.199647-7-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="F3/QtuT2QnrjG16y"
Content-Disposition: inline
In-Reply-To: <20220426085114.199647-7-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--F3/QtuT2QnrjG16y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2022 at 04:51:12AM -0400, Emanuele Giuseppe Esposito wrote:
> diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
> index f171ba0527..2211d41286 100644
> --- a/include/block/graph-lock.h
> +++ b/include/block/graph-lock.h
> @@ -52,5 +52,20 @@ void coroutine_fn bdrv_graph_co_rdlock(void);
>   */
>  void coroutine_fn bdrv_graph_co_rdunlock(void);
> =20
> +/*
> + * assert_bdrv_graph_readable:
> + * Make sure that the reader is either the main loop,
> + * or there is at least a reader helding the rdlock.
> + * In this way an incoming writer is aware of the read and waits.
> + */
> +void assert_bdrv_graph_readable(void);

The name confuses me. I suggest assert_bdrv_graph_rdlock_held().

> +
> +/*
> + * assert_bdrv_graph_writable:
> + * Make sure that the writer is the main loop and has set @has_writer,
> + * so that incoming readers will pause.
> + */
> +void assert_bdrv_graph_writable(void);

assert_bdrv_graph_wrlock_held().

> +
>  #endif /* BLOCK_LOCK_H */
> =20
> --=20
> 2.31.1
>=20

--F3/QtuT2QnrjG16y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJqqCAACgkQnKSrs4Gr
c8hWGggAs1dB9RrKULhvYHpUFigD/Caugh4Y6Cgu0B4ssbBNBviCfsurlWVRxa1p
ZpYOU5gpACIKkMYdM5cCU6VV1Agco+yHkgXBFCp0NfpjCljnQhnPMczrt9SBwQSo
ZbAelCAfGt5yB+0we2rgpm44UF73wlf75Uqn7zNODpEh3uMqOG9wYmcihgV3Bzmm
AUbuh80sscrCeiXfxj8dEY6AAFs66/Ksn2vktHE9m37IFeyNOUogalcOHU/eSK8e
eTKk3rRw/Qg4b1NSsaH8P40PP3NvBK49fbLSl0o0AtnV+dXsukf256F6QZEVkarx
dF9PpKGV5GplDGonQ1ySoURHuOlv4g==
=En/n
-----END PGP SIGNATURE-----

--F3/QtuT2QnrjG16y--


