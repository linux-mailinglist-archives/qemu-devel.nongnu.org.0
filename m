Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6E32F6AF7
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 20:31:04 +0100 (CET)
Received: from localhost ([::1]:38974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08Kl-0004Wj-W6
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 14:31:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jdillama@redhat.com>)
 id 1l08AE-0004l9-BQ
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:20:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jdillama@redhat.com>)
 id 1l08AA-00022S-HA
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:20:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610652005;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ATPkJ9liOlBr5MsAXnxsC0jhIEvM0cbNQLWBEHwL0HI=;
 b=HwYboUB5Iu8YVHVVJDkKODGggj2uMRgJF/jCoqRM03uonkMuXcNi+AhvrHb/qdZfmBn7ZL
 wWsSVrLdGW1foA3OzcU2evApW9yImu0HReC0lTXjnE+758s57p3wJOV41LlbrCFPg1frfI
 9layuOTB0DVePKh94Oamfec95VgNDIM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-Tg7zNHxfOEasBuMQSyS1ew-1; Thu, 14 Jan 2021 14:18:57 -0500
X-MC-Unique: Tg7zNHxfOEasBuMQSyS1ew-1
Received: by mail-wm1-f71.google.com with SMTP id g82so2242285wmg.6
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 11:18:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=ATPkJ9liOlBr5MsAXnxsC0jhIEvM0cbNQLWBEHwL0HI=;
 b=MN+h0dLi6UOjk/GpWUlq5pC2RUjJq3qiCGZ7NezgZwjqYa+7SD4GQqfUwJ1ox6tLe0
 vy6o8PWhRpHB1Hpd+1zya0CppJ6EeOGnbszd0XYovnqnWHN1up8jMF9CZp/2ocud2wC5
 WpI7tHYxiC7Dpz/i5Ov95JKwkpEw/vKma7eeO+BHams1FZjcxfysm5aMshpyAFEPi4iH
 R0nk/6Ahaj6YBP+Ls9tkyx6c71oFufhnD2uRWkX3BS9X3X3Uj2Ed7S/3RnWXMpveQuBC
 Zkjt7y7lKDeGM2Ru2XfcM0AYWrlVlXBPA8ORzAu05xUUMus453usPI0jC52Zmer7E2fh
 kLvA==
X-Gm-Message-State: AOAM530afNud80CykGH3LYh/15TRa3kApoiMFRvcvI7jt9eOJAfE0CyE
 uloFhCoSMDPcM/Y29Y+Y4+J3YO4ms+vlZAjnT+lE23gGXlDnVgcG/tD9Lq7p5H+ao+rz7rhsrHf
 TBdCp0KEBjD0VsEJxxPpeN1yz1iGrpE0=
X-Received: by 2002:adf:dcc5:: with SMTP id x5mr9325346wrm.167.1610651935841; 
 Thu, 14 Jan 2021 11:18:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzP9edzZLtkHkHwM6P43TB3BYRC5BPhyN7BJAX4ixfJy6ACKmtzxLpPoX7df66eX09avUWc8gprjKtvxfQdCqk=
X-Received: by 2002:adf:dcc5:: with SMTP id x5mr9325331wrm.167.1610651935580; 
 Thu, 14 Jan 2021 11:18:55 -0800 (PST)
MIME-Version: 1.0
References: <20201227164236.10143-1-pl@kamp.de>
 <20201227164236.10143-5-pl@kamp.de>
In-Reply-To: <20201227164236.10143-5-pl@kamp.de>
From: Jason Dillaman <jdillama@redhat.com>
Date: Thu, 14 Jan 2021 14:18:43 -0500
Message-ID: <CA+aFP1Cbnt99DRQLwFRhxVj5Mnow6PtQpa0k4-ojOCJt3+JPJw@mail.gmail.com>
Subject: Re: [PATCH 4/7] block/rbd: add bdrv_{attach,detach}_aio_context
To: Peter Lieven <pl@kamp.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jdillama@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jdillama@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: dillaman@redhat.com
Cc: Kevin Wolf <kwolf@redhat.com>, Christian Theune <ct@flyingcircus.io>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Dec 27, 2020 at 11:42 AM Peter Lieven <pl@kamp.de> wrote:
>
> Signed-off-by: Peter Lieven <pl@kamp.de>
> ---
>  block/rbd.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index a2da70e37f..27b232f4d8 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -91,6 +91,7 @@ typedef struct BDRVRBDState {
>      char *namespace;
>      uint64_t image_size;
>      uint64_t object_size;
> +    AioContext *aio_context;
>  } BDRVRBDState;
>
>  static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
> @@ -749,6 +750,8 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>          }
>      }
>
> +    s->aio_context = bdrv_get_aio_context(bs);
> +
>      /* When extending regular files, we get zeros from the OS */
>      bs->supported_truncate_flags = BDRV_REQ_ZERO_WRITE;
>
> @@ -839,8 +842,7 @@ static void rbd_finish_aiocb(rbd_completion_t c, RADOSCB *rcb)
>      rcb->ret = rbd_aio_get_return_value(c);
>      rbd_aio_release(c);
>
> -    replay_bh_schedule_oneshot_event(bdrv_get_aio_context(acb->common.bs),
> -                                     rbd_finish_bh, rcb);
> +    replay_bh_schedule_oneshot_event(acb->s->aio_context, rbd_finish_bh, rcb);
>  }
>
>  static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
> @@ -1151,6 +1153,18 @@ static const char *const qemu_rbd_strong_runtime_opts[] = {
>      NULL
>  };
>
> +static void qemu_rbd_attach_aio_context(BlockDriverState *bs,
> +                                       AioContext *new_context)
> +{
> +    BDRVRBDState *s = bs->opaque;
> +    s->aio_context = new_context;
> +}
> +
> +static void qemu_rbd_detach_aio_context(BlockDriverState *bs)
> +{

I don't know enough about the internals of QEMU, but this seems
suspicious to be a no-op.


> +}
> +
>  static BlockDriver bdrv_rbd = {
>      .format_name            = "rbd",
>      .instance_size          = sizeof(BDRVRBDState),
> @@ -1180,6 +1194,9 @@ static BlockDriver bdrv_rbd = {
>      .bdrv_snapshot_goto     = qemu_rbd_snap_rollback,
>      .bdrv_co_invalidate_cache = qemu_rbd_co_invalidate_cache,
>
> +    .bdrv_attach_aio_context  = qemu_rbd_attach_aio_context,
> +    .bdrv_detach_aio_context  = qemu_rbd_detach_aio_context,
> +
>      .strong_runtime_opts    = qemu_rbd_strong_runtime_opts,
>  };
>
> --
> 2.17.1
>
>


--
Jason


