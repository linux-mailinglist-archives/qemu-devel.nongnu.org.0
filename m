Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F40555F0FA
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 00:27:29 +0200 (CEST)
Received: from localhost ([::1]:50058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Jg8-0000ce-Bv
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 18:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6JeF-00077g-8P; Tue, 28 Jun 2022 18:25:31 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:37011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6JeD-0001yi-BQ; Tue, 28 Jun 2022 18:25:30 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N7Qt9-1na9591ikn-017o7K; Wed, 29 Jun 2022 00:25:18 +0200
Message-ID: <894aff5a-d0e9-803e-11c0-103c80290ef5@vivier.eu>
Date: Wed, 29 Jun 2022 00:25:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] hw/i386/xen/xen-hvm: Inline
 xen_piix_pci_write_config_client() and remove it
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
 <20220626094656.15673-3-shentey@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220626094656.15673-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Q1PxkKcVSV0JwRAhfkIs7bGQPt9tcQI6Dihg/POxP+3m9dAxwZ0
 kuiWGcSTUKccHgZl8D6YPiombR7PH7svnSi1AjlNLlCksLIAQZaGXPJpcJzgKc78LgOAzHj
 Vs/N8c2MM4la9gOHuJtzdIu6HRb2IhC3HTQyMQrlLor/o50XAbs83ctVzepXdtsjX43CXuw
 UIUFGD3LuOGfsuLbXRWkA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:b9M81z/HEM0=:ATHY/GaB03ozWEEHVeO/lH
 4fJgJaYElZq/zVaPvc5H7pA908C6Hc+nqiPEFJg6WeuGZkrBbklbqF8K+42lzDz3jrIimCFSW
 x+zasNqYuX8ZFtcgFFF8TU7od7JIztxbjjJZpb35ElXxDPUPPqCiDxzj0Zge5EV4uGtNO2G1v
 yHFjWBLzLKI58twG5YWU8J+KWLT1qyq7Jk2DNSxXcv8/nTE8r3MxWcrJxa9LGy/05Fm+tK7hU
 TgSMLe977OaKikEq3QF/I/WpcJsne/AIfGJY09McLvD7vaRCGI1GY7ceCGitysKd3nnHu62pz
 /1b9zgo64uuNrwcXcwDIXXAoMeKsHNIshCYgs7EWy9Ycx1MZo2gcSzAyHPIiNEtodA96lzx84
 2TuWhXMLnACZl/RJegUIbF8PO9hyKlm49dfFdlI03xK4OWNVx+8vSe+Zl/mlatz7wF82MxlBk
 WStlLnv138H4/zWWZjX8gjRW3IBAAJ4M7RuBd8tF8wbKAkP1ZZ/QhHeeY6XqrpRiEoafnmlBr
 /Tkz89ubuk68LAZm72k5QeQUX9xvANUnB7/Ac8wcR2ju7GOY2mLqppbdUikP7qwz5uhV8pFsP
 klvZ0Nfrea5Rfc/5VyjO9nh5IfGNosFUKhjmQiXW7LOAWbVF06OgUNKAecuj0lFRkGk/H0nHJ
 QrzQrY2DPXQNBbR5Ltf000yAHM7gKDNbRR6YYAb9G2Jqe9DjFl/bvY20B6G3nwiJuF+EcIKFC
 7ht9JEz7T5n9f1rvGB5UZXvgicvPiK7Yv6K/wA==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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
> xen_piix_pci_write_config_client() is implemented in the xen sub tree and
> uses PIIX constants internally, thus creating a direct dependency on
> PIIX. Now that xen_set_pci_link_route() is stubbable, the logic of
> xen_piix_pci_write_config_client() can be moved to PIIX which resolves
> the dependency.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/xen/xen-hvm.c | 18 ------------------
>   hw/isa/piix3.c        | 15 ++++++++++++++-
>   include/hw/xen/xen.h  |  1 -
>   stubs/xen-hw-stub.c   |  4 ----
>   4 files changed, 14 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index 204fda7949..e4293d6d66 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -15,7 +15,6 @@
>   #include "hw/pci/pci.h"
>   #include "hw/pci/pci_host.h"
>   #include "hw/i386/pc.h"
> -#include "hw/southbridge/piix.h"
>   #include "hw/irq.h"
>   #include "hw/hw.h"
>   #include "hw/i386/apic-msidef.h"
> @@ -149,23 +148,6 @@ void xen_piix3_set_irq(void *opaque, int irq_num, int level)
>                              irq_num & 3, level);
>   }
>   
> -void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len)
> -{
> -    int i;
> -
> -    /* Scan for updates to PCI link routes (0x60-0x63). */
> -    for (i = 0; i < len; i++) {
> -        uint8_t v = (val >> (8 * i)) & 0xff;
> -        if (v & 0x80) {
> -            v = 0;
> -        }
> -        v &= 0xf;
> -        if (((address + i) >= PIIX_PIRQCA) && ((address + i) <= PIIX_PIRQCD)) {
> -            xen_set_pci_link_route(address + i - PIIX_PIRQCA, v);
> -        }
> -    }
> -}
> -
>   int xen_set_pci_link_route(uint8_t link, uint8_t irq)
>   {
>       return xendevicemodel_set_pci_link_route(xen_dmod, xen_domid, link, irq);
> diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
> index 6388558f92..48f9ab1096 100644
> --- a/hw/isa/piix3.c
> +++ b/hw/isa/piix3.c
> @@ -138,7 +138,20 @@ static void piix3_write_config(PCIDevice *dev,
>   static void piix3_write_config_xen(PCIDevice *dev,
>                                      uint32_t address, uint32_t val, int len)
>   {
> -    xen_piix_pci_write_config_client(address, val, len);
> +    int i;
> +
> +    /* Scan for updates to PCI link routes (0x60-0x63). */
> +    for (i = 0; i < len; i++) {
> +        uint8_t v = (val >> (8 * i)) & 0xff;
> +        if (v & 0x80) {
> +            v = 0;
> +        }
> +        v &= 0xf;
> +        if (((address + i) >= PIIX_PIRQCA) && ((address + i) <= PIIX_PIRQCD)) {
> +            xen_set_pci_link_route(address + i - PIIX_PIRQCA, v);
> +        }
> +    }
> +
>       piix3_write_config(dev, address, val, len);
>   }
>   
> diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
> index 13bffaef53..afdf9c436a 100644
> --- a/include/hw/xen/xen.h
> +++ b/include/hw/xen/xen.h
> @@ -23,7 +23,6 @@ extern bool xen_domid_restrict;
>   int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
>   int xen_set_pci_link_route(uint8_t link, uint8_t irq);
>   void xen_piix3_set_irq(void *opaque, int irq_num, int level);
> -void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len);
>   void xen_hvm_inject_msi(uint64_t addr, uint32_t data);
>   int xen_is_pirq_msi(uint32_t msi_data);
>   
> diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
> index 743967623f..34a22f2ad7 100644
> --- a/stubs/xen-hw-stub.c
> +++ b/stubs/xen-hw-stub.c
> @@ -19,10 +19,6 @@ void xen_piix3_set_irq(void *opaque, int irq_num, int level)
>   {
>   }
>   
> -void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len)
> -{
> -}
> -
>   int xen_set_pci_link_route(uint8_t link, uint8_t irq)
>   {
>       return -1;

Applied to my trivial-patches branch.

Thanks,
Laurent


