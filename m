Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DEE68B1F8
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 22:37:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOmhJ-0004Zy-AB; Sun, 05 Feb 2023 16:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOmhH-0004Yy-J5; Sun, 05 Feb 2023 16:37:15 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOmhG-0006Ga-37; Sun, 05 Feb 2023 16:37:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H34XgUppVy+PLvi9Hbq+GfjDvDPXZ/7B2oI7NoF/aA4=; b=QUd6/zT8V3qvfDAGMayFJUnIKB
 mrNXqK0hoXTuJZDyrb2XG52K5S2K1FciP0wzWy5NM9fywA1agrZRckndYIoVnHYzjH2vOfGsJ3Yi0
 E3aqO/ucudfoNihVRnB2sYSI9SkwWmJgqNKlxmyhQ+jBrcGdk9dUwA3FmuHI4FU+cx0fDh/cP+DUc
 CCeqPaLLq5V1Mf6MAQYUqO4Ki+TpCVy6+oRy+KsKqWng8CXxMBAK6wSXFeEBxJ39PvS4/f7j5n2Kg
 avoMUZLJ0smf4CWo3LOZbZZKYlUq0prDMoDQxzWDHyk8QL+zo9W54MUGD4+yyEYFxrN8/gFTDA0z+
 za32ramcjA0Yji7GyvcIHvhMsQrSGTwODTVp7ZkamfyAHr7z0wPeEPpUiGAa6eRUVSjnJGYai7M8b
 DtquTqIbBRF6jeEFhqoYaTagJ8Rf3oW592BzIk+MjNuG9epDFfj9qSMSq/+uXu0YJ6xZUJZ84CAwk
 bsXoMo540gq/nsvCKTcNWoukI5X/xqrOacntbDI34uAkKGRI75G9c3FeWzvH9QezqmmebRA+3sbS9
 zxqtppfYabqwtEHT2hSyMPuFQxnsRULsJkV1+GDPTPvPmMYP64mdzDIr4AmVpqie3Z9q1idEKGWaU
 hegAr0bn+HaRMS/NUStRNQUEBX4P8tRCKJBVIj4Qc=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOmgc-0007iA-74; Sun, 05 Feb 2023 21:36:34 +0000
Message-ID: <dea7bf85-85c1-620c-9a98-4d696fa291f6@ilande.co.uk>
Date: Sun, 5 Feb 2023 21:37:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230126211740.66874-1-shentey@gmail.com>
 <20230126211740.66874-4-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230126211740.66874-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 03/10] softmmu/ioport: Remove unused functions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 26/01/2023 21:17, Bernhard Beschow wrote:

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/exec/ioport.h |  2 --
>   softmmu/ioport.c      | 24 ------------------------
>   2 files changed, 26 deletions(-)
> 
> diff --git a/include/exec/ioport.h b/include/exec/ioport.h
> index ec3e8e5942..1ef5aebba3 100644
> --- a/include/exec/ioport.h
> +++ b/include/exec/ioport.h
> @@ -67,7 +67,5 @@ void portio_list_init(PortioList *piolist, Object *owner,
>                         void *opaque, const char *name,
>                         MemoryRegion *address_space_io, uint16_t start);
>   void portio_list_set_flush_coalesced(PortioList *piolist);
> -void portio_list_destroy(PortioList *piolist);
> -void portio_list_del(PortioList *piolist);
>   
>   #endif /* IOPORT_H */
> diff --git a/softmmu/ioport.c b/softmmu/ioport.c
> index c92e3cb27d..0a55d39196 100644
> --- a/softmmu/ioport.c
> +++ b/softmmu/ioport.c
> @@ -118,19 +118,6 @@ void portio_list_set_flush_coalesced(PortioList *piolist)
>       piolist->flush_coalesced_mmio = true;
>   }
>   
> -void portio_list_destroy(PortioList *piolist)
> -{
> -    MemoryRegionPortioList *mrpio;
> -    unsigned i;
> -
> -    for (i = 0; i < piolist->nr; ++i) {
> -        mrpio = container_of(piolist->regions[i], MemoryRegionPortioList, mr);
> -        object_unparent(OBJECT(&mrpio->mr));
> -        g_free(mrpio);
> -    }
> -    g_free(piolist->regions);
> -}
> -
>   static const MemoryRegionPortio *find_portio(MemoryRegionPortioList *mrpio,
>                                                uint64_t offset, unsigned size,
>                                                bool write)
> @@ -280,14 +267,3 @@ void portio_list_init(PortioList *piolist, Object *owner,
>       /* There will always be an open sub-list.  */
>       portio_list_add_1(piolist, pio_start, count, start, off_low, off_high);
>   }
> -
> -void portio_list_del(PortioList *piolist)
> -{
> -    MemoryRegionPortioList *mrpio;
> -    unsigned i;
> -
> -    for (i = 0; i < piolist->nr; ++i) {
> -        mrpio = container_of(piolist->regions[i], MemoryRegionPortioList, mr);
> -        memory_region_del_subregion(piolist->address_space, &mrpio->mr);
> -    }
> -}

I think it may be worth leaving these functions. There were previous discussions 
around the cmd646 and via PCI-IDE interfaces which have a bit in PCI configuration 
space that switches the chip between compatibility (ISA) mode and PCI mode. I could 
see that switching the device to PCI mode would require removal of the old ISA ports, 
for example, as in PCI mode the registers would be accessed exclusively via the PCI BAR.


ATB,

Mark.

