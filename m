Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B7551874F
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 16:54:30 +0200 (CEST)
Received: from localhost ([::1]:51722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nltv3-00050M-Gx
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 10:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlttn-00045K-Bk
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:53:11 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:46903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlttl-0006Nr-Ha
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:53:10 -0400
Received: by mail-pf1-x42d.google.com with SMTP id j6so14885201pfe.13
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 07:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KQyrCrGV3YhN0e4HSoO2br+tKvpyJvLSveU8hSIokHQ=;
 b=xO6UnOIBrh27F50i0dhVSjiuOTNKOs++WJQA/BJj7wGC4mAodxUDQMbn8f4t7PZWJY
 Qn+DdaHJXNyeHRe5wxmoGvz6+AjuZGkfEJIyarv75RcDn+56aGLaBBgGZqN0NfIEc3dx
 wt2wJBAWlPTwCfLO9t1UMKlMuezquhMwlikx7qFC/YWMsRZ8fPw2gP1CDzRRUzsIy0d1
 jX3Dik9Fv7cK8Zrfihcux3xShG3eiraK0k6jmLTRndoSnXpMjAduWspV6UTt6J5n5PU/
 4mrEQioLi6BQsTCKFbsXdoGLHWzWmm0qZHO4dqhbmTqB6agtwiOXJ9LUleAJz8SOWIB8
 m68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KQyrCrGV3YhN0e4HSoO2br+tKvpyJvLSveU8hSIokHQ=;
 b=NVVHysKkRnncHWUSgElTMRty3+FMEZ+fMtQdHTh2zYTdFX0Fa9bwyBrpJsrMi4BCSP
 9lXUi87jiyfNrFBpJxLejn7HaEzT2ZIX6/O3h3jkY8t13YTwAfEsmuzV6pfjRom6rkB5
 bd0764q846sI8OzdhL1F3IcPw3R4u2NJ6GO9e2LxGYIW8l4Qs95IvsaF7ibYNjpSuZ5B
 /02OpPWdxPXAO8nhOpVZKizu4XgNRDBKqFPP26ZmP2QDV4TtIPUnGlovV8nQFrO6t/22
 MUN+vn3v4Hv+fbiUfxQI7jgFXHPVvjfJffxQB2W52sJxrxk9BbvAW7hsVIXtoodzz/Ys
 GkFQ==
X-Gm-Message-State: AOAM533HH8e+lTjQR+7LsCf7S9nL12ZM4BA+ijWeSriUa68Smkh4aALg
 J2b3UxU6wRYHUvffefV5mm4BUA==
X-Google-Smtp-Source: ABdhPJyBqiS1iOwNHVGm7Jmk7St7xN+ayB6TnpqleNZfvqE6lEjOih+XWqK5WAUc5vKdYgHuIQXZtA==
X-Received: by 2002:a62:5ec6:0:b0:50d:a467:3cb7 with SMTP id
 s189-20020a625ec6000000b0050da4673cb7mr16254539pfb.85.1651589587963; 
 Tue, 03 May 2022 07:53:07 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a17090300c300b0015e8d4eb2c9sm6423552plc.275.2022.05.03.07.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 07:53:07 -0700 (PDT)
Message-ID: <232fe0f6-c2f5-e8fc-da2b-0c79c5a65869@linaro.org>
Date: Tue, 3 May 2022 07:53:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 3/4] tcg/ppc: Optimize memory ordering generation with
 lwsync
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20220503103334.2046414-1-npiggin@gmail.com>
 <20220503103334.2046414-3-npiggin@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220503103334.2046414-3-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

On 5/3/22 03:33, Nicholas Piggin wrote:
> lwsync orders more than just LD_LD, importantly it matches x86 and
> s390 default memory ordering.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   target/ppc/cpu.h         | 2 ++
>   tcg/ppc/tcg-target.c.inc | 2 +-
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index c2b6c987c0..0b0e9761cd 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -28,6 +28,8 @@
>   
>   #define TCG_GUEST_DEFAULT_MO 0
>   
> +#define PPC_LWSYNC_MO (TCG_MO_LD_LD | TCG_MO_LD_ST | TCG_MO_ST_ST)

You can't put this here...


> +
>   #define TARGET_PAGE_BITS_64K 16
>   #define TARGET_PAGE_BITS_16M 24
>   
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index 3ff845d063..b87fc2383e 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -1834,7 +1834,7 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
>   {
>       uint32_t insn = HWSYNC;
>       a0 &= TCG_MO_ALL;
> -    if (a0 == TCG_MO_LD_LD) {
> +    if ((a0 & PPC_LWSYNC_MO) == a0) {

... and have it used here.  You should have seen compilation failures for the missing 
symbol.  I can only assume you used a restricted --target-list in testing.

Anyway, it looks like a simpler test would be

     insn = (a0 & TCG_MO_ST_LD ? HWSYNC : LWSYNC);


r~

