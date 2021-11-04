Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E305D4459EF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 19:45:55 +0100 (CET)
Received: from localhost ([::1]:48198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mihkI-0001yT-J7
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 14:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mihi8-00016l-Ng
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 14:43:40 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:40464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mihi7-0000fk-3w
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 14:43:40 -0400
Received: by mail-qt1-x82f.google.com with SMTP id l12so4532827qtx.7
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 11:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dFrGETjZqj4jYMu56+tK9t85D6av/p/UCU4iq9uzH8o=;
 b=nGDjg2I649pRCOs3GyxnAlXZqPt6vJwwoTNs7OXSZDcbPPP0AU1uVElrVrD9tthQQb
 313IxiK0bspJHE8AF2dkYFwo8+klM0gkjR61+euUOR3Ux4dyVSjnMsqBwo/nKOCWkPPO
 d5jb9COGxcdzPQh2ScTIrgQyJSGUJxopVrmdd8nloLXWpSNIqURetPZ20Eq90TjZ8v51
 ylODMgRZtiKIE0DJQeQsfJbBTYgesbeb29O+7nOC6U8yCBNuKnxRZMGXvjt0nUiO2i2F
 E4QDKFK9RrgZwcyd/u9uXWhqzAx/23phc1bE4LTnTPfoXI7qauVrZdfzHfSit/wHI5Yo
 q3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dFrGETjZqj4jYMu56+tK9t85D6av/p/UCU4iq9uzH8o=;
 b=KLSCHvGXZCPn/a6nMNYwiTSktXMH/1CV0RHf7EJQPtRai/qIazY7IiViGqAh2uy7sr
 50z34UfrF6MUkXpFWRwEOscUWjDbWQP+x7+moLjLbeYm6dtJcOrH7QvgYZbB+Da2ECSC
 OGICer0PdvxlRbmxwfuBfWhQenSdA2OQIPDRfjClODVmM5Q1ouCC+HuefXSb2ydx7j9N
 6hM38i2H5NgTJGLOTlaWu1QlAhBowQ5wJg9Vxir1Y/Cdb/MZJ90WIFIJJ54UGa5laoul
 06ni7fEEX3PwL85QXJF0wwxCMASXSa2u6STk5s+9ecEnQLzY8XiOWBYuYvOmzxi2GQuh
 X89g==
X-Gm-Message-State: AOAM531CXeUSDTcGpxrmx/DeZYtB5KgvrxOV2kMPcWOwfyE/h6BhDZrD
 5wv1TT+wEPmhQTvqCp8qDWJ5Ww==
X-Google-Smtp-Source: ABdhPJwfxSITllOiSD2T44ax0puRx/Qx7WxGQ3cMt/hF9PaTSJJbEWge+RVnaBp4vWCw+3VdamZsUQ==
X-Received: by 2002:a05:622a:1450:: with SMTP id
 v16mr45470145qtx.25.1636051417818; 
 Thu, 04 Nov 2021 11:43:37 -0700 (PDT)
Received: from [192.168.44.35] ([172.58.219.70])
 by smtp.gmail.com with ESMTPSA id n19sm4457469qta.22.2021.11.04.11.43.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 11:43:37 -0700 (PDT)
Subject: Re: [PATCH v3 23/29] bsd-user/arm/target_arch_signal.h: arm
 set_mcontext
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211104140536.42573-1-imp@bsdimp.com>
 <20211104140536.42573-24-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a4809133-bdae-8c06-511c-0aa9af6f3362@linaro.org>
Date: Thu, 4 Nov 2021 14:41:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211104140536.42573-24-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Philippe Mathieu-Daude <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/21 10:05 AM, Warner Losh wrote:
> +    /*
> +     * Make sure T mode matches the PC's notion of thumb mode, although
> +     * FreeBSD lets the processor sort this out, so we may need remove
> +     * this check, or generate a signal...
> +     */
> +    if (!!(tswap32(gr[TARGET_REG_PC]) & 1) != !!(cpsr & CPSR_T)) {
> +        return -TARGET_EINVAL;
> +    }

I've had a read through the Arm ARM for "movs pc, lr", which is how swi_exit returns to 
userspace:

     CPSRWriteByInstr(SPSR[], '1111', TRUE);
     ...
     BranchWritePC(result);

So the CPSR gets written first, which sets the T bit, and thus the result of 
CurrentInstrSet(), then

BranchWritePC(bits(32) address)
   if CurrentInstrSet() == InstrSet_ARM then
     if ArchVersion() < 6 && address<1:0> != '00' then UNPREDICTABLE;
     BranchTo(address<31:2>:'00');
   ...
   else
     BranchTo(address<31:1>:'0');

> +    env->regs[15] = tswap32(gr[TARGET_REG_PC]);

So this should mask the low 1 or 2 bits depending on cpsr & CPSR_T.


r~

