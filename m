Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D04545570
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 22:15:26 +0200 (CEST)
Received: from localhost ([::1]:45694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzOYu-0000ZQ-DQ
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 16:15:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzN6c-00085K-OZ
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 14:42:07 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:40868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzN6a-0007Ve-Pz
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 14:42:06 -0400
Received: by mail-pg1-x52f.google.com with SMTP id f65so12428237pgc.7
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 11:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=D3auicWkBlJAZ1A6uk/B8Qv9TdwRyyGShbkk3J/WGbA=;
 b=afW+AIlQr207Nt4uDJ4J1vPw5T6th6xM1A4OzNl/pgJXy0InwoIN9RV1DkY9Zat0ga
 pek1A9il/9tvjfITCaX79rZVHWzSkcOjGHe4ghz6oKnhdUIAOj6Ax6/qbKzzWiuntM8x
 v8hdD8bqt0q5gI4gT7IQ1BakEDUgkLPOc+eYBI90nhkyRMuFGvLGONMdoV6FgWBvuVN8
 JvoxvsG5ZqY1otEZz1auuSu0vpuHp2Njkg1PQKcGkhhKP20oV+L0VM1OFTKovaF09fAy
 obvymyfGs0HV5X6Hci4D2RD+PvpK2rJXKvLhdShthewzTWFcLHOiv+o0DAQVke1qPqXz
 /P3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D3auicWkBlJAZ1A6uk/B8Qv9TdwRyyGShbkk3J/WGbA=;
 b=6YGOJuYLHsUPCpr8PtiZGFFdXCV3rT3Gz7SSnsl6px2DwTJw7zbsAFGSVGp+ElO0XC
 zZhxSOh2Z5+BFaGcmQxh+MTqTqmCsLUMZbn9BiMijy0MrSo6diDVl4KmWgotahTt6EFm
 k9L3KycP+wP1TaacBHKZoziXEvRES4IsnouLxNzr7RTCB24lENkIjouzXLNVZzOgWeYO
 I9Gdg4lxRN15WgCSQDDPpe9ewC5AfyVM+9GC8qex9CIzJ41cC/08S05GXurlE3oAiDqp
 3MxoKzrllycoh7v3ZZLBvUKRluF4q4Wzx8jKJNH2+/c7t5l9C5VYweBmH9qAfA0ImWcV
 K2DA==
X-Gm-Message-State: AOAM5308tikpQ99LXN+9tZhlljRHZs6z5rdg1nWeKG6TpkIAj/DlACBd
 Why5T2ZjdPN1NFFVrPjiRFATfg==
X-Google-Smtp-Source: ABdhPJzrd2dfGfGaU4/uIFhIurhBVcmQyIn2S90/TJyJrZxuTi/vOtksRIKtyindJ/zU3qNlgt3EsA==
X-Received: by 2002:a63:8ac3:0:b0:3fc:948b:a1d9 with SMTP id
 y186-20020a638ac3000000b003fc948ba1d9mr36014458pgd.50.1654800122996; 
 Thu, 09 Jun 2022 11:42:02 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:839f:476f:678:38a?
 ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 ji11-20020a170903324b00b00161955fe0d5sm17296801plb.274.2022.06.09.11.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 11:42:02 -0700 (PDT)
Message-ID: <4c0fd198-922e-d94f-fec4-05c53c5d6858@linaro.org>
Date: Thu, 9 Jun 2022 11:42:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v15 8/9] target/loongarch: Adjust functions and structure
 to support user-mode
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220609024209.2406188-1-gaosong@loongson.cn>
 <20220609024209.2406188-9-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220609024209.2406188-9-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

On 6/8/22 19:42, Song Gao wrote:
> diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
> index 85c11a60d4..ee42707868 100644
> --- a/target/loongarch/helper.h
> +++ b/target/loongarch/helper.h
> @@ -93,8 +93,7 @@ DEF_HELPER_2(frint_d, i64, env, i64)
>   
>   DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_RWG, void, env, i32)
>   
> -DEF_HELPER_1(rdtime_d, i64, env)
> -
> +#ifndef CONFIG_USER_ONLY
>   /* CSRs helper */
>   DEF_HELPER_1(csrrd_pgd, i64, env)
>   DEF_HELPER_1(csrrd_tval, i64, env)
> @@ -128,3 +127,5 @@ DEF_HELPER_4(lddir, tl, env, tl, tl, i32)
>   DEF_HELPER_4(ldpte, void, env, tl, tl, i32)
>   DEF_HELPER_1(ertn, void, env)
>   DEF_HELPER_1(idle, void, env)
> +DEF_HELPER_1(rdtime_d, i64, env)
> +#endif

This is wrong.

>   static bool trans_rdtimel_w(DisasContext *ctx, arg_rdtimel_w *a)
>   {
> +#ifdef CONFIG_USER_ONLY
> +    return cpu_get_host_ticks();

This is very wrong.  You're calling cpu_get_host_ticks at translation time.
There are no changes required during translation.

You should in fact be calling cpu_get_host_ticks in helper_rdtime_d.

>   void helper_asrtle_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
>   {
>       if (rj > rk) {
> +#ifdef CONFIG_USER_ONLY
> +        cpu_loop_exit_sigsegv(env_cpu(env), GETPC(),
> +                              MMU_DATA_LOAD, true, GETPC());
> +#else
>           do_raise_exception(env, EXCCODE_ADEM, GETPC());
> +#endif

This change is wrong.  First, the kernel's do_ade raises SIGBUS.  Second, GETPC() is a 
host address, not a guest address.  Third, this highlights the fact that the existing 
system code is wrong, and should be setting badvaddr.

You need to
(1) set badvaddr here, and then
(2) handle EXCCODE_ADEM in linux-user/loongarch/cpu_loop.c to 
force_fix_fault(TARGET_SIGBUS, TARGET_BUS_ADRERR, env->badvaddr).

>   void helper_asrtgt_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
>   {
>       if (rj <= rk) {
> +#ifdef CONFIG_USER_ONLY
> +        cpu_loop_exit_sigsegv(env_cpu(env), GETPC(),
> +                              MMU_DATA_LOAD, true, GETPC());
> +#else
>           do_raise_exception(env, EXCCODE_ADEM, GETPC());
> +#endif
>       }
>   }

Likewise.


r~

