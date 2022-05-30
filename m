Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BAC5386C7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:31:50 +0200 (CEST)
Received: from localhost ([::1]:33202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjF7-0000wU-2h
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nviQC-0000wq-Tz
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:39:12 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:55887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nviQ7-0004SI-6S
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:39:12 -0400
Received: by mail-pj1-x1034.google.com with SMTP id n10so11427055pjh.5
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WsGZti4F+jeMV6z6p2VrU92mU9kUkyl/cZrjausArAw=;
 b=uKl3z4Wjm616w5GxQWvg98CFHXAdaztef2cxgOAVcUgxLTYXAzmHXhGa/KTFlLohBM
 XnQgLA8U5Hsua5bmOpKtrtuH6jZaTluk+0xMIqb2cTR66Z1M9m5DuzVWjmfCJtqgIGCd
 ay6bndQzhahVB3sNSSF773CUIctdUVwBtKLfbdOEhnARh/6SoZ/Weh6QPP5kLC8OnjXQ
 ZWWMqciZzWOOTlkC3I8EXRAcyBtxpJwZmzAmJLnOexM7azY6xvN60zQ/+TRhpN998ael
 NVwixxRFePHQGRlxVbJU+OQfz0GPYAIJq0cN74j5wIxTlpDomBXe3Vtt0cEyxtGjaBm2
 sq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WsGZti4F+jeMV6z6p2VrU92mU9kUkyl/cZrjausArAw=;
 b=wQtWeF0SAHvrQPeWcz2wxM6V2w4JB9GXZ2CSb86G4Ags1UWmSf8zvZ7dOahsNXC6oB
 QYfzaqqtjmaTzKzIL21SRApv+8cyObOjwByGXJ5BOlmgWlSsg1Rb23lxTV19D4JkHAKO
 nG6PlBSkUzRog4Abs+e0OtQdkWGUX+dWGtHdPbkNuUUNXU/Zrt51umjm4vtNOFcV48CE
 cYnpiLOOrH9e0ITY0w4z1rhvwWtWiaqDoiBWymtDbIqwUxauf9loREnlpO7fDAO7mSvZ
 YQj1dH1hWfOxDMlq2o6b5MOLDrFRTpEakJZ6AW5dxJkObKhuTNrFeT9lto8h1Q1m98qd
 CU7Q==
X-Gm-Message-State: AOAM530GGsGbw2OjfkkPad7Svtg6qE2PT/IozoLd82RyY83dvLek3A/Z
 7LXu6WqaYZUP0n2EyN6s5zSd/Q==
X-Google-Smtp-Source: ABdhPJy+d2nEwvcZ4lyGHIVacQDu77A9lBC1FV3myDlMHDppSmoDJMiRtdMcwbEBAIFK5PS9PJhG1g==
X-Received: by 2002:a17:902:76cb:b0:15e:e178:e2eb with SMTP id
 j11-20020a17090276cb00b0015ee178e2ebmr57655275plt.0.1653928745629; 
 Mon, 30 May 2022 09:39:05 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:feab:28bd:b064:f797?
 ([2602:ae:1547:e101:feab:28bd:b064:f797])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a17090a2e0400b001df2b09ce9dsm7170920pjd.4.2022.05.30.09.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 09:39:05 -0700 (PDT)
Message-ID: <da0ad208-948b-1da0-5c61-039c084d50dc@linaro.org>
Date: Mon, 30 May 2022 09:39:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 01/18] target/arm: Allow raise_exception to handle finding
 target EL
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220523204742.740932-1-richard.henderson@linaro.org>
 <20220523204742.740932-2-richard.henderson@linaro.org>
 <CAFEAcA9Q8FQpG6RF4rnMS3EXZqBXzOs=n-3oH8iq5gU2wV4Emw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9Q8FQpG6RF4rnMS3EXZqBXzOs=n-3oH8iq5gU2wV4Emw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/30/22 05:44, Peter Maydell wrote:
>>   G_NORETURN void raise_exception(CPUARMState *env, uint32_t excp,
>> -                                uint32_t syndrome, uint32_t target_el);
>> +                                uint32_t syndrome, uint32_t cur_or_target_el);
> 
> "cur_or_target_el" is odd, because it's mixing what the architecture
> sets up as two distinct things: the state the exception is
> "taken from", and the state the exception is "taken to". I was
> hoping this was just a temporary thing for the purposes of the
> refactoring and it would go away near the end of the series, but
> it doesn't seem to.

No, sorry.  Most of the time it's cur_el, except from cpregs, where we get directed to a 
specific higher el.  There may be some way to split the helpers...

I'll have another go at this reorg this week.  If it still doesn't feel cleaner, we can 
drop it, and I'll make some changes to the SME patch set building on this.


r~

