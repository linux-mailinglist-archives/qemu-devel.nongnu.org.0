Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521ED30DB65
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 14:37:00 +0100 (CET)
Received: from localhost ([::1]:39622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7IL5-0000kw-Ba
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 08:36:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7IJ0-0007lF-Cq
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:34:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7IIy-00032R-4n
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:34:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612359286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aXguj2tfZbnpIXvna9W8EHUImzsTycAmtofm94O1TY0=;
 b=E7fy8NK/XHm48OJfxHgRulzHQV9zPPSt1Yyaln+nrS5EoL89D8CxsdM2XwNZtiwVVV8y9D
 ZNfN2GJPAfnF9ERRNXTYp+vg0iw/yQNqByDlSYctqTtIqywg4ha2vU3OSmN5F5ZDP8WDOS
 2F5Ld/lfHnl+SuLPpF3LGlk876W4buc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-J4E4Fa_kN1yATmDqZRREJQ-1; Wed, 03 Feb 2021 08:34:45 -0500
X-MC-Unique: J4E4Fa_kN1yATmDqZRREJQ-1
Received: by mail-ed1-f70.google.com with SMTP id j12so11482192edq.10
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 05:34:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aXguj2tfZbnpIXvna9W8EHUImzsTycAmtofm94O1TY0=;
 b=iV6n+A+AftFph3R1jXXw7lv085dRZTTSTkbT+LtA5sRIMCFVkuPbRHw4GTgZ4CgYRv
 bs5Vbn4zZmqdveJ6r/t6K0n3ezeDEmLohEiSmWIB2KcaJ4sPQx3eis9bBwd8fLiqxt6S
 o/cjxPnk/H0m/6ooLuZw/R45CcUe4cD1M5NtytaOnK9J+m28sWPRkPcWq9IjKBMt63op
 jZl8cMUkXIc4Q8GIBAitIG5XiTA69Ngpvdm4dZP/hyojdQHn2u8+V5dnKwaBfzfXdPQ2
 tg94OY0XFHLtk5yPFSZ8PYVqzH07XOuvki38nNlYuIKe/hU/DRD+YojH3xzs0L1Oz693
 MZlQ==
X-Gm-Message-State: AOAM532pX80PB9MAKrL46hxr4bYCusVWVMve9Hhi7+qqyvfA1h5kOe54
 RxhjdHxBB49zrFGke6nRDyH/ILreizCpx3TM3wilqKoUuNA3EMWOOR9zjctunlClH8z+11iSlI3
 cBnWVvFp8LgwYDQ+itHvjbHH+siCubT2SXk8qmx6ftRTGeXsxoIVMlrf9GGFTXNTl
X-Received: by 2002:a17:906:3e42:: with SMTP id
 t2mr307642eji.439.1612359283382; 
 Wed, 03 Feb 2021 05:34:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLzp0AYciyRE1hkx66Edb4HMvIYuGCpTNX4YCRx71ozu2iEIDZjoqSDOVCoEDtpzaIEAZ2Dg==
X-Received: by 2002:a17:906:3e42:: with SMTP id
 t2mr307615eji.439.1612359283161; 
 Wed, 03 Feb 2021 05:34:43 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id h15sm1002784ejj.43.2021.02.03.05.34.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 05:34:42 -0800 (PST)
Subject: Re: [PATCH v15 23/23] accel-cpu: make cpu_realizefn return a bool
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210201100903.17309-1-cfontana@suse.de>
 <20210201100903.17309-24-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <81bf4dc1-50ee-c2c7-5730-c72861e1794c@redhat.com>
Date: Wed, 3 Feb 2021 14:34:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210201100903.17309-24-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/21 11:09 AM, Claudio Fontana wrote:
> overall, all devices' realize functions take an Error **errp, but return void.
> 
> hw/core/qdev.c code, which realizes devices, therefore does:
> 
> local_err = NULL;
> dc->realize(dev, &local_err);
> if (local_err != NULL) {
>     goto fail;
> }
> 
> However, we can improve at least accel_cpu to return a meaningful bool value.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  include/hw/core/accel-cpu.h |  2 +-
>  include/qemu/accel.h        |  2 +-
>  target/i386/host-cpu.h      |  2 +-
>  accel/accel-common.c        |  6 +++---
>  cpu.c                       |  5 +++--
>  target/i386/host-cpu.c      | 25 ++++++++++++++-----------
>  target/i386/kvm/kvm-cpu.c   |  4 ++--
>  target/i386/tcg/tcg-cpu.c   |  6 ++++--
>  8 files changed, 29 insertions(+), 23 deletions(-)
...

> diff --git a/target/i386/host-cpu.c b/target/i386/host-cpu.c
> index 9cfe56ce41..4ea9e354ea 100644
> --- a/target/i386/host-cpu.c
> +++ b/target/i386/host-cpu.c
> @@ -50,7 +50,7 @@ static void host_cpu_enable_cpu_pm(X86CPU *cpu)
>      env->features[FEAT_1_ECX] |= CPUID_EXT_MONITOR;
>  }
>  
> -static uint32_t host_cpu_adjust_phys_bits(X86CPU *cpu, Error **errp)
> +static uint32_t host_cpu_adjust_phys_bits(X86CPU *cpu)
>  {
>      uint32_t host_phys_bits = host_cpu_phys_bits();
>      uint32_t phys_bits = cpu->phys_bits;
> @@ -77,18 +77,10 @@ static uint32_t host_cpu_adjust_phys_bits(X86CPU *cpu, Error **errp)
>          }
>      }
>  
> -    if (phys_bits &&
> -        (phys_bits > TARGET_PHYS_ADDR_SPACE_BITS ||
> -         phys_bits < 32)) {
> -        error_setg(errp, "phys-bits should be between 32 and %u "
> -                   " (but is %u)",
> -                   TARGET_PHYS_ADDR_SPACE_BITS, phys_bits);
> -    }
> -
>      return phys_bits;
>  }
>  
> -void host_cpu_realizefn(CPUState *cs, Error **errp)
> +bool host_cpu_realizefn(CPUState *cs, Error **errp)
>  {
>      X86CPU *cpu = X86_CPU(cs);
>      CPUX86State *env = &cpu->env;
> @@ -97,8 +89,19 @@ void host_cpu_realizefn(CPUState *cs, Error **errp)
>          host_cpu_enable_cpu_pm(cpu);
>      }
>      if (env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_LM) {
> -        cpu->phys_bits = host_cpu_adjust_phys_bits(cpu, errp);
> +        uint32_t phys_bits = host_cpu_adjust_phys_bits(cpu);
> +
> +        if (phys_bits &&
> +            (phys_bits > TARGET_PHYS_ADDR_SPACE_BITS ||
> +             phys_bits < 32)) {
> +            error_setg(errp, "phys-bits should be between 32 and %u "
> +                       " (but is %u)",
> +                       TARGET_PHYS_ADDR_SPACE_BITS, phys_bits);

Please this change in a preliminary patch (preferably), or comment it
in the commit description.
Either ways:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +            return false;
> +        }
> +        cpu->phys_bits = phys_bits;
>      }
> +    return true;
>  }


