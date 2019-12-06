Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5491157BE
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 20:25:09 +0100 (CET)
Received: from localhost ([::1]:44524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idJDw-0002bp-OW
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 14:25:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49424)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1idIvn-0003Gq-OV
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 14:06:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1idIvm-000840-Ea
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 14:06:23 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:37414)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1idIvk-00080s-M4
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 14:06:22 -0500
Received: by mail-oi1-x244.google.com with SMTP id x195so745930oix.4
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 11:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sJlAk5ocPoSio1nKOKPWC5tcYKR+YZRrEJtzX/ztNYI=;
 b=T1KuvM3B8I5csV4EXbsOzevR7QWXI9G3K8t+gl+MmSzCfM5gNFqynjuBEwsklXKtQk
 Jq4+7snMEQ9BitvSeDKDnjuadmlNpipp9uWQewzo3sOHBgM2+5uOSafcrWZnqhHoS7VS
 Rzd93wAQga38BWKUSYxvEnDdrv0YRv9mXnunlOBTqcCDGBOFuhA8PdahjE8s9WUu023U
 jxXANlsF/1xpnRWomY3XiPzKh9VJmKDgeop7/MsdxekrF2BEqvmjHm8f9IxS5wnlNxij
 Mpax72qGbK4Mn2bMjeQKB/0DLccb/0wUGzGOLFHrVf0y5M/hemPcAi0QRYNi/UNLilcn
 TThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sJlAk5ocPoSio1nKOKPWC5tcYKR+YZRrEJtzX/ztNYI=;
 b=gKyQbBf1FrtR2mHK55wvjvIab67eaNH5kMPVRvrGhi9vBAcOTQLbV6kNG0V59zAS4e
 1iaTibpONZ3y9/QLfQVBlMT+kFD0s221CWa+1z12/2a5BpytULAGYQaf4A7QLpopLhZF
 IZNBK7Mp8oVPcXOhV9OkoVWGQgLfIV3V/IzhweebU8P0Dg3sXGrHEPXCB/nZf/WHzncc
 75xarzB+gJdiSRuM+LHn6QPWouu5Fy7prUWTnVoQYOSdoF1VIm3U8H5zqqWqUzEjC8d/
 qJPDqe1z/LltRipbeG1ns5XjUDUlz4Errx+g99cOJjpPMqebmc3m92//k3XlGTx+Xjju
 b0WA==
X-Gm-Message-State: APjAAAXqjLXkS8nrpDWdKf6hXNxoi4UGhpxpxEjGbSdHszO9nugLAvt4
 yw3giguhImJR0/5WfoIff/8ZuSZEyavzOzH7cgxyhw==
X-Google-Smtp-Source: APXvYqzJKXHC1SZf91Iiw1W8EqGqhNuSLLXRFiWHHZLnrNgfjk75/+3XAtuFtbtw7w1RxpeUj1jNJdEpOpSMR6NB4EI=
X-Received: by 2002:aca:3182:: with SMTP id
 x124mr14038668oix.170.1575659178540; 
 Fri, 06 Dec 2019 11:06:18 -0800 (PST)
MIME-Version: 1.0
References: <20191203225333.17055-1-richard.henderson@linaro.org>
 <20191203225333.17055-5-richard.henderson@linaro.org>
In-Reply-To: <20191203225333.17055-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2019 19:06:07 +0000
Message-ID: <CAFEAcA83mPOxhg7k1mqRkWrE9Jzy5OnYVEv5DjU=N9GTquGsyQ@mail.gmail.com>
Subject: Re: [PATCH 04/11] target/arm: Reduce CPSR_RESERVED
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Dec 2019 at 22:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since v8.0, the CPSR_RESERVED bits have been allocated.
> We are not yet implementing ARMv8.4-DIT; retain CPSR_RESERVED,
> since that overlaps with our current hack for AA32 single step.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 22c5706835..49dc436e5e 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1149,12 +1149,16 @@ void pmu_init(ARMCPU *cpu);
>  #define CPSR_IT_2_7 (0xfc00U)
>  #define CPSR_GE (0xfU << 16)
>  #define CPSR_IL (1U << 20)
> -/* Note that the RESERVED bits include bit 21, which is PSTATE_SS in
> +/*
> + * Note that the RESERVED bits include bit 21, which is PSTATE_SS in
>   * an AArch64 SPSR but RES0 in AArch32 SPSR and CPSR. In QEMU we use
>   * env->uncached_cpsr bit 21 to store PSTATE.SS when executing in AArch32,
>   * where it is live state but not accessible to the AArch32 code.
> + *
> + * TODO: With ARMv8.4-DIT, bit 21 is DIT in AArch32 (bit 24 for AArch64).
> + * We will need to move AArch32 SS somewhere else at that point.
>   */
> -#define CPSR_RESERVED (0x7U << 21)
> +#define CPSR_RESERVED (1U << 21)
>  #define CPSR_J (1U << 24)
>  #define CPSR_IT_0_1 (3U << 25)
>  #define CPSR_Q (1U << 27)

Should we retain the current behaviour of forbidding
guest writes to the CPSR (directly, or via exception
return and SPSR->CPSR writes) from messing with the
PAN and SSBS bits on CPUs which don't implement those
features ?

thanks
-- PMM

