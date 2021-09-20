Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2114110D7
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 10:19:59 +0200 (CEST)
Received: from localhost ([::1]:37966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSEWs-0004BS-7D
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 04:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSEOx-0007ul-1P
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSEOt-0005T4-UU
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632125502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b65bQNSNGQEr40tkBHjYc2yyoVsni+DLvIwzWaEv1ic=;
 b=YigdhuhMEXsCn68fFuSOZK7C52BQRDp3WAcndpyCSDuE9na7HXPP4EHz29SgxA/FGyFZwy
 d1zAgCCYKbEtVsTuQ67i8QIMuhfWuT/3hT7pxjbrwBK3Um//vP3kPkjb4JsY6MfDqDNu9w
 IdylOrkIk7zt+SX5IvL/BLPHzjx2Lsk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-0v2Uv37zMIeqW2N7Qv0lKQ-1; Mon, 20 Sep 2021 04:11:42 -0400
X-MC-Unique: 0v2Uv37zMIeqW2N7Qv0lKQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 l29-20020a50d6dd000000b003d80214566cso10512524edj.21
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 01:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b65bQNSNGQEr40tkBHjYc2yyoVsni+DLvIwzWaEv1ic=;
 b=C7OMjHQN60HBhVfZsJ5hhrdTjhleY3HKf2oIw2Z9e+UB+QpbBM8vIRVQmFXPJUJDfi
 nbSiWKwCnVTj3jlVOxnaDVFyj3h9DfaSp55dJvfQ2v/JhDuLN3YrXyW5aHj/q7DW+dl5
 jj88eWIakknhLv8ngSmYySfqNav4JucnZgp/Sk/GVgf2dXFW7vamtQtaZkbEBSOLU3Jt
 xBR3iCrixv735QM7aZEl3hUBybvOva2B8x/jsEOeLhUEV9Mf17wazklhIUL8f8yGsjWB
 90/qkU1vw1YP27n3m7+JSZjNLIXYNz4DEz/uw+URN+hAscUPVO0TUFFkoVAw2gtQPyLE
 TmGQ==
X-Gm-Message-State: AOAM533ixYAjpxCMufHy3iYc4KosF+9Li+x9ByFj0I3uIF+uADUUHelE
 HEP8645Lg95LLyrCOKv+ZlqUuXdEXWK7zLx4gVG3pMiJ5hUe1C2bVAEOolPcVvYqTcExG21w664
 L/HLYsDTz6hp6I4U=
X-Received: by 2002:a05:6402:42ca:: with SMTP id
 i10mr27721428edc.258.1632125500718; 
 Mon, 20 Sep 2021 01:11:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLA3ZE/m7WBjJZhFJU4Ml3bEfz9G/9GA09DZ1HtStbuSKBqA/X7kAdEFlShuL1fmuBVo82dA==
X-Received: by 2002:a05:6402:42ca:: with SMTP id
 i10mr27721396edc.258.1632125500497; 
 Mon, 20 Sep 2021 01:11:40 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id m17sm5850853ejn.108.2021.09.20.01.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 01:11:40 -0700 (PDT)
Date: Mon, 20 Sep 2021 10:11:38 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v3 04/10] hw/arm/virt: Reject instantiation of multiple
 IOMMUs
Message-ID: <20210920101138.5fe6f728@redhat.com>
In-Reply-To: <20210914142004.2433568-5-jean-philippe@linaro.org>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
 <20210914142004.2433568-5-jean-philippe@linaro.org>
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
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Sep 2021 15:19:59 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> We do not support instantiating multiple IOMMUs. Before adding a
> virtio-iommu, check that no other IOMMU is present. This will detect
> both "iommu=smmuv3" machine parameter and another virtio-iommu instance.
> 
> Fixes: 70e89132c9 ("hw/arm/virt: Add the virtio-iommu device tree mappings")
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/arm/virt.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f238766aa1..26069f943a 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2471,6 +2471,11 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>      if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>          PCIDevice *pdev = PCI_DEVICE(dev);
>  
> +        if (vms->iommu != VIRT_IOMMU_NONE) {
> +            error_setg(errp, "virt machine does not support multiple IOMMUs");
> +            return;
> +        }

can you move check into 'pre_plug' callback?

(plug should not fail and just finish up whatever was
verified/set by pre_plug, there are plans to remove errp
argument from 'plug' callback)
> +
>          vms->iommu = VIRT_IOMMU_VIRTIO;
>          vms->virtio_iommu_bdf = pci_get_bdf(pdev);
>          create_virtio_iommu_dt_bindings(vms);


