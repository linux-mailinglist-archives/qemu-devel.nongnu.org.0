Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4082D36E5C4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 09:17:21 +0200 (CEST)
Received: from localhost ([::1]:58848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc0vI-0006EC-9U
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 03:17:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0q7-0002Fx-S9
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:12:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0q3-00035r-Um
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:11:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619680315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hX2u8I2FGivD2Fj1KwoyLTG5vaM/nBOzZ417gy6nPGE=;
 b=NUg6kXxkM6fHhGvDmnVMXl53IbrIEi8/u54jCZQS8a1+4CodFlEvKDMMaghsKObDjo+qAv
 7fxn5pGJ4S0PXane3+hRvJLyEGZ46LL17VO8jsnqwNpx/e8z3XWr0YU0p076IYxWtj2h5m
 odII+krabpe5XE9nhZ0+ZVkcCewKNVg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-KXzalP6lO0ijEilxz5Z7zg-1; Thu, 29 Apr 2021 03:11:53 -0400
X-MC-Unique: KXzalP6lO0ijEilxz5Z7zg-1
Received: by mail-wr1-f71.google.com with SMTP id
 a7-20020adfc4470000b029010d875c66edso1114934wrg.23
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 00:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=hX2u8I2FGivD2Fj1KwoyLTG5vaM/nBOzZ417gy6nPGE=;
 b=b/SelnJaf+i4rUVpxwxBcaz/s6O9QGO27mXN808m6QPJK5cHeMS4QodmJoRVOHJzJ/
 iz3sbSmEFx44X5acdEyMxIIMV00NsxqouX3oV4Bb22GqrK52oNPkxlhadIMvbVq1jfuH
 2zE3Cy8iOqZA/pgr6GUzpCrXfVHKwOUOHnWv+VzO+DpqLiNrkx4vQ9U1jyUGUaaB3ikP
 U5vBgc2RR42XP9/V89lFEtIkrYswgaFkjkoiGo1ix/Re0c6XBhHOrT059Q7W9vlUnCb4
 TQexJa7pR2h7VQ/bQb0E5qM4pwhbva/e4I4q1LLah14DmbvCOEmRR+a8N5GHMu8DNGfw
 P0FQ==
X-Gm-Message-State: AOAM531Gcckho6nReBlzJDDCXaGBrIcw5TmKKMUGKtYIOz5oi7+QvFCd
 HZaEpiUY6dx0NkUf5keyyeK+I8UwaJ1SxO9TrCX4JyN67Mr94tXPQRrnEozgRxTJFxXheNz6buv
 8Mt3EiLhrZirf8xE=
X-Received: by 2002:adf:f3c1:: with SMTP id g1mr41841859wrp.344.1619680311815; 
 Thu, 29 Apr 2021 00:11:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyq1PePXO/H4QohqzUq1vWtjIiBIXBs+levK05vNk2YVOrx+xswnyzYoHm/3x4tl0BnAk9RzA==
X-Received: by 2002:adf:f3c1:: with SMTP id g1mr41841831wrp.344.1619680311610; 
 Thu, 29 Apr 2021 00:11:51 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6158.dip0.t-ipconnect.de. [91.12.97.88])
 by smtp.gmail.com with ESMTPSA id
 o62sm15052726wmo.3.2021.04.29.00.11.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 00:11:51 -0700 (PDT)
Subject: Re: [PATCH v2 04/15] linux-user/s390x: Remove restore_sigregs return
 value
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210428193408.233706-1-richard.henderson@linaro.org>
 <20210428193408.233706-5-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <fc86cdab-d1c8-6784-c7d2-227511eac307@redhat.com>
Date: Thu, 29 Apr 2021 09:11:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428193408.233706-5-richard.henderson@linaro.org>
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

On 28.04.21 21:33, Richard Henderson wrote:
> The function cannot fail.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/s390x/signal.c | 14 +++-----------
>   1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
> index 1dfca71fa9..e455a9818d 100644
> --- a/linux-user/s390x/signal.c
> +++ b/linux-user/s390x/signal.c
> @@ -230,10 +230,8 @@ give_sigsegv:
>       force_sigsegv(sig);
>   }
>   
> -static int
> -restore_sigregs(CPUS390XState *env, target_sigregs *sc)
> +static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
>   {
> -    int err = 0;
>       int i;
>   
>       for (i = 0; i < 16; i++) {
> @@ -251,8 +249,6 @@ restore_sigregs(CPUS390XState *env, target_sigregs *sc)
>       for (i = 0; i < 16; i++) {
>           __get_user(*get_freg(env, i), &sc->fpregs.fprs[i]);
>       }
> -
> -    return err;
>   }
>   
>   long do_sigreturn(CPUS390XState *env)
> @@ -271,9 +267,7 @@ long do_sigreturn(CPUS390XState *env)
>       target_to_host_sigset_internal(&set, &target_set);
>       set_sigmask(&set); /* ~_BLOCKABLE? */
>   
> -    if (restore_sigregs(env, &frame->sregs)) {
> -        goto badframe;
> -    }
> +    restore_sigregs(env, &frame->sregs);
>   
>       unlock_user_struct(frame, frame_addr, 0);
>       return -TARGET_QEMU_ESIGRETURN;
> @@ -297,9 +291,7 @@ long do_rt_sigreturn(CPUS390XState *env)
>   
>       set_sigmask(&set); /* ~_BLOCKABLE? */
>   
> -    if (restore_sigregs(env, &frame->uc.tuc_mcontext)) {
> -        goto badframe;
> -    }
> +    restore_sigregs(env, &frame->uc.tuc_mcontext);
>   
>       target_restore_altstack(&frame->uc.tuc_stack, env);
>   
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


