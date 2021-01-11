Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 777692F101A
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 11:32:16 +0100 (CET)
Received: from localhost ([::1]:57926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyuUh-00071G-It
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 05:32:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent.desnogues@gmail.com>)
 id 1kyuSs-0006XX-Ra; Mon, 11 Jan 2021 05:30:22 -0500
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:42224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent.desnogues@gmail.com>)
 id 1kyuSr-0003bX-CH; Mon, 11 Jan 2021 05:30:22 -0500
Received: by mail-il1-x130.google.com with SMTP id t3so13708898ilh.9;
 Mon, 11 Jan 2021 02:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5nSU6fUOxAJjBR8ApEe65dcbCJlA4HQiEorIUVGq9lo=;
 b=aVEwhY0hlLS5h90fgub7GMKQxSB1/L2/TN4AShMkxLporyqlp4GSEDcGIE1oLljb40
 SXucZZrzgcERc/j37m4F0monqAlz4l0ZE5RQlzSliVlstGBgeqFsvIXl8Szqme3rV3FZ
 w6uaCASYsDUzRaXblD+AWazorKve78YjazsL2RiOMjJeglF4FQx3jHxQGn49oHm/ot26
 wmBNP6+7Pz7QmyY4Mtd7VnOH4bObRJigjhCyMcqy8NIYNeXc05+wdR6Ob6AT9OlRL8Ev
 28vhFzO8YqOWq+8ATJ1d441ShW/80h8VeT8UpwYdn2z1+GH+SvEY6cLTJdR8M4pTkWFD
 b2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5nSU6fUOxAJjBR8ApEe65dcbCJlA4HQiEorIUVGq9lo=;
 b=tJqVyxttNdgPl4LiO4Lr66SGOKRQ1FVQS2agHNMZeYtO/p5USk+MJIBd57Wa17e05J
 I2eHotiNaD7QC4urk9Tr8bfgoF0GV14uk4Rhkh48GH+aQbzGBUGszpzck+rDMbTsgJhy
 in9VhlungRx4r5wAOyppcKT+IzL8CuGAWcCexU4gDLPfLxDWSuIzow5FSdEOo7XUhj6q
 H/H6EdmkzkS0bHvQZo10P3oYFc8jdVYXTlPjKBmmOCuO6t7bRYftUcBdTdkOHgsOryDq
 R3NWIFsV8ao4xSMHgalZ50xvzKf+sp3MdY9wWHL6+2NGKYcNVb9g8YyiOE1YqjLQbL3S
 G7ag==
X-Gm-Message-State: AOAM530464FYErmqak+zTiSoDb3uxjrMZIiRuOYME+oJgi9IYBkzNspP
 402PNXOEtRdNW/JWRaYUSagltTHzAi/YamDjb90=
X-Google-Smtp-Source: ABdhPJwSGjA7RPfo3K57ltlXZiNj0d/uwksBBjnVNmEFpoeiJQj27+vJ+mnKn2qLjnlkYb0yKDQyPffW8OWGCkUUkKE=
X-Received: by 2002:a92:b510:: with SMTP id f16mr14304176ile.22.1610361019643; 
 Mon, 11 Jan 2021 02:30:19 -0800 (PST)
MIME-Version: 1.0
References: <20210108185154.8108-1-leif@nuviainc.com>
 <20210108185154.8108-5-leif@nuviainc.com>
In-Reply-To: <20210108185154.8108-5-leif@nuviainc.com>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Mon, 11 Jan 2021 11:30:31 +0100
Message-ID: <CABoDooPXwqTgwmzCHiQ0G3MS53+H0MnQ4a42-q9wu5dhBaqKUA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] target/arm: add descriptions of CLIDR_EL1,
 CCSIDR_EL1, CTR_EL0 to cpu.h
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=laurent.desnogues@gmail.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 8, 2021 at 7:51 PM Leif Lindholm <leif@nuviainc.com> wrote:
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Thanks,

Laurent


> ---
>  target/arm/cpu.h | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 063228de2a..18c1cb02bb 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1736,6 +1736,37 @@ FIELD(V7M_FPCCR, ASPEN, 31, 1)
>  /*
>   * System register ID fields.
>   */
> +FIELD(CLIDR_EL1, CTYPE1, 0, 3)
> +FIELD(CLIDR_EL1, CTYPE2, 3, 3)
> +FIELD(CLIDR_EL1, CTYPE3, 6, 3)
> +FIELD(CLIDR_EL1, CTYPE4, 9, 3)
> +FIELD(CLIDR_EL1, CTYPE5, 12, 3)
> +FIELD(CLIDR_EL1, CTYPE6, 15, 3)
> +FIELD(CLIDR_EL1, CTYPE7, 18, 3)
> +FIELD(CLIDR_EL1, LOUIS, 21, 3)
> +FIELD(CLIDR_EL1, LOC, 24, 3)
> +FIELD(CLIDR_EL1, LOUU, 27, 3)
> +FIELD(CLIDR_EL1, ICB, 30, 3)
> +
> +/* When FEAT_CCIDX is implemented */
> +FIELD(CCSIDR_EL1, CCIDX_LINESIZE, 0, 3)
> +FIELD(CCSIDR_EL1, CCIDX_ASSOCIATIVITY, 3, 21)
> +FIELD(CCSIDR_EL1, CCIDX_NUMSETS, 32, 24)
> +
> +/* When FEAT_CCIDX is not implemented */
> +FIELD(CCSIDR_EL1, LINESIZE, 0, 3)
> +FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 10)
> +FIELD(CCSIDR_EL1, NUMSETS, 13, 15)
> +
> +FIELD(CTR_EL0,  IMINLINE, 0, 4)
> +FIELD(CTR_EL0,  L1IP, 14, 2)
> +FIELD(CTR_EL0,  DMINLINE, 16, 4)
> +FIELD(CTR_EL0,  ERG, 20, 4)
> +FIELD(CTR_EL0,  CWG, 24, 4)
> +FIELD(CTR_EL0,  IDC, 28, 1)
> +FIELD(CTR_EL0,  DIC, 29, 1)
> +FIELD(CTR_EL0,  TMINLINE, 32, 6)
> +
>  FIELD(MIDR_EL1, REVISION, 0, 4)
>  FIELD(MIDR_EL1, PARTNUM, 4, 12)
>  FIELD(MIDR_EL1, ARCHITECTURE, 16, 4)
> --
> 2.20.1
>

