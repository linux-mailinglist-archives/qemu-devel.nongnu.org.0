Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 026416124BF
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 19:53:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oopza-0001k5-HH; Sat, 29 Oct 2022 13:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oopsP-0004FM-8j
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 13:44:10 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oopsL-0007qT-UR
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 13:44:08 -0400
Received: by mail-wr1-x42f.google.com with SMTP id z14so10455651wrn.7
 for <qemu-devel@nongnu.org>; Sat, 29 Oct 2022 10:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d67QoSk94UmpW5SLcXPzZG8c0nrH1h6avSU4r0fPlLI=;
 b=GcX2+urVEgCjsB+IIsvjaMSAVHpP0WIwATZC0Q/BOGFCUKXWxehoMex+lcgADGxogk
 UQf3JDq84wPo57kfcXoSSkat2rJH1BzNQD5fAowC0y7PeDStgrpAp7vtUhoUSVrK1vTi
 0xMm4bqFDXuxzDeKkQe8clc5BMBC3zMixicP0DHCCvQqgS4O2y0mYd5Lf8KbLqpmBY45
 ArLBkDqXfwe1ZxoX0+6Z3rQ4pQPQvYv02qbYhxmLpjF5FiFYfAPLX//Ef54wqVr3yXoI
 TeUVuNRmjyGiuPf59Ouoy/iEzRoHsU12eqQu9F/DxDMOOVXDcjbMm0e7+Q8mIT275AG+
 g3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d67QoSk94UmpW5SLcXPzZG8c0nrH1h6avSU4r0fPlLI=;
 b=nekoY4PU6Z6dl3WOV+Oc4YkwzkXSO+/iC27r8+NW01dbewMtPzYo8nKGdgVd/SRyVc
 9xAl1HLxDZs3+6nDucmszqPslg+k6xa+Ni6S0PF+gcqURKSkS8VHWzcBmHUd2BrL2k6F
 4QvViEGf1r9tSiCWu3bCuS67LeQcPftu7CLy4gycHM+7aWXXRH0sVWBDPpIWNNlyAxkE
 rX1qKaWLmUgQ+bDf7qVnIu81JcKOmjea1SwbqmCy6fJsQGXps1+p5W/iQR15rAOYOK0o
 eR+oPCw5iTPe3dXQmrstjLpq3BVy9FmKJaSVunb+ODhTBkcEMdbZzpMDJcGPp1I0vwIB
 76yQ==
X-Gm-Message-State: ACrzQf3ir2DYBnEAS3G9EUp6rQ851q4FrvcpJYGOngX30zvlGSWWbe5k
 xJz2Cq9gqmTmKQSoOfVbtcIg9A==
X-Google-Smtp-Source: AMsMyM7x09I/jFlFAfvDhf4hybKqu8TInOoJzHwNnQSPpA6XFccNt7u9YFfuhEq1K3Y7DRfotghDAw==
X-Received: by 2002:adf:dc4b:0:b0:230:5fe6:69d2 with SMTP id
 m11-20020adfdc4b000000b002305fe669d2mr2819936wrj.469.1667065443571; 
 Sat, 29 Oct 2022 10:44:03 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a05600c4e4900b003c452678025sm2307335wmq.4.2022.10.29.10.44.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Oct 2022 10:44:03 -0700 (PDT)
Message-ID: <5101ed53-5138-d40e-559e-1a3fd76a8c94@linaro.org>
Date: Sat, 29 Oct 2022 19:44:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 1/3] target/mips: Set CP0St_{KX, SX, UX} for Loongson-2F
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, f4bug@amsat.org
Cc: qemu-devel@nongnu.org, pavel.dovgalyuk@ispras.ru
References: <20221029020030.13936-1-jiaxun.yang@flygoat.com>
 <20221029020030.13936-2-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221029020030.13936-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 29/10/22 04:00, Jiaxun Yang wrote:
> As per "Loongson-2F processor user manual", CP0St_{KX, SX, UX}
> should is not writeable and hardcoded to 1.
> 
> Without those bits set, kernel is unable to access XKPHYS address
> segmant. So just set them up on CPU reset.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   target/mips/cpu.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index d0a76b95f7..a870901bfa 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -304,6 +304,12 @@ static void mips_cpu_reset(DeviceState *dev)
>       env->CP0_EntryHi_ASID_mask = (env->CP0_Config5 & (1 << CP0C5_MI)) ?
>               0x0 : (env->CP0_Config4 & (1 << CP0C4_AE)) ? 0x3ff : 0xff;
>       env->CP0_Status = (1 << CP0St_BEV) | (1 << CP0St_ERL);
> +    if (env->insn_flags & INSN_LOONGSON2F) {
> +        /* Loongson-2F has those bits hardcoded to 1 */
> +        env->CP0_Status |= (1 << CP0St_KX) | (1 << CP0St_SX) |
> +                            (1 << CP0St_UX);
> +    }

Don't we want to update CP0_Status_rw_bitmask in Loongson-2F
entry in mips_defs[] instead?


