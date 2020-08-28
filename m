Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 344CC25637A
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Aug 2020 01:25:48 +0200 (CEST)
Received: from localhost ([::1]:39396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBnkh-0005yH-AH
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 19:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnjZ-0004so-AX
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 19:24:37 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:39582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnjX-0006Zb-BS
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 19:24:36 -0400
Received: by mail-pg1-x52f.google.com with SMTP id v15so1140803pgh.6
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 16:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=q+pP85zdMcUhyvw6vFDHSObf7McM1ef8XS7oy20daaw=;
 b=JZGjG6WaXZJDQ+b2nDF47ndUWsV8yW+q2ECYei/hTMxXKuWI9t4aoFuHHZgEz17tad
 30t9Q5ycWMvIqLRZ9DB1XOCOte0c958tLFpg9j+KB9s6NdRz1F1kcdkaKGq9PXRlzi0I
 ItKofLgOoMoizwovHNcCtaUGqqHdCayUZtClnytyLx3CGEDGCnwUi7YDAV2CyaKc3+1h
 iI6I9He3x9Mec8YrVl/s2CLvpK13pBEiJ2AddIKMStzmbSOnu+TfDioO8RRSor4q0fuu
 0QVBAOP1L/9GSkjcwlwdIhRHXi8uzZBVWXNYN0SWkoZNVM1+gUmTB1kOdjbPSVsxHiSb
 aLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q+pP85zdMcUhyvw6vFDHSObf7McM1ef8XS7oy20daaw=;
 b=aEaCz9WZg2CAFH2Mu2R5AMXYGS/KhkwqMPBCUoutDCcciqxhe/84kxESvbz6vR0ACn
 f7DXkn80Bh5Nwwu/sAfD36tXEDT5tkPox+lF9OUiXzPyvhxrga9AbFLb9QzbVp4ud0uv
 eVr0Cpuc7H5U1NjT/NhgNidSV0BQ6imO/D6RB86mkikz3SN4117f3SvaeBdwTdWn6z3I
 rf7XoBpiVmcW7HzG6oMdTkzIQtsmrMSxcvlOFMF+aRzG5TOkH5NeaRsIsK464t8LTprR
 m3sK6Exi08pQ9NuYZdJuaaJwK9OiohFp/puNQfHzP+z1nMgQYJRw0ekB2UkT5jvH41Ls
 1ArQ==
X-Gm-Message-State: AOAM533dfqOXYrYCkCDsff7Q+w9I9woYg90vsxLwgE+gIg/+//nTgCQ0
 fDZDsgK2fYVE3XkNdZEfBY9i/OEltG9VxA==
X-Google-Smtp-Source: ABdhPJy61qd2sEjephrk8yr94I6C0hwjl5GP3qHrsJVMH17Z2cjSny/s0DapDUAhPN1UjMQ7Sa+l8Q==
X-Received: by 2002:aa7:850b:: with SMTP id v11mr1078907pfn.240.1598657073314; 
 Fri, 28 Aug 2020 16:24:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id w10sm346435pjq.46.2020.08.28.16.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 16:24:32 -0700 (PDT)
Subject: Re: [PATCH v2 43/45] target/arm/vec_helper: Add gvec fp indexed
 multiply-and-add operations
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-44-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a9995eb6-6cb6-f041-ea09-9104e9dc293e@linaro.org>
Date: Fri, 28 Aug 2020 16:24:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-44-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/28/20 11:33 AM, Peter Maydell wrote:
> +#define float16_nop(N, M, S) (M)
> +#define float32_nop(N, M, S) (M)
> +#define float64_nop(N, M, S) (M)
>  
> +DO_FMUL_IDX(gvec_fmul_idx_h, nop, float16, H2)
> +DO_FMUL_IDX(gvec_fmul_idx_s, nop, float32, H4)
> +DO_FMUL_IDX(gvec_fmul_idx_d, nop, float64, )
> +
> +/*
> + * Non-fused multiply-accumulate operations, for Neon. NB that unlike
> + * the fused ops below they assume accumulate both from and into Vd.
> + */
> +DO_FMUL_IDX(gvec_fmla_nf_idx_h, add, float16, H2)
> +DO_FMUL_IDX(gvec_fmla_nf_idx_s, add, float32, H4)
> +DO_FMUL_IDX(gvec_fmls_nf_idx_h, sub, float16, H2)
> +DO_FMUL_IDX(gvec_fmls_nf_idx_s, sub, float32, H4)
> +
> +#undef float16_nop
> +#undef float32_nop
> +#undef float64_nop

This floatN_nop stuff is pretty ugly.

Better to pass in either floatN_mul, or the floatN_muladd_nf helpers that you
added earlier.  Although I guess you're missing float64_muladd_nf so far.


r~

