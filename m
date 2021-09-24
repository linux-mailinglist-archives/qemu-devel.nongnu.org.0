Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 515AA417A74
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 20:04:14 +0200 (CEST)
Received: from localhost ([::1]:36664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTpYT-0005HJ-7i
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 14:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTpVS-0002mj-OZ
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:01:07 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTpVP-00081F-SK
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:01:06 -0400
Received: by mail-wr1-x430.google.com with SMTP id t8so30041319wri.1
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 11:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BXbOhlkzGny0QDQ7FvDL8QUwjnV45urnakp6uGI4oGA=;
 b=pR6IL3CBq5E/oXIV/tPuiS5g8qE9TtfG9P6+7lkZX7NSnPztTcoopBp2cfum7m8x1v
 xBne+0YP3aJlV27L3ltjqS+2scMdrsHsIkkj7Oz/JSO7GPpUEv6StEV43kGiwaJe/MNB
 wTaiMV7b3L28zCYj3rYtuWojcQl9Ju43M9MGLfWxRs7pyusCWqxGCRkSpVrdxuYdgVWZ
 PN49EsfYdql43nz5WR8o2yKQEI4qqKuWOW6oLAki+I1apIEkXOc8OaVlGRFKCkN0pXFT
 KY8AJLiwhn/rCaa3K9Otsm2LSqODosJniFnU/f/gbtTgqWEueur1tdqlsVdWAx93fMdL
 OXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BXbOhlkzGny0QDQ7FvDL8QUwjnV45urnakp6uGI4oGA=;
 b=YYQyEo3Oiwi+tJrnsnzI+QVsoGxrH9uMsxsZvYG9Ag2PLHtmDb88BigIiR748oc+dI
 yYLgso9WQGvrtyUkT/BIWGBYoHmLhvhw9cF+aZ94Co2m3rPUzMhyeaDhJqY/s48RDgW0
 PYdfkC8cAMX5LQIn9UM/VHGkysxzzFBt183gRlVPw1RCqqLjgFIXsxyY5LxGUyKPljJN
 UTtIM0yUl9KDY6zVtzWzAOaOfL1pkpgFK1EJHRWJUjG53+FylaDwOwCde+WqTa0bbHpb
 fauIszK1CcqruBoYZPC7McRGV+uaaNMVE3AYY99VrXttyM/KkIlDB7y52w7VTmFVHqOk
 0Vtw==
X-Gm-Message-State: AOAM530JOwgNydMy/D3omM1UXBKSSwbJ2zLouWZbLC8YjbZyfzPXCHCc
 u7GxdRvNcWMrq53zwUZ0BxY=
X-Google-Smtp-Source: ABdhPJwexR+MXtPDQstlJbFPfILtg1KN/ZTN+KK9/aihnjAXAmw9u9mPhsZtNrYUz1G687p3HgJOJg==
X-Received: by 2002:a1c:1cc:: with SMTP id 195mr3461158wmb.188.1632506461741; 
 Fri, 24 Sep 2021 11:01:01 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id l124sm13126835wml.8.2021.09.24.11.01.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 11:01:00 -0700 (PDT)
Message-ID: <9f360405-3897-fd03-4da2-e943defb2d86@amsat.org>
Date: Fri, 24 Sep 2021 20:01:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 10/27] linux-user/i386: Implement setup_sigtramp
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210924165926.752809-1-richard.henderson@linaro.org>
 <20210924165926.752809-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210924165926.752809-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 18:59, Richard Henderson wrote:
