Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C2B5FF3B8
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 20:37:37 +0200 (CEST)
Received: from localhost ([::1]:53044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojPYu-000258-24
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 14:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ojPSK-00065U-59
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 14:30:48 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:41816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ojPSI-0007dL-AL
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 14:30:47 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id j7so6565336ybb.8
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 11:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SHWX/zsH+V9RinFv2950hrZkYnHo64oqGu4rh7OXIDI=;
 b=RBooiWITn3KxgTCxSEnk97YOJa1516gWf+vO6CINAjvFu3phJpL4UEegoJIz+NKod3
 Gu+1VyhhU0tM2g0KzNFIWNnhD7WDj+QFLRiMk91/39wZ6GC3rYcMgtzzwWMD0o/Qt8JJ
 +HNEh/2Qnl5XmfvGGDzQMYWidWGNafBpJWntXyLF02k2bEPUTGEmwmkXeDfi18BsEG2Z
 BthMBcrWkX79M4aGdJLozqsdup+p+LgICdhrh/LKw6g59SLCFQIKgIsyPNNTC+ejsKAg
 GluZLWwJRtzv3YiJaTeTmAXAftQdCnI/KvCAPcFJ0xreGUQFaQTSv68l4ryNIEBdGb0h
 EnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SHWX/zsH+V9RinFv2950hrZkYnHo64oqGu4rh7OXIDI=;
 b=T2SvuiR+XIZgZIfRjFdozvRrn/FqGK9QOx9xuOSiWPAG1NmRczNmPyLuT6/uAdWxDT
 2rNusnj2/GG4c38DVRUACWsj8YxOMMD9PnuCrXgie7SY8kHwspjbCHK7fGytJZyi1WJi
 QNKKYmAvpco/wuBG+Cs/1poKSChlLn5K7Wlxs3ywNWq42nJop9h2mAKoiVda1n1SROKN
 GB6jUgApwaF15luetCg+vARZZTRbFpaEZAXmn2SgfP1Ub2P39ZhYSmF/ZrnPG4++2cOy
 WapC0q0IfHhxcZBYY3T6f6BFekPAXW+mDuP+Q/svhPHSncmwKe3IT3vHaPttP0up5iXZ
 vKAg==
X-Gm-Message-State: ACrzQf1zojjl7TUZMTfgypY27QubclfAsNmfA5klNTLTSTPpeQMk+7z7
 3lbusHo4iMQ9QOiCvmm1X/uc14/N60nqdyeZtZk=
X-Google-Smtp-Source: AMsMyM62BkYgtKJSnDjJHU8rGPAf+j/gTu32u34fr4ZYjrCniH2b4qw7qklFnXiApJ6sg69SwiJ3cizpy5S7IIqZ2FI=
X-Received: by 2002:a25:4883:0:b0:6c0:7938:5b4d with SMTP id
 v125-20020a254883000000b006c079385b4dmr5875732yba.537.1665772244890; Fri, 14
 Oct 2022 11:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221014160947.66105-1-philmd@fungible.com>
In-Reply-To: <20221014160947.66105-1-philmd@fungible.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 14 Oct 2022 14:30:32 -0400
Message-ID: <CAJSP0QWcaiXnENURaWqGc5KJoxW6_3Rf73-q881OcNh_z8GnPg@mail.gmail.com>
Subject: Re: [PATCH] virtio-rng-pci: Allow setting nvectors,
 so we can use MSI-X
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@fungible.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 David Daney <david.daney@fungible.com>, 
 Marcin Nowakowski <marcin.nowakowski@fungible.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 Oct 2022 at 12:10, Philippe Mathieu-Daud=C3=A9
<philmd@fungible.com> wrote:
>
> From: David Daney <david.daney@fungible.com>
>
> Most other virtio-pci devices allow MSI-X, let's have it for rng too.
>
> Signed-off-by: David Daney <david.daney@fungible.com>
> Reviewed-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@fungible.com>
> ---
>  hw/virtio/virtio-rng-pci.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/hw/virtio/virtio-rng-pci.c b/hw/virtio/virtio-rng-pci.c
> index 151ece6f94..6e76f8b57b 100644
> --- a/hw/virtio/virtio-rng-pci.c
> +++ b/hw/virtio/virtio-rng-pci.c
> @@ -13,6 +13,7 @@
>
>  #include "hw/virtio/virtio-pci.h"
>  #include "hw/virtio/virtio-rng.h"
> +#include "hw/qdev-properties.h"
>  #include "qapi/error.h"
>  #include "qemu/module.h"
>  #include "qom/object.h"
> @@ -31,11 +32,23 @@ struct VirtIORngPCI {
>      VirtIORNG vdev;
>  };
>
> +static Property virtio_rng_properties[] =3D {
> +    DEFINE_PROP_BIT("ioeventfd", VirtIOPCIProxy, flags,
> +                    VIRTIO_PCI_FLAG_USE_IOEVENTFD_BIT, true),

ioeventfd is unrelated to MSI-X. It controls whether the virtqueue
kick is handled in the vCPU thread (ioctl(KVM_RUN) exit) or the main
loop thread (KVM ioeventfd).

I took a quick look at virtio-rng.c to see if there is anything that
doesn't work in the main loop. It looks okay to me but consider
dropping this line to minimize the risk of breaking something.

> +    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
> +                       DEV_NVECTORS_UNSPECIFIED),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static void virtio_rng_pci_realize(VirtIOPCIProxy *vpci_dev, Error **err=
p)
>  {
>      VirtIORngPCI *vrng =3D VIRTIO_RNG_PCI(vpci_dev);
>      DeviceState *vdev =3D DEVICE(&vrng->vdev);
>
> +    if (vpci_dev->nvectors =3D=3D DEV_NVECTORS_UNSPECIFIED) {
> +        vpci_dev->nvectors =3D 2;

Checked against the spec: 1 configuration change notification and 1
virtqueue used buffer notification =3D 2 MSI-X vectors.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

> +     }
> +
>      if (!qdev_realize(vdev, BUS(&vpci_dev->bus), errp)) {
>          return;
>      }
> @@ -54,6 +67,7 @@ static void virtio_rng_pci_class_init(ObjectClass *klas=
s, void *data)
>      pcidev_k->device_id =3D PCI_DEVICE_ID_VIRTIO_RNG;
>      pcidev_k->revision =3D VIRTIO_PCI_ABI_VERSION;
>      pcidev_k->class_id =3D PCI_CLASS_OTHERS;
> +    device_class_set_props(dc, virtio_rng_properties);
>  }
>
>  static void virtio_rng_initfn(Object *obj)
> --
> 2.37.3
>
>

