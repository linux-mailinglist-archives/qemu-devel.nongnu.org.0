Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C245A3C5EA3
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 16:56:56 +0200 (CEST)
Received: from localhost ([::1]:55388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xMd-0007rm-QX
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 10:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m2xKo-0006to-G9
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:55:02 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:40947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m2xKm-0000rO-4z
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:55:02 -0400
Received: by mail-io1-xd33.google.com with SMTP id l5so22989275iok.7
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 07:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6PVBEzwUnzx4QLZUAUReR9NUGO6EXj4SdT/w1GHZT8U=;
 b=TQfZ7Qv3rZ9Yt5TFVAr3CdQh16gMLh5qXfEBLwMzwA8cZCtH2cTNxgqfttSpCLPV2b
 URi3aPsuBJp28/u6yXzHo7agdnxKRZ3IJY02rs9HV2TiEOlP2LaEFSa3x9ncfSDKJpbk
 e9r8/mfZctLPRE/fOfz1FKFli7mmtoF94iTCIZlm7daQCM5D9LTrFylo+9yw0FvmRLMa
 iLI1/6BtnS2YNkIX2sj+nOW3Ot/q6gL+ohbwRVpk1+N6HvA1cehKGEA51RdV89QOW++3
 ngCo+7FWs8PcUeKFgweZsHDJwaniJYZjASv1+HEJOxeMeLoMR3SayqkFAKIK5daU3TXW
 afhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6PVBEzwUnzx4QLZUAUReR9NUGO6EXj4SdT/w1GHZT8U=;
 b=Hl2K7/N2CnVCeb3t2CtvMTH81aFb25UcGqhJTRw2EsOSwgN6U96Jp5k/U/Z/I3W/Rr
 3WcN8IvpsRfWZsT1FEzR0E7oQ5J/tWRrC7+mjVDWP1Zo1VVyJK8cPj7cAIK93W17r7NR
 xMM6B51dwszeCmB8JXt8wp7JbdGyXXKbJYPevj7pLZnctbA3L5L1GNtJwdNgAavAJQmn
 JsaBsuAE3OGG0+aXn2OxRibCVQxl1MDWZjfKq5y2iursvCeFCO3JMyEu8QFjzJDLG++7
 L3yPLea1ymSKhAPY20otspF+YXcuI9vfDDVIdPEosLeRvWYYp+I+aqI0pS4iEPpOs3Xx
 /WDg==
X-Gm-Message-State: AOAM531jNi2l8/bb7Wmppa9l9WBZUkaRRhY6GqPhnbUWkWfJ+LCILLkP
 lO4netiDJptpAM9HrIRKPg8X91nkh70wAyzSRFA=
X-Google-Smtp-Source: ABdhPJwf2+bY5/LNABDnFAtcos8HzCFxyCKKCu5lPOi5zldjg6GN5liF3OfpMXegfABH7IkWaEn8nkx8Y4xfl2crnE8=
X-Received: by 2002:a5d:91d8:: with SMTP id k24mr40070125ior.84.1626101698885; 
 Mon, 12 Jul 2021 07:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210712131030.465621-1-pbonzini@redhat.com>
In-Reply-To: <20210712131030.465621-1-pbonzini@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Mon, 12 Jul 2021 16:54:47 +0200
Message-ID: <CAM9Jb+gj50rym=VF+AeBn6_EDqgzPyOdOuWBr3B3UsmXyaChBw@mail.gmail.com>
Subject: Re: [PATCH] io_uring: move LuringState typedef to block/aio.h
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd33.google.com
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
Cc: alex.bennee@linaro.org, Qemu Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> The LuringState typedef is defined twice, in include/block/raw-aio.h and
> block/io_uring.c.  Move it in include/block/aio.h, which is included
> everywhere the typedef is needed, since include/block/aio.h already has
> to define the forward reference to the struct.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/io_uring.c        | 4 ++--
>  include/block/aio.h     | 8 ++++----
>  include/block/raw-aio.h | 1 -
>  3 files changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/block/io_uring.c b/block/io_uring.c
> index 00a3ee9fb8..aa856a4c5d 100644
> --- a/block/io_uring.c
> +++ b/block/io_uring.c
> @@ -46,7 +46,7 @@ typedef struct LuringQueue {
>      QSIMPLEQ_HEAD(, LuringAIOCB) submit_queue;
>  } LuringQueue;
>
> -typedef struct LuringState {
> +struct LuringState {
>      AioContext *aio_context;
>
>      struct io_uring ring;
> @@ -56,7 +56,7 @@ typedef struct LuringState {
>
>      /* I/O completion processing.  Only runs in I/O thread.  */
>      QEMUBH *completion_bh;
> -} LuringState;
> +};
>
>  /**
>   * luring_resubmit:
> diff --git a/include/block/aio.h b/include/block/aio.h
> index 807edce9b5..8e2e4fe10f 100644
> --- a/include/block/aio.h
> +++ b/include/block/aio.h
> @@ -54,7 +54,7 @@ typedef void IOHandler(void *opaque);
>  struct Coroutine;
>  struct ThreadPool;
>  struct LinuxAioState;
> -struct LuringState;
> +typedef struct LuringState LuringState;
>
>  /* Is polling disabled? */
>  bool aio_poll_disabled(AioContext *ctx);
> @@ -209,7 +209,7 @@ struct AioContext {
>       * State for Linux io_uring.  Uses aio_context_acquire/release for
>       * locking.
>       */
> -    struct LuringState *linux_io_uring;
> +    LuringState *linux_io_uring;
>
>      /* State for file descriptor monitoring using Linux io_uring */
>      struct io_uring fdmon_io_uring;
> @@ -513,10 +513,10 @@ struct LinuxAioState *aio_setup_linux_aio(AioContext *ctx, Error **errp);
>  struct LinuxAioState *aio_get_linux_aio(AioContext *ctx);
>
>  /* Setup the LuringState bound to this AioContext */
> -struct LuringState *aio_setup_linux_io_uring(AioContext *ctx, Error **errp);
> +LuringState *aio_setup_linux_io_uring(AioContext *ctx, Error **errp);
>
>  /* Return the LuringState bound to this AioContext */
> -struct LuringState *aio_get_linux_io_uring(AioContext *ctx);
> +LuringState *aio_get_linux_io_uring(AioContext *ctx);
>  /**
>   * aio_timer_new_with_attrs:
>   * @ctx: the aio context
> diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
> index 251b10d273..af0ea0fba4 100644
> --- a/include/block/raw-aio.h
> +++ b/include/block/raw-aio.h
> @@ -59,7 +59,6 @@ void laio_io_unplug(BlockDriverState *bs, LinuxAioState *s);
>  #endif
>  /* io_uring.c - Linux io_uring implementation */
>  #ifdef CONFIG_LINUX_IO_URING
> -typedef struct LuringState LuringState;
>  LuringState *luring_init(Error **errp);
>  void luring_cleanup(LuringState *s);
>  int coroutine_fn luring_co_submit(BlockDriverState *bs, LuringState *s, int fd,
> --

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>

