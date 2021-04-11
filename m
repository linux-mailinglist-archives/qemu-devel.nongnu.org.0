Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D50335B5DB
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Apr 2021 17:14:59 +0200 (CEST)
Received: from localhost ([::1]:40122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVbnd-0000Go-Kl
	for lists+qemu-devel@lfdr.de; Sun, 11 Apr 2021 11:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lVbl7-0007CP-7g
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 11:12:21 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:39431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lVbl4-0002UB-4F
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 11:12:20 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so7355316pjb.4
 for <qemu-devel@nongnu.org>; Sun, 11 Apr 2021 08:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oueEKSaZSnM6Q+qYiSUe7MsgjpSyI2bL0eJcoN80/lQ=;
 b=thiThM+GBixjqbIo9YYarv4cF4iJG1TNejjbKZZG8/gZunx+Gs9MFClLvwjIxdOTgn
 a62VBEZaCxKSoIKBzl0HjneFt+oWK0VjwqIfsBQYz3SUaAS+IF7MskFTkK7ghO3F+mDo
 E8buMYHZg+uP123ZXZ/9JPToUmP1SX7U302PM+47o0mSCiXoWOkOuk8DyKD64JCYz6Rv
 5mtD4oI12//To+i7NBxkmURO/9aEj6zkqCEpo4NNLH5v7Ea3hT4z/Sxv7SFLXMM8uJmK
 dUn4bO6A7jJ8T0YIWCrrF2cO/JM9Tjxo1LDaPO3N2RkWDN0X9XKq4xQOfnBmYtxFPMOo
 lhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oueEKSaZSnM6Q+qYiSUe7MsgjpSyI2bL0eJcoN80/lQ=;
 b=fn/ETx67HFtlapNUWQf0ZgehAu1KJo9ABe99AvzBdk6WgY2OMiFecmB6mMGn5zELmv
 1+EsFr5QLXQJ4eVAEyVCv9Lz1Kkt7R9y0tiH+E6MrAB/YWo/KqeVGgOW3nBVg1eu+0jL
 aaMXASu1MHCu0esxxvJK/dwD3An3xg6Ptc4s6pL7ZgshUPB+bTw/s/Mss4+l2ww7+Zl8
 cKQU4Gy+XRF/f5XyHt4n5CQxtJSf+davbAg7WQDUfHdODNUKWzh75Pjbgtn/UMRgH/5H
 4jO7+NXWcaBBBYiuQuDLXs9Atc/q+Uij9/danvm8e0n8LBDTtaUy7pVr4OSyTRqDEVbE
 nEPA==
X-Gm-Message-State: AOAM532SnMRTiFXp181unxPWSOnr5YY8GjG6RCj0tNgrRQQSo6ZII9wq
 gVvtF1f8aAzNPU2K2PmMSGerPA==
X-Google-Smtp-Source: ABdhPJwsY/pkPKC1bSWeLcAmMJtv63TIBQgJzeAMcjfoYY0j+Xy32fLoKjlfTivQfCbcQJC4DYRFCQ==
X-Received: by 2002:a17:90a:24b:: with SMTP id t11mr2483679pje.0.1618153934527; 
 Sun, 11 Apr 2021 08:12:14 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id w124sm7347478pfb.73.2021.04.11.08.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Apr 2021 08:12:14 -0700 (PDT)
Subject: Re: [PATCH 1/1] Set TARGET_PAGE_BITS to be 10 instead of 8 bits
To: Michael Rolnik <mrolnik@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210320220949.40965-1-mrolnik@gmail.com>
 <20210320220949.40965-2-mrolnik@gmail.com> <YFnjLbU9+itpbvsf@work-vm>
 <CAK4993iuteYNiM3acyGPNb5guwkfr3fKxJDecqcwKRdFTgG0sw@mail.gmail.com>
 <CAK4993gND7R1RBfimMdJXpJDvFdZiULdE2WKPKH+UnNaFm0iww@mail.gmail.com>
 <CAK4993iPwu2ESggMx05C0USrnSigHJq=-iP=BU-FhDXDcRH5gw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a57eed31-78c3-8ea5-579a-cb4edd1afbd3@linaro.org>
Date: Sun, 11 Apr 2021 08:12:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAK4993iPwu2ESggMx05C0USrnSigHJq=-iP=BU-FhDXDcRH5gw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/10/21 10:24 AM, Michael Rolnik wrote:
> Please review.


The first 256b is i/o, the next 768b are ram.  But having changed the page 
size, it should mean that the first 1k are now treated as i/o.

We do have a path by which instructions in i/o pages can be executed.  This 
happens on some ARM board setups during cold boot.  But we do not save those 
translations, so they run much much slower than it should.

But perhaps in the case of AVR, "much much slower" really isn't visible?

In general, I think changing the page size is wrong.  I also assume that 
migration is largely irrelevant to this target.


r~

> 
> On Tue, Mar 23, 2021 at 10:28 PM Michael Rolnik <mrolnik@gmail.com 
> <mailto:mrolnik@gmail.com>> wrote:
> 
>     If I set TARGET_PAGE_BITS to 12 this *assert assert(v_l2_levels >= 0);*
>     will fail (page_table_config_init function) because
>     TARGET_PHYS_ADDR_SPACE_BITS is 24 bits, because AVR has 24 is the longest
>     pointer AVR has. I can set TARGET_PHYS_ADDR_SPACE_BITS to 32 and
>     TARGET_PAGE_BITS to 12 and everything will work fine.
>     What do you think?
> 
>     btw, wrote the original comment, you David referred to, when I did not know
>     that QEMU could map several regions to the same page, which is not true.
>     That's why I could change 8 to 10.
> 
>     On Tue, Mar 23, 2021 at 10:11 PM Michael Rolnik <mrolnik@gmail.com
>     <mailto:mrolnik@gmail.com>> wrote:
> 
>         how long?
> 
>         On Tue, Mar 23, 2021 at 2:46 PM Dr. David Alan Gilbert
>         <dgilbert@redhat.com <mailto:dgilbert@redhat.com>> wrote:
> 
>             * Michael Rolnik (mrolnik@gmail.com <mailto:mrolnik@gmail.com>) wrote:
>              > Signed-off-by: Michael Rolnik <mrolnik@gmail.com
>             <mailto:mrolnik@gmail.com>>
>              > ---
>              >  target/avr/cpu-param.h | 8 +-------
>              >  target/avr/helper.c    | 2 --
>              >  2 files changed, 1 insertion(+), 9 deletions(-)
>              >
>              > diff --git a/target/avr/cpu-param.h b/target/avr/cpu-param.h
>              > index 7ef4e7c679..9765a9d0db 100644
>              > --- a/target/avr/cpu-param.h
>              > +++ b/target/avr/cpu-param.h
>              > @@ -22,13 +22,7 @@
>              >  #define AVR_CPU_PARAM_H
>              >
>              >  #define TARGET_LONG_BITS 32
>              > -/*
>              > - * TARGET_PAGE_BITS cannot be more than 8 bits because
>              > - * 1.  all IO registers occupy [0x0000 .. 0x00ff] address
>             range, and they
>              > - *     should be implemented as a device and not memory
>              > - * 2.  SRAM starts at the address 0x0100
> 
>             I don't know AVR; but that seems to say why you can't make it any
>             larger
>             - how do you solve that?
> 
>             Dave
> 
>              > -#define TARGET_PAGE_BITS 8
>              > +#define TARGET_PAGE_BITS 10
>              >  #define TARGET_PHYS_ADDR_SPACE_BITS 24
>              >  #define TARGET_VIRT_ADDR_SPACE_BITS 24
>              >  #define NB_MMU_MODES 2
>              > diff --git a/target/avr/helper.c b/target/avr/helper.c
>              > index 35e1019594..da658afed3 100644
>              > --- a/target/avr/helper.c
>              > +++ b/target/avr/helper.c
>              > @@ -111,8 +111,6 @@ bool avr_cpu_tlb_fill(CPUState *cs, vaddr
>             address, int size,
>              >      MemTxAttrs attrs = {};
>              >      uint32_t paddr;
>              >
>              > -    address &= TARGET_PAGE_MASK;
>              > -
>              >      if (mmu_idx == MMU_CODE_IDX) {
>              >          /* access to code in flash */
>              >          paddr = OFFSET_CODE + address;
>              > --
>              > 2.25.1
>              >
>             -- 
>             Dr. David Alan Gilbert / dgilbert@redhat.com
>             <mailto:dgilbert@redhat.com> / Manchester, UK
> 
> 
> 
>         -- 
>         Best Regards,
>         Michael Rolnik
> 
> 
> 
>     -- 
>     Best Regards,
>     Michael Rolnik
> 
> 
> 
> -- 
> Best Regards,
> Michael Rolnik


