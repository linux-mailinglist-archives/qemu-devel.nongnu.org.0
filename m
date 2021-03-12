Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DC633834D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 02:53:06 +0100 (CET)
Received: from localhost ([::1]:35060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKWzB-0000Lf-0K
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 20:53:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lKWxV-0007Ri-Gq
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 20:51:21 -0500
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:45085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lKWxT-000553-Qw
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 20:51:21 -0500
Received: by mail-il1-x12b.google.com with SMTP id s1so1144686ilh.12
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 17:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SK3L0XYlTVMAwGAOD07tBndXQUYZnquWpSvai5RWD9Y=;
 b=xQVUSLSPfNntT5pl+8O/9FytYstQe8bXKtWdu9AHYCJDDAWv8fiqUFBK8UnbLYATqJ
 GIBJLGIL5/UjO0iFkdNV9gkLJ+r4aub9ojdwbVbyUunHxZypuevYXhUjBbRewXu8D89f
 ztgMA/grJdGvYb7V43goHfwvabhDnSiFr5DLcAJr/hMpugRAfdpuAsQdBLTdoGQO9li2
 EnUz39Or1li7opzljgvRLXVK1p2ehEJQ9DcWwHD/WgV3UH6w5GxtNLiVKNdFt0OCcSiI
 JH6v+mWtWfL5/3/UwYpipmZ1Gq9iUtrXneh5rOwAfUPmqtGfXHMkosWycJLaHrS4Q615
 +18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SK3L0XYlTVMAwGAOD07tBndXQUYZnquWpSvai5RWD9Y=;
 b=D0R1y0NOUOgAtD5HNhNkrWd6axT+bNK4DX+IpV6RZXsdlSvrw5ewhe1MmhzSEMqF9G
 ssgVSyaJKTz5nG0EzZ6zn2WqXMBEgXG7GEnqtZI4Wa4ExeUhpiBPXiekue6DVmAxBncW
 XbMhyrQc1FHRsjDO10JqUSuqnG5NrEOTMY4gihlihoocOpmQiBfcqR7FXNJtgy4HNaAa
 jsibdmU2U7qaQAYjEAu8YvMSZOXZtJpfPyxfbjwanS1CTNPDk3ZUoWx0wdysFlA3SM3s
 eKS/irNCt8raaXDwdOCdKRP2ZYvsjuGIQWjXVNzxaTGACxru34Er3xiHe5GG9s7LcLpw
 CT4w==
X-Gm-Message-State: AOAM531xCvefokMmnaDiZUShjySpTw0d2SVS5zDmIq3WrE2tivVg71h9
 WKPikUOz5mkMOFOvnHSKG/MTok/eLZlGWvT9iWsW
X-Google-Smtp-Source: ABdhPJw/A/wZJcmffz2Wg4PwBTdCD15Eo/JKIG4jtArQJ1jgFk0cQxxt63qVfDqo50+ZZTjgcGUbbqolpIgIb/vI6BE=
X-Received: by 2002:a92:b70a:: with SMTP id k10mr1068671ili.23.1615513878765; 
 Thu, 11 Mar 2021 17:51:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.1612747873.git.haibo.xu@linaro.org>
 <a42721fa503d6d26995f451a8ca6d59ae7f3b138.1612747873.git.haibo.xu@linaro.org>
In-Reply-To: <a42721fa503d6d26995f451a8ca6d59ae7f3b138.1612747873.git.haibo.xu@linaro.org>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Fri, 12 Mar 2021 09:51:06 +0800
Message-ID: <CAJc+Z1Hp8Hs7hBVgK3k=E58vFoT1Hz-sdwnYxfB1KshyQ+sEVw@mail.gmail.com>
Subject: Re: [RFC PATCH 5/5] Enable the MTE support for KVM guest
To: Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

++ more migration experts!

On Mon, 8 Feb 2021 at 11:20, Haibo Xu <haibo.xu@linaro.org> wrote:
>
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  hw/arm/virt.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 623d5e9397..c2358cf4c5 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -79,6 +79,7 @@
>  #include "hw/virtio/virtio-iommu.h"
>  #include "hw/char/pl011.h"
>  #include "qemu/guest-random.h"
> +#include "migration/misc.h"
>
>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> @@ -821,6 +822,21 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
>      }
>  }
>
> +static int virt_precopy_notify(NotifierWithReturn *n, void *data)
> +{
> +    PrecopyNotifyData *pnd = data;
> +
> +    switch (pnd->reason) {
> +    case PRECOPY_NOTIFY_SETUP:
> +        precopy_enable_metadata_migration();
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    return 0;
> +}
> +
>  static void create_gpio_keys(const VirtMachineState *vms,
>                               DeviceState *pl061_dev,
>                               uint32_t phandle)
> @@ -1898,9 +1914,9 @@ static void machvirt_init(MachineState *machine)
>      }
>
>      if (vms->mte && kvm_enabled()) {
> -        error_report("mach-virt: KVM does not support providing "
> -                     "MTE to the guest CPU");
> -        exit(1);
> +        /* connect migration precopy request */
> +        vms->precopy_notifier.notify = virt_precopy_notify;
> +        precopy_add_notifier(&vms->precopy_notifier);
>      }
>
>      create_fdt(vms);
> --
> 2.17.1
>

