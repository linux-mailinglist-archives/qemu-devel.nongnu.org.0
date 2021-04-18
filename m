Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4720236373B
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 21:02:10 +0200 (CEST)
Received: from localhost ([::1]:36142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYCgL-0007Wr-Ao
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 15:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYCdz-00070y-Mn
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 14:59:43 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:33613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYCdx-0002y1-VF
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 14:59:43 -0400
Received: by mail-pg1-x530.google.com with SMTP id t22so22750168pgu.0
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 11:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K36zKzCPfyI/Tvijzl0YbhxPqZISLrKzO4SxqiJ+t1E=;
 b=So/2qy1eoWbYeFfjhFn8QBDVkl0rlBRzrsOVQnYfFVq4B93YLzR21jRQZclkfDxaQv
 ZKksms6EdLrxqv+5Ql1QQ+bz0Svw+/AYoFKjn0YmI193LdYZMHazKXqBPrA1CpGavE8C
 LS+Vk4XCEL5iVjhaxYxHi2KCsEVsbS3UeC0sysSkjIb5p3mEyguC5cF2cE6+QwaGqJ9m
 2lDPxSAmCXr8YmKXH4nP8ZHcNhD0QIWSg5/Q+IrfYz8+CC54/3ExZ26y+SxOzSKKwmK8
 fBdi9Yn2qLl18HA568fwL2gvSNafcARI2jrom5S+AwhlXR5HDqHn8zmzdaaO96BcuNjd
 0/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K36zKzCPfyI/Tvijzl0YbhxPqZISLrKzO4SxqiJ+t1E=;
 b=SrOih5yAuN1L1KHadCmLzvWdrG+j+8M6EFXtxqGULnsaslwgpcR6FY/OSLGI6j4fAp
 tl77oe3utErHTaw7IVagJl6EHyW1AXsIhM7A7og2KO5/sb2kLoPiU3YiGOYqDmL7D/D6
 8AEtyovv1A5xWGMOUtEYJBbBdK15qWWp/KhIih6kvkAhCzijsT08RW8q/x5ZTdjneBxh
 wiLFgQAu7MmFw0xvVAcbm+Yz3y9iytk7aaQabOw87+VuKOnPZsCT+3sPLY5HtDJddxBB
 7k4FFP5m48nCzyAXDl5E/p98f2Z2GVYx5JSbCnwTCkrx5117j1YHVFNboV3cxR/YuHnY
 sRJg==
X-Gm-Message-State: AOAM533xnE9tQCv5chgLLWPzXD/2TdqKlHBJDE8vN+yKebH3AhPDjYJl
 5fql55ahxNIKrh4+2jxXR0LbIg==
X-Google-Smtp-Source: ABdhPJy+J93OrdTH8IlDHZloQ31fUZaJ+fyX2YfFD1rtl5/R3DqE29l9aQ2ZcOEW33lnoKm/PdZHmg==
X-Received: by 2002:a05:6a00:1aca:b029:25a:b810:94c7 with SMTP id
 f10-20020a056a001acab029025ab81094c7mr9992527pfv.15.1618772380427; 
 Sun, 18 Apr 2021 11:59:40 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id ot17sm12719554pjb.50.2021.04.18.11.59.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 11:59:40 -0700 (PDT)
Subject: Re: [PATCH 04/26] target/mips: Make CPU/FPU regnames[] arrays global
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bab213c1-40e1-167f-829c-c6b5811a3eed@linaro.org>
Date: Sun, 18 Apr 2021 11:59:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418163134.1133100-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
> +const char * const regnames[32] = {
> +    "r0", "at", "v0", "v1", "a0", "a1", "a2", "a3",
> +    "t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7",
> +    "s0", "s1", "s2", "s3", "s4", "s5", "s6", "s7",
> +    "t8", "t9", "k0", "k1", "gp", "sp", "s8", "ra",
> +};
> +
>   #if !defined(CONFIG_USER_ONLY)
>   
>   /* Called for updates to CP0_Status.  */
> diff --git a/target/mips/fpu.c b/target/mips/fpu.c
> index 39a2f7fd22e..1447dba3fa3 100644
> --- a/target/mips/fpu.c
> +++ b/target/mips/fpu.c
> @@ -16,3 +16,10 @@ const FloatRoundMode ieee_rm[4] = {
>       float_round_up,
>       float_round_down
>   };
> +
> +const char * const fregnames[32] = {
> +    "f0",  "f1",  "f2",  "f3",  "f4",  "f5",  "f6",  "f7",
> +    "f8",  "f9",  "f10", "f11", "f12", "f13", "f14", "f15",
> +    "f16", "f17", "f18", "f19", "f20", "f21", "f22", "f23",
> +    "f24", "f25", "f26", "f27", "f28", "f29", "f30", "f31",
> +};

Code motion, so,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

but I'll note that you can save space and pie runtime relocations by using

const char {f,}regnames[32][4]

since all entries are no more than 4 bytes including nul terminator.


r~

