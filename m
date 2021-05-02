Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 805FD370B15
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 12:19:11 +0200 (CEST)
Received: from localhost ([::1]:47312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ld9Bu-0007Ty-2Y
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 06:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ld97y-0006d2-Pi; Sun, 02 May 2021 06:15:06 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43366
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ld97w-0002LH-OC; Sun, 02 May 2021 06:15:06 -0400
Received: from host109-146-177-131.range109-146.btcentralplus.com
 ([109.146.177.131] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ld97y-0001iU-AV; Sun, 02 May 2021 11:15:09 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210428125104.358535-1-philmd@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <98dbbded-8705-8bc9-3ebb-dbfff0fdc1af@ilande.co.uk>
Date: Sun, 2 May 2021 11:14:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210428125104.358535-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.146.177.131
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 0/8] hw/block/fdc: Allow Kconfig-selecting ISA
 bus/SysBus floppy controllers
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Miroslav Rezanina <mrezanin@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/04/2021 13:50, Philippe Mathieu-Daudé wrote:

> Hi,
> 
> The floppy disc controllers pulls in irrelevant devices (sysbus in
> an ISA-only machine, ISA bus + isa devices on a sysbus-only machine).
> 
> This series clean that by extracting each device in its own file,
> adding the corresponding Kconfig symbols: FDC_ISA and FDC_SYSBUS.
> 
> Since v1:
> - added missing "hw/block/block.h" header (jsnow)
> - inlined hardware specific calls (Mark)
> - added R-b/A-b tags
> 
> Missing review: 5-8 (1-4 can be queued meanwhile)
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (8):
>    hw/block/fdc: Replace disabled fprintf() by trace event
>    hw/block/fdc: Declare shared prototypes in fdc-internal.h
>    hw/block/fdc: Extract ISA floppy controllers to fdc-isa.c
>    hw/block/fdc: Extract SysBus floppy controllers to fdc-sysbus.c
>    hw/block/fdc: Add sysbus_fdc_init_drives() method
>    hw/sparc/sun4m: Inline sun4m_fdctrl_init()
>    hw/block/fdc-sysbus: Add 'dma-channel' property
>    hw/mips/jazz: Inline fdctrl_init_sysbus()
> 
>   hw/block/fdc-internal.h | 156 +++++++++++
>   include/hw/block/fdc.h  |   7 +-
>   hw/block/fdc-isa.c      | 313 +++++++++++++++++++++
>   hw/block/fdc-sysbus.c   | 224 +++++++++++++++
>   hw/block/fdc.c          | 608 +---------------------------------------
>   hw/mips/jazz.c          |  16 ++
>   hw/sparc/sun4m.c        |  16 ++
>   MAINTAINERS             |   3 +
>   hw/block/Kconfig        |   8 +
>   hw/block/meson.build    |   2 +
>   hw/block/trace-events   |   3 +
>   hw/i386/Kconfig         |   2 +-
>   hw/isa/Kconfig          |   6 +-
>   hw/mips/Kconfig         |   2 +-
>   hw/sparc/Kconfig        |   2 +-
>   hw/sparc64/Kconfig      |   2 +-
>   16 files changed, 758 insertions(+), 612 deletions(-)
>   create mode 100644 hw/block/fdc-internal.h
>   create mode 100644 hw/block/fdc-isa.c
>   create mode 100644 hw/block/fdc-sysbus.c

Thanks Phil, this version looks good to me. One day in the future it would be 
interesting to see about removing sysbus_fdc_init_drives() completely but given there 
is a similar pattern for IDE with ide_create_drive() then I'd say this patchset is 
definitely an improvement.

For the series:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

