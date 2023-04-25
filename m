Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2216EE5C5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 18:31:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prLYY-0004uA-Sk; Tue, 25 Apr 2023 12:30:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1prLYS-0004ty-RE
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 12:30:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1prLYF-00074c-A7
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 12:30:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682440196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E79i0nQNcOhPx9obbDT5boX/wVXS7Z+jrWPuvrkk1Y4=;
 b=EzCDNcqjsTvCteCIvsZF4Q2Y7Rf5bAVx5RdzW28WyPRKsJUlbJPXdr3XAjyRJ8TzFNQ5Fm
 s5anFKXX0+5cRssp7QO1iB23nS0FEQSte/APB6zgAiowla65gJedI5UgGCTXZDZKyNc4lR
 57yYKNsgoLK2bUbJ6Q/XnyXIFA0Bb38=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-k5r-hIbGOR-yTKl6ZBF_ag-1; Tue, 25 Apr 2023 12:29:53 -0400
X-MC-Unique: k5r-hIbGOR-yTKl6ZBF_ag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A73FC885624;
 Tue, 25 Apr 2023 16:29:52 +0000 (UTC)
Received: from localhost (unknown [10.39.193.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D32CC15BA0;
 Tue, 25 Apr 2023 16:29:51 +0000 (UTC)
Date: Tue, 25 Apr 2023 12:29:50 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Lieven <pl@kamp.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Stefan Weil <sw@weilnetz.de>,
 Fam Zheng <fam@euphon.net>, Julia Suvorova <jusual@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 xen-devel@lists.xenproject.org, Hanna Reitz <hreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, eesposit@redhat.com,
 Kevin Wolf <kwolf@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v3 20/20] aio: remove aio_disable_external() API
Message-ID: <20230425162950.GB725672@fedora>
References: <20230420113732.336620-1-stefanha@redhat.com>
 <20230420113732.336620-21-stefanha@redhat.com>
 <f7b20c96-be06-2299-5589-11dbf23251f8@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BIT1XJZKQdQoLFB0"
Content-Disposition: inline
In-Reply-To: <f7b20c96-be06-2299-5589-11dbf23251f8@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--BIT1XJZKQdQoLFB0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2023 at 03:44:06PM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 20/4/23 13:37, Stefan Hajnoczi wrote:
> > All callers now pass is_external=3Dfalse to aio_set_fd_handler() and
> > aio_set_event_notifier(). The aio_disable_external() API that
> > temporarily disables fd handlers that were registered is_external=3Dtrue
> > is therefore dead code.
> >=20
> > Remove aio_disable_external(), aio_enable_external(), and the
> > is_external arguments to aio_set_fd_handler() and
> > aio_set_event_notifier().
> >=20
> > The entire test-fdmon-epoll test is removed because its sole purpose was
> > testing aio_disable_external().
> >=20
> > Parts of this patch were generated using the following coccinelle
> > (https://coccinelle.lip6.fr/) semantic patch:
> >=20
> >    @@
> >    expression ctx, fd, is_external, io_read, io_write, io_poll, io_poll=
_ready, opaque;
> >    @@
> >    - aio_set_fd_handler(ctx, fd, is_external, io_read, io_write, io_pol=
l, io_poll_ready, opaque)
> >    + aio_set_fd_handler(ctx, fd, io_read, io_write, io_poll, io_poll_re=
ady, opaque)
> >=20
> >    @@
> >    expression ctx, notifier, is_external, io_read, io_poll, io_poll_rea=
dy;
> >    @@
> >    - aio_set_event_notifier(ctx, notifier, is_external, io_read, io_pol=
l, io_poll_ready)
> >    + aio_set_event_notifier(ctx, notifier, io_read, io_poll, io_poll_re=
ady)
> >=20
> > Reviewed-by: Juan Quintela <quintela@redhat.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   include/block/aio.h           | 55 --------------------------
> >   util/aio-posix.h              |  1 -
> >   block.c                       |  7 ----
> >   block/blkio.c                 | 15 +++----
> >   block/curl.c                  | 10 ++---
> >   block/export/fuse.c           |  8 ++--
> >   block/export/vduse-blk.c      | 10 ++---
> >   block/io.c                    |  2 -
> >   block/io_uring.c              |  4 +-
> >   block/iscsi.c                 |  3 +-
> >   block/linux-aio.c             |  4 +-
> >   block/nfs.c                   |  5 +--
> >   block/nvme.c                  |  8 ++--
> >   block/ssh.c                   |  4 +-
> >   block/win32-aio.c             |  6 +--
> >   hw/i386/kvm/xen_xenstore.c    |  2 +-
> >   hw/virtio/virtio.c            |  6 +--
> >   hw/xen/xen-bus.c              |  8 ++--
> >   io/channel-command.c          |  6 +--
> >   io/channel-file.c             |  3 +-
> >   io/channel-socket.c           |  3 +-
> >   migration/rdma.c              | 16 ++++----
> >   tests/unit/test-aio.c         | 27 +------------
> >   tests/unit/test-fdmon-epoll.c | 73 -----------------------------------
> >   util/aio-posix.c              | 20 +++-------
> >   util/aio-win32.c              |  8 +---
> >   util/async.c                  |  3 +-
> >   util/fdmon-epoll.c            | 10 -----
> >   util/fdmon-io_uring.c         |  8 +---
> >   util/fdmon-poll.c             |  3 +-
> >   util/main-loop.c              |  7 ++--
> >   util/qemu-coroutine-io.c      |  7 ++--
> >   util/vhost-user-server.c      | 11 +++---
> >   tests/unit/meson.build        |  3 --
> >   34 files changed, 76 insertions(+), 290 deletions(-)
> >   delete mode 100644 tests/unit/test-fdmon-epoll.c
>=20
>=20
> > -/**
> > - * aio_disable_external:
> > - * @ctx: the aio context
> > - *
> > - * Disable the further processing of external clients.
> > - */
> > -static inline void aio_disable_external(AioContext *ctx)
> > -{
> > -    qatomic_inc(&ctx->external_disable_cnt);
> > -}
> > -
> > -/**
> > - * aio_enable_external:
> > - * @ctx: the aio context
> > - *
> > - * Enable the processing of external clients.
> > - */
> > -static inline void aio_enable_external(AioContext *ctx)
> > -{
> > -    int old;
> > -
> > -    old =3D qatomic_fetch_dec(&ctx->external_disable_cnt);
> > -    assert(old > 0);
> > -    if (old =3D=3D 1) {
> > -        /* Kick event loop so it re-arms file descriptors */
> > -        aio_notify(ctx);
> > -    }
> > -}
> > -
> > -/**
> > - * aio_external_disabled:
> > - * @ctx: the aio context
> > - *
> > - * Return true if the external clients are disabled.
> > - */
> > -static inline bool aio_external_disabled(AioContext *ctx)
> > -{
> > -    return qatomic_read(&ctx->external_disable_cnt);
> > -}
>=20
> Missing:
>=20
> -- >8 --
> diff --git a/include/block/aio.h b/include/block/aio.h
> index d4ce01ea08..266be26f8e 100644
> --- a/include/block/aio.h
> +++ b/include/block/aio.h
> @@ -224,6 +224,4 @@ struct AioContext {
>      QEMUTimerListGroup tlg;
>=20
> -    int external_disable_cnt;
> -
>      /* Number of AioHandlers without .io_poll() */
>      int poll_disable_cnt;
> diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
> index d9d3807062..5c89169e46 100644
> --- a/tests/unit/test-bdrv-drain.c
> +++ b/tests/unit/test-bdrv-drain.c
> @@ -436,5 +436,4 @@ static void test_graph_change_drain_all(void)
>      g_assert_cmpint(bs_b->quiesce_counter, =3D=3D, 0);
>      g_assert_cmpint(b_s->drain_count, =3D=3D, 0);
> -    g_assert_cmpint(qemu_get_aio_context()->external_disable_cnt, =3D=3D=
, 0);
>=20
>      bdrv_unref(bs_b);
> ---
>=20
> Once cleaned:
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@linaro.org>

Oh, yes! Thank you.

Stefan

--BIT1XJZKQdQoLFB0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRH//4ACgkQnKSrs4Gr
c8hAWAgArFHJSBD/052Y5YxJagR3rp5Ty6TQFZbFR7XqgZm4OKiJUdVsYRjLFAVb
88VPsKWcJcTIjsM6CsLc08dll7kjwWltL1oWglX3chlwNSyFz7JJpkrBEsGi+FTk
QnHEXHYTopX8yvkc63FJy9xMYPUkBRoxRU2out3CeqaPrcBTtkoDRjoUvG0iPi4I
a2KBbyhYim8z4W2OWw3ereSqfBzSHaIc6c16hE74O2NTVFXYKWxj1VV/HNJDmRM9
s+wDgxnywf2oAtec9QZvxI7k/Jkb4B4zqox2QJV/2f2ngq5QqQMEBh4Q8uKMyC8t
qV7BJGwMNoPGtu5fnTYjZVJApmvWNA==
=q6+o
-----END PGP SIGNATURE-----

--BIT1XJZKQdQoLFB0--


