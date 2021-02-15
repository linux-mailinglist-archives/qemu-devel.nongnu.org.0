Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F1331B3D9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 02:10:53 +0100 (CET)
Received: from localhost ([::1]:45508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBSPc-0007WV-Qi
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 20:10:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBSNz-000768-VK
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 20:09:11 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:33586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBSNy-0002tf-HH
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 20:09:11 -0500
Received: by mail-pj1-x1031.google.com with SMTP id lw17so2044464pjb.0
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 17:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B++feXXWf9VzpBYZIZ3r4MRnIHz7Ib4cGXlo9zwZADY=;
 b=dvldL/7zU7wwjXmnbttK7SxXjV2GdPOA7RLaQhFZsQ5fEgc6xalloufNdqfTc+P0Sa
 rnW+++QYSVps6WrBqOwlEhpXh81Q0YNKqCWAis1KCMS03HrS8LrE8LENsUxZjKlYI+br
 phz6g4N5TDXg74jjTfOHfe8stiKkgMmaHqkEPVxgY7uzzqq7Xx6zb4Q0esH0cjxPHeKx
 e0jH0va0T/1jLRNGfF/S/9sv7YtWGiroHvQ938Mq+NOqFDSHpFeOtUDNeDOT860Sft8P
 zrITzyxlphf9b/PyXtV6XeE5gVLiDXpQ3I9nsb/Koj30LTjGx16hvXc3X6qr3xSpbQye
 8fyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B++feXXWf9VzpBYZIZ3r4MRnIHz7Ib4cGXlo9zwZADY=;
 b=Iy0Ef6Hc1BdYourOqIC4l5ibOPqfEIq8Ipj+dX8MmA16r7VZ52bZgqpXZ61Mj4Hyzv
 EHB2aRJeNe9p6N3fHyfvo2dTSBPDgsNlGPZMXKrUWlAWzTq6Ontzza0bie0wls3CaTaA
 l+ejeddxNLpLlBhZ43EDemm1IOum1eA9oHqSVuEujfBEsVkvlDBIiOhfibBtg2Q5LMGG
 e3coNQo7XHuSnRt2dN02eFio6xOUeZFcgmFeSnZEcu1dqrHPRGKPIOiDLMuMU9JuC4QA
 0kZz3o1TYKfHvhIzBGa3sDQzgXQCZizop3jhibgHYZ+ilWFErZozYxwsbWrqvMmXY0Dl
 Xfeg==
X-Gm-Message-State: AOAM531ksCGHHILLcUFvKaqNU01oH2waY7YrbwZlHDdG2qfApTALh8Cc
 dL/ZQWmHUVF+bD5zrA1DsVJAlQ==
X-Google-Smtp-Source: ABdhPJz3QaQLN1tQJdCPej6tBYtMm9z8grnJvH3QcJrBZ8gDxl58sQMM8jrg9GFXCTIo9lj62PWKKQ==
X-Received: by 2002:a17:902:d647:b029:e0:8ee:d8ac with SMTP id
 y7-20020a170902d647b02900e008eed8acmr13074908plh.4.1613351348829; 
 Sun, 14 Feb 2021 17:09:08 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 s10sm12987886pgl.90.2021.02.14.17.09.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 17:09:08 -0800 (PST)
Subject: Re: [PATCH v8 32/35] Hexagon (tests/tcg/hexagon) TCG tests -
 atomics/load/store/misc
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-33-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6b96d55e-a383-4e17-7916-eeb580eb002c@linaro.org>
Date: Sun, 14 Feb 2021 17:09:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-33-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: ale@rev.ng, alex.bennee@linaro.org, philmd@redhat.com, laurent@vivier.eu,
 bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/21 9:46 PM, Taylor Simpson wrote:
> +/* Using volatile because we are testing atomics */
> +static inline int atomic_inc32(volatile int *x)
> +{
> +    int old, dummy;
> +    __asm__ __volatile__(
> +        "1: %0 = memw_locked(%2)\n\t"
> +        "   %1 = add(%0, #1)\n\t"
> +        "   memw_locked(%2, p0) = %1\n\t"
> +        "   if (!p0) jump 1b\n\t"
> +        : "=&r"(old), "=&r"(dummy)
> +        : "r"(x)
> +        : "p0", "memory");
> +    return old;
> +}

While I can hardly deny a cpu testcase using inline asm, I'm a bit curious why
you didn't use the compiler builtins.


r~

