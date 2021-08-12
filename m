Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF6A3EA3E1
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 13:38:33 +0200 (CEST)
Received: from localhost ([::1]:39936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE92e-0002zq-HS
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 07:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mE91g-0002Gp-U4
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 07:37:32 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mE91e-0008IC-At
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 07:37:32 -0400
Received: by mail-wr1-x430.google.com with SMTP id k29so7834208wrd.7
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 04:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4S1geDIZK18E9ImEyELqB5R9ufqOnipEyFGxb4Ab8AU=;
 b=BjWm/oq/DMC1qilxbelobQtyV/cPj4jN2B/5dJD2LaCw2Zd66cRHvafeCfHTkGq579
 NfBb10tuO2ZD2O8ZVbdP2ljRI5553a3eGgMhTz6se+vXpUYLtjdUjJJiFMjdP1poqVl2
 TxKMCJdlD7BGwcGKcwOzy5OKZluHokKD+urJeAvRYV/q/NfDx/xqUYj0Hr61k2WB0pA2
 pqrAh42X92UEv9zUlscCZtDKT89OoVnORKebf95kIBvVDNT61d195eAG8zDgWxprQjyy
 Yapjp9y45iZXKbvcul0BwDS5tDqXR3W1nYzs3ZJsZadYYCnUDNlUdsLSTZqIYNgTQRN5
 kEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4S1geDIZK18E9ImEyELqB5R9ufqOnipEyFGxb4Ab8AU=;
 b=tAzWziM5QxhgJHgSBkBjqvVBZH96uJKBKG1Mifs2iv2itvMH7mskyWo1Xpq9iAV44I
 ne9fJax2kO8t+msakzVLaTeY0lTeeOibDkR7govnAcgFHR4xFd5qveFQVeLZtBisNocV
 f5rMs4vdLt6gTGIFz4BMvk3JsddGme8dc+xgnZdBoHdCiyAGY6LCDmy0x+QFg8aIzJ2r
 aOpWQ61xdy+clQ10J5FDSWDtyjTg5OD+iSApIISu9C73nvXEcP+llZuIKj+d2JkeUi02
 IXjI09wM6YkMaIKtYCtOQJqEMDPS3YwtOv1hdW1aXlv/k4nhE3Ow/HKNolGPPBQRkqYT
 w87g==
X-Gm-Message-State: AOAM531ATUH6NKwcsrkuUffU5mpEpJAS4EhO9ytuh7hPorAsl+ac+9xj
 F4ROl+fjcHsW++airKP71kA=
X-Google-Smtp-Source: ABdhPJwxtTXAMv1Ltag5pkaVNNqCBRzTYyPSIoTUIf5p/BspjJtV7n2egoSJiZDWR4+l258RIUhcaA==
X-Received: by 2002:a5d:5305:: with SMTP id e5mr3489789wrv.243.1628768248805; 
 Thu, 12 Aug 2021 04:37:28 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id s12sm2749700wru.41.2021.08.12.04.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 04:37:28 -0700 (PDT)
Subject: Re: [PATCH-for-6.1?] target/i386: Fixed size of constant for Windows
To: Lara Lazier <laramglazier@gmail.com>, qemu-devel@nongnu.org
References: <20210812111056.26926-1-laramglazier@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1cdc5ffe-adc5-41ac-e588-b8eab62ecc76@amsat.org>
Date: Thu, 12 Aug 2021 13:37:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812111056.26926-1-laramglazier@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/12/21 1:10 PM, Lara Lazier wrote:
> ~0UL has 64 bits on Linux and 32 bits on Windows.

> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/512".

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/512
Fixes: 3407259b20c ("target/i386: Added consistency checks for CR3")

> Reported-by: Volker Rümelin <vr_qemu@t-online.de>
> Signed-off-by: Lara Lazier <laramglazier@gmail.com>
> ---
>  target/i386/tcg/sysemu/misc_helper.c | 2 +-
>  target/i386/tcg/sysemu/svm_helper.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
> index 0a7a58ca9a..91b0fc916b 100644
> --- a/target/i386/tcg/sysemu/misc_helper.c
> +++ b/target/i386/tcg/sysemu/misc_helper.c
> @@ -97,7 +97,7 @@ void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
>          break;
>      case 3:
>          if ((env->efer & MSR_EFER_LMA) &&
> -                (t0 & ((~0UL) << env_archcpu(env)->phys_bits))) {
> +                (t0 & ((~0ULL) << env_archcpu(env)->phys_bits))) {

Maybe safer to use extract64()? I'm not sure how many bits you want
to check, so used TARGET_LONG_BITS:

            extract64(t0, env_archcpu(env)->phys_bits,
                      TARGET_LONG_BITS - env_archcpu(env)->phys_bits) {

>              cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
>          }
>          if (!(env->efer & MSR_EFER_LMA)) {
> diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
> index 3891f4e4a8..42cd5053e5 100644
> --- a/target/i386/tcg/sysemu/svm_helper.c
> +++ b/target/i386/tcg/sysemu/svm_helper.c
> @@ -290,7 +290,7 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
>      }
>      new_cr3 = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, save.cr3));
>      if ((env->efer & MSR_EFER_LMA) &&
> -            (new_cr3 & ((~0UL) << cpu->phys_bits))) {
> +            (new_cr3 & ((~0ULL) << cpu->phys_bits))) {
>          cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
>      }
>      new_cr4 = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, save.cr4));
> 

Any idea how to avoid that class of bug? Some CFLAG or plain checkpatch?

