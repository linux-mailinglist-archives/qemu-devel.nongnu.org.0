Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C686052A8DE
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 19:07:05 +0200 (CEST)
Received: from localhost ([::1]:54338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr0ew-0003Q2-MP
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 13:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr0On-0002xC-4T
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:50:19 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:39676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr0Ol-00078a-Fy
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:50:16 -0400
Received: by mail-pf1-x430.google.com with SMTP id v11so17394432pff.6
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 09:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Db3W7ZmXTbhdv7i15xxiE2mlI5nEp7OLR/Ql20pDVWQ=;
 b=xPbqTi93H9Ce9vCb3NLSCQrFBk++U+4DNZ2KKcmFWeKAcoFCwGPEjXNH8QDlcS4NsG
 AbkDo2Rxx9ImoqlYSOT6/Ek2Sc7L0uSucg5M4jNW/XV/GqQFKR3A0PCpvYnMY5wnZfg4
 pX4EYc9EKlRf9QdztYc9oxWYmMMxdiG2Yd2M/cLebYH0NIEU4OQcd0I+wjB+NU/jqdGj
 x0Lc6nUjXR4ESF4sEbOL9BxylYRb0a2bI7DgCJ+bTcWnTibohWIdgwJr56vzerwt13r6
 z6E/BQMBnw88nDkirdL87foWOzlOP7GCNiAelk4MM7I97l5zrRsRK+XpjJfK8Vvii8fL
 qk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Db3W7ZmXTbhdv7i15xxiE2mlI5nEp7OLR/Ql20pDVWQ=;
 b=Vx2K0FYFTrbgl3W+6qzzyy5yD3dGEHPajzKgJAaHJBrKb3ffV+Imz6aAAM7kiyJ18E
 8zwdvvxtFkNyt2LuTIcegTjnU94Ooo5uujIUGXezkqyTVGiCqztllnO+BMAFwBq8VP0z
 fgp6vOJ/yh665OzbcKHBhdMjxanyk2pDEPp7x+0MXKxZVQv2VjLNrnnhmt7TnQ7aEkfc
 ZHX6rL0Rjx9vgXgiDZw3kau+3FzMnjYco00/yZWF7NWLy96gjFvH/+PtGofJUOwWmL+U
 2LiLxH6RN4xQuRmExP+C/Gb5tVTAaSv9W7ZaFzoKTM4giXIQs7AAgXem8LSdawmdCIrZ
 KO3g==
X-Gm-Message-State: AOAM533BTIe6ohrwIVJKkJkfunfcUhETwdFox/lbPtBwwAV4N9DhB2CO
 A2b3Dpun6schzO4pDXJPBGiT1Q==
X-Google-Smtp-Source: ABdhPJzZEh/GV0QTDImfzu/5Q/S3jC1P8kT3RoQSVOjM1Sq/9kz8jhr9be0GtFWMOD298F60vervkA==
X-Received: by 2002:a05:6a00:2188:b0:50d:b093:12a2 with SMTP id
 h8-20020a056a00218800b0050db09312a2mr23335315pfi.84.1652806213974; 
 Tue, 17 May 2022 09:50:13 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 s35-20020a056a001c6300b0050dc7628137sm57829pfw.17.2022.05.17.09.50.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 09:50:13 -0700 (PDT)
Message-ID: <49ac96ee-fa28-7473-c685-17b725f1d411@linaro.org>
Date: Tue, 17 May 2022 09:50:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 06/12] target/ppc: declare xscvspdpn helper with call flags
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
 <20220517123929.284511-7-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517123929.284511-7-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

On 5/17/22 05:39, matheus.ferst@eldorado.org.br wrote:
> -uint64_t helper_xscvspdpn(CPUPPCState *env, uint64_t xb)
> +uint64_t helper_XSCVSPDPN(uint64_t xb)
>   {
>       return helper_todouble(xb >> 32);
>   }

Ideally, this helper would not exist and you'd just use helper_todouble...

> +bool trans_XSCVSPDPN(DisasContext *ctx, arg_XX2 *a)
> +{
> +    TCGv_i64 tmp;
> +
> +    REQUIRE_INSNS_FLAGS2(ctx, VSX207);
> +    REQUIRE_VSX(ctx);
> +
> +    tmp = tcg_temp_new_i64();
> +    get_cpu_vsr(tmp, a->xb, true);

... and here, you'd load the correct i32 value from VsrW(0) directly instead of loading an 
i64 value followed by a shift.

But this is still an improvement so,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

