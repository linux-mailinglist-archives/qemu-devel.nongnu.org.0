Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2BB3B9F4C
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 12:51:23 +0200 (CEST)
Received: from localhost ([::1]:55158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzGlW-0006CM-7X
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 06:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lzGeC-0003e5-LC; Fri, 02 Jul 2021 06:43:48 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:40557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lzGeA-00013r-4H; Fri, 02 Jul 2021 06:43:48 -0400
Received: by mail-io1-xd2b.google.com with SMTP id l5so11081610iok.7;
 Fri, 02 Jul 2021 03:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tpbhoGGbCweyTDLdK1R2tfiopauB6/7cd/s2tP53bzQ=;
 b=eDA5zH1fieUwQRgs2FPID/0eR+Sw3uebivxtAbN83/JqODNo77VNRVJshjU+XaZYTs
 lzJEciH647sy4Mk7LL+ZVAJRLUq4cmUWY5KRuRIOKrtHnLkjxsN5VS4AnXhqgUl3ecan
 jhx/x5LtQFBJwkGODjAPQ7aSrwp54rrRgYf882yOUQflSebNDgmePPZW0Vq+ErLgTV+x
 U3r7yORBVfHIfakIB+5hDGI1Q3nxSbv6LHkTM8cgsyxcdVdlKEztpQvfN4dQOrJdDY3z
 giDK3dMti47gWmaUVitI19U52cKGdsPxqO52uRiO4GqBDIMGV0a+hWFGO64kD5kFi1IH
 rDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tpbhoGGbCweyTDLdK1R2tfiopauB6/7cd/s2tP53bzQ=;
 b=W+SJ6fb9TQILj6W00ebYcWEy+Gy76CMbk0Uc86Fx5AqoXW6HOPzIpl9kDD7OUklGZ7
 LcuHqytKFdK6P0pg2YTIiv24kty2vzMcwVHotm0gNN7ZbTPeys0Jj0Om1Q95zZMnijMl
 VnGDXgMT7Oj4Q+fqHHItmPD702Q1l8ZPJAtkKUkmq1ytMPYptJGc89To3QgOAmy7Vavi
 urDFmqOjjHpSUFMnh7hC8FE2dCeJo6Kjz0dgncB9rlRzUY9qExqMvdYpyhMtnm3s45+0
 L9auVVLSmVandI0zVI1dVPBd+nUXi7O8sTZ40sjAelsT7OABU396U6d1hcwrpAJwD3A9
 SynA==
X-Gm-Message-State: AOAM5316xU+WnuCZ4OnIBO28uoC3hZnwC9Z2895hOM4JKNIdRxhvesyi
 a3ZoUdDxqxcx5/CHyTQdV26Z2qcW/ATwZaJFuQ0=
X-Google-Smtp-Source: ABdhPJzUNPTwaAeQjpZqYLosagPeyn1fsgIX80CHTY+8e/L8rGFZBHLbCrHd3xNfEVXPslpVF7cR8jeQ/LVgCDWV8hI=
X-Received: by 2002:a05:6602:1645:: with SMTP id
 y5mr1784478iow.7.1625222624077; 
 Fri, 02 Jul 2021 03:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210702090935.15300-1-pl@kamp.de>
 <20210702090935.15300-2-pl@kamp.de>
In-Reply-To: <20210702090935.15300-2-pl@kamp.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Fri, 2 Jul 2021 12:43:22 +0200
Message-ID: <CAOi1vP8kTMD7=usjdbA-LXXh4+g3CMt7w-DUeSG52PFv3JJGWg@mail.gmail.com>
Subject: Re: [PATCH V4 1/6] block/rbd: bump librbd requirement to luminous
 release
To: Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=idryomov@gmail.com; helo=mail-io1-xd2b.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, ct@flyingcircus.io, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, mreitz@redhat.com,
 Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 2, 2021 at 11:09 AM Peter Lieven <pl@kamp.de> wrote:
>
> even luminous (version 12.2) is unmaintained for over 3 years now.
> Bump the requirement to get rid of the ifdef'ry in the code.
> Qemu 6.1 dropped the support for RHEL-7 which was the last supported
> OS that required an older librbd.
>
> Signed-off-by: Peter Lieven <pl@kamp.de>
> ---
>  block/rbd.c | 120 ++++------------------------------------------------
>  meson.build |   7 ++-
>  2 files changed, 13 insertions(+), 114 deletions(-)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index 26f64cce7c..6b1cbe1d75 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -55,24 +55,10 @@
>   * leading "\".
>   */
>
> -/* rbd_aio_discard added in 0.1.2 */
> -#if LIBRBD_VERSION_CODE >= LIBRBD_VERSION(0, 1, 2)
> -#define LIBRBD_SUPPORTS_DISCARD
> -#else
> -#undef LIBRBD_SUPPORTS_DISCARD
> -#endif
> -
>  #define OBJ_MAX_SIZE (1UL << OBJ_DEFAULT_OBJ_ORDER)
>
>  #define RBD_MAX_SNAPS 100
>
> -/* The LIBRBD_SUPPORTS_IOVEC is defined in librbd.h */
> -#ifdef LIBRBD_SUPPORTS_IOVEC
> -#define LIBRBD_USE_IOVEC 1
> -#else
> -#define LIBRBD_USE_IOVEC 0
> -#endif
> -
>  typedef enum {
>      RBD_AIO_READ,
>      RBD_AIO_WRITE,
> @@ -84,7 +70,6 @@ typedef struct RBDAIOCB {
>      BlockAIOCB common;
>      int64_t ret;
>      QEMUIOVector *qiov;
> -    char *bounce;
>      RBDAIOCmd cmd;
>      int error;
>      struct BDRVRBDState *s;
> @@ -94,7 +79,6 @@ typedef struct RADOSCB {
>      RBDAIOCB *acb;
>      struct BDRVRBDState *s;
>      int64_t size;
> -    char *buf;
>      int64_t ret;
>  } RADOSCB;
>
> @@ -342,13 +326,9 @@ static int qemu_rbd_set_keypairs(rados_t cluster, const char *keypairs_json,
>
>  static void qemu_rbd_memset(RADOSCB *rcb, int64_t offs)
>  {
> -    if (LIBRBD_USE_IOVEC) {
> -        RBDAIOCB *acb = rcb->acb;
> -        iov_memset(acb->qiov->iov, acb->qiov->niov, offs, 0,
> -                   acb->qiov->size - offs);
> -    } else {
> -        memset(rcb->buf + offs, 0, rcb->size - offs);
> -    }
> +    RBDAIOCB *acb = rcb->acb;
> +    iov_memset(acb->qiov->iov, acb->qiov->niov, offs, 0,
> +               acb->qiov->size - offs);
>  }
>
>  /* FIXME Deprecate and remove keypairs or make it available in QMP. */
> @@ -504,13 +484,6 @@ static void qemu_rbd_complete_aio(RADOSCB *rcb)
>
>      g_free(rcb);
>
> -    if (!LIBRBD_USE_IOVEC) {
> -        if (acb->cmd == RBD_AIO_READ) {
> -            qemu_iovec_from_buf(acb->qiov, 0, acb->bounce, acb->qiov->size);
> -        }
> -        qemu_vfree(acb->bounce);
> -    }
> -
>      acb->common.cb(acb->common.opaque, (acb->ret > 0 ? 0 : acb->ret));
>
>      qemu_aio_unref(acb);
> @@ -878,28 +851,6 @@ static void rbd_finish_aiocb(rbd_completion_t c, RADOSCB *rcb)
>                                       rbd_finish_bh, rcb);
>  }
>
> -static int rbd_aio_discard_wrapper(rbd_image_t image,
> -                                   uint64_t off,
> -                                   uint64_t len,
> -                                   rbd_completion_t comp)
> -{
> -#ifdef LIBRBD_SUPPORTS_DISCARD
> -    return rbd_aio_discard(image, off, len, comp);
> -#else
> -    return -ENOTSUP;
> -#endif
> -}
> -
> -static int rbd_aio_flush_wrapper(rbd_image_t image,
> -                                 rbd_completion_t comp)
> -{
> -#ifdef LIBRBD_SUPPORTS_AIO_FLUSH
> -    return rbd_aio_flush(image, comp);
> -#else
> -    return -ENOTSUP;
> -#endif
> -}
> -
>  static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
>                                   int64_t off,
>                                   QEMUIOVector *qiov,
> @@ -922,21 +873,6 @@ static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
>
>      rcb = g_new(RADOSCB, 1);
>
> -    if (!LIBRBD_USE_IOVEC) {
> -        if (cmd == RBD_AIO_DISCARD || cmd == RBD_AIO_FLUSH) {
> -            acb->bounce = NULL;
> -        } else {
> -            acb->bounce = qemu_try_blockalign(bs, qiov->size);
> -            if (acb->bounce == NULL) {
> -                goto failed;
> -            }
> -        }
> -        if (cmd == RBD_AIO_WRITE) {
> -            qemu_iovec_to_buf(acb->qiov, 0, acb->bounce, qiov->size);
> -        }
> -        rcb->buf = acb->bounce;
> -    }
> -
>      acb->ret = 0;
>      acb->error = 0;
>      acb->s = s;
> @@ -950,7 +886,7 @@ static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
>      }
>
>      switch (cmd) {
> -    case RBD_AIO_WRITE: {
> +    case RBD_AIO_WRITE:
>          /*
>           * RBD APIs don't allow us to write more than actual size, so in order
>           * to support growing images, we resize the image before write
> @@ -962,25 +898,16 @@ static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
>                  goto failed_completion;
>              }
>          }
> -#ifdef LIBRBD_SUPPORTS_IOVEC
> -            r = rbd_aio_writev(s->image, qiov->iov, qiov->niov, off, c);
> -#else
> -            r = rbd_aio_write(s->image, off, size, rcb->buf, c);
> -#endif
> +        r = rbd_aio_writev(s->image, qiov->iov, qiov->niov, off, c);
>          break;
> -    }
>      case RBD_AIO_READ:
> -#ifdef LIBRBD_SUPPORTS_IOVEC
> -            r = rbd_aio_readv(s->image, qiov->iov, qiov->niov, off, c);
> -#else
> -            r = rbd_aio_read(s->image, off, size, rcb->buf, c);
> -#endif
> +        r = rbd_aio_readv(s->image, qiov->iov, qiov->niov, off, c);
>          break;
>      case RBD_AIO_DISCARD:
> -        r = rbd_aio_discard_wrapper(s->image, off, size, c);
> +        r = rbd_aio_discard(s->image, off, size, c);
>          break;
>      case RBD_AIO_FLUSH:
> -        r = rbd_aio_flush_wrapper(s->image, c);
> +        r = rbd_aio_flush(s->image, c);
>          break;
>      default:
>          r = -EINVAL;
> @@ -995,9 +922,6 @@ failed_completion:
>      rbd_aio_release(c);
>  failed:
>      g_free(rcb);
> -    if (!LIBRBD_USE_IOVEC) {
> -        qemu_vfree(acb->bounce);
> -    }
>
>      qemu_aio_unref(acb);
>      return NULL;
> @@ -1023,7 +947,6 @@ static BlockAIOCB *qemu_rbd_aio_pwritev(BlockDriverState *bs,
>                           RBD_AIO_WRITE);
>  }
>
> -#ifdef LIBRBD_SUPPORTS_AIO_FLUSH
>  static BlockAIOCB *qemu_rbd_aio_flush(BlockDriverState *bs,
>                                        BlockCompletionFunc *cb,
>                                        void *opaque)
> @@ -1031,20 +954,6 @@ static BlockAIOCB *qemu_rbd_aio_flush(BlockDriverState *bs,
>      return rbd_start_aio(bs, 0, NULL, 0, cb, opaque, RBD_AIO_FLUSH);
>  }
>
> -#else
> -
> -static int qemu_rbd_co_flush(BlockDriverState *bs)
> -{
> -#if LIBRBD_VERSION_CODE >= LIBRBD_VERSION(0, 1, 1)
> -    /* rbd_flush added in 0.1.1 */
> -    BDRVRBDState *s = bs->opaque;
> -    return rbd_flush(s->image);
> -#else
> -    return 0;
> -#endif
> -}
> -#endif
> -
>  static int qemu_rbd_getinfo(BlockDriverState *bs, BlockDriverInfo *bdi)
>  {
>      BDRVRBDState *s = bs->opaque;
> @@ -1210,7 +1119,6 @@ static int qemu_rbd_snap_list(BlockDriverState *bs,
>      return snap_count;
>  }
>
> -#ifdef LIBRBD_SUPPORTS_DISCARD
>  static BlockAIOCB *qemu_rbd_aio_pdiscard(BlockDriverState *bs,
>                                           int64_t offset,
>                                           int bytes,
> @@ -1220,9 +1128,7 @@ static BlockAIOCB *qemu_rbd_aio_pdiscard(BlockDriverState *bs,
>      return rbd_start_aio(bs, offset, NULL, bytes, cb, opaque,
>                           RBD_AIO_DISCARD);
>  }
> -#endif
>
> -#ifdef LIBRBD_SUPPORTS_INVALIDATE
>  static void coroutine_fn qemu_rbd_co_invalidate_cache(BlockDriverState *bs,
>                                                        Error **errp)
>  {
> @@ -1232,7 +1138,6 @@ static void coroutine_fn qemu_rbd_co_invalidate_cache(BlockDriverState *bs,
>          error_setg_errno(errp, -r, "Failed to invalidate the cache");
>      }
>  }
> -#endif
>
>  static QemuOptsList qemu_rbd_create_opts = {
>      .name = "rbd-create-opts",
> @@ -1290,23 +1195,14 @@ static BlockDriver bdrv_rbd = {
>      .bdrv_aio_preadv        = qemu_rbd_aio_preadv,
>      .bdrv_aio_pwritev       = qemu_rbd_aio_pwritev,
>
> -#ifdef LIBRBD_SUPPORTS_AIO_FLUSH
>      .bdrv_aio_flush         = qemu_rbd_aio_flush,
> -#else
> -    .bdrv_co_flush_to_disk  = qemu_rbd_co_flush,
> -#endif
> -
> -#ifdef LIBRBD_SUPPORTS_DISCARD
>      .bdrv_aio_pdiscard      = qemu_rbd_aio_pdiscard,
> -#endif
>
>      .bdrv_snapshot_create   = qemu_rbd_snap_create,
>      .bdrv_snapshot_delete   = qemu_rbd_snap_remove,
>      .bdrv_snapshot_list     = qemu_rbd_snap_list,
>      .bdrv_snapshot_goto     = qemu_rbd_snap_rollback,
> -#ifdef LIBRBD_SUPPORTS_INVALIDATE
>      .bdrv_co_invalidate_cache = qemu_rbd_co_invalidate_cache,
> -#endif
>
>      .strong_runtime_opts    = qemu_rbd_strong_runtime_opts,
>  };
> diff --git a/meson.build b/meson.build
> index db6789af9c..eb150c70f7 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -706,13 +706,16 @@ if not get_option('rbd').auto() or have_block
>        int main(void) {
>          rados_t cluster;
>          rados_create(&cluster, NULL);
> +        #if LIBRBD_VERSION_CODE < LIBRBD_VERSION(1, 12, 0)
> +        #error
> +        #endif
>          return 0;
>        }''', dependencies: [librbd, librados])
>        rbd = declare_dependency(dependencies: [librbd, librados])
>      elif get_option('rbd').enabled()
> -      error('could not link librados')
> +      error('librbd >= 1.12.0 required')
>      else
> -      warning('could not link librados, disabling')
> +      warning('librbd >= 1.12.0 not found, disabling rbd support')
>      endif
>    endif
>  endif
> --
> 2.17.1
>
>

Reviewed-by: Ilya Dryomov <idryomov@gmail.com>

Thanks,

                Ilya

