Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F45950604E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 01:38:18 +0200 (CEST)
Received: from localhost ([::1]:34192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngawi-0005Fz-U9
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 19:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngavV-0003bU-RY
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 19:37:01 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:43914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngavU-0001Nm-7A
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 19:37:01 -0400
Received: by mail-pg1-x530.google.com with SMTP id u2so21647464pgq.10
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 16:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nXOhc/iiTDwGzjCEahnQ1vcjorCJVo7CQC0ntviIghE=;
 b=fh8dwTHYaHj+OXg8DkwhoPNhpu/PrjQHnYjPmfnc+/FK6pbQUpNbprwBEFSOTAJq+c
 eE4pFz1/vaIHBb9ZKEFXAzyexLgVa5AkGAG3ROUt9K9SgHXYtdn1Aa7vtm6xfqZzt5/z
 s1OSiGJzI4uZGsz25uQJMAjBjUSgtVU1iUIoyYxSx+6EshxK1PGBiTXOF9tdYSFPdXmn
 sAm5BTEya3R1MNJ7tnZZ39Yw8POjuh1TZsVKTphs6+91bpxWkvxbCbJGM0FE4jhSVIbz
 ZEfptI287bYxg7T1vLZOZ7OVfFTIcZy0ekl879nlohz34ZW+1HTfc7MgiklV0ShhJdrW
 Fx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nXOhc/iiTDwGzjCEahnQ1vcjorCJVo7CQC0ntviIghE=;
 b=x74NX4u4eJdboHgVkPIHCGAjdg2ML5OkakTn5DsQiBYjad8m754SJXWGN9bqx8MjoL
 gWsxfBA7HQ2LqQz4fqwaAlwU4clCzAEpbYGuYBYpfN4Bh6Ic4QSEhxchUIVtdQlrc5/c
 al0NQ+KHDaTBWkJ4i06HjOgFP1h/f7iietCdpL95LcFvU+cV+BWBYZXvF1quf9hSpdg2
 ukrqhYShlTgz29I9PFuDiWzcRU+GoAHTPvIyP3Gq9PkWPIKtUVbZTKw3liptYUo5D0Ku
 GODZztW6i6hCkrsGgafATVJ2PVrWV9z6mY4StpOgvCfzxftkoyK+/GsGVw3iq6pM/kbp
 K7iw==
X-Gm-Message-State: AOAM531dKXh+9kf7k0mDwq56Lv0D90H4D19Vi8lrJV9U6HyA6gpdky58
 QQwvP3kz0RIv4yOefqJ6bDk5g17Y5MMCiQ==
X-Google-Smtp-Source: ABdhPJygq0f1PmRBPQmQVUXhdpJOouCGbPhSJA1mbBz7hHKPTkMn58KHdtyCWwFBF0m22Lz5gDLgLQ==
X-Received: by 2002:a05:6a00:1a46:b0:505:c8a6:fef9 with SMTP id
 h6-20020a056a001a4600b00505c8a6fef9mr14759726pfv.24.1650325018789; 
 Mon, 18 Apr 2022 16:36:58 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 cw21-20020a056a00451500b0050a7a00bb2esm4279030pfb.33.2022.04.18.16.36.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Apr 2022 16:36:58 -0700 (PDT)
Message-ID: <bbf99e06-9faf-b1c9-0b1e-7e1fbf992f4a@linaro.org>
Date: Mon, 18 Apr 2022 16:36:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v3 2/5] ppc64: Fix semihosting on ppc64le
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
 <20220418191100.270334-3-leandro.lupori@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220418191100.270334-3-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: danielhb413@gmail.com, groug@kaod.org, clg@kaod.org, pbonzini@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/22 12:10, Leandro Lupori wrote:
> +static inline uint64_t sh_swap64(CPUArchState *env, uint64_t val)
> +{
> +    return msr_le ? val : tswap64(val);
> +}
> +
> +static inline uint32_t sh_swap32(CPUArchState *env, uint32_t val)
> +{
> +    return msr_le ? val : tswap32(val);
> +}

That doesn't work -- tswap itself is conditional.

You want

   return msr_le ? le32_to_cpu(x) : be32_to_cpu(x);

etc.  One of them will be a nop, and the other will bswap.


r~

