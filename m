Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5276D6E8E81
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:47:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQrt-0005BK-1q; Thu, 20 Apr 2023 05:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQrn-0005Ao-5G
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:46:15 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQrl-0007CG-BW
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:46:14 -0400
Received: by mail-wm1-x32a.google.com with SMTP id v3so962146wml.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 02:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681983971; x=1684575971;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HxqAamqU6WBlvWwFUXonWBzXbwIaGqZLOCCI1UVafMw=;
 b=V9qG3QDUenjuYyyOEjk6HfQHZdMusebjCWkscl8uqLeXl56a1v/dpAwKBaBuwyRdwO
 tKS3bZ3EnnMH9VPqCWP1rUTFXDDAhrJ00cQ4eCBikVfQyVY81Ah8Pb+/HhvYC14ObSHL
 zeB1lyruqYfkghT35xlY6ic8YwC6DxM7hWYIJy2HaGroK3VScrTD/tK05MhwENAIuEHD
 4HJgwwuoDScQYYft/JLRuQIUhkVNvFLTL6fDmWG45WUbhyNVdepwl/cMGo825374ioS9
 8ruI/emTsiBxHm0Cz7CqOCHu2Wda+5+LJAMoqH1gOj1ESIU86yDFt2cqjaGkOpADsJYB
 0ZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681983971; x=1684575971;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HxqAamqU6WBlvWwFUXonWBzXbwIaGqZLOCCI1UVafMw=;
 b=ZSKElG1ZqabrAFTaNZTfto5JXrFKA7v6PZpSOYLw4VL+1jfjhAvO73e1lPwOziB/FT
 P+gxW9Fh65rQ2g1pi0tXnYS+lX99Z6UpCZDH6XU2h6i4mHVoDh5T41aiaSYJxiUNmYnL
 2jNzDnaOhO142f0IEVmSMT9O6ulFTgKJLowmS76AsbFUocM8LdFhdv0qxDV5CXiJEL7m
 RIJOa0A/F3rxnIWPjkg+QIdUdsCtyKIcfv99ri6+qPIc4Y+TVStYARVhwoGU2EIuEKNF
 itM9sePf8LksyjQjQQyuM56qxia3FZIxBOA9WyF+fbhRmlDIOX12fbsRQyShlNynFbGe
 MDCA==
X-Gm-Message-State: AAQBX9eUeN3iPaL60knj8dZTPb8IWP5/74Zpa7FTRZOaLFGMpCE9aocg
 84Oq5cBUSUmkbxUxUnFjfYUzNQ==
X-Google-Smtp-Source: AKy350aID4yw8k3hj9g+TW7mUgR0tFPU1XrHV4/0Qg/1Szj3uuz/1FhLFuhOF2sTHGxnVuccuPkLOA==
X-Received: by 2002:a1c:7510:0:b0:3f0:373d:780 with SMTP id
 o16-20020a1c7510000000b003f0373d0780mr799043wmc.34.1681983971236; 
 Thu, 20 Apr 2023 02:46:11 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q16-20020a7bce90000000b003f09d7b6e20sm1560297wmj.2.2023.04.20.02.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 02:46:10 -0700 (PDT)
Message-ID: <c28bd26b-1451-4363-f7c8-585067a2d599@linaro.org>
Date: Thu, 20 Apr 2023 11:46:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 01/41] hw/net/net_tx_pkt: Decouple implementation from
 PCI
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
 <20230420054657.50367-2-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230420054657.50367-2-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Akihiko,

On 20/4/23 07:46, Akihiko Odaki wrote:
> This is intended to be followed by another change for the interface.
> It also fixes the leak of memory mapping when the specified memory is
> partially mapped.
> 
> Fixes: e263cd49c7 ("Packet abstraction for VMWARE network devices")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/net_tx_pkt.h |  9 ++++++++
>   hw/net/net_tx_pkt.c | 53 ++++++++++++++++++++++++++++-----------------
>   2 files changed, 42 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/net/net_tx_pkt.h b/hw/net/net_tx_pkt.h
> index e5ce6f20bc..5eb123ef90 100644
> --- a/hw/net/net_tx_pkt.h
> +++ b/hw/net/net_tx_pkt.h
> @@ -153,6 +153,15 @@ void net_tx_pkt_dump(struct NetTxPkt *pkt);
>    */
>   void net_tx_pkt_reset(struct NetTxPkt *pkt, PCIDevice *dev);
>   
> +/**
> + * Unmap a fragment mapped from a PCI device.
> + *
> + * @context:        PCI device owning fragment

Per your description ...

> + * @base:           pointer to fragment
> + * @len:            length of fragment
> + */
> +void net_tx_pkt_unmap_frag_pci(void *context, void *base, size_t len);

