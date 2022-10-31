Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22522613EEE
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 21:24:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opbJS-000354-TK; Mon, 31 Oct 2022 16:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opbJM-00031x-S1
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 16:23:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opbJL-0003gT-1K
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 16:23:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667247786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/EMYMvwx6no9R8DHua1ll2UJRRrlhG2943tKul7CzjM=;
 b=Sqhma5ftcjf1mrh2vTwWWGoyk8jdu/1z1S0VSGUBBOIsR0y5yAD3HAde3m12I22MMAbF/V
 gREOpGa+CG+UXLpRFydZEzXGxoDhz6mHkeOWJEQ7mdPGd0VcBOEL78UEVNAs9JDWjAVJcy
 Cj8VA42Ytli3X0NzlfDSIR++bWWTnyo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-foi3FcUYPEW9gGYYoCeE-w-1; Mon, 31 Oct 2022 16:23:02 -0400
X-MC-Unique: foi3FcUYPEW9gGYYoCeE-w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1CD0806003;
 Mon, 31 Oct 2022 20:23:01 +0000 (UTC)
Received: from localhost (unknown [10.39.192.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C91E62166B29;
 Mon, 31 Oct 2022 20:22:59 +0000 (UTC)
Date: Mon, 31 Oct 2022 15:41:22 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v4 1/3] linux-aio: use LinuxAioState from the running
 thread
Message-ID: <Y2Ak4pLLWIsAT9xJ@fedora>
References: <20221031125936.3458740-1-eesposit@redhat.com>
 <20221031125936.3458740-2-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AjFtXsf0KjXPAmvm"
Content-Disposition: inline
In-Reply-To: <20221031125936.3458740-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org


--AjFtXsf0KjXPAmvm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2022 at 08:59:34AM -0400, Emanuele Giuseppe Esposito wrote:
> @@ -56,10 +59,8 @@ struct LinuxAioState {
>      io_context_t ctx;
>      EventNotifier e;
> =20
> -    /* io queue for submit at batch.  Protected by AioContext lock. */
> +    /* All data is only used in one I/O thread.  */
>      LaioQueue io_q;

/* No locking required, only accessed from AioContext home thread */

This is more general because it includes the main loop, which is not an
IOThread.

(Please write "IOThread" for consistency. Most of the documentation and
comments uses "IOThread".)

> -
> -    /* I/O completion processing.  Only runs in I/O thread.  */
>      QEMUBH *completion_bh;
>      int event_idx;
>      int event_max;
> @@ -102,6 +103,7 @@ static void qemu_laio_process_completion(struct qemu_=
laiocb *laiocb)
>       * later.  Coroutines cannot be entered recursively so avoid doing
>       * that!
>       */
> +    assert(laiocb->co->ctx =3D=3D laiocb->ctx->aio_context);
>      if (!qemu_coroutine_entered(laiocb->co)) {
>          aio_co_wake(laiocb->co);
>      }
> @@ -232,13 +234,11 @@ static void qemu_laio_process_completions(LinuxAioS=
tate *s)
> =20
>  static void qemu_laio_process_completions_and_submit(LinuxAioState *s)
>  {
> -    aio_context_acquire(s->aio_context);
>      qemu_laio_process_completions(s);
> =20
>      if (!s->io_q.plugged && !QSIMPLEQ_EMPTY(&s->io_q.pending)) {
>          ioq_submit(s);
>      }
> -    aio_context_release(s->aio_context);
>  }
> =20
>  static void qemu_laio_completion_bh(void *opaque)
> @@ -354,14 +354,19 @@ static uint64_t laio_max_batch(LinuxAioState *s, ui=
nt64_t dev_max_batch)
>      return max_batch;
>  }
> =20
> -void laio_io_plug(BlockDriverState *bs, LinuxAioState *s)
> +void laio_io_plug(void)
>  {
> +    AioContext *ctx =3D qemu_get_current_aio_context();
> +    LinuxAioState *s =3D aio_get_linux_aio(ctx);
> +
>      s->io_q.plugged++;

I see the following code path:

blk_io_plug -> bdrv_io_plug -> raw_aio_plug -> laio_io_plug

blk_io_plug() can be called from any thread but laio_io_plug()
implicitly operates on the current thread's AioContext's LinuxAioState.

This changes the semantics of blk_io_plug() from a global BDS operation
to a thread-local one. The new blk_io_plug() semantics need to be
documented, because it's not obvious that multiple threads can
blk_io_plug/unplug() independently and don't affect each other. It means
the caller must be careful to pair plug/unplug in the same thread.

>  }
> =20
> -void laio_io_unplug(BlockDriverState *bs, LinuxAioState *s,
> -                    uint64_t dev_max_batch)
> +void laio_io_unplug(uint64_t dev_max_batch)
>  {
> +    AioContext *ctx =3D qemu_get_current_aio_context();
> +    LinuxAioState *s =3D aio_get_linux_aio(ctx);
> +
>      assert(s->io_q.plugged);
>      s->io_q.plugged--;
> =20
> @@ -411,15 +416,15 @@ static int laio_do_submit(int fd, struct qemu_laioc=
b *laiocb, off_t offset,
>      return 0;
>  }
> =20
> -int coroutine_fn laio_co_submit(BlockDriverState *bs, LinuxAioState *s, =
int fd,
> -                                uint64_t offset, QEMUIOVector *qiov, int=
 type,
> -                                uint64_t dev_max_batch)
> +int coroutine_fn laio_co_submit(int fd, uint64_t offset, QEMUIOVector *q=
iov,
> +                                int type, uint64_t dev_max_batch)

This function needs documentation. It submits I/O requests in the
thread's current AioContext. Before it was explicit via the function
arguments but now it's no longer obvious.

--AjFtXsf0KjXPAmvm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNgJOIACgkQnKSrs4Gr
c8gaFAgAqTP46K6LTBWEbmOc/lbjEB2Mqocj3g2ff1ZKKAD2MO6UyQj9jKocwI53
wpv5hpaRa0CdKhyKEmYS45OHrqk3OaXvzFd2c1nX3KS8r4EBwqAV6jH+raaGutgm
SFog3HWsjP2XyJ612iuphc4eHVCZOsISKLivACq8frtWEcuBZB4WlZwlh80QLmMX
/RN0ggqKp8qQNZAyrcvzh5kKKSBeqCiZ1rNsGlZ4d2Xoll6xYGu/2RSXtZFss3Gf
MUhDgHQsJCo3ATUDH6QAxumRDrgB+kaq32WyuqWBlxhR50sSWIuW2qkkXHDsy0lz
DnB/mCGsXso+M+iaOuL8Bby7njOVlQ==
=6nWE
-----END PGP SIGNATURE-----

--AjFtXsf0KjXPAmvm--


