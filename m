Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F30B1E0FCC
	for <lists+qemu-devel@lfdr.de>; Mon, 25 May 2020 15:49:00 +0200 (CEST)
Received: from localhost ([::1]:47938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdDTP-0007zB-Eq
	for lists+qemu-devel@lfdr.de; Mon, 25 May 2020 09:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jdDRT-00070L-7D
 for qemu-devel@nongnu.org; Mon, 25 May 2020 09:46:59 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:55882
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jdDRO-0000WC-EP
 for qemu-devel@nongnu.org; Mon, 25 May 2020 09:46:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590414413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yE/jj0uW+AG56YPhqE3mj8rzTg7yV5pvUrgfN0rTz5M=;
 b=FBhk4TkLM39TDH61Zkbvz0bvk3i1mVBcmBo7th+Tpe3HKCxxradHO0uyZJKJ8iZAEDo6aY
 0AdjUWCIG9l12dvJInWoDbq4P1DZcyup++LYcdqYXbtW51kyfJFs4vFHs+oQIeY4C/ea9Y
 P1zGdCfEIvy6DTunsCto2OtHu8nJp/o=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-9qyFhwJyNVWh_Mj8pKcISw-1; Mon, 25 May 2020 09:46:51 -0400
X-MC-Unique: 9qyFhwJyNVWh_Mj8pKcISw-1
Received: by mail-ed1-f70.google.com with SMTP id v25so4153356edy.1
 for <qemu-devel@nongnu.org>; Mon, 25 May 2020 06:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=yE/jj0uW+AG56YPhqE3mj8rzTg7yV5pvUrgfN0rTz5M=;
 b=PHIWf2lkG952l3QoHnrwfA3lRGq5wHbnR7gHjaReJEfXEBOQKRFaW8Yiq67s27PECF
 ZRUqb/R13hWYW8CTjxxOpOkub3qCTJGyXTKDxh8/yOWEJQoUDDY42TYVqfd8h0+EjQXs
 phBtIyhwNz24gmU7SwZ8kII7438NjujckwCV/8kgwPo/PLWPhHll0ghmwnDdYCZuc+3x
 /ELVc049QEpJkBIMpqbbzF3QwlSKi2vZzUlrscUSODkon3qWEbUXl093OuGY3potea3o
 CoOygWKE2YnTYlfuOCpkiPw4HwXS08BJHnfIU2wepQ631RybwlbLk1QmHnvHrtT3/Lzi
 DjPg==
X-Gm-Message-State: AOAM533LmGn28wRrdqXjMTI5VH/xzv6gtu7Y2/SnO/8r5M7RUEV64mfV
 t8oqHsD6MXIuOUUUv1QthVZPndhn19f4DKliNSBLsNga3//Znz0d4K7+CyRrmOsIBND+dVfuSWx
 eHUmnyiVCJtdlneE=
X-Received: by 2002:a17:906:7684:: with SMTP id
 o4mr19862433ejm.449.1590414410224; 
 Mon, 25 May 2020 06:46:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxot/pcLkWyo2RjCDhIYrF2Cnf2gMNmuUgC780T9XsS5+r/XycMrBjK0rhHoSaVh2VM89xgvA==
X-Received: by 2002:a17:906:7684:: with SMTP id
 o4mr19862413ejm.449.1590414409943; 
 Mon, 25 May 2020 06:46:49 -0700 (PDT)
Received: from [192.168.1.36] (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id s8sm16374779edj.64.2020.05.25.06.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2020 06:46:49 -0700 (PDT)
Subject: Re: [PATCH 3/3] x86: move max-ram-below-4g to pc
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20200525134101.24740-1-kraxel@redhat.com>
 <20200525134101.24740-4-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <f3766c20-3bb3-4431-8781-5dea4eace5c8@redhat.com>
Date: Mon, 25 May 2020 15:46:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200525134101.24740-4-kraxel@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/25 06:55:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 imammedo@redhat.com, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/20 3:41 PM, Gerd Hoffmann wrote:
> Move from X86MachineClass to PCMachineClass so it disappears
> from microvm machine type property list.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/hw/i386/pc.h  |  2 ++
>  include/hw/i386/x86.h |  4 ----
>  hw/i386/pc.c          | 46 +++++++++++++++++++++++++++++++++++++++++++
>  hw/i386/pc_piix.c     | 10 +++++-----
>  hw/i386/pc_q35.c      | 10 +++++-----
>  hw/i386/x86.c         | 46 -------------------------------------------
>  6 files changed, 58 insertions(+), 60 deletions(-)
> 
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 8d764f965cd3..e6135c34d656 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -35,6 +35,7 @@ struct PCMachineState {
>      PFlashCFI01 *flash[2];
>  
>      /* Configuration options: */
> +    uint64_t max_ram_below_4g;
>      OnOffAuto vmport;
>  
>      bool acpi_build_enabled;
> @@ -51,6 +52,7 @@ struct PCMachineState {
>  };
>  
>  #define PC_MACHINE_ACPI_DEVICE_PROP "acpi-device"
> +#define PC_MACHINE_MAX_RAM_BELOW_4G "max-ram-below-4g"
>  #define PC_MACHINE_DEVMEM_REGION_SIZE "device-memory-region-size"
>  #define PC_MACHINE_VMPORT           "vmport"
>  #define PC_MACHINE_SMBUS            "smbus"
> diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
> index b52285481687..b79f24e28545 100644
> --- a/include/hw/i386/x86.h
> +++ b/include/hw/i386/x86.h
> @@ -51,9 +51,6 @@ typedef struct {
>      qemu_irq *gsi;
>      GMappedFile *initrd_mapped_file;
>  
> -    /* Configuration options: */
> -    uint64_t max_ram_below_4g;
> -
>      /* RAM information (sizes, addresses, configuration): */
>      ram_addr_t below_4g_mem_size, above_4g_mem_size;
>  
> @@ -82,7 +79,6 @@ typedef struct {
>      AddressSpace *ioapic_as;
>  } X86MachineState;
>  
> -#define X86_MACHINE_MAX_RAM_BELOW_4G "max-ram-below-4g"
>  #define X86_MACHINE_SMM              "smm"
>  #define X86_MACHINE_ACPI             "acpi"
>  
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 2128f3d6fe8b..80a6cac3b56f 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1856,6 +1856,45 @@ static void pc_machine_set_pit(Object *obj, bool value, Error **errp)
>      pcms->pit_enabled = value;
>  }
>  
> +static void pc_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
> +                                            const char *name, void *opaque,
> +                                            Error **errp)
> +{
> +    PCMachineState *pcms = PC_MACHINE(obj);
> +    uint64_t value = pcms->max_ram_below_4g;
> +
> +    visit_type_size(v, name, &value, errp);
> +}
> +
> +static void pc_machine_set_max_ram_below_4g(Object *obj, Visitor *v,
> +                                            const char *name, void *opaque,
> +                                            Error **errp)
> +{
> +    PCMachineState *pcms = PC_MACHINE(obj);
> +    Error *error = NULL;
> +    uint64_t value;
> +
> +    visit_type_size(v, name, &value, &error);
> +    if (error) {
> +        error_propagate(errp, error);
> +        return;
> +    }
> +    if (value > 4 * GiB) {
> +        error_setg(&error,
> +                   "Machine option 'max-ram-below-4g=%"PRIu64
> +                   "' expects size less than or equal to 4G", value);
> +        error_propagate(errp, error);
> +        return;
> +    }
> +
> +    if (value < 1 * MiB) {
> +        warn_report("Only %" PRIu64 " bytes of RAM below the 4GiB boundary,"
> +                    "BIOS may not work with less than 1MiB", value);
> +    }
> +
> +    pcms->max_ram_below_4g = value;
> +}
> +
>  static void pc_machine_initfn(Object *obj)
>  {
>      PCMachineState *pcms = PC_MACHINE(obj);
> @@ -1865,6 +1904,7 @@ static void pc_machine_initfn(Object *obj)
>  #else
>      pcms->vmport = ON_OFF_AUTO_OFF;
>  #endif /* CONFIG_VMPORT */
> +    pcms->max_ram_below_4g = 0; /* use default */
>      /* acpi build is enabled by default if machine supports it */
>      pcms->acpi_build_enabled = PC_MACHINE_GET_CLASS(pcms)->has_acpi_build;
>      pcms->smbus_enabled = true;
> @@ -1963,6 +2003,12 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      mc->numa_mem_supported = true;
>      mc->default_ram_id = "pc.ram";
>  
> +    object_class_property_add(oc, PC_MACHINE_MAX_RAM_BELOW_4G, "size",
> +        pc_machine_get_max_ram_below_4g, pc_machine_set_max_ram_below_4g,
> +        NULL, NULL);
> +    object_class_property_set_description(oc, PC_MACHINE_MAX_RAM_BELOW_4G,
> +        "Maximum ram below the 4G boundary (32bit boundary)");
> +
>      object_class_property_add(oc, PC_MACHINE_DEVMEM_REGION_SIZE, "int",
>          pc_machine_get_device_memory_region_size, NULL,
>          NULL, NULL);
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index f66e1d73ce0b..503c35f7bf4c 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -127,11 +127,11 @@ static void pc_init1(MachineState *machine,
>      if (xen_enabled()) {
>          xen_hvm_init(pcms, &ram_memory);
>      } else {
> -        if (!x86ms->max_ram_below_4g) {
> -            x86ms->max_ram_below_4g = 0xe0000000; /* default: 3.5G */
> +        if (!pcms->max_ram_below_4g) {
> +            pcms->max_ram_below_4g = 0xe0000000; /* default: 3.5G */
>          }
> -        lowmem = x86ms->max_ram_below_4g;
> -        if (machine->ram_size >= x86ms->max_ram_below_4g) {
> +        lowmem = pcms->max_ram_below_4g;
> +        if (machine->ram_size >= pcms->max_ram_below_4g) {
>              if (pcmc->gigabyte_align) {
>                  if (lowmem > 0xc0000000) {
>                      lowmem = 0xc0000000;
> @@ -140,7 +140,7 @@ static void pc_init1(MachineState *machine,
>                      warn_report("Large machine and max_ram_below_4g "
>                                  "(%" PRIu64 ") not a multiple of 1G; "
>                                  "possible bad performance.",
> -                                x86ms->max_ram_below_4g);
> +                                pcms->max_ram_below_4g);
>                  }
>              }
>          }
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 4ba8ac8774e4..90e8fb2cb737 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -154,18 +154,18 @@ static void pc_q35_init(MachineState *machine)
>      /* Handle the machine opt max-ram-below-4g.  It is basically doing
>       * min(qemu limit, user limit).
>       */
> -    if (!x86ms->max_ram_below_4g) {
> -        x86ms->max_ram_below_4g = 4 * GiB;
> +    if (!pcms->max_ram_below_4g) {
> +        pcms->max_ram_below_4g = 4 * GiB;
>      }
> -    if (lowmem > x86ms->max_ram_below_4g) {
> -        lowmem = x86ms->max_ram_below_4g;
> +    if (lowmem > pcms->max_ram_below_4g) {
> +        lowmem = pcms->max_ram_below_4g;
>          if (machine->ram_size - lowmem > lowmem &&
>              lowmem & (1 * GiB - 1)) {
>              warn_report("There is possibly poor performance as the ram size "
>                          " (0x%" PRIx64 ") is more then twice the size of"
>                          " max-ram-below-4g (%"PRIu64") and"
>                          " max-ram-below-4g is not a multiple of 1G.",
> -                        (uint64_t)machine->ram_size, x86ms->max_ram_below_4g);
> +                        (uint64_t)machine->ram_size, pcms->max_ram_below_4g);
>          }
>      }
>  
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 7a3bc7ab6639..49884e5c1597 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -846,45 +846,6 @@ void x86_bios_rom_init(MemoryRegion *rom_memory, bool isapc_ram_fw)
>                                  bios);
>  }
>  
> -static void x86_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
> -                                             const char *name, void *opaque,
> -                                             Error **errp)
> -{
> -    X86MachineState *x86ms = X86_MACHINE(obj);
> -    uint64_t value = x86ms->max_ram_below_4g;
> -
> -    visit_type_size(v, name, &value, errp);
> -}
> -
> -static void x86_machine_set_max_ram_below_4g(Object *obj, Visitor *v,
> -                                             const char *name, void *opaque,
> -                                             Error **errp)
> -{
> -    X86MachineState *x86ms = X86_MACHINE(obj);
> -    Error *error = NULL;
> -    uint64_t value;
> -
> -    visit_type_size(v, name, &value, &error);
> -    if (error) {
> -        error_propagate(errp, error);
> -        return;
> -    }
> -    if (value > 4 * GiB) {
> -        error_setg(&error,
> -                   "Machine option 'max-ram-below-4g=%"PRIu64
> -                   "' expects size less than or equal to 4G", value);
> -        error_propagate(errp, error);
> -        return;
> -    }
> -
> -    if (value < 1 * MiB) {
> -        warn_report("Only %" PRIu64 " bytes of RAM below the 4GiB boundary,"
> -                    "BIOS may not work with less than 1MiB", value);
> -    }
> -
> -    x86ms->max_ram_below_4g = value;
> -}
> -
>  bool x86_machine_is_smm_enabled(X86MachineState *x86ms)
>  {
>      bool smm_available = false;
> @@ -958,7 +919,6 @@ static void x86_machine_initfn(Object *obj)
>  
>      x86ms->smm = ON_OFF_AUTO_AUTO;
>      x86ms->acpi = ON_OFF_AUTO_AUTO;
> -    x86ms->max_ram_below_4g = 0; /* use default */
>      x86ms->smp_dies = 1;
>  
>      x86ms->apicid_from_cpu_idx = x86_apicid_from_cpu_idx;
> @@ -980,12 +940,6 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
>      x86mc->save_tsc_khz = true;
>      nc->nmi_monitor_handler = x86_nmi;
>  
> -    object_class_property_add(oc, X86_MACHINE_MAX_RAM_BELOW_4G, "size",
> -        x86_machine_get_max_ram_below_4g, x86_machine_set_max_ram_below_4g,
> -        NULL, NULL);
> -    object_class_property_set_description(oc, X86_MACHINE_MAX_RAM_BELOW_4G,
> -        "Maximum ram below the 4G boundary (32bit boundary)");
> -
>      object_class_property_add(oc, X86_MACHINE_SMM, "OnOffAuto",
>          x86_machine_get_smm, x86_machine_set_smm,
>          NULL, NULL);
> 

Good!

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


