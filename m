Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9808436E613
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 09:34:24 +0200 (CEST)
Received: from localhost ([::1]:35108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc1Bn-0003lF-MF
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 03:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc1AZ-0002kI-AT
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:33:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc1AV-0006jS-T8
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:33:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619681583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a+5F+usxkfOjoG00rAvBiy8E+D4CBozVv6CMU6FtBFs=;
 b=TAVhtCfILZPjfWVRvgN9qbbIpeFQY6X8Ot6shmF6Y7WBpTGHpSSKnAdN5l8PatODLZWojI
 W4sSZqlw1vDZGfpITjSamIJ+LTcoJy6S/3j+7brVRCehFqEdOr2d3ROtljb9Wua6/eJR1I
 XDw/bZ6zL4NVtP/tsFaicH12hMhtDqA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-35k-QsIeP8Gl84OZ0JLkVA-1; Thu, 29 Apr 2021 03:33:00 -0400
X-MC-Unique: 35k-QsIeP8Gl84OZ0JLkVA-1
Received: by mail-ed1-f71.google.com with SMTP id
 cz7-20020a0564021ca7b02903853d41d8adso19033569edb.17
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 00:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=a+5F+usxkfOjoG00rAvBiy8E+D4CBozVv6CMU6FtBFs=;
 b=o9JO6CjhTn9zTL+kQDGlGoytdC2LJ56sk/sL5cRgF4egFH0fzQRC2TsA19qBBJLHar
 ua6sqMizG9cCSNq/oNn6zzp2dqSeIizbFa6JxuncefgQqcuyiXQpInRW15kP1lHC0UzC
 tUyEqM5YmwPjGGyQH7lzp+HkRQwxq44RxgbTxpoGrFnniDBCdMkzUlOCLECjdT5ruWUQ
 ZuapNA5ZeDg6lQza5va8wb59HAvihUx/zYAiff9NdwDnxYrUo0pE/QRUogg6Rg3aayUS
 1l50MEPvVghjo5Edc928a1i5wjmBn0Qjz7+tRNZqeXR0+NDVYSLkRvAvQbQdssvsSwNa
 gKTg==
X-Gm-Message-State: AOAM533+kDee37pXl9cHq+Tx1xI4ythJ0tsMJlr0BuFw3pScD5EPiTgL
 CC9iRRjX1oBqFsZfh4aWM5yJePIfQoCD0GV3xq/BVkDjkMRhhJMYfU7KcjOmkNKM1SsIjFTUjLv
 F//W4RvBwsNldFVw=
X-Received: by 2002:aa7:cd4d:: with SMTP id v13mr1693657edw.218.1619681579539; 
 Thu, 29 Apr 2021 00:32:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylX6bVq4ZmX2NIFHUnnzJth3CLbqE97dvO20qJadbVxv7RsGogNBZ6+fEDEV+dfGRh2EXQAg==
X-Received: by 2002:aa7:cd4d:: with SMTP id v13mr1693630edw.218.1619681579270; 
 Thu, 29 Apr 2021 00:32:59 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6158.dip0.t-ipconnect.de. [91.12.97.88])
 by smtp.gmail.com with ESMTPSA id
 y10sm1272405ejh.105.2021.04.29.00.32.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 00:32:58 -0700 (PDT)
Subject: Re: [PATCH v2 15/15] linux-user/s390x: Handle vector regs in signal
 stack
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210428193408.233706-1-richard.henderson@linaro.org>
 <20210428193408.233706-16-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <0b8ad978-124a-6eff-f405-a7af3b378761@redhat.com>