... we can directly use the stricter 'PCIDevice *dev'.

>   /**
>    * Send packet to qemu. handles sw offloads if vhdr is not supported.
>    *
> diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
> index 8dc8568ba2..aca12ff035 100644
> --- a/hw/net/net_tx_pkt.c
> +++ b/hw/net/net_tx_pkt.c
> @@ -384,10 +384,9 @@ void net_tx_pkt_setup_vlan_header_ex(struct NetTxPkt *pkt,
>       }
>   }
>   
> -bool net_tx_pkt_add_raw_fragment(struct NetTxPkt *pkt, hwaddr pa,
> -    size_t len)
> +static bool net_tx_pkt_add_raw_fragment_common(struct NetTxPkt *pkt,
> +                                               void *base, size_t len)
>   {
> -    hwaddr mapped_len = 0;
>       struct iovec *ventry;
>       assert(pkt);
>   
> @@ -395,23 +394,12 @@ bool net_tx_pkt_add_raw_fragment(struct NetTxPkt *pkt, hwaddr pa,
>           return false;
>       }
>   
> -    if (!len) {
> -        return true;
> -     }
> -
>       ventry = &pkt->raw[pkt->raw_frags];
> -    mapped_len = len;
> +    ventry->iov_base = base;
> +    ventry->iov_len = len;
> +    pkt->raw_frags++;
>   
> -    ventry->iov_base = pci_dma_map(pkt->pci_dev, pa,
> -                                   &mapped_len, DMA_DIRECTION_TO_DEVICE);
> -
> -    if ((ventry->iov_base != NULL) && (len == mapped_len)) {
> -        ventry->iov_len = mapped_len;
> -        pkt->raw_frags++;
> -        return true;
> -    } else {
> -        return false;
> -    }
> +    return true;
>   }
>   
>   bool net_tx_pkt_has_fragments(struct NetTxPkt *pkt)
> @@ -465,8 +453,9 @@ void net_tx_pkt_reset(struct NetTxPkt *pkt, PCIDevice *pci_dev)
>           assert(pkt->raw);
>           for (i = 0; i < pkt->raw_frags; i++) {
>               assert(pkt->raw[i].iov_base);
> -            pci_dma_unmap(pkt->pci_dev, pkt->raw[i].iov_base,
> -                          pkt->raw[i].iov_len, DMA_DIRECTION_TO_DEVICE, 0);
> +            net_tx_pkt_unmap_frag_pci(pkt->pci_dev,
> +                                      pkt->raw[i].iov_base,
> +                                      pkt->raw[i].iov_len);
>           }
>       }
>       pkt->pci_dev = pci_dev;
> @@ -476,6 +465,30 @@ void net_tx_pkt_reset(struct NetTxPkt *pkt, PCIDevice *pci_dev)
>       pkt->l4proto = 0;
>   }
>   
> +void net_tx_pkt_unmap_frag_pci(void *context, void *base, size_t len)

So net_tx_pkt_unmap_frag_pci(PCIDevice *dev, ...)

> +{
> +    pci_dma_unmap(context, base, len, DMA_DIRECTION_TO_DEVICE, 0);
> +}
> +
> +bool net_tx_pkt_add_raw_fragment(struct NetTxPkt *pkt, hwaddr pa,

It seems other hw/net/ models use (dma_addr_t addr, dma_addr_t len).
Similarly does the pci_dma_FOO() API.

> +    size_t len)
> +{
> +    dma_addr_t mapped_len = len;

See, here you use dma_addr_t.

> +    void *base = pci_dma_map(pkt->pci_dev, pa, &mapped_len,
> +                             DMA_DIRECTION_TO_DEVICE);
> +    if (!base) {
> +        return false;
> +    }
> +
> +    if (mapped_len != len ||
> +        !net_tx_pkt_add_raw_fragment_common(pkt, base, len)) {
> +        net_tx_pkt_unmap_frag_pci(pkt->pci_dev, base, mapped_len);
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
>   static void net_tx_pkt_do_sw_csum(struct NetTxPkt *pkt,
>                                     struct iovec *iov, uint32_t iov_len,
>                                     uint16_t csl)


