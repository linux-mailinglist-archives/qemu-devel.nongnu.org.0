Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3986AC221
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:03:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBQS-0001fW-Qi; Mon, 06 Mar 2023 09:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZBQP-0001Ss-IJ
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:02:49 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZBQN-0006fn-5P
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:02:49 -0500
Received: by mail-pl1-x62c.google.com with SMTP id i10so10383707plr.9
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 06:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678111365;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MyTch7R4kfBB/lbKYDGw6slk0pauoEKZsHvQ/AuD1uc=;
 b=p4ahT7veptnycPGoJ/fCrq79XF8AnaZVX5r8rFlRyAipo9dmt5y0TzF4zDD0gjZM8e
 J7gvQg3Rpl9eGZqXeifgFC0PdSATLpXfX42rBMPdHRW2YSmXLWzP34u/nmXy7iFonF9Y
 w+Cm6LIOUwi0QTzJVHky6p4qXct9wFik6WW512jtm/cNENCT9XsymUGYLalj1Wc4wSWp
 z/z/LhYga7Zh9jImJS9w1k0KFA7g15Zeu/PplAR7pOdRA8BMs+gUhJZFpdxmss7q+cq8
 v8/lzOIfKZD/MqyTINqAokM/LxKP92NHp0sDZRKMH9jeMpmlkhxbRVZ3EcGtmdo8ZXXQ
 H79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678111365;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MyTch7R4kfBB/lbKYDGw6slk0pauoEKZsHvQ/AuD1uc=;
 b=6k63H2peZVuAox5/bzllS46iAgfSAORhqJVbHtSas5tPI+CcMifldlj4+jQliAxPn8
 9DPeK4JbmyKJ/weh9T3lz6iHoRxM6Ava0D6IgOQZ/b81UocbgiXwEI+sga5atWkdE8si
 S049Oj1GJOlYXPE208SExJHVA0cuXlNkbOZD1CEjSJHEz2Vlnqbv60IbgUlPvSOFMWyp
 AE8HhNCbD0s3sYXOrkLlmz53PgwNxT8mxITm+6uPRDRUczyUYEdFsya8+MFbcieiS0dn
 VXxoGLG4fWB0mCCXGTzPXabVtZj+ZQ068NIKumnOMv+W80pB3Cahpnl6HqrQrflPJxBf
 RBRw==
X-Gm-Message-State: AO0yUKUkGKi9LqvrUNkwM4EVmnFTaegZclWiiCr92exKU1AVehkZnvgo
 jjycoQlWZHKz+0pw9s6biKB65nugwMscxwXu659NkA==
X-Google-Smtp-Source: AK7set/pXwnxOaHJp1Sn35HadJOg7jqj9z25O0eMgCtTDvzg7z2/6lRfgXz8NrlzAIGZ9TYZeYKuEa9cwoLNDR7uc7k=
X-Received: by 2002:a17:903:2581:b0:19a:8bc7:d814 with SMTP id
 jb1-20020a170903258100b0019a8bc7d814mr4194684plb.13.1678111365152; Mon, 06
 Mar 2023 06:02:45 -0800 (PST)
MIME-Version: 1.0
References: <20230227163718.62003-1-miguel.luis@oracle.com>
 <20230227163718.62003-3-miguel.luis@oracle.com>
In-Reply-To: <20230227163718.62003-3-miguel.luis@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 14:02:33 +0000
Message-ID: <CAFEAcA9ZzN0Xokh4kFcxtpv9hU512Km1EcaJHLG3JznVDF=Tew@mail.gmail.com>
Subject: Re: [RFC PATCH 2/5] hw/intc/gicv3: add support for setting KVM vGIC
 maintenance IRQ
To: Miguel Luis <miguel.luis@oracle.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 Haibo Xu <haibo.xu@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 27 Feb 2023 at 16:37, Miguel Luis <miguel.luis@oracle.com> wrote:
>
> From: Haibo Xu <haibo.xu@linaro.org>
>
> Use the VGIC maintenance IRQ if VHE is requested. As per the ARM GIC
> Architecture Specification for GICv3 and GICv4 Arm strongly recommends that
> maintenance interrupts are configured to use INTID 25 matching the
> Server Base System Architecture (SBSA) recomendation.

What does this mean for QEMU, though? If the issue is
"KVM doesn't support the maintenance interrupt being anything
other than INTID 25" then we should say so (and have our code
error out if the board tries to use some other value). If the
issue is "the *host* has to be using the right INTID" then I
would hope that KVM simply doesn't expose the capability if
the host h/w won't let it work correctly. If KVM can happily
use any maintenance interrupt ID that the board model wants,
then we should make that work, rather than hardcoding 25 into
our gicv3 code.

> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b871350856..377181e009 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -759,6 +759,11 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
>              qdev_prop_set_uint32(vms->gic, "redist-region-count[1]",
>                  MIN(smp_cpus - redist0_count, redist1_capacity));
>          }
> +
> +        if (kvm_irqchip_in_kernel()) {
> +            qdev_prop_set_bit(vms->gic, "has-virtualization-extensions",
> +                              vms->virt);
> +        }
>      } else {
>          if (!kvm_irqchip_in_kernel()) {
>              qdev_prop_set_bit(vms->gic, "has-virtualization-extensions",
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 351843db4a..e2a6ff1b49 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -563,6 +563,7 @@ static Property arm_gicv3_common_properties[] = {
>      DEFINE_PROP_UINT32("revision", GICv3State, revision, 3),
>      DEFINE_PROP_BOOL("has-lpi", GICv3State, lpi_enable, 0),
>      DEFINE_PROP_BOOL("has-security-extensions", GICv3State, security_extn, 0),
> +    DEFINE_PROP_BOOL("has-virtualization-extensions", GICv3State, virt_extn, 0),
>      /*
>       * Compatibility property: force 8 bits of physical priority, even
>       * if the CPU being emulated should have fewer.
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index 3ca643ecba..ce924753bb 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -22,6 +22,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/intc/arm_gicv3_common.h"
> +#include "hw/arm/virt.h"
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
>  #include "sysemu/kvm.h"
> @@ -803,6 +804,30 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>
> +
> +    if (s->virt_extn) {
> +        /*
> +         * Arm strongly recommends that maintenance interrupts are configured
> +         * to use INTID 25. For more information, see Server Base System
> +         * Architecture (SBSA)
> +         */
> +        uint32_t maint_irq = PPI(ARCH_GIC_MAINT_IRQ);
> +
> +        struct kvm_device_attr kdevattr = {
> +            .group = KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ,
> +            .addr = (uint64_t)&maint_irq
> +        };
> +
> +        if (!kvm_device_ioctl(s->dev_fd, KVM_GET_DEVICE_ATTR, &kdevattr)) {
> +            error_setg(errp, "VGICv3 setting maintenance IRQ are not "
> +                            "supported by this host kernel");
> +            return;
> +        }
> +
> +        kvm_device_ioctl(s->dev_fd, KVM_SET_DEVICE_ATTR, &kdevattr);
> +    }

So if I understand this correctly, the requirement here is basically
"tell the kernel which IRQ line is being used by the board code
for the maintenance interrupt", right? It seems to me that the
straightforward way to do that is to have an integer QOM property on
the GICv3 device like "maintenance-interrupt-id", and make the
board code set it (whether using KVM or not). The TCG implementation
doesn't care, and the KVM implementation can set it up in
kvm_arm_gicv3_realize(). Then you don't need to specifically tell
the GIC device that the guest is using the virtualization extensions.

thanks
-- PMM

