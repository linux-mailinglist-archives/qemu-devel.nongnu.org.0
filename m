Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 016743EEDA8
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 15:46:00 +0200 (CEST)
Received: from localhost ([::1]:43454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFzPi-0003TI-Hp
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 09:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mFzNo-0000w9-FV
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 09:44:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mFzNm-0000pg-Bb
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 09:43:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629207835;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oDqNSsdnUHRPHHMpK2HTyaEYbQzH/yLDOUFEq8H+JjU=;
 b=A/3oyuC9+3xpgq2HEr8HVAsQocfQ2CfazGDy2ZG2ACuFiorx5bok3rkWsDg6kO7luz8d5b
 PqgG4fTMSy9A5tf+yNh1TVCTa3nYCMgpzCmtCiZy9YnFLsX42Fas6LST0MsNpQVOANNqYj
 7iBPsB3/wrOEgZnUTU8rfDfvtpLHOoI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-mafiS9VyNbuEXPM0Twcc9w-1; Tue, 17 Aug 2021 09:42:31 -0400
X-MC-Unique: mafiS9VyNbuEXPM0Twcc9w-1
Received: by mail-ed1-f70.google.com with SMTP id
 z4-20020a05640240c4b02903be90a10a52so10583355edb.19
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 06:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=oDqNSsdnUHRPHHMpK2HTyaEYbQzH/yLDOUFEq8H+JjU=;
 b=jHOizcmub6Rh4rY1JkXoOeAWtH/hi//4IOCGsYioPN8+k7n51i5NO/bszNjoNw/Lfa
 566OcO2K/lhnd06dMwKDc+vE6O92V18VWdp0F6ebkfqQoy47Ikyv7U2oOwuWNK0gdS5U
 WaAKT/d+yiTk5MIuC8QPIdtpPWwOtQN8GlgI6wCp06xJr2L8LofYkehc/g6Qjn8WhBFq
 P0Gpm4TbpcXVrl21K8fCeor/Ts3NDNGjthhm5Ajdg/BaDncG5mW+aYYT0FQ66SeF9JCa
 vsyIz+5GDQkGm024xBA06Ku38j/2xlfscgjwQtXECiQniBaKIB53tq8wSCeiWr3sTU/l
 hpnQ==
X-Gm-Message-State: AOAM5304rospU+G8U/VKqQM9qL/Kzzhwmt+SGwXP4aYq7C/XgkFUmX9L
 OehyArZXgJwmnhIG/OKtqubwQ13pB+ABU/7dm4n3BfmKnej75EfaY8Cj4uLJYFC2TSjT8Sm1i6Q
 HkmXTxJRKpwVKvsw=
X-Received: by 2002:a17:906:378e:: with SMTP id
 n14mr3979157ejc.12.1629207746027; 
 Tue, 17 Aug 2021 06:42:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVYBY8knx4fGuKY9KA3elt5Aq3oSkbYGcqcF0CTNci3fy+JDlNTSm0V/kpXoIp7rUKW/jnIA==
X-Received: by 2002:a17:906:378e:: with SMTP id
 n14mr3979124ejc.12.1629207745786; 
 Tue, 17 Aug 2021 06:42:25 -0700 (PDT)
Received: from [192.168.43.95] ([37.173.36.144])
 by smtp.gmail.com with ESMTPSA id d16sm1096150edu.8.2021.08.17.06.42.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 06:42:25 -0700 (PDT)
Subject: Re: [PATCH 4/6] hw/arm/virt: Remove device tree restriction for
 virtio-iommu
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210810084505.2257983-1-jean-philippe@linaro.org>
 <20210810084505.2257983-5-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <71dc152e-269b-fc32-e478-e2164008ff04@redhat.com>
Date: Tue, 17 Aug 2021 15:42:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210810084505.2257983-5-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.961, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jean,

On 8/10/21 10:45 AM, Jean-Philippe Brucker wrote:
> virtio-iommu is now supported with ACPI VIOT as well as device tree.
> Remove the restriction that prevents from instantiating a virtio-iommu
> device under ACPI.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/arm/virt.c                | 10 ++--------
>  hw/virtio/virtio-iommu-pci.c |  7 -------
>  2 files changed, 2 insertions(+), 15 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 81eda46b0b..b4598d3fe6 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2551,16 +2551,10 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
>  
>      if (device_is_dynamic_sysbus(mc, dev) ||
> -       (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM))) {
> +        object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>          return HOTPLUG_HANDLER(machine);
>      }
> -    if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> -        VirtMachineState *vms = VIRT_MACHINE(machine);
> -
> -        if (!vms->bootinfo.firmware_loaded || !virt_is_acpi_enabled(vms)) {
> -            return HOTPLUG_HANDLER(machine);
> -        }
> -    }
>      return NULL;
>  }
>  
> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
> index 770c286be7..f30eb16cbf 100644
> --- a/hw/virtio/virtio-iommu-pci.c
> +++ b/hw/virtio/virtio-iommu-pci.c
> @@ -48,16 +48,9 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>      VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
>  
>      if (!qdev_get_machine_hotplug_handler(DEVICE(vpci_dev))) {
> -        MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
> -
> -        error_setg(errp,
> -                   "%s machine fails to create iommu-map device tree bindings",
> -                   mc->name);
>          error_append_hint(errp,
>                            "Check your machine implements a hotplug handler "
>                            "for the virtio-iommu-pci device\n");
> -        error_append_hint(errp, "Check the guest is booted without FW or with "
> -                          "-no-acpi\n");
We may check the vms->iommu is not already set to something else (to
VIRT_IOMMU_SMMUV3 for instance).

Thanks

Eric
>          return;
>      }
>      for (int i = 0; i < s->nb_reserved_regions; i++) {


