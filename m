Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385AF6A94A7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:59:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY2CB-000872-Im; Fri, 03 Mar 2023 04:59:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY2C9-00086e-FB
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:59:21 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY2C7-0004Da-Q5
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:59:21 -0500
Received: by mail-wm1-x32c.google.com with SMTP id p26so1196898wmc.4
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 01:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677837558;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rfk5iKLO5t++ORx9LT4nS3HJErx0ZGQh//fKC86TjzA=;
 b=JG00VDiv1sCiOEep1y2qZgaoplqwgh687K733T90nFtL4juBdAsnLWJaNxz4YEaKsd
 +KV/ObKbpeD9gtYBUK2rfCrFFE9dZr0w6zvvqw68TPypBXIgcfkQcmybBMN+ufcJRB/N
 5UencHiatA4j/k7QkpzuBI7Jfj4CHf6Qo5XcnCxsPWEoSW6bEUc64ITnF5O6ArLhYHKb
 QQ4vlyPPNVMEf+b3HX9+Scn5uI8tCz/E3RP5PiSv2yMoMkx9zY29SVUAunagsrKXx1U0
 C+4mUvdOP56twd+bEuVcftquoHJKGtE//YrKSXhLJqplOtoQ6mifTWk6jfV8O8+8gUQ/
 r/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677837558;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rfk5iKLO5t++ORx9LT4nS3HJErx0ZGQh//fKC86TjzA=;
 b=TH8gBelZ85HptmaLUHLrPkfFpk8PTnhxnChaJhv5bmffT+vVRJkboiUDgTB8ZebyEI
 fGeMrUDXq2ceqCD9RqEbFxYSn58A3B3ws6cy92yiFLWXvuqml5iCh2u1lB+XLACFKnNA
 klGAqZw86IEoUL0llb7IffNNLtu8dtR08DU052g3bmVzIK10K6eRbXUXnCzJCAcJpliL
 aHBBxilscD1TXQYzmo+InFH2SpK1nmH8RTDp8w1faDUZUpxYk4d36yx4QwaHdn5yZ2Rm
 Lu0Bw3MFhfCtDIpLZsNypnbFegGVM4rvrvzvfzgZRb7gYGWfJyCMT9vMGB/GHKSzIO8Y
 Rxzg==
X-Gm-Message-State: AO0yUKWfQcRlYDt1hE/e0r/xn9LFPEc8DHdF1zX5ncL5gRGIJhSfXNf+
 IDywfylqkboG0OZzLf9XCjfMqw==
X-Google-Smtp-Source: AK7set+ItZ9oKGKlOmb8mMiB2sCHDHOKLNnMJ86Mlt704oVrwJJW68P9uw11KMYyyiOLeg4Itatjog==
X-Received: by 2002:a05:600c:3148:b0:3dc:1687:9ba2 with SMTP id
 h8-20020a05600c314800b003dc16879ba2mr1101776wmo.35.1677837558328; 
 Fri, 03 Mar 2023 01:59:18 -0800 (PST)
Received: from [192.168.59.175] (180.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.180]) by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c3b1200b003db0ad636d1sm6048066wms.28.2023.03.03.01.59.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 01:59:17 -0800 (PST)
Message-ID: <5da6862c-523b-91d4-f5b0-90bd0fb25059@linaro.org>
Date: Fri, 3 Mar 2023 10:59:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 3/6] Add the aehd-apic device type.
Content-Language: en-US
To: Haitao Shan <hshan@google.com>, qemu-devel@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Cc: Haitao Shan <haitao.shan@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 "open list:Android Emulator..." <emu-dev@google.com>,
 Fabiano Rosas <farosas@suse.de>
References: <20230303022618.4098825-1-hshan@google.com>
 <20230303022618.4098825-3-hshan@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230303022618.4098825-3-hshan@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

Hi Haitao,

