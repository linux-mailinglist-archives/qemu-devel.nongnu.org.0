Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 452573683EC
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 17:43:15 +0200 (CEST)
Received: from localhost ([::1]:40276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZbU2-0003rE-8C
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 11:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZbQs-0002hS-5g
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 11:39:58 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:37599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZbQi-000675-5R
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 11:39:57 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 e8-20020a17090a7288b029014e51f5a6baso1190358pjg.2
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 08:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8QFss4KrUHTwMCq+zq4m9GaojwDFBlWTm4n+jGbkmb4=;
 b=xYxmffiPlDZ8qwJC9fNVBe6yk06HfzpryoOQQuUv2EVbswluN8hYQazq84aXmweVCL
 awYxxajHmoD1hoki4bzbGyCtaamY9zJd1H1RgdsXE8/xpPrnAV3ExDz5utY7eNdkoJw/
 P87vppEMW60M+Fwhu54BjiTBtvpIVCy4QoP53acI+weRe4P6VDuAiw8Lilev1y1AHL1x
 GhNKNfrxejBMNuYZdTJGYQn8aP66m2NiRRBCUwQcDaDJg+NsNcrSy/LlY7T5/0+nw8wo
 md6rJy6nrFd/jXABxpY97UqWPXGDw+d8YIhufnG1QKpfTjO7s0j4P/Ju/6UQSrG6ke+Y
 hxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8QFss4KrUHTwMCq+zq4m9GaojwDFBlWTm4n+jGbkmb4=;
 b=QyRSK4/6XYR27DHnRKqAqIQ9IQxtys9Sv4btXjx8Yeg5G4OKPI9vBwDaBE5ohwNc6o
 nrz5yJb37k3hxLCrUqDjX0uY5prino3I5ePLPjh12lXx30GQalfSsAORmiU3hf95NLle
 SuG/1XSVm+If3mkiBMF+y/zcuIEev74h5EQzvVdMBKGT6zoGWkYjA8mk/l6C0tltr2lU
 xw1nS3Wfrv8lVsElINBX6RsXpVY4OpmS7lhRARK9T/WHMVPxrZD+PwqDpGDmyDDlHfx3
 6qd0fZBuKGteq1+jTeTZKr02PQr6TlUXKCDPNULGbJ3TPJTTTZFq5q8PL9GwcjZYo1PW
 lyxQ==
X-Gm-Message-State: AOAM532yxpCzdsXrKuw2RiKo0+bbKozn3qAgFKDD0IhKB3IsrF4reewU
 pydu7YmCJNKgpR3ILZ7lJxl4a3925FZuuQ==
X-Google-Smtp-Source: ABdhPJxtVz+8lDpfucd89Azy9BZsR4xe9ICj7Alx+FeEMnPE82d4G2S7YloVtxaHIhXB7LoiYeU1iQ==
X-Received: by 2002:a17:90a:d41:: with SMTP id 1mr4842636pju.232.1619105986195; 
 Thu, 22 Apr 2021 08:39:46 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id k21sm2425894pfi.28.2021.04.22.08.39.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 08:39:45 -0700 (PDT)
Subject: Re: [PATCH] tcg/ppc: Fix building with Clang
To: Peter Maydell <peter.maydell@linaro.org>
References: <YH98WLDMQ5c0Zf5E@humpty.home.comstyle.com>
 <CAFEAcA995L--csz+fX4MqkSPTPxQ7Nx=q-Lh70bi_zQGoj54mw@mail.gmail.com>
 <1ebc5a66-2763-1379-24e0-774739f2edbe@linaro.org>
 <CAFEAcA9TaxkByWscOa2WC=o6fXAxaqAUt30CUsmA24jZ6HEYEA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4b7a580a-d701-f545-a8c2-5d18ea25a187@linaro.org>
Date: Thu, 22 Apr 2021 08:39:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9TaxkByWscOa2WC=o6fXAxaqAUt30CUsmA24jZ6HEYEA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/21 2:20 AM, Peter Maydell wrote:
> On Thu, 22 Apr 2021 at 06:18, Richard Henderson
>> I'm thinking something like
>>
>> #if !defined(_CALL_SYSV) && \
>>       !defined(_CALL_DARWIN) && \
>>       !defined(_CALL_AIX) && \
>>       !defined(_CALL_ELF)
>> # if defined(__APPLE__)
>> #  define _CALL_DARWIN
>> # elif defined(__ELF__) && TCG_TARGET_REG_BITS == 32
>> #  define _CALL_SYSV
>> # else
>> #  error "Unknown ABI"
>> # endif
>> #endif
> 
> Doesn't this also need some case that handles "64bit ppc clang which doesn't
> define _CALL_anything" ?

Clang does define _CALL_ELF for ppc64:

   // ABI options.
   if (ABI == "elfv1")
     Builder.defineMacro("_CALL_ELF", "1");
   if (ABI == "elfv2")
     Builder.defineMacro("_CALL_ELF", "2");


r~

