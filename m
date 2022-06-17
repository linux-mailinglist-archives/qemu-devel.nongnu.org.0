Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D51D54FDD5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 21:49:11 +0200 (CEST)
Received: from localhost ([::1]:57040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2Hxs-00025V-Am
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 15:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2HuU-00017c-Lt; Fri, 17 Jun 2022 15:45:38 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:44676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2HuS-0005IC-Uu; Fri, 17 Jun 2022 15:45:38 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1014b2752c1so6733458fac.11; 
 Fri, 17 Jun 2022 12:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=gJp3RuhiWD+2jvMVJw4i3nu2PHOgwEGW+bN1QWJEYCs=;
 b=HPqkXuGGPcljmQue49H8YbM2ifuqeMbgOMtVIb/Dtse+B1RyGZBOqp7vEdgbZZQdK4
 RS0S9zslhshIa9U4cn5U/Wtd7AJad6uiceS9LNLpfTtp0V1J5+1KcWaXbMlUD+oKo9+M
 RMTJ4jOh/64UKARvVP6bNVXvBIJ2yaNptx2qBGlrbSSs07hLP9lRyKBXZvHD8eyPGbCj
 MNVfPFiVBFMjhh+KqAFsmHjLCJJsV4YPsJy7UIyg6lTpCQGaBMK42FlgLDggY0q1SCKl
 t/T7rXna5T9AuHYAmi0hxgQqTR4A/miVkk7dV1nslqIHpygYxXc40aXqxeCM9gr9v3uF
 c51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gJp3RuhiWD+2jvMVJw4i3nu2PHOgwEGW+bN1QWJEYCs=;
 b=z7WEatZ1lU4N+lwm7uhAS2wCt50PiCCLQU6786XJms7riPQK9HLkO6NT8rOe5nrTJA
 pdCJGfSDFG1dWOuj6aRuASBztvx7WxzAenM5K/28OiL4az2isdyEczgFP90l/DHkgi0K
 RmxuqY8yJ+6HbApIUvTH8tgvl+OodAwTVR/a2j1R+1hzCHp4ACxa4O7JwpRv5qJIg5Kp
 8hpaDLnjFt/3PvwhzosWtBCrEqfLi4BsFO5TkUtc+melrjuNio1AQnh3AQ2T9OSqDWA+
 OSKq53UecW3VCfupM4nMxwORChenvhry25/Yj6/nezXXyZlm4yTELQs12H7Ur71htW1C
 5pOw==
X-Gm-Message-State: AJIora/Xz1W1fx4DLlL8VPgwxqJ6NzBVBL7QCahFveR8VjbU7s/CS1ui
 K4UwB+ODjPV0Ab7wKiLJCVo=
X-Google-Smtp-Source: AGRyM1v/hMFIJ9AdKpeG5IOWpgEZkvLiJxDRvrG8zULgcoqMWl53nfNlbOt89Zz103puwvRcKaMfcw==
X-Received: by 2002:a05:6870:b602:b0:f2:aa65:3e3 with SMTP id
 cm2-20020a056870b60200b000f2aa6503e3mr6750858oab.240.1655495134241; 
 Fri, 17 Jun 2022 12:45:34 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:ccc8:8e07:268b:a09:2834?
 ([2804:431:c7c6:ccc8:8e07:268b:a09:2834])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a4a3405000000b0035eb4e5a6b0sm3161857ooa.6.2022.06.17.12.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 12:45:33 -0700 (PDT)
Message-ID: <4acaa1cd-453f-b44b-b3db-5bdf522788a0@gmail.com>
Date: Fri, 17 Jun 2022 16:45:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] target/ppc: cpu_init: Clean up stop state on cpu reset
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, clg@kaod.org,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20220617095222.612212-1-fbarrat@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220617095222.612212-1-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Queued in gitlab.com/danielhb/qemu/tree/ppc-next after adding
Cedric's R-b from v1.


Thanks,

Daniel


On 6/17/22 06:52, Frederic Barrat wrote:
> The 'resume_as_sreset' attribute of a cpu is set when a thread is
> entering a stop state on ppc books. It causes the thread to be
> re-routed to vector 0x100 when woken up by an exception. So it must be
> cleared on reset or a thread might be re-routed unexpectedly after a
> reset, when it was not in a stop state and/or when the appropriate
> exception handler isn't set up yet.
> 
> Using skiboot, it can be tested by resetting the system when it is
> quiet and most threads are idle and in stop state.
> 
> After the reset occurs, skiboot elects a primary thread and all the
> others wait in secondary_wait. The primary thread does all the system
> initialization from main_cpu_entry() and at some point, the
> decrementer interrupt starts ticking. The exception vector for the
> decrementer interrupt is in place, so that shouldn't be a
> problem. However, if that primary thread was in stop state prior to
> the reset, and because the resume_as_sreset parameters is still set,
> it is re-routed to exception vector 0x100. Which, at that time, is
> still defined as the entry point for BML. So that primary thread
> restarts as new and ends up being treated like any other secondary
> thread. All threads are now waiting in secondary_wait.
> 
> It results in a full system hang with no message on the console, as
> the uart hasn't been init'ed yet. It's actually not obvious to realise
> what's happening if not tracing reset (-d cpu_reset). The fix is
> simply to clear the 'resume_as_sreset' attribute on reset.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
> Changelog:
> v2: rework commit message
> 
> 
>   target/ppc/cpu_init.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 0f891afa04..c16cb8dbe7 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -7186,6 +7186,9 @@ static void ppc_cpu_reset(DeviceState *dev)
>           }
>           pmu_update_summaries(env);
>       }
> +
> +    /* clean any pending stop state */
> +    env->resume_as_sreset = 0;
>   #endif
>       hreg_compute_hflags(env);
>       env->reserve_addr = (target_ulong)-1ULL;

