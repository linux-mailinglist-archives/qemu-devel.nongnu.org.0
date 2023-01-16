Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBC766CE2C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 18:59:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHTll-0004O2-Py; Mon, 16 Jan 2023 12:59:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHTlS-0004Mm-LA
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:59:25 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHTlQ-0000vh-RR
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:59:22 -0500
Received: by mail-wr1-x432.google.com with SMTP id r30so3837246wrr.10
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 09:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ukkDcgyrvY4ES05G5zJH+eGMfYE/8B3Nc2xldFg/kAk=;
 b=etSmY939GeQuKsR3F7NuPxFQDgbc31egihqSjqJSJgHiaC86P84uk/m02bLofIoJke
 OAFfQXoBcVYA2h1/nyj5HGePBqWS62+XCor84QF7eL4SYyBEVTCszeFJ1j//xr0Y/hnT
 8k+so1K9Nd3rgtQW4h9nEi2LefiuhcqzOTnvTFUxU/DIfWDpUwe6I+5IxYo2fHcT/0jt
 TfPrFdPy+OK+WR+Vbm3meF42AnXNiuog2Mw/e3KCJeQjzxXpsvmVFwRtcooBHVBBIYOS
 vW1sPRXC7NyzB4MxCscm38S6NF6Bgs8R87yVnrQTphpUIbfd43wNcyfZcjFkLBlFnAej
 A3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ukkDcgyrvY4ES05G5zJH+eGMfYE/8B3Nc2xldFg/kAk=;
 b=55mc5y6R51ADFV9EGdNQognHoBag7834uDLqhgteMjgrllpO91g0KUoUTAqqRZ79Xl
 7vAbagSeL5dmD0h1BO+rcbcSVGSIbXh4yCOKdsnz1Q8e4HnyEv3lfGXxp4zAZl2sSBDQ
 Tkv6O8/CmRsZDd6uWhoOkbBhi8cP44/1y+1xaYrf+x4YUw9xBNlTvWNbc/3aCNreCziZ
 kGDdM/EO77/l2rsRMSxjp7/Linoxq3GuotPX8CQ7UBD2ehMQVY6F8HBRlRr+NFYTb+qV
 hYz43HFK5y338jq8E+VJO8oNKIjIxmE+4valjSdgy03nBDJ+B6liSAN0HYqAZ496BElz
 Glug==
X-Gm-Message-State: AFqh2kr9ifx8cHgySouiBp0WEVBGHmyIQZbf58dkOtUoyZWDaoShDmne
 JVLoINTyFnA2G8Xr6861u0k=
X-Google-Smtp-Source: AMrXdXt+xl4g+kh299gAowUOkviky1LuqathD5XqKswelL0jM9yGaxwqAr1WW2Jr7lJMP7DPgXvJ6Q==
X-Received: by 2002:adf:f642:0:b0:2bc:846a:8ea2 with SMTP id
 x2-20020adff642000000b002bc846a8ea2mr429830wrp.4.1673891959335; 
 Mon, 16 Jan 2023 09:59:19 -0800 (PST)
Received: from [192.168.6.176] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a5d6647000000b002bbeb700c38sm21687749wrw.91.2023.01.16.09.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 09:59:19 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <2be7e112-fffc-8adc-e034-d0ac8a0dd6cf@xen.org>
Date: Mon, 16 Jan 2023 17:59:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 23/51] i386/xen: implement HYPERVISOR_event_channel_op
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
References: <20230110122042.1562155-1-dwmw2@infradead.org>
 <20230110122042.1562155-24-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230110122042.1562155-24-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/01/2023 12:20, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Additionally set XEN_INTERFACE_VERSION to most recent in order to
> exercise the "new" event_channel_op.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> [dwmw2: Ditch event_channel_op_compat which was never available to HVM guests]
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/kvm/xen-emu.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
> index 7803e4a7a7..ff093328d7 100644
> --- a/target/i386/kvm/xen-emu.c
> +++ b/target/i386/kvm/xen-emu.c
> @@ -27,6 +27,7 @@
>   #include "standard-headers/xen/memory.h"
>   #include "standard-headers/xen/hvm/hvm_op.h"
>   #include "standard-headers/xen/vcpu.h"
> +#include "standard-headers/xen/event_channel.h"
>   
>   #include "xen-compat.h"
>   
> @@ -585,6 +586,24 @@ static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
>       return true;
>   }
>   
> +static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit,
> +                                    int cmd, uint64_t arg)
> +{
> +    int err = -ENOSYS;
> +
> +    switch (cmd) {
> +    case EVTCHNOP_init_control:
> +        err = -ENOSYS;
> +        break;

The commit comment doesn't explain why the above op is singled out for 
this treatment. I assume it is because there is no intention to 
implement FIFO event channels in subsequent patches, but it'd be nice to 
say so here.

   Paul

> +
> +    default:
> +        return false;
> +    }
> +
> +    exit->u.hcall.result = err;
> +    return true;
> +}
> +
>   static int kvm_xen_soft_reset(void)
>   {
>       CPUState *cpu;
> @@ -684,6 +703,9 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
>       case __HYPERVISOR_sched_op:
>           return kvm_xen_hcall_sched_op(exit, cpu, exit->u.hcall.params[0],
>                                         exit->u.hcall.params[1]);
> +    case __HYPERVISOR_event_channel_op:
> +        return kvm_xen_hcall_evtchn_op(exit, exit->u.hcall.params[0],
> +                                       exit->u.hcall.params[1]);
>       case __HYPERVISOR_vcpu_op:
>           return kvm_xen_hcall_vcpu_op(exit, cpu,
>                                        exit->u.hcall.params[0],


