Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A750548C39
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 18:12:10 +0200 (CEST)
Received: from localhost ([::1]:55974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0mfe-00032P-Go
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 12:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0mZa-0004xr-0t
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 12:05:50 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:43778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0mZX-00053S-84
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 12:05:48 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 y13-20020a17090a154d00b001eaaa3b9b8dso3503757pja.2
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 09:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cpwOhle5CdkasbRiSfgqXw4u2zQmLCZDZivvX2PIodE=;
 b=wyokZBwlc1Z8iKC9wLbZ8o35vmlLtNpOWsBRki5HMEAWQUEJgwHQVwfbCGCErlP69G
 mzfObUR+Kp8o0QK2SP52pHFy2qA6p3IWv/O+ZfYvMkMOmYNvF3a+2uui8cEzl4IS5HVp
 neVnCPlbUynyUUWP/d1eyKP57wufVI8AFBGdDdyeuLqSnn+xvOecbaxGv32DOsanPBcx
 YrNgCk0I+9xtwHSsa4sBKve7aD8+5tMYy9fDebQyqOs9KSEjOajAQOAd1MS13cGynIUb
 4XMCiXyyNkBtotlAvKzzMsaCZl0dbf7j4g6Z+M5x6CnI1eFuTC+CuDhH7K/XtdpxBHH6
 Ww5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cpwOhle5CdkasbRiSfgqXw4u2zQmLCZDZivvX2PIodE=;
 b=cy9bHr1Z+w2CJ5zNLu/kAQlGXi4NZ6679EZI8UyND/hBcr8qt5VpXvCVUIq5shO5sZ
 VZbiix2DPmM8tVudJMmotBW8wncWsM5iBV3hQTBYkKHfMU32uYu3RGROHzL+1/x7fjeg
 EQ4nj4Css6lf8KLc/VOoSfueNb9OE9A85EP7GPL4Xw5IhTPhjcRbMcq8unR6zylbxLAJ
 OfLM76NMf3Fd7TIf4LjjpNrPeM5SJgCCEHegFeAgcoGI5e5iWLykyv7jTrQTqL5MdOZe
 DGVNUPcwG46QojVbhk3+T0LzyE4aYfeDSy3ZqjGL5PDu9jsF6F6cDc7KS9H8bwKpokqK
 jFdA==
X-Gm-Message-State: AJIora+uXek74WemwymGFQesu4oK4BNiyztPxK07hugpqYc0zQrBoIlk
 ATlw/JfuuzCgXKvjdPjsv8PJ3w==
X-Google-Smtp-Source: AGRyM1uVESDaI+YtI9Oq52Hp+aXr5lAfj0d9yTsJAVnQ1PwSHILIYRRe3bi6xl2DgYzjhaOef5SwDQ==
X-Received: by 2002:a17:902:7783:b0:167:8245:ea04 with SMTP id
 o3-20020a170902778300b001678245ea04mr334273pll.95.1655136345299; 
 Mon, 13 Jun 2022 09:05:45 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 c29-20020a63725d000000b003fd8438db7bsm5655869pgn.58.2022.06.13.09.05.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 09:05:44 -0700 (PDT)
Message-ID: <ff6205f9-2db1-4b5a-c534-904bc64f5821@linaro.org>
Date: Mon, 13 Jun 2022 09:05:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v15 8/9] target/loongarch: Adjust functions and structure
 to support user-mode
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220609024209.2406188-1-gaosong@loongson.cn>
 <20220609024209.2406188-9-gaosong@loongson.cn>
 <4c0fd198-922e-d94f-fec4-05c53c5d6858@linaro.org>
 <e6e9c111-ca44-0126-b7a5-dcffe33385a5@loongson.cn>
 <20b38d22-0c59-ec11-88e1-af0f1f604984@linaro.org>
 <a6306006-d1df-e5eb-4f2c-5e1bf6adfe07@loongson.cn>
 <5476bca7-eadd-0880-8625-b01579f257f5@linaro.org>
 <758e6450-341a-3f76-dd95-34483347e142@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <758e6450-341a-3f76-dd95-34483347e142@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/12/22 20:50, gaosong wrote:
> Thank you for your advice.
> like this:
> 
>   void helper_asrtle_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
>   {
> +    CPUState *cs = env_cpu(env);
> +
>       if (rj > rk) {
> -        env->badaddr = env->pc;
> -        do_raise_exception(env, EXCCODE_BCE, env->badaddr);
> +        cpu_restore_state(cs, GETPC(), true);
> +        cs->exception_index = EXCCODE_BCE;
> +        cpu_loop_exit(cs);
>       }
>   }

This is not required -- better to continue using do_raise_exception.

> 
> cpu.c
> 
> 
>       case EXCCODE_ADEM:
> +    case EXCCODE_BCE:
>       case EXCCODE_SYS:
>       case EXCCODE_BRK:
> +    case EXCCODE_INE:
> +    case EXCCODE_IPE:
> +    case EXCCODE_FPE:
> +        env->badvaddr = env->pc;
> +        QEMU_FALLTHROUGH;
>       case EXCCODE_PIL:
>       case EXCCODE_PIS:
>       case EXCCODE_PME:
>       case EXCCODE_PNR:
>       case EXCCODE_PNX:
>       case EXCCODE_PPI:
> -    case EXCCODE_INE:
> -    case EXCCODE_IPE:
> -    case EXCCODE_FPE:
>           cause = cs->exception_index;
>           break;

But this looks correct, and sufficient to solve the problem.


r~

