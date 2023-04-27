Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C8F6F005B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 07:16:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prtyY-0003KC-R6; Thu, 27 Apr 2023 01:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1prtyT-0003JQ-TJ; Thu, 27 Apr 2023 01:15:22 -0400
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1prtyR-00035a-FM; Thu, 27 Apr 2023 01:15:21 -0400
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-44048c2de4cso2763761e0c.0; 
 Wed, 26 Apr 2023 22:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682572517; x=1685164517;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bqUrs91UYetTrl+ri7PLvkwp49En2edoeWjdVZM7s6E=;
 b=l8O33sMeWWmiOUqMBruXyZSj6H4g7cVRyUQJX2j/czOwMFG5q34/Kns3bMFo4e42J0
 CbbaEwymXnftBr0iMu37biy0z+jW6dM3nnf98HKjsqEzjUz8OvcKmvCGiT+WE7LXaVFv
 lhrlU31ha1dZnDZjGekATJhFTxXWBFdb/7pLizS8OlZxE+4Ejby46aVpS3mpyX9POYlj
 +baaKbq4E5/qYwz0traHoCsPi7jcg48pGes6+FqBlqd1qDWOJwYfm4O3r0gYJrq2UpQy
 gtQu8F4iy9zz7LZbFpsp2bNhv1nWc54FKbJSKzecAJszBmOMMhPOgCUv5H5+3FMmEW4h
 6ztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682572517; x=1685164517;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bqUrs91UYetTrl+ri7PLvkwp49En2edoeWjdVZM7s6E=;
 b=XUA2UDocqSTEp7/U+WR2ORwZrPyTWKFCHc4y4dIZqM3FeaY1bsJ7YD+wk0l/RHPVGN
 wXgi/qh+M692OASrV6DaWoGEkwokpFOQ797wIAExEgYpQU1qk7qlGmD3OPKq/EEMwuAD
 sKe8c4P2E7MBr+9/vDi8z1bRnIxBQWYKE1MAsHfpuT3d7NhOyCaU0QphlQITKRwCcwfa
 K6OHRZ/O/r6yt17WZ6+Fd1e/5a2J5kEk+fj/Z8glYmD+y7tkAaK0Yk+zoCiKqZcMd09O
 XuswXHS9fm157LDpxvMfL9kc/jfzpT9AwVbOoPlSVNxpB2hPBdrd9SBZYuLAOJmYOy1X
 GeGg==
X-Gm-Message-State: AC+VfDyw+TQsbo0uo01TqUImTX93UeaCSxlkqiJ/9aQ2Br6ajeUJYp9W
 MUo8NJlNn4mbmgoKIMIogRi7hPlEVqegSL9Fic+61p/w6rE=
X-Google-Smtp-Source: ACHHUZ4w8LNq6WAyyx2Z5JFBJwgY0fRVrIi4epsujDOgS2O/CuR1vJ0qusVcIoH3KczpWxVP/aZz92i1666DG1yPAUY=
X-Received: by 2002:a1f:5cce:0:b0:43f:b31b:f1d1 with SMTP id
 q197-20020a1f5cce000000b0043fb31bf1d1mr72539vkb.13.1682572517528; Wed, 26 Apr
 2023 22:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230426211607.2054776-1-tong.ho@amd.com>
In-Reply-To: <20230426211607.2054776-1-tong.ho@amd.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 27 Apr 2023 15:14:51 +1000
Message-ID: <CAKmqyKOJ9r5PfS3g+ghBoZYz4uUaHWH3pbNA11A+XvJsp+OF+A@mail.gmail.com>
Subject: Re: [PATCH] hw/nvram: Avoid unnecessary Xilinx eFuse backstore write
To: Tong Ho <tong.ho@amd.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me, 
 edgar.iglesias@gmail.comi, frasse.iglesias@gmail.com, 
 peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Apr 27, 2023 at 10:31=E2=80=AFAM Tong Ho <tong.ho@amd.com> wrote:
>
> Add a check in the bit-set operation to write the backstore
> only if the affected bit is 0 before.
>
> With this in place, there will be no need for callers to
> do the checking in order to avoid unnecessary writes.
>
> Signed-off-by: Tong Ho <tong.ho@amd.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/nvram/xlnx-efuse.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/hw/nvram/xlnx-efuse.c b/hw/nvram/xlnx-efuse.c
> index fdfffaab99..655c40b8d1 100644
> --- a/hw/nvram/xlnx-efuse.c
> +++ b/hw/nvram/xlnx-efuse.c
> @@ -143,6 +143,8 @@ static bool efuse_ro_bits_find(XlnxEFuse *s, uint32_t=
 k)
>
>  bool xlnx_efuse_set_bit(XlnxEFuse *s, unsigned int bit)
>  {
> +    uint32_t set, *row;
> +
>      if (efuse_ro_bits_find(s, bit)) {
>          g_autofree char *path =3D object_get_canonical_path(OBJECT(s));
>
> @@ -152,8 +154,13 @@ bool xlnx_efuse_set_bit(XlnxEFuse *s, unsigned int b=
it)
>          return false;
>      }
>
> -    s->fuse32[bit / 32] |=3D 1 << (bit % 32);
> -    efuse_bdrv_sync(s, bit);
> +    /* Avoid back-end write unless there is a real update */
> +    row =3D &s->fuse32[bit / 32];
> +    set =3D 1 << (bit % 32);
> +    if (!(set & *row)) {
> +        *row |=3D set;
> +        efuse_bdrv_sync(s, bit);
> +    }
>      return true;
>  }
>
> --
> 2.25.1
>
>

