Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 801ED66CDD6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 18:43:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHTV6-0007dQ-PZ; Mon, 16 Jan 2023 12:42:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHTV5-0007dC-6m; Mon, 16 Jan 2023 12:42:27 -0500
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHTV3-0006EE-8g; Mon, 16 Jan 2023 12:42:26 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M4384-1pHTUx3BnE-0008T6; Mon, 16 Jan 2023 18:42:19 +0100
Message-ID: <8bf2f4f8-7df1-c2d4-1664-4d245a68eaae@vivier.eu>
Date: Mon, 16 Jan 2023 18:42:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] hw/i386/pc: Remove unused 'owner' argument from
 pc_pci_as_mapping_init
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230105173826.56748-1-philmd@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230105173826.56748-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6lSI1c2vxYbKbrU87eelG1YLTH1vm3jhcEYnsQO7ys8tKM1I5eO
 2nDug7qlIkjMQCXTH4nXizvLRONc3lTHduLp2geeIox6NUTgkuxHw3G0hyFTG1QshC0uL5E
 2yg5cqucQXqwtUpCt56jz+JHsjpqLbcJBYni25ZcxsV+vh36gYdct/OkD9CfFTC7bMiFHG7
 Asr3hmbjW47HAHPhGoVww==
UI-OutboundReport: notjunk:1;M01:P0:ECO5kY8j6JE=;jw0ERFA3R5uMEGg6hfmKCadzX1b
 y6IFTAUFy6EEa1OP5MKSQtDXx9O5fGvTQGgSkgbJt3h4U7MniAx4e/wAqiy47ksz9gsh2ehvz
 70fuJ6Ke0Dpr54Yni2SxOuu+486jqipOpfwGGmbUhtBzwXKLpsaXtz+n8KAULVNSZLifsWdwB
 nyk5OwAu2rh32Ghpr6/fUp7HZ51PTOhBjYXiE+Vwy32AyiXEFk5B1RZKA35Hrg2vGxJ0P0aR0
 /YgoRBmA0/CSmUP0axJO41lXFPx7f5tdEBm++zzMS+hHcvtciNsHVIzwG35S1MZvz3pWUftwp
 Jvxy0x9iz16xG2mF8445HZUj61UrSam+w7to2YOtE/L0fY2po9w9xoSPmGHgxDa0ubyggFXR/
 8kQRSGHo9aSqDSNeUFdznwasPYdbz2PtqxIhHlKFssqbk5cKPCJ3l0P4fu1oqSwGjHxcvxfx7
 7Kr3Nzy1LfzwC4J73/kvfFM8SH8Syn5uH6vr95zYfe2IZQN2/bhDxbrrcrmlatx2LNK0kY4bd
 4o2ouG/uz1r6WHRmO6+fSDXFBXxlh5CqQ0ojbJFPO1FDBGAamunLS2MFXTxiPeWrYRMqGldOb
 QpFmwTQIP+ToWEo1dHG0Z9ZHunlxEuP1KfGWM6cwJvbh4wn6CoMqFvNP9Pw0t//Uusi5PYaaY
 Wf1+6luyZpTRClFZWdQ6XAJcJ21CfyVaSvSd4dXV+w==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 05/01/2023 à 18:38, Philippe Mathieu-Daudé a écrit :
> This argument was added 9 years ago in commit 83d08f2673
> ("pc: map PCI address space as catchall region for not mapped
> addresses") and has never been used since, so remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/i386/pc.c         | 2 +-
>   hw/pci-host/i440fx.c | 3 +--
>   hw/pci-host/q35.c    | 3 +--
>   include/hw/i386/pc.h | 2 +-
>   4 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index d489ecc0d1..6e592bd969 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -782,7 +782,7 @@ void pc_guest_info_init(PCMachineState *pcms)
>   }
>   
>   /* setup pci memory address space mapping into system address space */
> -void pc_pci_as_mapping_init(Object *owner, MemoryRegion *system_memory,
> +void pc_pci_as_mapping_init(MemoryRegion *system_memory,
>                               MemoryRegion *pci_address_space)
>   {
>       /* Set to lower priority than RAM */
> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
> index d5426ef4a5..262f82c303 100644
> --- a/hw/pci-host/i440fx.c
> +++ b/hw/pci-host/i440fx.c
> @@ -272,8 +272,7 @@ PCIBus *i440fx_init(const char *pci_type,
>                        IO_APIC_DEFAULT_ADDRESS - 1);
>   
>       /* setup pci memory mapping */
> -    pc_pci_as_mapping_init(OBJECT(f), f->system_memory,
> -                           f->pci_address_space);
> +    pc_pci_as_mapping_init(f->system_memory, f->pci_address_space);
>   
>       /* if *disabled* show SMRAM to all CPUs */
>       memory_region_init_alias(&f->smram_region, OBJECT(d), "smram-region",
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index 20da121374..26390863d6 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -574,8 +574,7 @@ static void mch_realize(PCIDevice *d, Error **errp)
>       }
>   
>       /* setup pci memory mapping */
> -    pc_pci_as_mapping_init(OBJECT(mch), mch->system_memory,
> -                           mch->pci_address_space);
> +    pc_pci_as_mapping_init(mch->system_memory, mch->pci_address_space);
>   
>       /* if *disabled* show SMRAM to all CPUs */
>       memory_region_init_alias(&mch->smram_region, OBJECT(mch), "smram-region",
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 991f905f5d..88a120bc23 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -156,7 +156,7 @@ void pc_guest_info_init(PCMachineState *pcms);
>   #define PCI_HOST_ABOVE_4G_MEM_SIZE     "above-4g-mem-size"
>   
>   
> -void pc_pci_as_mapping_init(Object *owner, MemoryRegion *system_memory,
> +void pc_pci_as_mapping_init(MemoryRegion *system_memory,
>                               MemoryRegion *pci_address_space);
>   
>   void xen_load_linux(PCMachineState *pcms);

Applied to my trivial-patches branch.

Thanks,
Laurent

