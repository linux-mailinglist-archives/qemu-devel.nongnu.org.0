Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 901E267BE3B
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 22:25:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKnFm-0001bj-W3; Wed, 25 Jan 2023 16:24:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pKnFl-0001bP-1W
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 16:24:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pKnFi-0001Wx-WD
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 16:24:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674681857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iq4TXO8aQrkWIMsOEGH0cwBOg0Wr81DMuaamyfXlq/E=;
 b=UC0xwT4QcVFH/MmALKEjRXB8hyOgVwjq8kXRVnI+zb/zXHJYEm+TZOmLi59xNpSqWIteP6
 z82/DIN9s/MhmODZjt1jR2YSpDb8/Dv2vlXtQio+T2XDnp1TR7V4HkbIQ3L/CJ3pI6S3o2
 zZE8nz+StFZpp2wRAqjWuD3QUQii2Fo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-sLM-nPedMnmi6pZv2744rw-1; Wed, 25 Jan 2023 16:24:16 -0500
X-MC-Unique: sLM-nPedMnmi6pZv2744rw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95C1A800B30;
 Wed, 25 Jan 2023 21:24:15 +0000 (UTC)
Received: from localhost (unknown [10.39.192.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 895C7492B01;
 Wed, 25 Jan 2023 21:24:14 +0000 (UTC)
Date: Wed, 25 Jan 2023 16:24:12 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 "open list:Block I/O path" <qemu-block@nongnu.org>
Subject: Re: [PATCH v4 2/3] async: Add an optional reentrancy guard to the BH
 API
Message-ID: <Y9Gd/BDwNXeElTNR@fedora>
References: <20230119070308.321653-1-alxndr@bu.edu>
 <20230119070308.321653-3-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hlWGBr53XeqqPq2P"
Content-Disposition: inline
In-Reply-To: <20230119070308.321653-3-alxndr@bu.edu>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--hlWGBr53XeqqPq2P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2023 at 02:03:07AM -0500, Alexander Bulekov wrote:
> Devices can pass their MemoryReentrancyGuard (from their DeviceState),
> when creating new BHes. Then, the async API will toggle the guard
> before/after calling the BH call-back. This prevents bh->mmio reentrancy
> issues.
>=20
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  docs/devel/multiple-iothreads.txt |  2 ++
>  include/block/aio.h               | 18 ++++++++++++++++--
>  include/qemu/main-loop.h          |  7 +++++--
>  tests/unit/ptimer-test-stubs.c    |  3 ++-
>  util/async.c                      | 12 +++++++++++-
>  util/main-loop.c                  |  5 +++--
>  6 files changed, 39 insertions(+), 8 deletions(-)
>=20
> diff --git a/docs/devel/multiple-iothreads.txt b/docs/devel/multiple-ioth=
reads.txt
> index 343120f2ef..e4fafed9d9 100644
> --- a/docs/devel/multiple-iothreads.txt
> +++ b/docs/devel/multiple-iothreads.txt
> @@ -61,6 +61,7 @@ There are several old APIs that use the main loop AioCo=
ntext:
>   * LEGACY qemu_aio_set_event_notifier() - monitor an event notifier
>   * LEGACY timer_new_ms() - create a timer
>   * LEGACY qemu_bh_new() - create a BH
> + * LEGACY qemu_bh_new_guarded() - create a BH with a device re-entrancy =
guard
>   * LEGACY qemu_aio_wait() - run an event loop iteration
> =20
>  Since they implicitly work on the main loop they cannot be used in code =
that
> @@ -72,6 +73,7 @@ Instead, use the AioContext functions directly (see inc=
lude/block/aio.h):
>   * aio_set_event_notifier() - monitor an event notifier
>   * aio_timer_new() - create a timer
>   * aio_bh_new() - create a BH
> + * aio_bh_new_guarded() - create a BH with a device re-entrancy guard
>   * aio_poll() - run an event loop iteration
> =20
>  The AioContext can be obtained from the IOThread using
> diff --git a/include/block/aio.h b/include/block/aio.h
> index 0f65a3cc9e..94d661ff7e 100644
> --- a/include/block/aio.h
> +++ b/include/block/aio.h
> @@ -23,6 +23,8 @@
>  #include "qemu/thread.h"
>  #include "qemu/timer.h"
>  #include "block/graph-lock.h"
> +#include "hw/qdev-core.h"
> +
> =20
>  typedef struct BlockAIOCB BlockAIOCB;
>  typedef void BlockCompletionFunc(void *opaque, int ret);
> @@ -332,9 +334,11 @@ void aio_bh_schedule_oneshot_full(AioContext *ctx, Q=
EMUBHFunc *cb, void *opaque,
>   * is opaque and must be allocated prior to its use.
>   *
>   * @name: A human-readable identifier for debugging purposes.
> + * @reentrancy_guard: A guard set when entering a cb to prevent
> + * device-reentrancy issues
>   */
>  QEMUBH *aio_bh_new_full(AioContext *ctx, QEMUBHFunc *cb, void *opaque,
> -                        const char *name);
> +                        const char *name, MemReentrancyGuard *reentrancy=
_guard);
> =20
>  /**
>   * aio_bh_new: Allocate a new bottom half structure
> @@ -343,7 +347,17 @@ QEMUBH *aio_bh_new_full(AioContext *ctx, QEMUBHFunc =
*cb, void *opaque,
>   * string.
>   */
>  #define aio_bh_new(ctx, cb, opaque) \
> -    aio_bh_new_full((ctx), (cb), (opaque), (stringify(cb)))
> +    aio_bh_new_full((ctx), (cb), (opaque), (stringify(cb)), NULL)
> +
> +/**
> + * aio_bh_new_guarded: Allocate a new bottom half structure with a
> + * reentrancy_guard
> + *
> + * A convenience wrapper for aio_bh_new_full() that uses the cb as the n=
ame
> + * string.
> + */
> +#define aio_bh_new_guarded(ctx, cb, opaque, guard) \
> +    aio_bh_new_full((ctx), (cb), (opaque), (stringify(cb)), guard)
> =20
>  /**
>   * aio_notify: Force processing of pending events.
> diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
> index c25f390696..84d1ce57f0 100644
> --- a/include/qemu/main-loop.h
> +++ b/include/qemu/main-loop.h
> @@ -389,9 +389,12 @@ void qemu_cond_timedwait_iothread(QemuCond *cond, in=
t ms);
> =20
>  void qemu_fd_register(int fd);
> =20
> +#define qemu_bh_new_guarded(cb, opaque, guard) \
> +    qemu_bh_new_full((cb), (opaque), (stringify(cb)), guard)
>  #define qemu_bh_new(cb, opaque) \
> -    qemu_bh_new_full((cb), (opaque), (stringify(cb)))
> -QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name);
> +    qemu_bh_new_full((cb), (opaque), (stringify(cb)), NULL)
> +QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name,
> +                         MemReentrancyGuard *reentrancy_guard);
>  void qemu_bh_schedule_idle(QEMUBH *bh);
> =20
>  enum {
> diff --git a/tests/unit/ptimer-test-stubs.c b/tests/unit/ptimer-test-stub=
s.c
> index f5e75a96b6..24d5413f9d 100644
> --- a/tests/unit/ptimer-test-stubs.c
> +++ b/tests/unit/ptimer-test-stubs.c
> @@ -107,7 +107,8 @@ int64_t qemu_clock_deadline_ns_all(QEMUClockType type=
, int attr_mask)
>      return deadline;
>  }
> =20
> -QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name)
> +QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name,
> +                         MemReentrancyGuard *reentrancy_guard)
>  {
>      QEMUBH *bh =3D g_new(QEMUBH, 1);
> =20
> diff --git a/util/async.c b/util/async.c
> index 14d63b3091..08924c3212 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -65,6 +65,7 @@ struct QEMUBH {
>      void *opaque;
>      QSLIST_ENTRY(QEMUBH) next;
>      unsigned flags;
> +    MemReentrancyGuard *reentrancy_guard;
>  };
> =20
>  /* Called concurrently from any thread */
> @@ -133,7 +134,7 @@ void aio_bh_schedule_oneshot_full(AioContext *ctx, QE=
MUBHFunc *cb,
>  }
> =20
>  QEMUBH *aio_bh_new_full(AioContext *ctx, QEMUBHFunc *cb, void *opaque,
> -                        const char *name)
> +                        const char *name, MemReentrancyGuard *reentrancy=
_guard)
>  {
>      QEMUBH *bh;
>      bh =3D g_new(QEMUBH, 1);
> @@ -142,13 +143,22 @@ QEMUBH *aio_bh_new_full(AioContext *ctx, QEMUBHFunc=
 *cb, void *opaque,
>          .cb =3D cb,
>          .opaque =3D opaque,
>          .name =3D name,
> +        .reentrancy_guard =3D reentrancy_guard,
>      };
>      return bh;
>  }
> =20
>  void aio_bh_call(QEMUBH *bh)
>  {
> +    if (bh->reentrancy_guard) {
> +        bh->reentrancy_guard->engaged_in_io =3D true;
> +    }
> +
>      bh->cb(bh->opaque);
> +
> +    if (bh->reentrancy_guard) {
> +        bh->reentrancy_guard->engaged_in_io =3D false;
> +    }
>  }

QEMU supports nested event loops. I think aio_bh_call() -> cb() ->
aio_poll() -> aio_bh_call() -> ... is possible although it should be
rare.

->engaged_in_io will set to false after the innermost aio_bh_call()
returns. Therefore the protection doesn't cover the remainder of the
parent cb() functions.

I think aio_bh_call() should be:

  void aio_bh_call(QEMUBH *bh)
  {
      bool last_engaged_in_io =3D false;

      if (bh->reentrancy_guard) {
          last_engaged_in_io =3D bh->reentrancy_guard->engaged_in_io;
          bh->reentrancy_guard->engaged_in_io =3D true;
      }

      bh->cb(bh->opaque);

      if (bh->reentrancy_guard) {
          bh->reentrancy_guard->engaged_in_io =3D last_engaged_in_io;
      }
  }

That way nested aio_poll() calls work as expected.

This also raises the question whether aio_bh_call() should call abort(3)
if ->engaged_in_io is already true when the function is entered? I think
that may be too strict, but I'm not sure. A scenario where this can
happen:

The memory region read/write function calls aio_poll() -> aio_bh_call()
and a BH with our device's re-entrancy guard is executed.

> =20
>  /* Multiple occurrences of aio_bh_poll cannot be called concurrently. */
> diff --git a/util/main-loop.c b/util/main-loop.c
> index 58f776a8c9..07d2e2040a 100644
> --- a/util/main-loop.c
> +++ b/util/main-loop.c
> @@ -617,9 +617,10 @@ void main_loop_wait(int nonblocking)
> =20
>  /* Functions to operate on the main QEMU AioContext.  */
> =20
> -QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name)
> +QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name,=
 MemReentrancyGuard *reentrancy_guard)
