Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B28BD6EF55F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 15:18:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prf27-0002T4-7C; Wed, 26 Apr 2023 09:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prf19-0002Pe-Oo; Wed, 26 Apr 2023 09:17:10 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prf0s-0001zj-N0; Wed, 26 Apr 2023 09:17:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=11Ufpi0eUBDv8CxcMn9Ve0/ByWeSy1eAihxh+0VxUgc=; b=fQkWbGfQY4K3hKbOOTYH0CTgJx
 Xb8ZDP0wnH+mOBEdl47yqPsGIskK9tBTOERpFnLlX9zdSiC9BTMBWtG0ct/9HiWMvojut4o+UvcQb
 QgEldhfKb2v54FH+W8glUYzAI9ZT/EWTObFa01dGuvC3tBD4R/obFNJ7XwX4RObmLhNIiaZjd+C8M
 UkLjNZR3C1EP04iglaMde671fVycuZ7Q6a1v7haIEVMXz5AzNg13/QPhMqGfVVLeh1+p7eP62Q53e
 lbBoEqKm0ouS/uBvOohmLFZ3JtwhhiGAN6r2Mke9ptiV/1km06FeoQ3WN5gds2WsBwYnZ9YepC6kE
 Wivc8kAX7X9tljwfqb4NOGjUiiQvh84gZ5KCI3S1YdBthyP4/F+gJvpWdJVBxGKjCr7wh6h2kItKS
 bwR5fMGAH0ZeS+f+KghG1u38+S5JUF6cXVl6r5BG5lWr2jklMIqsGLqqkQowMkmo52xqxkdahX7Jl
 oCyIakL34k/OFZ/fxgXG7EkikKuGHo9JIKuEBsal0uJLyvCLm4iuTu04uOkQA9tDBsOF4yAR2Silh
 pTq2g+JCLMyzF4uCs3xKMwHoazw3ObtCY9dZKG8RnHsIQXKCFfuOAJr/UkAZMo9Dzs+QG2JEGoxwU
 +A77UZMDIxP0o+vwyMMSFZJ38UGJrYW3mG1taor3I=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prezs-0002dn-KS; Wed, 26 Apr 2023 14:15:52 +0100
Message-ID: <6c83039d-84a3-0793-4265-6dcf3a72e58d@ilande.co.uk>
Date: Wed, 26 Apr 2023 14:16:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, qemu-ppc@nongnu.org
References: <20230302224058.43315-1-philmd@linaro.org>
 <20230302224058.43315-11-philmd@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230302224058.43315-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 10/18] hw/isa: Ensure isa_register_portio_list() do not
 get NULL ISA device
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 02/03/2023 22:40, Philippe Mathieu-Daudé wrote:

> Previous commit removed the single call to isa_register_portio_list()
> with dev=NULL. To be sure we won't reintroduce such weird (ab)use,
> assert dev is non-NULL.
> 
> We can now calls isa_address_space_io() to get the device I/O region.
> 
> Note we can then remove the NULL check in isa_init_ioport() because
> it is only called in 2 places (and is static to this file):
> - isa_register_ioport() which first calls isa_address_space_io(),
>    itself asserting dev is not NULL.
> - isa_register_portio_list() which also asserts dev is not NULL
>    since the previous commit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/isa/isa-bus.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
> index 081bac18ee..9c8224afa5 100644
> --- a/hw/isa/isa-bus.c
> +++ b/hw/isa/isa-bus.c
> @@ -113,7 +113,7 @@ IsaDma *isa_bus_get_dma(ISABus *bus, int nchan)
>   
>   static inline void isa_init_ioport(ISADevice *dev, uint16_t ioport)
>   {
> -    if (dev && (dev->ioport_id == 0 || ioport < dev->ioport_id)) {
> +    if (dev->ioport_id == 0 || ioport < dev->ioport_id) {
>           dev->ioport_id = ioport;
>       }
>   }
> @@ -129,6 +129,7 @@ int isa_register_portio_list(ISADevice *dev,
>                                const MemoryRegionPortio *pio_start,
>                                void *opaque, const char *name)
>   {
> +    assert(dev);
>       assert(piolist && !piolist->owner);
>   
>       if (!isabus) {

Yes!

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

