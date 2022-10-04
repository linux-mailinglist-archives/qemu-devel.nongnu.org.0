Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AB95F3F07
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 11:00:23 +0200 (CEST)
Received: from localhost ([::1]:39354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofdmo-0005xJ-EF
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 05:00:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ofdha-0000QT-SM
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 04:55:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ofdhW-0003UI-Db
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 04:54:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664873693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aVbKPQEISNhNKIym4UD3odsXbzlenGNTVZh3NpXtxYY=;
 b=fBmMB9yQ1u6HwDNKIqvn9YbTiXOO+gABBsCvViscu3XR5IoEHMS4oxG2jHejGauRNsEC2B
 7eHYK8mn2DlTtmLWA4dNL1+24/6t8z6EbhY32bKpZSMrb2cHosFcfuQNusHxmupCFAAMPT
 PqVSTjWVMvXf4MbLE/QI/+l4cHHW8cg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-oQH2CW7MN5OjYf8edwTy9A-1; Tue, 04 Oct 2022 04:54:52 -0400
X-MC-Unique: oQH2CW7MN5OjYf8edwTy9A-1
Received: by mail-wm1-f70.google.com with SMTP id
 h187-20020a1c21c4000000b003b51369ff1bso10565168wmh.3
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 01:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=aVbKPQEISNhNKIym4UD3odsXbzlenGNTVZh3NpXtxYY=;
 b=4QMqWmVQMKW7UQjSqatKdQytdU+/qvy1AbkKyT2wCzKPZKwSvO2cDyj4fgjaLrIS89
 18/cRujlvTvEfFjYEV3eXgW8fukuzC30AGkaZYRR6YmJ++3yUBj7ZxgEPBrHXaYKtSNE
 wBXLjsUVpH8geBIEcyIBxpaYJrYxX8vXO69TvK1t5PxBS5p7OZjyQpPX8F/BySJP3+Uo
 6LLIIy59DPUUJyEbE3kKLsc9PEdyIseNtIYi4I64UNDbKhFtPwxVZGe/jpn/l+5asnZu
 Txoc0S4MSNyNk7jmBUC65D+/OHZroYPdaBfu02WLtSz2RNzmt9PCvD5nKe4x5AqR5t9c
 x01Q==
X-Gm-Message-State: ACrzQf3i1or8jmSTXYNXvdLC3rSTdlGfX6rK4nTF2OUiYHDGQ1397Qnb
 h+KHgoEqXjctWwUXxYGmQZM2LoLB8c430C6AeJKHW28kwtoWKD6RwifAxKcF+9vxP+XqsXIcMfq
 Qa6mevgSJDoM/FhA=
X-Received: by 2002:adf:f910:0:b0:22e:3ca1:b563 with SMTP id
 b16-20020adff910000000b0022e3ca1b563mr5840969wrr.354.1664873690928; 
 Tue, 04 Oct 2022 01:54:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM43RP2n8xIrcYMBaZ+XppyyxCj/NWAyyRp7a3EfH1li6JwOjX6vhFVtbwFfLqS7ITE7uBemBw==
X-Received: by 2002:adf:f910:0:b0:22e:3ca1:b563 with SMTP id
 b16-20020adff910000000b0022e3ca1b563mr5840957wrr.354.1664873690669; 
 Tue, 04 Oct 2022 01:54:50 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:5000:4fff:1dd6:7868:a36?
 (p200300cbc70650004fff1dd678680a36.dip0.t-ipconnect.de.
 [2003:cb:c706:5000:4fff:1dd6:7868:a36])
 by smtp.gmail.com with ESMTPSA id
 f5-20020adfdb45000000b0022cc6b8df5esm11824873wrj.7.2022.10.04.01.54.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 01:54:50 -0700 (PDT)
Message-ID: <43d857ef-a934-e6ba-2c4e-8c696cd17294@redhat.com>
Date: Tue, 4 Oct 2022 10:54:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 2/5] pci-ids: drop PCI_DEVICE_ID_VIRTIO_MEM
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, peter.maydell@linaro.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220930135810.1892149-1-kraxel@redhat.com>
 <20220930135810.1892149-3-kraxel@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220930135810.1892149-3-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.467, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.09.22 15:58, Gerd Hoffmann wrote:
> Not needed for a virtio 1.0 device.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   include/hw/pci/pci.h       | 1 -
>   hw/virtio/virtio-mem-pci.c | 2 --
>   2 files changed, 3 deletions(-)
> 
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 89eaca429389..b6aefb33fb17 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -85,7 +85,6 @@ extern bool pci_available;
>   #define PCI_DEVICE_ID_VIRTIO_9P          0x1009
>   #define PCI_DEVICE_ID_VIRTIO_VSOCK       0x1012
>   #define PCI_DEVICE_ID_VIRTIO_PMEM        0x1013
> -#define PCI_DEVICE_ID_VIRTIO_MEM         0x1015
>   
>   #define PCI_VENDOR_ID_REDHAT             0x1b36
>   #define PCI_DEVICE_ID_REDHAT_BRIDGE      0x0001
> diff --git a/hw/virtio/virtio-mem-pci.c b/hw/virtio/virtio-mem-pci.c
> index be2383b0c522..5c5c1e3ae3da 100644
> --- a/hw/virtio/virtio-mem-pci.c
> +++ b/hw/virtio/virtio-mem-pci.c
> @@ -104,8 +104,6 @@ static void virtio_mem_pci_class_init(ObjectClass *klass, void *data)
>   
>       k->realize = virtio_mem_pci_realize;
>       set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> -    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
> -    pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_MEM;
>       pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
>       pcidev_k->class_id = PCI_CLASS_OTHERS;
>   

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


