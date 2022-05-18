Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66D752B686
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 12:03:39 +0200 (CEST)
Received: from localhost ([::1]:57934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrGWo-0004zu-71
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 06:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nrGTj-0004Ae-TT
 for qemu-devel@nongnu.org; Wed, 18 May 2022 06:00:32 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:46706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nrGTc-0004qP-Dk
 for qemu-devel@nongnu.org; Wed, 18 May 2022 06:00:25 -0400
Received: by mail-ej1-x633.google.com with SMTP id y7so1252911ejr.13
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 03:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JhAoimmSSzCmo8oqUF7WEGOalNJwrOWg5eUXQwhrdPE=;
 b=xxlZHF3ymWvBpYVo7Cdc7tVPXuReGJyLN0i/611suQKbz05ith2Lt3dkQvK4z8Eo47
 o6Ok9puRXyQce6+6gBA8E0DXgdGcQbUHqwjN6GgSDdJNd/25mPNPMqtGMXd6gta7dweB
 kNDXqNhcXP+VjDwb66/Gdk11YdvpccJuNNukI4DMZ81hwP1IIwCl7Z3Bd4w5wH+oz1Mp
 rw2f9Mx2x8u0FXKWayYp4JkFKSSjXTXsCv58xi4jyyotDumn9x8LltsPML2mE31NrTFV
 q2ulhMPjmV6j4eDnl5DiO3CZWTB+lMJ6OVUPewkDdfGp0yHJiXZ5oRsXmr0HV5bhM8Qu
 p5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JhAoimmSSzCmo8oqUF7WEGOalNJwrOWg5eUXQwhrdPE=;
 b=NhbQawQOi3mQ0eUR+vy5UWe68PIfNJgh7u5uvz6wxfCmO+TmqG6/uDmFfxk0EEiEKI
 wrNz0vqFmPkjTNVSbNPucUzRmVjBEDWFGq5pzRYDH+f71vrpO+jtl1M0nEOXZuhh6lKw
 5sVeGF+Kcnb8EWFE/Q4jd+IC8J7Fn/+J7Yjqyoh5X2MYfl1RXCpTR7Luul7NvL5o2TtA
 Kdp67WR2DG9WE1l8fPSOhXw2FlLo+CYSLaxM2EZpdIdE0tE8sW59onQ1bGshaRJLyKlM
 WXZBOybo5F1XO5l8uxaEX6r+2/TfITzrc+1V5+JVFYs0vC34FmuJe3CHvoicwyIosxpF
 gBog==
X-Gm-Message-State: AOAM531BzwzEGjJ0SklHaRcG0IEYiouq6Xi+pXPEH0yHzXfDplA5cN9W
 QeJZ3KWTdf2VzDYGQ6Ez/6r1kBJVLgvubLi9rgKqJw==
X-Google-Smtp-Source: ABdhPJwG+XIww+17k6JvJMf7ZZ5xpAgW1tmUhMt8sBgMAHiww/zKPBaiKPEF65QY3pbe6AYNpYe7jWGq7y0tC8XPWlE=
X-Received: by 2002:a17:906:7e19:b0:6f4:5004:d442 with SMTP id
 e25-20020a1709067e1900b006f45004d442mr23445341ejr.147.1652868018384; Wed, 18
 May 2022 03:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220516152610.1963435-1-imammedo@redhat.com>
 <20220516152610.1963435-2-imammedo@redhat.com>
In-Reply-To: <20220516152610.1963435-2-imammedo@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 18 May 2022 15:30:07 +0530
Message-ID: <CAARzgwxhiJZtXQ=tPaJxxbOPL6LRB4QBu7UhuZSWBMkE-93iVg@mail.gmail.com>
Subject: Re: [PATCH 01/35] acpi: add interface to build device specific AML
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, minyard@acm.org, 
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::633;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 16, 2022 at 8:56 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> There is already ISADeviceClass::build_aml() callback which
> builds device specific AML blob for some ISA devices.
> To extend the same idea to other devices, add TYPE_ACPI_DEV_AML_IF
> Interface that will provide a more generic callback which
> will be used not only for ISA but other devices. It will
> allow get rid of some data-mining and ad-hoc AML building,
> by asking device(s) to generate its own AML blob like it's
> done for ISA devices.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  include/hw/acpi/acpi_aml_interface.h | 40 ++++++++++++++++++++++++++++
>  hw/acpi/acpi_interface.c             |  8 ++++++
>  hw/acpi/meson.build                  |  2 +-
>  3 files changed, 49 insertions(+), 1 deletion(-)
>  create mode 100644 include/hw/acpi/acpi_aml_interface.h
>
> diff --git a/include/hw/acpi/acpi_aml_interface.h b/include/hw/acpi/acpi_aml_interface.h
> new file mode 100644
> index 0000000000..ab76f0e55d
> --- /dev/null
> +++ b/include/hw/acpi/acpi_aml_interface.h
> @@ -0,0 +1,40 @@
> +#ifndef ACPI_AML_INTERFACE_H
> +#define ACPI_AML_INTERFACE_H
> +
> +#include "qom/object.h"
> +#include "hw/acpi/aml-build.h"
> +
> +#define TYPE_ACPI_DEV_AML_IF "acpi-dev-aml-interface"
> +typedef struct AcpiDevAmlIfClass AcpiDevAmlIfClass;
> +DECLARE_CLASS_CHECKERS(AcpiDevAmlIfClass, ACPI_DEV_AML_IF, TYPE_ACPI_DEV_AML_IF)
> +#define ACPI_DEV_AML_IF(obj) \
> +     INTERFACE_CHECK(AcpiDevAmlIf, (obj), TYPE_ACPI_DEV_AML_IF)
> +
> +typedef struct AcpiDevAmlIf AcpiDevAmlIf;

I do not see where struct AcpiDevAmlIf is defined. I guess this is
through the macro magic.

> +typedef void (*dev_aml_fn)(AcpiDevAmlIf *adev, Aml *scope);
> +
> +/**
> + * AcpiDevAmlIfClass:
> + *
> + * build_dev_aml: adds device specific AML blob to provided scope
> + *
> + * Interface is designed for providing generic callback that builds device
> + * specific AML blob.
> + */
> +struct AcpiDevAmlIfClass {
> +    /* <private> */
> +    InterfaceClass parent_class;
> +
> +    /* <public> */
> +    dev_aml_fn build_dev_aml;
> +};
> +
> +static inline void call_dev_aml_func(DeviceState *dev, Aml *scope)
> +{
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_ACPI_DEV_AML_IF)) {
> +        AcpiDevAmlIfClass *klass = ACPI_DEV_AML_IF_GET_CLASS(dev);
> +        klass->build_dev_aml(ACPI_DEV_AML_IF(dev), scope);
> +    }
> +}
> +
> +#endif
> diff --git a/hw/acpi/acpi_interface.c b/hw/acpi/acpi_interface.c
> index 6583917b8e..c668d361f6 100644
> --- a/hw/acpi/acpi_interface.c
> +++ b/hw/acpi/acpi_interface.c
> @@ -1,5 +1,6 @@
>  #include "qemu/osdep.h"
>  #include "hw/acpi/acpi_dev_interface.h"
> +#include "hw/acpi/acpi_aml_interface.h"
>  #include "qemu/module.h"
>
>  void acpi_send_event(DeviceState *dev, AcpiEventStatusBits event)
> @@ -18,8 +19,15 @@ static void register_types(void)
>          .parent        = TYPE_INTERFACE,
>          .class_size = sizeof(AcpiDeviceIfClass),
>      };
> +    static const TypeInfo acpi_dev_aml_if_info = {
> +        .name          = TYPE_ACPI_DEV_AML_IF,
> +        .parent        = TYPE_INTERFACE,
> +        .class_size = sizeof(AcpiDevAmlIfClass),
> +    };
> +
>
>      type_register_static(&acpi_dev_if_info);
> +    type_register_static(&acpi_dev_aml_if_info);
>  }
>
>  type_init(register_types)
> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> index 8bea2e6933..9504f5ce09 100644
> --- a/hw/acpi/meson.build
> +++ b/hw/acpi/meson.build
> @@ -28,7 +28,7 @@ acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
>  if have_tpm
>    acpi_ss.add(files('tpm.c'))
>  endif
> -softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c'))
> +softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c', 'acpi_interface.c'))

This is wrong. It should be the stub file not the real thing.

>  softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
>  softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 'aml-build-stub.c',
>                                                    'acpi-x86-stub.c', 'ipmi-stub.c', 'ghes-stub.c',
> --
> 2.31.1
>

