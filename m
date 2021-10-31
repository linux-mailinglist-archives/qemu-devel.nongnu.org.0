Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9165440CAC
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 04:46:28 +0100 (CET)
Received: from localhost ([::1]:58536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mh1nf-0001ag-U2
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 23:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mh1lu-0000la-HW
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 23:44:39 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:33654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mh1lt-0006Ch-8Q
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 23:44:38 -0400
Received: by mail-pg1-x52e.google.com with SMTP id r28so14016165pga.0
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 20:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W8jceKuqxT0Up5paSHFyk9hoNMqq34CniF+7ic8MR5c=;
 b=JO6qS2zGKvFCZqeMljRHX3cVSOTc6FFdNi45uImpEYUMGCTeOGueonoFcUn0iBNFFg
 DsD1uqPLXnL3QmW2163uJHedu1heUaQedVQumrs29keowiEV60DDgQaFTlZ3TTEpPG1S
 atBQ/+PwlTt+LygFtCcJ2RkXWjxSFGEgFfAKuBi/6C3cERb1Cy2VPsinleVq/hO0kMoI
 0AVK9Eej7/nX63LMlwXBi8qpOAVAEplfE/r16NwhlT5abE0EWd0cNHclzi9p+5B8Jfxc
 xV3PRWzBFoDJ2LlC54xhxLzxvTM2JPrSctomDkSiv/2cvydEihdQQ/4yUS1CB6M1mEqL
 d6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W8jceKuqxT0Up5paSHFyk9hoNMqq34CniF+7ic8MR5c=;
 b=qlkLZH4ban3aMavKgUzH8ePnIesO9UeqNlm19f/u4Hp7wUzvpgt0/O4ZDAiAi/BYqX
 kAUhhvAk/5FF7NNNJ9MhMHnU0s7G81stPv5DCL+7l5zLZ4YY96GJ7CDE0/USw/E3Q5FE
 ZVTZmN88ac3g/4LoRfUk9Uptl5AWHorEeZbHqZjv3uSwOyj6dnep5+7GxRVwpN3olobd
 8JKlU+9M/5SVYBkLcNbZ4X1uzNgKFTVpLcGu4uwnlggjRzNVGnCCQkR/ssJYavNplTxR
 +VdEmm9UqW9yMVNVitbtDT9PTAMRWaV70iPfYVYH9/2SjMG3yx0y3pFm7ozsjmIOEbHX
 +u9g==
X-Gm-Message-State: AOAM5306HSXL6/65Z2oi+wbpbFGsqj3WKnWCNfB4R71cvmuzgkdxAWhv
 g6A6AmjyY/IZwnklNg5RW6Nm0g==
X-Google-Smtp-Source: ABdhPJzBAWkfE99abpCu8nvS+AlG0zFAPNJa/OHitbQMGGB+kms0ddPOHu/fzohnuyGGWqJyrPAZ3g==
X-Received: by 2002:a63:b706:: with SMTP id t6mr15524334pgf.11.1635651874952; 
 Sat, 30 Oct 2021 20:44:34 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id l21sm1748986pjt.24.2021.10.30.20.44.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 20:44:34 -0700 (PDT)
Subject: Re: [PATCH v4 09/17] target/riscv: support for 128-bit bitwise
 instructions
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211025122818.168890-10-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <211ff7f7-609e-a25b-22a4-acab7ba14823@linaro.org>
Date: Sat, 30 Oct 2021 20:44:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025122818.168890-10-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.426,
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
Cc: philmd@redhat.com, bin.meng@windriver.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 5:28 AM, Frédéric Pétrot wrote:
> The 128-bit bitwise instructions do not need any function prototype change
> as the functions can be applied independently on the lower and upper part of
> the registers.
> 
> Signed-off-by: Frédéric Pétrot<frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas<fabien.portas@grenoble-inp.org>
> ---
>   target/riscv/translate.c | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

