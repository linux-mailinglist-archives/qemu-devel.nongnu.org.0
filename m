Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 688BC32DD77
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 23:58:44 +0100 (CET)
Received: from localhost ([::1]:59314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHwvb-0000lS-CZ
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 17:58:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lHwZP-0005iM-86
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:35:47 -0500
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:43303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lHwZM-0007f5-T5
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:35:46 -0500
Received: by mail-il1-x136.google.com with SMTP id b5so164198ilq.10
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 14:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xZijENr2+zGNDTMY91mNb3XjWFQB+d3gIehbEGKDitY=;
 b=ZYn50Fmmt3BS8UaIsrDlnk8aeyb/CyGHELv6HVIiFc1SVVkUmrOlVgP/E+f/8bJnL4
 ArnLNa/61x0hDaMp9VTFwZvKzzu53JrGbyHMJpd5yehD11RY4EV0mEP0mZHkS7htiwIL
 JnSP8qfMShd6NYUv/9VRmifwXglpxH2T+otFPg7J6OlulXBZbJbiNcX+byNs1/X22OQo
 7wkOsHR5JoCMN876MzLmaFqhZnR+BxwJRTHHal0x9PYKiXIYqc6OSAtT+BPp5qsg8QXX
 LtJcFcCUafD8buEW1Ob7pHF+dB4Q2wry7r+yelUZRWaMoLZZJ4ZqpinMMojfM8oqoA2K
 /ysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xZijENr2+zGNDTMY91mNb3XjWFQB+d3gIehbEGKDitY=;
 b=GX50FL3ozC690OltkWx8Wp5j/2QzqBMxCMgH+awGUQsJqHMmxc/uO2sEJHhk/Bh+Y8
 vDg2FhYp9i5KQb3fFfD19+DfTX1CC3qFG+xkbKtmYJrWdO+GWbW4dwK8tt9Lbn8HWDRb
 U/wheiygszz8/ykh+iUz/B6qmDMq55BfA8EpQb/KoeAvE9kDVksKM0h15e4L40AKcZtS
 +nv1SkRbtqAnx4nfwxorMPZmVQQmJZSDIrxKCLyOxL3k6ZlJ4LRjzpJhrtZ3L0NGjV2R
 GPifS1QGOi46i9ZtaTBWtnCnufm6ZH7g1TioMziPbCVzdtDOGYcIGfXz5Fk27MU5T31S
 S8rQ==
X-Gm-Message-State: AOAM5336jmt/6EIlMlZMGkoLxb5G1LF7qQFPNbH3Ylh86wuy1Sl6zXuv
 GJMAOFcsTNZ05UY03MZOLFtDUa2HF7qIULHb4TM=
X-Google-Smtp-Source: ABdhPJwp5uTMylSaYOtyIhPpVV741/4v9ltLoWOMIgkqDDk6EcErYwmAVCpr/6XqqwrYeRnyEdEdc2JYtsk3KI2+lHE=
X-Received: by 2002:a92:cda1:: with SMTP id g1mr5816293ild.267.1614897343689; 
 Thu, 04 Mar 2021 14:35:43 -0800 (PST)
MIME-Version: 1.0
References: <20210303173642.3805-1-alex.bennee@linaro.org>
 <20210303173642.3805-5-alex.bennee@linaro.org>
In-Reply-To: <20210303173642.3805-5-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Mar 2021 17:34:27 -0500
Message-ID: <CAKmqyKP+F8mZrYss6yZTLz1oAvCrBufWFs1NnWug8XNoCeQkaA@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] hw/core: implement a guest-loader to support
 static hypervisor guests
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: julien@xen.org, andre.przywara@arm.com, stefano.stabellini@linaro.org,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 stefano.stabellini@xilinx.com, stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 3, 2021 at 12:37 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> Hypervisors, especially type-1 ones, need the firmware/bootcode to put
> their initial guest somewhere in memory and pass the information to it
> via platform data. The guest-loader is modelled after the generic
> loader for exactly this sort of purpose:
>
>   $QEMU $ARGS  -kernel ~/xen.git/xen/xen \
>     -append "dom0_mem=3D1G,max:1G loglvl=3Dall guest_loglvl=3Dall" \
>     -device guest-loader,addr=3D0x42000000,kernel=3DImage,bootargs=3D"roo=
t=3D/dev/sda2 ro console=3Dhvc0 earlyprintk=3Dxen" \
>     -device guest-loader,addr=3D0x47000000,initrd=3Drootfs.cpio
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20201105175153.30489-5-alex.bennee@linaro.org>
> Message-Id: <20210211171945.18313-5-alex.bennee@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/core/guest-loader.h |  34 ++++++++++
>  hw/core/guest-loader.c | 145 +++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS            |   5 ++
>  hw/core/meson.build    |   2 +
>  4 files changed, 186 insertions(+)
>  create mode 100644 hw/core/guest-loader.h
>  create mode 100644 hw/core/guest-loader.c
>
> diff --git a/hw/core/guest-loader.h b/hw/core/guest-loader.h
> new file mode 100644
> index 0000000000..07f4b4884b
> --- /dev/null
> +++ b/hw/core/guest-loader.h
> @@ -0,0 +1,34 @@
> +/*
> + * Guest Loader
> + *
> + * Copyright (C) 2020 Linaro
> + * Written by Alex Benn=C3=A9e <alex.bennee@linaro.org>
> + * (based on the generic-loader by Li Guang <lig.fnst@cn.fujitsu.com>)
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef GUEST_LOADER_H
> +#define GUEST_LOADER_H
> +
> +#include "hw/qdev-core.h"
> +#include "qom/object.h"
> +
> +struct GuestLoaderState {
> +    /* <private> */
> +    DeviceState parent_obj;
> +
> +    /* <public> */
> +    uint64_t addr;
> +    char *kernel;
> +    char *args;
> +    char *initrd;
> +};
> +
> +#define TYPE_GUEST_LOADER "guest-loader"
> +OBJECT_DECLARE_SIMPLE_TYPE(GuestLoaderState, GUEST_LOADER)
> +
> +#endif
> diff --git a/hw/core/guest-loader.c b/hw/core/guest-loader.c
> new file mode 100644
> index 0000000000..bde44e27b4
> --- /dev/null
> +++ b/hw/core/guest-loader.c
> @@ -0,0 +1,145 @@
> +/*
> + * Guest Loader
> + *
> + * Copyright (C) 2020 Linaro
> + * Written by Alex Benn=C3=A9e <alex.bennee@linaro.org>
> + * (based on the generic-loader by Li Guang <lig.fnst@cn.fujitsu.com>)
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +/*
> + * Much like the generic-loader this is treated as a special device
> + * inside QEMU. However unlike the generic-loader this device is used
> + * to load guest images for hypervisors. As part of that process the
> + * hypervisor needs to have platform information passed to it by the
> + * lower levels of the stack (e.g. firmware/bootloader). If you boot
> + * the hypervisor directly you use the guest-loader to load the Dom0
> + * or equivalent guest images in the right place in the same way a
> + * boot loader would.
> + *
> + * This is only relevant for full system emulation.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/core/cpu.h"
> +#include "hw/sysbus.h"
> +#include "sysemu/dma.h"
> +#include "hw/loader.h"
> +#include "hw/qdev-properties.h"
> +#include "qapi/error.h"
> +#include "qemu/module.h"
> +#include "guest-loader.h"
> +#include "sysemu/device_tree.h"
> +#include "hw/boards.h"
> +
> +/*
> + * Insert some FDT nodes for the loaded blob.
> + */
> +static void loader_insert_platform_data(GuestLoaderState *s, int size,
> +                                        Error **errp)
> +{
> +    MachineState *machine =3D MACHINE(qdev_get_machine());
> +    void *fdt =3D machine->fdt;
> +    g_autofree char *node =3D g_strdup_printf("/chosen/module@0x%08" PRI=
x64,
> +                                            s->addr);
> +    uint64_t reg_attr[2] =3D {cpu_to_be64(s->addr), cpu_to_be64(size)};
> +
> +    if (!fdt) {
> +        error_setg(errp, "Cannot modify FDT fields if the machine has no=
ne");
> +        return;
> +    }
> +
> +    qemu_fdt_add_subnode(fdt, node);
> +    qemu_fdt_setprop(fdt, node, "reg", &reg_attr, sizeof(reg_attr));
> +
> +    if (s->kernel) {
> +        const char *compat[2] =3D { "multiboot,module", "multiboot,kerne=
l" };
> +        if (qemu_fdt_setprop_string_array(fdt, node, "compatible",
> +                                          (char **) &compat,
> +                                          ARRAY_SIZE(compat)) < 0) {
> +            error_setg(errp, "couldn't set %s/compatible", node);
> +            return;
> +        }
> +        if (s->args) {
> +            if (qemu_fdt_setprop_string(fdt, node, "bootargs", s->args) =
< 0) {
> +                error_setg(errp, "couldn't set %s/bootargs", node);
> +            }
> +        }
> +    } else if (s->initrd) {
> +        const char *compat[2] =3D { "multiboot,module", "multiboot,ramdi=
sk" };
> +        if (qemu_fdt_setprop_string_array(fdt, node, "compatible",
> +                                          (char **) &compat,
> +                                          ARRAY_SIZE(compat)) < 0) {
> +            error_setg(errp, "couldn't set %s/compatible", node);
> +            return;
> +        }
> +    }
> +}
> +
> +static void guest_loader_realize(DeviceState *dev, Error **errp)
> +{
> +    GuestLoaderState *s =3D GUEST_LOADER(dev);
> +    char *file =3D s->kernel ? s->kernel : s->initrd;
> +    int size =3D 0;
> +
> +    /* Perform some error checking on the user's options */
> +    if (s->kernel && s->initrd) {
> +        error_setg(errp, "Cannot specify a kernel and initrd in same sta=
nza");
> +        return;
> +    } else if (!s->kernel && !s->initrd)  {
> +        error_setg(errp, "Need to specify a kernel or initrd image");
> +        return;
> +    } else if (!s->addr) {
> +        error_setg(errp, "Need to specify the address of guest blob");
> +        return;
> +    } else if (s->args && !s->kernel) {
> +        error_setg(errp, "Boot args only relevant to kernel blobs");
> +    }
> +
> +    /* Default to the maximum size being the machine's ram size */
> +    size =3D load_image_targphys_as(file, s->addr, current_machine->ram_=
size,
> +                                  NULL);
> +    if (size < 0) {
> +        error_setg(errp, "Cannot load specified image %s", file);
> +        return;
> +    }
> +
> +    /* Now the image is loaded we need to update the platform data */
> +    loader_insert_platform_data(s, size, errp);
> +}
> +
> +static Property guest_loader_props[] =3D {
> +    DEFINE_PROP_UINT64("addr", GuestLoaderState, addr, 0),
> +    DEFINE_PROP_STRING("kernel", GuestLoaderState, kernel),
> +    DEFINE_PROP_STRING("bootargs", GuestLoaderState, args),
> +    DEFINE_PROP_STRING("initrd", GuestLoaderState, initrd),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void guest_loader_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    dc->realize =3D guest_loader_realize;
> +    device_class_set_props(dc, guest_loader_props);
> +    dc->desc =3D "Guest Loader";
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +}
> +
> +static TypeInfo guest_loader_info =3D {
> +    .name =3D TYPE_GUEST_LOADER,
> +    .parent =3D TYPE_DEVICE,
> +    .instance_size =3D sizeof(GuestLoaderState),
> +    .class_init =3D guest_loader_class_init,
> +};
> +
> +static void guest_loader_register_type(void)
> +{
> +    type_register_static(&guest_loader_info);
> +}
> +
> +type_init(guest_loader_register_type)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9b2aa18e1f..a5b87d5e30 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2007,6 +2007,11 @@ F: hw/core/generic-loader.c
>  F: include/hw/core/generic-loader.h
>  F: docs/generic-loader.txt
>
> +Guest Loader
> +M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> +S: Maintained
> +F: hw/core/guest-loader.c
> +
>  Intel Hexadecimal Object File Loader
>  M: Su Hang <suhang16@mails.ucas.ac.cn>
>  S: Maintained
> diff --git a/hw/core/meson.build b/hw/core/meson.build
> index 032576f571..9cd72edf51 100644
> --- a/hw/core/meson.build
> +++ b/hw/core/meson.build
> @@ -37,6 +37,8 @@ softmmu_ss.add(files(
>    'clock-vmstate.c',
>  ))
>
> +softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('guest-loader.c'))
> +
>  specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files(
>    'machine-qmp-cmds.c',
>    'numa.c',
> --
> 2.20.1
>
>

