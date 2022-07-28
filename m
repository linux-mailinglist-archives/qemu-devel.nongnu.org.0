Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F7F583FE5
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 15:25:04 +0200 (CEST)
Received: from localhost ([::1]:42994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH3Ve-0001c2-Tt
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 09:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oH3SX-0006KQ-Hv; Thu, 28 Jul 2022 09:21:49 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:39500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oH3SV-0008I3-GT; Thu, 28 Jul 2022 09:21:49 -0400
Received: by mail-oi1-x234.google.com with SMTP id n206so2386765oia.6;
 Thu, 28 Jul 2022 06:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jqP2Wvb7gFEdz8ABHAhYDlQ9kxsNQrrBVQl2veuJhJY=;
 b=L4Pfn2r5ckXN3vj5FK+OtfKQw/2Um3/DD0nU+Q0V2PlaNizD8DZHL5JGR2D5KKQb+3
 xZxd/AeD7Fr7+93sufzgrdCpoH2AAzoKfjhedmwEP2J//ZVBTFZFQHK9cWbz+WB+ZlNs
 qJ61PyRjtU4mZtimYCEoRwdg9pXJPwEPCQO21ISbVLF0+7tPfX0huDieiLOLuCPBQNxV
 HKWiL8VlYpciqK5fNZfzjA9mKh4YzHWU44TkdkefeZi2LVjg8Krn1frNB0CqlF+mWBCt
 TeganlBYdViH0rNEbFlDV4ApYV5JUYPAj6wkNtXprvLC03ClDNdRIldyS1YkVoSPrNUz
 J5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jqP2Wvb7gFEdz8ABHAhYDlQ9kxsNQrrBVQl2veuJhJY=;
 b=XNOK9LE0Rl9GbbsSs4d0dQOf5n36wxGbZ3MqPDfJpGCRhOw9OwhKh1PguYkofCJWtd
 x+qx0yjUleeefcMOWmoip8G+3+VTaNcDbhH7A8l4ngv3ISwkdNAs4f7G3G+NcWmNi5KM
 BZtqhT8T8+61UoveB/gs7IhytYGnK2yCJ4X26amWblIZewYECKTQRt70/chy+xpBYfIK
 sIXUDwqe/K9ymNG5Q2jtPfcrE7jFVSdK5UH6PoVr6Qb5gcLoPrSCH+aHuVbpIrLFBg5y
 muNj/9mMbSBHf+sAh3NLYiHaqqIVu77KPjq7qymnVK4SX4TsqG0b3tFCkZ060GTwx8v0
 CYPg==
X-Gm-Message-State: AJIora9c0VcD6kZhsDUd/9jviDMoMlY4JoQQhk/dVm7ukbTMexOB1lS4
 HgYipfce/n6Zz9gW+JzMCa0=
X-Google-Smtp-Source: AGRyM1tmJ9tY6O5a8PQIoD+Ss58+55vX/csqVyX7Rfv2Va/RSoA5O+A5AIec9B7pic2fVB7xAgZo+g==
X-Received: by 2002:a05:6808:14d4:b0:33b:1489:8752 with SMTP id
 f20-20020a05680814d400b0033b14898752mr1778339oiw.174.1659014505015; 
 Thu, 28 Jul 2022 06:21:45 -0700 (PDT)
Received: from [192.168.10.102] ([179.225.208.46])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a0568300b8600b0061ca92ae442sm254867otv.72.2022.07.28.06.21.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 06:21:44 -0700 (PDT)
Message-ID: <dea4f85e-e18d-5c17-de07-56eaaf75eb8a@gmail.com>
Date: Thu, 28 Jul 2022 10:21:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH for-7.2] hw: Add compat machines for 7.2
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
References: <20220727121755.395894-1-cohuck@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220727121755.395894-1-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 7/27/22 09:17, Cornelia Huck wrote:
> Add 7.2 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---

Looking good for pseries.


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


