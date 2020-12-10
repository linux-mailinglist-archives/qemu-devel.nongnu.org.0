Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2381A2D5852
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 11:38:57 +0100 (CET)
Received: from localhost ([::1]:37446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knJLc-0000RP-62
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 05:38:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom.ty89@gmail.com>)
 id 1knJJC-0007hn-HG; Thu, 10 Dec 2020 05:36:26 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:38475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tom.ty89@gmail.com>)
 id 1knJJA-0007ae-O9; Thu, 10 Dec 2020 05:36:26 -0500
Received: by mail-ed1-x542.google.com with SMTP id cw27so4948139edb.5;
 Thu, 10 Dec 2020 02:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3/afe2ISuQ300mmvMIxV0TTGORNY3C62hpOsfE8C3zg=;
 b=bOkMaZFw76M8dCd/MO4hDoCeToeFZmLS9TK4cnApZubqoRLW6XFdrvlaGx61Oav1Hn
 Ci4uC6JKFHZYiMjMgb0Gaq9kpFJ/1mxFhZZwbTM11N1XQhu/6gf9Z8JoWcfNwMZhAgL+
 cKeCO72iUsk7E+c9YTfvUcljRMzgEQD/+RDmlq0AW4oMhXt6Aw4B13Xea5j+GwF8r8rs
 xQOW7YRJCW4GyfnQIeIM1MmXqftl+1ARxAPTVeNedvw7ZuQbI6V+F6zCa0P5qvoHW11F
 pzMMcvz0emccsUQmdkIYoCN/FkDcSqBBCMVbIfZDC/BpUrP3CkCaB/Xs7O0LXSbvEgjD
 8Rtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3/afe2ISuQ300mmvMIxV0TTGORNY3C62hpOsfE8C3zg=;
 b=cCUn83+V0s+9+UokOQx+EdFjPAo8ZzVerJQ72NVwyhEPpUUg7u/ucnuMKt+9RjYqan
 orNBXqKgzAa+UFlOGsvCYwFWq7lFLvuygHfCXRCkKS9YrMJN4uNwoV8FxZSyaBxCmGS9
 xUYnjeBBNgnTXV4TtmNTYB4divJON7atOVwo7imjlzMNeGjxbRbU5Rj3hYtv279Z+Bya
 l2ZtrcnvPlURb5SGCHwx7m68LmD+k+esgNogzfavaiHdDijVmLPV9DOhQSvE2eLLi2EJ
 YZRZyyUfRYh9vbtYGyViDaGMV+zEDX9LyAEy1L1rrIb3Rh/jdDUCvyg2nr3V5uzL6Dkk
 DwBA==
X-Gm-Message-State: AOAM531/UgNA1ElmcVn6eY/euzWFStwG5W9B17ibxRmwFvJpqcLQRbTn
 KVEvoePxs6VRO8NWUb8m2AibbVmWNIwb9/RIPOc=
X-Google-Smtp-Source: ABdhPJyW0nz4XjFB52q2mlPv0nqI+4nrNdCu0yUt00TSlhMGJrEHu2F34UoFZ7Xj4ATqW/j3k3fmQV/LlbXaZNDPVOs=
X-Received: by 2002:aa7:c749:: with SMTP id c9mr6199393eds.3.1607596581657;
 Thu, 10 Dec 2020 02:36:21 -0800 (PST)
MIME-Version: 1.0
References: <20201209135355.561745-1-mlevitsk@redhat.com>
 <20201209135355.561745-2-mlevitsk@redhat.com>
In-Reply-To: <20201209135355.561745-2-mlevitsk@redhat.com>
From: Tom Yan <tom.ty89@gmail.com>
Date: Thu, 10 Dec 2020 18:36:10 +0800
Message-ID: <CAGnHSEni73NXKEhoBBpgnD1xyfyUBkAnK_7r-u0kwn6xQoD7_A@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] file-posix: split hdev_refresh_limits from
 raw_refresh_limits
To: Maxim Levitsky <mlevitsk@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=tom.ty89@gmail.com; helo=mail-ed1-x542.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, qemu-block@nongnu.org,
 Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Dec 2020 at 21:54, Maxim Levitsky <mlevitsk@redhat.com> wrote:
