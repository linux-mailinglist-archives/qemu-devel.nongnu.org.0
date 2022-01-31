Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FD04A3E49
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 08:41:46 +0100 (CET)
Received: from localhost ([::1]:37752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nERJp-0000My-U4
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 02:41:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEQdY-0000h7-Mj
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 01:58:06 -0500
Received: from [2607:f8b0:4864:20::42c] (port=33649
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEQdU-0002xG-OG
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 01:58:03 -0500
Received: by mail-pf1-x42c.google.com with SMTP id i186so9640131pfe.0
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 22:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qrEDFwiz8QhdUfRrjtkOtw3C5xSdw7ffc9iqNqm/z3o=;
 b=pul53IyMQsLnM8BMw2vlJc3dgOxD5vrsylYQ+ikEpoHLFFV2fnSTnpttJ7JEbmXe1N
 Nyej72NIkSS++j8IR/AKY2QW2S9mZ/8bY2pk1cGR7Q1A1lnBHv3SQGewGQI5LLFXIF9p
 SHUW2Sb3G46bAYalDStRen7Pl0zUsuAUaBUqcM6xSKCeKz4cwmCsC25VLdkc1lVpbkZ6
 Cb4+4W6nHyu4fCQkgDnrXz7OzDHElNpbSyL+uGSS3UUyMR4wIZAPL8qA+MNr7JlOPn0V
 3kqytqs7vI3kOFkKfut0H2jel3/umGF6Pb1XMn80uxGOe+06pRzrce/n8jO8srEBop0w
 moYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qrEDFwiz8QhdUfRrjtkOtw3C5xSdw7ffc9iqNqm/z3o=;
 b=kOl2viMWUhJSDqzzBuy6F5Ep1rpgCEoBnYs3Z4w5TRRkX6yXybEPqCXtSnqv2kkSct
 tpY4cGodwHv+wnVcoaAdpTq82vIChX9vSQKOr2jYWurItNTMQp8xU9rf1vt4bI7Z5rPX
 zyF/32TC999WtP/K4dMBHTRMl+UEvaGlpiqyGF50cSSa2bcM/Drwpuf3jN7IIRZNZmrd
 C1k4C9V6gUPXnMbCSw0Npf9qw+lQaqiwPOuAUGSFjlmSAZ7Hso+cS2XpVPkZaxSuiJVs
 gCQZ07z2IN+gzgYdQI1gVMnT+EXzI9vskos0oK0ZGbS9dsTrLjbhvtPXjIyi3epGsMnr
 msUw==
X-Gm-Message-State: AOAM530S0NAej1jnTy7/i3Yyem8b1zF3D8fDNq+nPL/mms599eV+cbrO
 RvMUPCLBpzVPPZKrHQIP87tsvw==
X-Google-Smtp-Source: ABdhPJxhLnr176ZX7zIDzicTiajH5tCcvdz4ksp/JdeKEbv9MsBHd+85xmfpa0qI9K9N+Eajg6bu9w==
X-Received: by 2002:a63:88c6:: with SMTP id
 l189mr15704850pgd.229.1643612276491; 
 Sun, 30 Jan 2022 22:57:56 -0800 (PST)
Received: from [192.168.15.130] ([60.231.85.5])
 by smtp.gmail.com with ESMTPSA id a14sm18302437pfv.212.2022.01.30.22.57.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 22:57:56 -0800 (PST)
Message-ID: <9497e12c-2400-b864-733d-5469fc63efcc@linaro.org>
Date: Mon, 31 Jan 2022 17:57:46 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 10/16] Revert "Revert "arm: tcg: Adhere to SMCCC 1.3
 section 5.2""
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220127154639.2090164-11-peter.maydell@linaro.org>
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
> Now that we have arranged for all the affected board models
> to not enable the PSCI emulation if they are running guest code
> at EL3, we can revert commit 4825eaae4fdd56fba0f, thus
> reinstating commit 9fcd15b9193e819b, without bringing back the
> regressions that caused us to revert it.
> 
> For clarity, here is the original commit message of 9fcd15b9193e819b:
> 
> The SMCCC 1.3 spec section 5.2 says
> 
>    The Unknown SMC Function Identifier is a sign-extended value of (-1)
>    that is returned in the R0, W0 or X0 registers. An implementation must
>    return this error code when it receives:
> 
>      * An SMC or HVC call with an unknown Function Identifier
>      * An SMC or HVC call for a removed Function Identifier
>      * An SMC64/HVC64 call from AArch32 state
> 
> To comply with these statements, let's always return -1 when we encounter
> an unknown HVC or SMC call.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/psci.c | 35 ++++++-----------------------------
>   1 file changed, 6 insertions(+), 29 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

