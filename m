Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF162F2FB8
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 14:00:44 +0100 (CET)
Received: from localhost ([::1]:51410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzJHv-0008Ng-PF
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 08:00:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kzJE7-0007P8-5E
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:56:47 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:48555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kzJE2-0006Cw-CD
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:56:46 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 561045807FD;
 Tue, 12 Jan 2021 07:56:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 12 Jan 2021 07:56:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=i
 yOa4PdqfrvenJUDeNKH1BBoSg5u3DdmUxlurlpM0oA=; b=FuFSQPeSKkxZH1HfT
 4U8aH7oWlvCKEj3eQAMotPZU1+f55/jQMlBIx8Sw8VOTpvVBXcublTxD1yjK5Rfi
 edvWWACZdp2YouZ/JN8CXxKnh9gS7Kj7aEoUCwzih24sHPReGuoj8plVPcFd0dLm
 CZ6KoP0PI3h+Pfi4g45PTDyw5fe834ZrHEt+jNuTnegNB5eQNGjpKZynI6tCEl/h
 +zGjMqZ+G3PSyBouFuQmtKPERwxrzSWdJZn4Pgj4hT1T2GwepuSbFRiokFICC6ED
 geqNYWQE9kD4SBMKHKgufJflNwRx3EG+zJSei/0XzhC3Maheg7xsYSK8NHD2PFgj
 deUYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=iyOa4PdqfrvenJUDeNKH1BBoSg5u3DdmUxlurlpM0
 oA=; b=Pwcedlx/4eHACVRYniO4tRtRsxDFoOOC6z7TZibZOnA3LUGH1dlJZT3vg
 ENWYkIb+OXqNDbiopttub9T5oT/vRhGW9yDMadZUHQWIcNM84zvfA1Qc8FyaS2FB
 AZXsdYx5nBY1W2k9+tQZN5Hjbkh7ZBydqlqU90RSZ5jotOVlbd+Jr9wyBaBrOND4
 llFsFBYc/03OhZPHel5qQM1iiIsDFahZVghoKs5xOtUCPikgPWF7b6RQed8mW/AQ
 jlXHEp97r03/B2uol1F9/fw0sdApIg1JL9yLCTNIc+2S8/pSiZTswn+sZ3UjAT5G
 47/ou76DtI0G6qse6NPCvFkH+qzKg==
X-ME-Sender: <xms:h5z9X_xCFJ3Cp-Cc47HlFxSJrB9Pwwk8FsoPVL3ucx9EmEgaVbqz2A>
 <xme:h5z9X3QJFaZNuP1n_yj1kvBZXyeI8ZLysnbjZZi4DbKyUUo7eaYlIZFLUXLtFqgpK
 oGl1Lpf2cZLqrkjSok>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddtgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
 ueegveefgfefnecukfhppeeghedrfeefrdehtddrvdehgeenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
 ghhorghtrdgtohhm
X-ME-Proxy: <xmx:h5z9X5WWw-PB4IUYhL5ixmzNs39qsLmiNETI8V-CNEksmawjM4an1Q>
 <xmx:h5z9X5hn0P-Hw6GwU004cyBgLlvgd32-kq93ywXrVZnDPMkoQK05Vg>
 <xmx:h5z9XxBwMrWao16u5LclBF4KWoYAuakUtTYzcr5Q0qYxl33b-m-uQQ>
 <xmx:h5z9X-7Ng-acXC28_AHS2MrXXUHGgcE7SBIctP_4bKbGR1Le2dN8aA>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
 by mail.messagingengine.com (Postfix) with ESMTPA id 69C8E1080057;
 Tue, 12 Jan 2021 07:54:53 -0500 (EST)
Subject: Re: [PATCH v2 03/13] vt82c686: Fix SMBus IO base and configuration
 registers
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1610223396.git.balaton@eik.bme.hu>
 <f2ca2ad5f08ba8cee07afd9d67b4e75cda21db09.1610223397.git.balaton@eik.bme.hu>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <f01fb9b0-133f-325d-9d34-e97af14e3c4d@flygoat.com>
Date: Tue, 12 Jan 2021 20:54:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f2ca2ad5f08ba8cee07afd9d67b4e75cda21db09.1610223397.git.balaton@eik.bme.hu>
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
> The base address of the SMBus io ports and its enabled status is set
> by registers in the PCI config space but this was not correctly
> emulated. Instead the SMBus registers were mapped on realize to the
> base address set by a property to the address expected by fuloong2e
> firmware.
>
> Fix the base and config register handling to more closely model
> hardware which allows to remove the property and allows the guest to
> control this mapping. Do all this in reset instead of realize so it's
> correctly updated on reset.

Hi,

Thanks for your patch!

>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/isa/vt82c686.c   | 49 +++++++++++++++++++++++++++++++++------------
>   hw/mips/fuloong2e.c |  4 +---
>   2 files changed, 37 insertions(+), 16 deletions(-)
>
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index fe8961b057..9c4d153022 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -22,6 +22,7 @@
>   #include "hw/i2c/pm_smbus.h"
>   #include "qapi/error.h"
>   #include "qemu/module.h"
> +#include "qemu/range.h"
>   #include "qemu/timer.h"
>   #include "exec/address-spaces.h"
>   #include "trace.h"
> @@ -34,7 +35,6 @@ struct VT686PMState {
>       ACPIREGS ar;
>       APMState apm;
>       PMSMBus smb;
> -    uint32_t smb_io_base;
>   };
>   
>   static void pm_io_space_update(VT686PMState *s)
> @@ -50,11 +50,22 @@ static void pm_io_space_update(VT686PMState *s)
>       memory_region_transaction_commit();
>   }
>   
> +static void smb_io_space_update(VT686PMState *s)
> +{
> +    uint32_t smbase = pci_get_long(s->dev.config + 0x90) & 0xfff0UL;
> +
> +    memory_region_transaction_begin();
> +    memory_region_set_address(&s->smb.io, smbase);
> +    memory_region_set_enabled(&s->smb.io, s->dev.config[0xd2] & BIT(0));
> +    memory_region_transaction_commit();
> +}
> +
>   static int vmstate_acpi_post_load(void *opaque, int version_id)
>   {
>       VT686PMState *s = opaque;
>   
>       pm_io_space_update(s);
> +    smb_io_space_update(s);
>       return 0;
>   }
>   
> @@ -77,8 +88,18 @@ static const VMStateDescription vmstate_acpi = {
>   
>   static void pm_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int len)
>   {
> +    VT686PMState *s = VT82C686B_PM(d);
> +
>       trace_via_pm_write(addr, val, len);
>       pci_default_write_config(d, addr, val, len);
> +    if (ranges_overlap(addr, len, 0x90, 4)) {
> +        uint32_t v = pci_get_long(s->dev.config + 0x90);
> +        pci_set_long(s->dev.config + 0x90, (v & 0xfff0UL) | 1);

What does this "or 1" do?
The datasheet I found only mentioned the default value of BASE is 0000 0001
but didn't say anything about it's function :-/

> +    }
> +    if (range_covers_byte(addr, len, 0xd2)) {
> +        s->dev.config[0xd2] &= 0xf;
> +        smb_io_space_update(s);
> +    }
>   }
>   
>   static void pm_update_sci(VT686PMState *s)
> @@ -103,6 +124,17 @@ static void pm_tmr_timer(ACPIREGS *ar)
>       pm_update_sci(s);
>   }
>   
> +static void vt82c686b_pm_reset(DeviceState *d)
> +{
> +    VT686PMState *s = VT82C686B_PM(d);
> +
> +    /* SMBus IO base */
> +    pci_set_long(s->dev.config + 0x90, 1);

Theoretically this kind of magic number should be avoided but
as the rest of the file was written in such style it seems fine for me.

[...]

