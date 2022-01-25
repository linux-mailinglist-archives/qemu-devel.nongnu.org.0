Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5CB49B1BA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 11:34:19 +0100 (CET)
Received: from localhost ([::1]:33908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCJ9W-0005TX-BJ
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 05:34:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nCJ2J-0006lc-C8
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:26:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nCJ2G-00057n-LT
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643106370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QcZjo/a+B5zu1NVmxX4irODAmEHNtjNwudA/raoQZm8=;
 b=In4mQ/ZOwSz1ZFT543FGWq/hz54oj99BpxoJGOBy2hPdptjt7SwUziQqfY/9rgbcmnvqaN
 Dutjz6HAl7E8NzBmQDMFRz/5cmdyB9WS6Mk0qjgyC7xJKm/FRRhLCBV9OgQv9sdMSucMNa
 g7+mD3FZ6SZ0iwbiWVCrtv99c1iSrzQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-Gw-TgdieOlyRjEvVwSXmtw-1; Tue, 25 Jan 2022 05:26:09 -0500
X-MC-Unique: Gw-TgdieOlyRjEvVwSXmtw-1
Received: by mail-ed1-f69.google.com with SMTP id
 c8-20020a05640227c800b003fdc1684cdeso14729896ede.12
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 02:26:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QcZjo/a+B5zu1NVmxX4irODAmEHNtjNwudA/raoQZm8=;
 b=7o4MXiqG1La/cQopXBWvB8GP6PzkTh3fbdbHZtn2wRJy9DoCyOD0kYfx05QukgXVxx
 0jkM8uuHpdafe4GaqvegtOLNnlKFtq5JBwv3HIZ1OlS/AfZ/GAAVZx+fY7Cr6rlU1LY1
 oVm/72TLHszazCDUJ/U9w/eySdfFOXAG5Pkc8aChLqHNitLNEHSCGF1M7mk0NsAYtD9W
 9iBhPX/+VmyFSvbB9vUVYJw0sfFofgcN7m2pUogxOLrVXnqLTfwUHmSDIpw7M8Kwp39J
 MUoxdF3pFkom1V1T0rAPdZQ7GTcXU/f5HxUHXJCVaadtZd/A/OHKAWAAuWhWayhYRr5L
 fnOA==
X-Gm-Message-State: AOAM532nJU3qzO2G7bCrf9uVdG2q59TLKwiLHBFZQ1+WYWNg0wOJ3W5s
 ztmagV0KIORSw5WIiO02DBMJPQQdfSFxe98vH3bSHRAEcge2LMoNjmMPqZbMSEEJHpwjlgtHWm5
 KZKx1wDNynkZ9OIOiQhTxBtnRxUiRpfkwIk8pJV65vx13u6hTGg0THKni+U+YuVOfjQ==
X-Received: by 2002:a17:906:e282:: with SMTP id
 gg2mr16200843ejb.607.1643106366817; 
 Tue, 25 Jan 2022 02:26:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywwxwZ4YY4iWIlFNaYip0Wa4dEeAoVhozEIa/pQlPEkwWy9x2YAsU6Xt11ylx+Tj+ikUTJSQ==
X-Received: by 2002:a17:906:e282:: with SMTP id
 gg2mr16200818ejb.607.1643106366410; 
 Tue, 25 Jan 2022 02:26:06 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id qp13sm5994017ejb.52.2022.01.25.02.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 02:26:05 -0800 (PST)
Date: Tue, 25 Jan 2022 11:26:03 +0100
From: Andrew Jones <drjones@redhat.com>
To: chenxiang via <qemu-devel@nongnu.org>
Subject: Re: [PATCH] hw/arm/virt: Enable HMAT on arm virt machine
Message-ID: <20220125102603.3ssiffsqcyt7tlwr@gator>
References: <1643102134-15506-1-git-send-email-chenxiang66@hisilicon.com>
MIME-Version: 1.0
In-Reply-To: <1643102134-15506-1-git-send-email-chenxiang66@hisilicon.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Xiang Chen <chenxiang66@hisilicon.com>,
 linuxarm@huawei.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 25, 2022 at 05:15:34PM +0800, chenxiang via wrote:
> From: Xiang Chen <chenxiang66@hisilicon.com>
> 
> Since the patchset ("Build ACPI Heterogeneous Memory Attribute Table (HMAT)"),
> HMAT is supported, but only x86 is enabled. Enable HMAT on arm virt machine.

Hi Xiang,

What QEMU commands lines have you tested with which Linux guest kernels?

Thanks,
drew

> 
> Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
> ---
>  hw/arm/Kconfig           | 1 +
>  hw/arm/virt-acpi-build.c | 7 +++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 2e0049196d..a3c6099829 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -29,6 +29,7 @@ config ARM_VIRT
>      select ACPI_APEI
>      select ACPI_VIOT
>      select VIRTIO_MEM_SUPPORTED
> +    select ACPI_HMAT
>  
>  config CHEETAH
>      bool
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 449fab0080..f19b55e486 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -42,6 +42,7 @@
>  #include "hw/acpi/memory_hotplug.h"
>  #include "hw/acpi/generic_event_device.h"
>  #include "hw/acpi/tpm.h"
> +#include "hw/acpi/hmat.h"
>  #include "hw/pci/pcie_host.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_bus.h"
> @@ -990,6 +991,12 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>              build_slit(tables_blob, tables->linker, ms, vms->oem_id,
>                         vms->oem_table_id);
>          }
> +
> +        if (ms->numa_state->hmat_enabled) {
> +            acpi_add_table(table_offsets, tables_blob);
> +            build_hmat(tables_blob, tables->linker, ms->numa_state,
> +                       vms->oem_id, vms->oem_table_id);
> +        }
>      }
>  
>      if (ms->nvdimms_state->is_enabled) {
> -- 
> 2.33.0
> 
> 


