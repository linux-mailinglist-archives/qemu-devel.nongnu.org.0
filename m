Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1843B3DA416
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 15:28:07 +0200 (CEST)
Received: from localhost ([::1]:40080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9650-0002PY-4Z
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 09:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m963j-0001df-F4
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 09:26:47 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:42809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m963h-0001EW-DK
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 09:26:47 -0400
Received: by mail-ej1-x630.google.com with SMTP id e19so10678988ejs.9
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 06:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CkAWKfl/aCxpbSTBdWlx7sNjok56q7Wzfi7rgEid1aM=;
 b=iCjNd6kC23x5A7XRTQ1Yu+h510wHsM8D1Y/k2P5bzDNBhdr18UMGsL+Ft6aLGtt8AY
 5myfLZdbSUCi0V4Boo06gayKXyHHIvRL5jYXSCi84GmZ8+yOqwHa5MuvJZ8KjXxjhip4
 F2358UOPLwI2/nep6lvvmGdkb01Oo7rQrSTB6Mt9vmyAaSIF9fw+FgblY48wtJXP0V34
 H6RZsi8h0PVyhABEx0QSYMcGy69/tmZ+x5RK8bHj48dM9NlNWCBDDzTqZeoZpLEtHwnZ
 ahN5Rdc25n9l6NPcwkduBBWHao636uj538W1SmcbjtD+mtj1qr+gu3RvtKUusOArpWKt
 f+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CkAWKfl/aCxpbSTBdWlx7sNjok56q7Wzfi7rgEid1aM=;
 b=AjeY7ZMxHHA024hgf30eXHhH4ttG6DchJdEtB1G8XLrY2A72Ajnjfg/qML4U6e6FAm
 TThW3+cgKpgyaFOMULFMOounFovmuIx7gTi+VmZ1Dz4BArBqVebFeR68p20AtERvgCtJ
 ZEp0V5p+YwCi64nRgvx1HE4md0jj62LgoezMEXh6dHqO7A9wIIZGPUrH2ugXQr9sn5IF
 PDdZ9jTftSLv6llLgytPnXI7eRRr16hpVwCSTI655Uln+KCqExdDKQaZmx3BCPp9UwXw
 BlWPZhY7RET76hTPz7YwlfVgLPYo8OKFf5/nFN39/Xt70Nk5PlfcLp2rgCqKCedQQcYv
 rqKQ==
X-Gm-Message-State: AOAM532AvAbwaqpOv3cY4PRvrkqac3x++NR0KGKnayPOh6dMU8dy9l2I
 6z4TjoJ3VYcgSfujauVliSa2TEsWd1s/muvebxFXng==
X-Google-Smtp-Source: ABdhPJxcJDsUmrOUV5Ecb+wJizRgXUXoemHWvfgFHD8HnZdaacFrwRj7UjXjROPGYMncO2GD3hk5Nyrz5z637yYBQb0=
X-Received: by 2002:a17:906:948f:: with SMTP id
 t15mr4659427ejx.85.1627565202787; 
 Thu, 29 Jul 2021 06:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-6-richard.henderson@linaro.org>
In-Reply-To: <20210729004647.282017-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jul 2021 14:26:00 +0100
Message-ID: <CAFEAcA-gkse1PAzXuOwCrEbQXDiaMRWctyFSk46CC=A=oZg_tw@mail.gmail.com>
Subject: Re: [PATCH for-6.2 05/43] target/microblaze: Implement
 do_unaligned_access for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Jul 2021 at 01:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/microblaze/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index 72d8f2a0da..cbec062ed7 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -367,11 +367,11 @@ static const struct TCGCPUOps mb_tcg_ops = {
>      .synchronize_from_tb = mb_cpu_synchronize_from_tb,
>      .cpu_exec_interrupt = mb_cpu_exec_interrupt,
>      .tlb_fill = mb_cpu_tlb_fill,
> +    .do_unaligned_access = mb_cpu_do_unaligned_access,
>
>  #ifndef CONFIG_USER_ONLY
>      .do_interrupt = mb_cpu_do_interrupt,
>      .do_transaction_failed = mb_cpu_transaction_failed,
> -    .do_unaligned_access = mb_cpu_do_unaligned_access,
>  #endif /* !CONFIG_USER_ONLY */
>  };

If I'm reading the kernel sources correctly, for Microblaze it always
fixes up unaligned accesses, so for our linux-user code we want
"ignore unaligned access errors" rather than reporting them up
to cpu-loop.c, I think ?

-- PMM

