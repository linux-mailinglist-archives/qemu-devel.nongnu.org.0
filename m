Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B846345E93
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 13:55:05 +0100 (CET)
Received: from localhost ([::1]:46924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOgYq-0002Ve-Mp
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 08:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lOgXz-0001ql-GD
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:54:11 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:33501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lOgXx-0003fa-VO
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:54:11 -0400
Received: by mail-il1-x134.google.com with SMTP id u10so17991120ilb.0
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 05:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sjdBaFOkOqc2OfZ+yfk+x83IntGrkgFyQXCIjDCa3yQ=;
 b=Dvs7sURihRh/R6DF2iUp6zav4AGc5cRIVYtN8m8wHoKHGreSFGHcvqdBCD+wOAn6gD
 xHFcwDIvkyqsztF8J36kpOI+aR/hgJhr4204E+Yh71qVBtNHRe0ycF5XpscRjvwcl8c1
 4qb1GcQwyU8z22XUcJ6uH+KZRJ6c6NdQdHg9L2I+Ylp6RE5nNnXAOKOAEh0f18YZ+I6I
 DAL84dxQ1TR8uaw5lPaxfzpRiqFZijifbDBFJAUl9jCRuYrB3l924BQEmoFxRBc/2Gag
 fj2ngSoFI2FUOVpR4efcoND4rZIh59YY9AMxP6S5xre32nNE2k/VOFgrZb53MvwnDsHh
 0AxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sjdBaFOkOqc2OfZ+yfk+x83IntGrkgFyQXCIjDCa3yQ=;
 b=A4s8A1bsOYtkSD1JIX4nd8D9HezvhSQ43qDA1/LrIN5Itm1DY6F9p7BuMKdezB+xpJ
 7p1tueaZlgix4kVEO6zoOOzR2uUc1gW6jxiBnij2CfatoY2nnFh8175Ohg7R0TA1NJiV
 trL7VMdx4TrR9hr6+Gm5/B3QVlvD/HMP0XkdrWKCGApxZaQ0pwYvf8YBjLtt7SWo1nwc
 5DrtHefs3fiFVf3BKMcISNfxB2Wd7uTD7HayfiGdtWLKRUIG2bS/U7GNQkQlFZ8rL3yD
 JK2/4RDNC/w/puEr0mAYfTFrjL+94Dyf68CGagCVgsRz7J2doOloL4vbBLoV4zQh68kw
 JVMA==
X-Gm-Message-State: AOAM532fxgc9hzUY3ssYCAQvpvjqgQ4xO5KXFf24uX25L3pjlfu3r5jo
 rAy30U/sVY+gFrcJ+pURqHBMzwgq3XRQBo2Dy3E=
X-Google-Smtp-Source: ABdhPJxkpf2KVkKIr1lnm0t7+IbFl3Av+odPrlR1Ists1kEMHZZuKHKCKaojq/6d6/hjBHwKlsc/xpzdlQgBnJ27kHs=
X-Received: by 2002:a92:c102:: with SMTP id p2mr4477663ile.227.1616504048844; 
 Tue, 23 Mar 2021 05:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <0733e356-5384-8e8f-120c-986f031df53c@gmx.de>
In-Reply-To: <0733e356-5384-8e8f-120c-986f031df53c@gmx.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 23 Mar 2021 08:52:12 -0400
Message-ID: <CAKmqyKP1AvBseqiGjdZoLB5xhnQ3wG5ZhifeqDZ_ZOXH0npXzg@mail.gmail.com>
Subject: Re: [PATCH] docs/system/generic-loader.rst: Fix style
To: Axel Heider <axelheider@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
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

On Mon, Mar 22, 2021 at 3:40 PM Axel Heider <axelheider@gmx.de> wrote:
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

