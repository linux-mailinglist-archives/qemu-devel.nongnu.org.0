Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 884ED36E5D8
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 09:23:17 +0200 (CEST)
Received: from localhost ([::1]:47250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc112-0004ss-Ke
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 03:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0z5-0003CN-3I
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:21:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0z1-0008Le-9S
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:21:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619680869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=seW0PvZDF9NUifOLj2OfNQivSotTggrhtBTQffN7k+Y=;
 b=b9k2jEqV/wbZ1CDCNM8isbQjo98aqAzzCiDmb7ZSEXg6BZoYP/ZN7RzpFdpCwuaxh3cMsG
 o/vi+xlVocZqaZNkmeYh7NMGne3FLWoqCBrmbBdEnhdAGS4Zo8iP3QVubL8FPVsB1DEkzs
 DsVym/3usZhvuZ8JqGqFc6jHfOzF774=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-mpsLuDLjMRCOSniJjwbHRg-1; Thu, 29 Apr 2021 03:21:07 -0400
X-MC-Unique: mpsLuDLjMRCOSniJjwbHRg-1
Received: by mail-wr1-f71.google.com with SMTP id
 67-20020adf81490000b029010756d109e6so12051069wrm.13
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 00:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=seW0PvZDF9NUifOLj2OfNQivSotTggrhtBTQffN7k+Y=;
 b=iSQWY6ed2sL6j9Mq5+q+b1xXShhibTK3JLFgEvS7s8y/2Kdv5u8sUxPS3xnV7ZJlvJ
 gOwUfHa4vTIxvvoNsFyH1UE6K2yzL+RgqmmP2AbE/YNokVqPINagKuJu6DZVjIgfMm6v
 7EyN/ZzFFMzkVroKlMc9VmGqvKWuq0zS13KmygNNSTqd/TNFrH1kFbm4gN3KMLBC/ffR
 3hQoZpf2sknOH4bNNADcJOyxQ5Ezu5hFlDOsdVgrPuabaPlMovomwOhK9FmBRcxCs97s
 npBmgv0TSmzNxoVRg717bt0e5IM1dCbigC7jFYmPpdbHwAOJEiNFP96ctsQ6aDidJNN9
 w7Vw==
X-Gm-Message-State: AOAM533jZQv06UfDEsjAXfH4WM5VHK76Exbr6ZPmC2M/PtXue1+uDPyp
 Wa4R5Gy/Y93EGTLaPfYxgpPhT2avHhsdQ7oea/bC3Jc3q7V0CGfzklwb9eABRfFAKVyOGZjptxU
 +Twfk/t5dGJhfWVM=
X-Received: by 2002:a1c:4c09:: with SMTP id z9mr35050030wmf.104.1619680866557; 
 Thu, 29 Apr 2021 00:21:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGLmH//WOiuj5RPMNDtZ8B+Czu0eMxhy73NxMRRiPONKt21Cigx5/odnB/SNu7C4Ro69fBlw==
X-Received: by 2002:a1c:4c09:: with SMTP id z9mr35050005wmf.104.1619680866297; 
 Thu, 29 Apr 2021 00:21:06 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6158.dip0.t-ipconnect.de. [91.12.97.88])
 by smtp.gmail.com with ESMTPSA id
 s83sm2445694wms.16.2021.04.29.00.21.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 00:21:06 -0700 (PDT)
Subject: Re: [PATCH v2 11/15] linux-user/s390x: Add stub sigframe argument for
 last_break
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210428193408.233706-1-richard.henderson@linaro.org>
 <20210428193408.233706-12-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <06f6587a-6ccb-29a7-ffd4-4b4cd56fdde3@redhat.com>
Date: Thu, 29 Apr 2021 09:21:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428193408.233706-12-richard.henderson@linaro.org>
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
> In order to properly present these arguments, we need to add
> code to target/s390x to record LowCore parameters for user-only.
> 
> But in the meantime, at least zero the missing last_break
> argument, and fixup the comment style in the vicinity.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/s390x/signal.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
> index 17f617c655..bc41b01c5d 100644
> --- a/linux-user/s390x/signal.c
> +++ b/linux-user/s390x/signal.c
> @@ -167,13 +167,16 @@ void setup_frame(int sig, struct target_sigaction *ka,
>                     | (env->psw.mask & ~PSW_MASK_ASC);
>       env->psw.addr = ka->_sa_handler;
>   
> -    env->regs[2] = sig; //map_signal(sig);
> +    env->regs[2] = sig;
>       env->regs[3] = frame_addr += offsetof(typeof(*frame), sc);
>   
> -    /* We forgot to include these in the sigcontext.
> -       To avoid breaking binary compatibility, they are passed as args. */
> -    env->regs[4] = 0; // FIXME: no clue... current->thread.trap_no;
> -    env->regs[5] = 0; // FIXME: no clue... current->thread.prot_addr;
> +    /*
> +     * We forgot to include these in the sigcontext.
> +     * To avoid breaking binary compatibility, they are passed as args.
> +     */
> +    env->regs[4] = 0; /* FIXME: regs->int_code & 127 */
> +    env->regs[5] = 0; /* FIXME: regs->int_parm_long */
> +    env->regs[6] = 0; /* FIXME: current->thread.last_break */
>   
>       /* Place signal number on stack to allow backtrace from handler.  */
>       __put_user(env->regs[2], &frame->signo);
> @@ -223,9 +226,10 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>                     | (env->psw.mask & ~PSW_MASK_ASC);
>       env->psw.addr = ka->_sa_handler;
>   
> -    env->regs[2] = sig; //map_signal(sig);
> +    env->regs[2] = sig;
>       env->regs[3] = frame_addr + offsetof(typeof(*frame), info);
>       env->regs[4] = frame_addr + offsetof(typeof(*frame), uc);
> +    env->regs[5] = 0; /* FIXME: current->thread.last_break */
>   }
>   
>   static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


