Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B84153EDEE
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 20:34:45 +0200 (CEST)
Received: from localhost ([::1]:41128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyHYp-0003ds-Qv
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 14:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1nyHWq-0002xK-Fe
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 14:32:40 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:41703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1nyHWo-0005AZ-Ov
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 14:32:40 -0400
Received: by mail-ej1-x634.google.com with SMTP id u12so30629768eja.8
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 11:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3dohZYkOb/bvPmu5KZ/g7GchcrFWKszAAU21OtF1n/4=;
 b=MrhCbWAV43TM9XWEBtMNbPPuBk6jZ3LpU/WvxRpA9dV2LGmN1RytpqlP5Bgsh+IgzD
 jVmty+EN+27Ike7SCMx/eXRI4/bkO2sqePmygEvIN4VDNaLGsXlzA0whhkDQU9LeyrtY
 iz7b3ikDi9KJBdBdGlmCp93nl5I04xNPltZL5ZKdrhPsbOAgp7tYm98ZmGIpRYb+5vCN
 7ig+yRWdOCPxCk538/EQoITfFXqToKaMh5JtH+8CsebebeB0UJy9vi18rITADIpmEObO
 88j/vCTmJOZcn/0gXdEFrdTwHUJaMQl+E+YRt9xnAvk/lxdRZ8HIFf7JbwzJn6K99nvj
 wcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3dohZYkOb/bvPmu5KZ/g7GchcrFWKszAAU21OtF1n/4=;
 b=U+7LZXZVVyKhZMUsPHVrXAXywgXhN7jCGwcCXCMSZImSQKuIn0xmMBL8BY3abaX3g+
 Xa0tVYMEkLXouqrebxboROzXguVWDjWBJ1nx5Ivs8fsx3V9/5YrxhJ/qPqbYbv+jVRF4
 JLZMuuBJpY02kRgfrs1EvM/jt9WSABYSeAxD22aMgcFkgf7dt0vzIN/7frYJK58L8clU
 AQKk7VAxRV9YIok+I3HELhHXbtwPZcvuTclTgA/4em1agjg3U+n0P2tl4VhwFWAzo9fB
 x/69c8qRUK1zZ+Qvx22bRj/7P1UUgEwvE0uKCgS1Q0deHPQ41XuZDgpMQy1F9gazGK1Z
 fwrw==
X-Gm-Message-State: AOAM531i6cuyNYu+K6MSU3cyK9WbIca/nIf+WBE4mcOVhKIAca0V4zEL
 Y/8kXF77O5zpAvI26bPfmYGzpXHWtk7ForTTP5M=
X-Google-Smtp-Source: ABdhPJwzRy55F6AR0VPj9m82BDXdSELauyDwyILqRIy5tODj4SQrnIj6/tx02K1Dpttnu+IObRKblCWFqQ9yUSUXAXE=
X-Received: by 2002:a17:907:6d92:b0:6ff:11bb:cce7 with SMTP id
 sb18-20020a1709076d9200b006ff11bbcce7mr22350020ejc.166.1654540356475; Mon, 06
 Jun 2022 11:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1653404595.git.jag.raman@oracle.com>
 <2a492c16e0464f70f7be1fd9c04172f4f18d14ca.1653404595.git.jag.raman@oracle.com>
In-Reply-To: <2a492c16e0464f70f7be1fd9c04172f4f18d14ca.1653404595.git.jag.raman@oracle.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Mon, 6 Jun 2022 11:32:25 -0700
Message-ID: <CAKgT0UdnSjUqubFT2pjB1KiVcE42ScPjBMSvV8cNf=S=1U7n=g@mail.gmail.com>
Subject: Re: [PATCH v10 13/14] vfio-user: handle device interrupts
To: Jagannathan Raman <jag.raman@oracle.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, 
 "Michael S. Tsirkin" <mst@redhat.com>, f4bug@amsat.org,
 Paolo Bonzini <pbonzini@redhat.com>, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com, 
 berrange@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 eduardo@habkost.net, 
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com, 
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, imammedo@redhat.com, 
 Peter Xu <peterx@redhat.com>, john.levon@nutanix.com,
 thanos.makatos@nutanix.com, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>, kanth.ghatraju@oracle.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alexander.duyck@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Tue, May 24, 2022 at 9:11 AM Jagannathan Raman <jag.raman@oracle.com> wrote:
>
> Forward remote device's interrupts to the guest
>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/hw/pci/pci.h              |  13 ++++
>  include/hw/remote/vfio-user-obj.h |   6 ++
>  hw/pci/msi.c                      |  16 ++--
>  hw/pci/msix.c                     |  10 ++-
>  hw/pci/pci.c                      |  13 ++++
>  hw/remote/machine.c               |  14 +++-
>  hw/remote/vfio-user-obj.c         | 123 ++++++++++++++++++++++++++++++
>  stubs/vfio-user-obj.c             |   6 ++
>  MAINTAINERS                       |   1 +
>  hw/remote/trace-events            |   1 +
>  stubs/meson.build                 |   1 +
>  11 files changed, 193 insertions(+), 11 deletions(-)
>  create mode 100644 include/hw/remote/vfio-user-obj.h
>  create mode 100644 stubs/vfio-user-obj.c
>

So I had a question about a few bits below. Specifically I ran into
issues when I had setup two devices to be assigned to the same VM via
two vfio-user-pci/x-vfio-user-server interfaces.

What I am hitting is an assert(irq_num < bus->nirq) in
pci_bus_change_irq_level in the server.

> diff --git a/hw/remote/machine.c b/hw/remote/machine.c
> index 645b54343d..75d550daae 100644
> --- a/hw/remote/machine.c
> +++ b/hw/remote/machine.c
> @@ -23,6 +23,8 @@
>  #include "hw/remote/iommu.h"
>  #include "hw/qdev-core.h"
>  #include "hw/remote/iommu.h"
> +#include "hw/remote/vfio-user-obj.h"
> +#include "hw/pci/msi.h"
>
>  static void remote_machine_init(MachineState *machine)
>  {
> @@ -54,12 +56,16 @@ static void remote_machine_init(MachineState *machine)
>
>      if (s->vfio_user) {
>          remote_iommu_setup(pci_host->bus);
> -    }
>
> -    remote_iohub_init(&s->iohub);
> +        msi_nonbroken = true;
> +
> +        vfu_object_set_bus_irq(pci_host->bus);
> +    } else {
> +        remote_iohub_init(&s->iohub);
>
> -    pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
> -                 &s->iohub, REMOTE_IOHUB_NB_PIRQS);
> +        pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
> +                     &s->iohub, REMOTE_IOHUB_NB_PIRQS);
> +    }
>
>      qbus_set_hotplug_handler(BUS(pci_host->bus), OBJECT(s));
>  }

