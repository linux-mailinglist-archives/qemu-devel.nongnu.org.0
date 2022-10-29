Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC0361215F
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 10:23:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooh6q-0003Th-5C; Sat, 29 Oct 2022 04:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ooh6j-0003TD-St; Sat, 29 Oct 2022 04:22:24 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ooh6i-0002VJ-9w; Sat, 29 Oct 2022 04:22:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ApO8daypEKP+UTl4rxGdjOMMAFdfHUQpM1POv2UWu0I=; b=a0K4Fs0+qMmf2k/23QobpvrFKS
 PaTQ20KRzwGC2u/lpC5JF3lB+QslUWDET+NM31bYLpYEQkuJ0eW5Bq55b95QbD6imtv7XB840UGqk
 S4CmZiwF4fkYVjRiDkoEXq09zPwDK0YgufgfIjYZWKcW0io8pdly9vjNZMVMW24cjbBR66RL8Ic4O
 yD6v7VK/NpBv7XvIGkxXsyXEXAxELzCkWzrIgDXjLGtClXakiXIvpchUGoVPPFn1mHG5KCLqY79Fv
 0fKPcgJCgzTJqT/gqoorqlsTO70EXEfCYb3mI9sdT3x5MRzpMQ9IrUO4GE6vXaNTY/QkKD5Y/0H86
 eKgpMPp89vXCLKI2AKg0Zt53PKmlLdbPijrt6nmMga39TcjkLQnRO1ILd4X3h0FnILIGdM4KFW0yn
 pOuwi3qN9GKGdie8bwX5I/GfFI8TlBejGAdCjPje3CKx6LAIv5uGbjx3ZNuK1xM+yZgv5lgXXNnuY
 Rxb/XMkk9CHWshG1oB/5NVpOUr8PAXeLmXURRrRuP64mUohvrKymNGAPSooD6AxH+P+snMUhmWv3/
 HFuHv03AdtzdwNSfz1AJIIXsrLgZGU2ctl0kIZwbfK2/8Fv6o7HjDvku4rd/kESWrnsWS+A5jgJBS
 nbTFD+4lxY84KABl0gLfjiEuHzZhYGZ1/TNL6mHcQ=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ooh6c-0004yT-AY; Sat, 29 Oct 2022 09:22:14 +0100
Message-ID: <0be174ad-2086-2a55-4025-860785b1d441@ilande.co.uk>
Date: Sat, 29 Oct 2022 09:22:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <cover.1666715145.git.balaton@eik.bme.hu>
 <915b28547446c1fad749fbab2943b13e3a0d856b.1666733213.git.balaton@eik.bme.hu>
 <d3bdb406-70d3-d60d-b481-7d88736a2e4b@ilande.co.uk>
 <24e4cba4-2f68-73a2-55d2-2dc5c0cba14e@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <24e4cba4-2f68-73a2-55d2-2dc5c0cba14e@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v5 20/20] mac_{old, new}world: Pass MacOS VGA NDRV in card
 ROM instead of fw_cfg
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/10/2022 13:32, BALATON Zoltan wrote:

> On Fri, 28 Oct 2022, Mark Cave-Ayland wrote:
>> On 25/10/2022 22:31, BALATON Zoltan wrote:
>>> OpenBIOS cannot run FCode ROMs yet but it can detect NDRV in VGA card
>>> ROM and add it to the device tree for MacOS. Pass the NDRV this way
>>> instead of via fw_cfg. This solves the problem with OpenBIOS also
>>> adding the NDRV to ati-vga which it does not work with. This does not
>>> need any changes to OpenBIOS as this NDRV ROM handling is already
>>> there but this patch also allows simplifying OpenBIOS later to remove
>>> the fw_cfg ndrv handling from the vga FCode and also drop the
>>> vga-ndrv? option which is not needed any more as users can disable the
>>> ndrv with -device VGA,romfile="" (or override it with their own NDRV
>>> or ROM). Once FCode support is implemented in OpenBIOS, the proper
>>> FCode ROM can be set the same way so this paves the way to remove some
>>> hacks.
>>
>> This is not correct though: in a real option ROM the NDRV is included as part of 
>> the ROM payload and is not a standalone file. The IEEE-1275 PCI specification gives 
>> the correct format for an option ROM which at minimum contains a header, and likely 
>> some additional FCode.
> 
> As the commit message says that does not work with OpenBIOS at the moment but passing 
> the NDRV does. That it's not how real hardware works is not an argument after all 
> real hardware does not have fw_cfg either and this way is much simpler than fw_cfg, 
> it fixes the problem with ati-vga and it can be changed later to pass the real FCode 
> ROM the same way so I think it's a better way to handle this now as what we have 
> currently.

Right, passing the NDRV directly only happens to work because Ben's original hack is 
still in OpenBIOS. The longer term aim is to move towards the IEEE-1275 PCI 
specification: I can't see how switching from one custom mechanism to a different 
custom mechanism benefits anything here.

The problem you're actually trying to solve is that the ati-vga device should not be 
picking up the NDRV, so that's where the focus should be.

>> Isn't the immediate problem here that the NDRV handling in OpenBIOS needs to be 
>> improved so that it can be disabled for particular VGA devices such as ATI?
> 
> No change is needed to OpenBIOS (I've discussed it more in the reply to Howard on the 
> list yesterday). With this patch only VGA device will have qemu_vga.ndrv so OpenBIOS 
> won't add it for ati-vga. Also the fw_cfg and vga_ndrv? stuff can be removed from 
> OpenBIOS after this patch as it's not nedeed any more thus simplifying the vga.fs 
> FCode in OpenBIOS a lot.

The vga-ndrv? option was added for a reason though: the NDRV doesn't (yet?) work with 
KVM-PR on real Mac hardware, so to run MacOS on KVM you need a separate mechanism to 
disable the NDRV. This becomes more important when OpenBIOS gets to the stage where 
the FCode can create the DT nodes itself.

Also if we do decide to change this, it would be a compatibility break for a lot of 
existing documentation and examples: this is something we could manage going forward, 
but it needs some planning and isn't something we should be doing a few days before 
freeze.


ATB,

Mark.

