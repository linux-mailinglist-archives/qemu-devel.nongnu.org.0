Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8244C69CF6D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 15:31:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU7Am-0008Bq-1e; Mon, 20 Feb 2023 09:29:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pU7Aa-00089W-EJ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 09:29:36 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pU7AY-0007LN-Ek
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 09:29:32 -0500
Received: by mail-wm1-x32c.google.com with SMTP id n31so1017378wms.2
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 06:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SeusRdCD6mJpy23ZM8/cJDolUT9fKSu+9/BKdu2gbO8=;
 b=fwUJwnMtQrBnMQpmEcRCr50nHgZOYO/fyof2ePvEMtMUL9KdwCDpY5EkQ+Nq4ic/ve
 kCnUQJvaX27HaqdMeS0mKl3XAHPo8Fa/ssfKQoNhh9zERfRVJagYoKB+KZdl5oohblRe
 dLjfCG4nStgK/hV6y1YzxIfZsEUZ7UbYE2hWhNSnN0kvrI8D2th85fRNiNIkwvhaUnzn
 hghF6FUVtDHHCpUhZJGUc3p/Dh37wFpecUQ+5/VymuZTXQwBoHb+CW3gFwiKfxdp7jBw
 frDAiVx+LlByw+GnPNnz1SQ+cQmwFvhwo2igYYKrNIrOlex7kokOVRrTt0CQGgI1XrIJ
 7mDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SeusRdCD6mJpy23ZM8/cJDolUT9fKSu+9/BKdu2gbO8=;
 b=iaKzfqt7CqqjNQoWm18wp9DOuasoJsWkUBRcAfJPDk8nSx2YuNMofNvMNnpMY/sLMM
 l4kvwQsAeTL5ggd/CFMPATo40oHdBp82gmCpoYTYZyCdgDz0rdZn8bcsEiBSy7dUCmt7
 5pTmfOdoThZlUu1kl95RMx5FsXTR+CMVJbzcqVcIk2GIjlIBTQjD7SoGrQiRdjahy+7d
 nKT60hmEGh9qE5XnwbZIDU6PqNPEYyd0VO7yIKK5hZA6N4rvgGDZVVQNwQLp1Y/2fXIC
 9XOHTSmyPkQU4mbPVnGN6l9CraKhwr/Esm42OhGayeVGL/pjO96bBCitp+dK3tsbf39E
 QDHg==
X-Gm-Message-State: AO0yUKVtLcaHuCVbk70a+lduMIdrx648zTHWKT8Zh+7TUVUmWoB9ZDtm
 /pudLDvsmR1kD9FYTfw0fvs=
X-Google-Smtp-Source: AK7set9ZRAPDkMZ8Yfz69gFvsWItoAiNmzbAc3tFENlXMu+6c6toUTlnxRvmJNr84m6y12nVzivkmA==
X-Received: by 2002:a05:600c:4e08:b0:3dc:5240:53b6 with SMTP id
 b8-20020a05600c4e0800b003dc524053b6mr1114113wmq.6.1676903368592; 
 Mon, 20 Feb 2023 06:29:28 -0800 (PST)
Received: from [10.85.37.29] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003e21f01c426sm35079wmn.9.2023.02.20.06.29.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 06:29:28 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <74ceaa5f-3280-b5c2-31b1-a502116682a1@xen.org>
Date: Mon, 20 Feb 2023 14:29:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v11 47/59] i386/xen: handle PV timer hypercalls
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230216062444.2129371-1-dwmw2@infradead.org>
 <20230216062444.2129371-48-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230216062444.2129371-48-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/02/2023 06:24, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Introduce support for one shot and periodic mode of Xen PV timers,
