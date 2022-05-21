Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B734D52FA20
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 10:56:41 +0200 (CEST)
Received: from localhost ([::1]:34852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsKue-0001HZ-Sc
	for lists+qemu-devel@lfdr.de; Sat, 21 May 2022 04:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsKnG-0007fB-5p; Sat, 21 May 2022 04:49:02 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsKnE-00067Y-LE; Sat, 21 May 2022 04:49:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y5TCq19/3COv1+K29StwKAqRGzoA7qsUy+O/T7yyrZ4=; b=zD6/hFkjMg9x0jXZNhiLExWuVk
 Tjbi3+QKGCXbm4DFrJQ1mO4ZQ7Ysf6JWLbZ5O+3fmYVHX2Vx4hqVucOt64GdxfWy0Mp/yfIPrGfvE
 rOYQKyRDnj4/2D3SPArv1xIAknxQ9uOfmL7fdW4e5xNyNdrC7e3PVT6q5sLsP1UBkcBl1IQ+7KyfY
 V/20GD4dqOJQaiVJ77nthgBGT7b/kc5qP9XysLh/rwGcG+MBd3+SlaLaVEfJuud0T2UlxdaD7eyvV
 jidYJD+nB9z+iAJigfnTwdZir04r+aWWi46W8uNoJGjhbp9COSc1gaZjG8GLI4f/zYJM04BsDrj4e
 h61IPzpl6+LE4XZupQJvXn040syBkxlSzlrtqCzwvxiWgA6XNJj8ox42ALdiPikZRPOfdttTZujWu
 1zcX+lywpxtg7C/pcuCA87CVhLqcTtdtdKVAmHL4kRuSASVSmgzqZUYBahl1eJKWMjWnhXvH/8tkv
 kp7SSjmiMQO9MdzDG9iNVFZ2OopJKKyvrZ4i0sDbU/SbnFECzPRl5HPDYciIbgae6iXWwQjyh0FbR
 6ycjLkPRTJhv9qZ4h4WUHCrdme82xpN/DGLJXHG3IAOyt85p0XMDwuX5Xn6ZpJCNM/TOgAkeJiWgR
 ENgEYMNUGk0z+HG0BDeiZ2zeoDQfq99rfaIWTlrXA=;
Received: from host86-135-55-247.range86-135.btcentralplus.com
 ([86.135.55.247] helo=[192.168.50.176])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsKmF-000AKw-8s; Sat, 21 May 2022 09:47:59 +0100
Message-ID: <3b381726-1bf3-06b3-c989-6b0ee564b90f@ilande.co.uk>
Date: Sat, 21 May 2022 09:48:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20220513175445.89616-1-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220513175445.89616-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.135.55.247
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/6] QOM'ify PIIX southbridge creation
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

On 13/05/2022 18:54, Bernhard Beschow wrote:

> The piix3 and piix4 southbridge devices still rely on create() functions which
> are deprecated. This series resolves these functions piece by piece to
> modernize the code.
> 
> Both devices are modified in lockstep where possible to provide more context.
> 
> Testing done:
> * `qemu-system-x86_64 -M pc -m 2G -cdrom archlinux-2022.05.01-x86_64.iso`
> * `qemu-system-mipsel -M malta -kernel vmlinux-3.2.0-4-4kc-malta -hda debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 console=tty0"`
> 
> In both cases the system booted successfully and it was possible to shut down
> the system using the `poweroff` command.
> 
> Bernhard Beschow (6):
>    include/hw: Move TYPE_PIIX4_PCI_DEVICE to southbridge/piix.h
>    hw/isa/piix{3,4}: Move pci_map_irq_fn's near pci_set_irq_fn's
>    hw/isa/piix{3,4}: QOM'ify PCI device creation and wiring
>    hw/isa/piix{3,4}: Factor out ISABus retrieval from create() functions
>    hw/isa/piix4: Factor out SM bus initialization from create() function
>    hw/isa/piix{3,4}: Inline and remove create() functions
> 
>   hw/i386/pc_piix.c             |  7 ++-
>   hw/isa/piix3.c                | 98 +++++++++++++++++++----------------
>   hw/isa/piix4.c                | 91 +++++++++++++-------------------
>   hw/mips/malta.c               |  9 +++-
>   include/hw/isa/isa.h          |  2 -
>   include/hw/southbridge/piix.h |  6 +--
>   6 files changed, 105 insertions(+), 108 deletions(-)

I've just reviewed these, and other than a couple of minor issues these look good to 
me and definitely help to improve the code.

One thing reading over this patches has made me realise is that there is quite a 
model violation here in that the PIIX3 and PIIX4 devices (which are the PCI-ISA 
bridges) are actually setting the PCI host bridge IRQs(!). What should happen is that 
the PCI bus IRQs and routing should be done in the PCI host bridge, and gpios used in 
the PCI-ISA bridges to pass them up. But that's definitely something outside the 
scope of these improvements.


ATB,

Mark.

