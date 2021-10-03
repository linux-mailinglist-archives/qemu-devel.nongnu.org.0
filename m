Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F134202AC
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 18:27:25 +0200 (CEST)
Received: from localhost ([::1]:43010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX4Kh-00010I-N8
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 12:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mX4Hl-0007lA-6F
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 12:24:21 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:38075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mX4Hj-0000eZ-2T
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 12:24:20 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 0E7655C00E1;
 Sun,  3 Oct 2021 12:24:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Sun, 03 Oct 2021 12:24:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=+
 2MuI1w+r32N5GhndEK13uT5ZxiFP/H06X7FLIntseM=; b=JRGvJy2dg7fc04Yqi
 g7cPaYmAo+e/jyaNloXmHhp6Xzpv/4idotgn+esGDE4IRG0lIsdu9yeumdIt0K+Y
 EKNTwEmdZgXshAPxtSBKe+D84uX86gCIYIJ62+C3OUc1OAZBpm/JQ2oUqiL+fl2A
 3FbwUFUZFJ2BDenv4IY+22ixuMxuH01muNMUrw6X+C1K/Gt3v82GOB/ukn3ATYj+
 zGPLba2J+w1C0sbTs5X3G9CqyxhdrM2/rhj1Ds2GBTVc7QTWqtvH48CdzyCfpacm
 BCtOyTQP8nE9M9iqvvg9LM61/3tiI49o+8nf0O1iVO39kQP6jCQeCV2Lkv+ZBgSS
 26P3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=+2MuI1w+r32N5GhndEK13uT5ZxiFP/H06X7FLInts
 eM=; b=XoM1MNdTQdgCFMDgVZXoRQJK8ARr1UXqpR8rigKY4mrZyW+AuzQzMIeK0
 OQdSiBrBJcS3FJwG1gyuLtueMNnL9LnpniW6sTtzcw0x90RVthkcbRw/JHVTd+1w
 61IoowJ1i+WYXcICELPV99M6FUiti5cNevthLIpHHcjIxpBXz+Yk3dytaBOa+vWj
 CZsb8PzEnEVPGwoiRYv/cty1qR3l4k78JDpyAcZqsM5r26MbAuWjwTyqgoXPczDr
 rrXGlm7fTRBemGhxBl9BBIe4HE8N5mWv5l1Ja2xUmjNSE2/KNVlikwMnKGAu7yeo
 r19JFQgnQkW9iWAuxWHyiMHHg0pig==
X-ME-Sender: <xms:MdlZYcD4cflQcgE3J7e8kuP4PymUp6ASNAJmVl1QmnSFPZl7wbPJpw>
 <xme:MdlZYeiF-bPAI7IXWy2joHv_R53rUWFdCMJ612SndIMuZPqJi3ORBHVw0n5vH9Fmm
 z7qHXcKFaNMBywQjJg>
X-ME-Received: <xmr:MdlZYfnLzGhOR86wr3GcK3wr85F8pq-nj1-97Q5dRp5S3llXM8vAPh3XwrYmtmE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeltddgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkfffgggfuffvfhfhjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeehieduvdevhfekjeeftddtkeeitefhudekvdeiueeulefgleei
 jeeghedvkeduleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:MdlZYSz749rseBX8O0OdtB3IHtFqOkDnE3DhUXziDgDLw9ErYJSpZg>
 <xmx:MdlZYRQ-j_c3bjgrvSy7oyk5S3kDlbORze140MOkOm5XEdFVKN502A>
 <xmx:MdlZYdYCGi30TMmbI27lDWP6vJIEUUq4RlkBDdYfIS4VzwTt_M3AEA>
 <xmx:MtlZYTetszBr3FUBcqUBirWm94j5jfLuHHEOWMj0JmH7vbK9f5lEDw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 3 Oct 2021 12:24:17 -0400 (EDT)
Message-ID: <3d71a722-e342-e0e4-7296-4cd72f3ceed2@flygoat.com>
Date: Sun, 3 Oct 2021 17:24:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI
 interrupts
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <20211003161629.614BA745953@zero.eik.bme.hu>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20211003161629.614BA745953@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=jiaxun.yang@flygoat.com;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Philippe M-D <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/10/3 17:12, BALATON Zoltan 写道:
> This device is part of a sperio/ISA bridge chip and IRQs from it are
> routed to an ISA interrupt set by the Interrupt Line PCI config
> register. Change uhci_update_irq() to allow this and use it from
> vt82c686-uhci-pci.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Just double checked kernel of fuloong2e which uses this bridge chip and
it's supposed to route UHCI IRQ to i8259.

Thanks.
- Jiaxun

> ---
> Maybe bit of a hack but fixes USB interrupts on pegasos2 until
> somebody has a better idea. I'm not sure about fuloong2e but the
> VT82C686B docs say it also does the same routing IRQs to ISA PIC like
> VT8231 used on pegasos2.
>
>   hw/usb/hcd-uhci.c          | 12 +++++++++---
>   hw/usb/hcd-uhci.h          |  1 +
>   hw/usb/vt82c686-uhci-pci.c |  1 +
>   3 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
> index 0cb02a6432..8f28241f70 100644
> --- a/hw/usb/hcd-uhci.c
> +++ b/hw/usb/hcd-uhci.c
> @@ -31,6 +31,7 @@
>   #include "hw/usb/uhci-regs.h"
>   #include "migration/vmstate.h"
>   #include "hw/pci/pci.h"
> +#include "hw/irq.h"
>   #include "hw/qdev-properties.h"
>   #include "qapi/error.h"
>   #include "qemu/timer.h"
> @@ -290,7 +291,7 @@ static UHCIAsync *uhci_async_find_td(UHCIState *s, uint32_t td_addr)
>   
>   static void uhci_update_irq(UHCIState *s)
>   {
> -    int level;
> +    int level = 0;
>       if (((s->status2 & 1) && (s->intr & (1 << 2))) ||
>           ((s->status2 & 2) && (s->intr & (1 << 3))) ||
>           ((s->status & UHCI_STS_USBERR) && (s->intr & (1 << 0))) ||
> @@ -298,10 +299,15 @@ static void uhci_update_irq(UHCIState *s)
>           (s->status & UHCI_STS_HSERR) ||
>           (s->status & UHCI_STS_HCPERR)) {
>           level = 1;
> +    }
> +    if (s->isa_irqs) {
> +        uint8_t irq = pci_get_byte(s->dev.config + PCI_INTERRUPT_LINE);
> +        if (irq < ISA_NUM_IRQS) {
> +            qemu_set_irq(isa_get_irq(NULL, irq), level);
> +        }
>       } else {
> -        level = 0;
> +        pci_set_irq(&s->dev, level);
>       }
> -    pci_set_irq(&s->dev, level);
>   }
>   
>   static void uhci_reset(DeviceState *dev)
> diff --git a/hw/usb/hcd-uhci.h b/hw/usb/hcd-uhci.h
> index e61d8fcb19..c91805a65e 100644
> --- a/hw/usb/hcd-uhci.h
> +++ b/hw/usb/hcd-uhci.h
> @@ -59,6 +59,7 @@ typedef struct UHCIState {
>       uint32_t frame_bytes;
>       uint32_t frame_bandwidth;
>       bool completions_only;
> +    bool isa_irqs;
>       UHCIPort ports[NB_PORTS];
>   
>       /* Interrupts that should be raised at the end of the current frame.  */
> diff --git a/hw/usb/vt82c686-uhci-pci.c b/hw/usb/vt82c686-uhci-pci.c
> index b109c21603..5c79e293ef 100644
> --- a/hw/usb/vt82c686-uhci-pci.c
> +++ b/hw/usb/vt82c686-uhci-pci.c
> @@ -13,6 +13,7 @@ static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
>       /* USB legacy support  */
>       pci_set_long(pci_conf + 0xc0, 0x00002000);
>   
> +    s->isa_irqs = true;
>       usb_uhci_common_realize(dev, errp);
>   }
>   


