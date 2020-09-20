Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B451271597
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Sep 2020 18:09:05 +0200 (CEST)
Received: from localhost ([::1]:38238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kK1tg-0002kO-3I
	for lists+qemu-devel@lfdr.de; Sun, 20 Sep 2020 12:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1kK1sc-0002LP-4W
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 12:07:58 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1kK1sa-0006dU-FR
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 12:07:57 -0400
Received: by mail-ot1-x343.google.com with SMTP id n61so10144711ota.10
 for <qemu-devel@nongnu.org>; Sun, 20 Sep 2020 09:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TjV3FwdM8yJv/+afDTZN9KcF2CoP0wSh69O1hIkNMHg=;
 b=oTP7UrfN6THiioxXqSJtDFuW/5rLLdKYUhopJjb+DrHwQjQdR415CQP89u0G/arOJI
 iS2QszEUudDtdboKk0E+u2z8/8k8l67DYm/J9wXvneuo5oBvjIuduFvdOBfGwUpyP/UZ
 RZoOXeLphfeJDdV0X1jo4uZ78mdSXblT9kfHZzKxWQg1H/Xb5niytRoxJpyJVFyfy3TZ
 YT0MjzcT4ilSHaKIKM0xTr5mw1EyJdXjxo5vXniwCTkcTaH7GbKqabVjgB9C84MeyvKg
 5A1Oo7C5EYsZC/xdFFZQ/9sxMpQjQ4TiZ61Frlhr0BGNlf4zxy4q9fBEpUSyVo8WxPJg
 d9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TjV3FwdM8yJv/+afDTZN9KcF2CoP0wSh69O1hIkNMHg=;
 b=mVvuGJT+AEHEAnoHgpmrWN28w7kbnNuaj46nFWlFoIpbRbmGkXnpRqqKFnkF9z58m7
 RjwZorGyWjkyPWuUocD9k+HADTci6xSKM0KrQuMtN3ZXd+7X5Bcf5z7KiWONNGwggmzr
 K1vkUX18QFDvoTapCHwJRPpch4HcH4m6ehb2FasUrzDsiarHxtgTN1JQB4CKXzq7GRHD
 E7SxPAJhhKytCLHRAb6GtawlOEQA15KsOQH9dXNR+74lpAwm15dcrFFT0sebIYoZDe9q
 f6qrpGWVium3ZiFh56RrWvnj6lEc0FTK/InjpZWzdYMWH4QnSnLISjadyApx/HibWa8Q
 PlIQ==
X-Gm-Message-State: AOAM530yHzqY3iDdVBS9SdDsDd+qKGEYemHTOhj4iodUkAx6ukGyaq7N
 bEM1+MUkNvWRYpBgku0JuQbsQBtcR3Ckw8iUPTk=
X-Google-Smtp-Source: ABdhPJyfzYTnKynEn4sTOeeIbPX9NFPSIBZuu71lLvtjUFgsxkkUcmCkJhsTYvKv663OlhdWggqM5DLcVWbNfBSvs0c=
X-Received: by 2002:a9d:5e11:: with SMTP id d17mr28098315oti.333.1600618074915; 
 Sun, 20 Sep 2020 09:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200920152024.860172-1-lvivier@redhat.com>
In-Reply-To: <20200920152024.860172-1-lvivier@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Mon, 21 Sep 2020 00:07:19 +0800
Message-ID: <CAKXe6S+MjjZd+KW2czTdCP+7yTB0dw3vgSMnhfr6e898XqVB0Q@mail.gmail.com>
Subject: Re: [PATCH] vhost-vdpa: remove useless variable
To: Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=liq3ea@gmail.com; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Jason Wang <jasowang@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <lvivier@redhat.com> =E4=BA=8E2020=E5=B9=B49=E6=9C=8820=E6=
=97=A5=E5=91=A8=E6=97=A5 =E4=B8=8B=E5=8D=8811:21=E5=86=99=E9=81=93=EF=BC=9A
>
> in vhost_vdpa_listener_region_del(), try_unmap is always true and so,
> vhost_vdpa_dma_unmap() is always called. We can remove the variable
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
>  hw/virtio/vhost-vdpa.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 4580f3efd8a2..c6cae6a6cabf 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -153,7 +153,6 @@ static void vhost_vdpa_listener_region_del(MemoryList=
ener *listener,
>      hwaddr iova;
>      Int128 llend, llsize;
>      int ret;
> -    bool try_unmap =3D true;
>
>      if (vhost_vdpa_listener_skipped_section(section)) {
>          return;
> @@ -176,11 +175,9 @@ static void vhost_vdpa_listener_region_del(MemoryLis=
tener *listener,
>
>      llsize =3D int128_sub(llend, int128_make64(iova));
>
> -    if (try_unmap) {
> -        ret =3D vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
> -        if (ret) {
> -            error_report("vhost_vdpa dma unmap error!");
> -        }
> +    ret =3D vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
> +    if (ret) {
> +        error_report("vhost_vdpa dma unmap error!");
>      }
>
>      memory_region_unref(section->mr);
> --
> 2.26.2
>
>