On 3/3/23 03:26, Haitao Shan wrote:
> The aehd-apic device type represents the AEHD in kernel APIC.
> The irqchips should be always in kernel when AEHD is used.
> 
> Signed-off-by: Haitao Shan <hshan@google.com>
> ---
>   MAINTAINERS                  |   2 +
>   hw/i386/aehd/apic.c          | 204 +++++++++++++++++++++++
>   hw/i386/aehd/meson.build     |   4 +
>   hw/i386/meson.build          |   1 +
>   include/hw/core/cpu.h        |   7 +
>   include/sysemu/aehd.h        |  52 ++++++
>   target/i386/aehd/aehd-all.c  | 315 +++++++++++++++++++++++++++++++++++
>   target/i386/aehd/aehd.c      |  88 ++++++++++
>   target/i386/aehd/aehd_int.h  |  50 ++++++
>   target/i386/aehd/meson.build |   4 +
>   target/i386/cpu-sysemu.c     |   3 +
>   target/i386/meson.build      |   1 +
>   12 files changed, 731 insertions(+)
>   create mode 100644 hw/i386/aehd/apic.c
>   create mode 100644 hw/i386/aehd/meson.build
>   create mode 100644 target/i386/aehd/aehd-all.c
>   create mode 100644 target/i386/aehd/aehd.c
>   create mode 100644 target/i386/aehd/aehd_int.h
>   create mode 100644 target/i386/aehd/meson.build


> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index fb5d9667ca..5ed0600504 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -400,6 +400,13 @@ struct CPUState {
>       uint32_t kvm_fetch_index;
>       uint64_t dirty_pages;
>   
> +    /* Only used in AEHD */
> +#ifdef _WIN32
> +    HANDLE aehd_fd;
> +    struct AEHDState *aehd_state;
> +    struct aehd_run *aehd_run;
> +#endif

We are difficultly trying to make this structure generic
since 2 years now. Since AEHD won't make it to the 8.0 release,
I'd rather take the time to get this part well done.

IIRC we ought to use a AccelCPUState pointer here, allocated by
AccelCPUClass::cpu_instance_init()

>       /* Use by accel-block: CPU is executing an ioctl() */
>       QemuLockCnt in_ioctl_lock;
>   
> diff --git a/include/sysemu/aehd.h b/include/sysemu/aehd.h
> index 7ba4234f60..87fa2f8362 100644
> --- a/include/sysemu/aehd.h
> +++ b/include/sysemu/aehd.h
> @@ -14,6 +14,12 @@
>   #ifndef QEMU_AEHD_H
>   #define QEMU_AEHD_H
>   
> +#include "qemu/queue.h"
> +#include "qemu/accel.h"
> +#include "hw/core/cpu.h"
> +#include "exec/memattrs.h"
> +#include "hw/irq.h"
> +
>   #ifdef NEED_CPU_H
>   # ifdef CONFIG_AEHD
>   #  define CONFIG_AEHD_IS_POSSIBLE
> @@ -23,3 +29,49 @@
>   #endif
>   
>   #define aehd_enabled()           (0)
> +
> +struct aehd_run;
> +struct aehd_lapic_state;
> +struct aehd_irq_routing_entry;
> +
> +struct AEHDState;
> +
> +#define TYPE_AEHD_ACCEL ACCEL_CLASS_NAME("aehd")
> +typedef struct AEHDState AEHDState;
> +DECLARE_INSTANCE_CHECKER(AEHDState, AEHD_STATE,
> +                         TYPE_AEHD_ACCEL)
> +
> +extern AEHDState *aehd_state;
> +
> +#ifdef NEED_CPU_H
> +#include "cpu.h"
> +
> +/* internal API */
> +
> +int aehd_ioctl(AEHDState *s, int type, void *input, size_t input_size,
> +               void *output, size_t output_size);
> +int aehd_vm_ioctl(AEHDState *s, int type, void *input, size_t input_size,
> +                  void *output, size_t output_size);
> +int aehd_vcpu_ioctl(CPUState *cpu, int type, void *input, size_t input_size,
> +                    void *output, size_t output_size);
> +
> +/* Arch specific hooks */
> +
> +/* Notify arch about newly added MSI routes */
> +int aehd_arch_add_msi_route_post(struct aehd_irq_routing_entry *route,
> +                                 int vector, PCIDevice *dev);
> +/* Notify arch about released MSI routes */
> +int aehd_arch_release_virq_post(int virq);
> +
> +int aehd_set_irq(AEHDState *s, int irq, int level);
> +int aehd_irqchip_send_msi(AEHDState *s, MSIMessage msg);
> +
> +void aehd_put_apic_state(DeviceState *d, struct aehd_lapic_state *kapic);
> +void aehd_get_apic_state(DeviceState *d, struct aehd_lapic_state *kapic);
> +
> +#endif /* NEED_CPU_H */
> +
> +void aehd_irqchip_commit_routes(AEHDState *s);
> +void aehd_irqchip_release_virq(AEHDState *s, int virq);
> +
> +#endif


