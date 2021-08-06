Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B573E2925
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 13:11:12 +0200 (CEST)
Received: from localhost ([::1]:34654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBxks-0005xy-Ui
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 07:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mBxjV-0004pP-Lt
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:09:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mBxjT-0001tK-20
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:09:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628248181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aWjmKjThFTSe6cDKPN97O/jPxW0XsSO8y6vkajE3fgU=;
 b=DUQ4ipST4k0aZDZFlRQzc/H8Nv2URTZfnPtJM0zsQclgReCBzdJBtsthkrb/8F0T042S4e
 WIjdGi0cR1+j4z0v8jcA7h3NQGwdsFQWC88+4iFdS5jzbL8wtejxnNX3x8gX/i0gWft9VC
 R3lCHCfsxe/k4An/00G2y0heEkrseY0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-0cmaN-N8PxichEl_5noAzA-1; Fri, 06 Aug 2021 07:09:40 -0400
X-MC-Unique: 0cmaN-N8PxichEl_5noAzA-1
Received: by mail-wr1-f71.google.com with SMTP id
 o4-20020a5d47c40000b0290154ad228388so3011578wrc.9
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 04:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aWjmKjThFTSe6cDKPN97O/jPxW0XsSO8y6vkajE3fgU=;
 b=ifWs/z67Daqen87SRfhUqbe75HJBW9kyj+Lo9gYx4YRpIvCMWXtz3uOjkE+PE3U4qI
 2eXIQX7zIzPRvtbeSBStADZ9pxelcADJifWKfEF0eVSpyMuQ91P8MCuvlGtCX5Urzrit
 oTQUluQ/5fCDfRrTa2H6gM7K7buCYHnv3yZNTWpXNt2mIXpm/cnhNr9NOIEs0OfE7mDt
 Ba9gjzAoaLo6VhuWe6O8BwqYJ1HkIV/uXhtsJInEIGDAJNkNEkd/1UQWvR+bcgvWB7b+
 RNdm1GeJRAcfmGGW55ADk287TO/GgoBgr6xMovevAbLMK6A4GVbV9I5FI0tlejxMxzrW
 S1/g==
X-Gm-Message-State: AOAM530ML+YmNGmfT/jcssss9dQxqGbHKrl9tIJ4MLOTnS7VkabQTiUx
 Q8bZ25jrqXnVRES9jcUkwBfaykxDi9SQuFnnNoKi6x9jOf1Q0cdmpBYd4rENbURtxg2+qnfE/vd
 1vH3xd3hBA8sMfTM=
X-Received: by 2002:a5d:4c92:: with SMTP id z18mr10395193wrs.228.1628248179772; 
 Fri, 06 Aug 2021 04:09:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6Ebfo+gJTd9TZvqqhP1r1HNypPD0l08NXDV3F4r7AdB+DHrbpZdtv5qgtUfIDmYjQBBYyKw==
X-Received: by 2002:a5d:4c92:: with SMTP id z18mr10395160wrs.228.1628248179459; 
 Fri, 06 Aug 2021 04:09:39 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id s2sm8045813wmh.46.2021.08.06.04.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 04:09:39 -0700 (PDT)
Date: Fri, 6 Aug 2021 13:09:37 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shashi Mallela <shashi.mallela@linaro.org>
Subject: Re: [PATCH v7 09/10] hw/arm/virt: add ITS support in virt GIC
Message-ID: <20210806130937.1a354b30@redhat.com>
In-Reply-To: <20210805223002.144855-10-shashi.mallela@linaro.org>
References: <20210805223002.144855-1-shashi.mallela@linaro.org>
 <20210805223002.144855-10-shashi.mallela@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, mst@redhat.com, rad@semihalf.com,
 qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org,
 leif@nuviainc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  5 Aug 2021 18:30:01 -0400
Shashi Mallela <shashi.mallela@linaro.org> wrote:

> Included creation of ITS as part of virt platform GIC
> initialization. This Emulated ITS model now co-exists with kvm
> ITS and is enabled in absence of kvm irq kernel support in a
> platform.
> 
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/virt.c         | 28 ++++++++++++++++++++++++++--
>  include/hw/arm/virt.h |  2 ++
>  target/arm/kvm_arm.h  |  4 ++--
>  3 files changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 81eda46b0b..99cf4f9dbd 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -583,6 +583,12 @@ static void create_its(VirtMachineState *vms)
>      const char *itsclass = its_class_name();
>      DeviceState *dev;
>  
> +    if (!strcmp(itsclass, "arm-gicv3-its")) {
> +        if (!vms->tcg_its) {
> +            itsclass = NULL;
> +        }
> +    }
> +
>      if (!itsclass) {
>          /* Do nothing if not supported */
>          return;
> @@ -620,7 +626,7 @@ static void create_v2m(VirtMachineState *vms)
>      vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
>  }
>  
> -static void create_gic(VirtMachineState *vms)
> +static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
>  {
>      MachineState *ms = MACHINE(vms);
>      /* We create a standalone GIC */
> @@ -654,6 +660,14 @@ static void create_gic(VirtMachineState *vms)
>                               nb_redist_regions);
>          qdev_prop_set_uint32(vms->gic, "redist-region-count[0]", redist0_count);
>  
> +        if (!kvm_irqchip_in_kernel()) {
> +            if (vms->tcg_its) {
> +                object_property_set_link(OBJECT(vms->gic), "sysmem",
> +                                         OBJECT(mem), &error_fatal);
> +                qdev_prop_set_bit(vms->gic, "has-lpi", true);
> +            }
> +        }
> +
>          if (nb_redist_regions == 2) {
>              uint32_t redist1_capacity =
>                      vms->memmap[VIRT_HIGH_GIC_REDIST2].size / GICV3_REDIST_SIZE;
> @@ -2043,7 +2057,7 @@ static void machvirt_init(MachineState *machine)
>  
>      virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
>  
> -    create_gic(vms);
> +    create_gic(vms, sysmem);
>  
>      virt_cpu_post_init(vms, sysmem);
>  
> @@ -2746,6 +2760,12 @@ static void virt_instance_init(Object *obj)
>      } else {
>          /* Default allows ITS instantiation */
>          vms->its = true;
> +
> +        if (vmc->no_tcg_its) {
> +            vms->tcg_its = false;
> +        } else {
> +            vms->tcg_its = true;
> +        }
>      }
>  
>      /* Default disallows iommu instantiation */
> @@ -2795,8 +2815,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 1)
>  
>  static void virt_machine_6_0_options(MachineClass *mc)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> +
>      virt_machine_6_1_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_6_0, hw_compat_6_0_len);
> +    /* qemu ITS was introduced with 6.1 */
> +    vmc->no_tcg_its = true;

given it's not going to be in 6.1, shouldn't it be moved to
virt_machine_6_1_options() with updated comment?

>  }
>  DEFINE_VIRT_MACHINE(6, 0)
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 9661c46699..b461b8d261 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -120,6 +120,7 @@ struct VirtMachineClass {
>      MachineClass parent;
>      bool disallow_affinity_adjustment;
>      bool no_its;
> +    bool no_tcg_its;
>      bool no_pmu;
>      bool claim_edge_triggered_timers;
>      bool smbios_old_sys_ver;
> @@ -141,6 +142,7 @@ struct VirtMachineState {
>      bool highmem;
>      bool highmem_ecam;
>      bool its;
> +    bool tcg_its;
>      bool virt;
>      bool ras;
>      bool mte;
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 34f8daa377..0613454975 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -525,8 +525,8 @@ static inline const char *its_class_name(void)
>          /* KVM implementation requires this capability */
>          return kvm_direct_msi_enabled() ? "arm-its-kvm" : NULL;
>      } else {
> -        /* Software emulation is not implemented yet */
> -        return NULL;
> +        /* Software emulation based model */
> +        return "arm-gicv3-its";
>      }
>  }
>  