If I am reading the code right this limits us to one legacy interrupt
in the vfio_user case, irq 0, correct? Is this intentional? Just
wanted to verify as this seems to limit us to supporting only one
device based on the mapping below.

> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> index ee28a93782..eeb165a805 100644
> --- a/hw/remote/vfio-user-obj.c
> +++ b/hw/remote/vfio-user-obj.c
> @@ -53,6 +53,9 @@
>  #include "hw/pci/pci.h"
>  #include "qemu/timer.h"
>  #include "exec/memory.h"
> +#include "hw/pci/msi.h"
> +#include "hw/pci/msix.h"
> +#include "hw/remote/vfio-user-obj.h"
>
>  #define TYPE_VFU_OBJECT "x-vfio-user-server"
>  OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
> @@ -96,6 +99,10 @@ struct VfuObject {
>      Error *unplug_blocker;
>
>      int vfu_poll_fd;
> +
> +    MSITriggerFunc *default_msi_trigger;
> +    MSIPrepareMessageFunc *default_msi_prepare_message;
> +    MSIxPrepareMessageFunc *default_msix_prepare_message;
>  };
>
>  static void vfu_object_init_ctx(VfuObject *o, Error **errp);
> @@ -520,6 +527,111 @@ static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
>      }
>  }
>
> +static int vfu_object_map_irq(PCIDevice *pci_dev, int intx)
> +{
> +    int pci_bdf = PCI_BUILD_BDF(pci_bus_num(pci_get_bus(pci_dev)),
> +                                pci_dev->devfn);
> +
> +    return pci_bdf;
> +}
> +

This bit ends up mapping it so that the BDF ends up setting the IRQ
number. So for example device 0, function 0 will be IRQ 0, and device
1, function 0 will be IRQ 8. Just wondering why it is implemented this
way if we only intend to support one device. Also I am wondering if we
should support some sort of IRQ sharing?

> +static int vfu_object_setup_irqs(VfuObject *o, PCIDevice *pci_dev)
> +{
> +    vfu_ctx_t *vfu_ctx = o->vfu_ctx;
> +    int ret;
> +
> +    ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_INTX_IRQ, 1);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    if (msix_nr_vectors_allocated(pci_dev)) {
> +        ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_MSIX_IRQ,
> +                                       msix_nr_vectors_allocated(pci_dev));
> +    } else if (msi_nr_vectors_allocated(pci_dev)) {
> +        ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_MSI_IRQ,
> +                                       msi_nr_vectors_allocated(pci_dev));
> +    }
> +
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    vfu_object_setup_msi_cbs(o);
> +
> +    pci_dev->irq_opaque = vfu_ctx;
> +
> +    return 0;
> +}
> +
> +void vfu_object_set_bus_irq(PCIBus *pci_bus)
> +{
> +    pci_bus_irqs(pci_bus, vfu_object_set_irq, vfu_object_map_irq, pci_bus, 1);
> +}
> +
>  /*
>   * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
>   * properties. It also depends on devices instantiated in QEMU. These

So this is the code that was called earlier that is being used to
assign 1 interrupt to the bus. I am just wondering if that is
intentional and if the expected behavior is to only support one device
per server for now?

