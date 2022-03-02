Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B32674CA5F9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:27:41 +0100 (CET)
Received: from localhost ([::1]:60544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPP12-0000vs-QC
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:27:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPOga-0005ES-Rs
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 08:06:34 -0500
Received: from [2607:f8b0:4864:20::b29] (port=39814
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPOgY-0005SU-L6
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 08:06:31 -0500
Received: by mail-yb1-xb29.google.com with SMTP id x200so3209177ybe.6
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 05:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o32juHoxKiHeNE8PHyNSom4k7uNVAKcVBYHX0VLWh/g=;
 b=SoLfVJA+QAfBk+HKiCzkVIVxx7F5Neehqb6ntb7JfRhmMQjfHQi/vsUQfQ/boIOA+Z
 tgV4WF6i4OtMMBgGXuawmHeqSV7vnSV/zMan0alZmcRQ4Co4wu4PM3gIQUaXjO7EC8Uo
 ysCDQVEI6OSXda16S0QULiLNf/VWzgWXP8OwCkR+fxfmqdq8o1uKsUpqs3qlnCgFmSCt
 vztmXOrA7PspCrPMbN/Lgyxl0R/RVRdogRP1eTuoHXHzSoTqie0O8XMyyGfQSXkxAecU
 WBUeXmgxbTycGgSZWl8Bq6KvGsVwuYUcmpRxmt+Jl7Lk1FYK2JKTZ92wz7qg3LEBkCtX
 uEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o32juHoxKiHeNE8PHyNSom4k7uNVAKcVBYHX0VLWh/g=;
 b=2KAsBc6AkcRVFiQ63pxGUOkxufR30DJe+DmgLMtZbZW886/w3rBbZ1ibfl5MX5mGaQ
 3to3qw3pqI7nRafrMuYLb5PgZ+GvBkG2gvMeziddnSn+bCb1VZgtzZHbepqG/ZgBUUD4
 iJ/t0vdMdryavXSU7FDjYq0h4rEQFDetkYhV4fIbHW+YGhiGavze2NQTIYE0BAQE9Wyd
 jJrVnbngdIH7zz7PtpITyalPaNS7Y+Y6ZHax5CEv5/pc0LGE2crf0R6CkjSiob7g2eXm
 Hf2jueRoX+iE9KU4OpPHw5+d1ac+2ouHC/jo7dOOORC06OoedBuTJn2KlESXcxOHTjlr
 Ofqw==
X-Gm-Message-State: AOAM530oWaLrccXDAovWzFqy2JgPifdEqLMDkXPAJHmwAFaLQnSLLWi9
 P3cOJOyJSHODx4nj5KhibsbOD7ShD3mHT3ZP0qV7ww==
X-Google-Smtp-Source: ABdhPJwhpMc5ZIOB3C265QOevtSVHDaKGSDnswoJQ6KcvSeLIJM2wg6Yvq5r+d4eQAXt31M2DHdxhOwZDsQ/gFnvqvQ=
X-Received: by 2002:a25:6e84:0:b0:628:97de:9430 with SMTP id
 j126-20020a256e84000000b0062897de9430mr4253878ybc.288.1646226389692; Wed, 02
 Mar 2022 05:06:29 -0800 (PST)
MIME-Version: 1.0
References: <20220227182125.21809-1-richard.henderson@linaro.org>
 <20220227182125.21809-8-richard.henderson@linaro.org>
In-Reply-To: <20220227182125.21809-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Mar 2022 13:06:18 +0000
Message-ID: <CAFEAcA8JuqtenpouLGFUCnTkn3P-5wLq=gg62T0dRvXg1nDKAw@mail.gmail.com>
Subject: Re: [PATCH 7/7] target/nios2: Rewrite interrupt handling
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 27 Feb 2022 at 18:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Drop irq_pending boolean.

It wasn't a boolean, it was a uint32_t.

> Drop helper_check_interrupts.
> Move checks for irq disabled into nios2_cpu_exec_interrupt.
> End the TB on writes to ienable, just like to status.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

The code changes look good to me, but I think it would be
useful to have the commit message include a brief sketch
of how the new interrupt-handling design works and mention
that this means nios2 now works like the other targets.
At the moment the commit message is all "what" (which you can
get by looking at the patch) and no "why".

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

