Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DED2C4EB1E5
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 18:37:52 +0200 (CEST)
Received: from localhost ([::1]:51644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZEqu-0000zs-14
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 12:37:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZEpY-0008Ac-5J
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 12:36:28 -0400
Received: from [2607:f8b0:4864:20::22e] (port=42837
 helo=mail-oi1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZEpW-0003HE-ED
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 12:36:27 -0400
Received: by mail-oi1-x22e.google.com with SMTP id q189so19553006oia.9
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 09:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6zVpmriY5dDrVuOO7onmcANUS9mBNGnqbLDXP4dMXeU=;
 b=pf32RcsTJDx/HPAxgNVzYFc6LVWbYTbxPPKQxIY0W614prkSZz4CLQJse+sDH7AN7V
 fzm883xm/UG7p1T2xh3E8AjPMuSbAH3jdcAwCedihgly9yDUtevOsaMrH6nQj0IKJYCH
 2xiM8nr8athuuV9KKCqAfpmtwWijWWdtkDCmoTf2lz7aw7+9jmGT51KjErTOKvsuQZSL
 ZiXP4JD9dpE5He4uEYIdYrbUVWau0BS9Ozx0Nq/gb13vWihRVfoX6a4WmDyu9EYK7Ic/
 VvpiQXYUVbiel/7gKV6y+N9V2JbfH1V0wXX3QAZvLXRqusNIbySreW/g+fFz5Nh45Fn1
 6bJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6zVpmriY5dDrVuOO7onmcANUS9mBNGnqbLDXP4dMXeU=;
 b=5NTXk5P77/j72d1NIeSnweNi1//j7y1xqTM3EMHuzcqxMFEo9VJLi+4rZm7UhcY9Zv
 +o796aMtFRJ6uokv4sp276rmc7xyLbWqptIkPF06LbNvgta6/VWHrEAhDdN6+8jbbCpx
 hPeEJDcPqFVfSp2DOyRcJlxzLJ6tMOJ6MhnLGApWvmJg5V7G7D3r6pO0qfD6oJqRkt/q
 cwH3CJcQP7FfLtxDABKtS4zKaiZ9Ooq/hAy3jLMHsV5DzAhPE+209BWzRAlVDJFHdW4e
 QcWPJ5VZERw/obsAQsNj6eTdq/SBaLu0QRN41RW9qA78LKjJSDjW0nm2LdxlqvvRMeja
 yPmQ==
X-Gm-Message-State: AOAM531aMZB1qAOI6q2QPHhykATJgvZsKBBWtm45eJPB+2kowfHBtbsE
 /mgiEFN3c0yVL/vkinrBnQX6Vg==
X-Google-Smtp-Source: ABdhPJzwTUP+8hKrVHYHnftFyz1jp7CcEX39jFrfmgVYg7Tj0dbkrfD/kS1yUtHCG95ijL1+Tp69jw==
X-Received: by 2002:a05:6808:180a:b0:2da:600a:8c1d with SMTP id
 bh10-20020a056808180a00b002da600a8c1dmr259991oib.101.1648571785128; 
 Tue, 29 Mar 2022 09:36:25 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 c26-20020a4ae25a000000b0031c268c5436sm8704608oot.16.2022.03.29.09.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 09:36:24 -0700 (PDT)
Message-ID: <5a395ab9-a7a4-6305-13f0-9808572a9b56@linaro.org>
Date: Tue, 29 Mar 2022 10:36:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/3] target/arm: Take VSTCR.SW, VTCR.NSW into account in
 final stage 2 walk
Content-Language: en-US
To: Idan Horowitz <idan.horowitz@gmail.com>, qemu-arm@nongnu.org
References: <20220327093427.1548629-1-idan.horowitz@gmail.com>
 <20220327093427.1548629-3-idan.horowitz@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220327093427.1548629-3-idan.horowitz@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/27/22 03:34, Idan Horowitz wrote:
> As per the AArch64.SS2InitialTTWState() psuedo-code in the ARMv8 ARM the
> initial PA space used for stage 2 table walks is assigned based on the SW
> and NSW bits of the VSTCR and VTCR registers.
> This was already implemented for the recursive stage 2 page table walks
> in S1_ptw_translate(), but was missing for the final stage 2 walk.
> 
> Signed-off-by: Idan Horowitz<idan.horowitz@gmail.com>
> ---
>   target/arm/helper.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

