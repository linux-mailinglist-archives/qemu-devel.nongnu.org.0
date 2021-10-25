Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5517C43A556
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 22:58:11 +0200 (CEST)
Received: from localhost ([::1]:37862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf72n-0006ej-PN
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 16:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mf71p-0005tb-TR
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 16:57:09 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mf71o-0002xb-D1
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 16:57:09 -0400
Received: by mail-wr1-x42e.google.com with SMTP id z14so13983055wrg.6
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 13:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ldL0Cwgf1ti/CCDwOiVE0T5AJ48OViLNNVcCv7AJ6Js=;
 b=kBEFA6KOJpYcrvzBW7tVeArKOXHkkxC6UvDMffcoxZysWUj9fD3vGXjHiV3W1krJUu
 k57NWVg9pJl00GF/O+/y/rwPJDihtJ/bcQ2yhRRK/yePgPyYa0n0q3BSDBE+KlbwBQ0A
 zMbvpzfhLT+QN9rZ/Kx4KwWWqEWWoT5sc7jScvgYsOeuL+9Up4+XUEhOPmrrsSMV9N5U
 Vo7o6OQsT8f604GlLAHead+UZMRJfCOi5jNNVe0dhsDmDTbHgoqiuAVKScw2P1TF9lSz
 y//uN8hEyACwD8UFxLpZmsmIv6+4yfQhgImgicC8Jtd4NL21aLlfoHn+4GhpMKhCo5L2
 UN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ldL0Cwgf1ti/CCDwOiVE0T5AJ48OViLNNVcCv7AJ6Js=;
 b=TUX5kH9do+YkUlZ7TFVSIAUmsdq2sxo0YqBTSVNyy/WjzM1gC9L+clcSjzA3TuS0l5
 rBHXhcK1Y+SRPZQQHTboGK+bFqGsDypIytGUL9tpAMxFUjyn2mNCuaveAi8qvOngWPO4
 wGionQrcleUY6iN2RU3vfZlIAto2d792u+ctfkKpzfqB66KK+oh0/fds2crlZ9ymCA99
 I3+cFPGhszXKTbtbYd7R14u0H2mTyoBYSWHcgWJM3kJTijdE1qh6zursADjuUVge6jWF
 a9HDhRVP9kSRZU/GYhbp7jEeGr9lx32/OLUQ/SiJxrc2TR0IsbL3fVHS4jx5/hnIGN0Z
 tzkw==
X-Gm-Message-State: AOAM530wHoRReMYsGOA8ArwBTKRrcJdccFO4o1VFPMN8KEiWh5q6lhGZ
 tVHwquFjivx/aWJ2EAVCN1w=
X-Google-Smtp-Source: ABdhPJxRXO4Tg6vP9Yl2gWfjNk7itNtWJpnC+LuifvIjfWT9G17hviQjRSbsjfYwqZ9aZro+i/caAA==
X-Received: by 2002:a5d:59a7:: with SMTP id p7mr26580797wrr.141.1635195426297; 
 Mon, 25 Oct 2021 13:57:06 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id e2sm12451698wrt.8.2021.10.25.13.57.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 13:57:01 -0700 (PDT)
Message-ID: <21b998e6-f915-a96b-0802-41156b4db76a@amsat.org>
Date: Mon, 25 Oct 2021 22:57:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] hvf: arm: Ignore cache operations on MMIO
Content-Language: en-US
To: Alexander Graf <agraf@csgraf.de>, Cameron Esfahani <dirty@apple.com>
References: <20211025191349.52992-1-agraf@csgraf.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211025191349.52992-1-agraf@csgraf.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.846,
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
Cc: kettenis@openbsd.org, qemu-devel@nongnu.org,
 AJ Barris <AwlsomeAlex@github.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>, osy@github.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 21:13, Alexander Graf wrote:
> Apple's Hypervisor.Framework forwards cache operations as MMIO traps
> into user space. For MMIO however, these have no meaning: There is no
> cache attached to them.
> 
> So let's filter SYS instructions for DATA exits out and treat them as nops.
> 
> This fixes OpenBSD booting as guest.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reported-by: AJ Barris <AwlsomeAlex@github.com>
> ---
>  target/arm/hvf/hvf.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index bff3e0cde7..46ff4892a7 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1098,6 +1098,33 @@ static void hvf_sync_vtimer(CPUState *cpu)
>      }
>  }
>  
> +static bool hvf_emulate_insn(CPUState *cpu)
> +{
> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
> +    CPUARMState *env = &arm_cpu->env;
> +    uint32_t insn;
> +
> +    /*
> +     * We ran into an instruction that traps for data, but is not
> +     * hardware predecoded. This should not ever happen for well
> +     * behaved guests. Let's try to see if we can somehow rescue
> +     * the situation.
> +     */
> +
> +    cpu_synchronize_state(cpu);
> +    if (cpu_memory_rw_debug(cpu, env->pc, &insn, 4, 0)) {

What about using cpu_ldl_data()?

> +        /* Could not read the instruction */
> +        return false;
> +    }
> +
> +    if ((insn & 0xffc00000) == 0xd5000000) {

Could there be an endianess issue here?

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +        /* MSR/MRS/SYS/SYSL - happens for cache ops which are nops on data */
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
>  int hvf_vcpu_exec(CPUState *cpu)
>  {
>      ARMCPU *arm_cpu = ARM_CPU(cpu);
> @@ -1156,6 +1183,11 @@ int hvf_vcpu_exec(CPUState *cpu)
>                               hvf_exit->exception.physical_address, isv,
>                               iswrite, s1ptw, len, srt);
>  
> +        if (!isv) {
> +            g_assert(hvf_emulate_insn(cpu));
> +            advance_pc = true;
> +            break;
> +        }
>          assert(isv);
>  
>          if (iswrite) {
> 


