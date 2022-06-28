Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F7955F0F9
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 00:26:47 +0200 (CEST)
Received: from localhost ([::1]:48564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6JfS-00083g-2y
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 18:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6Jdb-00064e-BG; Tue, 28 Jun 2022 18:24:51 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:52221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6JdZ-0001gD-KS; Tue, 28 Jun 2022 18:24:51 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MvsMz-1np3Kf27eB-00srJY; Wed, 29 Jun 2022 00:24:34 +0200
Message-ID: <46b178af-57f6-ade9-dea0-f0482d47fb10@vivier.eu>
Date: Wed, 29 Jun 2022 00:24:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] hw/i386/xen/xen-hvm: Allow for stubbing
 xen_set_pci_link_route()
Content-Language: fr
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
References: <20220626094656.15673-1-shentey@gmail.com>
 <20220626094656.15673-2-shentey@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220626094656.15673-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SpNdfX8QSasU2Zj6YI+XAVj3/X+6V1WNzWw1qrVY5PUTKnJqE3a
 2T+d26KufAEUmLYQ5OvBneg+brKZ1xqSj44bLjahNgMpA1kq1y64PZYAQwcLQowBzruV5bu
 a+JMy/xu1r0NUB/QA9ZE3YIchtpn0cLNLjaxOV95GeohVHFBmU4/yexbkGfvEIRqhU9xX1F
 fQ9mfJkJVmk1Qto45GZuQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:paBfxqDRFb4=:826bM7cbaeOz7uyu4iPfOA
 /rloibS8b+EtqsAZ52CS2h1nf6B2149Ms8hGxpizsg4c/1aUwmrWpdE3hv02ECDg7ajuAUDhu
 yDVQ1zRK8JTT4v/i5JXOk9Q/zl2YKKLt4PB8hRpXDMvxgtPpwR9HItESD7j47FjNyC9tiqPZ3
 p9AombP4PPO0dUGwhMXl9Kdn75AbJ1cgKb5BpF1tqUYNep/pTFJsQdwCLdF+SDE5ciG5P9UAz
 i6NcBFhgXVLkZ0H0AKFMG9F2uWF+T/uHgNLgz4RFajfK2wgQ7E5+SBQjnqW40R9/nh+jTqpYS
 keKfVVWMDKAVItAGVPHuMKYzJcFQ8xoTZsxUUaSalbN+IghxiJYBaRhXBqEqd3lm3L3avcw38
 yuox4/r45PSNHHPNku35OASKxiBl1Q/IWFdH3Kay3zUKNuXCjbMId2Mhu/NzFcpfOHu6yQlZ4
 DGGGg4QrAJ1mg5t+4CpDmX/9OrCf6d2Yc4KJL/cT7gEI1ZTD6ahtSEqGJhRrX8AUWgkg03Zix
 5F31V6khkjUzWOaWVBSCHCl0oT0k8j3zvgPWOT7KXoohZZSJ0IPH8Wz1FZmxLDtnPNSA5yLNZ
 0YcaD9Y06UqmjNxfoEokPTtuZvDXj4sJ+H7TMmpG8SCZW3awC+lAKDDN4BSmFXL/6mDE9NC7w
 QHO0Jvf0Pmm5U39b7qQk0BdrcGC0sieGmupSGFENTwxSq36SHExA1cXMNH75Rrjh+HNfVkzok
 XwDc4JGRo+eZolUd/dO/5fDLIKL8h02cjS4Iaw==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Le 26/06/2022 à 11:46, Bernhard Beschow a écrit :
> The only user of xen_set_pci_link_route() is
> xen_piix_pci_write_config_client() which implements PIIX-specific logic in
> the xen namespace. This makes xen-hvm depend on PIIX which could be
> avoided if xen_piix_pci_write_config_client() was implemented in PIIX. In
> order to do this, xen_set_pci_link_route() needs to be stubbable which
> this patch addresses.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/xen/xen-hvm.c       | 7 ++++++-
>   include/hw/xen/xen.h        | 1 +
>   include/hw/xen/xen_common.h | 6 ------
>   stubs/xen-hw-stub.c         | 5 +++++
>   4 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index 0731f70410..204fda7949 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -161,11 +161,16 @@ void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len)
>           }
>           v &= 0xf;
>           if (((address + i) >= PIIX_PIRQCA) && ((address + i) <= PIIX_PIRQCD)) {
> -            xen_set_pci_link_route(xen_domid, address + i - PIIX_PIRQCA, v);
> +            xen_set_pci_link_route(address + i - PIIX_PIRQCA, v);
>           }
>       }
>   }
>   
> +int xen_set_pci_link_route(uint8_t link, uint8_t irq)
> +{
> +    return xendevicemodel_set_pci_link_route(xen_dmod, xen_domid, link, irq);
> +}
> +
>   int xen_is_pirq_msi(uint32_t msi_data)
>   {
>       /* If vector is 0, the msi is remapped into a pirq, passed as
> diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
> index 0f9962b1c1..13bffaef53 100644
> --- a/include/hw/xen/xen.h
> +++ b/include/hw/xen/xen.h
> @@ -21,6 +21,7 @@ extern enum xen_mode xen_mode;
>   extern bool xen_domid_restrict;
>   
>   int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
> +int xen_set_pci_link_route(uint8_t link, uint8_t irq);
>   void xen_piix3_set_irq(void *opaque, int irq_num, int level);
>   void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len);
>   void xen_hvm_inject_msi(uint64_t addr, uint32_t data);
> diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
> index 179741ff79..77ce17d8a4 100644
> --- a/include/hw/xen/xen_common.h
> +++ b/include/hw/xen/xen_common.h
> @@ -316,12 +316,6 @@ static inline int xen_set_pci_intx_level(domid_t domid, uint16_t segment,
>                                                device, intx, level);
>   }
>   
> -static inline int xen_set_pci_link_route(domid_t domid, uint8_t link,
> -                                         uint8_t irq)
> -{
> -    return xendevicemodel_set_pci_link_route(xen_dmod, domid, link, irq);
> -}
> -
>   static inline int xen_inject_msi(domid_t domid, uint64_t msi_addr,
>                                    uint32_t msi_data)
>   {
> diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
> index 15f3921a76..743967623f 100644
> --- a/stubs/xen-hw-stub.c
> +++ b/stubs/xen-hw-stub.c
> @@ -23,6 +23,11 @@ void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len)
>   {
>   }
>   
> +int xen_set_pci_link_route(uint8_t link, uint8_t irq)
> +{
> +    return -1;
> +}
> +
>   void xen_hvm_inject_msi(uint64_t addr, uint32_t data)
>   {
>   }

Applied to my trivial-patches branch.

Thanks,
Laurent

