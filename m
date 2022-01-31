Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22784A3E93
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 09:28:20 +0100 (CET)
Received: from localhost ([::1]:39928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nES2t-0007cS-NT
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 03:28:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nERjp-0005RH-3g
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:08:37 -0500
Received: from [2607:f8b0:4864:20::1030] (port=45686
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nERjl-00045p-50
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:08:34 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 g15-20020a17090a67cf00b001b7d5b6bedaso3756134pjm.4
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 00:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hzdegvweuSj8obSW9UzeqPv2qiGpjMXm+KU1JMRAaAk=;
 b=ixbYJ6ugNmG78rdBhvpH3YH/WKoXWNhK8bHeup6Nn44yPatfMaH/r9jGSfkZWhrJAk
 KYsTeAhwt96AmrYH1lebL0y7kv0pFLCOH45sPk/IEpJHAw53kdexeowM96ucRKDWtIaT
 BBz1DXSS/2z48DFNPNjvjXBUxg0Y5dzBgvH91xOZtnkzi8HZpfqHx6NQd4Gi92vJiYG0
 XwDVPxVwLjJfiXo6jAG0J7JiU8SbUIXQAwiu953EBP5XWiq6uCwYlFD74aKau/4/eZ4e
 kCX01xNMmeLSJlORcUgMziA4ecQWjTLxYIvs9fR0D9CXb3NgTd0HQEDcnX3wPY7DJ4eW
 YYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hzdegvweuSj8obSW9UzeqPv2qiGpjMXm+KU1JMRAaAk=;
 b=VsEipqQ4Yg+R1XlfEDotOzBXpdItye6dW+EkeanEFWCzvlsxwiMrZ37F15ttrJR/ji
 SxFz/388mzR16sAQgeTx+C0unL+ekuOv70kjpf5CRAT/WqB5ywB4E9YaDnhbYzzgiuAm
 00XndPXM8kQP4lETM5wFLDEiA51KlJTJGPRQIwvI74nggHx8GHi++wpy0xJ+fp48FDrM
 BPbArz1h57n58VJ38V2gPQ/6dYnmycnHb3cS3TxNmpO7SKdj7KJX5GZPuTR9fcoZuCDM
 szxHg9sUPaMqLiHaNPwVkcla4NEXP4BhR+ydXA9C+rP0qWFwo/6bxMH2COuvchNM7giZ
 qjPg==
X-Gm-Message-State: AOAM531c93DbXmWqvH/KtW2+aGdzDsfCbyDRGjZjFmkX+3d8qfQXic0o
 +LX2U0mCweGOVJz1BdL4Y9wlvw==
X-Google-Smtp-Source: ABdhPJzhD9bVeCPMRYDkU+gDf/ysiELpGhUOiqxADLitGg9Xo7rnBnzSa3IHtkHaVMuWN3Fqe/eQpw==
X-Received: by 2002:a17:90b:4ad0:: with SMTP id
 mh16mr32071245pjb.89.1643616511969; 
 Mon, 31 Jan 2022 00:08:31 -0800 (PST)
Received: from [192.168.15.130] ([60.231.85.5])
 by smtp.gmail.com with ESMTPSA id s12sm16960563pfd.112.2022.01.31.00.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 00:08:31 -0800 (PST)
Message-ID: <06314359-3790-8e73-30b3-62354f4783b4@linaro.org>
Date: Mon, 31 Jan 2022 19:08:21 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 14/16] hw/arm/highbank: Drop unused secondary boot stub
 code
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220127154639.2090164-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>, Tyrone Ting <kfting@nuvoton.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/22 02:46, Peter Maydell wrote:
> The highbank and midway board code includes boot-stub code for
> handling secondary CPU boot which keeps the secondaries in a pen
> until the primary writes to a known location with the address they
> should jump to.
> 
> This code is never used, because the boards enable QEMU's PSCI
> emulation, so secondary CPUs are kept powered off until the PSCI call
> which turns them on, and then start execution from the address given
> by the guest in that PSCI call.  Delete the unreachable code.
> 
> (The code was wrong for midway in any case -- on the Cortex-A15 the
> GIC CPU interface registers are at a different offset from PERIPHBASE
> compared to the Cortex-A9, and the code baked-in the offsets for
> highbank's A9.)
> 
> Note that this commit implicitly depends on the preceding "Don't
> write secondary boot stub if using PSCI" commit -- the default
> secondary-boot stub code overlaps with one of the highbank-specific
> bootcode rom blobs, so we must suppress the secondary-boot
> stub code entirely, not merely replace the highbank-specific
> version with the default.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/highbank.c | 56 -----------------------------------------------
>   1 file changed, 56 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

