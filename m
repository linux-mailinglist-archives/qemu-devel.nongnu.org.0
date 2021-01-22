Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09332FFE2C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 09:31:30 +0100 (CET)
Received: from localhost ([::1]:41512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2rqr-0004l5-PN
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 03:31:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l2rp5-00043U-SQ
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 03:29:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l2rp3-0002Vw-Vl
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 03:29:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611304176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jDQKeNGS6LZMjDfg6HvGRkM8LLfrV9k35OMY2FEyENM=;
 b=iW7BX/cXdJXVaOAmTY3L5HIYyXmnm7F9npeQ3oXJY3Nezs/RQy4L8YPsVcz+6Hp13mdjQe
 N4KKamhMSlU3GLseBmnNt9X86T7PmIA/ENdLv8CuLxaSRpK1k3ReD6Js1ryv+dBl5UCSjz
 48LgT3Q9FJsGy6y7CpPq0kgSdAZHYxA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-hKc6mSqzPQKW8fmtGzvBdA-1; Fri, 22 Jan 2021 03:29:32 -0500
X-MC-Unique: hKc6mSqzPQKW8fmtGzvBdA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B0CF1005504;
 Fri, 22 Jan 2021 08:29:31 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7386D5D9E8;
 Fri, 22 Jan 2021 08:29:29 +0000 (UTC)
Date: Fri, 22 Jan 2021 09:29:26 +0100
From: Andrew Jones <drjones@redhat.com>
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Subject: Re: [PATCHv8 3/3] arm-virt: add secure pl061 for reset/power down
Message-ID: <20210122082926.nakttrh53zzt6d2x@kamzik.brq.redhat.com>
References: <20210120092748.14789-1-maxim.uvarov@linaro.org>
 <20210120092748.14789-4-maxim.uvarov@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210120092748.14789-4-maxim.uvarov@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Jose.Marinho@arm.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, tf-a@lists.trustedfirmware.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 20, 2021 at 12:27:48PM +0300, Maxim Uvarov wrote:
> Add secure pl061 for reset/power down machine from
> the secure world (Arm Trusted Firmware). Connect it
> with gpio-pwr driver.
> 
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
>  hw/arm/Kconfig        |  1 +
>  hw/arm/virt.c         | 47 +++++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h |  2 ++
>  3 files changed, 50 insertions(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 0a242e4c5d..13cc42dcc8 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -17,6 +17,7 @@ config ARM_VIRT
>      select PL011 # UART
>      select PL031 # RTC
>      select PL061 # GPIO
> +    select GPIO_PWR
>      select PLATFORM_BUS
>      select SMBIOS
>      select VIRTIO_MMIO
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index c427ce5f81..060a5f492e 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -153,6 +153,7 @@ static const MemMapEntry base_memmap[] = {
>      [VIRT_ACPI_GED] =           { 0x09080000, ACPI_GED_EVT_SEL_LEN },
>      [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
>      [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
> +    [VIRT_SECURE_GPIO] =        { 0x090b0000, 0x00001000 },
>      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
>      [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> @@ -841,6 +842,43 @@ static void create_gpio_keys(const VirtMachineState *vms,
>                             "gpios", phandle, 3, 0);
>  }
>  
> +#define SECURE_GPIO_POWEROFF 0
> +#define SECURE_GPIO_REBOOT   1
> +
> +static void create_gpio_pwr(const VirtMachineState *vms,

This function is specific to the secure view. I think it should have
"secure" in its name.

> +                            DeviceState *pl061_dev,
> +                            uint32_t phandle)
> +{
> +    DeviceState *gpio_pwr_dev;
> +
> +    /* gpio-pwr */
> +    gpio_pwr_dev = sysbus_create_simple("gpio-pwr", -1, NULL);

Should this device be in secure memory?

> +
> +    /* connect secure pl061 to gpio-pwr */
> +    qdev_connect_gpio_out(pl061_dev, SECURE_GPIO_REBOOT,
> +                          qdev_get_gpio_in_named(gpio_pwr_dev, "reset", 0));
> +    qdev_connect_gpio_out(pl061_dev, SECURE_GPIO_POWEROFF,
> +                          qdev_get_gpio_in_named(gpio_pwr_dev, "shutdown", 0));
> +
> +    qemu_fdt_add_subnode(vms->fdt, "/gpio-poweroff");
> +    qemu_fdt_setprop_string(vms->fdt, "/gpio-poweroff", "compatible",
> +                            "gpio-poweroff");
> +    qemu_fdt_setprop_cells(vms->fdt, "/gpio-poweroff",
> +                           "gpios", phandle, SECURE_GPIO_POWEROFF, 0);
> +    qemu_fdt_setprop_string(vms->fdt, "/gpio-poweroff", "status", "disabled");
> +    qemu_fdt_setprop_string(vms->fdt, "/gpio-poweroff", "secure-status",
> +                            "okay");
> +
> +    qemu_fdt_add_subnode(vms->fdt, "/gpio-restart");
> +    qemu_fdt_setprop_string(vms->fdt, "/gpio-restart", "compatible",
> +                            "gpio-restart");
> +    qemu_fdt_setprop_cells(vms->fdt, "/gpio-restart",
> +                           "gpios", phandle, SECURE_GPIO_REBOOT, 0);
> +    qemu_fdt_setprop_string(vms->fdt, "/gpio-restart", "status", "disabled");
> +    qemu_fdt_setprop_string(vms->fdt, "/gpio-restart", "secure-status",
> +                            "okay");
> +}
> +
>  static void create_gpio_devices(const VirtMachineState *vms, int gpio,
>                                  MemoryRegion *mem)
>  {
> @@ -883,6 +921,8 @@ static void create_gpio_devices(const VirtMachineState *vms, int gpio,
>      /* Child gpio devices */
>      if (gpio == VIRT_GPIO) {
>          create_gpio_keys(vms, pl061_dev, phandle);
> +    } else {
> +        create_gpio_pwr(vms, pl061_dev, phandle);
>      }
>  }
>  
> @@ -2015,6 +2055,10 @@ static void machvirt_init(MachineState *machine)
>          create_gpio_devices(vms, VIRT_GPIO, sysmem);
>      }
>  
> +    if (vms->secure && !vmc->no_secure_gpio) {
> +        create_gpio_devices(vms, VIRT_SECURE_GPIO, secure_sysmem);
> +    }
> +
>       /* connect powerdown request */
>       vms->powerdown_notifier.notify = virt_powerdown_req;
>       qemu_register_powerdown_notifier(&vms->powerdown_notifier);
> @@ -2630,8 +2674,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 0)
>  
>  static void virt_machine_5_2_options(MachineClass *mc)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> +
>      virt_machine_6_0_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
> +    vmc->no_secure_gpio = true;
>  }
>  DEFINE_VIRT_MACHINE(5, 2)
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index abf54fab49..6f6c85ffcf 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -81,6 +81,7 @@ enum {
>      VIRT_GPIO,
>      VIRT_SECURE_UART,
>      VIRT_SECURE_MEM,
> +    VIRT_SECURE_GPIO,
>      VIRT_PCDIMM_ACPI,
>      VIRT_ACPI_GED,
>      VIRT_NVDIMM_ACPI,
> @@ -127,6 +128,7 @@ struct VirtMachineClass {
>      bool kvm_no_adjvtime;
>      bool no_kvm_steal_time;
>      bool acpi_expose_flash;
> +    bool no_secure_gpio;
>  };
>  
>  struct VirtMachineState {
> -- 
> 2.17.1
> 
>

Thanks,
drew 