Date: Thu, 29 Apr 2021 09:32:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428193408.233706-16-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: thuth@redhat.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.04.21 21:34, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/s390x/signal.c | 62 +++++++++++++++++++++++++++++++++++++--
>   1 file changed, 60 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
> index 9d470e4ca0..b537646e60 100644
> --- a/linux-user/s390x/signal.c
> +++ b/linux-user/s390x/signal.c
> @@ -50,6 +50,12 @@ typedef struct {
>       target_s390_fp_regs     fpregs;
>   } target_sigregs;
>   
> +typedef struct {
> +    uint64_t vxrs_low[16];
> +    uint64_t vxrs_high[16][2];
> +    uint8_t reserved[128];
> +} target_sigregs_ext;
> +
>   typedef struct {
>       abi_ulong oldmask[_SIGCONTEXT_NSIG_WORDS];
>       abi_ulong sregs;
> @@ -60,15 +66,20 @@ typedef struct {
>       target_sigcontext sc;
>       target_sigregs sregs;
>       int signo;
> +    target_sigregs_ext sregs_ext;
>       uint16_t retcode;
>   } sigframe;
>   
> +#define TARGET_UC_VXRS 2
> +
>   struct target_ucontext {
>       abi_ulong tuc_flags;
>       abi_ulong tuc_link;
>       target_stack_t tuc_stack;
>       target_sigregs tuc_mcontext;
> -    target_sigset_t tuc_sigmask;   /* mask last for extensibility */
> +    target_sigset_t tuc_sigmask;
> +    uint8_t reserved[128 - sizeof(target_sigset_t)];

Guess I'd have used an unnamed union here

union {
	target_sigset_t tuc_sigmask;
	uint8_t reserved[128];
};

> +    target_sigregs_ext tuc_mcontext_ext;
>   };
>   
>   typedef struct {
> @@ -128,6 +139,24 @@ static void save_sigregs(CPUS390XState *env, target_sigregs *sregs)
>       }
>   }
>   
> +static void save_sigregs_ext(CPUS390XState *env, target_sigregs_ext *ext)
> +{
> +    int i;
> +
> +    /*
> +     * if (MACHINE_HAS_VX) ...
> +     * That said, we always allocate the stack storage and the
> +     * space is always available in env.
> +     */
> +    for (i = 0; i < 16; ++i) {
> +       __put_user(env->vregs[i][1], &ext->vxrs_low[i]);
> +    }
> +    for (i = 0; i < 16; ++i) {
> +       __put_user(env->vregs[i + 16][0], &ext->vxrs_high[i][0]);
> +       __put_user(env->vregs[i + 16][1], &ext->vxrs_high[i][1]);
> +    }
> +}
> +
>   void setup_frame(int sig, struct target_sigaction *ka,
>                    target_sigset_t *set, CPUS390XState *env)
>   {
> @@ -161,6 +190,9 @@ void setup_frame(int sig, struct target_sigaction *ka,
>        */
>       __put_user(sig, &frame->signo);
>   
> +    /* Create sigregs_ext on the signal stack. */
> +    save_sigregs_ext(env, &frame->sregs_ext);
> +
>       /*
>        * Set up to return from userspace.
>        * If provided, use a stub already in userspace.
> @@ -202,6 +234,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>       rt_sigframe *frame;
>       abi_ulong frame_addr;
>       abi_ulong restorer;
> +    abi_ulong uc_flags;
>   
>       frame_addr = get_sigframe(ka, env, sizeof *frame);
>       trace_user_setup_rt_frame(env, frame_addr);
> @@ -229,10 +262,15 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>       tswap_siginfo(&frame->info, info);
>   
>       /* Create ucontext on the signal stack. */
> -    __put_user(0, &frame->uc.tuc_flags);
> +    uc_flags = 0;
> +    if (s390_has_feat(S390_FEAT_VECTOR)) {
> +        uc_flags |= TARGET_UC_VXRS;
> +    }
> +    __put_user(uc_flags, &frame->uc.tuc_flags);
>       __put_user(0, &frame->uc.tuc_link);
>       target_save_altstack(&frame->uc.tuc_stack, env);
>       save_sigregs(env, &frame->uc.tuc_mcontext);
> +    save_sigregs_ext(env, &frame->uc.tuc_mcontext_ext);
>       tswap_sigset(&frame->uc.tuc_sigmask, set);
>   
>       /* Set up registers for signal handler */
> @@ -271,6 +309,24 @@ static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
>       }
>   }
>   
> +static void restore_sigregs_ext(CPUS390XState *env, target_sigregs_ext *ext)
> +{
> +    int i;
> +
> +    /*
> +     * if (MACHINE_HAS_VX) ...
> +     * That said, we always allocate the stack storage and the
> +     * space is always available in env.
> +     */
> +    for (i = 0; i < 16; ++i) {
> +       __get_user(env->vregs[i][1], &ext->vxrs_low[i]);
> +    }
> +    for (i = 0; i < 16; ++i) {
> +       __get_user(env->vregs[i + 16][0], &ext->vxrs_high[i][0]);
> +       __get_user(env->vregs[i + 16][1], &ext->vxrs_high[i][1]);
> +    }
> +}
> +
>   long do_sigreturn(CPUS390XState *env)
>   {
>       sigframe *frame;
> @@ -292,6 +348,7 @@ long do_sigreturn(CPUS390XState *env)
>       set_sigmask(&set); /* ~_BLOCKABLE? */
>   
>       restore_sigregs(env, &frame->sregs);
> +    restore_sigregs_ext(env, &frame->sregs_ext);
>   
>       unlock_user_struct(frame, frame_addr, 0);
>       return -TARGET_QEMU_ESIGRETURN;
> @@ -313,6 +370,7 @@ long do_rt_sigreturn(CPUS390XState *env)
>       set_sigmask(&set); /* ~_BLOCKABLE? */
>   
>       restore_sigregs(env, &frame->uc.tuc_mcontext);
> +    restore_sigregs_ext(env, &frame->uc.tuc_mcontext_ext);
>   
>       target_restore_altstack(&frame->uc.tuc_stack, env);
>   
> 

LGTM

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


