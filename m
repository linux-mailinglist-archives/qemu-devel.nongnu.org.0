Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE9C4119A3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:19:04 +0200 (CEST)
Received: from localhost ([::1]:36912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSM0V-0007zn-Ia
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSLyS-00069j-Nl
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:16:56 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:33336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSLyR-0007eE-8u
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:16:56 -0400
Received: by mail-pg1-x533.google.com with SMTP id u18so17936290pgf.0
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 09:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=oocGRP6iDUioVwuOybphaC+kztuj5DBccsVpL1Mtw1E=;
 b=LWzAkClVi1hl42iUFKOF2QIEdwjHem29u2LaEv5+y41e1cfEjqbBL4N964zjPHj2jQ
 DX9Mty//eKSEopUhAg9gpBKGbLon/mnL0P/gId04B5553FJJrAMdtka+I/tTEbHH0Tv1
 Rh1v1Jb2OTokqqIqlWKJM2p5HWfRmrdSQHjMeOSSrml0pqCx6PULGm/LZy/o/H4RwJjm
 k5o0pHhPXHwais/VSyG02QqSp1lg1gqaK2etRY61w1ACUF5fFK0satyLQF2mKES/c1Nd
 fOg2Vwx3pOjDu8JYk9+A97T2f/uRKSksgrmGTgX1r/Xr/YhIEfJUoT2a01FOxeyCQVlT
 VuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oocGRP6iDUioVwuOybphaC+kztuj5DBccsVpL1Mtw1E=;
 b=yovKhecsa/LCclZ28buRs13l51JH7jyDVeUP1UWAJiCAkRe7GS5yL3lezPTVQcQ14S
 hmv985wbV35+S3Tu337FdMfd1Ves7Y5kTry2GqPAX77cFEmlwOu13RUXZagQNw3E2tJg
 oo8LUC6JndiivHTued8KOsvCDdLH3jrExu5S9DMX3TUmujL9Mw8PzrsHY2lcb/M0lpIu
 9xpEUDE/r3DlzF4q4NRItOAQ6FJYi/aXKA2UJhPX1H7rEKtKCj1VERM82GwjwDl512fY
 ufGQuoHay1kjUV3cEwtvFZZCLhuSFEwqzTF9Xa/xWTTqx31qI8jbXbSvbz9lJPTi9HIo
 XdJQ==
X-Gm-Message-State: AOAM5337g3mQ9/+7/QlKCMroTQ7tC8FOOxeVcciyyvBidoXGTROca4vs
 XxLncjjDIWjhgYg/ZPtxoBzm8xGIEg6zCA==
X-Google-Smtp-Source: ABdhPJyz4/R/7UabtzzH/IhVcGeGvJheZ2zeFSDJJ7dhnwamUlpra1OF78jL9t15Dg9WoHSLey8TWA==
X-Received: by 2002:a63:5f16:: with SMTP id t22mr24347283pgb.86.1632154614000; 
 Mon, 20 Sep 2021 09:16:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q2sm19268937pjo.27.2021.09.20.09.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 09:16:53 -0700 (PDT)
Subject: Re: [PATCH 18/30] tcg/loongarch: Implement
 mul/mulsh/muluh/div/divu/rem/remu ops
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-19-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dbd11615-a89d-a676-d9b4-bb1b880af68b@linaro.org>
Date: Mon, 20 Sep 2021 09:16:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-19-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 1:04 AM, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui<git@xen0n.name>
> ---
>   tcg/loongarch/tcg-target-con-set.h |  1 +
>   tcg/loongarch/tcg-target.c.inc     | 65 ++++++++++++++++++++++++++++++
>   2 files changed, 66 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

