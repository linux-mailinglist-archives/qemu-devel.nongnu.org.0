Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6548146E990
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 15:00:44 +0100 (CET)
Received: from localhost ([::1]:60536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvJyV-0004Yi-FR
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 09:00:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mvJln-0000GC-UT
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 08:47:37 -0500
Received: from [2a00:1450:4864:20::536] (port=33431
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mvJlm-0003LN-A3
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 08:47:35 -0500
Received: by mail-ed1-x536.google.com with SMTP id t5so19823969edd.0
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 05:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JmiGgvuMsxcLgips/Suc1JYFWazziXxrGN2ewziQG4c=;
 b=sTmq0h5OxfsfngKOcx11pWimgY3acuVkO0u3/Gg9hUe3dXbSU53Ovy6iecjnEPS7Q5
 mNhJ989+bthtnVL8HQIocxnXphSq1m1lhfS+Eu2plxC972ZOfa5ULWf2YInf+J698FQ7
 oKuw5JH5GPT3gbIUahm0vRZO6/dc8aUp7cwZAQijuVMuSTjjlrZ6eo5VqkjLEqD3Uea7
 cLdYdZgWkoWgMPi9wK64Rnp6JgvH1VZftWs77SG2k5pkOkAfxXGKZuvMb87a9T1UWBCj
 WmfCFctr+43SOD1RSCiuW6C2XmMgtbfAmDG1VxcSJ7c7IyCaaoNBOhUCuagqkzZ/Sh7O
 4/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JmiGgvuMsxcLgips/Suc1JYFWazziXxrGN2ewziQG4c=;
 b=aMaZTuVZqOhgd98+m7LlMsNb2BZmVbLB0Wdr2R5jyaH6kNNue7eQ3nqD555I8CK4DK
 HkXQHpsJx/XxLp8fvGGY8zLDeq1V2Y08Za94ocSY86mN+ZbH2bNudAK8EjaHOgnCu/nH
 AchHLRp8qnnUfyHR1U+845AXiqjcxSs0weZ1JaSTxC69C0j85TZG6tjpV8vSUN8CI/9/
 hF5cZlNJRqKJjwL/Y9K/qQ13sEjApPJMCT6vXJngYMhWO/BHQeaExeWPUOGTu1HRVyNJ
 WrAKyyypte2he0IB7UvMZ5tBMNe7col78dTaGVf5VyNo/vcYuHCn9bIzK5xbL+b/AbpZ
 +4CQ==
X-Gm-Message-State: AOAM532KiPtu2Xn3AuJ+NGGaSPvu/xNE+3KR0aQlfFTYH3ik3d5jTROQ
 t9rTpFZbvyCmunvlV0ijT6sQlk3MChN8PkorTM+ljg==
X-Google-Smtp-Source: ABdhPJzN5QlTGDrsSK3kajT7obh3CyCnfPbPz/9MJ93LwUba6pqy1yOe6d+CYU/PxdGo9NXE7h5bc3y7QDxQM5n66I4=
X-Received: by 2002:a50:d594:: with SMTP id v20mr28980882edi.401.1639057650515; 
 Thu, 09 Dec 2021 05:47:30 -0800 (PST)
MIME-Version: 1.0
References: <CALm7yL08qarOu0dnQkTN+pa=BSRC92g31YpQQNDeAiT4yLZWQQ@mail.gmail.com>
 <CALm7yL2gSF8cstgaCmqWmn-3yn9bt0L5QDn9YnmUZQkXPa-A+A@mail.gmail.com>
In-Reply-To: <CALm7yL2gSF8cstgaCmqWmn-3yn9bt0L5QDn9YnmUZQkXPa-A+A@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 9 Dec 2021 19:17:19 +0530
Message-ID: <CAARzgwzghjsLDF+04bs=Af2uGORH8sDm1xS8Nz2xh2oAQvTC_Q@mail.gmail.com>
Subject: Re: [PATCH] virtio-blk: Fix clean up of host notifiers for single MR
 transaction.
To: mark.mielke@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::536;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x536.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 2, 2021 at 10:34 PM Mark Mielke <mark.mielke@gmail.com> wrote:
>
> Sorry... I missed copy maintainers and qemu-stable. This should be
> considered a regression.
>
> ---------- Forwarded message ---------
> From: Mark Mielke <mark.mielke@gmail.com>
> Date: Thu, Dec 2, 2021 at 11:26 AM
> Subject: [PATCH] virtio-blk: Fix clean up of host notifiers for single
> MR transaction.
> To: <qemu-devel@nongnu.org>
>
>
> The code that introduced "virtio-blk: Configure all host notifiers in
> a single MR transaction" introduced a second loop variable to perform
> cleanup in second loop, but mistakenly still refers to the first
> loop variable within the second loop body.
>
> Fixes: d0267da61489 ("virtio-blk: Configure all host notifiers in a
> single MR transaction")
> Signed-off-by: Mark Mielke <mark.mielke@gmail.com>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  hw/block/dataplane/virtio-blk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
> index 252c3a7a23..ee5a5352dc 100644
> --- a/hw/block/dataplane/virtio-blk.c
> +++ b/hw/block/dataplane/virtio-blk.c
> @@ -222,7 +222,7 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
>              memory_region_transaction_commit();
>
>              while (j--) {
> -                virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
> +                virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), j);
>              }
>              goto fail_host_notifiers;
>          }
> --
> 2.33.1
>
> --
> Mark Mielke <mark.mielke@gmail.com>
>

