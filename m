Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9D72DC6F1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 20:16:00 +0100 (CET)
Received: from localhost ([::1]:46314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpcHH-0008Rw-97
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 14:15:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcEa-0007Dd-DU
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:13:14 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:45594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcEX-00083T-JZ
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:13:12 -0500
Received: by mail-oi1-x233.google.com with SMTP id f132so28798275oib.12
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 11:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B187FxwDI6P6wv3JRHBFoR77yJhWAv6SXFjkYKVTz5o=;
 b=W8ZjVeQrM7JsQ25ShuKwWAp3iCi2ZvI8HwawKUmKbdyIxwNpYOa9ersAfSm+Ky4FJ8
 DSvrQZTtG4E+ngFYmOOHYrW6gPE7OXeFoFg1ICeJeWjDfPvIfoIVqHZRaONUdf2F9U0Y
 DEQ6C2ZiI9cv0x/Rb3Iebl9yFMT6dWZZGBzQIPQnE7yxbr9guwp0gxdTQnpjhwE268Mg
 5tCMJVLCmHNGtAU3ahKUZKdMtn4p0tT7MnZSm4b5hzoaIoSwa0WvJajz3ox6fgQRB6KY
 1mX4N0XlXUiFq9inSE7SxAJ2Rw2c2HTy/84vnLGRe6KYqEsvnVJgDNjh0ceLR7RJ42es
 9INQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B187FxwDI6P6wv3JRHBFoR77yJhWAv6SXFjkYKVTz5o=;
 b=K6h8aOEJ8Epfhnuz4dGc+d8REKvOhDjjCzFZJPGlgo2izIPhoWsLh/2YIvW2qi4BJs
 9GjUO2nAckBE5w9vLLG8Rpc1iop7jRyqdaK2DI1aTEL3V4qCL8UroHbtgoXPUHl2S1wU
 7BNOK/1P0bFte/T5L/C7HPp6ejUAgydWVZhAFnfdNaFnnBDjUeiWk+HNyj6U6W/DusQF
 vg/ABmKpCrEppxCW1O51z+vGnxtEAYI5HXI0cXU2JvBQAwzgWBe8LTV04Rl/YdpOI+pl
 25s9w58pTSe0cCv7xGh6ScdFs8xcMqKrqcTx2eG/nsRMzlvbl+y8v7MerEk1EvkFzMkg
 9XVA==
X-Gm-Message-State: AOAM532gGR9nNykehYeUG5CQRkypTXOJMqlVbOQgKIecx4Zc9ee2WGdc
 DyQUR/exgKekRqUBtKSn/KPmbQ==
X-Google-Smtp-Source: ABdhPJyVhhfYCxvbUtJynIccNOahMfqCfmXfvPyKwPd9JBTx5bSOFz3WiIqPMttPNnIo48Xi/LQc5Q==
X-Received: by 2002:aca:3151:: with SMTP id x78mr2797620oix.39.1608145988515; 
 Wed, 16 Dec 2020 11:13:08 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l5sm635864otj.57.2020.12.16.11.13.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 11:13:08 -0800 (PST)
Subject: Re: [PATCH v2 05/12] target/mips/mips-defs: Use ISA_MIPS32R3
 definition to check Release 3
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201216162744.895920-1-f4bug@amsat.org>
 <20201216162744.895920-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <364af88e-2161-7c85-0bcf-7ea0b34cd209@linaro.org>
Date: Wed, 16 Dec 2020 13:13:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216162744.895920-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
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
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 10:27 AM, Philippe Mathieu-Daudé wrote:
> Use the single ISA_MIPS32R3 definition to check if the Release 3
> ISA is supported, whether the CPU support 32/64-bit.
> 
> For now we keep '32' in the definition name, we will rename it
> as ISA_MIPS_R3 in few commits.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/mips-defs.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


