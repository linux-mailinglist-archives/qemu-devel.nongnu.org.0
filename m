Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8937B344E89
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 19:27:09 +0100 (CET)
Received: from localhost ([::1]:33884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOPGe-0000oZ-Ky
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 14:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lOPEZ-0007yk-Ts
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 14:24:59 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:43701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lOPEY-0005yk-3o
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 14:24:59 -0400
Received: by mail-io1-xd31.google.com with SMTP id z136so14966934iof.10
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 11:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iQjHU/8DZZdN9uavcNFiYyCVCqme2YQpccdEH3n9Ka8=;
 b=sdxl9InrxY33NpXSTQBXFDTk+nVRyUq2pUCwbrGUdHWYck9d0NPcaxmFrW18W+0uzu
 vbCI0kZNL76yQZxqfe1+WUmKbyw/bwhXLjNKaZr40Xr6nt9JMZUAYYNjRpiwzrr4HtCC
 R1OKu3SVEM9rVbHPas9pgMIc0C2OY9z8Rlwtfb1MZBf2GIovnBug9oFk6kG5GXXXB99C
 03AQfa1Ub/JItom+b6PpKL/q9vVootSRDCeKXFOpqCkfUGozqnJ6pBAp943N58JhySKa
 f2GDHIipaAbbzdE6R8zHc/ZeFfA5vVMpp4XQexIMvIXrpIvV9dIsyrMEvZ+vGVsXUvcf
 FkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iQjHU/8DZZdN9uavcNFiYyCVCqme2YQpccdEH3n9Ka8=;
 b=DxD6nig0Uyb7mOdN8ctiOeRvOLsRjTbmvBejBcNfmd85oZxk43ioMHT5mz+B6rzq3M
 QCfyCCjxznPGTJwEXohV7rM2vh3clYwFm5bjge68KHWfTEGcXrXFISMC2tjzNOsEfsCP
 Q1xrE3Pl75R62dlNsnupnBCC7FKD6rTscoEM0Ip9n/PTqypKL6+Y2UExGwrA47LghYFG
 hGo4xawmNQzt6VaFW9A3SgO6n+5aM3rmn6c9oYzvL08gZTDnuUINE37TuXt4NJqyQvr7
 Gd9dKhSgpVkRMH0Bo+M55cjTzkcpSsr+CM3BL/Rol6fgu7E412CgTMxZUxVE/x8juM2f
 Dmtg==
X-Gm-Message-State: AOAM531fRur63ddIpYD67pdYXvRlN1LyeVRpmrR21EfmeV2ggmJECrew
 A3m9Frbxxm/Ng0x5wP+vpTjeOGDO/I3ifoK7BkA=
X-Google-Smtp-Source: ABdhPJwU9neyb+77uGJG5Bml9bNnVzGvrWm0DRHyXRbisqU3GEi120zFr54RTl1FfvdFltCskNF72MDVFwtiVB59NEA=
X-Received: by 2002:a05:6638:3791:: with SMTP id
 w17mr615237jal.91.1616437496948; 
 Mon, 22 Mar 2021 11:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <a7e50a64-1c7c-2d41-96d3-d8a417a659ac@gmx.de>
In-Reply-To: <a7e50a64-1c7c-2d41-96d3-d8a417a659ac@gmx.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Mar 2021 14:23:00 -0400
Message-ID: <CAKmqyKNFYzC5xkAyhZ+StNGCQUrztKQzqAQAme2wrs8CZXz1Hw@mail.gmail.com>
Subject: Re: [PATCH] docs/system/generic-loader.rst: Fix style
To: Axel Heider <axelheider@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
Cc: Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 2:09 PM Axel Heider <axelheider@gmx.de> wrote:
>
> Fix style to have a proper description of the parameter 'force-raw'.
>
> Signed-off-by: Axel Heider <axelheider@gmx.de>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  docs/system/generic-loader.rst | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/docs/system/generic-loader.rst b/docs/system/generic-loader.rst
> index 6bf8a4eb48..13457cc705 100644
> --- a/docs/system/generic-loader.rst
> +++ b/docs/system/generic-loader.rst
> @@ -92,9 +92,12 @@ shown below:
>    specified in the executable format header. This option should only
>    be used for the boot image. This will also cause the image to be
>    written to the specified CPU's address space. If not specified, the
> -  default is CPU 0. <force-raw> - Setting force-raw=on forces the file
> -  to be treated as a raw image. This can be used to load supported
> -  executable formats as if they were raw.
> +  default is CPU 0.
> +
> +``<force-raw>``
> +  Setting 'force-raw=on' forces the file to be treated as a raw image.
> +  This can be used to load supported executable formats as if they
> +  were raw.
>
>  All values are parsed using the standard QemuOpts parsing. This allows the user
>  to specify any values in any format supported. By default the values
> --
> 2.25.1
>
>

