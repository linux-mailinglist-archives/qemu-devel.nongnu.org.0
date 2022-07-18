Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DF45779D1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 05:59:09 +0200 (CEST)
Received: from localhost ([::1]:60836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDHuV-0002d5-Na
	for lists+qemu-devel@lfdr.de; Sun, 17 Jul 2022 23:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu.linux@gmail.com>)
 id 1oDHt7-00019L-6N
 for qemu-devel@nongnu.org; Sun, 17 Jul 2022 23:57:41 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:37656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <like.xu.linux@gmail.com>)
 id 1oDHt5-0003I6-NX
 for qemu-devel@nongnu.org; Sun, 17 Jul 2022 23:57:40 -0400
Received: by mail-pl1-x62e.google.com with SMTP id f11so7949565plr.4
 for <qemu-devel@nongnu.org>; Sun, 17 Jul 2022 20:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=r9mX9H09MLDH6+TAZdj5DGzt04yKJHCzJmYAXQA0KrU=;
 b=RKsaIKjTEDcj6ZO6mHEEqm3YurPei25ViSrqf7Pp3oxUFB3fZrZl0C+ebPzkUzPdpv
 Y8VoaJa0yt7O6eUf3u2Hkz1530mLplyN0E456bk4J/A1j4ImEvJd88c8fGlg29G2AP9I
 qhYw6LZLEYT4q8fJld0k30WSMD7IDYv/dcg51uKKj3iPQHZbaAZ1boOYfVsFNmE2LWbI
 u84rCHdxTg77OEW3EbmZBObKAdyua/oYlGFaptu9a5Q56jW93W6BPoBImkfMQoGsrt2Z
 M9DGx3iY4+S2jPDC/08xb12MPY3jA1yAh+fn65yGf9W1UgxFG6jXt8vo+nzTH+tpGv+7
 mTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r9mX9H09MLDH6+TAZdj5DGzt04yKJHCzJmYAXQA0KrU=;
 b=5hJ60BKIbm2lzI8yKN/z322uSM0Md22cX5m+D+5J1iBiyM/h2Oko2KjJhb/QVX7+yQ
 cSbJnq9ty5USWxv0wp3HcfYoRw4U7EOzPVcgqUoQXi0IGhJNVc4+RihDaBeRbpwXs1JE
 zKOQRfVuQFQ9nT1SC1yoh3Le3OXNEdABd8P9isJ9mSpAVYaqwaA/6P4BOY7FVb01ThJb
 HQDxIelkvlqfLJharDLHPwCoK7lQDtW9ZJ5yNv54zOmbb1ng+W6Q+kG99FpPZaB4NY+Y
 yDo1mhECxN1cTp1ZAKKyEN5X+x6QtcU7posKVV3gQwGny6McIbaDS4xzmSnqPskd7B1q
 gKkQ==
X-Gm-Message-State: AJIora/PXy6qpGwlGo5oPYWDNb6doJrFfpBNl0JEcRRFASmaS9h5FNoL
 PMmIY/acqjXXzce07unKVBU=
X-Google-Smtp-Source: AGRyM1sI46PtGjx+kBEe9vfPcXSUWEN3A0v9wrD7fNoMZ5xA7ApShvbTSd9SO7OSKI3FgveeW6Jhxw==
X-Received: by 2002:a17:902:c102:b0:16c:acf1:60e7 with SMTP id
 2-20020a170902c10200b0016cacf160e7mr21267494pli.93.1658116658100; 
 Sun, 17 Jul 2022 20:57:38 -0700 (PDT)
Received: from [192.168.255.10] ([103.7.29.32])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a17090a318600b001ece32cbec9sm10173475pjb.24.2022.07.17.20.57.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jul 2022 20:57:37 -0700 (PDT)
Message-ID: <a6a439ad-7cca-11e4-a73f-83346c22453a@gmail.com>
Date: Mon, 18 Jul 2022 11:57:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH] i386: Disable BTS and PEBS
Content-Language: en-US
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: pbonzini@redhat.com, mtosatti@redhat.com, seanjc@google.com,
 xiangfeix.ma@intel.com, qemu-devel@nongnu.org
References: <20220718032206.34488-1-zhenzhong.duan@intel.com>
From: Like Xu <like.xu.linux@gmail.com>
In-Reply-To: <20220718032206.34488-1-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=like.xu.linux@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 18/7/2022 11:22 am, Zhenzhong Duan wrote:
> Since below KVM commit, KVM hided BTS as it's not supported yet.
> b9181c8ef356 ("KVM: x86/pmu: Avoid exposing Intel BTS feature")
> 
> After below KVM commit, it gave control of MSR_IA32_MISC_ENABLES to userspace.
> 9fc222967a39 ("KVM: x86: Give host userspace full control of MSR_IA32_MISC_ENABLES")
> 
> So qemu takes the responsibility to hide BTS.
> Without fix, we get below warning in guest kernel:
> 
> [] unchecked MSR access error: WRMSR to 0x1d9 (tried to write 0x00000000000001c0) at rIP: 0xffffffffaa070644 (native_write_msr+0x4/0x20)
> [] Call Trace:
> []  <TASK>
> []  intel_pmu_enable_bts+0x5d/0x70
> []  bts_event_add+0x77/0x90
> []  event_sched_in.isra.135+0x99/0x1e0
> 
> Tested-by: Xiangfei Ma <xiangfeix.ma@intel.com>
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>   target/i386/cpu.h     | 6 ++++--
>   target/i386/kvm/kvm.c | 4 ++++
>   2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 82004b65b944..8a83d0995c66 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -434,8 +434,10 @@ typedef enum X86Seg {
>   
>   #define MSR_IA32_MISC_ENABLE            0x1a0
>   /* Indicates good rep/movs microcode on some processors: */
> -#define MSR_IA32_MISC_ENABLE_DEFAULT    1
> -#define MSR_IA32_MISC_ENABLE_MWAIT      (1ULL << 18)
> +#define MSR_IA32_MISC_ENABLE_DEFAULT      1
> +#define MSR_IA32_MISC_ENABLE_BTS_UNAVAIL  (1ULL << 11)
> +#define MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL (1ULL << 12)
> +#define MSR_IA32_MISC_ENABLE_MWAIT        (1ULL << 18)
>   
>   #define MSR_MTRRphysBase(reg)           (0x200 + 2 * (reg))
>   #define MSR_MTRRphysMask(reg)           (0x200 + 2 * (reg) + 1)
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index f148a6d52fa4..002e0520dd76 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -2180,6 +2180,10 @@ void kvm_arch_reset_vcpu(X86CPU *cpu)
>   {
>       CPUX86State *env = &cpu->env;
>   
> +    /* Disable BTS feature which is unsupported on KVM */
> +    env->msr_ia32_misc_enable |= MSR_IA32_MISC_ENABLE_BTS_UNAVAIL;
> +    env->msr_ia32_misc_enable |= MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL;

Would it be more readable to group msr_ia32_misc_enable code into this function:

	static void x86_cpu_reset(DeviceState *dev)

and, why disable PEBS (we need it at least for "-cpu host,migratable=no") ?

Also, the behavior of MISC_ENABLE_EMON is also inconsistent with "pmu=off”.

> +
>       env->xcr0 = 1;
>       if (kvm_irqchip_in_kernel()) {
>           env->mp_state = cpu_is_bsp(cpu) ? KVM_MP_STATE_RUNNABLE :