>   hw/arm/virt.c              |  9 ++++++++-
>   hw/core/machine.c          |  3 +++
>   hw/i386/pc.c               |  3 +++
>   hw/i386/pc_piix.c          | 14 +++++++++++++-
>   hw/i386/pc_q35.c           | 13 ++++++++++++-
>   hw/m68k/virt.c             |  9 ++++++++-
>   hw/ppc/spapr.c             | 15 +++++++++++++--
>   hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>   include/hw/boards.h        |  3 +++
>   include/hw/i386/pc.h       |  3 +++
>   10 files changed, 79 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9633f822f361..1a6480fd2a76 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3094,10 +3094,17 @@ static void machvirt_machine_init(void)
>   }
>   type_init(machvirt_machine_init);
>   
> +static void virt_machine_7_2_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(7, 2)
> +
>   static void virt_machine_7_1_options(MachineClass *mc)
>   {
> +    virt_machine_7_2_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
>   }
> -DEFINE_VIRT_MACHINE_AS_LATEST(7, 1)
> +DEFINE_VIRT_MACHINE(7, 1)
>   
>   static void virt_machine_7_0_options(MachineClass *mc)
>   {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index a673302ccec5..aa520e74a8c8 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -40,6 +40,9 @@
>   #include "hw/virtio/virtio-pci.h"
>   #include "qom/object_interfaces.h"
>   
> +GlobalProperty hw_compat_7_1[] = {};
> +const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
> +
>   GlobalProperty hw_compat_7_0[] = {
>       { "arm-gicv3-common", "force-8-bit-prio", "on" },
>       { "nvme-ns", "eui64-default", "on"},
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 774cb2bf0748..31724c42ac90 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -107,6 +107,9 @@
>       { "qemu64-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
>       { "athlon-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },
>   
> +GlobalProperty pc_compat_7_1[] = {};
> +const size_t pc_compat_7_1_len = G_N_ELEMENTS(pc_compat_7_1);
> +
>   GlobalProperty pc_compat_7_0[] = {};
>   const size_t pc_compat_7_0_len = G_N_ELEMENTS(pc_compat_7_0);
>   
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index a234989ac363..34fa0021c7be 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -424,7 +424,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
>       machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>   }
>   
> -static void pc_i440fx_7_1_machine_options(MachineClass *m)
> +static void pc_i440fx_7_2_machine_options(MachineClass *m)
>   {
>       PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>       pc_i440fx_machine_options(m);
> @@ -433,6 +433,18 @@ static void pc_i440fx_7_1_machine_options(MachineClass *m)
>       pcmc->default_cpu_version = 1;
>   }
>   
> +DEFINE_I440FX_MACHINE(v7_2, "pc-i440fx-7.2", NULL,
> +                      pc_i440fx_7_2_machine_options);
> +
> +static void pc_i440fx_7_1_machine_options(MachineClass *m)
> +{
> +    pc_i440fx_7_2_machine_options(m);
> +    m->alias = NULL;
> +    m->is_default = false;
> +    compat_props_add(m->compat_props, hw_compat_7_1, hw_compat_7_1_len);
> +    compat_props_add(m->compat_props, pc_compat_7_1, pc_compat_7_1_len);
> +}
> +
>   DEFINE_I440FX_MACHINE(v7_1, "pc-i440fx-7.1", NULL,
>                         pc_i440fx_7_1_machine_options);
>   
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index f96cbd04e284..38634cd11413 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -362,7 +362,7 @@ static void pc_q35_machine_options(MachineClass *m)
>       m->max_cpus = 288;
>   }
>   
> -static void pc_q35_7_1_machine_options(MachineClass *m)
> +static void pc_q35_7_2_machine_options(MachineClass *m)
>   {
>       PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>       pc_q35_machine_options(m);
> @@ -370,6 +370,17 @@ static void pc_q35_7_1_machine_options(MachineClass *m)
>       pcmc->default_cpu_version = 1;
>   }
>   
> +DEFINE_Q35_MACHINE(v7_2, "pc-q35-7.2", NULL,
> +                   pc_q35_7_2_machine_options);
> +
> +static void pc_q35_7_1_machine_options(MachineClass *m)
> +{
> +    pc_q35_7_2_machine_options(m);
> +    m->alias = NULL;
> +    compat_props_add(m->compat_props, hw_compat_7_1, hw_compat_7_1_len);
> +    compat_props_add(m->compat_props, pc_compat_7_1, pc_compat_7_1_len);
> +}
> +
>   DEFINE_Q35_MACHINE(v7_1, "pc-q35-7.1", NULL,
>                      pc_q35_7_1_machine_options);
>   
> diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
> index 0aa383fa6bda..3122c8ef2c38 100644
> --- a/hw/m68k/virt.c
> +++ b/hw/m68k/virt.c
> @@ -322,10 +322,17 @@ type_init(virt_machine_register_types)
>       } \
>       type_init(machvirt_machine_##major##_##minor##_init);
>   
> +static void virt_machine_7_2_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE(7, 2, true)
> +
>   static void virt_machine_7_1_options(MachineClass *mc)
>   {
> +    virt_machine_7_2_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
>   }
> -DEFINE_VIRT_MACHINE(7, 1, true)
> +DEFINE_VIRT_MACHINE(7, 1, false)
>   
>   static void virt_machine_7_0_options(MachineClass *mc)
>   {
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index bc9ba6e6dcf2..fb790b61e442 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4730,15 +4730,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
>       }                                                                \
>       type_init(spapr_machine_register_##suffix)
>   
> +/*
> + * pseries-7.2
> + */
> +static void spapr_machine_7_2_class_options(MachineClass *mc)
> +{
> +    /* Defaults for the latest behaviour inherited from the base class */
> +}
> +
> +DEFINE_SPAPR_MACHINE(7_2, "7.2", true);
> +
>   /*
>    * pseries-7.1
>    */
>   static void spapr_machine_7_1_class_options(MachineClass *mc)
>   {
> -    /* Defaults for the latest behaviour inherited from the base class */
> +    spapr_machine_7_2_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
>   }
>   
> -DEFINE_SPAPR_MACHINE(7_1, "7.1", true);
> +DEFINE_SPAPR_MACHINE(7_1, "7.1", false);
>   
>   /*
>    * pseries-7.0
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index cc3097bfee80..bf1b36d824db 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -792,14 +792,26 @@ bool css_migration_enabled(void)
>       }                                                                         \
>       type_init(ccw_machine_register_##suffix)
>   
> +static void ccw_machine_7_2_instance_options(MachineState *machine)
> +{
> +}
> +
> +static void ccw_machine_7_2_class_options(MachineClass *mc)
> +{
> +}
> +DEFINE_CCW_MACHINE(7_2, "7.2", true);
> +
>   static void ccw_machine_7_1_instance_options(MachineState *machine)
>   {
> +    ccw_machine_7_2_instance_options(machine);
>   }
>   
>   static void ccw_machine_7_1_class_options(MachineClass *mc)
>   {
> +    ccw_machine_7_2_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
>   }
> -DEFINE_CCW_MACHINE(7_1, "7.1", true);
> +DEFINE_CCW_MACHINE(7_1, "7.1", false);
>   
>   static void ccw_machine_7_0_instance_options(MachineState *machine)
>   {
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index d94edcef2883..487243a39c84 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -380,6 +380,9 @@ struct MachineState {
>       } \
>       type_init(machine_initfn##_register_types)
>   
> +extern GlobalProperty hw_compat_7_1[];
> +extern const size_t hw_compat_7_1_len;
> +
>   extern GlobalProperty hw_compat_7_0[];
>   extern const size_t hw_compat_7_0_len;
>   
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index b7735dccfc81..4517fa08f2e9 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -195,6 +195,9 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>   /* sgx.c */
>   void pc_machine_init_sgx_epc(PCMachineState *pcms);
>   
> +extern GlobalProperty pc_compat_7_1[];
> +extern const size_t pc_compat_7_1_len;
> +
>   extern GlobalProperty pc_compat_7_0[];
>   extern const size_t pc_compat_7_0_len;
>   