> whereby timer interrupts come through a special virq event channel
> with deadlines being set through:
> 
> 1) set_timer_op hypercall (only oneshot)
> 2) vcpu_op hypercall for {set,stop}_{singleshot,periodic}_timer
> hypercalls
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c  |  31 +++++
>   hw/i386/kvm/xen_evtchn.h  |   2 +
>   target/i386/cpu.h         |   5 +
>   target/i386/kvm/xen-emu.c | 252 +++++++++++++++++++++++++++++++++++++-
>   target/i386/machine.c     |   1 +
>   5 files changed, 289 insertions(+), 2 deletions(-)
> 
[snip]
>   static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
>                                     int cmd, int vcpu_id, uint64_t arg)
>   {
> -    CPUState *dest = qemu_get_cpu(vcpu_id);
>       CPUState *cs = CPU(cpu);
> +    CPUState *dest = cs->cpu_index == vcpu_id ? cs : qemu_get_cpu(vcpu_id);
>       int err;
>   
> +    if (!dest) {
> +        return -ENOENT;
> +    }
> +

I thought the patch format was catching me out somehow but I don't think 
so...

The function declaration says 'static bool kvm_xen_hcall_vcpu_op(...)' 
but that return value doesn't look very boolean to me. I think you also 
have the same issue...

>       switch (cmd) {
>       case VCPUOP_register_runstate_memory_area:
>           err = vcpuop_register_runstate_info(cs, dest, arg);
> @@ -892,6 +1092,26 @@ static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
>       case VCPUOP_register_vcpu_info:
>           err = vcpuop_register_vcpu_info(cs, dest, arg);
>           break;
> +    case VCPUOP_set_singleshot_timer: {
> +        if (cs->cpu_index != vcpu_id) {
> +            return -EINVAL;
> +        }
> +        err = vcpuop_set_singleshot_timer(dest, arg);
> +        break;
> +    }
> +    case VCPUOP_stop_singleshot_timer:
> +        if (cs->cpu_index != vcpu_id) {
> +            return -EINVAL;
> +        }
> +        err = vcpuop_stop_singleshot_timer(dest);
> +        break;
> +    case VCPUOP_set_periodic_timer: {
> +        err = vcpuop_set_periodic_timer(cs, dest, arg);
> +        break;
> +    }
> +    case VCPUOP_stop_periodic_timer:
> +        err = vcpuop_stop_periodic_timer(dest);
> +        break;
>   
>       default:
>           return false;
> @@ -1246,6 +1466,16 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
>       }
>   
>       switch (code) {
> +    case __HYPERVISOR_set_timer_op:
> +        if (exit->u.hcall.longmode) {
> +            return kvm_xen_hcall_set_timer_op(exit, cpu,
> +                                              exit->u.hcall.params[0]);
> +        } else {
> +            /* In 32-bit mode, the 64-bit timer value is in two args. */
> +            uint64_t val = ((uint64_t)exit->u.hcall.params[1]) << 32 |
> +                (uint32_t)exit->u.hcall.params[0];
> +            return kvm_xen_hcall_set_timer_op(exit, cpu, val);
> +        }

... with these returns above.

   Paul

>       case __HYPERVISOR_grant_table_op:
>           return kvm_xen_hcall_gnttab_op(exit, cpu, exit->u.hcall.params[0],
>                                          exit->u.hcall.params[1],
> @@ -1355,7 +1585,25 @@ int kvm_put_xen_state(CPUState *cs)
>           }
>       }
>   
> +    if (env->xen_periodic_timer_period) {
> +        ret = do_set_periodic_timer(cs, env->xen_periodic_timer_period);
> +        if (ret < 0) {
> +            return ret;
> +        }
> +    }
> +
>       if (!kvm_xen_has_cap(EVTCHN_SEND)) {
> +        /*
> +         * If the kernel has EVTCHN_SEND support then it handles timers too,
> +         * so the timer will be restored by kvm_xen_set_vcpu_timer() below.
> +         */
> +        if (env->xen_singleshot_timer_ns) {
> +            ret = do_set_singleshot_timer(cs, env->xen_singleshot_timer_ns,
> +                                    false, false);
> +            if (ret < 0) {
> +                return ret;
> +            }
> +        }
>           return 0;
>       }
>   
> diff --git a/target/i386/machine.c b/target/i386/machine.c
> index 603a1077e3..c7ac8084b2 100644
> --- a/target/i386/machine.c
> +++ b/target/i386/machine.c
> @@ -1277,6 +1277,7 @@ static const VMStateDescription vmstate_xen_vcpu = {
>           VMSTATE_UINT8(env.xen_vcpu_callback_vector, X86CPU),
>           VMSTATE_UINT16_ARRAY(env.xen_virq, X86CPU, XEN_NR_VIRQS),
>           VMSTATE_UINT64(env.xen_singleshot_timer_ns, X86CPU),
> +        VMSTATE_UINT64(env.xen_periodic_timer_period, X86CPU),
>           VMSTATE_END_OF_LIST()
>       }
>   };


