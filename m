Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BE2435DA4
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 11:08:58 +0200 (CEST)
Received: from localhost ([::1]:45140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdU4I-0005KW-0Q
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 05:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdTyH-0007L3-3a
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 05:02:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdTyF-00066Q-22
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 05:02:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634806959;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6GTIuZ0xvETiQbv7Zq3MnvaOtgnPhrraUeqzzkC7roY=;
 b=d7C2DwxSDRWpdONgzlbYbQmyxfDtN0+u/qkuxQ/OSgFEt9xIpykSwg2Mnc94qAtCOT52BE
 cdyUj4Ms8NHjNUZJUpB1HBOft9eJKDtBfDJ3ROB/pFhgIhysN1pccCC08HM8fK2BTaAjTq
 kOuEe07vmOEO7XDbOCkys8HkCK89KQU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-yEnqjLxpONGvnupYC1tiyw-1; Thu, 21 Oct 2021 05:02:38 -0400
X-MC-Unique: yEnqjLxpONGvnupYC1tiyw-1
Received: by mail-wm1-f70.google.com with SMTP id
 f20-20020a05600c155400b0030db7b29174so26806wmg.2
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 02:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=6GTIuZ0xvETiQbv7Zq3MnvaOtgnPhrraUeqzzkC7roY=;
 b=CAjoi5aWofC+AfQgLiVL+r7Np1LKp0jBI5ZAVr7nWFSVPEQEF/DF6Oy1Kvr3cHBftA
 gqP2V7oGNFuDR7T9D9lh3SNV2AGa/kHUhVmY8mwjVROTiSmhxt6qiNRKcPC9gEAlNo4j
 3b2LvcFm8IgFS11u2FCDOmuecAlhicm74khUhLRXpX5ZIPMrOVEXsO2SnySkFbBdly3S
 cVeM9BdOnQYWdGi0wVw3OASwovQCHOCvaRPWjuZcxlzWe3oupVgtffGDmydbierziusm
 7iGOEbjUtGjucYICrVe37gvakNZjZ4Y3fmTmn9bnDdbNLx3mfwtXwuoPfu5lvDpp/wkH
 jHog==
X-Gm-Message-State: AOAM5332+0Ohun7T+3cZplleun29de7XnMGwyDedaa1AGIIf14fmg7R6
 Fp21FTCdJf/ICEvfiybACFnreRIOP6M0Ktao6RAtUFxr1shc4WA7wI1wtwFJIfh0EJaUKSSsMmv
 4KyI1UmJ8W5UoZ0k=
X-Received: by 2002:adf:bbd1:: with SMTP id z17mr5683511wrg.61.1634806957172; 
 Thu, 21 Oct 2021 02:02:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZ8ZNlAhkTSgDBnuPShkQMfYFiOunT0kUj2QzNX7ifQuDukZ5yzR6Gf7S/uMdeTQbRasnCAQ==
X-Received: by 2002:adf:bbd1:: with SMTP id z17mr5683482wrg.61.1634806956946; 
 Thu, 21 Oct 2021 02:02:36 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id l3sm933691wmc.37.2021.10.21.02.02.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 02:02:35 -0700 (PDT)
Subject: Re: [PATCH v5 03/12] hw/i386/pc: Move IOMMU singleton into
 PCMachineState
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, mst@redhat.com,
 imammedo@redhat.com, peter.maydell@linaro.org
References: <20211020172745.620101-1-jean-philippe@linaro.org>
 <20211020172745.620101-4-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <e20ab66e-8916-bea9-8bc6-f9717801458c@redhat.com>
Date: Thu, 21 Oct 2021 11:02:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211020172745.620101-4-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: ehabkost@redhat.com, jasowang@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peterx@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/20/21 7:27 PM, Jean-Philippe Brucker wrote:
> We're about to support a third vIOMMU for x86, virtio-iommu which
> doesn't inherit X86IOMMUState. Move the IOMMU singleton into
> PCMachineState, so it can be shared between all three vIOMMUs.
>
> The x86_iommu_get_default() helper is still needed by KVM and IOAPIC to
> fetch the default IRQ-remapping IOMMU. Since virtio-iommu doesn't
> support IRQ remapping, this interface doesn't need to change for the
> moment. We could later replace X86IOMMUState with an "IRQ remapping
> IOMMU" interface if necessary.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
>  include/hw/i386/pc.h |  1 +
>  hw/i386/pc.c         | 12 +++++++++++-
>  hw/i386/x86-iommu.c  | 26 ++++++++------------------
>  3 files changed, 20 insertions(+), 19 deletions(-)
>
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 11426e26dc..b72e5bf9d1 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -35,6 +35,7 @@ typedef struct PCMachineState {
>      I2CBus *smbus;
>      PFlashCFI01 *flash[2];
>      ISADevice *pcspk;
> +    DeviceState *iommu;
>  
>      /* Configuration options: */
>      uint64_t max_ram_below_4g;
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 54e4c00dce..fcbf328e8d 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1330,6 +1330,15 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
>                 object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
>          pc_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE)) {
> +        PCMachineState *pcms = PC_MACHINE(hotplug_dev);
> +
> +        if (pcms->iommu) {
> +            error_setg(errp, "QEMU does not support multiple vIOMMUs "
> +                       "for x86 yet.");
> +            return;
> +        }
> +        pcms->iommu = dev;
>      }
>  }
>  
> @@ -1384,7 +1393,8 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
> -        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
> +        object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE)) {
>          return HOTPLUG_HANDLER(machine);
>      }
>  
> diff --git a/hw/i386/x86-iommu.c b/hw/i386/x86-iommu.c
> index dc968c7a53..01d11325a6 100644
> --- a/hw/i386/x86-iommu.c
> +++ b/hw/i386/x86-iommu.c
> @@ -77,25 +77,17 @@ void x86_iommu_irq_to_msi_message(X86IOMMUIrq *irq, MSIMessage *msg_out)
>      msg_out->data = msg.msi_data;
>  }
>  
> -/* Default X86 IOMMU device */
> -static X86IOMMUState *x86_iommu_default = NULL;
> -
> -static void x86_iommu_set_default(X86IOMMUState *x86_iommu)
> +X86IOMMUState *x86_iommu_get_default(void)
>  {
> -    assert(x86_iommu);
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    PCMachineState *pcms =
> +        PC_MACHINE(object_dynamic_cast(OBJECT(ms), TYPE_PC_MACHINE));
>  
> -    if (x86_iommu_default) {
> -        error_report("QEMU does not support multiple vIOMMUs "
> -                     "for x86 yet.");
> -        exit(1);
> +    if (pcms &&
> +        object_dynamic_cast(OBJECT(pcms->iommu), TYPE_X86_IOMMU_DEVICE)) {
> +        return X86_IOMMU_DEVICE(pcms->iommu);
>      }
> -
> -    x86_iommu_default = x86_iommu;
> -}
> -
> -X86IOMMUState *x86_iommu_get_default(void)
> -{
> -    return x86_iommu_default;
> +    return NULL;
>  }
>  
>  static void x86_iommu_realize(DeviceState *dev, Error **errp)
> @@ -131,8 +123,6 @@ static void x86_iommu_realize(DeviceState *dev, Error **errp)
>      if (x86_class->realize) {
>          x86_class->realize(dev, errp);
>      }
> -
> -    x86_iommu_set_default(X86_IOMMU_DEVICE(dev));
>  }
>  
>  static Property x86_iommu_properties[] = {


