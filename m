Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E005E6EE2
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 23:54:00 +0200 (CEST)
Received: from localhost ([::1]:60304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obU8t-0005g5-7T
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 17:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obU7u-0004Kr-Fv
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 17:52:58 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:37639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obU7s-0007DF-QO
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 17:52:58 -0400
Received: by mail-pl1-x636.google.com with SMTP id d24so10067582pls.4
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 14:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=if6bmvSKsaBnNIktSsr9BygGiOGPcZLK2+qPWQY+I8Q=;
 b=pzrzZoZsjTwq0XNe56drHDqsxDp7gBfWdPbWC4rt2H5R39L+OGEj+zrr5t8Mq4IrxG
 Mt2/nnh5zDrJXCq8HjPdFJP3E/0LhfQs+UXWmpMiECR63NhfhMOCNbi3qC1lxT2g3nSb
 QtTAwyEe8SkY+f5ojGLzR8Mvfd/9lqBzpoqMjw0fiGZe7+ZZNwvv9B1TOtxBiBIpAXA1
 ZNUBxoSVtsIjhMdk30I3D67vJrsVP7294xM1/d7kPETtmPiK2ny5Wx0Kx6kbgE85MxH+
 y/rql3TyAvj5tXH6wvmJvMbHyEEXB3UNdN8R6B07ZEiIVzoAAdE1fwHH0PApALHIDhNO
 QRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=if6bmvSKsaBnNIktSsr9BygGiOGPcZLK2+qPWQY+I8Q=;
 b=PzbDia/4Vuv+1DTYuzaCpovfqMa9ybaJm0vCroam+M/h1LM5xDLeNR+Fmj+NHakrBl
 wqGUxzRCq8QjW0OWbfdXiE74gIsZU2Mr3gDA+K0zvSRvOEGIx0/Bn7bp/0DBe1tA97ss
 3GlILfKWyZYTzoUz86rT1Kt+MrFiKawrQL/Aq+ex8c4JB3Aj7enwfh1TY0syu83pXHUr
 Xn27ICpt1ZmC28pTVgiRIVlEE1Hs7Hat+7tBlQfrRAaByI98gdLvNQen14idVBXOtX4Y
 n3EMIshSzMzewalTuruU6KyTtM9jAJFPSGr/0j1okj4SSjcdNhKFnCU5CcCIm0h/FKLV
 oR1A==
X-Gm-Message-State: ACrzQf2SXGsZjYDbsO5br60BiIQ+w9kWqK6Wtlts72OSD85w+lApeYVP
 wzuYvNO/ETIbK0AgD9OroZ8=
X-Google-Smtp-Source: AMsMyM61hHVf6UplTn/7JYhhc7r+rMhb8XpkmmQ+vVzd3yKOgiQoftY3FYHMhBk81gBJikhJGcIwfQ==
X-Received: by 2002:a17:90b:3b92:b0:203:a4c6:383c with SMTP id
 pc18-20020a17090b3b9200b00203a4c6383cmr5834697pjb.92.1663883575325; 
 Thu, 22 Sep 2022 14:52:55 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a27-20020aa794bb000000b0052dbad1ea2esm4927259pfl.6.2022.09.22.14.52.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 14:52:54 -0700 (PDT)
Message-ID: <3220202f-40d4-fe47-d521-a804614d9390@amsat.org>
Date: Thu, 22 Sep 2022 23:52:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH] KVM: dirty ring: Add memory barrier when marking pfn
 collected
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: Marc Zyngier <maz@kernel.org>, Gavin Shan <gshan@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220922213522.68861-1-peterx@redhat.com>
In-Reply-To: <20220922213522.68861-1-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.893,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 22/9/22 23:35, Peter Xu wrote:
> Following commit 4802bf910eee9, add the other missing barrier when marking
> the PFN as collected.  This will also be required just like 4802bf910eee9
> on weak ordering architectures like aarch64.
> 
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Gavin Shan <gshan@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   accel/kvm/kvm-all.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 136c8eaed3..60a044048e 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -728,7 +728,11 @@ static bool dirty_gfn_is_dirtied(struct kvm_dirty_gfn *gfn)
>   
>   static void dirty_gfn_set_collected(struct kvm_dirty_gfn *gfn)
>   {
> -    gfn->flags = KVM_DIRTY_GFN_F_RESET;
> +    /*
> +     * Write the flags after reading the entry.  Should pair with another
> +     * smp_load_acquire() in KVM when reset dirty rings.
> +     */
> +    qatomic_store_release(&gfn->flags, KVM_DIRTY_GFN_F_RESET);
>   }
>   
>   /*

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

