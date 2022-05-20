Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374BA52E861
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 11:09:03 +0200 (CEST)
Received: from localhost ([::1]:39668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nryd4-0001OC-BI
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 05:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nryUz-0004WZ-NA
 for qemu-devel@nongnu.org; Fri, 20 May 2022 05:00:41 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:39832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nryUu-0003HL-2V
 for qemu-devel@nongnu.org; Fri, 20 May 2022 05:00:41 -0400
Received: by mail-yb1-xb30.google.com with SMTP id i187so10905201ybg.6
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 02:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0hhkGjR7lMnsrw+d/mq6+4NmC0RWWYlNXrMvwpsME9Q=;
 b=b6HPJozL3VdPI/z6C0ybucRlwjaFBrM+Y7C29kfJs24RIZ6jO1oSy6zGY2dNn2s3VQ
 +j5AcRapquos0h8Cbvpnfwx5OM1yj2OPFJAmksHc/4+ST7P/pEXVMhXNw0ZcV/7t0VXr
 MoKNtbGhNZbj3olHQf+vaUuPv6k8JXhsb2Ca7FJOxtJPTtJgbkM14H3wCh/oVWGtHCiQ
 UyMkMqgs4QHz8lfuuvDKiy742cRFn716EusN8xnLgry/LarWIkZ7rNAsluv1k0Ht+CQH
 sH9ZH3c3BHoq00qFrHNdqMNAdLdpYo40o6OJNi3R6HMHAoB4d6JvUyg8suAzhkixMEC+
 5E/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0hhkGjR7lMnsrw+d/mq6+4NmC0RWWYlNXrMvwpsME9Q=;
 b=DlbZTVBn7GJ051QNcg5QuA6ZlY9aaeLKa4n4IacZ/AXX5rTRE3EZsfoAuDO+9mWZe2
 fkwkOhd82vBqaCoDVUnEB9BrHAa/2ZBlXanyq1XM7cwptaQxAaAtPv8Zjy8jMalizMCC
 zUBHf84Q59AqScCaUgNZ7AtBE21A++Eit78jTdqO8JeU4k6IWboQvA3a3Ej5S/tjOwhp
 uGFzI8NP3voYXccOvw4u8EP2Ge2FpN/LFZLAt+I3XARvPVKjG3OV/90r9OPH9/Mo810R
 PN76VRztaQB+n4ajVc5w/dwewkZcJ0HyarrDVaNuj8ygSjl6Hdw1NbRodo8GbwfYJk7N
 yvFQ==
X-Gm-Message-State: AOAM533PJnsIGwOkDmlDWHKU4UwN5aeJzNU7ohFV4Utf5fJkoL464USr
 c2fGSQ1nvn9s0A6svVZsZs43AvZKB7X1hupJf+FOTJ3cOZc=
X-Google-Smtp-Source: ABdhPJzCBtXXo36pl06tFX2f6bgzO3+JXSH+TzoZPpQZ5r5u6koXrAeaBj5j0ZrJM+Ndr4pP11eFsATTUQgwLgkAE98=
X-Received: by 2002:a25:2e06:0:b0:64d:b6a5:261a with SMTP id
 u6-20020a252e06000000b0064db6a5261amr8080827ybu.140.1653037235031; Fri, 20
 May 2022 02:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220520083911.401134-1-itaru.kitayama@fujitsu.com>
In-Reply-To: <20220520083911.401134-1-itaru.kitayama@fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 May 2022 10:00:24 +0100
Message-ID: <CAFEAcA9q-JePE-9sMvo3jeu7s8r93xHDAfP36DqU069y3Fp3-w@mail.gmail.com>
Subject: Re: [PATCH] Add A64FX CPU support to the sbsa-ref board.
To: Itaru Kitayama <itaru.kitayama@gmail.com>
Cc: qemu-devel@nongnu.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 May 2022 at 09:46, Itaru Kitayama <itaru.kitayama@gmail.com> wrote:
>
> In target/arm/cpu64.c, CPU init function for A64FX is there, add this
> CPU to the sbsa-ref board.

(cc'ing the sbsa-ref maintainers)

This isn't an objection, but I would like to know what the
sbsa-ref maintainers' view is on what CPUs the board type
is supposed to handle. Is this like the virt board, where we
add basically any CPU type that might possibly work? Or is
it more like a piece of 'real' hardware, where there are only
one or two CPU types that that hardware might have shipped with,
and the firmware/software stack might not be built to cope with
anything more ?

If we can answer the general question, then specific
patches like this one will be easy to review.

> Signed-off-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> ---
>  hw/arm/sbsa-ref.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 4bb444684f..a7d27b2e55 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -146,6 +146,7 @@ static const char * const valid_cpus[] = {
>      ARM_CPU_TYPE_NAME("cortex-a57"),
>      ARM_CPU_TYPE_NAME("cortex-a72"),
>      ARM_CPU_TYPE_NAME("cortex-a76"),
> +    ARM_CPU_TYPE_NAME("a64fx"),
>      ARM_CPU_TYPE_NAME("neoverse-n1"),
>      ARM_CPU_TYPE_NAME("max"),
>  };
> --
> 2.25.1

thanks
-- PMM

