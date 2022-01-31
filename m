Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F684A3E90
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 09:19:45 +0100 (CET)
Received: from localhost ([::1]:32970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nERuX-0002M9-TG
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 03:19:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nERfp-000475-7y
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:04:29 -0500
Received: from [2607:f8b0:4864:20::534] (port=46865
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nERfn-0003Mm-F4
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:04:28 -0500
Received: by mail-pg1-x534.google.com with SMTP id s16so11429550pgs.13
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 00:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UsOP5hQR27bYNMlbm2SRlJUeawopjrAG+jzqKZD307U=;
 b=ivBrIP66YfEsuzdDB2yUXRjpuRuQFm5hwRzZqY6J+5aRjN3YKeP5Nbe9fLOs2yX7Zs
 FOrGpGJ/LtUGNuQzLlOxye1BWaL4+9vkJuokoN3a+itFyqwVC/OS6Zh0a6VmdXEpTwSo
 uuR7BjxENFKlx6o0R3fZrc/DasKo12q67klycueOaX0SsJ2KbvWJytiSZ6gE2MG/TN6n
 80h/TNXjFBNDKTb/p/r/mNA7km0sxFqWONBD3p4rditfUVX3Mh2dy6SHUjUHSgaqo+jk
 Ym9qmjDkuDum2tNO+8GkyW/2wx1D3mtv1FAMLpE4Mmotg90RbVrmr4xrws/mLwAzOj07
 Kn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UsOP5hQR27bYNMlbm2SRlJUeawopjrAG+jzqKZD307U=;
 b=qo/DM1e3SNoPiR1wxg59fx4NaV4JzabmTja0lHJy2FAKja0TSM0DtQja0QjirLNt3M
 w5Yn4UW+JTAx9kmqumvGSYFGrkGODnCFdQTAPNtcDOO7KcvJc/1O6R6D1uNpxLs/EcnB
 AZ79WcmWMhaj9kDi/uBKfsSCIgMn1vWrHCYvFlf8uoTPHWtXpsFIn6sSQPE9/Z/cDcDe
 KLmq34JOPRuUxhZEW8O+9GaK4WLt/H7La6ixxjVxZ20YbjR7BzZUb47lbr+k7SPVs9Pw
 1ZnV7946HXc6caT6i9r1Cg1KJ2BBZ93r2QalPUOa8fGXs9cDrYj1RwdQkxwJAdN92k5y
 XqNQ==
X-Gm-Message-State: AOAM530bzlBkP0k5UiUBsx0PwVTPnUnf6o60RUsvsFPTBQdc607s7nWS
 bZ/HiIAo7xII1mNcCSmPgmuxRg==
X-Google-Smtp-Source: ABdhPJyTXPnwqflhI0ttNnAER10/dQ69lssP8JWnDj6XzsyDMuONeQuCiVVigp6AiKUip7l7coyAtg==
X-Received: by 2002:a05:6a00:2343:: with SMTP id
 j3mr19012432pfj.7.1643616221826; 
 Mon, 31 Jan 2022 00:03:41 -0800 (PST)
Received: from [192.168.15.130] ([60.231.85.5])
 by smtp.gmail.com with ESMTPSA id f16sm18517612pfa.147.2022.01.31.00.03.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 00:03:41 -0800 (PST)
Message-ID: <34e6de6c-d80d-b438-0e33-c9b50191a88e@linaro.org>
Date: Mon, 31 Jan 2022 19:03:31 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 11/16] hw/arm/highbank: Drop use of secure_board_setup
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220127154639.2090164-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
> Guest code on highbank may make non-PSCI SMC calls in order to
> enable/disable the L2x0 cache controller (see the Linux kernel's
> arch/arm/mach-highbank/highbank.c highbank_l2c310_write_sec()
> function).  The ABI for this is documented in kernel commit
> 8e56130dcb as being borrowed from the OMAP44xx ROM.  The OMAP44xx TRM
> documents this function ID as having no return value and potentially
> trashing all guest registers except SP and PC. For QEMU's purposes
> (where our L2x0 model is a stub and enabling or disabling it doesn't
> affect the guest behaviour) a simple "do nothing" SMC is fine.
> 
> We currently implement this NOP behaviour using a little bit of
> Secure code we run before jumping to the guest kernel, which is
> written by arm_write_secure_board_setup_dummy_smc().  The code sets
> up a set of Secure vectors where the SMC entry point returns without
> doing anything.
> 
> Now that the PSCI SMC emulation handles all SMC calls (setting r0 to
> an error code if the input r0 function identifier is not recognized),
> we can use that default behaviour as sufficient for the highbank
> cache controller call.  (Because the guest code assumes r0 has no
> interesting value on exit it doesn't matter that we set it to the
> error code).  We can therefore delete the highbank board code that
> sets secure_board_setup to true and writes the secure-code bootstub.
> 
> (Note that because the OMAP44xx ABI puts function-identifiers in
> r12 and PSCI uses r0, we only avoid a clash because Linux's code
> happens to put the function-identifier in both registers. But this
> is true also when the kernel is running on real firmware that
> implements both ABIs as far as I can see.)
> 
> This change fixes in passing booting on the 'midway' board model,
> which has been completely broken since we added support for Hyp
> mode to the Cortex-A15 CPU. When we did that boot.c was made to
> start running the guest code in Hyp mode; this includes the
> board_setup hook, which instantly UNDEFs because the NSACR is
> not accessible from Hyp. (Put another way, we never made the
> secure_board_setup hook support cope with Hyp mode.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/highbank.c | 8 --------
>   1 file changed, 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

