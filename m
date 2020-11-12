Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5C12B044B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 12:49:11 +0100 (CET)
Received: from localhost ([::1]:34786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdB6E-000645-UM
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 06:49:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdB5V-0005dO-EL
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 06:48:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdB5R-0000W6-Sr
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 06:48:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605181700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mv/kQJkstdqoRszeVZSl3uBwWes3IYOGVeUta6g9AFo=;
 b=RIoTopOH0V8eTDh2bYdQaHzj3P/fjGDXVhbbNqKhwXXtfPny41yofIVozRZs1YkAmSQc7c
 ogGaJ1hbnj0XxeG8d2E1jlUW9XTrYoqoTuKFsuxykGMo2Ii9NAdpveUl9AWFfQGGu+OjMI
 WtqkKInbluH7nw+R5d0fO5/oQpgHZ9E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-DukKl6FgMuytMhY2ORXkzQ-1; Thu, 12 Nov 2020 06:48:18 -0500
X-MC-Unique: DukKl6FgMuytMhY2ORXkzQ-1
Received: by mail-wm1-f71.google.com with SMTP id u9so1650936wmb.2
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 03:48:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mv/kQJkstdqoRszeVZSl3uBwWes3IYOGVeUta6g9AFo=;
 b=i5dVUMZzIabg4nTh0f8DmSdC3LlKzUmRHUNgz7H6lQuUNmSi/Qlc9bN08dUkzbuviL
 Mx99e2Y4FlsWwbhG5LthXoUmApgowfYLu6wxF5iEPq9saQTT00axLwIR/PAmn3DXi9lA
 74PgMAgO13RhH+UGAEpeE1YcvcB3ycIvr5xnObrg8a5dZbFyLvNWEWz3MgYIaKBi0Nhi
 KbhrhzLWon3MonMTkppg8Fhw+Qd0y3UGYm23J6M4mrmDdyuJ+Mzgrk/2ftFKUcPMmMLM
 wnINXUWLFGvLZYZsKkgyAX1dVBD9JUMOXD6vz4wci5Lo2ZxsUglIOwYk10wiFoEOSg+L
 r+yA==
X-Gm-Message-State: AOAM532k6xw+wSXnB/cat5BZoRaWFYxkKYYV7+DejsNTQQPOXj9YlfaV
 24ht6/6upseFMa/RkiIYRwSAU59ZttgWytH1beVK0SX2u09ZKrI72P5J2BWd8ITDhUxGBZJxjW0
 7Kd1KpSBgvQxEZsY=
X-Received: by 2002:a05:600c:21cc:: with SMTP id
 x12mr9117204wmj.8.1605181696996; 
 Thu, 12 Nov 2020 03:48:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrXU52jEZg32vBtHxbMtbQDwYzOC8dIzE/K2b/AZ3BP14eV+SLbLzWIJTKh3E5FcpCFiitUg==
X-Received: by 2002:a05:600c:21cc:: with SMTP id
 x12mr9117182wmj.8.1605181696734; 
 Thu, 12 Nov 2020 03:48:16 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id p3sm299295wrs.50.2020.11.12.03.48.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 03:48:15 -0800 (PST)
To: Bin Meng <bmeng.cn@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>, qemu-devel@nongnu.org
References: <1603361762-43062-1-git-send-email-bmeng.cn@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] target/i386: seg_helper: Correct segement selector
 nullification in the RET/IRET helper
Message-ID: <15131296-512a-f70c-5e9e-d422b3b26136@redhat.com>
Date: Thu, 12 Nov 2020 12:48:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1603361762-43062-1-git-send-email-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/10/20 12:16, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Per the SDM, when returning to outer privilege level, for segment
> registers (ES, FS, GS, and DS) if the check fails, the segment
> selector becomes null, but QEMU clears the base/limit/flags as well
> as nullifying the segment selector, which should be a spec violation.
> 
> Real hardware seems to be compliant with the spec, at least on one
> Coffee Lake board I tested.

This is all quite messy in QEMU; for performance reasons, it never even 
checks the flags on memory accesses, only on selector loads.  One way to 
fix it would be to define five extra hflags bits that copy the P bit of 
DS/ES/SS/FS/GS.  gen_lea_v_seg checks if the hflag is clear, and if so 
it generates a #GP or #SS.

Regarding your patch, I think at least the segment should be made 
"unusable".  On Intel processors there is an internal "unusable" flag, 
on AMD and in QEMU, equivalently, the P bit would be cleared in the 
flags.  As far as I know the difference is only visible with VMX.

That is, you'd need something like this:

         cpu_x86_load_seg_cache(env, seg_reg, 0,
                                env->segs[seg_reg].base,
                                env->segs[seg_reg].limit,
                                env->segs[seg_reg].flags & ~DESC_P_MASK);

Thanks,

Paolo

> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   target/i386/seg_helper.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/seg_helper.c b/target/i386/seg_helper.c
> index be88938..d8766d8 100644
> --- a/target/i386/seg_helper.c
> +++ b/target/i386/seg_helper.c
> @@ -2108,7 +2108,10 @@ static inline void validate_seg(CPUX86State *env, int seg_reg, int cpl)
>       if (!(e2 & DESC_CS_MASK) || !(e2 & DESC_C_MASK)) {
>           /* data or non conforming code segment */
>           if (dpl < cpl) {
> -            cpu_x86_load_seg_cache(env, seg_reg, 0, 0, 0, 0);
> +            cpu_x86_load_seg_cache(env, seg_reg, 0,
> +                                   env->segs[seg_reg].base,
> +                                   env->segs[seg_reg].limit,
> +                                   env->segs[seg_reg].flags);
>           }
>       }
>   }
> 



