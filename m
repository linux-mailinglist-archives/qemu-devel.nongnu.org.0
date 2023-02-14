Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C81A696E07
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 20:40:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS19z-0007Fb-Tr; Tue, 14 Feb 2023 14:40:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pS19u-0007FO-0w
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:40:10 -0500
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pS19s-0003p8-6v
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:40:09 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 8555862864;
 Tue, 14 Feb 2023 22:40:01 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6407::1:7] (unknown
 [2a02:6b8:b081:6407::1:7])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 vdpti20RX0U1-dMxB94eu; Tue, 14 Feb 2023 22:40:00 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676403600; bh=TDQ9wcnCUn1g+r8d5fsJPHPwoUB8U2QznuzcqXNPSmI=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=j9snw4MGuJfOsb+aYz8jAY3oeTFRQ++CQosclDnWfyDChomoPFVbazTN2TXLM53av
 U6T6ozX+yB67vsQmBQrqvolp4h3/SgzvTu22FzZk+aSG8U2X2wsZI2i2U6lEbaVQxX
 KBcri7KEWmSSXsEIusIqPgtCaWagSBhHVUdJbYWU=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <c932d08a-93e5-ece5-addd-126a46a5c71f@yandex-team.ru>
Date: Tue, 14 Feb 2023 21:39:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 08/16] pcie_regs: drop duplicated indicator value macros
Content-Language: en-US, ru-RU
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, den-plotnikov@yandex-team.ru
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-9-vsementsov@yandex-team.ru>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <20230213140103.1518173-9-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 13/02/2023 16:00, Vladimir Sementsov-Ogievskiy wrote:
> We already have indicator values in
> include/standard-headers/linux/pci_regs.h , no reason to reinvent them
> in include/hw/pci/pcie_regs.h. (and we already have usage of
> PCI_EXP_SLTCTL_PWR_IND_BLINK and PCI_EXP_SLTCTL_PWR_IND_OFF in
> hw/pci/pcie.c, so let's be consistent)
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>
> ---
>   include/hw/pci/pcie_regs.h |  9 ---------
>   hw/pci/pcie.c              | 13 +++++++------
>   2 files changed, 7 insertions(+), 15 deletions(-)
>
> diff --git a/include/hw/pci/pcie_regs.h b/include/hw/pci/pcie_regs.h
> index 963dc2e170..00b595a82e 100644
> --- a/include/hw/pci/pcie_regs.h
> +++ b/include/hw/pci/pcie_regs.h
> @@ -70,15 +70,6 @@ typedef enum PCIExpLinkWidth {
>   #define PCI_EXP_SLTCTL_IND_ON           0x1
>   #define PCI_EXP_SLTCTL_IND_BLINK        0x2
>   #define PCI_EXP_SLTCTL_IND_OFF          0x3
> -#define PCI_EXP_SLTCTL_AIC_SHIFT        ctz32(PCI_EXP_SLTCTL_AIC)
> -#define PCI_EXP_SLTCTL_AIC_OFF                          \
> -    (PCI_EXP_SLTCTL_IND_OFF << PCI_EXP_SLTCTL_AIC_SHIFT)
> -
> -#define PCI_EXP_SLTCTL_PIC_SHIFT        ctz32(PCI_EXP_SLTCTL_PIC)
> -#define PCI_EXP_SLTCTL_PIC_OFF                          \
> -    (PCI_EXP_SLTCTL_IND_OFF << PCI_EXP_SLTCTL_PIC_SHIFT)
> -#define PCI_EXP_SLTCTL_PIC_ON                          \
> -    (PCI_EXP_SLTCTL_IND_ON << PCI_EXP_SLTCTL_PIC_SHIFT)
>   
>   #define PCI_EXP_SLTCTL_SUPPORTED        \
>               (PCI_EXP_SLTCTL_ABPE |      \
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index 82ef723983..ccdb2377e1 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -634,8 +634,8 @@ void pcie_cap_slot_init(PCIDevice *dev, PCIESlot *s)
>                                    PCI_EXP_SLTCTL_PIC |
>                                    PCI_EXP_SLTCTL_AIC);
>       pci_word_test_and_set_mask(dev->config + pos + PCI_EXP_SLTCTL,
> -                               PCI_EXP_SLTCTL_PIC_OFF |
> -                               PCI_EXP_SLTCTL_AIC_OFF);
> +                               PCI_EXP_SLTCTL_PWR_IND_OFF |
> +                               PCI_EXP_SLTCTL_ATTN_IND_OFF);
>       pci_word_test_and_set_mask(dev->wmask + pos + PCI_EXP_SLTCTL,
>                                  PCI_EXP_SLTCTL_PIC |
>                                  PCI_EXP_SLTCTL_AIC |
> @@ -679,7 +679,7 @@ void pcie_cap_slot_reset(PCIDevice *dev)
>                                    PCI_EXP_SLTCTL_PDCE |
>                                    PCI_EXP_SLTCTL_ABPE);
>       pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTCTL,
> -                               PCI_EXP_SLTCTL_AIC_OFF);
> +                               PCI_EXP_SLTCTL_ATTN_IND_OFF);
>   
>       if (dev->cap_present & QEMU_PCIE_SLTCAP_PCP) {
>           /* Downstream ports enforce device number 0. */
> @@ -694,7 +694,8 @@ void pcie_cap_slot_reset(PCIDevice *dev)
>                                          PCI_EXP_SLTCTL_PCC);
>           }
>   
> -        pic = populated ? PCI_EXP_SLTCTL_PIC_ON : PCI_EXP_SLTCTL_PIC_OFF;
> +        pic = populated ?
> +                PCI_EXP_SLTCTL_PWR_IND_ON : PCI_EXP_SLTCTL_PWR_IND_OFF;
>           pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTCTL, pic);
>       }
>   
> @@ -770,9 +771,9 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
>        * control of powered off slots before powering them on.
>        */
>       if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
> -        (val & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PIC_OFF &&
> +        (val & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF &&
>           (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
> -        (old_slt_ctl & PCI_EXP_SLTCTL_PIC) != PCI_EXP_SLTCTL_PIC_OFF)) {
> +        (old_slt_ctl & PCI_EXP_SLTCTL_PIC) != PCI_EXP_SLTCTL_PWR_IND_OFF)) {
>           pcie_cap_slot_do_unplug(dev);
>       }
>       pcie_cap_update_power(dev);

