Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D35363795
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 22:41:38 +0200 (CEST)
Received: from localhost ([::1]:46592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYEEb-0002Vf-Gv
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 16:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYECY-0001au-9a
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:39:30 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:44989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYECW-0004E8-HX
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:39:29 -0400
Received: by mail-pf1-x429.google.com with SMTP id m11so21814907pfc.11
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 13:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0nOd/EFNZ9VIBFDRh+JUegA9tCtFTK1ZeOuwtk9q3tc=;
 b=yrqSygx/CA2h9TgDTqFkIZWi8Hb/Lp6C9wJkB68DN2MisHzr9OKRlmcoisP9doflwW
 pfgwry/eu9i/b7VNFubWlUCFnEx9eLfdb1UHCUR6Mrt61AwlvNenIpbdV3dFZKBYLTqP
 f2ghE2gffaaa0phWAnacY1rFi/ew6TmXqmr9UpSUmjPrgytIQB+b2Me5mg0ZUcr/u7NS
 RY7HDvbOL7FbySlxmP+3lNDHZ5XHrOwLa8zTsiidxcEpDsGzWLBnAQKfEW3nPWtyJ8gS
 v1nUgTHkzDYSKEIIvKzPIYUAO0s0dTqvY2/DFSR/Tga1mk8ScepWvOnfAyo3yrE1rWEg
 sdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0nOd/EFNZ9VIBFDRh+JUegA9tCtFTK1ZeOuwtk9q3tc=;
 b=qgooGH6gzncco92IP0xHxRL24gSe3m+mskLTxq3oFm7TGswPgabob6QejSmgqkmwBR
 JXoCdXLMRH7F6SMV6jZ9/fLfrvaiC1526ML3/b7dlaxfY0sA8FU9KzJvFfdiHkYDmAHX
 gqKmLMtEYB6/BTECJ5HdOtfSD2WVECZcRoLGGuNwYF8JDvH00pGELD5ogajAJTx6qM+5
 PO9C9YJitmYAe6Nvv1gJm7G5DTTCarg64p7/zoQO2BlnOWf8j8skeE351Gnok3Pq0TjN
 r4re83NaAP9fQUl1EDAWHsPU6fnRSVCRLy7H9ClgZ4kWnweQyhSLPY4C7jHIeWmt/MEq
 1WKA==
X-Gm-Message-State: AOAM532CShyjz1gKOEidU+dymH6dn5jr3RQzA6udUKRjj/t7mK49Oi0Z
 ib/Q8ZMxpKEJSiP951Z2Jl9qPQ==
X-Google-Smtp-Source: ABdhPJyqdo9J58YK0xmMPwpZZFz+2na/cpb+sOm8Oq5D4TJHDYXqoVxHL2frQW67cU3iVeoaAcWoIQ==
X-Received: by 2002:a62:1d45:0:b029:259:aeb1:df34 with SMTP id
 d66-20020a621d450000b0290259aeb1df34mr12632547pfd.6.1618778366991; 
 Sun, 18 Apr 2021 13:39:26 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id i10sm7252763pfo.37.2021.04.18.13.39.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 13:39:26 -0700 (PDT)
Subject: Re: [PATCH 24/26] target/mips: Move TCG source files under tcg/ sub
 directory
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-25-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <877ccb27-28a3-cb41-aba2-93533c7b939b@linaro.org>
Date: Sun, 18 Apr 2021 13:39:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418163134.1133100-25-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
> To ease maintenance, move all TCG specific files under the tcg/
> sub-directory. Adapt the Meson machinery.
> 
> The following prototypes:
> - mips_tcg_init()
> - mips_cpu_do_unaligned_access()
> - mips_cpu_do_transaction_failed()
> can now be restricted to the "tcg-internal.h" header.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