>
> From: Tom Yan <tom.ty89@gmail.com>
>
> We can and should get max transfer length and max segments for all host
> devices / cdroms (on Linux).
>
> Also use MIN_NON_ZERO instead when we clamp max transfer length against
> max segments.
>
> Signed-off-by: Tom Yan <tom.ty89@gmail.com>
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>  block/file-posix.c | 59 +++++++++++++++++++++++++++++++++-------------
>  1 file changed, 43 insertions(+), 16 deletions(-)
>
> diff --git a/block/file-posix.c b/block/file-posix.c
> index d5fd1dbcd2..226ddbbdad 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1162,6 +1162,12 @@ static void raw_reopen_abort(BDRVReopenState *state)
>
>  static int sg_get_max_transfer_length(int fd)
>  {
> +    /*
> +     * BLKSECTGET for /dev/sg* character devices incorrectly returns
> +     * the max transfer size in bytes (rather than in blocks).
> +     * Also note that /dev/sg* doesn't support BLKSSZGET ioctl.
> +     */
The second statement should be removed. Also maybe it's better to have
the first one right above the line `return max_bytes;`.
> +
>  #ifdef BLKSECTGET
>      int max_bytes = 0;
>
> @@ -1175,7 +1181,22 @@ static int sg_get_max_transfer_length(int fd)
>  #endif
>  }
>
> -static int sg_get_max_segments(int fd)
> +static int get_max_transfer_length(int fd)
> +{
> +#if defined(BLKSECTGET)
> +    int sect = 0;
> +
> +    if (ioctl(fd, BLKSECTGET, &sect) == 0) {
> +        return sect << 9;
> +    } else {
> +        return -errno;
> +    }
> +#else
> +    return -ENOSYS;
> +#endif
> +}
> +
> +static int get_max_segments(int fd)
>  {
>  #ifdef CONFIG_LINUX
>      char buf[32];
> @@ -1230,23 +1251,29 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>  {
>      BDRVRawState *s = bs->opaque;
>
> -    if (bs->sg) {
> -        int ret = sg_get_max_transfer_length(s->fd);
> +    raw_probe_alignment(bs, s->fd, errp);
> +    bs->bl.min_mem_alignment = s->buf_align;
> +    bs->bl.opt_mem_alignment = MAX(s->buf_align, qemu_real_host_page_size);
> +}
>
> -        if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
> -            bs->bl.max_transfer = pow2floor(ret);
> -        }
> +static void hdev_refresh_limits(BlockDriverState *bs, Error **errp)
> +{
> +    BDRVRawState *s = bs->opaque;
>
> -        ret = sg_get_max_segments(s->fd);
> -        if (ret > 0) {
> -            bs->bl.max_transfer = MIN(bs->bl.max_transfer,
> -                                      ret * qemu_real_host_page_size);
> -        }
> +    int ret = bs->sg ? sg_get_max_transfer_length(s->fd) :
> +                       get_max_transfer_length(s->fd);
> +
> +    if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
> +        bs->bl.max_transfer = pow2floor(ret);
>      }
>
> -    raw_probe_alignment(bs, s->fd, errp);
> -    bs->bl.min_mem_alignment = s->buf_align;
> -    bs->bl.opt_mem_alignment = MAX(s->buf_align, qemu_real_host_page_size);
> +    ret = get_max_segments(s->fd);
> +    if (ret > 0) {
> +        bs->bl.max_transfer = MIN_NON_ZERO(bs->bl.max_transfer,
> +                                           ret * qemu_real_host_page_size);
> +    }
> +
> +    raw_refresh_limits(bs, errp);
>  }
>
>  static int check_for_dasd(int fd)
> @@ -3601,7 +3628,7 @@ static BlockDriver bdrv_host_device = {
>      .bdrv_co_pdiscard       = hdev_co_pdiscard,
>      .bdrv_co_copy_range_from = raw_co_copy_range_from,
>      .bdrv_co_copy_range_to  = raw_co_copy_range_to,
> -    .bdrv_refresh_limits = raw_refresh_limits,
> +    .bdrv_refresh_limits = hdev_refresh_limits,
>      .bdrv_io_plug = raw_aio_plug,
>      .bdrv_io_unplug = raw_aio_unplug,
>      .bdrv_attach_aio_context = raw_aio_attach_aio_context,
> @@ -3725,7 +3752,7 @@ static BlockDriver bdrv_host_cdrom = {
>      .bdrv_co_preadv         = raw_co_preadv,
>      .bdrv_co_pwritev        = raw_co_pwritev,
>      .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
> -    .bdrv_refresh_limits = raw_refresh_limits,
> +    .bdrv_refresh_limits = hdev_refresh_limits,
>      .bdrv_io_plug = raw_aio_plug,
>      .bdrv_io_unplug = raw_aio_unplug,
>      .bdrv_attach_aio_context = raw_aio_attach_aio_context,
> --
> 2.26.2
>

