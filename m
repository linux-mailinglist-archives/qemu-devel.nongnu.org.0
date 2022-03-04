Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 674254CD553
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 14:39:55 +0100 (CET)
Received: from localhost ([::1]:53074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ89y-0008Gi-Ft
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 08:39:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ7rT-0005eF-2Q
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:20:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ7rQ-0001Yy-0R
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646400041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RZ/wacy+FxpsBgLNtAqNdKMtEnMNIyZ1Whzmm56syXE=;
 b=BXm1YaEXC0uJ+PkTAHmyfyPGOw7Nslyql9F3Pk0JGbidEZ4jVun0ohfWE5TCqtjvtrLoK6
 xEWUqBiwrMPuqdhPfI76mrvokdNYL2rxTnG0Qn7fGEDmeEyM4EBSE8UpET2Ifb0bPTrlCh
 fYgDp761L2zE3OswZCV9melg0M8z60I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-6vhAFg5BPcmnHJDExhzJSQ-1; Fri, 04 Mar 2022 08:20:40 -0500
X-MC-Unique: 6vhAFg5BPcmnHJDExhzJSQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 f24-20020a1c6a18000000b00388874b17a8so1015055wmc.3
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:20:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RZ/wacy+FxpsBgLNtAqNdKMtEnMNIyZ1Whzmm56syXE=;
 b=v9QSt0tIvphnbSQ4drpO1z6QRdiH5lxwq4JUkbVcigz4UukKM+KbbLNXz+p8mkghsO
 EL28pUkt6UzQBomlOQAXjIPnzScrdmx+jsthdfsON+QIoLVTu3FJwmcg6fzw3hWyib8x
 wCYzOACwRHM3Nr6kZOk42ogfnJikqAH+sijw+jvlGuv4QYHP3Ag4V1kJTNlwt1UZ5YKv
 QGhIR2pTWRO5CkOsLz9TkxWVkd2rS6YfPwfy0keLlTwCE8B80OkHz/5/Gfgi7opz2tqX
 M/m1liDkJF0A+yoWTG/yJl8Eb8hPldqGM2F3vMmovnu0ajKurHjqrfEQhGsIvk0Gdxw+
 kIqg==
X-Gm-Message-State: AOAM533VdF3uHQY9rcXvu/VhRgc71Lwbx+GyyhdO4zDZ2Aa9NajscO7C
 KTXa7fsF47sxdujAh18D+v9PrBIMaIRzRJG4Xvlnq6hh0EjsPYtlbnvhd3BwRUSWGBfMnzo+Tl7
 rHkEHRM/bZQQCvCQ=
X-Received: by 2002:a05:6000:184c:b0:1ef:f8a2:3283 with SMTP id
 c12-20020a056000184c00b001eff8a23283mr16387210wri.467.1646400039756; 
 Fri, 04 Mar 2022 05:20:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZw/6sgGRF1MWKszdns+fdRcT3p2wiYgdwBdZw6JkXET4QC5FJrB/UILnj3D5WILhbsgCAsQ==
X-Received: by 2002:a05:6000:184c:b0:1ef:f8a2:3283 with SMTP id
 c12-20020a056000184c00b001eff8a23283mr16387187wri.467.1646400039471; 
 Fri, 04 Mar 2022 05:20:39 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 az23-20020adfe197000000b001f072a2d85dsm2889391wrb.99.2022.03.04.05.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:20:39 -0800 (PST)
Date: Fri, 4 Mar 2022 08:20:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/acpi/microvm: turn on 8042 bit in FADT boot
 architecture flags if present
Message-ID: <20220304082017-mutt-send-email-mst@kernel.org>
References: <20220304131741.1847229-1-ani@anisinha.ca>
MIME-Version: 1.0
In-Reply-To: <20220304131741.1847229-1-ani@anisinha.ca>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 liavalb@gmail.com, imammedo@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 04, 2022 at 06:47:41PM +0530, Ani Sinha wrote:
> The second bit of IAPC_BOOT_ARCH in FADT table indicates the presence of
> keyboard controller implemented as 8042 or equivalent micro controller. This
> change enables this flag for microvms if such a device exists (for example,
> when added explicitly from the QEMU commandline). Change
> 1f810294bb31bf6ac ("hw/acpi: add indication for i8042 in IA-PC boot flags of the FADT table")
> enabled this flag for i386 q35 based machines. The reason for doing the same
> for micro-vms is to make sure we provide the correct tables to the guest OS
> uniformly in all cases when an i8042 device is present. When this bit is not
> enabled, guest OSes has to find other indirect methods to detect the device
> which we would like to avoid.
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  hw/i386/acpi-microvm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> index 68ca7e7fc2..12452cb2e5 100644
> --- a/hw/i386/acpi-microvm.c
> +++ b/hw/i386/acpi-microvm.c
> @@ -37,6 +37,7 @@
>  #include "hw/pci/pcie_host.h"
>  #include "hw/usb/xhci.h"
>  #include "hw/virtio/virtio-mmio.h"
> +#include "hw/input/i8042.h"
>  
>  #include "acpi-common.h"
>  #include "acpi-microvm.h"
> @@ -187,6 +188,11 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
>              .address = GED_MMIO_BASE_REGS + ACPI_GED_REG_RESET,
>          },
>          .reset_val = ACPI_GED_RESET_VALUE,
> +        /*
> +         * ACPI v2, Table 5-10 - Fixed ACPI Description Table Boot Architecture
> +         * Flags, bit offset 1 - 8042.
> +         */
> +        .iapc_boot_arch = i8042_present() ? 0x1 << 1 : 0x0,


Please, move this logic to a function, do not duplicate it.

>      };
>  
>      table_offsets = g_array_new(false, true /* clear */,
> -- 
> 2.25.1


