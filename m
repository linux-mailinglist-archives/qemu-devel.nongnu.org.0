Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FD92F41BF
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 03:27:57 +0100 (CET)
Received: from localhost ([::1]:35730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzVt6-0001RQ-O1
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 21:27:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kzVrc-0000mn-W4
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 21:26:25 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:53171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kzVrb-00030o-52
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 21:26:24 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 74A2D5806B5;
 Tue, 12 Jan 2021 21:26:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 12 Jan 2021 21:26:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=d
 4veko/4Brntfvq/loM1rFFuIGUL/qiQ6EjVvPauuKk=; b=GeBN6KorJpTpeiVfP
 2z+tXGfffsy1Qlj362Gtgx3mLO5s1H6IstapjVTxjlEC+A1clQl6QFzPLcr18/M7
 ZUNdIufS7D31QQb8ECNIlm+EYt4HAKsLDxjyo+9VoyJVpY5BZIe3GN3LJPiUnOV5
 EPhkSurDDmuxtGquDysUFHGg+dvPFwEN+k+IPZ5KBsiZEB90qAkgVw//Y1fifjuP
 cvlCD0beFJe7hAmEV+Fq7LtXM2O9T5nY1yEvSKMVnAznZTpKDmbRWF3Ft/yTq5ht
 36qN1VUZMdMYbsFNl6qRsAia4zVDW5rnR/p5ixPOrZo5H1aNlizuLIeub+rIdyS/
 vMVMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=d4veko/4Brntfvq/loM1rFFuIGUL/qiQ6EjVvPauu
 Kk=; b=AZDNTLhPej9AJX+bufML6kX5kVGkpEkk4/2KFnyhSFDSX2cZamuLu21rc
 bKWPAL+i7pC6VBVUXpcNY2Gax8eRFHoZpZ9D//hPkrBu2FHd90C5MDQb0Ta9IPEw
 YXmqQ3BdicrQLx2d+CCN5b82lAZ7yhAViSfQDnM0nkRvHb+CPG+xhrt0uq1DqbPE
 dibaNvsUVhSTf0kG0pl+2PQQgzoAP+oCohV2Mb/gWTQo7jPV40WFF9OsXDSysR9+
 IziPkHajU3a6PCl4pL6gRzb6CsH2fs35zTetKrTM6Me+8f0BDzECi7UfD66A6qa7
 IY77gkWlEyQa2IH/qI8dpIT4BaXfQ==
X-ME-Sender: <xms:Tlr-X3pDg-TxBySpEnamb1wEuh0k2rbdunseseH6MoX1XGq3Ae4S4g>
 <xme:Tlr-Xxpz8YKPHCv5rWTCiT5huMI5fShyNUac2kjyZ_Kpc3er6MA16wHK4O-oyLyxG
 Yl6GXYL47ajSmLk5AE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugdegjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
 ueegveefgfefnecukfhppeeghedrfeefrdehtddrvdehgeenucevlhhushhtvghrufhiii
 gvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
 ghhorghtrdgtohhm
X-ME-Proxy: <xmx:Tlr-X0O2j002uYgueG12kWC6YKLRyELvYCoZGN1cGrpgm_cPxNMYmw>
 <xmx:Tlr-X644mIjVu28IaLeKqu2xxTDuLYozzBDjcSxUimyCqWvKC3NQVg>
 <xmx:Tlr-X246aEy8USBMyrDAWyiwLiM_hKRtXivH9g2ncZVxjq3zfTMsGg>
 <xmx:Tlr-X8RrUIX4ccE2P0HAZAublTCo4iWjCVFxu9qnZODWniqhZoXSXw>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
 by mail.messagingengine.com (Postfix) with ESMTPA id 764C81080066;
 Tue, 12 Jan 2021 21:26:20 -0500 (EST)
Subject: Re: [PATCH v2 01/13] vt82c686: Move superio memory region to
 SuperIOConfig struct
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1610223396.git.balaton@eik.bme.hu>
 <dc3c4e7632716ca73c10506bd02ee93b39c28705.1610223397.git.balaton@eik.bme.hu>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <dc0cc855-f1e8-9b48-866a-a206f5f8e44f@flygoat.com>
Date: Wed, 13 Jan 2021 10:26:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <dc3c4e7632716ca73c10506bd02ee93b39c28705.1610223397.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=66.111.4.230;
 envelope-from=jiaxun.yang@flygoat.com; helo=new4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

在 2021/1/10 上午4:16, BALATON Zoltan 写道:
> The superio memory region holds the io space index/data registers used
> to access the superio config registers that are implemented in struct
> SuperIOConfig. To keep these related things together move the memory
> region to SuperIOConfig and rename it accordingly.
> Also remove the unused "data" member of SuperIOConfig which is not
> needed as we store actual data values in the regs array.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
>   hw/isa/vt82c686.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index a6f5a0843d..30fe02f4c6 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -29,12 +29,11 @@
>   typedef struct SuperIOConfig {
>       uint8_t regs[0x100];
>       uint8_t index;
> -    uint8_t data;
> +    MemoryRegion io;
>   } SuperIOConfig;
>   
>   struct VT82C686BISAState {
>       PCIDevice dev;
> -    MemoryRegion superio;
>       SuperIOConfig superio_cfg;
>   };
>   
> @@ -128,8 +127,9 @@ static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
>   
>       trace_via_isa_write(addr, val, len);
>       pci_default_write_config(d, addr, val, len);
> -    if (addr == 0x85) {  /* enable or disable super IO configure */
> -        memory_region_set_enabled(&s->superio, val & 0x2);
> +    if (addr == 0x85) {
> +        /* BIT(1): enable or disable superio config io ports */
> +        memory_region_set_enabled(&s->superio_cfg.io, val & BIT(1));
>       }
>   }
>   
> @@ -311,15 +311,15 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
>           }
>       }
>   
> -    memory_region_init_io(&s->superio, OBJECT(d), &superio_cfg_ops,
> -                          &s->superio_cfg, "superio", 2);
> -    memory_region_set_enabled(&s->superio, false);
> +    memory_region_init_io(&s->superio_cfg.io, OBJECT(d), &superio_cfg_ops,
> +                          &s->superio_cfg, "superio_cfg", 2);
> +    memory_region_set_enabled(&s->superio_cfg.io, false);
>       /*
>        * The floppy also uses 0x3f0 and 0x3f1.
>        * But we do not emulate a floppy, so just set it here.
>        */
>       memory_region_add_subregion(isa_bus->address_space_io, 0x3f0,
> -                                &s->superio);
> +                                &s->superio_cfg.io);
>   }
>   
>   static void via_class_init(ObjectClass *klass, void *data)


