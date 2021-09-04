Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB5F400A8D
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 13:20:05 +0200 (CEST)
Received: from localhost ([::1]:37514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMTiO-0002OD-Gn
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 07:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMTgF-0001cj-Jl
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 07:17:52 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMTgD-0001lm-C4
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 07:17:51 -0400
Received: by mail-wr1-x42c.google.com with SMTP id b6so2334443wrh.10
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 04:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y2RiIz8uQxIlOzWY/wt5L676U+x7QqWwkEWImj1nPak=;
 b=FNZ8EQ+QQ9w8AZIXtVIN9RDkrBRZgu6Psu5vxNsfg1stAXV+NFzakcgGLl2w3WDNNE
 LJYoCYej6Jl3TeIRQSpKeVYSpsBiJAdvE5JOoMt+l5gdUKbtn2T7pgOQY8BDI9vOIlJP
 n6AC+U9+fJRSKSm+o7bSRZH5LhIxQoUJ9QlnkPF6k0Hf+SSFRgKfolsEYtl8IUFMao8e
 jF48J5BzC35VsYxuw1MPbXW4BPwuEMb6ladfIJAt/dWAiJtMRHqhIAzX6H8qdP3INKrr
 b5WYKYJLlfzmcBXy/EZVI4BFqZNarnt1VABcJ6REOwlPdkDmnNt2SoMb9RINJ0ydLYnh
 Yssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y2RiIz8uQxIlOzWY/wt5L676U+x7QqWwkEWImj1nPak=;
 b=WYA+tgvaPnN0hGaNZeFsOlpDrZPLPCixFrr2To9gSSuW4UaWa4420xJCXSMinBf7uO
 gaxBTXMXpHlsqUgSr827SslZLe0exT8yk0/7T21pqSi2NgJOcVULEtgqJyz/zVck0Qdf
 t2IYFqXnfXpcRycxmcxIW3yIHeadYFiqg5wckkhDQYxkjUvORDi5iR/fJxlLydi5QS2F
 JbV/MgIhTIp9PyXWycid+MVpE2MvpzCHphPZq2akbaM5LtGxKQHY2OIAKup95zb7cJDM
 F31uQtAxAjwGm+SEXgeglQk4uBP/mIYj0XURruKN497XWt96SFr3vHsYxYCkuzkitmby
 VEBQ==
X-Gm-Message-State: AOAM5327c+o+pvo/Je1aQqUDICv+hejfAeFpj5hwn11CtJwJzNhHQqU0
 ikCTWS1sie5uBj46lrplpL99cA==
X-Google-Smtp-Source: ABdhPJzMPTrnhoB8bldQdGyOkb1A7gk4Bph+nirgP6oh9JbooTXMmVGjdEDl5wcwq+UNEo6clFv2AQ==
X-Received: by 2002:a5d:6cab:: with SMTP id a11mr3543703wra.287.1630754267100; 
 Sat, 04 Sep 2021 04:17:47 -0700 (PDT)
Received: from [192.168.8.107] (246.red-2-142-218.dynamicip.rima-tde.net.
 [2.142.218.246])
 by smtp.gmail.com with ESMTPSA id l15sm1871914wrv.84.2021.09.04.04.17.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 04:17:46 -0700 (PDT)
Subject: Re: [PATCH v4 05/21] target/loongarch: Add fixed point shift
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
 <1630586467-22463-6-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <644fdd1c-b2ab-de7c-8e22-4f0157515696@linaro.org>
Date: Sat, 4 Sep 2021 13:17:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1630586467-22463-6-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
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

On 9/2/21 2:40 PM, Song Gao wrote:
> +static bool gen_r2_ui6(DisasContext *ctx, arg_slli_d *a,
> +                       void(*func)(TCGv, TCGv, TCGv))
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
> +    TCGv src2 = tcg_constant_tl(a->ui6);
> +
> +    TCGv t0 = temp_new(ctx);
> +
> +    tcg_gen_andi_tl(t0, src2, 0x7f);

0x3f.

That said, these shouldn't require masking, because they've just come from the decoder as 
5 and 6-bit operands.

You should prefer to use the tcg_gen_* functions that take integers:

     void (*func)(TCGv, TCGv, target_long)

passing tcg_gen_shli_tl, etc.  It will make all of these simpler.


r~

