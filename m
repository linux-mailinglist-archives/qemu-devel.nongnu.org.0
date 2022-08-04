Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC3A589940
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 10:27:02 +0200 (CEST)
Received: from localhost ([::1]:46994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJWC5-0006aS-4M
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 04:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oJW4V-0001ev-CZ
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 04:19:11 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oJW4S-0002na-1i
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 04:19:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tmiy8SzJ51O+lHOMP613+3NofSFb1WzglfQbUOZEdbc=; b=egDGelS5yr2I++JLAhD3k5nvoU
 a0ES+H3/94O7q27pbUoV4B38RY4HdlNr+WqNzuDkwPBUyR1ea6F5DJ2cRdlzcOBbZ/L+I3qjazOoH
 f+62EHl+sD/pz3b4qdau8X7kyMg4SyFvweGYAg7pG2yDRTPS53tJbvhOD0FgqSQVlsDgyOm7Cx/f1
 unfp4ui5qdBixB4JsF8NlkMbcFQYER9QNXmbasBTJVZNycKC4DIwY60claAVISYopE89/qMvQrjPg
 SJvoyxc6NQBcXeC2d5TE/fu0lP++I0qDZlK5q398eAjJfiPgCAn6aREfzF7UTGqdccAocjZqdaVgx
 QVYRElAqzrPxIqw7GPAZJdu1Cdan/h2zMYMtzR7pQPMBlErhvEuQlIFbAugCykmqojcnTK/79ZaN0
 dqdWV1Yjjx9DvhsfbUHKVdlHvrLLv2hPf9ccsLOF3tA7PE+CvkBA7rSZr/8i7ogmnW77mlLZfFK6c
 Cy9s0xP3T7SIuL7F5mSLuIQ7iLoNlwOLjyTYeaPzxDQcSXIWbZS3U23gT/kQlcJ0gyKwr3z8F/WkF
 7EAypi7i9VlY+fnU4BTySxeo3g2B7Up9hiwEY/yqvzcKexmIBw9NYinTrcAcDAbQzaexAC+e1soJ9
 QqffyiZUPZYYCTHZVce9977oILSyIincxT7bxhZ0I=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oJW33-0006fF-0o; Thu, 04 Aug 2022 09:17:41 +0100
Message-ID: <4513db25-fc55-5884-f345-36d1510ff175@ilande.co.uk>
Date: Thu, 4 Aug 2022 09:19:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Elliot Nunn <elliot@nunn.io>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, BALATON Zoltan <balaton@eik.bme.hu>, hsp.cat7@gmail.com
References: <9A92120A-46B5-48A4-9424-8E606143291F@nunn.io>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <9A92120A-46B5-48A4-9424-8E606143291F@nunn.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: VGA hardware cursor query
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/08/2022 04:58, Elliot Nunn wrote:

> Dear all,
> 
> I want to give Mac OS 9 clients access to hardware cursor support, to improve
> responsiveness in absolute-cursor mode.
> 
> Would it be acceptable to add a hardware cursor interface to the VGA device?
> And if so, can anyone advise on an appropriate register layout?
> 
> This is an example of such a patch. Because it alters the Bochs VBE interface
> it is ONLY an example, NOT fit for acceptance. I have omitted the changes to
> the binary driver qemu_vga.ndrv.
> 
> Kind regards,
> 
> Elliot Nunn
> 
> ---
>   hw/display/vga.c               |  35 +++++++++++++++++++++++++++++++++
>   include/hw/display/bochs-vbe.h |   7 +++++--
>   pc-bios/qemu_vga.ndrv          | Bin 18752 -> 20944 bytes
>   3 files changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/display/vga.c b/hw/display/vga.c
> index 5dca2d1528..9b562e24e2 100644
> --- a/hw/display/vga.c
> +++ b/hw/display/vga.c
> @@ -744,6 +744,10 @@ void vbe_ioport_write_data(void *opaque, uint32_t addr, uint32_t val)
>   {
>       VGACommonState *s = opaque;
>   
> +    static size_t cursorCounter;
> +    static uint8_t cursorData[16 * 16 * 4];
> +    QEMUCursor *cursor;
> +
>       if (s->vbe_index <= VBE_DISPI_INDEX_NB) {
>           trace_vga_vbe_write(s->vbe_index, val);
>           switch(s->vbe_index) {
> @@ -796,6 +800,37 @@ void vbe_ioport_write_data(void *opaque, uint32_t addr, uint32_t val)
>               s->vbe_regs[s->vbe_index] = val;
>               vga_update_memory_access(s);
>               break;
> +
> +        case VBE_DISPI_INDEX_CURSOR_IMG:
> +            cursorData[cursorCounter++] = val >> 8;
> +            cursorData[cursorCounter++] = val;
> +            cursorCounter &= sizeof(cursorData) - 1;
> +            break;
> +
> +        case VBE_DISPI_INDEX_CURSOR_HOTSPOT:
> +            cursor = cursor_alloc(16, 16);
> +
> +            if (val == 0x8080) { // blank cursor
> +                for (int i = 0; i < 16*16; i++) {
> +                    cursor->data[i] = 0;
> +                }
> +            } else {
> +                for (int i = 0; i < 16*16; i++) {
> +                    cursor->data[i] =
> +                        ((uint32_t)cursorData[i*4] << 24) |
> +                        ((uint32_t)cursorData[i*4+1] << 16) |
> +                        ((uint32_t)cursorData[i*4+2] << 8) |
> +                        (uint32_t)cursorData[i*4+3];
> +                }
> +
> +                cursor->hot_x = (int8_t)(val >> 8);
> +                cursor->hot_y = (int8_t)val;
> +            }
> +
> +            dpy_cursor_define(s->con, cursor);
> +            cursor_put(cursor); // dealloc
> +            break;
> +
>           default:
>               break;
>           }
> diff --git a/include/hw/display/bochs-vbe.h b/include/hw/display/bochs-vbe.h
> index bc2f046eee..7de409bae7 100644
> --- a/include/hw/display/bochs-vbe.h
> +++ b/include/hw/display/bochs-vbe.h
> @@ -19,7 +19,10 @@
>   #define VBE_DISPI_INDEX_VIRT_HEIGHT     0x7
>   #define VBE_DISPI_INDEX_X_OFFSET        0x8
>   #define VBE_DISPI_INDEX_Y_OFFSET        0x9
> -#define VBE_DISPI_INDEX_NB              0xa /* size of vbe_regs[] */
> +#define VBE_DISPI_INDEX_CURSOR_IMG      0xb
> +#define VBE_DISPI_INDEX_CURSOR_HOTSPOT  0xc
> +#define VBE_DISPI_INDEX_CURSOR_ABS      0xd
> +#define VBE_DISPI_INDEX_NB              0xe /* size of vbe_regs[] */
>   #define VBE_DISPI_INDEX_VIDEO_MEMORY_64K 0xa /* read-only, not in vbe_regs */
>   
>   /* VBE_DISPI_INDEX_ID */
> @@ -54,7 +57,7 @@
>   
>   /* bochs vbe register region */
>   #define PCI_VGA_BOCHS_OFFSET  0x500
> -#define PCI_VGA_BOCHS_SIZE    (0x0b * 2)
> +#define PCI_VGA_BOCHS_SIZE    (VBE_DISPI_INDEX_NB * 2)
>   
>   /* qemu extension register region */
>   #define PCI_VGA_QEXT_OFFSET   0x600

Hi Elliot,

Nice work! Have you been in contact with the Bochs developers to see what their 
thoughts are to your proposed changes? Generally QEMU prefers to implement documented 
specifications, so this would be the best route to go.


ATB,

Mark.

