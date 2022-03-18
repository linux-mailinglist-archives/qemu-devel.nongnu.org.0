Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B00BD4DDF17
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 17:33:08 +0100 (CET)
Received: from localhost ([::1]:37328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVFXH-0004GI-BT
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 12:33:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nVFWR-0003bw-5O
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 12:32:15 -0400
Received: from [2607:f8b0:4864:20::102b] (port=39512
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nVFWP-0000mQ-Ks
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 12:32:14 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 mr5-20020a17090b238500b001c67366ae93so6317107pjb.4
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 09:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2J3eOMgYKOjl0dqc1dPfWfOh0wSRSLfPAjXzMYIeZ4c=;
 b=okSeRkPTwC+Q70Nv07ZdiPYmhXchTSmA9cLQ63RqywqZAPm/EI0KcG+isbXg24LrMd
 r5AHN7uKH7kQPRQX6CKEGU8/9MtdmAqZQS8/hbGrVG6chUwd1HttBAOgyVqAVAhxuXSA
 LgQPCxKsUDyLmaTVLvlMrQGNUDKBe+LW/wQaOFgjAvXV7+Pj05Z11sGY66DYgAlrLONv
 tYqG0GFqr5srDoUIeSKM4MP7siJG7+BS60ubgfINwwkrXP932yFVA3bNZOCIvlnYZoFn
 IVKOSqkRBhn4PXJaO9Aeq+mT0ZviA7b2PD0xjIhubYWA1utgPQEH+JIq4WKKiapVP4xY
 vzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2J3eOMgYKOjl0dqc1dPfWfOh0wSRSLfPAjXzMYIeZ4c=;
 b=Gw6aNboqmlZSL4OXpWa27lBjdHKpvWgazgvPrjPBdtJaNjn0GGpShX/et8qvQr+uom
 WyC5kVw+Kawqt4qZqr8F3KQKjoXmYCCnsTV08Il1QCHhIjsgn9Es14hvJzIYVYlOv0wm
 kxj5mmGSdzUZ4L+cwLCr/hlGiRC1pA4YDRU5H99a5c8nr9xkBOYC3U6woTVCh9v5TfZj
 7OeBJGud2kCK461HazIpIcMbSxEam3jNhyrV6iaWbiT0uj8XTsgvAxmPJvYpW6NSKWO4
 vqky50Xsc+Cm1g0BfwD5Zy1G8nzKZOY9mujltlSsKSt0NtQeKzizZTx3KmSAp0fAt9RK
 It0g==
X-Gm-Message-State: AOAM532PFB7fS+6DWAAWlUrFSGlMpJ3nwl/quI78I/AmLR+ul5H9ccXo
 hNATEKuuLJpQ1CPBR7ezCmU=
X-Google-Smtp-Source: ABdhPJx3TD/ZhtxEZ6LCUrOk4SCwRozZu3DPriCbLGrECzuwTEDb9+VilEhxssTNbLDlAQxo51HZIA==
X-Received: by 2002:a17:902:e949:b0:14b:1f32:e926 with SMTP id
 b9-20020a170902e94900b0014b1f32e926mr255609pll.170.1647621132039; 
 Fri, 18 Mar 2022 09:32:12 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ay5-20020a056a00300500b004f6d510af4asm9061545pfb.124.2022.03.18.09.32.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 09:32:11 -0700 (PDT)
Message-ID: <66dc469a-6ba7-055c-1d5c-ac22c42ced35@gmail.com>
Date: Fri, 18 Mar 2022 17:32:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 5/5] i386/cpu: Free env->xsave_buf in
 x86_cpu_unrealizefn()
Content-Language: en-US
To: Mark Kanda <mark.kanda@oracle.com>, qemu-devel@nongnu.org
References: <20220318151555.381737-1-mark.kanda@oracle.com>
 <20220318151555.381737-6-mark.kanda@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220318151555.381737-6-mark.kanda@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/3/22 16:15, Mark Kanda wrote:
> vCPU hotunplug related leak reported by Valgrind:
> 
> ==132362== 4,096 bytes in 1 blocks are definitely lost in loss record 8,440 of 8,549
> ==132362==    at 0x4C3B15F: memalign (vg_replace_malloc.c:1265)
> ==132362==    by 0x4C3B288: posix_memalign (vg_replace_malloc.c:1429)
> ==132362==    by 0xB41195: qemu_try_memalign (memalign.c:53)
> ==132362==    by 0xB41204: qemu_memalign (memalign.c:73)
> ==132362==    by 0x7131CB: kvm_init_xsave (kvm.c:1601)
> ==132362==    by 0x7148ED: kvm_arch_init_vcpu (kvm.c:2031)
> ==132362==    by 0x91D224: kvm_init_vcpu (kvm-all.c:516)
> ==132362==    by 0x9242C9: kvm_vcpu_thread_fn (kvm-accel-ops.c:40)
> ==132362==    by 0xB2EB26: qemu_thread_start (qemu-thread-posix.c:556)
> ==132362==    by 0x7EB2159: start_thread (in /usr/lib64/libpthread-2.28.so)
> ==132362==    by 0x9D45DD2: clone (in /usr/lib64/libc-2.28.so)
> 
> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
> ---
>   target/i386/cpu.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index a88d6554c8..014a716c36 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6572,6 +6572,11 @@ static void x86_cpu_unrealizefn(DeviceState *dev)
>       }
>   
>       xcc->parent_unrealize(dev);
> +
> +#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
> +    CPUX86State *env = &cpu->env;
> +    g_free(env->xsave_buf);

This belong to hvf_arch_vcpu_destroy().

And for KVM, in the missing kvm_arch_destroy_vcpu().

> +#endif
>   }
>   
>   typedef struct BitProperty {


