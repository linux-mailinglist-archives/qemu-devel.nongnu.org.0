Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AF152ABB9
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 21:13:17 +0200 (CEST)
Received: from localhost ([::1]:41892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr2d4-0000b0-3S
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 15:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr2ah-0007Io-Bq
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:10:43 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:44874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr2af-0002vy-Kd
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:10:43 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 pq9-20020a17090b3d8900b001df622bf81dso3119886pjb.3
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 12:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=k1DOPC/r4V0uvyQnb3nAgbpKdv07q5zdedxkSsLr2GU=;
 b=kD5dghjpZCJAmtrj3lBcrydy+ySXqkZLUhWrHVKv1Q8wM/HKxMiEf98pqRzmf4gE7f
 0LS/ghYrJIk5efZqx/Som7jvHZ0S4VKnn5UtfbIrdxe8KS93wm8qIDRZaD82Mx3OmSTI
 4gx0ra+IGxrqtGWf2LJoGUajelZHRipKnkxvivH06y/dY+rNg6/8ZWbY+9FaYj7diEqa
 JFvyzUubWd5o/KtwT0bESfQCQt3kmNXzhzjZCFsyRevXk3ozfpszeHmyDuG2/qfxOTjF
 2LrEUKLGK3Afqn0Ddl44BaC1puXWxbZaLXsocG0Vl5lT7El42FB7cSFWTEiLSZAjyyiT
 VeHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k1DOPC/r4V0uvyQnb3nAgbpKdv07q5zdedxkSsLr2GU=;
 b=WiBZsKR36R+TInEYzVCQkwHoCM54zfPmT9nx/H3JbF5m1Ghis9vWDspq5TSPEm+qa6
 4y/CkMlwPXj/RK3k3Vjo9BunDrUq1f/BJpoMEfMHXf5TBfm4b6BMprcpGm9K+qrP/2m9
 eG1X8jVRBPfhlb9wYqh9IDZ/qHrTf3MKh96GFf2zKZXDWskKZDRiryRhM2CMyawsOnp/
 LLzLpCnJPV05xMe8HII2c8AIv3KSY/bgsaLb3xo/BfojjWeRcdxmDMqWCtxVp3opq5x8
 QPm6PXimV+JIKN6lRMWB3J+u4RPrbGgx0T+Bo6ZeOseNc0hPRU1V0rOtvEgRCxlownDX
 SWvw==
X-Gm-Message-State: AOAM530uu3SlIOamc4y5NBtF9SP6IPu0gSLq5Vizrn9w/wEyE3mudsPd
 MSmmmEA9QZaSi84c2kukQffhng==
X-Google-Smtp-Source: ABdhPJyrSi5TYGc2Lg7baggq/eksM078sUTwIB1xOTnQfd65gqjn2kwhyK43s4s6NuDt4sZIbspKBA==
X-Received: by 2002:a17:903:288:b0:15f:4cc6:3195 with SMTP id
 j8-20020a170903028800b0015f4cc63195mr23261775plr.45.1652814640187; 
 Tue, 17 May 2022 12:10:40 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a63cc05000000b003dafd8f0760sm8945716pgf.28.2022.05.17.12.10.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 12:10:39 -0700 (PDT)
Message-ID: <07018ee7-ea1c-591a-e0f6-28c29dd593bb@linaro.org>
Date: Tue, 17 May 2022 12:10:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH RESEND 09/10] target/ppc: implement cbcdtd
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
References: <20220517164744.58131-1-victor.colombo@eldorado.org.br>
 <20220517164744.58131-10-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517164744.58131-10-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

On 5/17/22 09:47, Víctor Colombo wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Implements the Convert Binary Coded Decimal To Declets instruction.
> Since libdecnumber doesn't expose the methods for direct conversion
> (decDigitsToDPD, BCD2DPD, etc.), the BCD values are converted to
> decimal32 format, from which the declets are extracted.
> 
> Where the behavior is undefined, we try to match the result observed in
> a POWER9 DD2.3.
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> ---
>   target/ppc/dfp_helper.c                    | 39 ++++++++++++++++++++++
>   target/ppc/helper.h                        |  1 +
>   target/ppc/insn32.decode                   |  4 +++
>   target/ppc/translate/fixedpoint-impl.c.inc |  7 ++++
>   4 files changed, 51 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