> Create and record the two signal trampolines.
> Use them when the guest does not use SA_RESTORER.
> Note that x86_64 does not use this code.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/i386/target_signal.h   |  2 ++
>   linux-user/x86_64/target_signal.h |  3 ++
>   linux-user/i386/signal.c          | 56 +++++++++++++++++++++----------
>   3 files changed, 43 insertions(+), 18 deletions(-)
> 
> diff --git a/linux-user/i386/target_signal.h b/linux-user/i386/target_signal.h
> index 50361af874..64d09f2e75 100644
> --- a/linux-user/i386/target_signal.h
> +++ b/linux-user/i386/target_signal.h
> @@ -22,4 +22,6 @@ typedef struct target_sigaltstack {
>   #include "../generic/signal.h"
>   
>   #define TARGET_ARCH_HAS_SETUP_FRAME
> +#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
> +
>   #endif /* I386_TARGET_SIGNAL_H */
> diff --git a/linux-user/x86_64/target_signal.h b/linux-user/x86_64/target_signal.h
> index 4ea74f20dd..4673c5a886 100644
> --- a/linux-user/x86_64/target_signal.h
> +++ b/linux-user/x86_64/target_signal.h
> @@ -21,4 +21,7 @@ typedef struct target_sigaltstack {
>   
>   #include "../generic/signal.h"
>   
> +/* For x86_64, use of SA_RESTORER is mandatory. */
> +#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
> +
>   #endif /* X86_64_TARGET_SIGNAL_H */
> diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
> index 3b4b55fc0a..94ab6396a0 100644
> --- a/linux-user/i386/signal.c
> +++ b/linux-user/i386/signal.c
> @@ -310,6 +310,22 @@ get_sigframe(struct target_sigaction *ka, CPUX86State *env, size_t frame_size)
>   }
>   
>   #ifndef TARGET_X86_64
> +static void install_sigtramp(void *tramp)
> +{
> +    /* This is popl %eax ; movl $syscall,%eax ; int $0x80 */
> +    __put_user(0xb858, (uint16_t *)(tramp + 0));
> +    __put_user(TARGET_NR_sigreturn, (int *)(tramp + 2));

I know this is mostly code movement, but using uint32_t would
make it easier to read.

> +    __put_user(0x80cd, (uint16_t *)(tramp + 6));
> +}
> +
> +static void install_rt_sigtramp(void *tramp)
> +{
> +    /* This is movl $syscall,%eax ; int $0x80 */
> +    __put_user(0xb8, (char *)(tramp + 0));

Ditto uint8_t,

> +    __put_user(TARGET_NR_rt_sigreturn, (int *)(tramp + 1));

and uint32_t.

> +    __put_user(0x80cd, (uint16_t *)(tramp + 5));
> +}
> +
>   /* compare linux/arch/i386/kernel/signal.c:setup_frame() */
>   void setup_frame(int sig, struct target_sigaction *ka,
>                    target_sigset_t *set, CPUX86State *env)
> @@ -338,16 +354,9 @@ void setup_frame(int sig, struct target_sigaction *ka,
>       if (ka->sa_flags & TARGET_SA_RESTORER) {
>           __put_user(ka->sa_restorer, &frame->pretcode);
>       } else {
> -        uint16_t val16;
> -        abi_ulong retcode_addr;
> -        retcode_addr = frame_addr + offsetof(struct sigframe, retcode);
> -        __put_user(retcode_addr, &frame->pretcode);
> -        /* This is popl %eax ; movl $,%eax ; int $0x80 */
> -        val16 = 0xb858;
> -        __put_user(val16, (uint16_t *)(frame->retcode+0));
> -        __put_user(TARGET_NR_sigreturn, (int *)(frame->retcode+2));
> -        val16 = 0x80cd;
> -        __put_user(val16, (uint16_t *)(frame->retcode+6));
> +        /* This is no longer used, but is retained for ABI compatibility. */
> +        install_sigtramp(frame->retcode);
> +        __put_user(default_sigreturn, &frame->pretcode);
>       }
>   
>       /* Set up registers for signal handler */
> @@ -416,14 +425,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>       if (ka->sa_flags & TARGET_SA_RESTORER) {
>           __put_user(ka->sa_restorer, &frame->pretcode);
>       } else {
> -        uint16_t val16;
> -        addr = frame_addr + offsetof(struct rt_sigframe, retcode);
> -        __put_user(addr, &frame->pretcode);
> -        /* This is movl $,%eax ; int $0x80 */
> -        __put_user(0xb8, (char *)(frame->retcode+0));
> -        __put_user(TARGET_NR_rt_sigreturn, (int *)(frame->retcode+1));
> -        val16 = 0x80cd;
> -        __put_user(val16, (uint16_t *)(frame->retcode+5));
> +        /* This is no longer used, but is retained for ABI compatibility. */
> +        install_rt_sigtramp(frame->retcode);
> +        __put_user(default_rt_sigreturn, &frame->pretcode);
>       }
>   #else
>       /* XXX: Would be slightly better to return -EFAULT here if test fails
> @@ -592,3 +596,19 @@ badframe:
>       force_sig(TARGET_SIGSEGV);
>       return -TARGET_QEMU_ESIGRETURN;
>   }
> +
> +#ifndef TARGET_X86_64
> +void setup_sigtramp(abi_ulong sigtramp_page)
> +{
> +    uint16_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 2 * 8, 0);

Shouldn't this be 8 + 7?

> +    assert(tramp != NULL);
> +
> +    default_sigreturn = sigtramp_page;
> +    install_sigtramp(tramp);
> +
> +    default_rt_sigreturn = sigtramp_page + 8;
> +    install_rt_sigtramp(tramp + 8);
> +
> +    unlock_user(tramp, sigtramp_page, 2 * 8);
> +}
> +#endif
> 


