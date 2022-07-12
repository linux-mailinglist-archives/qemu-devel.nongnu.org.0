Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3EE5710FB
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 05:49:57 +0200 (CEST)
Received: from localhost ([::1]:51696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB6uK-0004TN-BI
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 23:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB6s7-0002jM-RP
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 23:47:39 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB6s6-0002N9-8K
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 23:47:39 -0400
Received: by mail-pl1-x629.google.com with SMTP id z1so6172835plb.1
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 20:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DT9bPUBppois5WWoD4iTEPJW2aXttq0vxtxzDlk7DS0=;
 b=eX/kYdZkFIdlY6am13iphYwymXT+tFBzxBsYMWSvG56uH+vY6kpPBYFbuXw4j1moq5
 Zwr4es/8I0IGeHpMMS9WvVb9xrycmHlIYfWYgF0koF8mpALHEUbBKSftGiG9LIn1Sfa7
 ZLsPsegLtdwinqPfUz7xJAGzgMtH/Zg66s0H5NDUj2SabedsjnPl0s/yk9i0M6YSORTa
 b5IuR8kK9DhEPcxHmwBglrfTZZgenkcuJ8ssJgmvpCBI7tpXK8Tj5lW87qA+P8DMUwh1
 QHowwt0lVWCCZKp7z/yFVXZOBTJ3Pbfy+/kXbv+CwmwOzwxeUr7zmmRXRBNH3iUtjoDS
 kIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DT9bPUBppois5WWoD4iTEPJW2aXttq0vxtxzDlk7DS0=;
 b=ksHc9gr9A8CdIhXdZR/c6KSrwgMCX3R00HLZ3YP1jyNVW/vvlR45A6R1+cBy24yH2j
 /RIgfmgLD4qEtFnxezbdJrLUJnluWrMj4JED9mZSR282RKnKB0Ola3kMDY+cQmb9rAZx
 1/R4j7kt6FygjVrM7cYInPIhxJzVYAo1cxdRTFSha4sr46Vk6S3Nqq+YuPdrG7B6gzJc
 ird2FWV2PfrRVOMCXmlw4uz6T5LTD+ni9guvIuP0DYkQZLb/2Z7qlQOZLrgssTHKzCpY
 Go60nnKJKSRaJWJkgsJL1XtLRS4F4hv4BdWRaXhXbsmrX5CNbEvIORs9xkcaTJXHawgg
 MfAA==
X-Gm-Message-State: AJIora/ZEv6YylwtGPgbAOaVzzo6kNBcKuzdSn722a+0XErnTcFvduib
 scgm0ff3t6uzUSeoL+eYJyX1yQ==
X-Google-Smtp-Source: AGRyM1vc8tWswrCfGcE4q4CDyJ49ppZLn8OpDIfjWzNDf5Eauxm15QxL5hCVxdJdZt10NgwexCachA==
X-Received: by 2002:a17:90b:2096:b0:1f0:1c73:f62d with SMTP id
 hb22-20020a17090b209600b001f01c73f62dmr1875272pjb.120.1657597656277; 
 Mon, 11 Jul 2022 20:47:36 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a632246000000b0041296135280sm526397pgm.88.2022.07.11.20.47.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 20:47:35 -0700 (PDT)
Message-ID: <c7dcf637-df7a-e4e1-0152-232ed0cf5e68@linaro.org>
Date: Tue, 12 Jul 2022 09:17:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] target/riscv: fix shifts shamt value for rv128c
Content-Language: en-US
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
References: <20220710110451.245567-1-frederic.petrot@univ-grenoble-alpes.fr>
 <CAFXwXr=OK38-vFo7+1z4RtqKcr9hz74bVxb__q6xi7rkyziMUw@mail.gmail.com>
 <381a2feb-fddc-da5e-c94a-d2f5d3471297@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <381a2feb-fddc-da5e-c94a-d2f5d3471297@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

On 7/12/22 01:24, Frédéric Pétrot wrote:
>    Agreed, on the non compressed insns, but the compressed ones have a 6-bit
>    shamt only as visible on page 18.6 page 125. The explanation for rv128 shifts
>    is further detailed in the emphasized paragraph on top of page 120.

I see.  I should have read the "c" more carefully there.
Indeed, the code is correct.

I think the language could be improved a little for clarity:

>>     +static int ex_rvc_shiftri(DisasContext *ctx, int imm)
>>     +{
>>     +    /*
>>     +     * For RV128 a shamt of 0 means a shift by 64, furthermore, for right
>>     +     * shifts, the shamt is sign-extended.
>>     +     */

For RV128C, a shamt of 0 means shift by 64, and the shamt is sign-extended.  Combine this 
with implicit truncation to 7 bits, and this equates to replicating bit 5 to bit 6.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

