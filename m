Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9234FA956
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 17:42:48 +0200 (CEST)
Received: from localhost ([::1]:37952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndDEd-0007vx-9p
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 11:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndDDZ-0006Nh-GO
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 11:41:41 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:46863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndDDY-0003lv-1t
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 11:41:41 -0400
Received: by mail-pf1-x433.google.com with SMTP id p25so4185895pfn.13
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 08:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UzVM9aBPS1WN/pD0r3O7a3EVzrhjEClS05dpuMI9nG8=;
 b=odr3NQlqSsx4Qwt6k8iNVvJjOctwh52h2da17wFHbb4edeuCKLrBFLbmULnUovj6Hb
 KK+RiieVA5FpbYecxx3KdN8lE7khFHApbyj1Myq49mOtqwHnbyt+1RVtA+RE5YhxHcDd
 VpxO8ccGJdXAd7vcNbLi727K5eF6oAr4I05EQJwczv5GQhHtb62UB3WHhnMphancohZi
 dHTa5LbvqgDCY5rKgdgT2pn13c2v/pBUKVBGXOX3YJ9SdlQ2zwIsMWioj87Uv8ZEV/AD
 hUAZoIobUKEBSUbdFol5H9eL/eJVy0QafoMwGhzwJJSGYOqIXHjdd9DS1HzXwkTINAjY
 P2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UzVM9aBPS1WN/pD0r3O7a3EVzrhjEClS05dpuMI9nG8=;
 b=5wC7HIcOiW0Xg385oOHKgKyoyA8Oc3x77xN0/S6ixnqNA1ZBIsFAlfxwfCKHKqFImE
 lSOtSTFG5UzgWyxcaVj28gI7BsnPtaGuAAPnj1U1mxl+l72LR7pEuXRDVd/oaYHmNC1T
 OmVCa8ao6lwNQacQJkn/AL+tr9k/mrAcaxK0kGmXvwoOhVwhjuhd9Endw1nWEeMJVJvX
 1g37TTD8g3lraQ/1zNxxxKRNo+jU/vYBM0iMo/WHhZQDt2IetOD00E/LItHue222SkDC
 +gd/rFQNeQP8N060a76t3fMwsKT3Siu5jfGbYy9PdYCWQNgvjAyPHUmlAFEiDBeuIy/s
 S/5g==
X-Gm-Message-State: AOAM532ZKqx5D8gAdy6zxB4c5uQ77LyUNI7iZLFAchCygaAQvKujFG25
 IzPu0BxjEnUnjZE6R0D3PNHnWQ==
X-Google-Smtp-Source: ABdhPJytk+OcYO6W17VS6fzGyqPSX9oNf4+1WeO3zxVfF6wBRsK3PsehIOcCpPSeD8XiICTL4bx2Ww==
X-Received: by 2002:a05:6a00:4007:b0:4fa:9505:8ac0 with SMTP id
 by7-20020a056a00400700b004fa95058ac0mr24742390pfb.67.1649518898596; 
 Sat, 09 Apr 2022 08:41:38 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a056a00114d00b004c122b90703sm29295283pfm.27.2022.04.09.08.41.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 08:41:38 -0700 (PDT)
Message-ID: <171310c6-d0f1-27cf-9fbf-a02682dc08ab@linaro.org>
Date: Sat, 9 Apr 2022 08:41:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] target/riscv: use xlen in forging isa string
Content-Language: en-US
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20220409094612.1908512-1-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220409094612.1908512-1-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, alistair.francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/9/22 02:46, Frédéric Pétrot wrote:
> Since we now have xlen in misa, let's not use TARGET_LONG_BITS while
> forging the isa string, and use instead riscv_cpu_mxl_bits.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> ---
>   target/riscv/cpu.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0c774056c5..0644b3843e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -984,7 +984,8 @@ char *riscv_isa_string(RISCVCPU *cpu)
>       int i;
>       const size_t maxlen = sizeof("rv128") + sizeof(riscv_single_letter_exts);
>       char *isa_str = g_new(char, maxlen);
> -    char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
> +    char *p = isa_str + snprintf(isa_str, maxlen, "rv%lu",
> +                                 riscv_cpu_mxl_bits(&cpu->env));

The fact that you need to use %lu here means riscv_cpu_mxl_bits needs fixing: use of 
unsigned long is always a mistake in QEMU.  Either int is fine (as in this case), or you 
need uint64_t and ULL.


r~

