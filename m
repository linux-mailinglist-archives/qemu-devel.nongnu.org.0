Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668A949F1EB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 04:41:00 +0100 (CET)
Received: from localhost ([::1]:46292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDI8B-0003Hw-H2
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 22:40:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDI56-00029p-BV
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:37:48 -0500
Received: from [2607:f8b0:4864:20::42c] (port=39829
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDI54-0001cL-Mu
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:37:48 -0500
Received: by mail-pf1-x42c.google.com with SMTP id a8so4914467pfa.6
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 19:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lNViaG3CzaemUEEjM7cz4z3583QpDIPZEFSIoFDTiAY=;
 b=iJLNAaRsZK72THhGO1LS6VmXVOSZamddccmLb4i3jjoXXtR/zPLM8WB4T3FOz1oQKz
 f+GVXQc+v9IxgNRVMRs7aJ1T5mEhEvVSgdkhcZlcK2ksV6FMiZKLgTdgztaoLBd9SR8N
 UAyGdszCqZc9rk6OWURc/IJt+kfU9bftBUmU0QTxlKf0/1Y8OumAA3+eBHTa/lpTRMF+
 xzh3tKsYUZOeTePmwt62aeS3GMyJka82VwuTMdm14Wogibrd+M08YGMASLBsjVDVjYLX
 N8+o2Sbo/o5V4bC6OJHbj9p1h2G4a8K+h4Vhy9ExNF4yOyXnXwdvcAJfO84qS+ytC6Ka
 7MFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lNViaG3CzaemUEEjM7cz4z3583QpDIPZEFSIoFDTiAY=;
 b=oRATsYrFsOMBmUfBZmpWhXutyb0flEEGFdFuUcKv7KEKbiq24Y5Lt4WxaRExEvIToE
 kKsSw8rBKxIWFKzuPkFTtXUCOVyHAZafDjZ2woSBUXNneKJA+Y4Y2BVVscAkQyM3cwRn
 pFeBGR5WPn3qp1Xl+6H5uHCywXBhWaszlIGltUgnijQUcUFI1HXjplVTZFvVIj0RqmQC
 IBWDJl/v3dTdEo23o6vmkKah0s/+ySfdi/LGxsSRd0U9E0IGuE2mtNX3xseY5JJVrhuc
 7cLNcsxj1AzxeoWPFAit6JJxDUzO8p4/CE+nSHd7o40ruMFRbwxuqFConZoBNL6Bb559
 UBJw==
X-Gm-Message-State: AOAM531pXwhP4CoIeOyNCx/KOBpTAnsN5VNhFHCbR5/MoIipnvd0MsXT
 vqRPgxFjvrEcK/FJsS+Z4vAdcw==
X-Google-Smtp-Source: ABdhPJzUQdZwWYM88AeWBcGD2TnAc+nobDHtxWFwv8rPfUwIjhtjW9Tg0kDfsnIuhWVQXJnTcZddAQ==
X-Received: by 2002:a05:6a00:2493:: with SMTP id
 c19mr6180172pfv.29.1643341065175; 
 Thu, 27 Jan 2022 19:37:45 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id v17sm6958162pfm.10.2022.01.27.19.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 19:37:44 -0800 (PST)
Message-ID: <bae003f2-24c9-d65a-ddb9-ae0eb0fd14ec@linaro.org>
Date: Fri, 28 Jan 2022 14:37:39 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 13/14] hw/intc/arm_gicv3_its: Implement MOVALL
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/22 05:24, Peter Maydell wrote:
> Implement the ITS MOVALL command, which takes all the pending
> interrupts on a source redistributor and makes the not-pending on
> that source redistributor and pending on a destination redistributor.
> 
> This is a GICv3 ITS command which we forgot to implement. (It is
> not used by Linux guests.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h   | 16 +++++++++++
>   hw/intc/arm_gicv3_its.c    | 55 ++++++++++++++++++++++++++++++++++++++
>   hw/intc/arm_gicv3_redist.c | 54 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 125 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

