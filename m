Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0238749DA73
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 07:12:21 +0100 (CET)
Received: from localhost ([::1]:60432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCy14-0005JO-OA
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 01:12:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCxoV-0008Kr-AH
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 00:59:19 -0500
Received: from [2607:f8b0:4864:20::432] (port=42873
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCxoT-0000Qf-Mr
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 00:59:18 -0500
Received: by mail-pf1-x432.google.com with SMTP id i65so1705851pfc.9
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 21:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=i3c4bJpq3ULWEF5Nr7iP667dTpwfQcFheiRlW7vXaRI=;
 b=YWqAdhRlLxCz3drklzd4PO1HAGj5vSdNRBa2Dko9q575TpGSvilWeDfC40PTycZVex
 SZYpULWnDE9tu/4trY98a6D7+hjRauNqVmdiYzuweP7zNkzVYMbC056IcxSxFvIzxuGU
 pxiaCu20UcuhiUBJnEmF39U0u6XIeaZgkl+PZUQ/rBykO001vaiOx+mw4qON/pvJhr3e
 bsYvx7/yOmrEvSLe6obaQg9xDPKEOP09oV2XcY0YQr5jq3SfO++lmCItDUpzxo7OdLww
 Y33L8g9INYTSxD9SpF3LxygDVze3XORwCPI1v7UJCxZca+azyUFPzcYIk0o7yZ/9bS97
 gu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i3c4bJpq3ULWEF5Nr7iP667dTpwfQcFheiRlW7vXaRI=;
 b=IBgez0sLfqgC6MfJoAf+uIRF87SDY52Sokn+bEu0xvaNNgjpi2ohT7j15iNzlBm0Jg
 BgsHorCFpgBJRNlgLXOgInCIFKzsHo2MvPzNdYNxmTxT5QgcEOAujxwmJdj5VlbwckJ/
 kwExHLTqGUUZMijla8aBgeEj4Kw1PlSfExU4NTe465Wkeud5QXE8tWKeGItoZh1i5TWT
 21dMUfORIfj8v8RaXQbXgmMAsvWSykBA/xWGrjMeyWx3NsKEyY8IvzGEBuL/Z8vuJZH1
 ffP7OS8T8kQ6dQuuLWtrq0AunM9ubn3E7OX8l8Rp38e+DbbiNJ7IDGKGwpkZSUt6cC9Z
 ddxg==
X-Gm-Message-State: AOAM5323IGuGl1Oe+ujHbQuDqWRx0pOdxfemKnkhR+qgQlK6iRFojuBY
 vTh0osBcadXofk0h6na4SafyaNBALEYP5KQ+
X-Google-Smtp-Source: ABdhPJxxTmyQ4lQ2N59DqsKVHGn3kiLIn06VlsssBiDyrG/o1RWBOK903WvUCOVCIbmz4hQgzUyayg==
X-Received: by 2002:a05:6a00:ccc:: with SMTP id
 b12mr1793981pfv.10.1643263156360; 
 Wed, 26 Jan 2022 21:59:16 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id k13sm4374916pfc.176.2022.01.26.21.59.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 21:59:15 -0800 (PST)
Message-ID: <7f758325-524e-9deb-a440-3154e739c2a8@linaro.org>
Date: Thu, 27 Jan 2022 16:59:10 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 04/40] bsd-user/arm/signal.c: get_mcontext should zero
 vfp data
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-5-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220125012947.14974-5-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/22 12:29, Warner Losh wrote:
> FreeBSD's get_mcontext doesn't return any vfp data. Instead, it zeros
> out the vfp feilds (and all the spare fields). Impelement this
> behavior. We're still missing the sysarch(ARM_GET_VFPCONTEXT) syscall,
> though.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/arm/signal.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
> index 9026343b478..6eadc6e3c56 100644
> --- a/bsd-user/arm/signal.c
> +++ b/bsd-user/arm/signal.c
> @@ -109,6 +109,14 @@ abi_long get_mcontext(CPUARMState *env, target_mcontext_t *mcp, int flags)
>       gr[TARGET_REG_LR] = tswap32(env->regs[14]);
>       gr[TARGET_REG_PC] = tswap32(env->regs[15]);
>   
> +    /*
> +     * FreeBSD's set_mcontext doesn't save VFP info, but blanks it out instead.
> +     * Instead, sysarch(ARM_GET_VFPSTATE) is used instead.
> +     */

Could be rewritten with fewer "instead".  You wanted get_mcontext.
Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


