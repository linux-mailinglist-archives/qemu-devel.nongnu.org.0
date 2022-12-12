Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC39A64A503
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 17:39:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4loN-0005RR-4W; Mon, 12 Dec 2022 11:37:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4loK-0005R5-Ot
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:37:48 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4loI-000655-WD
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:37:48 -0500
Received: by mail-wr1-x430.google.com with SMTP id m14so12682126wrh.7
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 08:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=QiDuDdCaMjafgx1tQnaOl8mhe69zk7CS2gsURtvapDE=;
 b=PV4ezaZVL9ntj6dayekwsRkI/lOLF0mmSNNtAtOg9kAL8qHczMAb8EeZWPS8ujuXhE
 9zCbJbqZ9ryWmJ0p0E0Omi1C2pTvjAynZMz3vvSSq6C4pkQGlkvkBIyevE+7cGDJrITD
 lWFv3RyyVO+6B4W1wbEg6SFQvHiTg9Gjgqyz7hbFTbKGcZG3H1e9I8dsO1oxftkhoYpP
 myLu6c2jQgZakZofBxRgM4d4RO4SSErUq2xfm4f657ILek4/lBINBZ6Nk+Q1yBoBLJ9d
 OkZMU29naYVZdRrdXnEafncf80D/spMzO+oXNiNwnX3sf4tQiuQUYp2vRr8JcXj1SbWz
 WU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QiDuDdCaMjafgx1tQnaOl8mhe69zk7CS2gsURtvapDE=;
 b=IkqzVli3pPCm9Xifa2XI5Rs7po99sET5f2Y3vt6kJJ7Hyu9eXShLxjQ+cYDMpaHzDe
 MIT7KALcpDiDFf9u+tvT/gwnUtWP9104e3nLn8BkvzrG9qUCGz3jFXarngFCklLsC/6f
 hBuxDOZHwffqoCTBkfH8TYTJFOu9hxqf+2c74L7kOfwsqXjXTqfsnv7V9ea4Ao+ZlX5e
 Iezh4xIXkhcxBqW6xkEG5m4DXfHAG8fV3fEIHkTO95LF2YN9Y1lMhlNyDEYi7uLNu9Wv
 /NtynkRxGHrCh8ejsCaTJ3M67wOXfggke71df+HA9p4iqWeX00rs0LzWhJ7QpX+/LCMB
 ycWw==
X-Gm-Message-State: ANoB5pnzD0/ctHOKv9a3ysDGts2LV6bAYVtdzj2erLpSPe3uXQ6waCZe
 yF59zNfF5LTgTfGLUAn0j7c=
X-Google-Smtp-Source: AA0mqf7F9DHb0Zi6Tu4QNwlmUi1ZRH/mkaq0OJ4fUe0zmlCLbtF+tLIcBuFwKd1g9y4sI+PFyUZjsw==
X-Received: by 2002:a5d:4cd2:0:b0:242:368:7665 with SMTP id
 c18-20020a5d4cd2000000b0024203687665mr10409043wrt.60.1670863065489; 
 Mon, 12 Dec 2022 08:37:45 -0800 (PST)
Received: from [192.168.4.46] (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id
 h20-20020adfaa94000000b002367ad808a9sm9323405wrc.30.2022.12.12.08.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 08:37:45 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <c396f138-0f3d-5ffa-1062-6149478d187e@xen.org>
Date: Mon, 12 Dec 2022 16:37:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 22/22] i386/xen: implement HYPERVISOR_sched_op
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-23-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221209095612.689243-23-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 09/12/2022 09:56, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> It allows to shutdown itself via hypercall with any of the 3 reasons:
>    1) self-reboot
>    2) shutdown
>    3) crash
> 
> Implementing SCHEDOP_shutdown sub op let us handle crashes gracefully rather
> than leading to triple faults if it remains unimplemented.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/xen.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
> 
> diff --git a/target/i386/xen.c b/target/i386/xen.c
> index f102c40f04..5f3b91450d 100644
> --- a/target/i386/xen.c
> +++ b/target/i386/xen.c
> @@ -17,6 +17,7 @@
>   #include "trace.h"
>   #include "hw/i386/kvm/xen_overlay.h"
>   #include "hw/i386/kvm/xen_evtchn.h"
> +#include "sysemu/runstate.h"
>   
>   #define __XEN_INTERFACE_VERSION__ 0x00040400
>   
> @@ -25,6 +26,7 @@
>   #include "standard-headers/xen/hvm/hvm_op.h"
>   #include "standard-headers/xen/hvm/params.h"
>   #include "standard-headers/xen/vcpu.h"
> +#include "standard-headers/xen/sched.h"
>   #include "standard-headers/xen/event_channel.h"
>   
>   static bool kvm_gva_to_gpa(CPUState *cs, uint64_t gva, uint64_t *gpa,
> @@ -491,6 +493,45 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit,
>       return true;
>   }
>   
> +static int schedop_shutdown(CPUState *cs, uint64_t arg)
> +{
> +    struct sched_shutdown shutdown;
> +
> +    if (kvm_copy_from_gva(cs, arg, &shutdown, sizeof(shutdown))) {
> +        return -EFAULT;
> +    }
> +
> +    if (shutdown.reason == SHUTDOWN_crash) {
> +        cpu_dump_state(cs, stderr, CPU_DUMP_CODE);
> +        qemu_system_guest_panicked(NULL);
> +    } else if (shutdown.reason == SHUTDOWN_reboot) {
> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> +    } else if (shutdown.reason == SHUTDOWN_poweroff) {
> +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +    }

Why not a switch() statement? I think it would look neater and be more 
consistent with other code.
With that change...

Reviewed-by: Paul Durrant <paul@xen.org>


