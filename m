Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9BC52AB7F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 21:06:56 +0200 (CEST)
Received: from localhost ([::1]:36654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr2Wv-00051J-Sg
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 15:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr2Vj-0003V0-Cd
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:05:36 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:36660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr2Vh-00023g-QY
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:05:35 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 z7-20020a17090abd8700b001df78c7c209so3410906pjr.1
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 12:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5L/5W30xyQt5lHEZxEyZaYKVEJ1QfE4vkvnuNzP2Yto=;
 b=xhk8vzehchVWvr0MEEH9eyfk2/pJlw1wMkTEO5Ak6vxA0QUcyfcNn+tzP3xcRkuFrL
 4UDnkx00/kjxYEHlXhz8GzmrkMDo4IIxmaMSyi0ZNrQvWcO0SYNO9i3sMqR4255dpbaz
 sFQzEwcN+kVhtOR+pI+q5172DPGei6hmCMIas0dYh7Kc5KHZrXT6vC+RwdG0dYluzA6R
 dcMOhFVjzV/X0BiQHcbOXhrFZxyTCGjvJflN61v8e36Gtrn86lHBQIBG1LEl/nJJPwJr
 QQx6BWCpkMD9g6FcII3CzSPbFiWp5ZjnFJj1SOVd0HQDEOo1uzmkB+mpgJAPziQESa9I
 xCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5L/5W30xyQt5lHEZxEyZaYKVEJ1QfE4vkvnuNzP2Yto=;
 b=2g4MWbLH8RgVjf1qEbjJ5eVu0dNnNfgYAhaCqRmQtlcK1lMyeLcdOXZ1cnXDfW6BQq
 j4JA4mgaiia1naPXGQk2lDcInlsAVG8EA55ijzLBdvBliVmBTGfUEewEioO4Q1xIrH12
 rpB6x6VuT2BeZN0vgnrBvnf32ZLqjt7dRuEO6RSscDsN7tGtJbFGoQpg7eVrHz0NuBFO
 ah7VzOyOqzeaH6XGIEQGmR6ITTz7rsz0uGJD50s66Pdwo5EBNlUcSwcvJC17PtK/NWg6
 97vMqxQYqTMeLWRRVsgi5Ow8gM35fk3+QbkDThRjoSLYataMlA+KXPvoaQW/vJAB2McZ
 PPXQ==
X-Gm-Message-State: AOAM530FoFojfPhC0IhUgfbZdRXpAQ5PpZDS9RPwTdjgoIJxyzE8WD4M
 obfkcqUAtRWbI9FqHQDGH5zaHQ==
X-Google-Smtp-Source: ABdhPJzr+n0yLsRUG/OJV1YL67VW0KnmMn9HR3nV+Yk0636Xl6+z7oqJlzGhFcttX6PfTis4imdXGw==
X-Received: by 2002:a17:902:aa06:b0:158:f13b:4859 with SMTP id
 be6-20020a170902aa0600b00158f13b4859mr23884665plb.141.1652814331756; 
 Tue, 17 May 2022 12:05:31 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a170902ccc800b0015ee24acf38sm9430036ple.212.2022.05.17.12.05.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 12:05:31 -0700 (PDT)
Message-ID: <7a82db21-a788-d5cd-8e03-938a494e4411@linaro.org>
Date: Tue, 17 May 2022 12:05:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH RESEND 08/10] target/ppc: implement addg6s
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
References: <20220517164744.58131-1-victor.colombo@eldorado.org.br>
 <20220517164744.58131-9-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517164744.58131-9-victor.colombo@eldorado.org.br>
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
> +static bool trans_ADDG6S(DisasContext *ctx, arg_X *a)
> +{
> +    const uint64_t nibbles = 0x0f0f0f0f0f0f0f0fULL,
> +                   carry_bits = 0x1010101010101010ULL;
> +    TCGv t0, t1, t2;
> +
> +    REQUIRE_INSNS_FLAGS2(ctx, BCDA_ISA206);
> +
> +    t0 = tcg_temp_new();
> +    t1 = tcg_temp_new();
> +    t2 = tcg_temp_new();
> +
> +    tcg_gen_andi_tl(t0, cpu_gpr[a->ra], nibbles);
> +    tcg_gen_andi_tl(t1, cpu_gpr[a->rb], nibbles);
> +    tcg_gen_add_tl(t0, t0, t1);
> +    tcg_gen_andi_tl(t0, t0, carry_bits);
> +    tcg_gen_shri_tl(t0, t0, 4);
> +
> +    tcg_gen_shri_tl(t1, cpu_gpr[a->ra], 4);
> +    tcg_gen_shri_tl(t2, cpu_gpr[a->rb], 4);
> +    tcg_gen_andi_tl(t1, t1, nibbles);
> +    tcg_gen_andi_tl(t2, t2, nibbles);
> +    tcg_gen_add_tl(t1, t1, t2);
> +    tcg_gen_andi_tl(t1, t1, carry_bits);
> +
> +    tcg_gen_or_tl(t0, t0, t1);
> +    tcg_gen_muli_tl(cpu_gpr[a->rt], t0, 6);

You're supposed to produce a 6 when the carry bit is *not* set.
You need to invert the result of the add before masking w/ carry_bits.

Perhaps

     tcg_gen_add_tl(t0, t0, t1);
     tcg_gen_andc_tl(t0, carry_bits, t0);

r~

