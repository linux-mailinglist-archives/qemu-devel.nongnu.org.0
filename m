Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ACA371E85
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:25:01 +0200 (CEST)
Received: from localhost ([::1]:45924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldcJY-0005Ih-K8
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ldc3S-0006fv-Ea; Mon, 03 May 2021 13:08:23 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ldc3E-0001WH-IM; Mon, 03 May 2021 13:08:20 -0400
Received: by mail-wr1-x433.google.com with SMTP id h4so6328791wrt.12;
 Mon, 03 May 2021 10:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dW665Tg4n9gCDgbpySjcIzzdQ168rlHQPuEOD9L76Jo=;
 b=t7IGjDAiIx9l1iwpVkSxUvrmuJzfPMogPpYqiD2tJRxTDbgBm71a0Cg0Y9r4QQnpnq
 Qg00dnEYLws6QJ8GKT9bwI3a71NG1yVHuelr/OOFYyhT+kIg/eZedkyduE6GlNX7fgNx
 0xT/PGUYas5ZzQJUONvdsb78anX6i/BZU8G07on8GVYh6NOMVIOI8Tw0ACbkKZi23krg
 HfDqaOPgtTgyHQvXbIMuMoRlBL0CqKsue2eRJj3BZHZyVWktRG/FQa0k+ZRlYKVM7xxQ
 lsgAHOS3/IsaUhLVnNe9YjaX/44h0keNHRkh1AbkrG/l2QtkR3XeNsW3YKpN2cte17KL
 67ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dW665Tg4n9gCDgbpySjcIzzdQ168rlHQPuEOD9L76Jo=;
 b=e9RsfK0wawH3ZxmZuqBOJx6/bxBeeqn9jNFkbNI0rTW4Ybfw8bYQrCCJcw6wA0Lzx9
 mKNvDTKEpwrsmtYyeEEaY4DhhfV8NoCGGSXnwSJtdiAy8MMqsG+a+LNDPy8PKD3APo9Y
 c+NPasuP8bFTti6Xdj8Bz+7pqFLMyGu/HoRAKaPl+nVnwgrAhqDlNS7mQhwiUpFolPVI
 VTGA4RixCSrQWl6DghWxFrN25bC5n9UCvC+3na94iJJI7w3kl9lUt1i5HjG2txjwJwd/
 nwt9On+8dSoeDYV2To0K/Wo+FWvBocd+vOqFZyiWDSa67bbo1z7m6UrnKaMm6ZGUpBqH
 /sgg==
X-Gm-Message-State: AOAM533RAta6JMFoSidHVyY3qiUWq1GnKb+1RaVUJAzHb6SgFFCnkDKt
 8LsN+wmHWCr81arqK64zMJE=
X-Google-Smtp-Source: ABdhPJw+iSVJ4Y55Lv1+YBZguOMPcRxJuOja3lerxHgWv8GlNX5JB7FT+TJthV0cnBSUGRzyzigFvQ==
X-Received: by 2002:adf:e84a:: with SMTP id d10mr14784288wrn.132.1620061684023; 
 Mon, 03 May 2021 10:08:04 -0700 (PDT)
Received: from localhost (1.9.90.146.dyn.plus.net. [146.90.9.1])
 by smtp.gmail.com with ESMTPSA id i3sm14295572wrb.46.2021.05.03.10.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 10:08:03 -0700 (PDT)
Date: Mon, 3 May 2021 18:08:02 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: cennedee <cennedee@protonmail.com>
Subject: Re: [PATCH] Add missing coroutine_fn function signature to functions
Message-ID: <YJAt8r78WAVdFrpa@stefanha-x1.localdomain>
References: <8y2vfZuyQoZPUsO-9E_Vl_x5LG4S3-ewrNqvmbgOTUHPglYpU2A0-jjdIh78JySlGCqhHgfXXezC_HGTIbSdlsqcT9YzUKr0b_FKp1OLk00=@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ADJkXFwsH1FlPtLC"
Content-Disposition: inline
In-Reply-To: <8y2vfZuyQoZPUsO-9E_Vl_x5LG4S3-ewrNqvmbgOTUHPglYpU2A0-jjdIh78JySlGCqhHgfXXezC_HGTIbSdlsqcT9YzUKr0b_FKp1OLk00=@protonmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ADJkXFwsH1FlPtLC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 09:34:41PM +0000, cennedee wrote:
> From 447601c28d5ed0b1208a0560390f760e75ce5613 Mon Sep 17 00:00:00 2001
> From: Cenne Dee <cennedee+qemu-devel@protonmail.com>
> Date: Fri, 30 Apr 2021 15:52:28 -0400
> Subject: [PATCH] Add missing coroutine_fn function signature to functions
>=20
> Patch adds the signature for all relevant functions ending with _co
> or those that use them.
>=20
> Signed-off-by: Cenne Dee <cennedee+qemu-devel@protonmail.com>
> ---
>  block/block-gen.h             | 2 +-
>  migration/migration.c         | 2 +-
>  monitor/hmp.c                 | 2 +-
>  scsi/qemu-pr-helper.c         | 2 +-
>  tests/unit/test-thread-pool.c | 4 ++--
>  5 files changed, 6 insertions(+), 6 deletions(-)

Hi,
Thanks for discussing coroutine_fn on IRC! Here is some feedback on this
patch:

> diff --git a/block/block-gen.h b/block/block-gen.h
> index f80cf48..4963372 100644
> --- a/block/block-gen.h
> +++ b/block/block-gen.h
> @@ -36,7 +36,7 @@ typedef struct BdrvPollCo {
>      Coroutine *co; /* Keep pointer here for debugging */
>  } BdrvPollCo;
>=20
> -static inline int bdrv_poll_co(BdrvPollCo *s)
> +static inline int coroutine_fn bdrv_poll_co(BdrvPollCo *s)
>  {
>      assert(!qemu_in_coroutine());

The assert indicates that this function must not be called from a
coroutine. Adding coroutine_fn is incorrect here.

> diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
> index 7b9389b..7c1ed2a 100644
> --- a/scsi/qemu-pr-helper.c
> +++ b/scsi/qemu-pr-helper.c
> @@ -175,7 +175,7 @@ static int do_sgio_worker(void *opaque)
>      return status;
>  }
>=20
> -static int do_sgio(int fd, const uint8_t *cdb, uint8_t *sense,
> +static int coroutine_fn do_sgio(int fd, const uint8_t *cdb, uint8_t *sen=
se,
>                      uint8_t *buf, int *sz, int dir)
>  {
>      ThreadPool *pool =3D aio_get_thread_pool(qemu_get_aio_context());

This is correct but there are several functions that call do_sgio() that
also need coroutine_fn. The eventual parent is prh_co_entry() and it's a
good place to start auditing the code.

> diff --git a/tests/unit/test-thread-pool.c b/tests/unit/test-thread-pool.c
> index 70dc631..21fc118 100644
> --- a/tests/unit/test-thread-pool.c
> +++ b/tests/unit/test-thread-pool.c
> @@ -72,7 +72,7 @@ static void test_submit_aio(void)
>      g_assert_cmpint(data.ret, =3D=3D, 0);
>  }
>=20
> -static void co_test_cb(void *opaque)
> +static void coroutine_fn co_test_cb(void *opaque)
>  {
>      WorkerTestData *data =3D opaque;
>=20
> @@ -90,7 +90,7 @@ static void co_test_cb(void *opaque)
>      /* The test continues in test_submit_co, after aio_poll... */
>  }
>=20
> -static void test_submit_co(void)
> +static void coroutine_fn test_submit_co(void)

This function is not called from a coroutine and should not have
coroutine_fn. It's a regular function called by gtester:

  g_test_add_func("/thread-pool/submit-co", test_submit_co);

The above change to co_test_cb() is correct though.

--ADJkXFwsH1FlPtLC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCQLe8ACgkQnKSrs4Gr
c8hEwAgAoXqkotB1ROFC4VcUgdZPDhV8gxnJ3m38ceva9JMO81mbMUbgQSoV+vam
4izl7Fs0QkoplW7MxGEhr5at3FG8cA2ZFHvO9jGw6BtTU2w6CKjQsxthEeHlGKgU
s5hj51jW8PF+I24dD9NOOo1sQ6ftTtssBSOahkhsnT0Ihd+mgyY6P2/O4y0b/oyX
6GB0VmEveDAF0jpBC3HKCMMy5O5vDIViWjZ6ISMYqx8jOdQp8EpO23oNuTq9YF5k
urDHRMNJhrHnRkkPwMLVKbFOnwd8TDiNXjYUDpz2odZ6tF9xMSV03xY01jxrgAK8
rL/Vpl8tCdb4g6PcOgNpAILQ8NGDPg==
=eRY2
-----END PGP SIGNATURE-----

--ADJkXFwsH1FlPtLC--

