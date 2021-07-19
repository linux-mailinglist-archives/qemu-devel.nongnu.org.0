Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8186D3CF025
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 01:47:34 +0200 (CEST)
Received: from localhost ([::1]:57106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5cyy-0008QF-V9
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 19:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m5cxl-0007j5-Tc
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 19:46:18 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:34469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m5cxg-0001IN-PA
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 19:46:17 -0400
Received: by mail-il1-x135.google.com with SMTP id e13so17613124ilc.1
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 16:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MmpaNGPVbyLg0EIUsY2YJsncAsAowJnBtcdfwL19PCo=;
 b=X8eIvOgQvDvWFA63la//ePJtQPnVXWmkrWkryLAIUCUGYBxz8rZ/N9j+aM21/uZaOj
 lIUS3vYTC+BB3k+gm9S5tvCAMbFWVDGsPDEZTxvW8uj4YSx9qEmeXGBj/bc7oEEccYUH
 GJuHdTNfYD9kyxI5RV2ZKT8goJwBECwO7M7BmNEWLHn4OraPk4Sx3G3bHL1SRXVfXplv
 JjPpfe6vjdr8osUkGrrJvL24OfdN1aM8PER37a2RyVLvikipCcTrUMEwLrnISUcffRim
 bSevfV4z+ui+Q7nNJEAHcYt/ZLbwsgn8Sg4EfzQnklFq4V05z9CeE8Ib/BVCQPx68WQy
 iYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MmpaNGPVbyLg0EIUsY2YJsncAsAowJnBtcdfwL19PCo=;
 b=CKHkB3Mo98ZbH5X7s+B2luPkMtt9SlSr9yFZNKQ+9irPS/vET3BmwgaIWhx8n5gHNa
 vuJvFBcke/xAM47wzsxyjMEj2Zrv7BEEF48fv4E/uofLhUfFWlQT/9Cs0rjMBNoWstf/
 n7w/m29wKtRgHIo1hP/6WvGd/7lT06vQrppzKBTGkOiCSAjFiFaj5M9F6jp0P71cJcx5
 rgpjxHTzIM9MI5c0Hqib+IqmV8M67dfaXqJoryDw+2u6hn9B4+f155NCjyA7+6CLbrH0
 p/aT7rZyN7F54OYD5QumWvZqwYNB+wFGtjqlUSFpQSgVN4mNfEEmriyh0U6lrmXr8ePm
 hcPw==
X-Gm-Message-State: AOAM532zzpqGucG1adAKQQMD9RMmD3Ckk3pFHsawE8syYunXDsLRfu0O
 mror7TipCcbVe5goX+Y6oSQU4zHsDDLkC/GGYlk=
X-Google-Smtp-Source: ABdhPJz8NtwUHovO9+XvdRxM1nuNt8EFciDnOlny8WDVGC5SWAAo036WEz6fiZkw2PwWVTaps3LwkVmOjOBLRulSPcs=
X-Received: by 2002:a05:6e02:1529:: with SMTP id
 i9mr18321809ilu.163.1626738370785; 
 Mon, 19 Jul 2021 16:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-7-wangyanan55@huawei.com>
In-Reply-To: <20210719032043.25416-7-wangyanan55@huawei.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Tue, 20 Jul 2021 01:45:59 +0200
Message-ID: <CAM9Jb+ijYTpMQhy6qK0qcRixdwLsf+fjFpE3fZpwj9PMuJ7n3g@mail.gmail.com>
Subject: Re: [PATCH for-6.2 v2 06/11] hw: Add compat machines for 6.2
To: Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-il1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Qemu Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 yuzenghui@huawei.com, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Add 6.2 machine types for arm/i440fx/q35/s390x/spapr.
>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  9 files changed, 71 insertions(+), 6 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 81eda46b0b..01165f7f53 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2788,10 +2788,17 @@ static void machvirt_machine_init(void)
>  }
>  type_init(machvirt_machine_init);
>
> +static void virt_machine_6_2_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(6, 2)
> +
>  static void virt_machine_6_1_options(MachineClass *mc)
>  {
> +    virt_machine_6_2_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
>  }
> -DEFINE_VIRT_MACHINE_AS_LATEST(6, 1)
> +DEFINE_VIRT_MACHINE(6, 1)
>
>  static void virt_machine_6_0_options(MachineClass *mc)
>  {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 8b4d07d3fc..63439c4a6d 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -37,6 +37,9 @@
>  #include "hw/virtio/virtio.h"
>  #include "hw/virtio/virtio-pci.h"
>
> +GlobalProperty hw_compat_6_1[] = {};
> +const size_t hw_compat_6_1_len = G_N_ELEMENTS(hw_compat_6_1);
> +
>  GlobalProperty hw_compat_6_0[] = {
>      { "gpex-pcihost", "allow-unmapped-accesses", "false" },
>      { "i8042", "extended-state", "false"},
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index d94ef582b5..c6768c6ce7 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -94,6 +94,9 @@
>  #include "trace.h"
>  #include CONFIG_DEVICES
>
> +GlobalProperty pc_compat_6_1[] = {};
> +const size_t pc_compat_6_1_len = G_N_ELEMENTS(pc_compat_6_1);
> +
>  GlobalProperty pc_compat_6_0[] = {
>      { "qemu64" "-" TYPE_X86_CPU, "family", "6" },
>      { "qemu64" "-" TYPE_X86_CPU, "model", "6" },
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 30b8bd6ea9..fd5c2277f2 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -413,7 +413,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
>      machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>  }
>
> -static void pc_i440fx_6_1_machine_options(MachineClass *m)
> +static void pc_i440fx_6_2_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_i440fx_machine_options(m);
> @@ -422,6 +422,18 @@ static void pc_i440fx_6_1_machine_options(MachineClass *m)
>      pcmc->default_cpu_version = 1;
>  }
>
> +DEFINE_I440FX_MACHINE(v6_2, "pc-i440fx-6.2", NULL,
> +                      pc_i440fx_6_2_machine_options);
> +
> +static void pc_i440fx_6_1_machine_options(MachineClass *m)
> +{
> +    pc_i440fx_6_2_machine_options(m);
> +    m->alias = NULL;
> +    m->is_default = false;
> +    compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
> +    compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
> +}
> +
>  DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
>                        pc_i440fx_6_1_machine_options);
>
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 04b4a4788d..b45903b15e 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -355,7 +355,7 @@ static void pc_q35_machine_options(MachineClass *m)
>      m->max_cpus = 288;
>  }
>
> -static void pc_q35_6_1_machine_options(MachineClass *m)
> +static void pc_q35_6_2_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_q35_machine_options(m);
> @@ -363,6 +363,17 @@ static void pc_q35_6_1_machine_options(MachineClass *m)
>      pcmc->default_cpu_version = 1;
>  }
>
> +DEFINE_Q35_MACHINE(v6_2, "pc-q35-6.2", NULL,
> +                   pc_q35_6_2_machine_options);
> +
> +static void pc_q35_6_1_machine_options(MachineClass *m)
> +{
> +    pc_q35_6_2_machine_options(m);
> +    m->alias = NULL;
> +    compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
> +    compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
> +}
> +
>  DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
>                     pc_q35_6_1_machine_options);
>
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 81699d4f8b..d39fd4e644 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4685,15 +4685,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
>      }                                                                \
>      type_init(spapr_machine_register_##suffix)
>
> +/*
> + * pseries-6.2
> + */
> +static void spapr_machine_6_2_class_options(MachineClass *mc)
> +{
> +    /* Defaults for the latest behaviour inherited from the base class */
> +}
> +
> +DEFINE_SPAPR_MACHINE(6_2, "6.2", true);
> +
>  /*
>   * pseries-6.1
>   */
>  static void spapr_machine_6_1_class_options(MachineClass *mc)
>  {
> -    /* Defaults for the latest behaviour inherited from the base class */
> +    spapr_machine_6_2_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
>  }
>
> -DEFINE_SPAPR_MACHINE(6_1, "6.1", true);
> +DEFINE_SPAPR_MACHINE(6_1, "6.1", false);
>
>  /*
>   * pseries-6.0
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index e4b18aef49..4d25278cf2 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -791,14 +791,26 @@ bool css_migration_enabled(void)
>      }                                                                         \
>      type_init(ccw_machine_register_##suffix)
>
> +static void ccw_machine_6_2_instance_options(MachineState *machine)
> +{
> +}
> +
> +static void ccw_machine_6_2_class_options(MachineClass *mc)
> +{
> +}
> +DEFINE_CCW_MACHINE(6_2, "6.2", true);
> +
>  static void ccw_machine_6_1_instance_options(MachineState *machine)
>  {
> +    ccw_machine_6_2_instance_options(machine);
>  }
>
>  static void ccw_machine_6_1_class_options(MachineClass *mc)
>  {
> +    ccw_machine_6_2_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
>  }
> -DEFINE_CCW_MACHINE(6_1, "6.1", true);
> +DEFINE_CCW_MACHINE(6_1, "6.1", false);
>
>  static void ccw_machine_6_0_instance_options(MachineState *machine)
>  {
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index b6161cee88..2832f0f8aa 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -354,6 +354,9 @@ struct MachineState {
>      } \
>      type_init(machine_initfn##_register_types)
>
> +extern GlobalProperty hw_compat_6_1[];
> +extern const size_t hw_compat_6_1_len;
> +
>  extern GlobalProperty hw_compat_6_0[];
>  extern const size_t hw_compat_6_0_len;
>
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 88dffe7517..97b4ab79b5 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -196,6 +196,9 @@ void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size);
>  void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>                         const CPUArchIdList *apic_ids, GArray *entry);
>
> +extern GlobalProperty pc_compat_6_1[];
> +extern const size_t pc_compat_6_1_len;
> +
>  extern GlobalProperty pc_compat_6_0[];
>  extern const size_t pc_compat_6_0_len;
>
> --

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>

