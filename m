Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E054B4B1D41
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 05:09:02 +0100 (CET)
Received: from localhost ([::1]:44136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nINF0-0004on-1P
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 23:09:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nINE2-0003zC-O7
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 23:08:02 -0500
Received: from [2607:f8b0:4864:20::433] (port=35793
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nINE1-0007jA-3T
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 23:08:02 -0500
Received: by mail-pf1-x433.google.com with SMTP id l19so8221130pfu.2
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 20:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XCkiS+5c+wdL44u5Z7clucisqYI7mCYtYlrw4ABEGcE=;
 b=vxkWPGI4Sj4TTSf5MekQqsHHghfdnrten1ul4b65nf38ZstdKfmQpe7g/sf4Is51kY
 qtOBGhAkjGumfACmIxojQGah+vMOdO6qh6GlwNOomLasG8qqkDJNUORxvRA2QHUTof+c
 R7LKzGt7lHagiv9dhzUG9u9EJoWBap+uQpLgTC1IKZ/jpDKonN9f1ZDZQqSdg3JoUs74
 1eL4EuKaUj3djiDZh26s7UqZ/1bV19T2ssfPihV1jZU6QmGlgY8/iF/GYtTb8pVOC8gs
 IWCQmpPbJ96sEmpz+mzq0RVkxQSsyq0rboGqDYWdAFqJtv3VRIt9k+dg2JDA6L99xteg
 QhNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XCkiS+5c+wdL44u5Z7clucisqYI7mCYtYlrw4ABEGcE=;
 b=bStDOWBF8ycD8xqB72viBJmP5y4UeigpYUzXGEK4HNJjTgzWQcUXx5YmALhTyCjJON
 3zHWdF0Xo9yZBVocrgBiJKoWbPGAbZBR3EXUStxr2vPtZSuekr1c3Vk01fehUjuBlI+C
 /tC6KH5+8LytlD51s42QbRMbYwhRHm4tExOkDYmHwEUEx+7rcdN+px4dLZ6/J8ta5VBE
 0zU0kazi582P+1GEnvP59a/SRzK8zT7VgHz4HBxV8wXHAxPYotq6MyfIat07Hlo09blX
 YR1PamIrEqkpzG4oLi86ReUjyCC3QV351njxSkK78WiNdrho2WTobDz6PlwwLP1EQwP0
 uLbQ==
X-Gm-Message-State: AOAM532+V0crMN0dYninKimWi/Zi6glOA0jzKvCO5X1EERIUhNXZrKVz
 G0TJsWj9q8MIyDQihmGkE3IA4A==
X-Google-Smtp-Source: ABdhPJz5zC4w2G/9DTsQQyYqdZK6KKQ0Xf2CxzEwsWgdQXZJMaowrSxErg00R+yTP7ewtJzVPddkzg==
X-Received: by 2002:a63:9307:: with SMTP id b7mr8786557pge.291.1644552479568; 
 Thu, 10 Feb 2022 20:07:59 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id l16sm3439000pjz.38.2022.02.10.20.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 20:07:59 -0800 (PST)
Message-ID: <4c8851f3-6da6-6686-17bd-e265749d2fb8@linaro.org>
Date: Fri, 11 Feb 2022 15:07:52 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 06/37] target/ppc: Implement vmsumudm instruction
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220210123447.3933301-1-matheus.ferst@eldorado.org.br>
 <20220210123447.3933301-7-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210123447.3933301-7-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 23:34, matheus.ferst@eldorado.org.br wrote:
> From: Víctor Colombo<victor.colombo@eldorado.org.br>
> 
> Based on [1] by Lijun Pan<ljp@linux.ibm.com>, which was never merged
> into master.
> 
> [1]:https://lists.gnu.org/archive/html/qemu-ppc/2020-07/msg00419.html
> 
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  1 +
>   target/ppc/translate/vmx-impl.c.inc | 34 +++++++++++++++++++++++++++++
>   2 files changed, 35 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

