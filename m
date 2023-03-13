Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBE66B71E8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 10:02:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbe3U-0001o7-L2; Mon, 13 Mar 2023 05:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbe3Q-0001nq-8E
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 05:01:16 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbe3K-0007AY-2X
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 05:01:15 -0400
Received: by mail-wm1-x32f.google.com with SMTP id j3so7341117wms.2
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 02:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678698065;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+yRTQUoioB4e4JGXFcl0uR5I7yidXlwRcuL8pkMIFhI=;
 b=Hs11MoEiln8Nl7L2cl8mYfzcvur8zVlWaDOMrDRDM4ZqSmktfn6o3r2bGPbDrtW89U
 UeDrdBTIbnT55ZYOPzclVKH5xTlFpql11GB4GCtk31k+SbWKDE11MT1ysY9fbunL0JLA
 EheA9QIsfS1eo8gKN0sjiOlCCrXMs3HcEjcea9c+Sz8W7WZ0hdEp2CRbyly5rCO/lm1Y
 9N6LWkL3IF7APnDkF2gSYixabCw28x+NIkkGWQaOs5SbJixOoXrN5c50BJBRbYMJc3ho
 KtQfn8EjY8TxNSDMihlq+7YCbHuorpgyYjTdpaGHcl4m9InBHCyRlQRGAJBERrQQeZH7
 ggPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678698065;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+yRTQUoioB4e4JGXFcl0uR5I7yidXlwRcuL8pkMIFhI=;
 b=yk026OzMwjqdyDB2G85NhZRIUZBkPl+CBwrr8+yN1HeBFqYTLJj7enkYnTHJ8i1TGO
 bcNCWYlKAaZnWa1mkhme5J5zUgDUraExXVMfGZ+3GuV/mQS7ZaxgUHMZiDtLSjrg2kr1
 MwmZMTwB4gztSzJGNw0ezKm8K4ZF+IJNs3x0+tJw4fGjQgAVV6R8so5ypjkZ+a3+YEbX
 SKsj1rmHPGCCD5zb8q7hvfz+gCoDuoH63KJsWM1lR11NDYgCT4fcIYMbrpPQqkyQX6NL
 Ke92k2jLZBZ7TyRPyp0tgt8WSzik/Mlpq6ZHyoMfs4NIF9zFlrSInMh4YVPebmcCwBxR
 f2uA==
X-Gm-Message-State: AO0yUKUiIK2Gjzq43blyjp8WSmaj2Hk4OKNuTQLSv2vjAPKakcxEMfT1
 X+PiHI8Swsicy6eVXiUt7+8rnQ==
X-Google-Smtp-Source: AK7set8YKjt4pCS2UPrBXHY3xTR5X6jSogUcNTsr00XQW/4qGiNyi7WB2Xnrt+5yoOc8daREainADg==
X-Received: by 2002:a05:600c:1d18:b0:3ed:2981:1ea8 with SMTP id
 l24-20020a05600c1d1800b003ed29811ea8mr553751wms.8.1678698065004; 
 Mon, 13 Mar 2023 02:01:05 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q6-20020adff946000000b002c703d59fa7sm7335537wrr.12.2023.03.13.02.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 02:01:04 -0700 (PDT)
Message-ID: <193506e9-76bb-96b9-551d-cb08ee743c2d@linaro.org>
Date: Mon, 13 Mar 2023 10:01:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [RFC QEMU PATCH 01/18] virtio: Add shared memory capability
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <20230312092244.451465-1-ray.huang@amd.com>
 <20230312092244.451465-2-ray.huang@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230312092244.451465-2-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/3/23 10:22, Huang Rui wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Define a new capability type 'VIRTIO_PCI_CAP_SHARED_MEMORY_CFG' to allow
> defining shared memory regions with sizes and offsets of 2^32 and more.
> Multiple instances of the capability are allowed and distinguished
> by a device-specific 'id'.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> ---
>   hw/virtio/virtio-pci.c         | 18 ++++++++++++++++++
>   include/hw/virtio/virtio-pci.h |  4 ++++
>   2 files changed, 22 insertions(+)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index a1c9dfa7bb..ae4c29cb96 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1191,6 +1191,24 @@ static int virtio_pci_add_mem_cap(VirtIOPCIProxy *proxy,
>       return offset;
>   }
>   
> +int virtio_pci_add_shm_cap(VirtIOPCIProxy *proxy,
> +                           uint8_t bar, uint64_t offset, uint64_t length,
> +                           uint8_t id)
> +{
> +    struct virtio_pci_cap64 cap = {
> +        .cap.cap_len = sizeof cap,
> +        .cap.cfg_type = VIRTIO_PCI_CAP_SHARED_MEMORY_CFG,
> +    };
> +
> +    cap.cap.bar = bar;
> +    cap.cap.length = cpu_to_le32(length);
> +    cap.length_hi = cpu_to_le32(length >> 32);
> +    cap.cap.offset = cpu_to_le32(offset);
> +    cap.offset_hi = cpu_to_le32(offset >> 32);
> +    cap.cap.id = id;

Why initializing 'cap' using 2 different coding styles?

> +    return virtio_pci_add_mem_cap(proxy, &cap.cap);
> +}


