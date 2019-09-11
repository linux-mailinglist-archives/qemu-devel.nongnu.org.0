Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015FFAF8A2
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 11:15:07 +0200 (CEST)
Received: from localhost ([::1]:48438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7yiP-0006NF-W8
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 05:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59682)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i7y5H-0001F8-RX
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 04:34:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i7y5G-00043E-Jr
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 04:34:39 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42032)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i7y5G-00042n-Db
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 04:34:38 -0400
Received: by mail-ot1-x344.google.com with SMTP id c10so21744014otd.9
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 01:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CFx8UhCqLcFh5o7ugB22vWUJFtnolgoCeCiFTYWurOU=;
 b=lDchVrXyjhUsnEeS5L874g3nfcyEXRMij9qCKd2xbyPajf/XsGKObd6erYxaPUPKYP
 Q4C9RepNA4DJMXCdddfamzW/lvQ/OuQs4OiD1URX7lgHUMNnj6pT/S/Hv/j3VNzkD/Ls
 2wLYGrpQ3VSvTrk28HooQAJua3ABQ2kdYttXS2W+CSrGRwZ3AZBHoHS/8/pofNeHB3t/
 GyhqgplFadBKsHPeuOaqjK5ZdbNoYlrTYNMGfbLin+G2WGwggxAfYBOLJQDFVNaAItVv
 5Sd/xXu/x41vtxLyDibVrCrRcHaiip2qOei6EygtYEiEM61V+sArDwyaLfv3/VCcULj1
 bIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CFx8UhCqLcFh5o7ugB22vWUJFtnolgoCeCiFTYWurOU=;
 b=S3wASOuKwJu8+F0b98xB92peLTN2JRdAGZTedBvlZoMbAviPXdL8uX/2PnuFEWqs8A
 7xAW0EDGS/7D6emdasVwvLgMYNAOg6W3rprdyLiKLutGPqcNnZ3/G/trlV2eu+VMCnWj
 M75x9+CZ8t4Ejgt+KgpEoeWwO4gFh2k58oqdznnGwJh0tQaXYHg4pglfIQOKvIqvVlLR
 +chif6xATjd+VKkOdPczYr616a4fUzDWSbg0RjKxmPaneaB6mfzm94kbakGJ+QHcgANj
 /P8MvIFRrb7SHDpIsgs0GuHCRwdj8nO+eW+U8XfXUuzvOrokZK4x0LpjXQA5Z+eHD521
 TLWQ==
X-Gm-Message-State: APjAAAVx96BMCKWxhtqpMBVfnq+BGPQ2ph7CyDrFZuSCPl4Q1Jz9Zq5U
 PbESCLwl/+ckS74b50uGYcYJAife+NgIR8DZEmFkaQ==
X-Google-Smtp-Source: APXvYqxbfNh7X/VBvvfmlg9/rKsLiLFKDQ+b+MHwEhYQ6tMFrx+BOrsFH3+W6gK7ho/zYIuUUdJqcW6ITWEZ3Jm02JA=
X-Received: by 2002:a9d:5e11:: with SMTP id d17mr7017076oti.135.1568190877452; 
 Wed, 11 Sep 2019 01:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190911014353.5926-1-richard.henderson@linaro.org>
 <20190911014353.5926-2-richard.henderson@linaro.org>
In-Reply-To: <20190911014353.5926-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Sep 2019 09:34:26 +0100
Message-ID: <CAFEAcA8qyyNV=L6-2N4ucESDP3vX4DG6ieuPG3v7UpvVwQuXVA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH 1/3] cputlb: Disable __always_inline__
 without optimization
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
Cc: Tony Nguyen <tony.nguyen@bt.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Sep 2019 at 02:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This forced inlining can result in missing symbols,
> which makes a debugging build harder to follow.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cputlb.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index abae79650c..909f01ebcc 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1269,6 +1269,18 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
>      cpu_loop_exit_atomic(env_cpu(env), retaddr);
>  }
>
> +/*
> + * In order for the expected constant folding to happen,
> + * we require that some functions be inlined.
> + * However, this inlining can make debugging harder for a
> + * non-optimizing build.
> + */
> +#ifdef __OPTIMIZE__
> +#define ALWAYS_INLINE  __attribute__((always_inline))
> +#else
> +#define ALWAYS_INLINE
> +#endif
> +

Maybe this should go in compiler.h ?

>  /*
>   * Load Helpers
>   *
> @@ -1281,7 +1293,7 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
>  typedef uint64_t FullLoadHelper(CPUArchState *env, target_ulong addr,
>                                  TCGMemOpIdx oi, uintptr_t retaddr);
>
> -static inline uint64_t __attribute__((always_inline))
> +static inline uint64_t ALWAYS_INLINE
>  load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
>              uintptr_t retaddr, MemOp op, bool code_read,
>              FullLoadHelper *full_load)
> @@ -1530,7 +1542,7 @@ tcg_target_ulong helper_be_ldsl_mmu(CPUArchState *env, target_ulong addr,
>   * Store Helpers
>   */
>
> -static inline void __attribute__((always_inline))
> +static inline void ALWAYS_INLINE
>  store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
>               TCGMemOpIdx oi, uintptr_t retaddr, MemOp op)
>  {
> --
> 2.17.1

Either way

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

