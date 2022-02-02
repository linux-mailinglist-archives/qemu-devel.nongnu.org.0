Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14C04A77B5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 19:18:05 +0100 (CET)
Received: from localhost ([::1]:36804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFKCi-0001Y1-J5
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 13:18:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nFJCP-0004Lc-Re; Wed, 02 Feb 2022 12:13:41 -0500
Received: from [2607:f8b0:4864:20::22a] (port=38571
 helo=mail-oi1-x22a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nFJCO-0008Ve-57; Wed, 02 Feb 2022 12:13:41 -0500
Received: by mail-oi1-x22a.google.com with SMTP id u13so24722566oie.5;
 Wed, 02 Feb 2022 09:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=e/yTOlW/wDNknIl8yCseQce+eOr7Fcm8SzJW8y0W3ek=;
 b=lgtG1+q4UAbq2L4I1Kpr6fc8sOpp7PHpkyKyXDcGTnbYqLu5l4mebKxO4rqiEKEN2C
 0IVeaEjVNcvFnNfJtoIyVXPZEBsU8V/Vw5UQ3AePm3jDHcGGyZpRNHxezmwIuft6huCk
 8/X4VA+nrX4/LOgL/sLL+D99jLhaTO96WHolJJ22QCqDuNXN6E8wzsVRlLIDrovLY3Fz
 hcpXf3dMoHCVCKzOigbpe2hM7SZPRh+JsLkT1WGbmWwjrtADhbYyTqQggAEU5NnMnugC
 PHH+Yjt4I0zb0hESXoms2KNRcOWx4cNy/xXzyoYppF8MZO/GuaiPD8WbMVeDi6+IspzB
 TQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e/yTOlW/wDNknIl8yCseQce+eOr7Fcm8SzJW8y0W3ek=;
 b=mBOsRwDOQk7vGSMmhHMtRjpUwB2PPCERcrH3EydCjPQbMSp5Q+FNv1qeQvO2XOIg/2
 VD5qC070ae7erpT5ggJVAK2Fo6rTmN5wCsrl9Ke0rDHaf7M7+yDudNO1FCJt/q4vqkOW
 Glkl03BEWRQgqJyT3CtsbkN620meMOjk8+LC5FpaOkz6g39jBm3an4jYy8WRnhBHvDhT
 JeQttlY3Y7MtnHrveUaWbOS2eQROsbueb/8UqQZZ3XqCgkrsRNGimkJ2W2YY1aN+tDhg
 4mx8LfJDWXrJCRp7zlMeZeCV+yZgRKmsP13IBgRaqImsViAFgVzlzIylp/F+NhUMWkuu
 rusg==
X-Gm-Message-State: AOAM530Q6TXivIU1BonFc1Z8d7uMVbmlqcDcH/zf7yWyGsWZkAmg5e1V
 dH6iKX74j86IfNca3gcqYdI=
X-Google-Smtp-Source: ABdhPJwwaXi2WHx4eovqG6SgCPHwSpGB3zD5VXNaBNHEl8CYX7JIqbpeSgMgSqnXqQEixYw4CFTY8g==
X-Received: by 2002:a54:4617:: with SMTP id p23mr4784494oip.143.1643822018391; 
 Wed, 02 Feb 2022 09:13:38 -0800 (PST)
Received: from [192.168.10.222] (189-68-153-170.dsl.telesp.net.br.
 [189.68.153.170])
 by smtp.gmail.com with ESMTPSA id n128sm8353180oia.6.2022.02.02.09.13.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 09:13:37 -0800 (PST)
Message-ID: <b54f175e-4afc-f918-5680-0cfcdd940836@gmail.com>
Date: Wed, 2 Feb 2022 14:13:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 1/3] nvdimm: Add realize, unrealize callbacks to
 NVDIMMDevice class
Content-Language: en-US
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>, clg@kaod.org, mst@redhat.com,
 ani@anisinha.ca, david@gibson.dropbear.id.au, groug@kaod.org,
 imammedo@redhat.com, xiaoguangrong.eric@gmail.com, qemu-ppc@nongnu.org
References: <164375265242.118489.1350738893986283213.stgit@82dbe1ffb256>
 <164375265999.118489.14958665170590335290.stgit@82dbe1ffb256>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <164375265999.118489.14958665170590335290.stgit@82dbe1ffb256>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: aneesh.kumar@linux.ibm.com, qemu-devel@nongnu.org, kvm-ppc@vger.kernel.org,
 nvdimm@lists.linux.dev
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/1/22 18:57, Shivaprasad G Bhat wrote:
> A new subclass inheriting NVDIMMDevice is going to be introduced in
> subsequent patches. The new subclass uses the realize and unrealize
> callbacks. Add them on NVDIMMClass to appropriately call them as part
> of plug-unplug.
> 
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> ---

Acked-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/mem/nvdimm.c          |   16 ++++++++++++++++
>   hw/mem/pc-dimm.c         |    5 +++++
>   include/hw/mem/nvdimm.h  |    2 ++
>   include/hw/mem/pc-dimm.h |    1 +
>   4 files changed, 24 insertions(+)
> 
> diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
> index 7397b67156..59959d5563 100644
> --- a/hw/mem/nvdimm.c
> +++ b/hw/mem/nvdimm.c
> @@ -181,10 +181,25 @@ static MemoryRegion *nvdimm_md_get_memory_region(MemoryDeviceState *md,
>   static void nvdimm_realize(PCDIMMDevice *dimm, Error **errp)
>   {
>       NVDIMMDevice *nvdimm = NVDIMM(dimm);
> +    NVDIMMClass *ndc = NVDIMM_GET_CLASS(nvdimm);
>   
>       if (!nvdimm->nvdimm_mr) {
>           nvdimm_prepare_memory_region(nvdimm, errp);
>       }
> +
> +    if (ndc->realize) {
> +        ndc->realize(nvdimm, errp);
> +    }
> +}
> +
> +static void nvdimm_unrealize(PCDIMMDevice *dimm)
> +{
> +    NVDIMMDevice *nvdimm = NVDIMM(dimm);
> +    NVDIMMClass *ndc = NVDIMM_GET_CLASS(nvdimm);
> +
> +    if (ndc->unrealize) {
> +        ndc->unrealize(nvdimm);
> +    }
>   }
>   
>   /*
> @@ -240,6 +255,7 @@ static void nvdimm_class_init(ObjectClass *oc, void *data)
>       DeviceClass *dc = DEVICE_CLASS(oc);
>   
>       ddc->realize = nvdimm_realize;
> +    ddc->unrealize = nvdimm_unrealize;
>       mdc->get_memory_region = nvdimm_md_get_memory_region;
>       device_class_set_props(dc, nvdimm_properties);
>   
> diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
> index 48b913aba6..03bd0dd60e 100644
> --- a/hw/mem/pc-dimm.c
> +++ b/hw/mem/pc-dimm.c
> @@ -216,6 +216,11 @@ static void pc_dimm_realize(DeviceState *dev, Error **errp)
>   static void pc_dimm_unrealize(DeviceState *dev)
>   {
>       PCDIMMDevice *dimm = PC_DIMM(dev);
> +    PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
> +
> +    if (ddc->unrealize) {
> +        ddc->unrealize(dimm);
> +    }
>   
>       host_memory_backend_set_mapped(dimm->hostmem, false);
>   }
> diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
> index bcf62f825c..cf8f59be44 100644
> --- a/include/hw/mem/nvdimm.h
> +++ b/include/hw/mem/nvdimm.h
> @@ -103,6 +103,8 @@ struct NVDIMMClass {
>       /* write @size bytes from @buf to NVDIMM label data at @offset. */
>       void (*write_label_data)(NVDIMMDevice *nvdimm, const void *buf,
>                                uint64_t size, uint64_t offset);
> +    void (*realize)(NVDIMMDevice *nvdimm, Error **errp);
> +    void (*unrealize)(NVDIMMDevice *nvdimm);
>   };
>   
>   #define NVDIMM_DSM_MEM_FILE     "etc/acpi/nvdimm-mem"
> diff --git a/include/hw/mem/pc-dimm.h b/include/hw/mem/pc-dimm.h
> index 1473e6db62..322bebe555 100644
> --- a/include/hw/mem/pc-dimm.h
> +++ b/include/hw/mem/pc-dimm.h
> @@ -63,6 +63,7 @@ struct PCDIMMDeviceClass {
>   
>       /* public */
>       void (*realize)(PCDIMMDevice *dimm, Error **errp);
> +    void (*unrealize)(PCDIMMDevice *dimm);
>   };
>   
>   void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState *machine,
> 
> 

