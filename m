Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 978E56437E1
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 23:18:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Jmi-0007aM-9J; Mon, 05 Dec 2022 17:18:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2Jmg-0007ZV-Ca
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 17:17:58 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2Jme-00033P-HS
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 17:17:58 -0500
Received: by mail-wr1-x42c.google.com with SMTP id bx10so21031289wrb.0
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 14:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ah3WxnIdiutjlIQwFzBbBczSYCKs7qmgqBQmDKrvhXE=;
 b=znaTB1Gi9oFo4Z3664b82NSHeG2BB1DnDQfaKcWWE35et6lW3rF7iZefzX75xoS6Up
 AMRMIHCQIihLQPjxBauZZzc5BtWWC9ZH8XfjYavQvNAG+2wixhPiYf/P4b9jn9Ov6+5D
 L/z4EXmqm1lrbpNXolxqfK4yfJJKOmWdCtule0ho/3bcyxjxJ7aqouiAGZy9L7Brj0mY
 mk1qrLGf/Dlc3umjYSfyyhZJNBZ0KH9XhaEcjyhZkcNv5FiWXyXX9JwYiWnCQwyp2v1D
 FlLuAA5rioRjXZDOgPaYHwdtNdEFzCHaDWj7Tok0eyzCrm4CTGsJmEgp16REJ7pbfZDm
 Kr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ah3WxnIdiutjlIQwFzBbBczSYCKs7qmgqBQmDKrvhXE=;
 b=Eqr+BZx19EA1qAtRGbFU2RqfdevKmXyld04Jcwhg2wZYL2ijR8u9c/v/ZwtqxBexqU
 jaHkhJ/DCXZXxZ6rc0Akm4qDfl01p9+2M2j8LckymeVBkQbvoP0GE9fKZVZSB/Dkt6bW
 jKO1LKISC/84LrNrWGF1ehTEZPiAa7aPNJ5/4MO5e72BNLBsWEx+ZCjn3lMJpxEpIG54
 IoZx6+sJA58XNVW6NlZax7HwsPwdFVjQU12kpq1tDyjcX9iXeg6RWIMHhOZtRwA3H5cM
 ewfl3MMN8rILxHePanrUQQPWX+4yWUqp3Cd10+m+TxPi6UBUCkoSOweXC9UGSnpTp573
 hImA==
X-Gm-Message-State: ANoB5pm2ofux1UTHzx+qjjOHoXLJZRn6CuVBszmBxeiEb1O6dMp0wsiW
 iLzICroAPCQUxNgqJzl8pCosgg==
X-Google-Smtp-Source: AA0mqf5SMz2BbK9k67GzONhIskNiKh8Nu60EXYKjlTm+4FkWk6U2lmqKbH5GIIT1FQx6UMjvxzWdtw==
X-Received: by 2002:a5d:5a8c:0:b0:242:5d58:3422 with SMTP id
 bp12-20020a5d5a8c000000b002425d583422mr4888630wrb.22.1670278671433; 
 Mon, 05 Dec 2022 14:17:51 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c358f00b003c6b874a0dfsm26407167wmq.14.2022.12.05.14.17.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 14:17:51 -0800 (PST)
Message-ID: <cbb522e1-3d8d-5332-7ac8-c0e054be33e2@linaro.org>
Date: Mon, 5 Dec 2022 23:17:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 12/21] i386/xen: set shared_info page
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>
References: <20221205173137.607044-1-dwmw2@infradead.org>
 <20221205173137.607044-13-dwmw2@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221205173137.607044-13-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/12/22 18:31, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> This is done by implementing HYPERVISOR_memory_op specifically
> XENMEM_add_to_physmap with space XENMAPSPACE_shared_info. While
> Xen removes the page with its own, we instead use the gfn passed
> by the guest.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   accel/kvm/kvm-all.c      |  6 ++++
>   include/hw/core/cpu.h    |  2 ++
>   include/sysemu/kvm.h     |  2 ++
>   include/sysemu/kvm_int.h |  3 ++
>   target/i386/cpu.h        |  8 ++++++
>   target/i386/trace-events |  1 +
>   target/i386/xen-proto.h  | 19 +++++++++++++
>   target/i386/xen.c        | 61 ++++++++++++++++++++++++++++++++++++++++
>   8 files changed, 102 insertions(+)
>   create mode 100644 target/i386/xen-proto.h


> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 8830546121..e57b693528 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -443,6 +443,8 @@ struct CPUState {
>   
>       /* track IOMMUs whose translations we've cached in the TCG TLB */
>       GArray *iommu_notifiers;
> +
> +    struct XenState *xen_state;

Since you define a type definition below, use it.

>   };
>   
>   typedef QTAILQ_HEAD(CPUTailQ, CPUState) CPUTailQ;
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index e9a97eda8c..8e882fbe96 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -582,4 +582,6 @@ bool kvm_arch_cpu_check_are_resettable(void);
>   bool kvm_dirty_ring_enabled(void);
>   
>   uint32_t kvm_dirty_ring_size(void);
> +
> +struct XenState *kvm_get_xen_state(KVMState *s);

Ditto.

>   #endif
> diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
> index 3b4adcdc10..0d89cfe273 100644
> --- a/include/sysemu/kvm_int.h
> +++ b/include/sysemu/kvm_int.h
> @@ -110,6 +110,9 @@ struct KVMState
>       struct KVMDirtyRingReaper reaper;
>       NotifyVmexitOption notify_vmexit;
>       uint32_t notify_window;
> +
> +    /* xen guest state */
> +    struct XenState xen;

Ditto.

>   };
>   
>   void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 5ddd14467e..09c0281b8b 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -23,6 +23,14 @@
>   #include "sysemu/tcg.h"
>   #include "cpu-qom.h"
>   #include "kvm/hyperv-proto.h"
> +#include "xen-proto.h"
> +
> +#ifdef TARGET_X86_64
> +#define TARGET_LONG_BITS 64
> +#else
> +#define TARGET_LONG_BITS 32
> +#endif


How come you don't have access to the definitions from "cpu-param.h" here?

Regards,

Phil.

