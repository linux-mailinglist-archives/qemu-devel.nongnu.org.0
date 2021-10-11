Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F0F429958
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 00:10:14 +0200 (CEST)
Received: from localhost ([::1]:57544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma3Uq-00069R-Sc
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 18:10:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ma3Rs-0004zd-0B
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 18:07:08 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ma3Rn-0006dO-9W
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 18:07:05 -0400
Received: by mail-wr1-x433.google.com with SMTP id t2so60523553wrb.8
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 15:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QwIpmXyBKUhTxg0LNh4eIHYy3m9LkqcumS3fVNwzVfg=;
 b=ia/R5lpL97U0AX0ZJ9Y0OOoR7nF2FFttDGtM7svTL50+cUFqomotK3CGUuU2WLQsvA
 iTurvqOEZDvS5SbHCzMU+dNInMHfLGhvR7xxXNqVsryeoPoWJTWkPqkrxZhuPvaB1Aqt
 IjfUZDci38MIoZlrL9eLN/vrZCLzKi94aklH7Gf0qp1Rs7yzNpFxq7/M80oxxxX2X5Fb
 GTRlwm7vt/9ib0o6IwahybyXgyGWa0Zpgd6BLzMSIjNCh0jSNQqpnBS8dksS+RJyS25P
 nYL7nABhW7La+DIt6wqpSarWAKOo1ueYPqsQhWOm3WYII2+RZ5s/GxcFn4equYoNxpze
 +fdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QwIpmXyBKUhTxg0LNh4eIHYy3m9LkqcumS3fVNwzVfg=;
 b=3A15LX94cSYvpucuTVg6wSkQelrvnJ4wW8DUs7vjwzxhaSYRqlw8K6G7QGl7+nnKnN
 9UeA4cyD6HjopLl5Daxv7Y8V2roiTEzs+vcv92PSMAUx+TYnZBU5pj544lcunTRGnTlS
 EchTy/PCsdHYVe7zwcWjZeM9K2jpGApFlBrxpOjpHbtOb9IkuazES1p8SqG30fxvikaZ
 IKCyn3tPFHbkCxSqgOapro9jv5xYGDxzSZwP6ru1kHmLASD4eCyZDcOoyHKSLX0k+0Gk
 FE1jrfIgwzGoi2eff9XgM665hTMaj7pGEXgs42QQyV8tP6w0TZGdhOqZCvlTNxl55s1X
 Eepw==
X-Gm-Message-State: AOAM533mSPHTWA5zpIa7zB9veKPOtU+snE1qJks8gK6aIBPG8jYy5UBC
 7J+Z8z8uQ+X7GJpkj+bIA10=
X-Google-Smtp-Source: ABdhPJyv6wWzHphkzKXuTN8HmwbiOcLAdCZetlji/OYGvKpC5xYIk1lfXpd9dKk1dhFfSCTdchYZZQ==
X-Received: by 2002:a05:6000:550:: with SMTP id
 b16mr27946661wrf.297.1633990021612; 
 Mon, 11 Oct 2021 15:07:01 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id c77sm634227wme.48.2021.10.11.15.07.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 15:07:01 -0700 (PDT)
Message-ID: <a11552d8-10e3-d832-22a9-bfb6416ea400@amsat.org>
Date: Tue, 12 Oct 2021 00:06:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 4/8] accel/tcg: Add guest_base_signed_addr32 for user-only
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211010174401.141339-1-richard.henderson@linaro.org>
 <20211010174401.141339-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211010174401.141339-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.452,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: git@xen0n.name, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/10/21 19:43, Richard Henderson wrote:
> While the host may prefer to treat 32-bit addresses as signed,
> there are edge cases of guests that cannot be implemented with
> addresses 0x7fff_ffff and 0x8000_0000 being non-consecutive.
> 
> Therefore, default to guest_base_signed_addr32 false, and allow
> probe_guest_base to determine whether it is possible to set it
> to true.  A tcg backend which sets TCG_TARGET_SIGNED_ADDR32 will
> have to cope with either setting for user-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu-all.h  | 16 ++++++++++++++++
>  include/exec/cpu_ldst.h |  3 ++-
>  bsd-user/main.c         |  4 ++++
>  linux-user/main.c       |  3 +++
>  4 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index 32cfb634c6..80b5e17329 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -146,6 +146,7 @@ static inline void tswap64s(uint64_t *s)
>  
>  #if defined(CONFIG_USER_ONLY)
>  #include "exec/user/abitypes.h"
> +#include "tcg-target-sa32.h"

Unrelated but this header could be simplified by moving this
block to a new header such "exec/user/address.h".

>  
>  /* On some host systems the guest address space is reserved on the host.
>   * This allows the guest address space to be offset to a convenient location.
> @@ -154,6 +155,21 @@ extern uintptr_t guest_base;
>  extern bool have_guest_base;
>  extern unsigned long reserved_va;
>  
> +#if TCG_TARGET_SIGNED_ADDR32 && TARGET_LONG_BITS == 32
> +extern bool guest_base_signed_addr32;
> +#else
> +#define guest_base_signed_addr32  false
> +#endif
> +
> +static inline void set_guest_base_signed_addr32(void)
> +{
> +#ifdef guest_base_signed_addr32
> +    qemu_build_not_reached();
> +#else
> +    guest_base_signed_addr32 = true;
> +#endif
> +}
> +
>  /*
>   * Limit the guest addresses as best we can.
>   *

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

