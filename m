Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77BD438582
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 23:13:55 +0200 (CEST)
Received: from localhost ([::1]:59956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meOKw-0000W6-Nb
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 17:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meOK7-000867-2p
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:13:03 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:43721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meOK4-0003QS-RA
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:13:02 -0400
Received: by mail-pg1-x529.google.com with SMTP id r2so6747504pgl.10
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PhUwgiO3Dl6xFNMQhWCeIrx6MbdqaUG/JOlY0Ktet4g=;
 b=YBTaUg9yYt33mJPzKgjhZqcrNF5mfRV+Tq7HwIeme5hbfVOlmhB+uv6XjUiSuL69JF
 XHcaQXFWiQ9Yn7J/55Qm3kO2n7J0Lw5BGW0yDca/nWZBUzhGzvL3rNcBuK7fFDs+B7xq
 22LIhLXnbNiAlJMOmrgW4kN77f+Vuqiy57NoMvWIvNjGIPUqOhRrUIIRS23BdGIRnTY9
 aMoD6IBpLqmJwoHT9uHxVmLFFfcr+vFHDBWMiBoGJPyn1RJ1xOvZopWpsKh2jgX2fAjx
 PXBGot33oaVA2QD6QOWBllEySNwFgwdalvRdDasWOzwvUZHWWbBjEu0FkZdeWivaXZ1G
 b1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PhUwgiO3Dl6xFNMQhWCeIrx6MbdqaUG/JOlY0Ktet4g=;
 b=Hjxqm9/mHu2Smz42Mc/dTFPnhYahz9GCFFysp6E2nPrtI/ju57tUsHGREh4X4qiQvN
 RBCvf87YMO1c5j5hasmJcc6grJ+P4v7ocp18KIPhw+X1gNyJCtYgNX3z6SAzzKhNDD0c
 7YpYwCUKCE11HMhtf7lz0JTka9+E88AMSTJ/dl5940ZNx6lSxQdQcLPPu7UYfEil5QF0
 4+F/NgR/H35j2xcwsrE8luMhlw1oHq9GfxYxUe3QDyK40j3KHsI+2i5F09GbyAnrFCEM
 ROammLrzXZn9YZkOmzrSq4oxQ03GpPcADRfxr2dn6W8q1s4fx1g3Xlt6XRS7QIB+2007
 vj7w==
X-Gm-Message-State: AOAM533Iz9iC1gEIQ8bL+maMbZoRglEMTu5rG3UATflRMY8NmdLepUnX
 ZspThLLpDGdM+/yb92dYgHS4cA==
X-Google-Smtp-Source: ABdhPJy0DJaaMz9nwdAgk+Eru8GmuLfSyrr0ZyECcP3PoaSRXodP41Q1Afr1sydWUhzGvUakm83s2A==
X-Received: by 2002:a63:af59:: with SMTP id s25mr6176363pgo.109.1635023579270; 
 Sat, 23 Oct 2021 14:12:59 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m4sm5948095pjl.11.2021.10.23.14.12.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 14:12:58 -0700 (PDT)
Subject: Re: [PATCH 29/33] target/ppc: implemented XXSPLTI32DX
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-30-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eebf1b08-bc8f-4400-b14f-d8c7cd22b79d@linaro.org>
Date: Sat, 23 Oct 2021 14:12:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-30-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
Cc: lucas.castro@eldorado.org.br,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 luis.pires@eldorado.org.br, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
> 
> Implemented XXSPLTI32DX emulation using decodetree
> 
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn64.decode            | 11 ++++++++
>   target/ppc/translate/vsx-impl.c.inc | 41 +++++++++++++++++++++++++++++
>   2 files changed, 52 insertions(+)
> 
> diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
> index 880ac3edc7..8d8d5d5729 100644
> --- a/target/ppc/insn64.decode
> +++ b/target/ppc/insn64.decode
> @@ -32,6 +32,14 @@
>                   ...... ..... ra:5 ................       \
>                   &PLS_D si=%pls_si rt=%rt_tsxp
>   
> +# Format 8RR:D
> +%8rr_si         32:s16 0:16
> +%8rr_xt         16:1 21:5
> +&8RR_D_IX       xt ix si:int32_t

What is it about this field that says signed, expecially?  It doesn't seem wrong, of 
course, but you are jumping through extra hoops here...

> +    get_cpu_vsrh(t0, a->xt);
> +    get_cpu_vsrl(t1, a->xt);
> +
> +    tcg_gen_movi_i64(new_val, a->si);
> +    if (a->ix) {
> +        tcg_gen_movi_i64(mask, 0x00000000ffffffff);
> +        tcg_gen_shli_i64(new_val, new_val, 32);
> +    } else {
> +        tcg_gen_movi_i64(mask, 0xffffffff00000000);
> +    }
> +    tcg_gen_and_i64(t0, t0, mask);
> +    tcg_gen_or_i64(t0, t0, new_val);
> +    tcg_gen_and_i64(t1, t1, mask);
> +    tcg_gen_or_i64(t1, t1, new_val);
> +
> +    set_cpu_vsrh(a->xt, t0);
> +    set_cpu_vsrl(a->xt, t1);

You're working too hard here.  I think you should just store the two int32_t at the 
correct offsets.  And failing that, use tcg_gen_deposit_i64.


r~

