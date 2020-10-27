Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960B729BAE6
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 17:24:17 +0100 (CET)
Received: from localhost ([::1]:59442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXRlg-0004DK-Ll
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 12:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kXRj1-00023P-BA
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 12:21:31 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50472
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kXRiy-0000OX-Nb
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 12:21:30 -0400
Received: from host86-148-103-79.range86-148.btcentralplus.com
 ([86.148.103.79] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kXRj1-0001it-7G; Tue, 27 Oct 2020 16:21:35 +0000
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201026143028.3034018-1-pbonzini@redhat.com>
 <20201026143028.3034018-15-pbonzini@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <8b0444f1-760d-5e6a-54fc-3cc2ccd345ed@ilande.co.uk>
Date: Tue, 27 Oct 2020 16:21:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201026143028.3034018-15-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.148.103.79
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 14/15] sparc: remove bios_name
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.167,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/10/2020 14:30, Paolo Bonzini wrote:

> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   hw/sparc/leon3.c   | 4 +---
>   hw/sparc/sun4m.c   | 2 +-
>   hw/sparc64/sun4u.c | 2 +-
>   3 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
> index d40b7891f6..1c50b02f81 100644
> --- a/hw/sparc/leon3.c
> +++ b/hw/sparc/leon3.c
> @@ -185,6 +185,7 @@ static void leon3_set_pil_in(void *opaque, int n, int level)
>   static void leon3_generic_hw_init(MachineState *machine)
>   {
>       ram_addr_t ram_size = machine->ram_size;
> +    const char *bios_name = machine->firmware ?: LEON3_PROM_FILENAME;
>       const char *kernel_filename = machine->kernel_filename;
>       SPARCCPU *cpu;
>       CPUSPARCState   *env;
> @@ -259,9 +260,6 @@ static void leon3_generic_hw_init(MachineState *machine)
>       memory_region_add_subregion(address_space_mem, LEON3_PROM_OFFSET, prom);
>   
>       /* Load boot prom */
> -    if (bios_name == NULL) {
> -        bios_name = LEON3_PROM_FILENAME;
> -    }
>       filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
>   
>       if (filename) {
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index 38d1e0fd12..81d4ae9385 100644
> --- a/hw/sparc/sun4m.c
> +++ b/hw/sparc/sun4m.c
> @@ -878,7 +878,7 @@ static void sun4m_hw_init(const struct sun4m_hwdef *hwdef,
>                           hwdef->max_mem - machine->ram_size);
>       }
>   
> -    prom_init(hwdef->slavio_base, bios_name);
> +    prom_init(hwdef->slavio_base, machine->firmware);
>   
>       slavio_intctl = slavio_intctl_init(hwdef->intctl_base,
>                                          hwdef->intctl_base + 0x10000ULL,
> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> index 05e659c8a4..50230d261a 100644
> --- a/hw/sparc64/sun4u.c
> +++ b/hw/sparc64/sun4u.c
> @@ -578,7 +578,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
>       /* set up devices */
>       ram_init(0, machine->ram_size);
>   
> -    prom_init(hwdef->prom_addr, bios_name);
> +    prom_init(hwdef->prom_addr, machine->firmware);
>   
>       /* Init sabre (PCI host bridge) */
>       sabre = SABRE(qdev_new(TYPE_SABRE));

Looks good to me:

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

