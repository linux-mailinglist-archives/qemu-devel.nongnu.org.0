Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3FA3649BB
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 20:22:03 +0200 (CEST)
Received: from localhost ([::1]:52266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYYX3-0005Jn-W7
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 14:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYYUl-0004ij-DY
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 14:19:39 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:36729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYYUj-0001pv-Qe
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 14:19:39 -0400
Received: by mail-pf1-x430.google.com with SMTP id c3so4953438pfo.3
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 11:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2byAd1htCUWhIoMsmRcSRDgayrswQ5SaL32lHDkdRgQ=;
 b=a8fFXoFBGkEJEdTd9lsAMDD6Bz8xU0xzloPT6djZ5esO6tdnbilNiWZodU3ZhQd5Dm
 n9a+WWVJMrMetEJxnok/eBBOA9s+2yC/UsNlOwnJQxR6HqCHYqOK7+KTqC3IHvMmeCK0
 I8U+qCahr4h7YbjL7erJzXtqrsBBMj/zsrme8SdB8B+v9D+7b6rTli/+uOT+Va7g0fKl
 RRDUvMy98mRQ3BrfEKJsfRQ0VL1UUnq///zvn//0O/WfB+2VQjARQ7QI2J+qyoFI0pfi
 OCHPJLXAtb3XJko4hiHiwS/deONXpuMLQL/U2wYDTU4r1e6cLd5Scz5uPh18rjYVhXmi
 hMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2byAd1htCUWhIoMsmRcSRDgayrswQ5SaL32lHDkdRgQ=;
 b=oGjoD4dILeaGiO7hEAkkaCWMnXc3n2Vc7dSZvCX4a0ZI0I8uun8lkHQjsBTqiKHtVQ
 C4hzch+fBJz8X3M+K8Q2oDo2FlJdW+pamYlVFf6aVp4zgAjhZ+y0oQh0oVKJaPxxqBLu
 YjKrky15KRXySVMJf3CA08Uf4WHa8Lo0xe8x32RHBU8A58C7+EKf6H/RhbQhFoQ48yp+
 XpuWK6QKDy4aN7SaSF6Kht7I+hmLYXn4hLsQuTnwQoNMK5awQbV4D8jutpPHu9opp8cB
 O8XKj9JqM8tsEU234ezuuv+ozgkuOPROhq50mW4AVrMFi8yRISSuBgCXS26+33vUozxC
 sn4g==
X-Gm-Message-State: AOAM532w991YGF2hNbN2u0NMt8Iy++fE/Zlws7w4AhdAm5QGS4m+Dfce
 wiVOADjuy6RmqxvcjjoD0fgX8w==
X-Google-Smtp-Source: ABdhPJzflKygd/Eol99jynb+1lWVA2XNLgo/056ddGpP47a0W+h4q6S4zGmfJog8uwdD4yXmEx2Rwg==
X-Received: by 2002:aa7:990a:0:b029:244:f35f:2b8e with SMTP id
 z10-20020aa7990a0000b0290244f35f2b8emr20632822pff.73.1618856376077; 
 Mon, 19 Apr 2021 11:19:36 -0700 (PDT)
Received: from [192.168.64.62] (50-78-183-178-static.hfc.comcastbusiness.net.
 [50.78.183.178])
 by smtp.gmail.com with ESMTPSA id w1sm14477355pgh.26.2021.04.19.11.19.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 11:19:35 -0700 (PDT)
Subject: Re: [PATCH v4 02/30] target/arm: Rename TBFLAG_A32, SCTLR_B
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
 <20210416185959.1520974-3-richard.henderson@linaro.org>
 <CAFEAcA_skZjvVsftNmGsE1JsZ-+45+22w8xwT9-oim0ET18DkQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6ff41d17-a36d-0aec-e913-72926da4cbac@linaro.org>
Date: Mon, 19 Apr 2021 11:19:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_skZjvVsftNmGsE1JsZ-+45+22w8xwT9-oim0ET18DkQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 10:03 AM, Peter Maydell wrote:
> On Fri, 16 Apr 2021 at 20:00, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We're about to rearrange the macro expansion surrounding tbflags,
>> and this field name will be expanded using the bit definition of
>> the same name, resulting in a token pasting error.
>>
>> So SCTLR_B -> SCTLR__B in the 3 uses, and document it.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> The new name is kinda ugly.

Suggestions?


r~