>  {
> -    return aio_bh_new_full(qemu_aio_context, cb, opaque, name);
> +    return aio_bh_new_full(qemu_aio_context, cb, opaque, name,
> +                           reentrancy_guard);
>  }
> =20
>  /*
> --=20
> 2.39.0
>=20

--hlWGBr53XeqqPq2P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPRnfwACgkQnKSrs4Gr
c8jRswgAiZ2uQH608EnlECRRjezzmPfwGTvsHfQZBFcXp/o+1YmdAhhiWau/TRZJ
K736YeIeua2MSrbikAeQTm5nRzFusmfnN/KxiBa0yDlEaUu7pM5QYz4hpLA4Bzsv
RWWOOexolwuqk16lFRHJzQtwm/9OaXZClMUFv9hPS6lkdcQ2UpjssMuPMYKKMktx
izSWERUTZ2TDhusDt/nE66hNH4VseoSZDXIumopMZDda1oW+s5MMB8U8JD/Qomx3
hvLOlLdLmtb+DwguYWSHlm9cvo90N2KmwzwiS2uV/E3Insn6WvAsinem2g8MqwCS
p1nwW3Wvu71jx1WM59AQYZFiLIBnzg==
=/8k5
-----END PGP SIGNATURE-----

--hlWGBr53XeqqPq2P--


