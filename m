Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CEF521F64
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 17:45:24 +0200 (CEST)
Received: from localhost ([::1]:34296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noS39-0004oi-RW
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 11:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noS1P-0003qb-77
 for qemu-devel@nongnu.org; Tue, 10 May 2022 11:43:35 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:53008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noS1N-0000bU-P0
 for qemu-devel@nongnu.org; Tue, 10 May 2022 11:43:34 -0400
Received: by mail-pj1-x1032.google.com with SMTP id e24so16221426pjt.2
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 08:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=h0resYfk1K5yxJGjQaDEnfx5eDc62a6WGFOzhZ19oYg=;
 b=yiGIFFJfh6zdFDTaTdsEqvgATfvVA9G3tCq84sLPelhj5WzibOuAKTixaonlO4wCtr
 Qeo6Jyq/PR/0/AKxIufTti7fJ4SxO/7F21HaLQpB5hpXwI57uhIr9WTBfCvXsvOq22MA
 fGnoAz6Ff5YmRVG6zT0uyR7tlq0mvCV8HbQOb4V9FaBCduhS5iapxnV1wrisxBwMHRRz
 6UOLPD5ij8KCicWiHj0bSOBRQ1UnILEx4aXaOYHJpv9XGU5pQuDR/Yup33U4lZr/lWso
 OQ1Qt8Q/39Mf1HM9++5+Idz6arjRAg/+ydWA0Zd5cPc+eLaz6CPWf1FCfuJ2pirWVNeA
 YQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=h0resYfk1K5yxJGjQaDEnfx5eDc62a6WGFOzhZ19oYg=;
 b=Qq7FBtr/l6RdbAoHs7rLGcgh3AcPT5fXQdVXnEqejF+sAXRXq3qGIgUv7dvVxgh004
 lQw2UgKY2fd9Pv8njiybRuuUVjL/JP9WMioaSxu1R5vkRTRLmLbOaDCjac6t3npV2JU9
 CiWFfmOW0q/z0y0gH/gHBlVXkm6FoGTj6nZTpFO6a3zJZMFikmlUIywUVQUSUli6YQxV
 lY5VoRndREIBIuuf+dbmpgk8wVfNe6VXHnQY2ifkAqZ/fAPcEqeJrR2uAQ7wfU0Qv7td
 r2tA9Bxg9lifhYpgz80xdxcqMEKlD0P5tcgHtdRKZyZxV06FM+6jnsHEEdYYY8TRqWA9
 2g7w==
X-Gm-Message-State: AOAM532Y43CThRVCcfCoFUPo8uk0hcMMf5q+QVL4dhmd+trFmpnh/E0e
 xh4/F4vNF7y9fGlIegD0/znb8w==
X-Google-Smtp-Source: ABdhPJx8BNGYLFqpUK8Juc/m6CA71nrcLU4tcOR8IorxQJCLfjGA0utUvtv62bDrL6DwITgV1D4GDA==
X-Received: by 2002:a17:903:11c7:b0:154:b936:d1d4 with SMTP id
 q7-20020a17090311c700b00154b936d1d4mr21430830plh.78.1652197412119; 
 Tue, 10 May 2022 08:43:32 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 y25-20020a056a00181900b005082a7fd144sm11015138pfa.3.2022.05.10.08.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 08:43:31 -0700 (PDT)
Message-ID: <f9f7804f-76e1-da5c-600a-47b6df780e15@linaro.org>
Date: Tue, 10 May 2022 08:43:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/1] Add Zihintpause support
Content-Language: en-US
To: Dao Lu <daolu@rivosinc.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20220510064231.1384670-1-daolu@rivosinc.com>
 <20220510064231.1384670-2-daolu@rivosinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220510064231.1384670-2-daolu@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/9/22 23:42, Dao Lu wrote:
> +static bool trans_pause(DisasContext *ctx, arg_pause *a)
> +{
> +    REQUIRE_ZIHINTPAUSE(ctx);
> +
> +    /*
> +     * PAUSE is a no-op in QEMU,
> +     * however we need to clear the reservation
> +     */
> +    tcg_gen_movi_tl(load_res, -1);

I recommend ending the TB and returning to the main loop.  When running in round-robin 
mode, this will yield to the next cpu.


r~

