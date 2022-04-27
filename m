Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6E6510D3D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 02:36:04 +0200 (CEST)
Received: from localhost ([::1]:51872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njVf1-0007uh-2q
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 20:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njVd4-00071a-Ik
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 20:34:02 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njVd1-0005Bw-Qu
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 20:34:01 -0400
Received: by mail-pl1-x633.google.com with SMTP id k4so233217plk.7
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 17:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=29W1mkUazF9oR0vYbyyzhNIHVjOdUKx45mE+E0AH178=;
 b=SSulrW7vdPPzAXIR9LeyabRUTD5TsMmXQiRv9K83sZyQaytUHC/aBdvgoyNIapFTxL
 ExdfVrSlgRRhlKdL0PNpXVuh1DkMBLYYr2wen3nt0znSQqL0WykHZPiIJLfCoTtNG24P
 lQnf5zvo29CLpPdaPYK15dMh+HhxmjV2f3X6D7C7F6JzW9CXGCjMaAnYhlM4D1DzHULO
 YsKodESL+FSG3Q3cRIywX895xTGLYMntvxKHM6eCMwsrHFakXDndV72UAVed0jm4vBJJ
 6Tpt3gv7kGm7RDh3b7kNLYy7Q/ACuKgks18rqL2aeb1IVAZdvP8VYTcgfH43BYIRuXMH
 xUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=29W1mkUazF9oR0vYbyyzhNIHVjOdUKx45mE+E0AH178=;
 b=vNBORjzjqaxJOG0wpYhxW/FMgdqwGtzebdVaFVWVMUwv8bMiknRimFbkyGUWaV6C2Z
 ZdZXCixVrzU//w0KArmorh93gmxUUz14O+3KEMz6GKi7MRZ7alYnqkuEv0FMWMufHkys
 cj7jKzXGWSEVmnR1Qf+PW/3m8Nd5rOi2lMzvAswfW0G4ARN6PmzIq4tEdIJUsH9J5HF0
 CCtAXgjKYSsFCQTmH5Oo4r+NTQoVWF/t9KTG3LhfriRGvrs4luRa+eit7tePitL9Die3
 Id1PkxlrDI+0aV6rlLnqKhBsaWtSoSi/+Ye9N6bZfy3U7zuyA6tbHrT+M6vzKVOWZxdU
 3noQ==
X-Gm-Message-State: AOAM530okRkxx5+qNUA+svH1hyYuBt2PDVXxdBhMVKSWxr1j3LZSiw8G
 rxN4Ny0vi1C13fmBbQOFEsiNWg==
X-Google-Smtp-Source: ABdhPJwYcgrgsxkxcbo/c4GlrTrOXkzxpp/bIkr2zd49gB9a1ZjNT0OM9aGpffx1/AtRhIA+/FWbIw==
X-Received: by 2002:a17:903:240e:b0:158:eab9:2662 with SMTP id
 e14-20020a170903240e00b00158eab92662mr25971418plo.87.1651019637932; 
 Tue, 26 Apr 2022 17:33:57 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a17090a744700b001cd4989ff56sm166568pjk.29.2022.04.26.17.33.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 17:33:57 -0700 (PDT)
Message-ID: <24aea43f-4e25-1f1e-e45b-8fabc1c45862@linaro.org>
Date: Tue, 26 Apr 2022 17:33:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 6/7] target/ppc: Implemented pmxvf*ger*
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
References: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
 <20220426125028.18844-7-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426125028.18844-7-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Greg Kurz <groug@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/22 05:50, Lucas Mateus Castro(alqotel) wrote:
> +&MMIRR_XX3_NO_P xa xb xt xmsk ymsk

Don't create this...

> +@MMIRR_XX3_NO_P ...... .. .... .. . . ........ xmsk:4 .... \
> +                ...... ... .. ..... ..... ........ ... \
> +                &MMIRR_XX3_NO_P xb=%xx3_xb xt=%xx3_at

just set pmsk=1 here instead...

> +static bool do_ger_MMIRR_XX3_NO_PMSK(DisasContext *ctx, arg_MMIRR_XX3_NO_P *a,
> +                                     int op_flag, void (*helper)(TCGv_env,
> +                                     TCGv_i32, TCGv_i32, TCGv_i32,
> +                                     TCGv_i32, TCGv_i32))
> +{
> +    arg_MMIRR_XX3 x;
> +    x.xa = a->xa;
> +    x.xb = a->xb;
> +    x.xt = a->xt;
> +    x.pmsk = 0x1;
> +    x.ymsk = a->ymsk;
> +    x.xmsk = a->xmsk;
> +    return do_ger_MMIRR_XX3(ctx, &x, op_flag, helper);
> +}

so you can drop this.


r~

