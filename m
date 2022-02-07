Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 769764AB846
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 11:11:19 +0100 (CET)
Received: from localhost ([::1]:56132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH0zJ-00069E-LP
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 05:11:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nH00w-0007vn-DR
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 04:08:50 -0500
Received: from [2a00:1450:4864:20::435] (port=45000
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nH00u-0004Te-6p
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 04:08:50 -0500
Received: by mail-wr1-x435.google.com with SMTP id k18so23429289wrg.11
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 01:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jaiYqcnw8WRcj2ZtweCDRcOX+97VQCqLRG3mtpIU1EM=;
 b=I5B2Zx9J4p1IZrMnJqhBwv6dtqR1wlj7/VyE9D+m/4vA95yyj2DAGpYMHy+ckIzofO
 52xERuDvrivh+AJcznPXJ1dP4hUkSh8rVFvF4OzkOy/Lx4GkGZurxxU7HTsG2OBIuyIr
 VqAy4HeL5h6hnoGUxHRouvrG54LPDd/fJ/NO/NvRgF2+dz2f5CY4mRlX17AlXZwmNouA
 l0xd8Aqx0bG8gm7EtTufZTWlDMzzbadNUt5hgogeYpe+brnVQI1rMYJmyoNPEINMdAEY
 pkBBSidrPoZ+Lejy0Wkvunt9KkZ4yvnQXQgvJHF77Zn288P0TeIHaVp855r6fujqJW/l
 De3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jaiYqcnw8WRcj2ZtweCDRcOX+97VQCqLRG3mtpIU1EM=;
 b=h69b2aWZaWoVLIYf+Yne89GLq8TP2+piVQFlai/w6CKpRHWyiyfyR2zRUXNvUs/+Jy
 MM41GYGuqXAdyi6zUAPa9KK+/2bIkyQbuUlrgZPeSDPErqz+tK4YC2e3HxKjHkj1eIR9
 IElUvQN0GdDLhsQtONQ/EYJTsP8AaHecGrsvExhvHMhyXgbTBTmNwxczkjmbEih8A2G+
 ZiV91Ckv5WRLXsX0roEQKL1NUfrbCvuoTPr2tRLSud720cYqYL0SNtTorQtJUmunxMxK
 dZ//kSF3OXZotV0o/50jXon0wokhTD6DCfKiAukXfGDG01o/kCTPcTkBJenAqAFolVwm
 liUg==
X-Gm-Message-State: AOAM532nlxZELCyaggni3+0CYEw0H5cJDboiv3P4zEK6DPE8QsIGu12c
 QbsN/yTk4qifxKLCfxqO65I=
X-Google-Smtp-Source: ABdhPJxejsQophtNpNi46/MZbN6v31uir9CYxzmdgM3z7kojgZT8kw31z+6N8mpbXSE/hdJ+SAmE5Q==
X-Received: by 2002:a05:6000:1869:: with SMTP id
 d9mr9109221wri.432.1644224926454; 
 Mon, 07 Feb 2022 01:08:46 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id 24sm874613wmf.48.2022.02.07.01.08.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 01:08:45 -0800 (PST)
Message-ID: <77520dd3-1e7c-efc5-0bea-d53dcea6261f@redhat.com>
Date: Mon, 7 Feb 2022 10:08:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] memory: Fix qemu crash on starting dirty log twice with
 stopped VM
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20220207032622.19931-1-peterx@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220207032622.19931-1-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Hyman Huang <huangy81@chinatelecom.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/22 04:26, Peter Xu wrote:
> QEMU can now easily crash with two continuous migration carried out:
> 
> (qemu) migrate -d exec:cat>out
> (qemu) migrate_cancel
> (qemu) migrate -d exec:cat>out
> [crash] ../softmmu/memory.c:2782: memory_global_dirty_log_start: Assertion
> `!(global_dirty_tracking & flags)' failed.
> 
> It's because memory API provides a way to postpone dirty log stop if the VM is
> stopped, and that'll be re-done until the next VM start.  It was added in 2017
> with commit 1931076077 ("migration: optimize the downtime", 2017-08-01).
> 
> However the recent work on allowing dirty tracking to be bitmask broke it,
> which is commit 63b41db4bc ("memory: make global_dirty_tracking a bitmask",
> 2021-11-01).
> 
> The fix proposed in this patch contains two things:
> 
>    (1) Instead of passing over the flags to postpone stop dirty track, we add a
>        global variable (along with current vmstate_change variable) to record
>        what flags to stop dirty tracking.
> 
>    (2) When start dirty tracking, instead if remove the vmstate hook directly,
>        we also execute the postponed stop process so that we make sure all the
>        starts and stops will be paired.
> 
> This procedure is overlooked in the bitmask-ify work in 2021.
> 
> Actually with the postponed stop flags, a smarter thing to do is when start
> dirty logging with specific flag, we can ignore the start if the flag is
> contained in the "postponed to stop" flags, however that'll slightly complicate
> the code, and it shouldn't be a major use case for QEMU.  Considering that this
> should also copy stable, keep it simple while fixing the crash.
> 
> Cc: Hyman Huang <huangy81@chinatelecom.cn>
> Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=2044818
> Fixes: 63b41db4bc ("memory: make global_dirty_tracking a bitmask")
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   softmmu/memory.c | 53 ++++++++++++++++++++++++++++++++++--------------
>   1 file changed, 38 insertions(+), 15 deletions(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 678dc62f06..cbb9b241ea 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2790,16 +2790,25 @@ void memory_global_after_dirty_log_sync(void)
>       MEMORY_LISTENER_CALL_GLOBAL(log_global_after_sync, Forward);
>   }
>   
> +/*
> + * Dirty track stop flags that are postponed due to VM being stopped.  Should
> + * only be used within vmstate_change hook.
> + */
> +static unsigned int postponed_stop_flags;
>   static VMChangeStateEntry *vmstate_change;
> +static void memory_global_dirty_log_stop_postponed_run(void);
>   
>   void memory_global_dirty_log_start(unsigned int flags)
>   {
>       unsigned int old_flags = global_dirty_tracking;
>   
> -    if (vmstate_change) {
> -        qemu_del_vm_change_state_handler(vmstate_change);
> -        vmstate_change = NULL;
> -    }
> +    /*
> +     * If there is postponed dirty log stop flags, do it, so that start/stop
> +     * will always be paired.  A smarter thing to do is ignore start process if
> +     * the same flag has got postponed on stop, but it shouldn't matter a lot
> +     * in major user scenarios, so keep the code simple for now.
> +     */
> +    memory_global_dirty_log_stop_postponed_run();

I think this should be as easy as doing here:

     postponed_stop_flags &= ~flags;
     memory_global_dirty_log_stop_postponed_run();
     flags &= ~global_dirty_tracking_flags;
     if (!flags) {
         return;
     }

plus adding an "if (postponed_stop_flags)" in 
memory_global_dirty_log_stop_postponed_run?

Paolo

