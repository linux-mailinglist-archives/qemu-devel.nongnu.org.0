Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707B0558CC1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 03:22:00 +0200 (CEST)
Received: from localhost ([::1]:60930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Y1G-0008Vp-96
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 21:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4XzU-0007Pz-DH
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 21:20:08 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:42626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4XzS-00062a-9G
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 21:20:07 -0400
Received: by mail-pg1-x52c.google.com with SMTP id d129so1000760pgc.9
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 18:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pRrUPz0xYjNlJsveb1Vmc7MeLq51QQk292lIAl5XYPU=;
 b=pw1234ghNZRHuv44JY86uZY5B1/n1MmjCK3XV/uYtpr8Id90XndEdX4MYYwYRfjhF2
 PxShf6Lc9ZM+nnHruq49/npvV7oVlfmy1+zUwPIycMIgeyOb8Ab4JrzCbN/rrjEeAuGR
 q6LJBGT97pGgG8OktS7oINiIJMMwO41CM6d/vPu9yAuZfEb2bKFd1DFlGeYEpsda/rbV
 dwE1bY/+MoEUjKrDTvtwMDoVPZ+sgshQLdU6Db30c2wNXP4rNpz4cg6bRe2vyV7G6UXA
 6BzcXXhPhDJVXX5oLvcoSNyv+oIPyDusGtnxrqshYNJvsrAH3YolYRjO39BobY69H6ID
 EW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pRrUPz0xYjNlJsveb1Vmc7MeLq51QQk292lIAl5XYPU=;
 b=LsKbtsoI5ftghr32Xfv/ZXMEnHHENdFi3n50rRlLwStpQThuoNJLa4B172t2xtGHp0
 /VjQZodc0EOYOnU1LExDsAobcsEJrMj2yNtGXPO84PCShxfNNjiXXpKTYNsHMdQYul9o
 iQY439dEyghTv0JuuoRsX3d46oDvgMSWEcdP2ggWvIyKKAucSTm8WUQJwTjsfPhnGPlV
 CFOIMyiv//zyX1yHuU63H5FDVB1/FRkhULZBoZQ6l1L5Yfbe6PMNm8l5FYD2nO/IEloN
 0Ioxo2u/UPjF7Kgm1SvQ79oaM4tK4fHjAQE56I2u1HTtkYlGF2H003t+kbsalMSr4vHH
 znmw==
X-Gm-Message-State: AJIora973pCxYAQn0PJgskXUNHTeQLhjrsOGwh87CQLf9SGRV32FhoBd
 OcLla/tbCwSuBsHFaaTOS9aHvg==
X-Google-Smtp-Source: AGRyM1vFEFQ+AD1eJ5V30o/v0mBy/cPV4fg+Xtl0f6JMOnc8amy8zf77oZo1Z2uoCjHfgY0qep74MQ==
X-Received: by 2002:a62:528c:0:b0:525:3bfc:a5f7 with SMTP id
 g134-20020a62528c000000b005253bfca5f7mr14796964pfb.66.1656033604639; 
 Thu, 23 Jun 2022 18:20:04 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:8d3b:10e5:674f:8876?
 ([2602:ae:1543:f001:8d3b:10e5:674f:8876])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a62be0c000000b005254344bf48sm295013pff.5.2022.06.23.18.20.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 18:20:04 -0700 (PDT)
Message-ID: <7fbda1a0-938d-fe5d-a6e7-ddaef3577555@linaro.org>
Date: Thu, 23 Jun 2022 18:20:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v19 02/13] linux-user: Add LoongArch signal support
Content-Language: en-US
To: maobibo <maobibo@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220623085526.1678168-1-gaosong@loongson.cn>
 <20220623085526.1678168-3-gaosong@loongson.cn>
 <fe3d36d7-2ad1-94d1-dd06-e650916b37fd@linaro.org>
 <2fc368ce-7323-b49b-20f1-54a449a40ce4@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <2fc368ce-7323-b49b-20f1-54a449a40ce4@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

On 6/23/22 17:45, maobibo wrote:
> 
> 
> 在 2022/6/24 07:34, Richard Henderson 写道:
>> On 6/23/22 01:55, Song Gao wrote:
>>> +static void setup_sigcontext(CPULoongArchState *env,
>>> +                             struct target_sigcontext *sc,
>>> +                             struct extctx_layout *extctx)
>>> +{
>>> +    int i;
>>> +
>>> +    if (extctx->flags & SC_USED_FP) {
>>> +        __put_user(extctx->fpu.addr, &sc->sc_extcontext[0]);
>>> +    } else {
>>> +        __put_user(extctx->end.addr, &sc->sc_extcontext[0]);
>>> +    }
>>
>> This is incorrect.  Where did this come from?  It certainly doesn't appear in the kernel's version of setup_sigcontext.  The only reason the result works for you is that this is overwritten by copy_fpu_to_sigframe within setup_sigframe.
> 
> The val of flags is SC_USED_FP alway in function setup_extcontext in this version. We want to optimization in future if FP is not used for application where sigcontext for FP is not necessary. Also it can will be extended for 128bit/256bit vector FPU.

No, that's not what I mean.  The store of the address is incorrect.
This is no such address stored in the frame at this location.

If you believe that I am incorrect, please point to the line within the kernel source to 
which this corresponds.


r~

