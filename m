Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD3F6DF7DA
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 15:58:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmazR-0001kP-2G; Wed, 12 Apr 2023 09:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmazP-0001k1-6y
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:58:23 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmazN-0000rG-1e
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:58:22 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-94a35b11c08so275239766b.3
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 06:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681307899; x=1683899899;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0e0pFEliD2H3JOtOTf6pOCYOpeMUO0nENtptoJBaTxE=;
 b=JCDJdBRiUJRaj7Opn84iZuiJUbGCWne11BYGt6jtlSP/awETaEFvZObyOGSeGiQCc3
 8YuVLIwkACZ207AprR5yB3fv75QtkoVhDw2Phs/l1rFbwtFDycqNu4OrLHUwgXy7rvTT
 Db78AXA9c/vBjT8NcQa7pdKU3bPuE3z1kBy+D1e0vnEp6PWRNbEeoCK+IAkhYdprku0/
 /wULErBtJKgWLlXrD7k7WCivl5O2jne7HLOn+kPo7pwFg3214z042icHREyRWNnSX3y4
 NuEuKvj0j94h1UU1XKDsOfpRvQsLdBmdEzbaQRaiCl3Hbtv0jpULZDH4UeHGm1WUZfhX
 PUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681307899; x=1683899899;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0e0pFEliD2H3JOtOTf6pOCYOpeMUO0nENtptoJBaTxE=;
 b=5ldb+Jv4OPnYNy/qDxPfO+x6i5FEXRhz1eUxShfVWmh+9dp7Rddo/OEIAaKawCyQl6
 1xADy0xZMYRbKw19c3GoYlYqKcR+F5NIYnASdgmeS+etIF4xuku8QKwBhJT/L9V5EXTP
 fDuS83oOZXi31rTBrTpdmX7uMuvTOSy0N0kHwYhbCDByXF1iPTfM+pPly8gRPFMyGUht
 fMf0kqILxonBDyL9h/j/AVy7rUCATsvVi/jdTbEUcOE4ie4Bd6gH1L+hhTAEdwruhH+E
 T8RJC9NyEumjnR4tlDijwzFxYUNEIsOUkUC6NEx97Cvvt5YScjMI4y5N54gcg5Sg5axW
 C0FA==
X-Gm-Message-State: AAQBX9dMkDlUcMyT0QleVKWBRuCv0R6SGJ4zMST2txLbAOZpX8iydTX3
 N5Q+5CrLuoLnApk4iRxKZtWY9phBS9RdLDoGnGsd4Q==
X-Google-Smtp-Source: AKy350aiRMFJe8cmr7H0Exnz8e0XyDMq83WEgMIG8Q6B24ZgSz0EFvCBs7i/coBuyvOV2lDgqhrvkl5eL8f8vnet30E=
X-Received: by 2002:a50:d71e:0:b0:504:9c1f:1c65 with SMTP id
 t30-20020a50d71e000000b005049c1f1c65mr5576484edi.6.1681307899189; Wed, 12 Apr
 2023 06:58:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230412112606.80983-1-pbonzini@redhat.com>
In-Reply-To: <20230412112606.80983-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Apr 2023 14:58:08 +0100
Message-ID: <CAFEAcA_-jH8MAqws9TW02zZZYLqtAHz55O+PgYmwK+Dojto7DQ@mail.gmail.com>
Subject: Re: [PATCH 8.0 regression] block/nfs: do not poll within a coroutine
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

If you would like this in 8.0 then it needs to be reviewed and in a pullreq
today...

thanks
-- PMM

On Wed, 12 Apr 2023 at 12:27, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Since the former nfs_get_allocated_file_size is now a coroutine
> function, it must suspend rather than poll.  Switch BDRV_POLL_WHILE()
> to a qemu_coroutine_yield() loop and schedule nfs_co_generic_bh_cb()
> in place of the call to bdrv_wakeup().
>
> Fixes: 82618d7bc341 ("block: Convert bdrv_get_allocated_file_size() to co_wrapper", 2023-02-01)
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/nfs.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/block/nfs.c b/block/nfs.c
> index 351dc6ec8d14..417defc0cfef 100644
> --- a/block/nfs.c
> +++ b/block/nfs.c
> @@ -726,10 +726,8 @@ nfs_get_allocated_file_size_cb(int ret, struct nfs_context *nfs, void *data,
>      if (task->ret < 0) {
>          error_report("NFS Error: %s", nfs_get_error(nfs));
>      }
> -
> -    /* Set task->complete before reading bs->wakeup.  */
> -    qatomic_mb_set(&task->complete, 1);
> -    bdrv_wakeup(task->bs);
> +    replay_bh_schedule_oneshot_event(task->client->aio_context,
> +                                     nfs_co_generic_bh_cb, task);
>  }
>
>  static int64_t coroutine_fn nfs_co_get_allocated_file_size(BlockDriverState *bs)
> @@ -743,15 +741,19 @@ static int64_t coroutine_fn nfs_co_get_allocated_file_size(BlockDriverState *bs)
>          return client->st_blocks * 512;
>      }
>
> -    task.bs = bs;
> +    nfs_co_init_task(bs, &task);
>      task.st = &st;
> -    if (nfs_fstat_async(client->context, client->fh, nfs_get_allocated_file_size_cb,
> -                        &task) != 0) {
> -        return -ENOMEM;
> -    }
> +    WITH_QEMU_LOCK_GUARD(&client->mutex) {
> +        if (nfs_fstat_async(client->context, client->fh, nfs_get_allocated_file_size_cb,
> +                            &task) != 0) {
> +            return -ENOMEM;
> +        }
>
> -    nfs_set_events(client);
> -    BDRV_POLL_WHILE(bs, !task.complete);
> +       nfs_set_events(client);
> +    }
> +    while (!task.complete) {
> +        qemu_coroutine_yield();
> +    }
>
>      return (task.ret < 0 ? task.ret : st.st_blocks * 512);
>  }

