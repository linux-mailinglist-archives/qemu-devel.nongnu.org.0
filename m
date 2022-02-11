Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F004B1D29
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 04:53:48 +0100 (CET)
Received: from localhost ([::1]:39158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIN0F-0000Sj-Px
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 22:53:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIMyx-0007xc-H2
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 22:52:27 -0500
Received: from [2607:f8b0:4864:20::632] (port=33545
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIMyv-0005Al-Rm
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 22:52:27 -0500
Received: by mail-pl1-x632.google.com with SMTP id l9so2031645plg.0
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 19:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sSu1a1KQQ/eDTJcOjvdAIGV7t54+8rFvvIkenrPawzk=;
 b=APzZnFw+fbn9srt08hBuDabl9FYAoeajXCg6+XTtvcUqamsV4oak3jxjuofDF4qdwR
 XTuSGteydi0eO6IrSV8cWWoa6rUin21JQXHGTj+aNY4W71FetxCsEDKaacBpWnYHyW5j
 kzr1ao76YsJDzBXxkdg8nEYhtBtXJ74GOhw6Cukly2qlCaHOnw9kWUu5NX31N9YnZxfi
 CDrWQJnArZJW36riKcXCnSZ9P69/TUJ1jNFzdhcGIco46PMeEylypZftaTCOjYqg310L
 KoWNJWTffWr3Xtq1emqCxAggWNx3SceMH/wbKnU7T7vEhjWkvOGCCVEGWdymDLDeiqyB
 uNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sSu1a1KQQ/eDTJcOjvdAIGV7t54+8rFvvIkenrPawzk=;
 b=6pifDXyJ8XoXSB92NuwW5hzASIMDzICD7AE4UFqDkbexAC+8TpeTpbOoOgLRCwmuLs
 Rd1HAveohLyrCw78wgQQD7ew9LFde+RWDFdvVBAWnOR6UGR3ev0YSISnrP0rQFoulrg1
 GgvsqSlx5tt2GKGLLF+FbNd/HGONFusfxhOlMSGBXVgtaPm+7lltMOwjWt4FMImxPf9U
 trTgg7crEner3vNJo6UHfRDvOjaw0T0BHCvzhoYeh5HJn6wAmQUZks9XHwR00AZFLT9U
 +TXkqB2AUUIvUbaOO++gsGWDlbinLVYlanXAPW2O6x5QaCg6BIK6M6N2qX/XuI4xvv6L
 B+JQ==
X-Gm-Message-State: AOAM532WhfqIgGzqaYAPFBl//+0y8c08Kozfq/j7mRSg6GmKZkmxHSZu
 Tl5tE0uQpwKSqjq33WoQjs3prg==
X-Google-Smtp-Source: ABdhPJy2rkG90tKY60hQ4R1LiMWTcZ9WMOIQZwWSmzcKPM/Z+QsFF1bB+pGsae4y1LaROfaHP8KU7w==
X-Received: by 2002:a17:90a:311:: with SMTP id 17mr684006pje.200.1644551544225; 
 Thu, 10 Feb 2022 19:52:24 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id 10sm24504295pfm.56.2022.02.10.19.52.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 19:52:23 -0800 (PST)
Message-ID: <95cf54b7-14f8-5fdd-5943-58574467b8fb@linaro.org>
Date: Fri, 11 Feb 2022 14:51:34 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 04/37] target/ppc: vmulh* instructions use gvec
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220210123447.3933301-1-matheus.ferst@eldorado.org.br>
 <20220210123447.3933301-5-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210123447.3933301-5-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 danielhb413@gmail.com, groug@kaod.org,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 23:34, matheus.ferst@eldorado.org.br wrote:
> +static void do_vx_vmulhu_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
> +{
> +    TCGv_vec a1, b1, mask, w, k;
> +    unsigned bits;
> +    bits = (vece == MO_32) ? 16 : 32;
> +
> +    a1 = tcg_temp_new_vec_matching(t);
> +    b1 = tcg_temp_new_vec_matching(t);
> +    w  = tcg_temp_new_vec_matching(t);
> +    k  = tcg_temp_new_vec_matching(t);
> +    mask = tcg_temp_new_vec_matching(t);
> +
> +    tcg_gen_dupi_vec(vece, mask, (vece == MO_32) ? 0xFFFF : 0xFFFFFFFF);
> +    tcg_gen_and_vec(vece, a1, a, mask);
> +    tcg_gen_and_vec(vece, b1, b, mask);
> +    tcg_gen_mul_vec(vece, t, a1, b1);
> +    tcg_gen_shri_vec(vece, k, t, bits);
> +
> +    tcg_gen_shri_vec(vece, a1, a, bits);
> +    tcg_gen_mul_vec(vece, t, a1, b1);
> +    tcg_gen_add_vec(vece, t, t, k);
> +    tcg_gen_and_vec(vece, k, t, mask);
> +    tcg_gen_shri_vec(vece, w, t, bits);
> +
> +    tcg_gen_and_vec(vece, a1, a, mask);
> +    tcg_gen_shri_vec(vece, b1, b, bits);
> +    tcg_gen_mul_vec(vece, t, a1, b1);
> +    tcg_gen_add_vec(vece, t, t, k);
> +    tcg_gen_shri_vec(vece, k, t, bits);
> +
> +    tcg_gen_shri_vec(vece, a1, a, bits);
> +    tcg_gen_mul_vec(vece, t, a1, b1);
> +    tcg_gen_add_vec(vece, t, t, w);
> +    tcg_gen_add_vec(vece, t, t, k);

I don't think that you should decompose 4 high-part 32-bit multiplies into 4 32-bit 
multiplies plus lots of arithmetic.  This is not a win.  You're actually better off with 
pure integer arithmetic here.

You could instead widen these into 2 64-bit multiplies, plus some arithmetic.  That's 
certainly closer to the break-even point.

> +        {
> +            .fniv = do_vx_vmulhu_vec,
> +            .fno  = gen_helper_VMULHUD,
> +            .opt_opc = vecop_list,
> +            .vece = MO_64
> +        },
> +    };

As for the two high-part 64-bit multiplies, I think that should definitely remain an 
integer operation.

You probably want to expand these with inline integer operations using .fni[48].

> +static void do_vx_vmulhs_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)

Very much likewise.


r~

