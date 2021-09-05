Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972A3400EEA
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 11:54:19 +0200 (CEST)
Received: from localhost ([::1]:51898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMoqw-0006eT-JI
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 05:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMomK-0002Wv-S2
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 05:49:33 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:46785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMomI-0000Xf-Al
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 05:49:32 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso2599138wmi.5
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 02:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dODnUGYL/edy0Q+BpDRMubAeFz9PMUcZ+YqJdQYgGX8=;
 b=VxpY/QtsdpQEUgbtkwdo+lYEbZepP2+VD8u9fpDY66mTPXpzyEYF95EJtcOiUCuD9H
 gxUfVRRcZn7qepnAfw8pghR0ZHE+Af2ZrMsKFKtVaqZPP/hpYPjU9ljZNTZ9nwzdvcge
 yS6n7/OeBbAfZ3Mw/e+rsDR7uxcSu/HbA849R82J+Jf2cKOCfS3MCNkvz3RpaDsDVsCK
 FhvhSPe0Kf4w29FVQCGNZobpwWv+xV2vqrzhdi6b914I5pU5di7sXNhp0SEMhvrFLk3y
 heZ8MLxwdhbtY4DwRW1PHyTpn84SIQv6gIP/0nZK88H2abfIci+s2E/MCRQ1pxPYj+AW
 lZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dODnUGYL/edy0Q+BpDRMubAeFz9PMUcZ+YqJdQYgGX8=;
 b=eq2xoQwCVYb7h8TsN+QYGpcXMrYmn82B1PD0AcDIpMEk/bAlFL7FXYVKedYVoFgK99
 Hv78VBxg5BH/wdzV4e4eaU85fROhsYeD6STRLzj7oHNpUbVSLA7RL15MGfNp5/wTy6Sv
 C27n1kIT849HkBy1oiJBGkiaHOS5ikEW/HsegNg4dHiyStJMGt3360JaGShMyyLe5pxl
 hGyTvXEjLJG+bHOqD7BwPzrUVJtADIuBEalTlbcfgs+b/4gcGPM6IKbd8VOHCAxbHocG
 Mo/AEtE2ettbKZyPpePbt6X5KyEK8PGVQIeLipoBYYHTkNnLS4/ctGXVD6dBzzixoRSJ
 qY4Q==
X-Gm-Message-State: AOAM532LoishYzXfTgnQxJrOpS+XHJTqzw7eJ5r1DXN3W2ISCOTdCGvq
 4ScREGsm+mWLwBmQwk0P/XYk8w==
X-Google-Smtp-Source: ABdhPJyJEQHPiY8RgevK/dAmaFZlI79E1SoguP1Vf62TvqwTavaDXlj+eDseE5sprKOMHksOpIU3aA==
X-Received: by 2002:a1c:3945:: with SMTP id g66mr6352088wma.49.1630835368608; 
 Sun, 05 Sep 2021 02:49:28 -0700 (PDT)
Received: from [192.168.8.105] (206.red-2-143-78.dynamicip.rima-tde.net.
 [2.143.78.206])
 by smtp.gmail.com with ESMTPSA id x9sm4061807wmi.30.2021.09.05.02.49.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 02:49:28 -0700 (PDT)
Subject: Re: [PATCH v4 15/21] target/loongarch: Add branch instruction
 translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
 <1630586467-22463-16-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0fb2eabe-cb08-fa3e-c36e-b1c936a872bb@linaro.org>
Date: Sun, 5 Sep 2021 11:49:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1630586467-22463-16-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
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
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, chenhuacai@gmail.com,
 philmd@redhat.com, atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com,
 groug@kaod.org, maobibo@loongson.cn, mrolnik@gmail.com, shorne@gmail.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 palmer@dabbelt.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 2:41 PM, Song Gao wrote:
> +static bool gen_rz_bc(DisasContext *ctx, arg_fmt_rjoffs21 *a, TCGCond cond)
> +{
> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
> +    TCGv src2 = tcg_constant_tl(0);
> +
> +    gen_bc(ctx, src1, src2, (a->offs21 << 2), cond);
> +    return true;
> +}
> +static bool gen_cz_bc(DisasContext *ctx, arg_fmt_cjoffs21 *a, TCGCond cond)

Missing space.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

