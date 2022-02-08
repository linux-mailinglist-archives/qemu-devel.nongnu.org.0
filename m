Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC0D4AD760
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 12:34:25 +0100 (CET)
Received: from localhost ([::1]:38058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHOlM-0001BG-AF
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 06:34:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nHOTS-0001mA-4g
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:15:54 -0500
Received: from [2a00:1450:4864:20::630] (port=35607
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nHOTO-0006Vd-Dm
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:15:52 -0500
Received: by mail-ej1-x630.google.com with SMTP id y3so30396580ejf.2
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=M7CoogV67zXlILUOo/6FjvWT63vYU5uPpnl6AA42FSs=;
 b=Z4/dcLICWa2XZ328MuoTJd/gyoyauZYNB1de7KSlchh1aTZ1D+qHYUa8kSHUtu5ltF
 xNdevPoMgsPz8liODfMpq0b1wP7s2KAwmy94lKnZOUnSyyfiIce92yKr9ai94ReaLn2n
 kR2LR42tA4HHf12sssSS9a9sJj675in88+p7yR3ATHF9jFZ2m5jwODEgZtYvoPxuDxlF
 8In0ze1vZc1IGl3NAwUU9h7u7Wf1AcNClaatCW0Qf18coq5Ke6Pq4xYWq7vN2s9jzjZa
 NmGxlfibZy6upxxlN60CNkpKe9yxMznisTL8EC+wJFanBZ6GM/6m8peQfuDODrdNGZ4s
 +CLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=M7CoogV67zXlILUOo/6FjvWT63vYU5uPpnl6AA42FSs=;
 b=fxoAJWxmkthhb3M2T0gmqiqjewcIGnEb84+TFf969dGsmxIyYVpu+ytOpU8lxUIzzN
 jqSGQW+OWyaThxOfhSrjfDM51xYgR7Y/Cb1W6opJo3KDhiw47Z2epWTHGYa2sDxNx/kE
 vwjD2ngCOarUl6ZFQLSqCYpp1TqTU9V0pPpVETXN03Ei00eHe+e5JKlka7ZWcFxYYqyD
 AtybXIwIGhfBLQporlANmA762MFQtXhOffTIRv4nICENjWzXtI62wqKQxAm83x4xJQ6B
 oYCE8+hX9Tc4tSBYw8r9eKJEpO7tepBORqaJRPuI5ztmuKlrfKZdGcqBrud8/el1U92Z
 Vv9A==
X-Gm-Message-State: AOAM530ieBxOPAknLidCrJL4GFG5na0pitYZWh/UIX8jXUMR+T5/rRd+
 7zhDCKV85oO/NKVVK81/03c=
X-Google-Smtp-Source: ABdhPJwPl/bV5nGha6oJqWF7zfVHs6KdID/yEmPlx335qlpPBtNBOOtTs2TxvWsDVQ8w6ZPX/mC62w==
X-Received: by 2002:a17:906:4806:: with SMTP id
 w6mr3360758ejq.755.1644318944883; 
 Tue, 08 Feb 2022 03:15:44 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id x12sm6439396edv.57.2022.02.08.03.15.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 03:15:44 -0800 (PST)
Message-ID: <ebeb936b-aa45-8fd7-6f1f-3b6bf8babd5f@redhat.com>
Date: Tue, 8 Feb 2022 12:15:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] memory: Fix qemu crash on starting dirty log twice
 with stopped VM
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20220207123019.27223-1-peterx@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220207123019.27223-1-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
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

On 2/7/22 13:30, Peter Xu wrote:
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
> Cc: Hyman Huang <huangy81@chinatelecom.cn>
> Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=2044818
> Fixes: 63b41db4bc ("memory: make global_dirty_tracking a bitmask")
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   softmmu/memory.c | 61 +++++++++++++++++++++++++++++++++++-------------
>   1 file changed, 45 insertions(+), 16 deletions(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 678dc62f06..8060c6de78 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2790,19 +2790,32 @@ void memory_global_after_dirty_log_sync(void)
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
> -    unsigned int old_flags = global_dirty_tracking;
> +    unsigned int old_flags;
> +
> +    assert(flags && !(flags & (~GLOBAL_DIRTY_MASK)));
>   
>       if (vmstate_change) {
> -        qemu_del_vm_change_state_handler(vmstate_change);
> -        vmstate_change = NULL;
> +        /* If there is postponed stop(), operate on it first */
> +        postponed_stop_flags &= ~flags;
> +        memory_global_dirty_log_stop_postponed_run();
>       }
>   
> -    assert(flags && !(flags & (~GLOBAL_DIRTY_MASK)));
> -    assert(!(global_dirty_tracking & flags));
> +    flags &= ~global_dirty_tracking;
> +    if (!flags) {
> +        return;
> +    }
> +
> +    old_flags = global_dirty_tracking;
>       global_dirty_tracking |= flags;
>       trace_global_dirty_changed(global_dirty_tracking);
>   
> @@ -2830,29 +2843,45 @@ static void memory_global_dirty_log_do_stop(unsigned int flags)
>       }
>   }
>   
> +/*
> + * Execute the postponed dirty log stop operations if there is, then reset
> + * everything (including the flags and the vmstate change hook).
> + */
> +static void memory_global_dirty_log_stop_postponed_run(void)
> +{
> +    /* This must be called with the vmstate handler registered */
> +    assert(vmstate_change);
> +
> +    /* Note: postponed_stop_flags can be cleared in log start routine */
> +    if (postponed_stop_flags) {
> +        memory_global_dirty_log_do_stop(postponed_stop_flags);
> +        postponed_stop_flags = 0;
> +    }
> +
> +    qemu_del_vm_change_state_handler(vmstate_change);
> +    vmstate_change = NULL;
> +}
> +
>   static void memory_vm_change_state_handler(void *opaque, bool running,
>                                              RunState state)
>   {
> -    unsigned int flags = (unsigned int)(uintptr_t)opaque;
>       if (running) {
> -        memory_global_dirty_log_do_stop(flags);
> -
> -        if (vmstate_change) {
> -            qemu_del_vm_change_state_handler(vmstate_change);
> -            vmstate_change = NULL;
> -        }
> +        memory_global_dirty_log_stop_postponed_run();
>       }
>   }
>   
>   void memory_global_dirty_log_stop(unsigned int flags)
>   {
>       if (!runstate_is_running()) {
> +        /* Postpone the dirty log stop, e.g., to when VM starts again */
>           if (vmstate_change) {
> -            return;
> +            /* Batch with previous postponed flags */
> +            postponed_stop_flags |= flags;
> +        } else {
> +            postponed_stop_flags = flags;
> +            vmstate_change = qemu_add_vm_change_state_handler(
> +                memory_vm_change_state_handler, NULL);
>           }
> -        vmstate_change = qemu_add_vm_change_state_handler(
> -                                memory_vm_change_state_handler,
> -                                (void *)(uintptr_t)flags);
>           return;
>       }
>   

Queued, thanks.

Paolo

